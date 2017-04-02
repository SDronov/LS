prompt -- ������ 4.6.0
prompt 
---------------------------------
--  New table asbc_checktypes  --
---------------------------------
-- Create table
create table ASBC_CHECKTYPES
(
  id     NUMBER(17) not null,
  code   VARCHAR2(20) not null,
  name   VARCHAR2(160) not null,
  action VARCHAR2(50)
)
;
-- Add comments to the table 
comment on table ASBC_CHECKTYPES
  is '���� ��������';
-- Add comments to the columns 
comment on column ASBC_CHECKTYPES.code
  is '���';
comment on column ASBC_CHECKTYPES.name
  is '������������';
comment on column ASBC_CHECKTYPES.action
  is '����������� ������ ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_ID_PK primary key (ID);
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_CODE_UK unique (CODE);
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_NAME_UK unique (NAME);

-----------------------------
--  New table asbc_checks  --
-----------------------------
-- Create table
create table ASBC_CHECKS
(
  id          NUMBER not null,
  checktype   NUMBER(17) not null,
  checkdate   DATE not null,
  reqcont     VARCHAR2(240) not null,
  checkstatus NUMBER(1) default 0 not null,
  ansdate     DATE,
  anscont     VARCHAR2(240),
  checknumb   NUMBER(10) not null,
  subject_id  NUMBER(17),
  document_id NUMBER(17),
  nresult     NUMBER(1)
)
;
-- Add comments to the table 
comment on table ASBC_CHECKS
  is '��������';
-- Add comments to the columns 
comment on column ASBC_CHECKS.checktype
  is '��� ��������';
comment on column ASBC_CHECKS.checkdate
  is '���� ��������';
comment on column ASBC_CHECKS.reqcont
  is '���������� �������';
comment on column ASBC_CHECKS.checkstatus
  is '��������� �������� (0 - ��������� ������, 1 - ������� �����, 2 - ���������� ������)';
comment on column ASBC_CHECKS.ansdate
  is '���� ��������� ������';
comment on column ASBC_CHECKS.anscont
  is '���������� ������';
comment on column ASBC_CHECKS.checknumb
  is '����� ��������';
comment on column ASBC_CHECKS.subject_id
  is '�������� ���';
comment on column ASBC_CHECKS.document_id
  is '��������';
comment on column ASBC_CHECKS.nresult
  is '������� �������������� ������';
