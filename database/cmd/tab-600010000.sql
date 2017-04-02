prompt -- Сборка 4.6.1
prompt 
-- 
SET DEFINE OFF;
--
-- Удалить ограничение "VALUEFILLED4" для объекта типа таблица "FDC_VALUE"
--
ALTER TABLE FDC_VALUE
  DROP CONSTRAINT VALUEFILLED4;

--
-- Создать ограничение "C_FDC_VALUE_LOCSYS_CHK" для объекта типа таблица "FDC_VALUE"
--
ALTER TABLE FDC_VALUE
  ADD CONSTRAINT C_FDC_VALUE_LOCSYS_CHK CHECK (LOCALITY = 0 AND ISSYSTEM = 0 OR ISSYSTEM = 1);

--
-- Создать ограничение "VALUEFILLED4" для объекта типа таблица "FDC_VALUE"
--
ALTER TABLE FDC_VALUE
  ADD CONSTRAINT VALUEFILLED4 CHECK (IsSystem = 1
            and AllowNull = 1
            or
            (    StringValue   is not null
              or NumValue      is not null
              or DateTimeValue is not null
              or Ref_Object_Id is not null
            )
);

--
-- Создать индекс "IDX#PO#DESTCUSTOMSCODE" для объекта типа таблица "FDC_PAYMENT_ORDER"
--
CREATE INDEX IDX#PO#DESTCUSTOMSCODE ON FDC_PAYMENT_ORDER (DESTCUSTOMSCODE);

--
-- Создать индекс "ASBC_CARDMASK" для объекта типа таблица "FDC_PAYMENT_ORDER_CHEQUE"
--
CREATE INDEX ASBC_CARDMASK ON FDC_PAYMENT_ORDER_CHEQUE (SUBSTR("CARDNUM",1,6));

--
-- Создать столбец "PREV_DECISION_ID" для таблицы "FDC_DECISION_PAYBACK"
--
ALTER TABLE FDC_DECISION_PAYBACK
  ADD PREV_DECISION_ID NUMBER(15, 0);

--
-- Создать внешний ключ "FDC#FK#PREV_PAYBACK" для объекта типа таблица "FDC_DECISION_PAYBACK"
--
ALTER TABLE FDC_DECISION_PAYBACK
  ADD CONSTRAINT FDC#FK#PREV_PAYBACK FOREIGN KEY (PREV_DECISION_ID)
    REFERENCES FDC_DECISION(ID);

--
-- Создать индекс "IDX#FK#PREV_PAYBACK" для объекта типа таблица "FDC_DECISION_PAYBACK"
--
CREATE INDEX IDX#FK#PREV_PAYBACK ON FDC_DECISION_PAYBACK (PREV_DECISION_ID);

--
-- Изменить таблицу "FDC_DECISION_PAYBACK"
--
COMMENT ON COLUMN FDC_DECISION_PAYBACK.PREV_DECISION_ID IS 'Идентификатор основного решения';

--
-- Изменить столбец "DECL_NO" для таблицы "FDC_DOC_CHARGE"
--
ALTER TABLE FDC_DOC_CHARGE
  MODIFY(DECL_NO VARCHAR2(100));

--
-- Создать индекс "FDC_OBJECT_TYPE_PK" для объекта типа таблица "FDC_OBJECT_TYPE"
--
CREATE UNIQUE INDEX FDC_OBJECT_TYPE_PK ON FDC_OBJECT_TYPE (ID);

--
-- Изменить столбец "REQCONT" для таблицы "ASBC_CHECKS"
--
ALTER TABLE ASBC_CHECKS
  MODIFY(REQCONT VARCHAR2(500));

--
-- Создать столбец "LOGMSG" для таблицы "ASBC_INTERACT_LOG"
--
ALTER TABLE ASBC_INTERACT_LOG
  ADD LOGMSG CLOB;

--
-- Изменить таблицу "ASBC_INTERACT_LOG"
--
COMMENT ON COLUMN ASBC_INTERACT_LOG.LOGMSG IS 'Лог сообщение';

--
-- Создать столбец "GENPROV" для таблицы "DBF_TPO"
--
ALTER TABLE DBF_TPO
  ADD GENPROV VARCHAR2(1 BYTE);

--
-- Изменить таблицу "DBF_TPO"
--
COMMENT ON COLUMN DBF_TPO.GENPROV IS 'Признак генерального обеспечения';

alter table DBF_KTDPLBIZ
  add constraint DBF_KTDPLBIZ_UQ unique (G071, G072, G073, NUM_PP, KB1, KB3, IRET, KB5) novalidate;

COMMENT ON COLUMN DBF_DCLHEAD.GD01 IS 'Описание принятого решения';
COMMENT ON COLUMN DBF_DCLTECHD.G4492 IS 'Заявляемый срок временного ввоза/вывоза/Срок хранения товаров/Запрашиваемый срок переработки';
COMMENT ON COLUMN DBF_DCLTECHD.PRSDECL IS 'Признак результата запроса документа у декларанта (ЭАДД):
0 – запрос отправлен, ответ не получен, 1 – запрошенный документ получен из ЭАДД, 3 – получено сообщение об ошибке, 4 – запрошенный документ получен от декларанта';
COMMENT ON COLUMN DBF_DCLTOVAR.GD01 IS 'Описание принятого решения';
COMMENT ON COLUMN DBF_DKISCH.G473Z2_2 IS 'Результат выполнения операции сравнения:
1 – истина,
0 – ложь.';

--
-- Создать таблицу "ASBC_DOCTYPES_NOTACTIVE"
--
CREATE TABLE ASBC_DOCTYPES_NOTACTIVE (
  SYSNAME VARCHAR2(1500 BYTE) NOT NULL,
  NAME VARCHAR2(1500 BYTE) NOT NULL);

COMMENT ON TABLE ASBC_DOCTYPES_NOTACTIVE IS 'Типы документов без признака проведения';
COMMENT ON COLUMN ASBC_DOCTYPES_NOTACTIVE.NAME IS 'NAME';
COMMENT ON COLUMN ASBC_DOCTYPES_NOTACTIVE.SYSNAME IS 'SYSNAME';
alter table ASBC_DOCTYPES_NOTACTIVE
  add constraint С_ASBC_DOCTYPES_NOTACTIVE_PK primary key (SYSNAME);

COMMIT;
/
-- TARGET_KBK_REPORT_TYPE specification
CREATE TYPE target_kbk_report_type
 AS OBJECT
(
    customs_code VARCHAR2(100),
    KBKCode_id   VARCHAR2(100),
    summa_from         NUMBER(22, 2),
    summa_to       NUMBER(22, 2)
);
/
CREATE TYPE TARGET_KBK_REPORT_TABLE AS
    TABLE OF TARGET_KBK_REPORT_TYPE;
/
CREATE TYPE TCD_KBKIDS AS
    TABLE OF NUMBER(15, 0);
/  
prompt -- Сборка 4.6.0 (End) 
prompt 
prompt 
