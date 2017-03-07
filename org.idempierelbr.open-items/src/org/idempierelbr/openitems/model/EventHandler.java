package org.idempierelbr.openitems.model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.adempiere.base.Service;
import org.adempiere.base.ServiceQuery;
import org.adempiere.base.event.AbstractEventHandler;
import org.adempiere.base.event.IEventTopics;
import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MInOut;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoicePaySchedule;
import org.compiere.model.MOrder;
import org.compiere.model.MPayment;
import org.compiere.model.MRMA;
import org.compiere.model.PO;
import org.compiere.process.DocAction;
import org.compiere.util.CLogger;
import org.idempierelbr.openitems.process.IBankCollection;
import org.idempierelbr.openitems.process.IBankCollectionFactory;
import org.osgi.service.event.Event;

public class EventHandler extends AbstractEventHandler {
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(EventHandler.class);

	@Override
	protected void initialize() {
		registerTableEvent(IEventTopics.PO_AFTER_NEW, MLBRBoleto.Table_Name);
		registerTableEvent(IEventTopics.PO_AFTER_CHANGE, MLBRBoleto.Table_Name);
		registerTableEvent(IEventTopics.DOC_AFTER_COMPLETE , MLBRBoleto.Table_Name);
		registerTableEvent(IEventTopics.DOC_BEFORE_COMPLETE , MLBRBoleto.Table_Name);
		registerTableEvent(IEventTopics.PO_BEFORE_NEW, MLBRBoletoDetails.Table_Name);
		registerTableEvent(IEventTopics.PO_BEFORE_NEW, MInvoice.Table_Name);
		registerTableEvent(IEventTopics.PO_BEFORE_DELETE, MLBRBoletoMovement.Table_Name);
		registerTableEvent(IEventTopics.PO_BEFORE_NEW, MAllocationLine.Table_Name);
		registerTableEvent(IEventTopics.PO_BEFORE_NEW, MPayment.Table_Name);
		registerTableEvent(IEventTopics.PO_AFTER_CHANGE, MInvoicePaySchedule.Table_Name);
		registerTableEvent(IEventTopics.DOC_BEFORE_REVERSEACCRUAL , MInvoice.Table_Name);
		registerTableEvent(IEventTopics.DOC_BEFORE_REVERSECORRECT , MInvoice.Table_Name);
		registerTableEvent(IEventTopics.DOC_BEFORE_VOID , MInvoice.Table_Name);
		registerTableEvent(IEventTopics.DOC_AFTER_COMPLETE, MAllocationHdr.Table_Name);
	}