-- Create/Recreate indexes 
create index I_ASBC_CHECKS_CHECKTYPE_FK on ASBC_CHECKS (CHECKTYPE);
create index I_ASBC_CHECKS_DOCID_FK on ASBC_CHECKS (DOCUMENT_ID);
create index I_ASBC_CHECKS_SUBJID_FK on ASBC_CHECKS (SUBJECT_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_CHECKS
  add constraint C_ASBC_CHECKS_ID_PK primary key (ID);
alter table ASBC_CHECKS
  add constraint C_ASBC_CHECKS_UK unique (CHECKTYPE, CHECKNUMB);
alter table ASBC_CHECKS
  add constraint C_ASBC_CHECKS_CHECKTYPE_FK foreign key (CHECKTYPE)
  references ASBC_CHECKTYPES (ID);
alter table ASBC_CHECKS
  add constraint C_ASBC_CHECKS_DOCID_FK foreign key (DOCUMENT_ID)
  references FDC_DOCUMENT (ID) on delete set null;
alter table ASBC_CHECKS
  add constraint C_ASBC_CHECKS_SUBJID_FK foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete cascade;

--------------------------------------
--  New table asbc_checktypeparams  --
--------------------------------------
-- Create table
create table ASBC_CHECKTYPEPARAMS
(
  prn          NUMBER(17) not null,
  name         VARCHAR2(160) not null,
  type         NUMBER(1) default 0 not null,
  norder       NUMBER(3) not null,
  display_name VARCHAR2(160),
  subject_type NUMBER(1)
)
;
-- Add comments to the table 
comment on table ASBC_CHECKTYPEPARAMS
  is '��������� ��������';
-- Add comments to the columns 
comment on column ASBC_CHECKTYPEPARAMS.prn
  is '������ �� ��� ��������';
comment on column ASBC_CHECKTYPEPARAMS.name
  is '������������ ���������';
comment on column ASBC_CHECKTYPEPARAMS.type
  is '��� ������, 0 - ������, 1 - �����';
comment on column ASBC_CHECKTYPEPARAMS.norder
  is '���������� �����';
comment on column ASBC_CHECKTYPEPARAMS.display_name
  is '�������� ��� ������ � ������';
comment on column ASBC_CHECKTYPEPARAMS.subject_type
  is '0 - �������� ��� ��, 1- ��� ��, 2 - ��� ��, null - ��� ����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_CHECKTYPEPARAMS
  add constraint C_ASBC_CHECKTYPEPARAMS_FK foreign key (PRN)
  references ASBC_CHECKTYPES (ID);
alter table ASBC_CHECKTYPEPARAMS
  add constraint C_ASBC_CHECKTYPEPARAMS_UK unique (PRN, NAME, SUBJECT_TYPE);
  
--------------------------------
--  New table asbc_elrulings  --
--------------------------------
-- Create table
create table ASBC_ELRULINGS
(
  id               NUMBER(15) not null,
  rulingtype       NUMBER(1) default 0 not null,
  expirydate       DATE,
  status           NUMBER(1) default 0 not null,
  valdoc_numb      VARCHAR2(100),
  valdoc_date      DATE,
  valdoc_type      NUMBER(1) default 0,
  investigatorname VARCHAR2(60),
  investigatorpost VARCHAR2(80),
  carrier_id       NUMBER(15),
  docnumb          VARCHAR2(100),
  docdate          DATE
)
;
-- Add comments to the table 
comment on table ASBC_ELRULINGS
  is '����������� ������������� �� ��';
-- Add comments to the columns 
comment on column ASBC_ELRULINGS.rulingtype
  is '��� ������������� (0 - ������������� �� ��, 1 - ��������� ����, 2 - ������������� � ��������� �� ���� ���������, 3- �������, 4 - ��������)';
comment on column ASBC_ELRULINGS.expirydate
  is '���� ��������� ����� ������������ ������';
comment on column ASBC_ELRULINGS.status
  is '��������� (0 - ���������, 1 - ����������)';
comment on column ASBC_ELRULINGS.valdoc_numb
  is '����� ��������� � ����������� (��� 0) � ���������-��������� (��� 2 - 4)';
comment on column ASBC_ELRULINGS.valdoc_date
  is '���� ��������� � ����������� (��� 0) � ���������-��������� (��� 2-4)';
comment on column ASBC_ELRULINGS.valdoc_type
  is '��� ��������� � ����������� (0 - ��� � ����������� ���������� �������������, 1 - ��� � �������� �������������) (��� 0)';
comment on column ASBC_ELRULINGS.investigatorname
  is '��� ����������� (��� 1)';
comment on column ASBC_ELRULINGS.investigatorpost
  is '��������� ����������� (��� 1)';
comment on column ASBC_ELRULINGS.carrier_id
  is '��� � ��� - 3� ����, ��������� �������';
comment on column ASBC_ELRULINGS.docnumb
  is '����� ���������';
comment on column ASBC_ELRULINGS.docdate
  is '���� ���������';
-- Create/Recreate indexes 
create bitmap index I_ASBC_ELRULINGS_RULINGTYPE on ASBC_ELRULINGS (RULINGTYPE);
create bitmap index I_ASBC_ELRULINGS_STATUS on ASBC_ELRULINGS (STATUS);
create bitmap index I_ASBC_ELRULINGS_VALDOC_TYPE on ASBC_ELRULINGS (VALDOC_TYPE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_ELRULINGS
  add constraint C_ASBC_ELRULINGS_PK primary key (ID);
alter table ASBC_ELRULINGS
  add constraint C_ASBC_ELRULINGS_CARRIER_FK foreign key (CARRIER_ID)
  references FDC_SUBJECT (ID);

----------------------------------------------
--  New table asbc_elrulings_criminal_case  --
----------------------------------------------
-- Create table
create table ASBC_ELRULINGS_CRIMINAL_CASE
(
  id NUMBER(15)
)
;
-- Add comments to the table 
comment on table ASBC_ELRULINGS_CRIMINAL_CASE
  is '���������� ������� ''������ ���������-����������'' - ��������� ����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_ELRULINGS_CRIMINAL_CASE
  add constraint C_ASBC_ELRULINGS_CRIM_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

-----------------------------------------
--  New table asbc_elrulings_property  --
-----------------------------------------
-- Create table
create table ASBC_ELRULINGS_PROPERTY
(
  id NUMBER(15)
)
;
-- Add comments to the table 
comment on table ASBC_ELRULINGS_PROPERTY
  is '���������� ������� ''������ ���������-����������'' - ���������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_ELRULINGS_PROPERTY
  add constraint C_ASBC_ELRULINGS_PROP_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

-------------------------------------------
--  New table asbc_elrulings_resolution  --
-------------------------------------------
-- Create table
create table ASBC_ELRULINGS_RESOLUTION
(
  id NUMBER(15)
)
;
-- Add comments to the table 
comment on table ASBC_ELRULINGS_RESOLUTION
  is '���������� ������� ''������ ���������-����������'' - ������������� �� ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_ELRULINGS_RESOLUTION
  add constraint C_ASBC_ELRULINGS_RES_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

-------------------------------
--  New table asbc_interact  --
-------------------------------
-- Create table
create table ASBC_INTERACT
(
  rn      NUMBER(17) not null,
  code    VARCHAR2(20),
  name    VARCHAR2(240) not null,
  type    NUMBER(1) default 0 not null,
  soft_id NUMBER(15) not null
)
;
-- Add comments to the table 
comment on table ASBC_INTERACT
  is '�������� ��������������';
-- Add comments to the columns 
comment on column ASBC_INTERACT.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACT.code
  is '���';
comment on column ASBC_INTERACT.name
  is '������������';
comment on column ASBC_INTERACT.type
  is '��� (0-����������, 1-�������)';
comment on column ASBC_INTERACT.soft_id
  is '������������� ������������ �����������';
-- Create/Recreate indexes 
create index I_ASBC_INTERACT_SOFT_ID_FK on ASBC_INTERACT (SOFT_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_INTERACT
  add constraint C_ASBC_INTERACTION_RN_PK primary key (RN);
alter table ASBC_INTERACT
  add constraint C_ASBC_INTERACTION_CODE_PK unique (CODE);
alter table ASBC_INTERACT
  add constraint C_ASBC_INTERACTION_NAME_PK unique (NAME);
alter table ASBC_INTERACT
  add constraint C_ASBC_INTERACT_RN_FK foreign key (RN)
  references FDC_OBJECT (ID) on delete cascade;
alter table ASBC_INTERACT
  add constraint C_ASBC_INTERACT_SOFT_ID_FK foreign key (SOFT_ID)
  references FDC_DICT (ID);

---------------------------------------
--  New table asbc_interactmsgtypes  --
---------------------------------------
-- Create table
create table ASBC_INTERACTMSGTYPES
(
  rn        NUMBER(17) not null,
  prn       NUMBER(17) not null,
  code      VARCHAR2(30) not null,
  descr     VARCHAR2(240) not null,
  direction NUMBER(1) default 0 not null,
  execproc  VARCHAR2(100)
)
;
-- Add comments to the table 
comment on table ASBC_INTERACTMSGTYPES
  is '���� ��������������';
-- Add comments to the columns 
comment on column ASBC_INTERACTMSGTYPES.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACTMSGTYPES.prn
  is '������ �� ��������';
comment on column ASBC_INTERACTMSGTYPES.code
  is '���';
comment on column ASBC_INTERACTMSGTYPES.descr
  is '��������';
comment on column ASBC_INTERACTMSGTYPES.direction
  is '��� (0-��������,1-���������)';
comment on column ASBC_INTERACTMSGTYPES.execproc
  is '����������� ���������';
-- Create/Recreate indexes 
create index I_ASBC_INTERACTMSGTYPES_PRN_FK on ASBC_INTERACTMSGTYPES (PRN);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_RN_PK primary key (RN);
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_UK unique (CODE, DIRECTION);
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_RN_FK foreign key (RN)
  references FDC_OBJECT (ID) on delete cascade;

-------------------------------------
--  New table asbc_interactqueues  --
-------------------------------------
-- Create table
create table ASBC_INTERACTQUEUES
(
  rn       NUMBER(17) not null,
  prn      NUMBER(17) not null,
  custcode VARCHAR2(8),
  type     NUMBER(1) default 0 not null,
  manager  VARCHAR2(30) not null,
  host     VARCHAR2(30),
  port     VARCHAR2(10),
  channel  VARCHAR2(30),
  queue    VARCHAR2(30) not null,
  ccsid    NUMBER(5) not null
)
;
-- Add comments to the table 
comment on table ASBC_INTERACTQUEUES
  is '������� ��������������';
-- Add comments to the columns 
comment on column ASBC_INTERACTQUEUES.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACTQUEUES.prn
  is '������ �� ��������';
comment on column ASBC_INTERACTQUEUES.custcode
  is '���������� �����';
comment on column ASBC_INTERACTQUEUES.type
  is '��� (0-��������,1-���������)';
comment on column ASBC_INTERACTQUEUES.manager
  is '��������';
comment on column ASBC_INTERACTQUEUES.host
  is '����';
comment on column ASBC_INTERACTQUEUES.port
  is '����';
comment on column ASBC_INTERACTQUEUES.channel
  is '�����';
comment on column ASBC_INTERACTQUEUES.queue
  is '�������';
comment on column ASBC_INTERACTQUEUES.ccsid
  is '���������';
-- Create/Recreate indexes 
create index I_ASBC_INTERACTQUEUES_PRN_FK on ASBC_INTERACTQUEUES (PRN);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_RN_PK primary key (RN);
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_UK unique (PRN, MANAGER, QUEUE);
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_RN_FK foreign key (RN)
  references FDC_OBJECT (ID) on delete cascade;
-- Create/Recreate check constraints 
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTREACTQUEUES_NN
  check (TYPE = 0 and HOST is not null and PORT is not null and CHANNEL is not null or
TYPE = 1);

-----------------------------------
--  New table asbc_interact_log  --
-----------------------------------
-- Create table
create table ASBC_INTERACT_LOG
(
  rn            NUMBER(17) not null,
  prn           NUMBER(17),
  authid        VARCHAR2(30) not null,
  data          CLOB not null,
  code          VARCHAR2(30),
  type          NUMBER(1) not null,
  state         NUMBER(1) default 0 not null,
  envid         VARCHAR2(40),
  sender        VARCHAR2(8),
  receiver      VARCHAR2(8),
  recipient_to  VARCHAR2(8),
  formdate      DATE not null,
  firstsenddate DATE,
  lastsenddate  DATE,
  errmsg        CLOB,
  document      NUMBER(17)
)
;
-- Add comments to the table 
comment on table ASBC_INTERACT_LOG
  is '��� ����������������� � ����������� ��������������';
-- Add comments to the columns 
comment on column ASBC_INTERACT_LOG.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACT_LOG.prn
  is '������ �� ��������';
comment on column ASBC_INTERACT_LOG.authid
  is '������������';
comment on column ASBC_INTERACT_LOG.data
  is '������';
comment on column ASBC_INTERACT_LOG.code
  is '��� ���������';
comment on column ASBC_INTERACT_LOG.type
  is '���(0-��������, 1-���������)';
comment on column ASBC_INTERACT_LOG.state
  is '���������(0-��������/�����������, 1-���������/���������,2-���������� � �������)';
comment on column ASBC_INTERACT_LOG.envid
  is 'GUID ��������';
comment on column ASBC_INTERACT_LOG.sender
  is '�������-�����������';
comment on column ASBC_INTERACT_LOG.receiver
  is '�������-����������';
comment on column ASBC_INTERACT_LOG.recipient_to
  is '�������-�������';
comment on column ASBC_INTERACT_LOG.formdate
  is '���� ������������/��������';
comment on column ASBC_INTERACT_LOG.firstsenddate
  is '���� ������ ��������';
comment on column ASBC_INTERACT_LOG.lastsenddate
  is '���� ��������� ��������';
comment on column ASBC_INTERACT_LOG.errmsg
  is '������';
comment on column ASBC_INTERACT_LOG.document
  is '��������';
-- Create/Recreate indexes 
create index I_ASBC_INTERACT_LOG_DOCUMENT on ASBC_INTERACT_LOG (DOCUMENT);
create index I_ASBC_INTERACT_LOG_ENVID on ASBC_INTERACT_LOG (ENVID);
create index I_ASBC_INTERACT_LOG_FORMDATE on ASBC_INTERACT_LOG (FORMDATE);
create index I_ASBC_INTERACT_LOG_PRN_FK on ASBC_INTERACT_LOG (PRN);
create index I_ASBC_INTERACT_LOG_RECEIVER on ASBC_INTERACT_LOG (RECEIVER);
create index I_ASBC_INTERACT_LOG_TS on ASBC_INTERACT_LOG (TYPE, STATE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_INTERACT_LOG
  add constraint C_ASBC_INTERACT_LOG_RN_PK primary key (RN);
alter table ASBC_INTERACT_LOG
  add constraint C_ASBC_INTERACT_LOG_PRN_FK foreign key (PRN)
  references ASBC_INTERACT_LOG (RN);

----------------------------------------
--  New table asbc_interact_log_docs  --
----------------------------------------
-- Create table
create table ASBC_INTERACT_LOG_DOCS
(
  rn        NUMBER(17) not null,
  prn       NUMBER(17) not null,
  object_id NUMBER(17) not null
)
;
-- Add comments to the table 
comment on table ASBC_INTERACT_LOG_DOCS
  is '������ �������������� (���������)';
-- Add comments to the columns 
comment on column ASBC_INTERACT_LOG_DOCS.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACT_LOG_DOCS.prn
  is '������ �� ��������';
comment on column ASBC_INTERACT_LOG_DOCS.object_id
  is '������ �� ������ ���������';
-- Create/Recreate indexes 
create index I_ASBC_INTERACT_LOG_D_OID_FK on ASBC_INTERACT_LOG_DOCS (OBJECT_ID);
create index I_ASBC_INTERACT_LOG_D_PRN_FK on ASBC_INTERACT_LOG_DOCS (PRN);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_INTERACT_LOG_DOCS
  add constraint C_ASBC_INTERACT_LOG_D_PK primary key (RN);
alter table ASBC_INTERACT_LOG_DOCS
  add constraint C_ASBC_INTERACT_LOG_D_UK unique (PRN, OBJECT_ID);
alter table ASBC_INTERACT_LOG_DOCS
  add constraint C_ASBC_INTERACT_LOG_D_OID_FK foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table ASBC_INTERACT_LOG_DOCS
  add constraint C_ASBC_INTERACT_LOG_D_PRN_FK foreign key (PRN)
  references ASBC_INTERACT_LOG (RN) on delete cascade;

------------------------------
--  New table asbc_valuesp  --
------------------------------
-- Create table
create table ASBC_VALUESP
(
  ref_value_id  NUMBER(15) not null,
  custcode      VARCHAR2(8),
  authid        VARCHAR2(40),
  stringvalue   VARCHAR2(160),
  numvalue      NUMBER,
  datetimevalue DATE
)
;
-- Add comments to the table 
comment on table ASBC_VALUESP
  is '��������� (��������)';
-- Add comments to the columns 
comment on column ASBC_VALUESP.ref_value_id
  is '������ �� ��������';
comment on column ASBC_VALUESP.custcode
  is '����';
comment on column ASBC_VALUESP.authid
  is '������� ������';
comment on column ASBC_VALUESP.stringvalue
  is '��������� ��������';
comment on column ASBC_VALUESP.numvalue
  is '�������� ��������';
comment on column ASBC_VALUESP.datetimevalue
  is '�������� ����/�����';
-- Create/Recreate indexes 
create index I_ASBC_VALUESP_AUTHID on ASBC_VALUESP (AUTHID);
create index I_ASBC_VALUESP_CUSTCODE on ASBC_VALUESP (CUSTCODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_UK unique (REF_VALUE_ID, CUSTCODE, AUTHID);
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_REF_VALUE_ID_FK foreign key (REF_VALUE_ID)
  references FDC_VALUE (ID) on delete cascade;
-- Create/Recreate check constraints 
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_CUSTUSER_CHK
  check (CUSTCODE IS NOT NULL OR AUTHID IS NOT NULL);
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_VALUE_CHK
  check (STRINGVALUE IS NOT NULL AND NUMVALUE IS NULL AND DATETIMEVALUE IS NULL OR NUMVALUE IS NOT NULL AND STRINGVALUE IS NULL AND DATETIMEVALUE IS NULL OR DATETIMEVALUE IS NOT NULL AND STRINGVALUE IS NULL AND NUMVALUE IS NULL);

------------------------------------
--  New table dbf_asbc_elrulings  --
------------------------------------
-- Create table
create table DBF_ASBC_ELRULINGS
(
  tpo_number VARCHAR2(10) not null,
  order_type VARCHAR2(1),
  ext_list   VARCHAR2(3),
  cod_tam    VARCHAR2(3),
  cod_tamp   VARCHAR2(2),
  day_tpo    VARCHAR2(2),
  mon_tpo    VARCHAR2(2),
  jar_tpo    VARCHAR2(4),
  num_mpo    VARCHAR2(13),
  idpayer    VARCHAR2(40),
  kodval     VARCHAR2(3),
  tovcost_pl NUMBER,
  sum_rub    NUMBER,
  fiotam     VARCHAR2(20),
  fiokas     VARCHAR2(20),
  curs_usd   NUMBER,
  curs_eku   NUMBER,
  regim      VARCHAR2(2),
  meth_move  VARCHAR2(2),
  curs_val   NUMBER,
  dat_curs   DATE,
  signprt    NUMBER(5),
  annul      NUMBER(5),
  datecheck  DATE,
  depozit    NUMBER(5),
  sign_pass  NUMBER(5),
  dop_inf1   VARCHAR2(48),
  dop_inf2   VARCHAR2(48),
  dop_inf3   VARCHAR2(60),
  pod1       VARCHAR2(16),
  pod2       VARCHAR2(50),
  pod3       VARCHAR2(16),
  pod4       VARCHAR2(16),
  pod5       VARCHAR2(50),
  pod6       VARCHAR2(16),
  pod7       VARCHAR2(16),
  pod8       VARCHAR2(16),
  sign_pay   NUMBER(5),
  codcountry VARCHAR2(3),
  oplval     NUMBER,
  oplrub     NUMBER,
  dateout    DATE,
  dategnivz  DATE,
  annul_tpo  VARCHAR2(26),
  dep_tpo    VARCHAR2(26),
  vertpo     NUMBER,
  sprub      VARCHAR2(2),
  spval      VARCHAR2(2),
  datvypbank DATE,
  nazntov    VARCHAR2(1),
  famurlic   VARCHAR2(70),
  dat_annul  DATE,
  sign_corr  VARCHAR2(1),
  schet      VARCHAR2(20),
  signvar    VARCHAR2(5),
  code       VARCHAR2(8),
  pr_privil  VARCHAR2(1),
  tovcost_al NUMBER,
  weight_al  NUMBER,
  numpts     VARCHAR2(11),
  load_id    INTEGER,
  id         INTEGER,
  pod9       VARCHAR2(16),
  pod10      VARCHAR2(50),
  pod11      VARCHAR2(16),
  pod12      VARCHAR2(16),
  pod13      VARCHAR2(50),
  pod14      VARCHAR2(16),
  sp3        VARCHAR2(2),
  opl3       NUMBER(15,2),
  sp4        VARCHAR2(2),
  opl4       NUMBER(15,2),
  kodval3    VARCHAR2(3),
  curs_val3  NUMBER(12,4),
  dat_curs3  DATE,
  kodval4    NUMBER(15,2),
  curs_val4  NUMBER(12,4),
  dat_curs4  DATE,
  idpayer2   VARCHAR2(40) default '---',
  typ_payer2 VARCHAR2(1),
  reg_cntr   VARCHAR2(3),
  reg_tdoc   VARCHAR2(3),
  reg_num    VARCHAR2(26),
  reg_ddoc   DATE,
  reg_cdec   VARCHAR2(1),
  vid_trans  VARCHAR2(2),
  blank_ver  VARCHAR2(1)
)
;
-- Add comments to the columns 
COMMENT ON TABLE DBF_ASBC_ELRULINGS IS '������� DBF_ASBC_ELRULINGS';
COMMENT ON COLUMN DBF_ASBC_ELRULINGS.ID IS 'ID';
COMMENT ON COLUMN DBF_ASBC_ELRULINGS.LOAD_ID IS 'LOAD_ID';
COMMENT ON COLUMN DBF_ASBC_ELRULINGS.NUMPTS IS 'NUMPTS';
comment on column DBF_ASBC_ELRULINGS.tpo_number
  is '������������ ����� ���';
comment on column DBF_ASBC_ELRULINGS.order_type
  is '��� ������';
comment on column DBF_ASBC_ELRULINGS.ext_list
  is '���������� ���������� ������';
comment on column DBF_ASBC_ELRULINGS.cod_tam
  is '��� �������';
comment on column DBF_ASBC_ELRULINGS.cod_tamp
  is '��� ����������� �����';
comment on column DBF_ASBC_ELRULINGS.day_tpo
  is '����';
comment on column DBF_ASBC_ELRULINGS.mon_tpo
  is '�����';
comment on column DBF_ASBC_ELRULINGS.jar_tpo
  is '���';
comment on column DBF_ASBC_ELRULINGS.num_mpo
  is '����� ���';
comment on column DBF_ASBC_ELRULINGS.idpayer
  is '������������� ����������� (��� ��.��� ?';
comment on column DBF_ASBC_ELRULINGS.kodval
  is '��� ������ �������';
comment on column DBF_ASBC_ELRULINGS.tovcost_pl
  is '���������� ���������';
comment on column DBF_ASBC_ELRULINGS.sum_rub
  is '����� ����� �� ��� � ���.';
comment on column DBF_ASBC_ELRULINGS.fiotam
  is '������� �������������� �� ���������� ���';
comment on column DBF_ASBC_ELRULINGS.fiokas
  is '������� �������';
comment on column DBF_ASBC_ELRULINGS.curs_usd
  is '���� �������';
comment on column DBF_ASBC_ELRULINGS.curs_eku
  is '���� ����';
comment on column DBF_ASBC_ELRULINGS.regim
  is '��� ����������� ������ �� ���';
comment on column DBF_ASBC_ELRULINGS.meth_move
  is '������ �����������';
comment on column DBF_ASBC_ELRULINGS.curs_val
  is '���� ������ ������� � �����';
comment on column DBF_ASBC_ELRULINGS.dat_curs
  is '���� ��������� ������ �����';
comment on column DBF_ASBC_ELRULINGS.signprt
  is '������� ������';
comment on column DBF_ASBC_ELRULINGS.annul
  is '������� ������������� ���';
comment on column DBF_ASBC_ELRULINGS.datecheck
  is '���� �������� ���';
comment on column DBF_ASBC_ELRULINGS.depozit
  is '������� "�����������" ���';
comment on column DBF_ASBC_ELRULINGS.sign_pass
  is '������� �������� ���';
comment on column DBF_ASBC_ELRULINGS.dop_inf1
  is '1-�� ������ ���. ����������';
comment on column DBF_ASBC_ELRULINGS.dop_inf2
  is '2-�� ������ ���. ����������';
comment on column DBF_ASBC_ELRULINGS.dop_inf3
  is '3-�� ������ ���. ����������';
comment on column DBF_ASBC_ELRULINGS.pod1
  is '��� ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod2
  is '� ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod3
  is '���� ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod4
  is '��� ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod5
  is '�  ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod6
  is '���� ���������� ��������� � ������';
comment on column DBF_ASBC_ELRULINGS.pod7
  is '�������������� ���������� ��� ����������';
comment on column DBF_ASBC_ELRULINGS.pod8
  is '�������������� ���������� ��� ����������';
comment on column DBF_ASBC_ELRULINGS.sign_pay
  is '������� ������ (1 ? ��������, 0 ? �� ���';
comment on column DBF_ASBC_ELRULINGS.codcountry
  is '��� ������  ������������� ������';
comment on column DBF_ASBC_ELRULINGS.oplval
  is '�������� � ������';
comment on column DBF_ASBC_ELRULINGS.oplrub
  is '�������� � ������';
comment on column DBF_ASBC_ELRULINGS.dateout
  is '���� �������� (� ����������� ����������';
comment on column DBF_ASBC_ELRULINGS.dategnivz
  is '���� �������� (� �����)';
comment on column DBF_ASBC_ELRULINGS.annul_tpo
  is '������������ ���';
comment on column DBF_ASBC_ELRULINGS.dep_tpo
  is '����������  ?����������? ���';
comment on column DBF_ASBC_ELRULINGS.vertpo
  is '������ ��� ?���-�?, � ������� ����������';
comment on column DBF_ASBC_ELRULINGS.sprub
  is '������ ������� � ������';
comment on column DBF_ASBC_ELRULINGS.spval
  is '������ ������� � ������';
comment on column DBF_ASBC_ELRULINGS.datvypbank
  is '���� ������� �� �����';
comment on column DBF_ASBC_ELRULINGS.nazntov
  is '���������� ������';
comment on column DBF_ASBC_ELRULINGS.famurlic
  is '������� ����������� ����, ���������� ��';
comment on column DBF_ASBC_ELRULINGS.dat_annul
  is '���� ������������� ���';
comment on column DBF_ASBC_ELRULINGS.sign_corr
  is '������� ������������� ���
 ?1? - ������';
comment on column DBF_ASBC_ELRULINGS.schet
  is '���������';
comment on column DBF_ASBC_ELRULINGS.signvar
  is '��������� ��������';
comment on column DBF_ASBC_ELRULINGS.code
  is '��� ����������� ������ (8-�������), ����';
comment on column DBF_ASBC_ELRULINGS.pr_privil
  is '������� ������
1-����������� � �� �� ���';
comment on column DBF_ASBC_ELRULINGS.tovcost_al
  is '������ ��������� ������ � �������� ���';
comment on column DBF_ASBC_ELRULINGS.weight_al
  is '������ ��� ������';
comment on column DBF_ASBC_ELRULINGS.pod9
  is '��� ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.pod10
  is '� ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.pod11
  is '���� ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.pod12
  is '��� ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.pod13
  is '�  ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.pod14
  is '���� ���������� ���������';
comment on column DBF_ASBC_ELRULINGS.sp3
  is '������ �������';
comment on column DBF_ASBC_ELRULINGS.opl3
  is '��������';
comment on column DBF_ASBC_ELRULINGS.sp4
  is '������ �������';
comment on column DBF_ASBC_ELRULINGS.opl4
  is '��������';
comment on column DBF_ASBC_ELRULINGS.kodval3
  is '��� ������ �������';
comment on column DBF_ASBC_ELRULINGS.curs_val3
  is '���� ������ ������� � �����';
comment on column DBF_ASBC_ELRULINGS.dat_curs3
  is '���� ��������� ������ �����';
comment on column DBF_ASBC_ELRULINGS.kodval4
  is '��� ������ �������';
comment on column DBF_ASBC_ELRULINGS.curs_val4
  is '���� ������ ������� � �����';
comment on column DBF_ASBC_ELRULINGS.dat_curs4
  is '���� ��������� ������ �����';
comment on column DBF_ASBC_ELRULINGS.idpayer2
  is '������������� �������� ���� (��� ��.���';
comment on column DBF_ASBC_ELRULINGS.typ_payer2
  is '��� �������� ���� (���������� ����������';
comment on column DBF_ASBC_ELRULINGS.reg_cntr
  is '��� ������, ���������� ���������� ������';
comment on column DBF_ASBC_ELRULINGS.reg_tdoc
  is '��� ��������� (��, ���)';
comment on column DBF_ASBC_ELRULINGS.reg_num
  is '���������� ����� ��������� ������, �����';
comment on column DBF_ASBC_ELRULINGS.reg_ddoc
  is '���� ���������� ���������� ��� ���';
comment on column DBF_ASBC_ELRULINGS.reg_cdec
  is '������� �������������� ����� ��������� �';
comment on column DBF_ASBC_ELRULINGS.vid_trans
  is '��� ���� ����������, ������������� ��� ����������� ������';
comment on column DBF_ASBC_ELRULINGS.blank_ver
  is '������ ������';
-- Create/Recreate indexes 
create index DBF_ASBC_ELRULINGS_LOAD_ID on DBF_ASBC_ELRULINGS (LOAD_ID);
create index IDX_DBF_ASBC_ELRULINGS_IDPAYER on DBF_ASBC_ELRULINGS (IDPAYER);
create index IDX_DBF_ASBC_ELR_IDPAYER2 on DBF_ASBC_ELRULINGS (IDPAYER2);
-- Create/Recreate primary, unique and foreign key constraints 
alter table DBF_ASBC_ELRULINGS
  add constraint DBF_ASBC_ELRULINGS_PK primary key (TPO_NUMBER);
  
------------------------------------
--  Changed table fdc_doc_charge  --
------------------------------------
-- Add/modify columns 
alter table FDC_DOC_CHARGE add uin VARCHAR2(36);
-- Add comments to the columns 
comment on column FDC_DOC_CHARGE.uin
  is '���������� ������������� ����������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FDC_DOC_CHARGE
  add constraint FK#FDC_DOC_CHARGE#UIN unique (UIN);

  -------------------------------------------
--  Changed table fdc_nsi_declarant_els  --
-------------------------------------------
-- Add comments to the table 
comment on table FDC_NSI_DECLARANT_ELS
  is '��������� ��� � ���';
-- Add comments to the columns 
comment on column FDC_NSI_DECLARANT_ELS.date_begin
  is '���� �������� �� ���';
comment on column FDC_NSI_DECLARANT_ELS.date_end
  is '���� ������ �� ���';
comment on column FDC_NSI_DECLARANT_ELS.note
  is '����������';
  
COMMENT ON COLUMN ASBC_ELRULINGS.ID IS 'ID';
COMMENT ON COLUMN ASBC_ELRULINGS_RESOLUTION.ID IS 'ID';
COMMENT ON COLUMN ASBC_ELRULINGS_PROPERTY.ID IS 'ID';
COMMENT ON COLUMN ASBC_ELRULINGS_CRIMINAL_CASE.ID IS 'ID';
COMMENT ON COLUMN ASBC_CHECKTYPES.ID IS 'ID';
COMMENT ON COLUMN ASBC_CHECKS.ID IS 'ID';

--------------------------------------------
--  New table fdc_reestr_gnotice_kindpay  --
--------------------------------------------
-- Create table
create table FDC_REESTR_GNOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
-- Add comments to the table 
comment on table FDC_REESTR_GNOTICE_KINDPAY
  is '������ ����������� �� ��������� ���� ������� �����������';
-- Add comments to the columns 
comment on column FDC_REESTR_GNOTICE_KINDPAY.id
  is '������������� �������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FDC_REESTR_GNOTICE_KINDPAY
  add constraint XPKFDC_REESTR_GNOTICE_KINDPAY primary key (ID);
alter table FDC_REESTR_GNOTICE_KINDPAY
  add foreign key (ID)
  references FDC_REESTR_SPECIFY_KINDPAY (ID) on delete cascade;

----------------------------
--  Changed table fdc_tr  --
----------------------------
-- Add/modify columns 
alter table FDC_TR add trtype NUMBER(1) default 0 not null;
alter table FDC_TR add sign_genprov NUMBER(1) default 0 not null;
alter table FDC_TR add sign_corr NUMBER(1) default 0 not null;
-- Add comments to the columns 
comment on column FDC_TR.trtype
  is '0 � �������, 1 - �����������';
comment on column FDC_TR.sign_genprov
  is '������� ������������ ����������� (0 � ���, 1 - ��)';
comment on column FDC_TR.sign_corr
  is '������� ������������� (0 � ���, 1 - ��)';
  

-------------------------------------
--  Changed table fdc_unload_vurp  --
-------------------------------------
-- Create/Recreate check constraints 
alter table FDC_UNLOAD_VURP
  drop constraint FVN_DOCCODE_CHK;
alter table FDC_UNLOAD_VURP
  add constraint FVN_DOCCODE_CHK
  check ((DOCCODE IN ('�����','�����')));
  
-------------------------------
--  Changed table fdc_value  --
-------------------------------
-- Add/modify columns 
alter table FDC_VALUE add locality NUMBER(1) default 0 not null;
-- Add comments to the columns 
comment on column FDC_VALUE.locality
  is '������� ����������� (0 - ��, 1 - ��, 2 - ������������)';
-- Create/Recreate indexes 
create bitmap index I_FDC_VALUE_LOCALITY on FDC_VALUE (LOCALITY);

-------------------------------------
--  Changed table fdc_custom_decl  --
-------------------------------------
-- Create/Recreate check constraints 
alter table FDC_CUSTOM_DECL
  drop constraint CUST_DECL_DIRECTION12;
alter table FDC_CUSTOM_DECL
  add constraint CUST_DECL_DIRECTION12
  check (G011 IN ('��', '��'));
--
-- �������� ������� "ERR_NUM" ��� ������� "FDC_EH_ERROR_CODE"
--
ALTER TABLE FDC_EH_ERROR_CODE
  MODIFY(ERR_NUM VARCHAR2(11));

CREATE TYPE TA_INTEGER AS
    TABLE OF INTEGER;
/
CREATE TYPE TA_VC_32 AS
    TABLE OF VARCHAR2(32);
/

  
prompt -- ������ 4.6.0 (End) 
prompt 
prompt 
