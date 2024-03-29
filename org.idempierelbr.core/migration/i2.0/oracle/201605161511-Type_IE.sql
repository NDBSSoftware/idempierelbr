SET SQLBLANKLINES ON
SET DEFINE OFF

-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
-- 16/05/2016 14h27min34s BRT
INSERT INTO AD_Element (AD_Element_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,ColumnName,Name,PrintName,EntityType,AD_Element_UU) VALUES (800275,0,0,'Y',TO_DATE('2016-05-16 14:27:33','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:27:33','YYYY-MM-DD HH24:MI:SS'),0,'LBR_TypeIE','IE Inscription Type','IE Inscription Type','U','0800946a-d5ce-46e2-b59c-adb80a464c8a')
;

-- 16/05/2016 14h31min27s BRT
INSERT INTO AD_Reference (AD_Reference_ID,Name,ValidationType,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,EntityType,IsOrderByValue,AD_Reference_UU) VALUES (800026,'LBR_TypeIE','L',0,0,'Y',TO_DATE('2016-05-16 14:31:26','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:31:26','YYYY-MM-DD HH24:MI:SS'),0,'U','N','67ac80c2-9ef1-4fae-abd8-5e4164b6391d')
;

-- 16/05/2016 14h31min44s BRT
INSERT INTO AD_Ref_List (AD_Ref_List_ID,Name,AD_Reference_ID,Value,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,EntityType,AD_Ref_List_UU) VALUES (800138,'Contribuinte',800026,'1',0,0,'Y',TO_DATE('2016-05-16 14:31:43','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:31:43','YYYY-MM-DD HH24:MI:SS'),0,'U','fa14d1a8-488c-4287-a293-a265d822289f')
;

-- 16/05/2016 14h31min50s BRT
INSERT INTO AD_Ref_List (AD_Ref_List_ID,Name,AD_Reference_ID,Value,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,EntityType,AD_Ref_List_UU) VALUES (800139,'Isento',800026,'2',0,0,'Y',TO_DATE('2016-05-16 14:31:49','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:31:49','YYYY-MM-DD HH24:MI:SS'),0,'U','88953d80-beda-4cd8-873a-6c334e59bd15')
;

-- 16/05/2016 14h32min5s BRT
INSERT INTO AD_Ref_List (AD_Ref_List_ID,Name,AD_Reference_ID,Value,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,EntityType,AD_Ref_List_UU) VALUES (800140,'Não Contribuinte',800026,'9',0,0,'Y',TO_DATE('2016-05-16 14:32:04','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:32:04','YYYY-MM-DD HH24:MI:SS'),0,'U','aed40c94-ea3e-42a3-924d-ab8c44358f6a')
;

-- 16/05/2016 14h32min25s BRT
INSERT INTO AD_Column (AD_Column_ID,Version,Name,AD_Table_ID,ColumnName,DefaultValue,FieldLength,IsKey,IsParent,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsEncrypted,AD_Reference_ID,AD_Reference_Value_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Element_ID,IsUpdateable,IsSelectionColumn,EntityType,IsSyncDatabase,IsAlwaysUpdateable,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsAllowCopy,SeqNoSelection,IsToolbarButton,IsSecure) VALUES (801015,0,'IE Inscription Type',291,'LBR_TypeIE','2',2,'N','N','Y','N','N',0,'N',17,800026,0,0,'Y',TO_DATE('2016-05-16 14:32:24','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:32:24','YYYY-MM-DD HH24:MI:SS'),0,800275,'Y','N','U','N','N','N','Y','7d80a45c-7dd3-483f-b273-d84af27a1357','Y',0,'N','N')
;

-- 16/05/2016 14h32min39s BRT
ALTER TABLE C_BPartner ADD LBR_TypeIE VARCHAR2(2) DEFAULT '2' NOT NULL
;

-- 16/05/2016 14h33min14s BRT
INSERT INTO AD_Field (AD_Field_ID,Name,AD_Tab_ID,AD_Column_ID,IsDisplayed,DisplayLength,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsEncrypted,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,IsReadOnly,IsCentrallyMaintained,EntityType,AD_Field_UU,IsDisplayedGrid,SeqNoGrid,ColumnSpan) VALUES (800508,'IE Inscription Type',220,801015,'Y',2,810,'N','N','N','N',0,0,'Y',TO_DATE('2016-05-16 14:33:13','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:33:13','YYYY-MM-DD HH24:MI:SS'),0,'N','Y','U','767bcb31-2dda-4ce4-a1f5-2f1a19da5ab9','Y',540,2)
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=200, XPosition=1,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=800508
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=220, XPosition=8,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000010
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET SeqNo=230,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2149
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET SeqNo=240,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2162
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET SeqNo=250,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9615
;

