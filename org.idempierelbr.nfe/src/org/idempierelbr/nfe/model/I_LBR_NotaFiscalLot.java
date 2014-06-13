/******************************************************************************
 * Product: iDempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2012 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.idempierelbr.nfe.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LBR_NotaFiscalLot
 *  @author iDempiere (generated) 
 *  @version Release 2.0
 */
@SuppressWarnings("all")
public interface I_LBR_NotaFiscalLot 
{

    /** TableName=LBR_NotaFiscalLot */
    public static final String Table_Name = "LBR_NotaFiscalLot";

    /** AD_Table_ID=1000046 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 1 - Org 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(1);

    /** Load Meta Data */

    /** Column name AD_Client_ID */
    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";

	/** Get Client.
	  * Client/Tenant for this installation.
	  */
	public int getAD_Client_ID();

    /** Column name AD_Org_ID */
    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";

	/** Set Organization.
	  * Organizational entity within client
	  */
	public void setAD_Org_ID (int AD_Org_ID);

	/** Get Organization.
	  * Organizational entity within client
	  */
	public int getAD_Org_ID();

    /** Column name Created */
    public static final String COLUMNNAME_Created = "Created";

	/** Get Created.
	  * Date this record was created
	  */
	public Timestamp getCreated();

    /** Column name CreatedBy */
    public static final String COLUMNNAME_CreatedBy = "CreatedBy";

	/** Get Created By.
	  * User who created this records
	  */
	public int getCreatedBy();

    /** Column name Description */
    public static final String COLUMNNAME_Description = "Description";

	/** Set Description.
	  * Optional short description of the record
	  */
	public void setDescription (String Description);

	/** Get Description.
	  * Optional short description of the record
	  */
	public String getDescription();

    /** Column name DocumentNo */
    public static final String COLUMNNAME_DocumentNo = "DocumentNo";

	/** Set Document No.
	  * Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo);

	/** Get Document No.
	  * Document sequence number of the document
	  */
	public String getDocumentNo();

    /** Column name IsActive */
    public static final String COLUMNNAME_IsActive = "IsActive";

	/** Set Active.
	  * The record is active in the system
	  */
	public void setIsActive (boolean IsActive);

	/** Get Active.
	  * The record is active in the system
	  */
	public boolean isActive();

    /** Column name LBR_LotQueried */
    public static final String COLUMNNAME_LBR_LotQueried = "LBR_LotQueried";

	/** Set NF-e Lot Queried.
	  * Indicate if the NF-e Lot was queried correctly to Sefaz
	  */
	public void setLBR_LotQueried (boolean LBR_LotQueried);

	/** Get NF-e Lot Queried.
	  * Indicate if the NF-e Lot was queried correctly to Sefaz
	  */
	public boolean isLBR_LotQueried();

    /** Column name LBR_LotQueriedOn */
    public static final String COLUMNNAME_LBR_LotQueriedOn = "LBR_LotQueriedOn";

	/** Set NF-e Lot Queried On.
	  * The date+time (expressed in decimal format) when the NF-e Lot has been queried
	  */
	public void setLBR_LotQueriedOn (Timestamp LBR_LotQueriedOn);

	/** Get NF-e Lot Queried On.
	  * The date+time (expressed in decimal format) when the NF-e Lot has been queried
	  */
	public Timestamp getLBR_LotQueriedOn();

    /** Column name LBR_LotQueryStatus */
    public static final String COLUMNNAME_LBR_LotQueryStatus = "LBR_LotQueryStatus";

	/** Set NF-e Lot Query Status.
	  * Indicates the status of the query process to Sefaz
	  */
	public void setLBR_LotQueryStatus (String LBR_LotQueryStatus);

	/** Get NF-e Lot Query Status.
	  * Indicates the status of the query process to Sefaz
	  */
	public String getLBR_LotQueryStatus();

    /** Column name LBR_LotSendingProt */
    public static final String COLUMNNAME_LBR_LotSendingProt = "LBR_LotSendingProt";

	/** Set NF-e Lot Sending Protocol.
	  * Indicates the protocol of the sending process to Sefaz
	  */
	public void setLBR_LotSendingProt (String LBR_LotSendingProt);

	/** Get NF-e Lot Sending Protocol.
	  * Indicates the protocol of the sending process to Sefaz
	  */
	public String getLBR_LotSendingProt();

    /** Column name LBR_LotSendingRec */
    public static final String COLUMNNAME_LBR_LotSendingRec = "LBR_LotSendingRec";

	/** Set NF-e Lot Sending Receipt.
	  * Indicates the receipt of the sending process to Sefaz
	  */
	public void setLBR_LotSendingRec (String LBR_LotSendingRec);

	/** Get NF-e Lot Sending Receipt.
	  * Indicates the receipt of the sending process to Sefaz
	  */
	public String getLBR_LotSendingRec();

