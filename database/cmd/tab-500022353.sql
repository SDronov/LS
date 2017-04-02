prompt -- —борка 02353
prompt 
-- Create table
create table FDC_NSI_DECLARANT_ELS
(
  id         NUMBER(15) not null,
  name       VARCHAR2(4000),
  inn        VARCHAR2(12),
  date_begin DATE,
  date_end   DATE,
  note       VARCHAR2(4000)
);
-- Add comments to the table 
comment on table FDC_NSI_DECLARANT_ELS
  is 'Участники ВЭД с ЕЛС';
-- Add comments to the columns 
comment on column FDC_NSI_DECLARANT_ELS.date_begin
  is 'Дата перехода на ЕЛС';
comment on column FDC_NSI_DECLARANT_ELS.date_end
  is 'Дата выхода из ЕЛС';
comment on column FDC_NSI_DECLARANT_ELS.note
  is 'Примечание';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_PK primary key (ID);
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_AK1 unique (INN, DATE_BEGIN, DATE_END);
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
-- Grant/Revoke object privileges 
grant select, insert, update, delete on FDC_NSI_DECLARANT_ELS to FDC_ROLE_LS_ADM_NSI;
grant select on FDC_NSI_DECLARANT_ELS to FDC_ROLE_LS_SELECT_DATA;

create table DBF_FDC_NSI_DECLARANT_ELS
(
  inn        VARCHAR2(12),
  name       VARCHAR2(4000),
  date_begin DATE,
  date_end   date,
  note       varchar2(4000)
);
grant select, insert, update, delete on DBF_FDC_NSI_DECLARANT_ELS to FDC_ROLE_LS_ADM_NSI;
grant select on DBF_FDC_NSI_DECLARANT_ELS to FDC_ROLE_LS_SELECT_DATA;
/
-- OI_REPORT_VED_REFUNDS_TYPE specification
CREATE TYPE oi_report_VED_Refunds_type
 AS OBJECT
(
  ID                number,
  OPER_DATE         date,
  CUSTOMS_CODE      varchar2(8),
  CUSTOMS_FULL_NAME varchar2(4000),
  DEC_TYPE          varchar2(1500),
  DEC_DATE          date,
  DEC_NUMBER        varchar2(100),
  DOC_NUMBER        varchar2(100),
  DOC_DATE          date,
  SUMMA             number(22,2),
  INN               varchar2(12),
  KPP               varchar2(10),
  NAME              varchar2(160),
  ACCOUNT_K         varchar2(20),
  BIK_K             varchar2(9),
  BANK_NAME         varchar2(4000),
  IS_PRESENT        char(1),
  LIST_ACCOUNTS     varchar2(1000)
);
/
CREATE TYPE OI_REPORT_VED_REFUNDS_TABLE AS
    TABLE OF OI_REPORT_VED_REFUNDS_TYPE;
/
CREATE type rUsrCustDet as object (
  customs_code_8           VARCHAR2(8),
  name                     VARCHAR2(15500),
  id                       VARCHAR2(50),
  code                     VARCHAR2(50));
/
create or replace type tUsrCustDet
is table of rUsrCustDet;
/
-- Create table
create global temporary table OI_SUMMARY_REPORT_TMP
  of OI_REPORT_SUMMARY_TYPE
on commit delete rows;
-- Add comments to the table 
comment on table OI_SUMMARY_REPORT_TMP
  is 'Таблица OI_SUMMARY_REPORT_TMP';
-- Add comments to the columns 
comment on column OI_SUMMARY_REPORT_TMP.customs_code
  is 'CUSTOMS_CODE';
comment on column OI_SUMMARY_REPORT_TMP.kbkcode_id
  is 'KBKCODE_ID';
comment on column OI_SUMMARY_REPORT_TMP.pays
  is 'PAYS';
comment on column OI_SUMMARY_REPORT_TMP.notice
  is 'NOTICE';
comment on column OI_SUMMARY_REPORT_TMP.podt_po
  is 'PODT_PO';
comment on column OI_SUMMARY_REPORT_TMP.vozvrat
  is 'VOZVRAT';
comment on column OI_SUMMARY_REPORT_TMP.reuse
  is 'REUSE';
prompt -- —борка 02353(End) 
prompt 
prompt 