-- 16/05/2016 14h34min50s BRT
UPDATE AD_Field SET SeqNo=260,Updated=TO_DATE('2016-05-16 14:34:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=8238
;

-- 16/05/2016 14h49min9s BRT
UPDATE AD_Field SET DisplayLogic='@LBR_BPTypeBR@=''PJ'' & @#LBR_USE_UNIFIED_BP@!''Y'' | @LBR_BPTypeBR@=''PF'' & @LBR_TypeIE@=''1''',Updated=TO_DATE('2016-05-16 14:49:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000009
;

-- 16/05/2016 14h50min26s BRT
INSERT INTO AD_Column (AD_Column_ID,Version,Name,AD_Table_ID,ColumnName,DefaultValue,FieldLength,IsKey,IsParent,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsEncrypted,AD_Reference_ID,AD_Reference_Value_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Element_ID,IsUpdateable,IsSelectionColumn,EntityType,IsSyncDatabase,IsAlwaysUpdateable,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsAllowCopy,SeqNoSelection,IsToolbarButton,IsSecure,FKConstraintType) VALUES (801016,0,'IE Inscription Type',293,'LBR_TypeIE','2',2,'N','N','N','N','N',0,'N',17,800026,0,0,'Y',TO_DATE('2016-05-16 14:50:25','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 14:50:25','YYYY-MM-DD HH24:MI:SS'),0,800275,'Y','N','U','N','N','N','Y','55d6f8ef-ce38-406b-bcd7-d840c93c2ac7','Y',0,'N','N','N')
;

-- 16/05/2016 14h50min27s BRT
ALTER TABLE C_BPartner_Location ADD LBR_TypeIE VARCHAR2(2) DEFAULT '2'
;

-- 16/05/2016 15h6min23s BRT
INSERT INTO AD_Field (AD_Field_ID,Name,AD_Tab_ID,AD_Column_ID,IsDisplayed,DisplayLength,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsEncrypted,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,IsReadOnly,IsCentrallyMaintained,EntityType,AD_Field_UU,IsDisplayedGrid,SeqNoGrid,ColumnSpan) VALUES (800509,'IE Inscription Type',222,801016,'Y',2,230,'N','N','N','N',0,0,'Y',TO_DATE('2016-05-16 15:06:21','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 15:06:21','YYYY-MM-DD HH24:MI:SS'),0,'N','Y','U','093cc16e-a802-429f-a980-9143f2bc8508','Y',230,2)
;

-- 16/05/2016 15h6min52s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=110, XPosition=1,Updated=TO_DATE('2016-05-16 15:06:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=800509
;

-- 16/05/2016 15h6min52s BRT
UPDATE AD_Field SET IsDisplayed='N', SeqNo=0, XPosition=1,Updated=TO_DATE('2016-05-16 15:06:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000016
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=220,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2149
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=230,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2162
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=240,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9615
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=250,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=8238
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=260,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9606
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=270,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=10592
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=280,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2155
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=290,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9620
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=300,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2160
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=310,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=57981
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=320,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2164
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=330,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2133
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=340,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2141
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=350,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2136
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=360,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9600
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=370,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9602
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=380,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9624
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=390,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9601
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=400,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1001940
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=410,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1001941
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=420,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1001942
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=430,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9612
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=440,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9607
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=450,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9622
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=460,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9611
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=470,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=10470
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=480,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9628
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=490,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=54556
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=500,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9619
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=510,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000070
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=520,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000071
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=530,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000072
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=540,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9610
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=550,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9603
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=560,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=200622
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=570,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9621
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=580,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9608
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=590,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=201865
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=600,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=201866
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=610,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000073
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=620,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000074
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=630,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000075
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=640,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9609
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=650,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2124
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=660,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3261
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=670,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9604
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=680,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9618
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=690,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9625
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=700,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=9613
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=710,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2154
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=720,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2132
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=730,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2144
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=740,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2127
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=750,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2146
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=760,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2153
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=770,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2148
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=780,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2128
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET SeqNo=790,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=2135
;

-- 16/05/2016 15h7min4s BRT
UPDATE AD_Field SET IsDisplayed='N', SeqNo=0, XPosition=1,Updated=TO_DATE('2016-05-16 15:07:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000010
;

-- 16/05/2016 15h13min29s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=230, XPosition=5,Updated=TO_DATE('2016-05-16 15:13:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000016
;

-- 16/05/2016 15h13min37s BRT
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=1000016
;

-- 16/05/2016 15h13min37s BRT
DELETE FROM AD_Field WHERE AD_Field_ID=1000016
;

-- 16/05/2016 15h13min56s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=800, XPosition=9, ColumnSpan=1,Updated=TO_DATE('2016-05-16 15:13:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1000010
;

-- 16/05/2016 15h14min4s BRT
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=1000010
;

-- 16/05/2016 15h14min4s BRT
DELETE FROM AD_Field WHERE AD_Field_ID=1000010
;

-- 16/05/2016 15h14min31s BRT
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=1000016
;

-- 16/05/2016 15h14min31s BRT
DELETE FROM AD_Column WHERE AD_Column_ID=1000016
;

-- 16/05/2016 15h14min31s BRT
DELETE FROM AD_PrintFormatItem WHERE AD_Column_ID = 1000010;


-- 16/05/2016 15h14min52s BRT
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=1000010
;

-- 16/05/2016 15h14min52s BRT
DELETE FROM AD_Column WHERE AD_Column_ID=1000010
;

-- 16/05/2016 15h15min58s BRT
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=1001496
;

-- 16/05/2016 15h15min58s BRT
DELETE FROM AD_Field WHERE AD_Field_ID=1001496
;

-- 16/05/2016 15h16min12s BRT
INSERT INTO AD_Column (AD_Column_ID,Version,Name,AD_Table_ID,ColumnName,DefaultValue,FieldLength,IsKey,IsParent,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsEncrypted,AD_Reference_ID,AD_Reference_Value_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Element_ID,IsUpdateable,IsSelectionColumn,EntityType,IsSyncDatabase,IsAlwaysUpdateable,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsAllowCopy,SeqNoSelection,IsToolbarButton,IsSecure,FKConstraintType) VALUES (801017,0,'IE Inscription Type',1000043,'LBR_TypeIE','2',2,'N','N','N','N','N',0,'N',17,800026,0,0,'Y',TO_DATE('2016-05-16 15:16:12','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 15:16:12','YYYY-MM-DD HH24:MI:SS'),0,800275,'Y','N','U','N','N','N','Y','d6f6b34b-4543-4656-aa25-81f2c948c992','Y',0,'N','N','N')
;

-- 16/05/2016 15h16min14s BRT
ALTER TABLE LBR_NotaFiscalDocRef ADD LBR_TypeIE VARCHAR2(2) DEFAULT '2'
;

-- 16/05/2016 15h16min47s BRT
INSERT INTO AD_Field (AD_Field_ID,Name,AD_Tab_ID,AD_Column_ID,IsDisplayed,DisplayLength,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsEncrypted,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,IsReadOnly,IsCentrallyMaintained,EntityType,AD_Field_UU,IsDisplayedGrid,SeqNoGrid,ColumnSpan) VALUES (800510,'IE Inscription Type',1000085,801017,'Y',2,190,'N','N','N','N',0,0,'Y',TO_DATE('2016-05-16 15:16:46','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2016-05-16 15:16:46','YYYY-MM-DD HH24:MI:SS'),0,'N','Y','U','1aec1ee9-978f-486f-aead-8ac2cf8b47fe','Y',180,2)
;

-- 16/05/2016 15h17min6s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=150, XPosition=1,Updated=TO_DATE('2016-05-16 15:17:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=800510
;

-- 16/05/2016 15h17min6s BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=160, XPosition=4,Updated=TO_DATE('2016-05-16 15:17:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=1001495
;

-- 16/05/2016 15h17min46s BRT
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=1000809
;

-- 16/05/2016 15h17min46s BRT
DELETE FROM AD_Column WHERE AD_Column_ID=1000809
;

-- 16/05/2016 15h17min50s BRT
UPDATE AD_Column SET MandatoryLogic='@LBR_TypeIE@=''1''',Updated=TO_DATE('2016-05-17 00:44:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000009
;

-- update c_bpartner
UPDATE C_BPartner SET LBR_TypeIE = '9'; 
UPDATE C_BPartner SET LBR_TypeIE = '2' WHERE LBR_IsIEExempt = 'Y';
UPDATE C_BPartner SET LBR_TypeIE = '1' WHERE LBR_IsIEExempt = 'N' AND LBR_IE IS NOT NULL AND LBR_IE != '';

-- update c_bpartner_location
UPDATE C_BPartner_Location SET LBR_TypeIE = '9'; 
UPDATE C_BPartner_Location SET LBR_TypeIE = '2' WHERE LBR_IsIEExempt = 'Y';
UPDATE C_BPartner_Location SET LBR_TypeIE = '1' WHERE LBR_IsIEExempt = 'N' AND LBR_IE IS NOT NULL AND LBR_IE != '';

--
SELECT lbr_register_migration_script('201605161511-Type_IE.sql') FROM dual;