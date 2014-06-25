SET SQLBLANKLINES ON
SET DEFINE OFF

-- Jun 23, 2014 9:37:01 AM BRT
-- Adjusting zoom condition for NF-e <-> NF-e Lot
-- Info Window for NF-e
-- Disallow copy of some LBR fields on Business Partner window
UPDATE AD_RelationType SET IsDirected='N',Updated=TO_DATE('2014-06-23 09:37:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_RelationType_ID=1000000
;

-- Jun 23, 2014 9:37:16 AM BRT
UPDATE AD_Ref_Table SET WhereClause='LBR_NotaFiscal.LBR_NotaFiscal_ID IN (SELECT LBR_NotaFiscalLotLine.LBR_NotaFiscal_ID FROM LBR_NotaFiscalLotLine WHERE  LBR_NotaFiscalLotLine.LBR_NotaFiscalLot_ID=@LBR_NotaFiscalLot_ID@)',Updated=TO_DATE('2014-06-23 09:37:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Reference_ID=1000059
;

-- Jun 23, 2014 10:12:22 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:12:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000003
;

-- Jun 23, 2014 10:12:28 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:12:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000011
;

-- Jun 23, 2014 10:12:33 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:12:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000007
;

-- Jun 23, 2014 10:13:03 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:13:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000009
;

-- Jun 23, 2014 10:13:08 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:13:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000010
;

-- Jun 23, 2014 10:13:13 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:13:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000006
;

-- Jun 23, 2014 10:13:17 AM BRT
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2014-06-23 10:13:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000008
;

-- Jun 23, 2014 10:20:16 AM BRT
INSERT INTO AD_InfoWindow (Processing,FromClause,AD_InfoWindow_UU,AD_InfoWindow_ID,EntityType,Name,AD_Org_ID,UpdatedBy,CreatedBy,IsActive,OrderByClause,IsDefault,IsValid,IsDistinct,AD_Client_ID,AD_Table_ID,SeqNo,IsShowInDashboard,Created,Updated,MaxQueryRecords) VALUES ('N','LBR_NotaFiscal a','dc115574-51ae-4ed8-a5c0-72b8a8262701',1000001,'LBR','Nota Fiscal Info',0,0,0,'Y','a.DocumentNo','Y','Y','N',0,1000033,20,'Y',TO_DATE('2014-06-23 10:20:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2014-06-23 10:20:16','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Jun 23, 2014 10:23:34 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,AD_Val_Rule_ID,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.',10,'d5eddb5b-8a43-44e0-86c0-457539cc6562',1000007,'N','LBR','Client/Tenant for this installation.',0,TO_DATE('2014-06-23 10:23:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Client',129,'Y','AD_Client_ID','Y','Y','a.AD_Client_ID',0,'N',0,102,1000001,19,TO_DATE('2014-06-23 10:23:34','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:23:53 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,AD_Val_Rule_ID,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',20,'753f468f-87df-40cd-a067-511b4bda48fe',1000008,'N','LBR','Organizational entity within client',0,TO_DATE('2014-06-23 10:23:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Organization',130,'Y','AD_Org_ID','Y','Y','a.AD_Org_ID',0,'N',0,113,1000001,19,TO_DATE('2014-06-23 10:23:53','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:24:51 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).',30,'fee240fb-d1f6-48ed-9772-a4f971536e61',1000009,'Y','LBR','Document sequence number of the document',0,TO_DATE('2014-06-23 10:24:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Document No','Y','DocumentNo','Y','Y','Upper','Like','a.DocumentNo',0,'N',0,290,1000001,10,TO_DATE('2014-06-23 10:24:51','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:25:38 AM BRT
INSERT INTO AD_InfoColumn (SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES (40,'fec50c17-3700-4d05-a59c-95a63977c032',1000010,'Y','LBR',0,TO_DATE('2014-06-23 10:25:38','YYYY-MM-DD HH24:MI:SS'),0,0,'NFe ID','Y','LBR_NFeID','Y','Y','Upper','Like','a.LBR_NFeID',0,'N',0,1000172,1000001,10,TO_DATE('2014-06-23 10:25:38','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:28:30 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('The Document Date indicates the date the document was generated.  It may or may not be the same as the accounting date.',50,'1ed1b50f-3056-472d-b85d-afd5916bc9c3',1000011,'N','LBR','Date of the Document',0,TO_DATE('2014-06-23 10:28:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Document Date','Y','DateDoc','Y','Y','Trunc','=','a.DateDoc',0,'N',0,265,1000001,16,TO_DATE('2014-06-23 10:28:30','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:29:49 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('The Document Date indicates the date the document was generated.  It may or may not be the same as the accounting date.',60,'bd6c47bc-28e2-4856-a522-91fa54c9d084',1000012,'Y','LBR','Date of the Document',0,TO_DATE('2014-06-23 10:29:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Document Date','Y','DateDoc','N','Y','Trunc','>=','a.DateDoc',0,'N',0,265,1000001,16,TO_DATE('2014-06-23 10:29:49','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:32:15 AM BRT
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,Created) VALUES ('The Document Date indicates the date the document was generated.  It may or may not be the same as the accounting date.',70,'c185dbb5-8379-4353-a5dc-92395cf0ce08',1000013,'Y','U','Date of the Document',0,TO_DATE('2014-06-23 10:32:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Document Date','Y','DateDoc','N','Y','Trunc','<=','a.DateDoc',0,'N',0,265,1000001,16,TO_DATE('2014-06-23 10:32:15','YYYY-MM-DD HH24:MI:SS'))
;

-- Jun 23, 2014 10:32:20 AM BRT
UPDATE AD_InfoColumn SET EntityType='LBR',Updated=TO_DATE('2014-06-23 10:32:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000013
;

-- Jun 23, 2014 10:35:36 AM BRT
UPDATE AD_Ref_Table SET AD_InfoWindow_ID=1000001,Updated=TO_DATE('2014-06-23 10:35:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Reference_ID=1000058
;

-- Jun 23, 2014 10:35:59 AM BRT
UPDATE AD_InfoColumn SET QueryOperator='=', AD_Reference_ID=15,Updated=TO_DATE('2014-06-23 10:35:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000012
;

-- Jun 23, 2014 10:36:09 AM BRT
UPDATE AD_InfoColumn SET QueryOperator='=', AD_Reference_ID=15,Updated=TO_DATE('2014-06-23 10:36:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000013
;

-- Jun 23, 2014 10:36:22 AM BRT
UPDATE AD_InfoColumn SET AD_Reference_ID=15,Updated=TO_DATE('2014-06-23 10:36:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000011
;

-- Jun 23, 2014 10:36:51 AM BRT
UPDATE AD_InfoColumn SET SeqNo=33,Updated=TO_DATE('2014-06-23 10:36:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000012
;

-- Jun 23, 2014 10:36:55 AM BRT
UPDATE AD_InfoColumn SET SeqNo=35,Updated=TO_DATE('2014-06-23 10:36:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000013
;

-- Jun 23, 2014 10:38:55 AM BRT
UPDATE AD_InfoColumn SET SeqNo=45,Updated=TO_DATE('2014-06-23 10:38:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000011
;

-- Jun 23, 2014 10:40:13 AM BRT
UPDATE AD_InfoColumn SET QueryOperator='>=',Updated=TO_DATE('2014-06-23 10:40:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000012
;

-- Jun 23, 2014 10:40:20 AM BRT
UPDATE AD_InfoColumn SET QueryOperator='<=',Updated=TO_DATE('2014-06-23 10:40:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000013
;

-- Jun 23, 2014 10:44:34 AM BRT
UPDATE AD_InfoColumn SET SeqNo=37,Updated=TO_DATE('2014-06-23 10:44:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_InfoColumn_ID=1000011
;

-- Jun 23, 2014 10:45:46 AM BRT
INSERT INTO AD_InfoColumn (SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID,AD_Reference_Value_ID,Created) VALUES (50,'58464e79-0d76-43aa-9c82-776074c27015',1000014,'Y','LBR',0,TO_DATE('2014-06-23 10:45:46','YYYY-MM-DD HH24:MI:SS'),0,0,'NFe Status','Y','LBR_NFeStatus','Y','Y','Upper','Like','a.LBR_NFeStatus',0,'N',0,1000171,1000001,17,1000039,TO_DATE('2014-06-23 10:45:46','YYYY-MM-DD HH24:MI:SS'))
;

SELECT lbr_register_migration_script('201406231149.sql') FROM dual
;
