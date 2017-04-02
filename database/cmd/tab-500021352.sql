prompt -- Сборка 01352
prompt 

ALTER TABLE FDC_DOC_CHARGE
  MODIFY(DECL_NO VARCHAR2(11));

CREATE TABLE DBF_NSI_KL_STAV (
  STAV NUMBER(7, 4),
  DATBEG DATE,
  DATEND DATE,
  DATEMOD DATE);
  
-- Grant/Revoke object privileges 
grant select, insert, update, delete on DBF_NSI_KL_STAV to FDC_ROLE_LS_ADM_NSI;
grant select on DBF_NSI_KL_STAV to FDC_ROLE_LS_SELECT_DATA;

ALTER TABLE DBF_DCLHEAD
  ADD G5411AID VARCHAR2(50);

ALTER TABLE DBF_DCLHEAD
  ADD G5411ADID VARCHAR2(50);

ALTER TABLE DBF_DCLHEAD
  ADD G5411MODID VARCHAR2(10);

ALTER TABLE DBF_DCLHEAD
  ADD G5411DOC VARCHAR2(5);

ALTER TABLE DBF_DCLHEAD
  ADD G544AID VARCHAR2(50);

ALTER TABLE DBF_DCLHEAD
  ADD G544ADID VARCHAR2(50);

ALTER TABLE DBF_DCLHEAD
  ADD G544MODID VARCHAR2(10);

ALTER TABLE DBF_DCLHEAD
  ADD G544DOC VARCHAR2(5);

ALTER TABLE DBF_DCLHEAD
  ADD VAL_CONTR VARCHAR2(1);

ALTER TABLE DBF_DCLHEAD
  ADD PS_CONTR VARCHAR2(1);

COMMENT ON COLUMN DBF_DCLHEAD.G5411ADID IS 'Идентификатор договора таможенного представителя  в электронном архиве декларанта';
COMMENT ON COLUMN DBF_DCLHEAD.G5411AID IS 'Идентификатор электронного архива декларанта, где размещен договор таможенного представителя';
COMMENT ON COLUMN DBF_DCLHEAD.G5411DOC IS 'Код вида документа - договор таможенного представителя, в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании';
COMMENT ON COLUMN DBF_DCLHEAD.G5411MODID IS 'Код документа - договор таможенного представителя,  в соответствии с альбомом форматов электронных форм документов (приложение 6.1)';
COMMENT ON COLUMN DBF_DCLHEAD.G544ADID IS 'Идентификатор документа, подтверждающего полномочия  в электронном архиве декларанта';
COMMENT ON COLUMN DBF_DCLHEAD.G544AID IS 'Идентификатор электронного архива декларанта, где размещен документ, подтверждающий полномочия';
COMMENT ON COLUMN DBF_DCLHEAD.G544DOC IS 'Код вида документа, подтверждающего полномочия, в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании';
COMMENT ON COLUMN DBF_DCLHEAD.G544MODID IS 'Код документа подтверждающего полномочия,  в соответствии с альбомом форматов электронных форм документов (приложение 6.1)';
COMMENT ON COLUMN DBF_DCLHEAD.PS_CONTR IS 'Результат сверки сведений из ДТ и паспорта сделки: 0 – ПС не заявлен в ДТ или не получен, 1 – ПС не сверялся с ДТ, 2 – ПС сверялся с ДТ, расхождений нет, 3 – обнаружены расхождения ПС и ДТ, отправлено (для F_DECL= 3 и 4) требование на корректировку';
COMMENT ON COLUMN DBF_DCLHEAD.VAL_CONTR IS 'Признак наличия информации о завышении общей суммы по счёту и цены товара с целью последующего перевода денежных средств в пользу нерезидента (0 – признак отсутствует, 1 - признак присутствует)';

ALTER TABLE DBF_KTDHEAD
  ADD D5411AID VARCHAR2(50);

ALTER TABLE DBF_KTDHEAD
  ADD D5411ADID VARCHAR2(50);

ALTER TABLE DBF_KTDHEAD
  ADD D5411MODID VARCHAR2(10);

ALTER TABLE DBF_KTDHEAD
  ADD D5411DOC VARCHAR2(5);

ALTER TABLE DBF_KTDHEAD
  ADD D544AID VARCHAR2(50);

ALTER TABLE DBF_KTDHEAD
  ADD D544ADID VARCHAR2(50);

ALTER TABLE DBF_KTDHEAD
  ADD D544MODID VARCHAR2(10);

ALTER TABLE DBF_KTDHEAD
  ADD D544DOC VARCHAR2(5);

COMMENT ON COLUMN DBF_KTDHEAD.D5411ADID IS 'Идентификатор договора таможенного представителя  в электронном архиве декларанта';
COMMENT ON COLUMN DBF_KTDHEAD.D5411AID IS 'Идентификатор электронного архива декларанта, где расположен договор таможенного представителя';
COMMENT ON COLUMN DBF_KTDHEAD.D5411DOC IS 'Код вида договора таможенного представителя в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании';
COMMENT ON COLUMN DBF_KTDHEAD.D5411MODID IS 'Код вида договора таможенного представителя,  представленного в соответствии с альбомом форматов электронных форм документов';
COMMENT ON COLUMN DBF_KTDHEAD.D544ADID IS 'Идентификатор документа, подтверждающего полномочия  в электронном архиве декларанта';
COMMENT ON COLUMN DBF_KTDHEAD.D544AID IS 'Идентификатор электронного архива декларанта, где расположен документ, подтверждающий полномочия';
COMMENT ON COLUMN DBF_KTDHEAD.D544DOC IS 'Код документа, подтверждающего полномочия, в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании';
COMMENT ON COLUMN DBF_KTDHEAD.D544MODID IS 'Код вида документа, подтверждающего полномочия,  представленного в соответствии с альбомом форматов электронных форм документов';
COMMENT ON COLUMN DBF_KTDHEAD.G089 IS 'Особенность указанных сведений:
1-КОНТРАГЕНТ, 2 – РАЗНЫЕ ПО СПИСКУ
';
COMMENT ON COLUMN DBF_KTDHEAD.G143ASTREE IS 'Название улицы, номер дома, номер офиса /квартиры
(обособл.подразд.)
';
COMMENT ON COLUMN DBF_KTDHEAD.G19 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G3010 IS 'Тип документа:
1-Лицензия
2-Свидетельство
';
COMMENT ON COLUMN DBF_KTDHEAD.G45A1 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A2 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A3 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A4 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A5 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A6 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G5410 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.K032 IS 'Общее количество форм КДТ1 и КДТ2
(порядок заполнения аналогичен порядку заполнения гр.3 ДТ)
';

ALTER TABLE DBF_DCLTECHD
  ADD RECORDID VARCHAR2(36);

ALTER TABLE DBF_DCLTECHD
  ADD EXECUTBODY VARCHAR2(10);

ALTER TABLE DBF_DCLTECHD
  ADD DOCMODEID VARCHAR2(10);

COMMENT ON COLUMN DBF_DCLTECHD.DOCMODEID IS 'Код представленного документа в соответствии с альбомом форматов электронных форм документов (приложение 6.1)';
COMMENT ON COLUMN DBF_DCLTECHD.EXECUTBODY IS 'Идентификатор исполнительного органа, выдавшего разрешительный документ / идентификатор сервиса СМЭВ';
COMMENT ON COLUMN DBF_DCLTECHD.RECORDID IS 'Уникальный идентификатор записи в XML-документе';

ALTER TABLE EXP_TR
  MODIFY(DECL_NO VARCHAR2(11));



prompt -- Сборка 01352 (End) 
prompt 
prompt 