    /** Column name LBR_LotSendingStatus */
    public static final String COLUMNNAME_LBR_LotSendingStatus = "LBR_LotSendingStatus";

	/** Set NF-e Lot Sending Status.
	  * Indicates the status of the sending process to Sefaz
	  */
	public void setLBR_LotSendingStatus (String LBR_LotSendingStatus);

	/** Get NF-e Lot Sending Status.
	  * Indicates the status of the sending process to Sefaz
	  */
	public String getLBR_LotSendingStatus();

    /** Column name LBR_LotSent */
    public static final String COLUMNNAME_LBR_LotSent = "LBR_LotSent";

	/** Set NF-e Lot Sent.
	  * Indicate if the NF-e Lot was sent correctly to Sefaz
	  */
	public void setLBR_LotSent (boolean LBR_LotSent);

	/** Get NF-e Lot Sent.
	  * Indicate if the NF-e Lot was sent correctly to Sefaz
	  */
	public boolean isLBR_LotSent();

    /** Column name LBR_LotSentOn */
    public static final String COLUMNNAME_LBR_LotSentOn = "LBR_LotSentOn";

	/** Set NF-e Lot Sent On.
	  * The date+time (expressed in decimal format) when the NF-e Lot has been sent
	  */
	public void setLBR_LotSentOn (Timestamp LBR_LotSentOn);

	/** Get NF-e Lot Sent On.
	  * The date+time (expressed in decimal format) when the NF-e Lot has been sent
	  */
	public Timestamp getLBR_LotSentOn();

    /** Column name LBR_NotaFiscalLot_ID */
    public static final String COLUMNNAME_LBR_NotaFiscalLot_ID = "LBR_NotaFiscalLot_ID";

	/** Set NF-e Lot.
	  * Identifies a NF-e Lot
	  */
	public void setLBR_NotaFiscalLot_ID (int LBR_NotaFiscalLot_ID);

	/** Get NF-e Lot.
	  * Identifies a NF-e Lot
	  */
	public int getLBR_NotaFiscalLot_ID();

    /** Column name LBR_NotaFiscal_UU */
    public static final String COLUMNNAME_LBR_NotaFiscal_UU = "LBR_NotaFiscal_UU";

	/** Set Brazilian Fiscal Invoice (Nota Fiscal).
	  * Brazilian Fiscal Invoice (Nota Fiscal) Identifier
	  */
	public void setLBR_NotaFiscal_UU (String LBR_NotaFiscal_UU);

	/** Get Brazilian Fiscal Invoice (Nota Fiscal).
	  * Brazilian Fiscal Invoice (Nota Fiscal) Identifier
	  */
	public String getLBR_NotaFiscal_UU();

    /** Column name LBR_ProcessingType */
    public static final String COLUMNNAME_LBR_ProcessingType = "LBR_ProcessingType";

	/** Set Processing Type	  */
	public void setLBR_ProcessingType (String LBR_ProcessingType);

	/** Get Processing Type	  */
	public String getLBR_ProcessingType();

    /** Column name LBR_ProcQueryNFeLot */
    public static final String COLUMNNAME_LBR_ProcQueryNFeLot = "LBR_ProcQueryNFeLot";

	/** Set Query NF-e Lot.
	  * Process to query NF-e Lot to Sefaz
	  */
	public void setLBR_ProcQueryNFeLot (String LBR_ProcQueryNFeLot);

	/** Get Query NF-e Lot.
	  * Process to query NF-e Lot to Sefaz
	  */
	public String getLBR_ProcQueryNFeLot();

    /** Column name LBR_ProcSendNFeLot */
    public static final String COLUMNNAME_LBR_ProcSendNFeLot = "LBR_ProcSendNFeLot";

	/** Set Send NF-e Lot.
	  * Process to send NF-e Lot to Sefaz
	  */
	public void setLBR_ProcSendNFeLot (String LBR_ProcSendNFeLot);

	/** Get Send NF-e Lot.
	  * Process to send NF-e Lot to Sefaz
	  */
	public String getLBR_ProcSendNFeLot();

    /** Column name Processed */
    public static final String COLUMNNAME_Processed = "Processed";

	/** Set Processed.
	  * The document has been processed
	  */
	public void setProcessed (boolean Processed);

	/** Get Processed.
	  * The document has been processed
	  */
	public boolean isProcessed();

    /** Column name Updated */
    public static final String COLUMNNAME_Updated = "Updated";

	/** Get Updated.
	  * Date this record was updated
	  */
	public Timestamp getUpdated();

    /** Column name UpdatedBy */
    public static final String COLUMNNAME_UpdatedBy = "UpdatedBy";

	/** Get Updated By.
	  * User who updated this records
	  */
	public int getUpdatedBy();
}