	@Override
	protected void doHandleEvent(Event event) {
		PO po = getPO(event);
		log.info(po + " Type: " + event.getTopic());
		
		// Copy LBR fields from Order to Invoice
		if (po instanceof MInvoice && event.getTopic().equals(IEventTopics.PO_BEFORE_NEW)) {
			MInvoice invoice = (MInvoice) po;
			MOrder order = null;			
			
			if (invoice.getC_Order_ID() > 0) {
				order = new MOrder(po.getCtx(), invoice.getC_Order_ID(), po.get_TrxName());
			} else if (invoice.getM_RMA_ID() > 0) {
				MRMA rma = new MRMA(po.getCtx(), invoice.getM_RMA_ID(), po.get_TrxName());
				MInOut inOut = new MInOut(po.getCtx(), rma.getInOut_ID(), po.get_TrxName());
				order = new MOrder(po.getCtx(), inOut.getC_Order_ID(), po.get_TrxName());
			}
			
			if (order != null) {
				if (!order.get_ValueAsString("LBR_PayInstrument").equals(""))
					invoice.set_ValueOfColumn("LBR_PayInstrument", order.get_ValueAsString("LBR_PayInstrument"));
				
				if (!order.get_ValueAsString("LBR_CollectionIssueDistrib").equals(""))
					invoice.set_ValueOfColumn("LBR_CollectionIssueDistrib", order.get_ValueAsString("LBR_CollectionIssueDistrib"));
				
				if (order.get_ValueAsInt("LBR_BankAccount_ID") > 0)
					invoice.set_ValueOfColumn("LBR_BankAccount_ID", order.get_ValueAsInt("LBR_BankAccount_ID"));
			}
		}
		
		// Create default details entry
		if (po instanceof MLBRBoleto && event.getTopic().equals(IEventTopics.PO_AFTER_NEW)) {
			MLBRBoletoDetails details = new MLBRBoletoDetails(po.getCtx(), 0, po.get_TrxName());
			details.setAD_Org_ID(po.getAD_Org_ID());
			details.setLBR_Boleto_ID(po.get_ID());
			details.populateBasedOnParent();
			details.saveEx();
		}
		
		if (po instanceof MLBRBoleto && event.getTopic().equals(IEventTopics.PO_AFTER_CHANGE)) {
			MLBRBoleto boleto = (MLBRBoleto)po;

			// Only for completed boletos
			if (boleto.getDocStatus().equals(DocAction.STATUS_Completed)) {
				// alterações no abatimento
				if (po.is_ValueChanged(MLBRBoleto.COLUMNNAME_WriteOffAmt)) {
					BigDecimal newWriteOffAmt = boleto.getWriteOffAmt();
					BigDecimal oldWriteOffAmt = (BigDecimal) po.get_ValueOld(MLBRBoleto.COLUMNNAME_WriteOffAmt);
					String newMovCode;
					if (oldWriteOffAmt == null || oldWriteOffAmt.equals(BigDecimal.ZERO)) {
						// concessão
						newMovCode="04";
					} else if (newWriteOffAmt.equals(BigDecimal.ZERO)) {
						// cancelamento
						newMovCode="05";
					} else {
						// alteração
						newMovCode="18";
					}
					MLBRBoletoMovement newMov = MLBRBoletoMovement.createNewMovement(po.getCtx(), boleto, newMovCode, po.get_TrxName());
					newMov.setWriteOffAmt(newWriteOffAmt);
					newMov.saveEx();
				}
			}
			
			// Only drafted/in progress/invalid boletos
			if (boleto.getDocStatus().equals(DocAction.STATUS_Drafted) ||
					boleto.getDocStatus().equals(DocAction.STATUS_InProgress) ||
					boleto.getDocStatus().equals(DocAction.STATUS_Invalid)) {
				
				MLBRBoletoDetails[] detailsEntries = boleto.getDetails();
				
				if (detailsEntries.length > 0) {
					if (po.is_ValueChanged("C_DocType_ID")) {
						detailsEntries[0].populateBasedOnParent();
					} else {
						// populateBasedOnParent() already updates interest/penalty/discounts,
						// so only check them if C_DocType_ID value is not changed
						if (po.is_ValueChanged("DueDate")) {
							detailsEntries[0].updateInterest();
							detailsEntries[0].updateLatePaymentPenalty();
						}
						
						if (po.is_ValueChanged("C_InvoicePaySchedule_ID"))
							detailsEntries[0].updateDiscounts();
					}

					detailsEntries[0].saveEx();
				}				
			}			
		}

		// avoid completion of Boleto without a bank plugin
		if (po instanceof MLBRBoleto && event.getTopic().equals(IEventTopics.DOC_BEFORE_COMPLETE)) {
			MLBRBoleto boleto = (MLBRBoleto) getPO(event);
			String routingNo = boleto.getRoutingNo( );
			IBankCollection bankCollection = getBankCollectionInstance( routingNo );
			
			if (bankCollection == null) {
				throw new AdempiereException( "Não encontrado plugin para o banco "+routingNo );			
			}
		}

		// execute the process of the bank plugin for the Boleto document
		if (po instanceof MLBRBoleto && event.getTopic().equals(IEventTopics.DOC_AFTER_COMPLETE)) {
			MLBRBoleto boleto = (MLBRBoleto) getPO(event);
			String routingNo = boleto.getRoutingNo( );
			IBankCollection bankCollection = getBankCollectionInstance( routingNo );
			bankCollection.postProcessBoleto(boleto);
			if ( boleto.getLBR_IssueType().equals(MLBRBoleto.LBR_ISSUETYPE_2_ClienteEmite)) {
				boleto.genBarcode( bankCollection.getCampoLivre( boleto ) );
			}
			boleto.saveEx();
		}
		
		// Check if there are maximum of 1 entries in the Details Tab
		if (po instanceof MLBRBoletoDetails && event.getTopic().equals(IEventTopics.PO_BEFORE_NEW)) {
			int LBR_Boleto_ID = ((MLBRBoletoDetails)po).getLBR_Boleto_ID();
			MLBRBoleto boleto = new MLBRBoleto(po.getCtx(), LBR_Boleto_ID, po.get_TrxName());
			
			MLBRBoletoDetails[] details = boleto.getDetails();
			if (details.length >= 1)
				addErrorMessage(event, "Limite de 1 registro por boleto");
		}
		
		// Don't let delete movements with generated file
		if (po instanceof MLBRBoletoMovement && event.getTopic().equals(IEventTopics.PO_BEFORE_DELETE)) {
			MLBRBoletoMovement mov = (MLBRBoletoMovement)po;
			
			if (mov.getLBR_FileGeneratingDate() != null)
				addErrorMessage(event, "Não é possível excluir movimento anteriormente salvo em arquivo");
		}
		
		// change interest amount signal when reversing a payment
		if (po instanceof MPayment && event.getTopic().equals(IEventTopics.PO_BEFORE_NEW)) {
			MPayment p = (MPayment) po;
			
			if (p.getReversal_ID() > 0) {
				BigDecimal interestAmt = (BigDecimal) p.get_Value("InterestAmt");
				
				if (interestAmt != null && interestAmt.signum() != 0)
					p.set_ValueOfColumn("InterestAmt", interestAmt.negate());
			}
		}
		
		// change allocation amount when payment has interest amount
		if (po instanceof MAllocationLine && event.getTopic().equals(IEventTopics.PO_BEFORE_NEW)) {
			MAllocationLine al = (MAllocationLine) po;
			int C_Payment_ID = al.getC_Payment_ID();
			
			if (C_Payment_ID != 0) {
				MPayment p = new MPayment(po.getCtx(), C_Payment_ID, po.get_TrxName());
				BigDecimal interestAmt = (BigDecimal) p.get_Value("InterestAmt");
				
				if (interestAmt != null && interestAmt.signum() != 0
						&& (p.getPayAmt().setScale(4, RoundingMode.HALF_UP).negate().equals(al.getAmount().setScale(4, RoundingMode.HALF_UP))
								|| p.getPayAmt().setScale(4, RoundingMode.HALF_UP).equals(al.getAmount().setScale(4, RoundingMode.HALF_UP))))
					al.setAmount(p.isReceipt() ? al.getAmount().subtract(interestAmt) : al.getAmount().add(interestAmt));
			}
		}
		
		// Include instructions on Boleto when Invoice is Voided/Reversed
		if (po instanceof MInvoice && ( event.getTopic().equals(IEventTopics.DOC_BEFORE_VOID) || 
										event.getTopic().equals(IEventTopics.DOC_BEFORE_REVERSEACCRUAL) ||
										event.getTopic().equals(IEventTopics.DOC_BEFORE_REVERSECORRECT) ) ) {

			List<MLBRBoleto> boletos = MLBRBoleto.getByInvoice(po.getCtx(), (MInvoice)po, po.get_TrxName());

			for (MLBRBoleto b : boletos) {
				if (!b.isLBR_IsBaixado() && !b.isPaid()) {
					MLBRBoletoMovement newMov = MLBRBoletoMovement.createNewMovement(po.getCtx(), b, b.isLBR_IsProtested()?"10":"02", po.get_TrxName());
					newMov.saveEx();
				}
			}
		}
		
		MLBRBoleto boleto = null;

		// Include instructions on Boleto when Payment Schedule is changed
		if (po instanceof MInvoicePaySchedule && event.getTopic().equals(IEventTopics.PO_AFTER_CHANGE) && (boleto = MLBRBoleto.getByInvoicePaySchedule(po.getCtx(), (MInvoicePaySchedule) po, po.get_TrxName()))!=null) {

			MInvoicePaySchedule paySchedule = (MInvoicePaySchedule) po;
			MLBRBoletoDetails[] detailsEntries = boleto.getDetails();

			MLBRBoletoMovement newMov = null;
			// Vencimento
			if (boleto != null && po.is_ValueChanged(MInvoicePaySchedule.COLUMNNAME_DueDate)) {
				if (detailsEntries.length > 0) {
					// change DueDate on boleto
					boleto.setDueDate(paySchedule.getDueDate());
					boleto.saveEx();
					detailsEntries[0].updateInterest();
					detailsEntries[0].updateLatePaymentPenalty();
				}				
				newMov = MLBRBoletoMovement.createNewMovement(po.getCtx(), boleto, "06", po.get_TrxName());
				newMov.setDueDate(((MInvoicePaySchedule)po).getDueDate());
				newMov.saveEx();
			}
			// Data e/ou Valor de desconto
			if (boleto != null && (    po.is_ValueChanged(MInvoicePaySchedule.COLUMNNAME_DiscountAmt)
					                || po.is_ValueChanged(MInvoicePaySchedule.COLUMNNAME_DiscountDate))) {
				newMov = MLBRBoletoMovement.createNewMovement(po.getCtx(), boleto, "16", po.get_TrxName());
				newMov.setLBR_CNABDiscount1Code( MLBRBoletoMovement.LBR_CNABDISCOUNT1CODE_1_ValorFixoAteADataInformada );
				newMov.setDiscountAmt(((MInvoicePaySchedule)po).getDiscountAmt());
				newMov.setLBR_CNABDiscount1Date(((MInvoicePaySchedule)po).getDiscountDate());
				detailsEntries[0].updateDiscounts();
				newMov.saveEx();
			}
		}
		
		// Include instructions to Boleto when allocating credits to its invoice
		if (po instanceof MAllocationHdr && event.getTopic().equals(IEventTopics.DOC_AFTER_COMPLETE)) {
			MAllocationHdr allocation = (MAllocationHdr) po;
			MAllocationLine[] lines = allocation.getLines(false);
			
			List<MLBRBoleto> boletos = new ArrayList<MLBRBoleto>();
			
			if (lines.length == 1) {
				// detect direct allocation to a Boleto
				boleto = MLBRBoleto.getByPayment(po.getCtx(), (MPayment) (lines[0].getC_Payment()) , po.get_TrxName());
				if (boleto != null && !boleto.isPaid() && !boleto.isLBR_IsBaixado()) {
					boletos.add(boleto);
				}
			} else if (lines.length > 1) {
				// detect allocation to fully paid invoices
				List<MInvoice> arInvoices = new ArrayList<MInvoice>();
				for ( MAllocationLine a : lines ) {
					MInvoice invoice = a.getInvoice();
					if (invoice.isSOTrx() && !invoice.isCreditMemo() && invoice.isPaid() && !arInvoices.contains(invoice)) {
						// Only for AR Invoice
						arInvoices.add(invoice);
						List<MLBRBoleto> bList = MLBRBoleto.getByInvoice(po.getCtx(), invoice, po.get_TrxName());
						for ( MLBRBoleto b : bList) {
							if (!b.isPaid() && !b.isLBR_IsBaixado()) {
								boletos.add(b);
							}
						}
					}
				}
			}

			for (MLBRBoleto b : boletos) {
				MLBRBoletoMovement newMov = MLBRBoletoMovement.createNewMovement(po.getCtx(), b, b.isLBR_IsProtested()?"10":"02", po.get_TrxName());
				newMov.saveEx();
			}
		}
	}	
	
	public static IBankCollection getBankCollectionInstance( String routingno ) {
		ServiceQuery query = new ServiceQuery();
		List<IBankCollectionFactory> factoryList = Service.locator().list(IBankCollectionFactory.class, query).getServices();
		if (factoryList != null)
		{
			for(IBankCollectionFactory factory : factoryList)
			{
				IBankCollection customizer = factory.newBankCollectionInstance(routingno);
				if (customizer != null)
					return customizer;
			}
		}
		return null;
	}

}