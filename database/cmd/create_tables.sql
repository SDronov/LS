prompt
prompt Creating table ASBC_CHECKTYPES
prompt ==============================
prompt
create table ASBC_CHECKTYPES
(
  id     NUMBER(17) not null,
  code   VARCHAR2(20) not null,
  name   VARCHAR2(160) not null,
  action VARCHAR2(50)
)
;
comment on table ASBC_CHECKTYPES
  is '���� ��������';
comment on column ASBC_CHECKTYPES.id
  is 'ID';
comment on column ASBC_CHECKTYPES.code
  is '���';
comment on column ASBC_CHECKTYPES.name
  is '������������';
comment on column ASBC_CHECKTYPES.action
  is '����������� ������ ��';
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_ID_PK primary key (ID);
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_CODE_UK unique (CODE);
alter table ASBC_CHECKTYPES
  add constraint C_ASBC_CHECKTYPES_NAME_UK unique (NAME);

prompt
prompt Creating table FDC_OBJECT
prompt =========================
prompt
create table FDC_OBJECT
(
  id              NUMBER(15) not null,
  object_type_id  NUMBER(15) not null,
  state_id        NUMBER(15),
  name            VARCHAR2(1500),
  shortname       VARCHAR2(1500),
  sysname         VARCHAR2(1500),
  descript        VARCHAR2(1500),
  accesslevel     NUMBER(1) default 2 not null,
  owner_object_id NUMBER(15),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15)
)
;
comment on table FDC_OBJECT
  is '����� ���������� ������ �������. ��� ������� ������� ����������� �� �������.';
comment on column FDC_OBJECT.id
  is 'ID';
comment on column FDC_OBJECT.object_type_id
  is 'OBJECT_TYPE_ID';
comment on column FDC_OBJECT.state_id
  is 'STATE_ID';
comment on column FDC_OBJECT.name
  is 'NAME';
comment on column FDC_OBJECT.shortname
  is 'SHORTNAME';
comment on column FDC_OBJECT.sysname
  is 'SYSNAME';
comment on column FDC_OBJECT.descript
  is 'DESCRIPT';
comment on column FDC_OBJECT.accesslevel
  is '0 - ��� �������
1 - ������ ������
2 - ���������
3 - ��������� ���� �������';
comment on column FDC_OBJECT.owner_object_id
  is 'OWNER_OBJECT_ID';
comment on column FDC_OBJECT.ext_source
  is 'EXT_SOURCE';
comment on column FDC_OBJECT.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column FDC_OBJECT.ext_id
  is '�������� ������: 8-�� ���������� ��� ������� ';
create index FDC#IDX#OBJECT#OWNER_TYPE on FDC_OBJECT (ID, OWNER_OBJECT_ID, OBJECT_TYPE_ID);
create index FDC#IDX#OBJECT#SYSNAME on FDC_OBJECT (ID, SYSNAME);
create index FDC_OBJECT_IE1 on FDC_OBJECT (NAME);
create index FDC_OBJECT_IF170 on FDC_OBJECT (OBJECT_TYPE_ID);
create index FDC_OBJECT_IF236 on FDC_OBJECT (STATE_ID);
create index FDC_OBJECT_IF65 on FDC_OBJECT (OWNER_OBJECT_ID);
create index FDC_OBJECT_SYSNAME on FDC_OBJECT (SYSNAME);
create index FDC_OBJECT_UPPERNAME on FDC_OBJECT (UPPER(NAME));
create index FDC_OBJECT_UPPERSYSNAME on FDC_OBJECT (UPPER(SYSNAME));
alter table FDC_OBJECT
  add constraint FDC_OBJECT_PK primary key (ID);
alter table FDC_OBJECT
  add constraint FDC_OBJECT_AK unique (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);
alter table FDC_OBJECT
  add constraint OBJECT_OWNER_OBJECT_ID foreign key (OWNER_OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_OBJECT
  add constraint ACCESSLEVELANY4
  check ((AccessLevel >= 0) AND (AccessLevel < 4));

prompt
prompt Creating table FDC_STATE_SCHEME
prompt ===============================
prompt
create table FDC_STATE_SCHEME
(
  id NUMBER(15) not null
)
;
comment on table FDC_STATE_SCHEME
  is '����� ���������, ���������� ��� ������� ������� ����. ��������� ����� ����� ����� ���������� �����.';
comment on column FDC_STATE_SCHEME.id
  is 'ID';
alter table FDC_STATE_SCHEME
  add constraint FDC_STATE_SCHEME_PK primary key (ID);
alter table FDC_STATE_SCHEME
  add constraint STATE_SCHEME_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_OBJECT_TYPE
prompt ==============================
prompt
create table FDC_OBJECT_TYPE
(
  id                       NUMBER(15) not null,
  name                     VARCHAR2(1500) not null,
  shortname                VARCHAR2(1500),
  sysname                  VARCHAR2(1500) not null,
  tablename                VARCHAR2(1500),
  icon                     VARCHAR2(4000),
  state_scheme_id          NUMBER(15),
  parent_object_type_id    NUMBER(15),
  del_procedure_id         NUMBER(15),
  objecttableinstance      NUMBER(1) default 1 not null,
  serialization_function   VARCHAR2(100),
  deserialization_function VARCHAR2(100)
)
;
comment on table FDC_OBJECT_TYPE
  is '������������� ����� ���������� ������ �������, ���������� �������� � ���, ����� ��������� � �.�.';
comment on column FDC_OBJECT_TYPE.id
  is 'ID';
comment on column FDC_OBJECT_TYPE.name
  is 'NAME';
comment on column FDC_OBJECT_TYPE.shortname
  is 'SHORTNAME';
comment on column FDC_OBJECT_TYPE.sysname
  is 'SYSNAME';
comment on column FDC_OBJECT_TYPE.tablename
  is 'TABLENAME';
comment on column FDC_OBJECT_TYPE.icon
  is 'ICON';
comment on column FDC_OBJECT_TYPE.state_scheme_id
  is 'STATE_SCHEME_ID';
comment on column FDC_OBJECT_TYPE.parent_object_type_id
  is 'PARENT_OBJECT_TYPE_ID';
comment on column FDC_OBJECT_TYPE.del_procedure_id
  is 'DEL_PROCEDURE_ID';
comment on column FDC_OBJECT_TYPE.objecttableinstance
  is '������ ����� ���������� � ������� FDC_OBJECT (������)';
comment on column FDC_OBJECT_TYPE.serialization_function
  is '������� ������������';
comment on column FDC_OBJECT_TYPE.deserialization_function
  is 'DESERIALIZATION_FUNCTION';
create index FDC_OBJECT_TYPE_ID_PARENT_IDX on FDC_OBJECT_TYPE (ID, PARENT_OBJECT_TYPE_ID);
create index FDC_OBJECT_TYPE_IF237 on FDC_OBJECT_TYPE (STATE_SCHEME_ID);
create index FDC_OBJECT_TYPE_IF61 on FDC_OBJECT_TYPE (PARENT_OBJECT_TYPE_ID);
create index FDC_OBJECT_TYPE_IF62 on FDC_OBJECT_TYPE (DEL_PROCEDURE_ID);
create index FDC_OBJECT_TYPE_UPPERNAME on FDC_OBJECT_TYPE (UPPER(NAME));
create index FDC_OBJECT_TYPE_UPPERSYSNAME on FDC_OBJECT_TYPE (UPPER(SYSNAME));
alter table FDC_OBJECT_TYPE
  add constraint FDC_OBJECT_TYPE_PK primary key (ID);
alter table FDC_OBJECT_TYPE
  add constraint FDC_OBJECT_TYPE_NAME unique (NAME);
alter table FDC_OBJECT_TYPE
  add constraint FDC_OBJECT_TYPE_SYSNAME unique (SYSNAME);
alter table FDC_OBJECT_TYPE
  add constraint OBJECT_TYPE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_OBJECT_TYPE
  add constraint OBJECT_TYPE_PARENT_OBJECT_TYPE foreign key (PARENT_OBJECT_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);
alter table FDC_OBJECT_TYPE
  add constraint OBJECT_TYPE_STATE_SCHEME_ID foreign key (STATE_SCHEME_ID)
  references FDC_STATE_SCHEME (ID);
alter table FDC_OBJECT_TYPE
  add constraint YESORNO632
  check (ObjectTableInstance IN (0, 1));
alter table FDC_OBJECT
  add constraint OBJECT_OBJECT_TYPE_ID foreign key (OBJECT_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_SYSCOMPONENT
prompt ===============================
prompt
create table FDC_SYSCOMPONENT
(
  id           NUMBER(15) not null,
  base_type_id NUMBER(15) not null
)
;
comment on table FDC_SYSCOMPONENT
  is '��������� ���������, �� ������� ����� ���������� ����� ������������  � ������ VERO. � ���� ����� ������� ��� ��������� ���������� (���������, �������������), ��� � ���������� ���������� (���������� ���������� � ��).';
comment on column FDC_SYSCOMPONENT.id
  is 'ID';
comment on column FDC_SYSCOMPONENT.base_type_id
  is 'BASE_TYPE_ID';
create index FDC_SYSCOMPONENT_IF50 on FDC_SYSCOMPONENT (BASE_TYPE_ID);
alter table FDC_SYSCOMPONENT
  add constraint FDC_SYSCOMPONENT_PK primary key (ID);
alter table FDC_SYSCOMPONENT
  add constraint SYSCOMPONENT_BASE_TYPE_ID foreign key (BASE_TYPE_ID)
  references FDC_OBJECT_TYPE (ID) on delete cascade;
alter table FDC_SYSCOMPONENT
  add constraint SYSCOMPONENT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_SERVER_COMPONENT
prompt ===================================
prompt
create table FDC_SERVER_COMPONENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_SERVER_COMPONENT
  is '��������� ���������, �� ������� ����� ����������� �����  � ������ VERO. ���� ������, ��������, ��������� ��������� � �������������.';
comment on column FDC_SERVER_COMPONENT.id
  is 'ID';
alter table FDC_SERVER_COMPONENT
  add constraint FDC_SERVER_COMPONENT_PK primary key (ID);
alter table FDC_SERVER_COMPONENT
  add constraint SERVER_COMPONENT_ID foreign key (ID)
  references FDC_SYSCOMPONENT (ID);

prompt
prompt Creating table FDC_PROCEDURE
prompt ============================
prompt
create table FDC_PROCEDURE
(
  id NUMBER(15) not null
)
;
comment on table FDC_PROCEDURE
  is '����� �������� ������������������ � ������� ��������� � �������, �� ������� ����� ��������� ����� � ������ VERO.';
comment on column FDC_PROCEDURE.id
  is 'ID';
alter table FDC_PROCEDURE
  add constraint FDC_PROCEDURE_PK primary key (ID);
alter table FDC_PROCEDURE
  add constraint PROCEDURE_ID foreign key (ID)
  references FDC_SERVER_COMPONENT (ID);
alter table FDC_OBJECT_TYPE
  add constraint OBJECT_TYPE_DEL_PROCEDURE_ID foreign key (DEL_PROCEDURE_ID)
  references FDC_PROCEDURE (ID) on delete set null;

prompt
prompt Creating table FDC_STATE
prompt ========================
prompt
create table FDC_STATE
(
  id              NUMBER(15) not null,
  state_scheme_id NUMBER(15) not null,
  color           NUMBER(15),
  active          NUMBER(1) default 0 not null,
  allowupdates    NUMBER(1) default 1,
  allowdelete     NUMBER(1) default 0
)
;
comment on table FDC_STATE
  is '��������� �������. ������ ����� ���������� � ��������� �� ��������� �����, ���������� ��� ��� ����.';
comment on column FDC_STATE.id
  is 'ID';
comment on column FDC_STATE.state_scheme_id
  is 'STATE_SCHEME_ID';
comment on column FDC_STATE.color
  is 'COLOR';
comment on column FDC_STATE.active
  is 'ACTIVE';
comment on column FDC_STATE.allowupdates
  is 'ALLOWUPDATES';
comment on column FDC_STATE.allowdelete
  is 'ALLOWDELETE';
create index FDC_STATE_IF233 on FDC_STATE (STATE_SCHEME_ID);
alter table FDC_STATE
  add constraint FDC_STATE_PK primary key (ID);
alter table FDC_STATE
  add constraint STATE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_STATE
  add constraint STATE_STATE_SCHEME_ID foreign key (STATE_SCHEME_ID)
  references FDC_STATE_SCHEME (ID);
alter table FDC_STATE
  add constraint YESORNO633
  check (Active IN (0, 1));
alter table FDC_STATE
  add constraint YESORNO634
  check (AllowUpdates IN (0, 1));
alter table FDC_STATE
  add constraint YESORNO635
  check (AllowDelete IN (0, 1));
alter table FDC_OBJECT
  add constraint OBJECT_STATE_ID foreign key (STATE_ID)
  references FDC_STATE (ID);

prompt
prompt Creating table FDC_SUBJECT
prompt ==========================
prompt
create table FDC_SUBJECT
(
  id          NUMBER(15) not null,
  address     VARCHAR2(200),
  full_name   VARCHAR2(4000),
  okpo        VARCHAR2(10),
  inn         VARCHAR2(12),
  ogrn        VARCHAR2(30),
  soato       VARCHAR2(8),
  kpp         VARCHAR2(10),
  phone       VARCHAR2(40),
  fax         VARCHAR2(30),
  telex       VARCHAR2(30),
  telegraph   VARCHAR2(100),
  teletype    VARCHAR2(100),
  first_name  VARCHAR2(100),
  last_name   VARCHAR2(100),
  middle_name VARCHAR2(100),
  crsved_id   NUMBER(15),
  asd_id      NUMBER(15),
  parent_id   NUMBER(15)
)
;
comment on table FDC_SUBJECT
  is '�������';
comment on column FDC_SUBJECT.id
  is '������������� �������';
comment on column FDC_SUBJECT.address
  is '�����';
comment on column FDC_SUBJECT.full_name
  is '������ ��������';
comment on column FDC_SUBJECT.okpo
  is '����';
comment on column FDC_SUBJECT.inn
  is '���';
comment on column FDC_SUBJECT.ogrn
  is '����';
comment on column FDC_SUBJECT.soato
  is '�����';
comment on column FDC_SUBJECT.kpp
  is '���';
comment on column FDC_SUBJECT.phone
  is '�������';
comment on column FDC_SUBJECT.fax
  is '����';
comment on column FDC_SUBJECT.telex
  is '������';
comment on column FDC_SUBJECT.telegraph
  is '��������';
comment on column FDC_SUBJECT.teletype
  is '��������';
comment on column FDC_SUBJECT.first_name
  is '���';
comment on column FDC_SUBJECT.last_name
  is '�������';
comment on column FDC_SUBJECT.middle_name
  is '��������';
comment on column FDC_SUBJECT.crsved_id
  is '������������� � ��� ������';
comment on column FDC_SUBJECT.asd_id
  is '������������� � ��� �������������';
comment on column FDC_SUBJECT.parent_id
  is '��� �������� �����������';
create index FDC_SUBJECT_ID_PARENT_IDX on FDC_SUBJECT (ID, PARENT_ID);
create index FDC_SUBJECT_OKPO on FDC_SUBJECT (OKPO);
create index FDC_SUBJECT_PARENT_ID_FK on FDC_SUBJECT (PARENT_ID);
create index FDC_SUBJECT_PARENT_ID_ID_IDX on FDC_SUBJECT (PARENT_ID, ID);
create index FDC_SUBJECT_UQQ on FDC_SUBJECT (INN, KPP);
alter table FDC_SUBJECT
  add constraint FDC_SUBJECT_PK primary key (ID);
alter table FDC_SUBJECT
  add constraint FDC#FK#SUBJECT#PARENT_ID foreign key (PARENT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_SUBJECT
  add constraint SUBJECT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_PERSONAL_ACCOUNT
prompt ===================================
prompt
create table FDC_PERSONAL_ACCOUNT
(
  id         NUMBER(15) not null,
  subject_id NUMBER(15),
  parent_id  NUMBER(15),
  sdate      DATE not null,
  edate      DATE
)
;
comment on table FDC_PERSONAL_ACCOUNT
  is '������� FDC_PERSONAL_ACCOUNT';
comment on column FDC_PERSONAL_ACCOUNT.id
  is 'ID';
comment on column FDC_PERSONAL_ACCOUNT.subject_id
  is 'SUBJECT_ID';
comment on column FDC_PERSONAL_ACCOUNT.parent_id
  is 'PARENT_ID';
comment on column FDC_PERSONAL_ACCOUNT.sdate
  is 'SDATE';
comment on column FDC_PERSONAL_ACCOUNT.edate
  is 'EDATE';
create index FDC#IDX#PARENT_ID on FDC_PERSONAL_ACCOUNT (PARENT_ID);
alter table FDC_PERSONAL_ACCOUNT
  add constraint FDC#PK#FDC_PA primary key (ID);
alter table FDC_PERSONAL_ACCOUNT
  add constraint FDC#UK#PA#SUBJECT unique (SUBJECT_ID);
alter table FDC_PERSONAL_ACCOUNT
  add constraint FDC#FK#PA#PARENT foreign key (PARENT_ID)
  references FDC_PERSONAL_ACCOUNT (ID);
alter table FDC_PERSONAL_ACCOUNT
  add constraint FDC#FK#PA#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_PERSONAL_ACCOUNT
  add constraint FDC#FK#PA_IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DOCUMENT
prompt ===========================
prompt
create table FDC_DOCUMENT
(
  id                  NUMBER(15) not null,
  doc_date            DATE,
  doc_number          VARCHAR2(100),
  is_active           CHAR(1) default 'N' not null,
  activation_date     DATE,
  is_ts               VARCHAR2(1) default 'N' not null,
  personal_account_id NUMBER(15)
)
;
comment on table FDC_DOCUMENT
  is '����������� ����� "��������". ����� �������� � �������';
comment on column FDC_DOCUMENT.id
  is '��� �������';
comment on column FDC_DOCUMENT.doc_date
  is '���� ���������';
comment on column FDC_DOCUMENT.doc_number
  is '����� ���������';
comment on column FDC_DOCUMENT.is_active
  is '������� ���������� ���������';
comment on column FDC_DOCUMENT.activation_date
  is '���� ���������� ���������';
comment on column FDC_DOCUMENT.is_ts
  is '������� ����������� ����� ';
comment on column FDC_DOCUMENT.personal_account_id
  is '��� �������� �����';
create index FDC#IDX#DOCUMENTS#DOC_DATE on FDC_DOCUMENT (DOC_DATE);
create index IDX#DOCUMENT#ACTIVATION_DATE on FDC_DOCUMENT (ACTIVATION_DATE);
create index IDX#DOCUMENT#IS_ACTIVE on FDC_DOCUMENT (IS_ACTIVE);
create index IDX#DOCUMENT#IS_TS on FDC_DOCUMENT (IS_TS);
create index IDX#DOCUMENT#PA_ID on FDC_DOCUMENT (PERSONAL_ACCOUNT_ID);
alter table FDC_DOCUMENT
  add constraint FDC#PK#DOCUMENT primary key (ID);
alter table FDC_DOCUMENT
  add constraint FDC#FK#DOC_IS_OBJECT foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_DOCUMENT
  add constraint FDC#FK#DOC_PA_ID foreign key (PERSONAL_ACCOUNT_ID)
  references FDC_PERSONAL_ACCOUNT (ID);
alter table FDC_DOCUMENT
  add constraint FDC#CHK#DOC#IS_ACTIVE
  check (IS_ACTIVE IN ('Y', 'N', 'A'));
alter table FDC_DOCUMENT
  add constraint FDC#CHK#DOC#IS_TS
  check (IS_TS IN ('Y', 'N'));

prompt
prompt Creating table ASBC_CHECKS
prompt ==========================
prompt
create table ASBC_CHECKS
(
  id          NUMBER not null,
  checktype   NUMBER(17) not null,
  checkdate   DATE not null,
  reqcont     VARCHAR2(500) not null,
  checkstatus NUMBER(1) default 0 not null,
  ansdate     DATE,
  anscont     VARCHAR2(240),
  checknumb   NUMBER(10) not null,
  subject_id  NUMBER(17),
  document_id NUMBER(17),
  nresult     NUMBER(1)
)
;
comment on table ASBC_CHECKS
  is '��������';
comment on column ASBC_CHECKS.id
  is 'ID';
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
create index I_ASBC_CHECKS_CHECKTYPE_FK on ASBC_CHECKS (CHECKTYPE);
create index I_ASBC_CHECKS_DOCID_FK on ASBC_CHECKS (DOCUMENT_ID);
create index I_ASBC_CHECKS_SUBJID_FK on ASBC_CHECKS (SUBJECT_ID);
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

prompt
prompt Creating table ASBC_CHECKTYPEPARAMS
prompt ===================================
prompt
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
comment on table ASBC_CHECKTYPEPARAMS
  is '��������� ��������';
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
alter table ASBC_CHECKTYPEPARAMS
  add constraint C_ASBC_CHECKTYPEPARAMS_UK unique (PRN, NAME, SUBJECT_TYPE);
alter table ASBC_CHECKTYPEPARAMS
  add constraint C_ASBC_CHECKTYPEPARAMS_FK foreign key (PRN)
  references ASBC_CHECKTYPES (ID);

prompt
prompt Creating table ASBC_DOCTYPES_NOTACTIVE
prompt ======================================
prompt
create table ASBC_DOCTYPES_NOTACTIVE
(
  sysname VARCHAR2(1500) not null,
  name    VARCHAR2(1500) not null
)
;
comment on table ASBC_DOCTYPES_NOTACTIVE
  is '���� ���������� ��� �������� ����������';
comment on column ASBC_DOCTYPES_NOTACTIVE.sysname
  is 'SYSNAME';
comment on column ASBC_DOCTYPES_NOTACTIVE.name
  is 'NAME';
alter table ASBC_DOCTYPES_NOTACTIVE
  add constraint �_ASBC_DOCTYPES_NOTACTIVE_PK primary key (SYSNAME);

prompt
prompt Creating table ASBC_ELRULINGS
prompt =============================
prompt
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
comment on table ASBC_ELRULINGS
  is '����������� ������������� �� ��';
comment on column ASBC_ELRULINGS.id
  is 'ID';
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
create bitmap index I_ASBC_ELRULINGS_RULINGTYPE on ASBC_ELRULINGS (RULINGTYPE);
create bitmap index I_ASBC_ELRULINGS_STATUS on ASBC_ELRULINGS (STATUS);
create bitmap index I_ASBC_ELRULINGS_VALDOC_TYPE on ASBC_ELRULINGS (VALDOC_TYPE);
alter table ASBC_ELRULINGS
  add constraint C_ASBC_ELRULINGS_PK primary key (ID);
alter table ASBC_ELRULINGS
  add constraint C_ASBC_ELRULINGS_CARRIER_FK foreign key (CARRIER_ID)
  references FDC_SUBJECT (ID);

prompt
prompt Creating table ASBC_ELRULINGS_CRIMINAL_CASE
prompt ===========================================
prompt
create table ASBC_ELRULINGS_CRIMINAL_CASE
(
  id NUMBER(15)
)
;
comment on table ASBC_ELRULINGS_CRIMINAL_CASE
  is '���������� ������� ''������ ���������-����������'' - ��������� ����';
comment on column ASBC_ELRULINGS_CRIMINAL_CASE.id
  is 'ID';
alter table ASBC_ELRULINGS_CRIMINAL_CASE
  add constraint C_ASBC_ELRULINGS_CRIM_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

prompt
prompt Creating table ASBC_ELRULINGS_PROPERTY
prompt ======================================
prompt
create table ASBC_ELRULINGS_PROPERTY
(
  id NUMBER(15)
)
;
comment on table ASBC_ELRULINGS_PROPERTY
  is '���������� ������� ''������ ���������-����������'' - ���������';
comment on column ASBC_ELRULINGS_PROPERTY.id
  is 'ID';
alter table ASBC_ELRULINGS_PROPERTY
  add constraint C_ASBC_ELRULINGS_PROP_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

prompt
prompt Creating table ASBC_ELRULINGS_RESOLUTION
prompt ========================================
prompt
create table ASBC_ELRULINGS_RESOLUTION
(
  id NUMBER(15)
)
;
comment on table ASBC_ELRULINGS_RESOLUTION
  is '���������� ������� ''������ ���������-����������'' - ������������� �� ��';
comment on column ASBC_ELRULINGS_RESOLUTION.id
  is 'ID';
alter table ASBC_ELRULINGS_RESOLUTION
  add constraint C_ASBC_ELRULINGS_RES_IDFK foreign key (ID)
  references ASBC_ELRULINGS (ID) on delete cascade;

prompt
prompt Creating table FDC_DICT
prompt =======================
prompt
create table FDC_DICT
(
  id    NUMBER(15) not null,
  code  VARCHAR2(1500),
  code2 VARCHAR2(1500),
  docum VARCHAR2(20)
)
;
comment on table FDC_DICT
  is '������ ��� �������� ���������� �� ��������� ������������.';
comment on column FDC_DICT.id
  is 'ID';
comment on column FDC_DICT.code
  is '��� ������� �����������';
comment on column FDC_DICT.code2
  is '�������������� ��� (��� �������������) ������� �����������';
comment on column FDC_DICT.docum
  is 'DOCUM';
create index FDC_DICT_IE1 on FDC_DICT (CODE);
alter table FDC_DICT
  add constraint FDC_DICT_PK primary key (ID);
alter table FDC_DICT
  add constraint DICT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table ASBC_INTERACT
prompt ============================
prompt
create table ASBC_INTERACT
(
  rn      NUMBER(17) not null,
  code    VARCHAR2(20),
  name    VARCHAR2(240) not null,
  type    NUMBER(1) default 0 not null,
  soft_id NUMBER(15) not null
)
;
comment on table ASBC_INTERACT
  is '�������� ��������������';
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
create index I_ASBC_INTERACT_SOFT_ID_FK on ASBC_INTERACT (SOFT_ID);
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

prompt
prompt Creating table ASBC_INTERACTMSGTYPES
prompt ====================================
prompt
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
comment on table ASBC_INTERACTMSGTYPES
  is '���� ��������������';
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
create index I_ASBC_INTERACTMSGTYPES_PRN_FK on ASBC_INTERACTMSGTYPES (PRN);
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_RN_PK primary key (RN);
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_UK unique (CODE, DIRECTION);
alter table ASBC_INTERACTMSGTYPES
  add constraint C_ASBC_INTERACTMSGTYPES_RN_FK foreign key (RN)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table ASBC_INTERACTQUEUES
prompt ==================================
prompt
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
comment on table ASBC_INTERACTQUEUES
  is '������� ��������������';
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
create index I_ASBC_INTERACTQUEUES_PRN_FK on ASBC_INTERACTQUEUES (PRN);
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_RN_PK primary key (RN);
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_UK unique (PRN, MANAGER, QUEUE);
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTERACTQUEUES_RN_FK foreign key (RN)
  references FDC_OBJECT (ID) on delete cascade;
alter table ASBC_INTERACTQUEUES
  add constraint C_ASBC_INTREACTQUEUES_NN
  check (TYPE = 0 and HOST is not null and PORT is not null and CHANNEL is not null or
TYPE = 1);

prompt
prompt Creating table ASBC_INTERACT_LOG
prompt ================================
prompt
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
  document      NUMBER(17),
  logmsg        CLOB
)
;
comment on table ASBC_INTERACT_LOG
  is '��� ����������������� � ����������� ��������������';
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
comment on column ASBC_INTERACT_LOG.logmsg
  is '��� ���������';
create index I_ASBC_INTERACT_LOG_DOCUMENT on ASBC_INTERACT_LOG (DOCUMENT);
create index I_ASBC_INTERACT_LOG_ENVID on ASBC_INTERACT_LOG (ENVID);
create index I_ASBC_INTERACT_LOG_FORMDATE on ASBC_INTERACT_LOG (FORMDATE);
create index I_ASBC_INTERACT_LOG_PRN_FK on ASBC_INTERACT_LOG (PRN);
create index I_ASBC_INTERACT_LOG_RECEIVER on ASBC_INTERACT_LOG (RECEIVER);
create index I_ASBC_INTERACT_LOG_TS on ASBC_INTERACT_LOG (TYPE, STATE);
alter table ASBC_INTERACT_LOG
  add constraint C_ASBC_INTERACT_LOG_RN_PK primary key (RN);
alter table ASBC_INTERACT_LOG
  add constraint C_ASBC_INTERACT_LOG_PRN_FK foreign key (PRN)
  references ASBC_INTERACT_LOG (RN);

prompt
prompt Creating table ASBC_INTERACT_LOG_DOCS
prompt =====================================
prompt
create table ASBC_INTERACT_LOG_DOCS
(
  rn        NUMBER(17) not null,
  prn       NUMBER(17) not null,
  object_id NUMBER(17) not null
)
;
comment on table ASBC_INTERACT_LOG_DOCS
  is '������ �������������� (���������)';
comment on column ASBC_INTERACT_LOG_DOCS.rn
  is '��������������� ����� ������';
comment on column ASBC_INTERACT_LOG_DOCS.prn
  is '������ �� ��������';
comment on column ASBC_INTERACT_LOG_DOCS.object_id
  is '������ �� ������ ���������';
create index I_ASBC_INTERACT_LOG_D_OID_FK on ASBC_INTERACT_LOG_DOCS (OBJECT_ID);
create index I_ASBC_INTERACT_LOG_D_PRN_FK on ASBC_INTERACT_LOG_DOCS (PRN);
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

prompt
prompt Creating table FDC_VALUE
prompt ========================
prompt
create table FDC_VALUE
(
  id            NUMBER(15) not null,
  stringvalue   VARCHAR2(1500),
  numvalue      NUMBER,
  datetimevalue DATE,
  ref_object_id NUMBER(15),
  issystem      NUMBER(1) default 0 not null,
  allownull     NUMBER(1) default 0 not null,
  locality      NUMBER(1) default 0 not null
)
;
comment on table FDC_VALUE
  is '�������� ��������, ��������� �� ���������� ����������. ����������� ���������. ���� ������� ����������� ����, �� �������� �������� ��������� �������� ����. ��� ���� ���� ���� �������� �� ������� � �������� �� ��� ���������� ��� ���� �������. ���� ������� �� ������ � ����� �� �������� ������������ ����� �������� ������� (���� �������� ������� � ��������) ��� �� ���������� ���������� (���� �� ������� � ��������)';
comment on column FDC_VALUE.id
  is 'ID';
comment on column FDC_VALUE.stringvalue
  is 'STRINGVALUE';
comment on column FDC_VALUE.numvalue
  is 'NUMVALUE';
comment on column FDC_VALUE.datetimevalue
  is 'DATETIMEVALUE';
comment on column FDC_VALUE.ref_object_id
  is 'REF_OBJECT_ID';
comment on column FDC_VALUE.issystem
  is 'ISSYSTEM';
comment on column FDC_VALUE.allownull
  is '1 - ��������� NULL �������� ��� ��������� ����������; 0 - �����';
comment on column FDC_VALUE.locality
  is '������� ����������� (0 - ��, 1 - ��, 2 - ������������)';
create index FDC_VALUE_IE1 on FDC_VALUE (ISSYSTEM);
create index FDC_VALUE_IF69 on FDC_VALUE (REF_OBJECT_ID);
create bitmap index I_FDC_VALUE_LOCALITY on FDC_VALUE (LOCALITY);
alter table FDC_VALUE
  add constraint FDC_VALUE_PK primary key (ID);
alter table FDC_VALUE
  add constraint VALUE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_VALUE
  add constraint VALUE_REF_OBJECT_ID foreign key (REF_OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_VALUE
  add constraint CH_VALUE_ALLOWNULL
  check (AllowNull IN (0, 1));
alter table FDC_VALUE
  add constraint CH_VALUE_ISSYSTEM
  check (IsSystem IN (0, 1));
alter table FDC_VALUE
  add constraint C_FDC_VALUE_LOCSYS_CHK
  check (LOCALITY = 0 AND ISSYSTEM = 0 OR ISSYSTEM = 1);
alter table FDC_VALUE
  add constraint VALUEFILLED4
  check ( IsSystem = 1
            and AllowNull = 1
            or
            (    StringValue   is not null
              or NumValue      is not null
              or DateTimeValue is not null
              or Ref_Object_Id is not null
            )
          );

prompt
prompt Creating table ASBC_VALUESP
prompt ===========================
prompt
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
comment on table ASBC_VALUESP
  is '��������� (��������)';
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
create index I_ASBC_VALUESP_AUTHID on ASBC_VALUESP (AUTHID);
create index I_ASBC_VALUESP_CUSTCODE on ASBC_VALUESP (CUSTCODE);
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_UK unique (REF_VALUE_ID, CUSTCODE, AUTHID);
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_REF_VALUE_ID_FK foreign key (REF_VALUE_ID)
  references FDC_VALUE (ID) on delete cascade;
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_CUSTUSER_CHK
  check (CUSTCODE IS NOT NULL OR AUTHID IS NOT NULL);
alter table ASBC_VALUESP
  add constraint C_ASBC_VALUESP_VALUE_CHK
  check (STRINGVALUE IS NOT NULL AND NUMVALUE IS NULL AND DATETIMEVALUE IS NULL OR NUMVALUE IS NOT NULL AND STRINGVALUE IS NULL AND DATETIMEVALUE IS NULL OR DATETIMEVALUE IS NOT NULL AND STRINGVALUE IS NULL AND NUMVALUE IS NULL);

prompt
prompt Creating table DBF_ASBC_ELRULINGS
prompt =================================
prompt
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
comment on table DBF_ASBC_ELRULINGS
  is '������� DBF_ASBC_ELRULINGS';
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
comment on column DBF_ASBC_ELRULINGS.numpts
  is 'NUMPTS';
comment on column DBF_ASBC_ELRULINGS.load_id
  is 'LOAD_ID';
comment on column DBF_ASBC_ELRULINGS.id
  is 'ID';
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
create index DBF_ASBC_ELRULINGS_LOAD_ID on DBF_ASBC_ELRULINGS (LOAD_ID);
create index IDX_DBF_ASBC_ELRULINGS_IDPAYER on DBF_ASBC_ELRULINGS (IDPAYER);
create index IDX_DBF_ASBC_ELR_IDPAYER2 on DBF_ASBC_ELRULINGS (IDPAYER2);
alter table DBF_ASBC_ELRULINGS
  add constraint DBF_ASBC_ELRULINGS_PK primary key (TPO_NUMBER);

prompt
prompt Creating table DBF_ASSETS_DECISION
prompt ==================================
prompt
create table DBF_ASSETS_DECISION
(
  code      VARCHAR2(2),
  code2     VARCHAR2(250),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_ASSETS_DECISION
  is '������� DBF_ASSETS_DECISION';
comment on column DBF_ASSETS_DECISION.code
  is 'CODE';
comment on column DBF_ASSETS_DECISION.code2
  is 'CODE2';
comment on column DBF_ASSETS_DECISION.name
  is 'NAME';
comment on column DBF_ASSETS_DECISION.datbeg
  is 'DATBEG';
comment on column DBF_ASSETS_DECISION.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_ASSETS_DECISION.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_ASSETS_DECISION.datend
  is 'DATEND';
comment on column DBF_ASSETS_DECISION.numenddoc
  is 'NUMENDDOC';
comment on column DBF_ASSETS_DECISION.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_ASSETS_DICT
prompt ==============================
prompt
create table DBF_ASSETS_DICT
(
  code      VARCHAR2(2),
  code2     VARCHAR2(250),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_ASSETS_DICT
  is '������� DBF_ASSETS_DICT';
comment on column DBF_ASSETS_DICT.code
  is 'CODE';
comment on column DBF_ASSETS_DICT.code2
  is 'CODE2';
comment on column DBF_ASSETS_DICT.name
  is 'NAME';
comment on column DBF_ASSETS_DICT.datbeg
  is 'DATBEG';
comment on column DBF_ASSETS_DICT.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_ASSETS_DICT.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_ASSETS_DICT.datend
  is 'DATEND';
comment on column DBF_ASSETS_DICT.numenddoc
  is 'NUMENDDOC';
comment on column DBF_ASSETS_DICT.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_ASSETS_REASON
prompt ================================
prompt
create table DBF_ASSETS_REASON
(
  code      VARCHAR2(2),
  code2     VARCHAR2(250),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE,
  docum     VARCHAR2(20)
)
;
comment on table DBF_ASSETS_REASON
  is '������� DBF_ASSETS_REASON';
comment on column DBF_ASSETS_REASON.code
  is 'CODE';
comment on column DBF_ASSETS_REASON.code2
  is 'CODE2';
comment on column DBF_ASSETS_REASON.name
  is 'NAME';
comment on column DBF_ASSETS_REASON.datbeg
  is 'DATBEG';
comment on column DBF_ASSETS_REASON.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_ASSETS_REASON.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_ASSETS_REASON.datend
  is 'DATEND';
comment on column DBF_ASSETS_REASON.numenddoc
  is 'NUMENDDOC';
comment on column DBF_ASSETS_REASON.datenddoc
  is 'DATENDDOC';
comment on column DBF_ASSETS_REASON.docum
  is 'DOCUM';

prompt
prompt Creating table DBF_BANKLIST
prompt ===========================
prompt
create table DBF_BANKLIST
(
  num       FLOAT,
  status    VARCHAR2(3),
  tip       VARCHAR2(1),
  namemax   VARCHAR2(134),
  name      VARCHAR2(41),
  regn      FLOAT,
  rnfl      FLOAT,
  lic_rub   DATE,
  lic_val   DATE,
  vv        VARCHAR2(1),
  rei       VARCHAR2(1),
  opp       VARCHAR2(1),
  ko        VARCHAR2(1),
  no        VARCHAR2(1),
  adres     VARCHAR2(85),
  kors      VARCHAR2(20),
  kod       VARCHAR2(7),
  okato     VARCHAR2(11),
  telefon   VARCHAR2(35),
  fax       VARCHAR2(24),
  telex     VARCHAR2(28),
  teletap   VARCHAR2(24),
  fio_pr_pr VARCHAR2(35),
  fio_gl_b  VARCHAR2(35),
  okpo      VARCHAR2(10),
  okpo_gb   VARCHAR2(10),
  tim_      DATE,
  sovam     VARCHAR2(8),
  packet    VARCHAR2(4),
  type_co   VARCHAR2(1),
  mfo       VARCHAR2(8),
  uch       VARCHAR2(2),
  kod_izm   VARCHAR2(2),
  mfon      VARCHAR2(9),
  sovam_i   VARCHAR2(8),
  ogrn      VARCHAR2(15),
  inn       VARCHAR2(12),
  kpp       VARCHAR2(9),
  igarant   VARCHAR2(1),
  datan     DATE,
  datao     DATE,
  lic_met   DATE
)
;
comment on table DBF_BANKLIST
  is '������� DBF_BANKLIST';
comment on column DBF_BANKLIST.num
  is 'NUM';
comment on column DBF_BANKLIST.status
  is 'STATUS';
comment on column DBF_BANKLIST.tip
  is 'TIP';
comment on column DBF_BANKLIST.namemax
  is 'NAMEMAX';
comment on column DBF_BANKLIST.name
  is 'NAME';
comment on column DBF_BANKLIST.regn
  is 'REGN';
comment on column DBF_BANKLIST.rnfl
  is 'RNFL';
comment on column DBF_BANKLIST.lic_rub
  is 'LIC_RUB';
comment on column DBF_BANKLIST.lic_val
  is 'LIC_VAL';
comment on column DBF_BANKLIST.vv
  is 'VV';
comment on column DBF_BANKLIST.rei
  is 'REI';
comment on column DBF_BANKLIST.opp
  is 'OPP';
comment on column DBF_BANKLIST.ko
  is 'KO';
comment on column DBF_BANKLIST.no
  is 'NO';
comment on column DBF_BANKLIST.adres
  is 'ADRES';
comment on column DBF_BANKLIST.kors
  is 'KORS';
comment on column DBF_BANKLIST.kod
  is 'KOD';
comment on column DBF_BANKLIST.okato
  is 'OKATO';
comment on column DBF_BANKLIST.telefon
  is 'TELEFON';
comment on column DBF_BANKLIST.fax
  is 'FAX';
comment on column DBF_BANKLIST.telex
  is 'TELEX';
comment on column DBF_BANKLIST.teletap
  is 'TELETAP';
comment on column DBF_BANKLIST.fio_pr_pr
  is 'FIO_PR_PR';
comment on column DBF_BANKLIST.fio_gl_b
  is 'FIO_GL_B';
comment on column DBF_BANKLIST.okpo
  is 'OKPO';
comment on column DBF_BANKLIST.okpo_gb
  is 'OKPO_GB';
comment on column DBF_BANKLIST.tim_
  is 'TIM_';
comment on column DBF_BANKLIST.sovam
  is 'SOVAM';
comment on column DBF_BANKLIST.packet
  is 'PACKET';
comment on column DBF_BANKLIST.type_co
  is 'TYPE_CO';
comment on column DBF_BANKLIST.mfo
  is 'MFO';
comment on column DBF_BANKLIST.uch
  is 'UCH';
comment on column DBF_BANKLIST.kod_izm
  is 'KOD_IZM';
comment on column DBF_BANKLIST.mfon
  is 'MFON';
comment on column DBF_BANKLIST.sovam_i
  is 'SOVAM_I';
comment on column DBF_BANKLIST.ogrn
  is 'OGRN';
comment on column DBF_BANKLIST.inn
  is 'INN';
comment on column DBF_BANKLIST.kpp
  is 'KPP';
comment on column DBF_BANKLIST.igarant
  is 'IGARANT';
comment on column DBF_BANKLIST.datan
  is 'DATAN';
comment on column DBF_BANKLIST.datao
  is 'DATAO';
comment on column DBF_BANKLIST.lic_met
  is 'LIC_MET';

prompt
prompt Creating table DBF_CASH_ORDER
prompt =============================
prompt
create table DBF_CASH_ORDER
(
  doc_no       VARCHAR2(12),
  doc_date     DATE,
  exec_date    DATE,
  curcode      VARCHAR2(3),
  summa        NUMBER,
  name_d       VARCHAR2(160),
  inn_d        VARCHAR2(15),
  okpo_d       VARCHAR2(15),
  reason       VARCHAR2(212),
  fileid       INTEGER,
  kpp          VARCHAR2(9),
  reason2      VARCHAR2(100),
  reason3      VARCHAR2(100),
  reason4      VARCHAR2(100),
  rn           VARCHAR2(17),
  val_doc_no   VARCHAR2(26),
  val_doc_date DATE,
  type_oper    NUMBER(1) default 0,
  pay_info     VARCHAR2(240),
  kbk          VARCHAR2(20)
)
;
comment on table DBF_CASH_ORDER
  is '����� �������� �������� �������';
comment on column DBF_CASH_ORDER.doc_no
  is 'DOC_NO';
comment on column DBF_CASH_ORDER.doc_date
  is 'DOC_DATE';
comment on column DBF_CASH_ORDER.exec_date
  is 'EXEC_DATE';
comment on column DBF_CASH_ORDER.curcode
  is 'CURCODE';
comment on column DBF_CASH_ORDER.summa
  is 'SUMMA';
comment on column DBF_CASH_ORDER.name_d
  is 'NAME_D';
comment on column DBF_CASH_ORDER.inn_d
  is 'INN_D';
comment on column DBF_CASH_ORDER.okpo_d
  is 'OKPO_D';
comment on column DBF_CASH_ORDER.reason
  is 'REASON';
comment on column DBF_CASH_ORDER.fileid
  is 'FILEID';
comment on column DBF_CASH_ORDER.kpp
  is 'KPP';
comment on column DBF_CASH_ORDER.reason2
  is 'REASON2';
comment on column DBF_CASH_ORDER.reason3
  is 'REASON3';
comment on column DBF_CASH_ORDER.reason4
  is 'REASON4';
comment on column DBF_CASH_ORDER.rn
  is '������������� ������ (PK) � ��� ���';
comment on column DBF_CASH_ORDER.val_doc_no
  is '����� ���������-���������';
comment on column DBF_CASH_ORDER.val_doc_date
  is '���� ���������-���������';
comment on column DBF_CASH_ORDER.type_oper
  is '��� ������: 0 - ���, 1 - ���';
comment on column DBF_CASH_ORDER.pay_info
  is '���������� �������';
comment on column DBF_CASH_ORDER.kbk
  is '��� ��������� �������������';
create index IDX#DBF#CO#FILEID_TYPE on DBF_CASH_ORDER (FILEID, TYPE_OPER);
create index IDX#DBF#CO#KBK on DBF_CASH_ORDER (KBK);
alter table DBF_CASH_ORDER
  add constraint DBF#CO#RN#UNQ unique (RN);
alter table DBF_CASH_ORDER
  add constraint DBF#CO#TYPE
  check (TYPE_OPER IN (0, 1));

prompt
prompt Creating table DBF_CUSTOM_PAYS
prompt ==============================
prompt
create table DBF_CUSTOM_PAYS
(
  numdoc     VARCHAR2(12),
  datedoc    DATE,
  datebank   DATE,
  curcode    VARCHAR2(3),
  summa      NUMBER,
  name_d     VARCHAR2(70),
  okpo_d     VARCHAR2(10),
  inn_d      VARCHAR2(12),
  acc_d      VARCHAR2(20),
  bic_d      VARCHAR2(9),
  typedoc    VARCHAR2(3),
  reason     VARCHAR2(212),
  id         VARCHAR2(25),
  customcode VARCHAR2(8),
  cardnum    VARCHAR2(19),
  flag       VARCHAR2(1),
  kpp_d      VARCHAR2(9),
  bank_d     VARCHAR2(70),
  koracc_d   VARCHAR2(20),
  name       VARCHAR2(70),
  okpo       VARCHAR2(10),
  inn        VARCHAR2(12),
  name_c     VARCHAR2(70),
  okpo_c     VARCHAR2(10),
  inn_c      VARCHAR2(12),
  acc_c      VARCHAR2(20),
  bank_c     VARCHAR2(70),
  bic_c      VARCHAR2(9),
  koracc_c   VARCHAR2(20),
  docdate    DATE,
  doctime    VARCHAR2(8),
  repeat     VARCHAR2(1),
  kpp        VARCHAR2(9),
  paymenttyp VARCHAR2(2),
  paymentnum VARCHAR2(7),
  paymentdat VARCHAR2(10),
  kbk        VARCHAR2(20),
  paymentid  VARCHAR2(4),
  name_s     VARCHAR2(70),
  viddoc     VARCHAR2(2),
  serpass    VARCHAR2(10),
  numpass    VARCHAR2(20),
  datpass    DATE,
  process_id VARCHAR2(36),
  flag_proc  VARCHAR2(1),
  inn_s      VARCHAR2(12),
  kpp_s      VARCHAR2(9)
)
;
comment on table DBF_CUSTOM_PAYS
  is '���� �� ��';
comment on column DBF_CUSTOM_PAYS.numdoc
  is 'NUMDOC';
comment on column DBF_CUSTOM_PAYS.datedoc
  is 'DATEDOC';
comment on column DBF_CUSTOM_PAYS.datebank
  is 'DATEBANK';
comment on column DBF_CUSTOM_PAYS.curcode
  is 'CURCODE';
comment on column DBF_CUSTOM_PAYS.summa
  is 'SUMMA';
comment on column DBF_CUSTOM_PAYS.name_d
  is 'NAME_D';
comment on column DBF_CUSTOM_PAYS.okpo_d
  is 'OKPO_D';
comment on column DBF_CUSTOM_PAYS.inn_d
  is 'INN_D';
comment on column DBF_CUSTOM_PAYS.acc_d
  is 'ACC_D';
comment on column DBF_CUSTOM_PAYS.bic_d
  is 'BIC_D';
comment on column DBF_CUSTOM_PAYS.typedoc
  is 'TYPEDOC';
comment on column DBF_CUSTOM_PAYS.reason
  is 'REASON';
comment on column DBF_CUSTOM_PAYS.id
  is 'ID';
comment on column DBF_CUSTOM_PAYS.customcode
  is 'CUSTOMCODE';
comment on column DBF_CUSTOM_PAYS.cardnum
  is 'CARDNUM';
comment on column DBF_CUSTOM_PAYS.flag
  is 'FLAG';
comment on column DBF_CUSTOM_PAYS.kpp_d
  is 'KPP_D';
comment on column DBF_CUSTOM_PAYS.bank_d
  is 'BANK_D';
comment on column DBF_CUSTOM_PAYS.koracc_d
  is 'KORACC_D';
comment on column DBF_CUSTOM_PAYS.name
  is 'NAME';
comment on column DBF_CUSTOM_PAYS.okpo
  is 'OKPO';
comment on column DBF_CUSTOM_PAYS.inn
  is 'INN';
comment on column DBF_CUSTOM_PAYS.name_c
  is 'NAME_C';
comment on column DBF_CUSTOM_PAYS.okpo_c
  is 'OKPO_C';
comment on column DBF_CUSTOM_PAYS.inn_c
  is 'INN_C';
comment on column DBF_CUSTOM_PAYS.acc_c
  is 'ACC_C';
comment on column DBF_CUSTOM_PAYS.bank_c
  is 'BANK_C';
comment on column DBF_CUSTOM_PAYS.bic_c
  is 'BIC_C';
comment on column DBF_CUSTOM_PAYS.koracc_c
  is 'KORACC_C';
comment on column DBF_CUSTOM_PAYS.docdate
  is 'DOCDATE';
comment on column DBF_CUSTOM_PAYS.doctime
  is 'DOCTIME';
comment on column DBF_CUSTOM_PAYS.repeat
  is 'REPEAT';
comment on column DBF_CUSTOM_PAYS.kpp
  is 'KPP';
comment on column DBF_CUSTOM_PAYS.paymenttyp
  is '���������� ��������� �������';
comment on column DBF_CUSTOM_PAYS.paymentnum
  is '���������� ������ ���������, ����������� ���������� �������';
comment on column DBF_CUSTOM_PAYS.paymentdat
  is '���������� ���� ���������, ����������� ���������� �������';
comment on column DBF_CUSTOM_PAYS.kbk
  is '20-�� ���������� ��� ';
comment on column DBF_CUSTOM_PAYS.paymentid
  is '��� ������� (4-x  ���������� ��� ����)';
comment on column DBF_CUSTOM_PAYS.name_s
  is '������������ ������� ������������� ��';
comment on column DBF_CUSTOM_PAYS.viddoc
  is '��� ���� ���������, ��������������� �������� ����������� ����, � ������ �������� �������� ������ ';
comment on column DBF_CUSTOM_PAYS.serpass
  is '����� ���������, ��������������� �������� ����������� ����, � ������ �������� �������� ������';
comment on column DBF_CUSTOM_PAYS.numpass
  is '����� �������� ��� ����� ���������, ��������������� �������� ����������� ���� � ������ �������� �������� ������';
comment on column DBF_CUSTOM_PAYS.datpass
  is '���� ������ �������� ��� ����� ���������, ��������������� �������� ����������� ���� � ������ �������� �������� ������';
comment on column DBF_CUSTOM_PAYS.process_id
  is '���������� ������������� ��������� ������������ �������������� (GUID)';
comment on column DBF_CUSTOM_PAYS.flag_proc
  is '������� ��������� ������ (1 -  ��������� ������; 0 - ������ ����� ���������)';
comment on column DBF_CUSTOM_PAYS.inn_s
  is '��� ��������� �������, � ������� �������� ������';
comment on column DBF_CUSTOM_PAYS.kpp_s
  is '��� ��������� �������, � ������� �������� ������';

prompt
prompt Creating table DBF_DCLDOG
prompt =========================
prompt
create table DBF_DCLDOG
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  g32       FLOAT not null,
  dogn      VARCHAR2(50) not null,
  dogd      DATE not null,
  pasp      VARCHAR2(25),
  paspbank  VARCHAR2(70),
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT
)
;
comment on table DBF_DCLDOG
  is '������� DBF_DCLDOG';
comment on column DBF_DCLDOG.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLDOG.g072
  is '��������������� ����� �� ? ���� ���������';
comment on column DBF_DCLDOG.g073
  is '��������������� ����� �� ? ���������� ���';
comment on column DBF_DCLDOG.g32
  is '����� ������ �� �� (������)';
comment on column DBF_DCLDOG.dogn
  is '����� ��������';
comment on column DBF_DCLDOG.dogd
  is '���� ���������� ��������';
comment on column DBF_DCLDOG.pasp
  is '����� ��, ���';
comment on column DBF_DCLDOG.paspbank
  is '������� ������������ �����, ����������� �';
comment on column DBF_DCLDOG.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLDOG.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLDOG.tmodify
  is '����� ����� / ����������� ������ (��:��:�';
comment on column DBF_DCLDOG.p_edoc_id
  is '������ �� ������������� ��������� � �����';
alter table DBF_DCLDOG
  add constraint DBF_DCLDOG primary key (G071, G072, G073, G32, DOGN, DOGD, DMODIFY, TMODIFY);

prompt
prompt Creating table DBF_DCLHEAD
prompt ==========================
prompt
create table DBF_DCLHEAD
(
  num_ver    VARCHAR2(8),
  data_ver   DATE,
  typ_dcl    VARCHAR2(2),
  gugtk      NUMBER(1),
  copy       NUMBER(1),
  dcopy      DATE,
  q_edit     FLOAT,
  d_edit     DATE,
  sol        FLOAT,
  max_err    FLOAT,
  dd         DATE,
  tm         VARCHAR2(8),
  extrnl     VARCHAR2(80),
  schet      VARCHAR2(160),
  stepctrl   VARCHAR2(20),
  typ_dtc    VARCHAR2(1),
  vid_ktc    VARCHAR2(1),
  ind_k      VARCHAR2(5),
  stat       VARCHAR2(1),
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(10) not null,
  ui_b_1     VARCHAR2(8),
  ui_b_2     DATE,
  ui_b_3     VARCHAR2(7),
  sds_srv    VARCHAR2(4),
  sds_num    FLOAT,
  f_decl     VARCHAR2(1),
  g011       VARCHAR2(2),
  g012       VARCHAR2(2),
  g0131      VARCHAR2(3),
  g020       VARCHAR2(15),
  g02_itn    VARCHAR2(13),
  g021       VARCHAR2(12),
  g022       VARCHAR2(150),
  g022a      VARCHAR2(150),
  g023       VARCHAR2(80),
  g0231      VARCHAR2(3),
  g0231a     VARCHAR2(35),
  g023a      VARCHAR2(80),
  g024a      VARCHAR2(2),
  g024p      VARCHAR2(1),
  g024b      VARCHAR2(5),
  g024c      VARCHAR2(10),
  g024n      VARCHAR2(10),
  g024in     VARCHAR2(12),
  g027       VARCHAR2(9),
  g0281      VARCHAR2(2),
  g0281a     VARCHAR2(15),
  g02821     VARCHAR2(11),
  g02822     VARCHAR2(25),
  g02823     VARCHAR2(150),
  g0283      DATE,
  g032       FLOAT,
  g04        FLOAT,
  g05        FLOAT,
  g06        FLOAT,
  g080       VARCHAR2(15),
  g08_itn    VARCHAR2(13),
  g081       VARCHAR2(12),
  g082       VARCHAR2(150),
  g082a      VARCHAR2(150),
  g083       VARCHAR2(80),
  g0831      VARCHAR2(3),
  g0831a     VARCHAR2(40),
  g083a      VARCHAR2(80),
  g084a      VARCHAR2(2),
  g084p      VARCHAR2(1),
  g084b      VARCHAR2(5),
  g084c      VARCHAR2(10),
  g087       VARCHAR2(9),
  g0881      VARCHAR2(2),
  g0881a     VARCHAR2(15),
  g08821     VARCHAR2(11),
  g08822     VARCHAR2(25),
  g08823     VARCHAR2(150),
  g0883      DATE,
  g089       VARCHAR2(1),
  g090       VARCHAR2(15),
  g09_itn    VARCHAR2(13),
  g091       VARCHAR2(12),
  g092       VARCHAR2(150),
  g092a      VARCHAR2(150),
  g093       VARCHAR2(80),
  g093a      VARCHAR2(80),
  g094a      VARCHAR2(2),
  g094p      VARCHAR2(1),
  g094b      VARCHAR2(5),
  g094c      VARCHAR2(10),
  g097       VARCHAR2(9),
  g0981      VARCHAR2(2),
  g0981a     VARCHAR2(15),
  g09821     VARCHAR2(11),
  g09822     VARCHAR2(25),
  g09823     VARCHAR2(150),
  g0983      DATE,
  g10        VARCHAR2(3),
  g11        VARCHAR2(3),
  g12        FLOAT,
  g121       VARCHAR2(3),
  g13        VARCHAR2(8),
  g140       VARCHAR2(15),
  g14_itn    VARCHAR2(13),
  g141       VARCHAR2(12),
  g142       VARCHAR2(150),
  g142a      VARCHAR2(150),
  g143       VARCHAR2(80),
  g143a      VARCHAR2(80),
  g144a      VARCHAR2(2),
  g144p      VARCHAR2(1),
  g144b      VARCHAR2(5),
  g144c      VARCHAR2(10),
  g144d1     VARCHAR2(5),
  g144d2     FLOAT,
  g144d3     FLOAT,
  g144e      VARCHAR2(13),
  g145       DATE,
  g147       VARCHAR2(9),
  g1481      VARCHAR2(2),
  g1481a     VARCHAR2(15),
  g14821     VARCHAR2(11),
  g14822     VARCHAR2(25),
  g14823     VARCHAR2(150),
  g1483      DATE,
  g15        VARCHAR2(40),
  g15a       VARCHAR2(3),
  g16        VARCHAR2(40),
  g17a       VARCHAR2(3),
  g17b       VARCHAR2(40),
  g180       NUMBER(5),
  g19        VARCHAR2(1),
  g201       FLOAT,
  g202       VARCHAR2(3),
  g2021      VARCHAR2(50),
  g203       VARCHAR2(250),
  g210       FLOAT,
  g221       VARCHAR2(3),
  g222       FLOAT,
  g23        FLOAT,
  g230       DATE,
  g24        VARCHAR2(3),
  g25        VARCHAR2(2),
  g26        VARCHAR2(2),
  g270       VARCHAR2(2),
  g27_itn    VARCHAR2(13),
  g2710      VARCHAR2(1),
  g271       VARCHAR2(13),
  g27        VARCHAR2(40),
  g2711      DATE,
  g2712      VARCHAR2(8),
  g28_itn    VARCHAR2(13),
  g281       VARCHAR2(70),
  g2811      VARCHAR2(1),
  g281d      DATE,
  g281dd     DATE,
  g282       VARCHAR2(70),
  g282d      DATE,
  g2831      VARCHAR2(2),
  g283       VARCHAR2(70),
  g284       VARCHAR2(50),
  g284d      DATE,
  g284dd     DATE,
  g4910      VARCHAR2(1),
  g491       VARCHAR2(30),
  g492       DATE,
  g500       VARCHAR2(15),
  g50_itn    VARCHAR2(13),
  g5011      VARCHAR2(80),
  g5012      VARCHAR2(80),
  g5021      VARCHAR2(20),
  g5022      VARCHAR2(10),
  g5023      VARCHAR2(80),
  g5031      VARCHAR2(20),
  g5032      VARCHAR2(10),
  g5033      VARCHAR2(80),
  g504       VARCHAR2(12),
  g507       VARCHAR2(9),
  g5081      VARCHAR2(2),
  g5081a     VARCHAR2(6),
  g50821     VARCHAR2(11),
  g50822     VARCHAR2(25),
  g50823     VARCHAR2(80),
  g5083      DATE,
  g502       DATE,
  g52        VARCHAR2(3),
  g54_itn    VARCHAR2(13),
  g5410      VARCHAR2(1),
  g541       VARCHAR2(14),
  g541d      DATE,
  g5411      VARCHAR2(50),
  g5411d     DATE,
  g541_inn   VARCHAR2(12),
  g541_kpp   VARCHAR2(9),
  g542       DATE,
  g5441      VARCHAR2(150),
  g5442      VARCHAR2(50),
  g5443      VARCHAR2(250),
  g5444      VARCHAR2(50),
  g5445      DATE,
  g5446      DATE,
  g5447      VARCHAR2(50),
  g5451      VARCHAR2(2),
  g5451a     VARCHAR2(15),
  g54521     VARCHAR2(11),
  g54522     VARCHAR2(25),
  g54523     VARCHAR2(150),
  g5453      DATE,
  ga1        VARCHAR2(20),
  ga2        VARCHAR2(100),
  ga1a       VARCHAR2(20),
  ga2a       VARCHAR2(100),
  gd0        VARCHAR2(2),
  gd1        DATE,
  gd11       VARCHAR2(8),
  gd2        VARCHAR2(4),
  gd00       VARCHAR2(250),
  gddf       DATE,
  gd3        VARCHAR2(6),
  gd4        VARCHAR2(6),
  recplatv   FLOAT,
  recslotm   FLOAT,
  rectrans   FLOAT,
  recsumpp   FLOAT,
  recmhc50   FLOAT,
  recusl     FLOAT,
  pprr       FLOAT,
  pprv       FLOAT,
  pposh      FLOAT,
  pnal       FLOAT,
  gnuser     VARCHAR2(40),
  flduser    VARCHAR2(40),
  nrelise    VARCHAR2(10),
  kodtop     VARCHAR2(3),
  g071top    VARCHAR2(8),
  g072top    DATE,
  g073top    VARCHAR2(7),
  typdtop    VARCHAR2(2),
  numdtop    VARCHAR2(50),
  datdtop    DATE,
  fiotop     VARCHAR2(40),
  dattop     DATE,
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  gd5lnp     VARCHAR2(20),
  gd5        VARCHAR2(6),
  g5452      VARCHAR2(20),
  gb_kd      NUMBER,
  gb_rub     NUMBER,
  g474_rub   NUMBER,
  g204       VARCHAR2(10),
  g146d      DATE,
  g146a      VARCHAR2(10),
  g096d      DATE,
  g096a      VARCHAR2(10),
  g086d      DATE,
  g086a      VARCHAR2(10),
  g026d      DATE,
  g026a      VARCHAR2(20),
  lnpbegctrl VARCHAR2(30),
  tbegctrl   VARCHAR2(30),
  dbegctrl   DATE,
  tpriem     VARCHAR2(30),
  id         INTEGER not null,
  load_id    INTEGER not null,
  p_status1  NUMBER(2),
  p_status2  NUMBER(2),
  edoc_id    NUMBER(19),
  edoc_guid  VARCHAR2(32),
  complectbl VARCHAR2(1),
  g0121      VARCHAR2(2),
  g023post   VARCHAR2(9),
  g0231c     VARCHAR2(3),
  g023subd   VARCHAR2(50),
  g023city   VARCHAR2(35),
  g023street VARCHAR2(50),
  g040       NUMBER(5),
  g07        VARCHAR2(3),
  g083post   VARCHAR2(9),
  g0831c     VARCHAR2(3),
  g083subd   VARCHAR2(50),
  g083city   VARCHAR2(35),
  g083street VARCHAR2(50),
  g093post   VARCHAR2(9),
  g0931      VARCHAR2(2),
  g093subd   VARCHAR2(50),
  g093city   VARCHAR2(35),
  g093street VARCHAR2(50),
  g093apost  VARCHAR2(9),
  g0931a     VARCHAR2(2),
  g093asubd  VARCHAR2(50),
  g093acity  VARCHAR2(35),
  g093astree VARCHAR2(50),
  g11c       VARCHAR2(3),
  g143post   VARCHAR2(9),
  g1431      VARCHAR2(2),
  g143subd   VARCHAR2(50),
  g143city   VARCHAR2(35),
  g143street VARCHAR2(50),
  g143apost  VARCHAR2(9),
  g1431a     VARCHAR2(2),
  g143asubd  VARCHAR2(50),
  g143acity  VARCHAR2(35),
  g143astree VARCHAR2(50),
  g15ac      VARCHAR2(3),
  g160       VARCHAR2(1),
  g161       VARCHAR2(2),
  g17ac      VARCHAR2(3),
  g221c      VARCHAR2(3),
  g2810      VARCHAR2(1),
  g28okpo    VARCHAR2(10),
  g28inn     VARCHAR2(12),
  g28gtd_1   VARCHAR2(8),
  g28gtd_2   DATE,
  g28gtd_3   VARCHAR2(7),
  g281oth    VARCHAR2(30),
  g28zajmb   VARCHAR2(70),
  g28zajmn   VARCHAR2(50),
  g28211     VARCHAR2(1),
  g28212     VARCHAR2(2),
  g28221     VARCHAR2(3),
  g28222     VARCHAR2(1),
  g2823      DATE,
  g2824      DATE,
  g2825      VARCHAR2(3),
  g30_itn    VARCHAR2(13),
  g300       VARCHAR2(2),
  g3010      VARCHAR2(1),
  g301       VARCHAR2(21),
  g30        VARCHAR2(50),
  g30subd    VARCHAR2(50),
  g30city    VARCHAR2(35),
  g30street  VARCHAR2(50),
  g3012      VARCHAR2(8),
  recpasp    NUMBER(8),
  frm_decl   VARCHAR2(1),
  ed_idid    VARCHAR2(36),
  g28230     VARCHAR2(1),
  g28240     VARCHAR2(1),
  ed_ididkmp VARCHAR2(36),
  ed_ididcnt VARCHAR2(36),
  sds_cust   VARCHAR2(8),
  g1431n     VARCHAR2(40),
  g1431an    VARCHAR2(40),
  g147a      VARCHAR2(9),
  g182       VARCHAR2(2),
  g212       VARCHAR2(2),
  g3011      DATE,
  g30post    VARCHAR2(9),
  g30a       VARCHAR2(2),
  g30an      VARCHAR2(40),
  g30121     VARCHAR2(2),
  g30122     VARCHAR2(15),
  g5441nm    VARCHAR2(150),
  g5441mdnm  VARCHAR2(150),
  rccncode   VARCHAR2(2),
  dpresent   DATE,
  tpresent   VARCHAR2(8),
  g0231n     VARCHAR2(40),
  g027a      VARCHAR2(9),
  g023apost  VARCHAR2(9),
  g0231an    VARCHAR2(40),
  g023asubd  VARCHAR2(50),
  g023acity  VARCHAR2(35),
  g023astree VARCHAR2(50),
  g087a      VARCHAR2(9),
  g083apost  VARCHAR2(9),
  g0831aa    VARCHAR2(2),
  g0831an    VARCHAR2(40),
  g083asubd  VARCHAR2(50),
  g083acity  VARCHAR2(35),
  g083astree VARCHAR2(50),
  g0931n     VARCHAR2(40),
  g0931an    VARCHAR2(40),
  g097a      VARCHAR2(9),
  g029       VARCHAR2(1),
  g30lname   VARCHAR2(150),
  ed_procid  VARCHAR2(36),
  g231       NUMBER,
  remotepay  VARCHAR2(1),
  g5411aid   VARCHAR2(50),
  g5411adid  VARCHAR2(50),
  g5411modid VARCHAR2(10),
  g5411doc   VARCHAR2(5),
  g544aid    VARCHAR2(50),
  g544adid   VARCHAR2(50),
  g544modid  VARCHAR2(10),
  g544doc    VARCHAR2(5),
  val_contr  VARCHAR2(1),
  ps_contr   VARCHAR2(1),
  prprov541  VARCHAR2(1),
  prevnum541 VARCHAR2(50),
  prprov544  VARCHAR2(1),
  prevnum544 VARCHAR2(50),
  g545aid    VARCHAR2(50),
  g545adid   VARCHAR2(50),
  g545modid  VARCHAR2(10),
  g545doc    VARCHAR2(5),
  prprov545  VARCHAR2(1),
  prevnum545 VARCHAR2(50),
  gd01       VARCHAR2(250)
)
;
comment on table DBF_DCLHEAD
  is '������� DBF_DCLHEAD';
comment on column DBF_DCLHEAD.num_ver
  is '����� ������ ����������� ������� ��� XX.XX.XX � 07.10.00 (����� ������.����� ���������.����� �������)';
comment on column DBF_DCLHEAD.data_ver
  is '���� �������� � �������� ������ ����������� ������� ��� � 01.08.2014 �.';
comment on column DBF_DCLHEAD.typ_dcl
  is '---';
comment on column DBF_DCLHEAD.gugtk
  is '| C�������� ����';
comment on column DBF_DCLHEAD.copy
  is '|';
comment on column DBF_DCLHEAD.dcopy
  is '|';
comment on column DBF_DCLHEAD.q_edit
  is '|';
comment on column DBF_DCLHEAD.d_edit
  is '|';
comment on column DBF_DCLHEAD.sol
  is '|';
comment on column DBF_DCLHEAD.max_err
  is '|';
comment on column DBF_DCLHEAD.dd
  is '|';
comment on column DBF_DCLHEAD.tm
  is '---';
comment on column DBF_DCLHEAD.extrnl
  is '��������� ����';
comment on column DBF_DCLHEAD.schet
  is '��������� ���� (������� ������)';
comment on column DBF_DCLHEAD.stepctrl
  is '��������� ���� (����� ��������)';
comment on column DBF_DCLHEAD.typ_dtc
  is '������� ��� ("1"-����)';
comment on column DBF_DCLHEAD.vid_ktc
  is '������� ��� ("1"-����)';
comment on column DBF_DCLHEAD.ind_k
  is 'IND_K';
comment on column DBF_DCLHEAD.stat
  is '������� ����� � ���������� ���������� ������� ��������:0 ? ��� ��';
comment on column DBF_DCLHEAD.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLHEAD.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLHEAD.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLHEAD.ui_b_1
  is '���������� ������������� �� ������� ��� ����������� �������������';
comment on column DBF_DCLHEAD.ui_b_2
  is '���������� ������������� �� ������� ��� ����������� �������������';
comment on column DBF_DCLHEAD.ui_b_3
  is '���������� ������������� �� ������� ��� ����������� �������������';
comment on column DBF_DCLHEAD.sds_srv
  is '��������� ����, ������������ ��� ����� ������������ �������������';
comment on column DBF_DCLHEAD.sds_num
  is '��������� ����, ������������ ��� ����� ������������ �������������';
comment on column DBF_DCLHEAD.f_decl
  is '������� ���������� ����������� ����� ��������������: 1 - ��������';
comment on column DBF_DCLHEAD.g011
  is '��, ��. ������ ��������� ��.1 ��';
comment on column DBF_DCLHEAD.g012
  is 'G012';
comment on column DBF_DCLHEAD.g0131
  is '������� ������������� �� � ����� ������������ ���������. ��. ��.';
comment on column DBF_DCLHEAD.g020
  is '���� / ������';
comment on column DBF_DCLHEAD.g02_itn
  is '��� ��������� ���';
comment on column DBF_DCLHEAD.g021
  is '���';
comment on column DBF_DCLHEAD.g022
  is '������������ (�������, ���, ��������)';
comment on column DBF_DCLHEAD.g022a
  is '������� ������������ (������������ �������������)';
comment on column DBF_DCLHEAD.g023
  is 'G023';
comment on column DBF_DCLHEAD.g0231
  is '��� �����-2 ������  ���������������';
comment on column DBF_DCLHEAD.g0231a
  is '��� �����-2 ������  ��������������� (������������ �������������)';
comment on column DBF_DCLHEAD.g023a
  is 'G023A';
comment on column DBF_DCLHEAD.g024a
  is 'G024A';
comment on column DBF_DCLHEAD.g024p
  is 'G024P';
comment on column DBF_DCLHEAD.g024b
  is '��� ����� (����������� ������������� � ������������ � �������� ��';
comment on column DBF_DCLHEAD.g024c
  is 'G024C';
comment on column DBF_DCLHEAD.g024n
  is '��� ���� �����������������';
comment on column DBF_DCLHEAD.g024in
  is '��� ��� �����������������';
comment on column DBF_DCLHEAD.g027
  is '���';
comment on column DBF_DCLHEAD.g0281
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g0281a
  is '������� ������������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g02821
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g02822
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g02823
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLHEAD.g0283
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g032
  is '����� ���������� ������';
comment on column DBF_DCLHEAD.g04
  is '����� ���-�� ������ ������������, �������� � �������� ����������';
comment on column DBF_DCLHEAD.g05
  is '����� ������������ �������';
comment on column DBF_DCLHEAD.g06
  is '����� ���������� �������� ����';
comment on column DBF_DCLHEAD.g080
  is '���� / ������';
comment on column DBF_DCLHEAD.g08_itn
  is '��� ��������� ���';
comment on column DBF_DCLHEAD.g081
  is '���';
comment on column DBF_DCLHEAD.g082
  is '������������ (�������, ���, ��������)';
comment on column DBF_DCLHEAD.g082a
  is '������� ������������ (������������ �������������)';
comment on column DBF_DCLHEAD.g083
  is 'G083';
comment on column DBF_DCLHEAD.g0831
  is '��� �����-2 ������  ���������������';
comment on column DBF_DCLHEAD.g0831a
  is '������� �������� ������ ���������������';
comment on column DBF_DCLHEAD.g083a
  is 'G083A';
comment on column DBF_DCLHEAD.g084a
  is 'G084A';
comment on column DBF_DCLHEAD.g084p
  is 'G084P';
comment on column DBF_DCLHEAD.g084b
  is '��� ����� (����������� ������������� � ������������ � �������� ��';
comment on column DBF_DCLHEAD.g084c
  is 'G084C';
comment on column DBF_DCLHEAD.g087
  is '���';
comment on column DBF_DCLHEAD.g0881
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g0881a
  is '������� ������������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g08821
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g08822
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g08823
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLHEAD.g0883
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g089
  is '����������� ��������� ��������: 1-����������';
comment on column DBF_DCLHEAD.g090
  is '���� / ������';
comment on column DBF_DCLHEAD.g09_itn
  is '��� ��������� ���';
comment on column DBF_DCLHEAD.g091
  is '���';
comment on column DBF_DCLHEAD.g092
  is '������������ (�������, ���, ��������)';
comment on column DBF_DCLHEAD.g092a
  is '������� ������������  ������������� �������������';
comment on column DBF_DCLHEAD.g093
  is 'G093';
comment on column DBF_DCLHEAD.g093a
  is 'G093A';
comment on column DBF_DCLHEAD.g094a
  is 'G094A';
comment on column DBF_DCLHEAD.g094p
  is 'G094P';
comment on column DBF_DCLHEAD.g094b
  is '��� ����� (����������� ������������� � ������������ � �������� ��';
comment on column DBF_DCLHEAD.g094c
  is 'G094C';
comment on column DBF_DCLHEAD.g097
  is '���';
comment on column DBF_DCLHEAD.g0981
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g0981a
  is '������� ������������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g09821
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g09822
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g09823
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLHEAD.g0983
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g10
  is 'G10';
comment on column DBF_DCLHEAD.g11
  is '��� �����-2 ��������� ������';
comment on column DBF_DCLHEAD.g12
  is '����� ���������� ���������';
comment on column DBF_DCLHEAD.g121
  is '��������� ��� ������ ���������� ���������';
comment on column DBF_DCLHEAD.g13
  is 'G13';
comment on column DBF_DCLHEAD.g140
  is '���� / ������';
comment on column DBF_DCLHEAD.g14_itn
  is '��� ��������� ���';
comment on column DBF_DCLHEAD.g141
  is '���';
comment on column DBF_DCLHEAD.g142
  is '������������ (�������, ���, ��������)';
comment on column DBF_DCLHEAD.g142a
  is '������� ������������ ������������� �������������';
comment on column DBF_DCLHEAD.g143
  is 'G143';
comment on column DBF_DCLHEAD.g143a
  is 'G143A';
comment on column DBF_DCLHEAD.g144a
  is 'G144A';
comment on column DBF_DCLHEAD.g144p
  is 'G144P';
comment on column DBF_DCLHEAD.g144b
  is '��� ����� (����������� ������������� � ������������ � �������� ��';
comment on column DBF_DCLHEAD.g144c
  is 'G144C';
comment on column DBF_DCLHEAD.g144d1
  is 'G144D1';
comment on column DBF_DCLHEAD.g144d2
  is 'G144D2';
comment on column DBF_DCLHEAD.g144d3
  is 'G144D3';
comment on column DBF_DCLHEAD.g144e
  is 'G144E';
comment on column DBF_DCLHEAD.g145
  is 'G145';
comment on column DBF_DCLHEAD.g147
  is '���';
comment on column DBF_DCLHEAD.g1481
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g1481a
  is '������� ������������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g14821
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g14822
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g14823
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLHEAD.g1483
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g15
  is '������� �������� ������ �����������';
comment on column DBF_DCLHEAD.g15a
  is '��� �����-2 ������ �����������';
comment on column DBF_DCLHEAD.g16
  is '������� �������� ������ ������������� / ������ / ����������/�����';
comment on column DBF_DCLHEAD.g17a
  is '��� �����-2 ������ ���������� / 00';
comment on column DBF_DCLHEAD.g17b
  is '������� �������� ������ ���������� / ����������';
comment on column DBF_DCLHEAD.g180
  is '����� ���������� ������������ ������� ��� �����������/��������';
comment on column DBF_DCLHEAD.g19
  is '������� ������������ ���������';
comment on column DBF_DCLHEAD.g201
  is 'G201';
comment on column DBF_DCLHEAD.g202
  is '��������� ��� ������� (������) �������� �������';
comment on column DBF_DCLHEAD.g2021
  is '����� �������� ������� / ������';
comment on column DBF_DCLHEAD.g203
  is '����� �������� ������ � ������������ � ��������� �������� (������';
comment on column DBF_DCLHEAD.g210
  is '����� ���������� ������������ ������� �� �������';
comment on column DBF_DCLHEAD.g221
  is '��������� ��� ������ ���� ��������';
comment on column DBF_DCLHEAD.g222
  is '����� ��������� �������';
comment on column DBF_DCLHEAD.g23
  is '���� ������';
comment on column DBF_DCLHEAD.g230
  is '���� ���������� ����� ������ = ���� ����������� �� (����������� �';
comment on column DBF_DCLHEAD.g24
  is 'G24';
comment on column DBF_DCLHEAD.g25
  is 'G25';
comment on column DBF_DCLHEAD.g26
  is 'G26';
comment on column DBF_DCLHEAD.g270
  is '������';
comment on column DBF_DCLHEAD.g27_itn
  is '������';
comment on column DBF_DCLHEAD.g2710
  is '������';
comment on column DBF_DCLHEAD.g271
  is '������';
comment on column DBF_DCLHEAD.g27
  is '������';
comment on column DBF_DCLHEAD.g2711
  is '������';
comment on column DBF_DCLHEAD.g2712
  is '������';
comment on column DBF_DCLHEAD.g28_itn
  is '������';
comment on column DBF_DCLHEAD.g281
  is 'G281';
comment on column DBF_DCLHEAD.g2811
  is 'G2811';
comment on column DBF_DCLHEAD.g281d
  is 'G281D';
comment on column DBF_DCLHEAD.g281dd
  is 'G281DD';
comment on column DBF_DCLHEAD.g282
  is '������';
comment on column DBF_DCLHEAD.g282d
  is 'G282D';
comment on column DBF_DCLHEAD.g2831
  is 'G2831';
comment on column DBF_DCLHEAD.g283
  is 'G283';
comment on column DBF_DCLHEAD.g284
  is 'G284';
comment on column DBF_DCLHEAD.g284d
  is 'G284D';
comment on column DBF_DCLHEAD.g284dd
  is 'G284DD';
comment on column DBF_DCLHEAD.g4910
  is 'G4910';
comment on column DBF_DCLHEAD.g491
  is 'G491';
comment on column DBF_DCLHEAD.g492
  is 'G492';
comment on column DBF_DCLHEAD.g500
  is 'G500';
comment on column DBF_DCLHEAD.g50_itn
  is 'G50_ITN';
comment on column DBF_DCLHEAD.g5011
  is 'G5011';
comment on column DBF_DCLHEAD.g5012
  is 'G5012';
comment on column DBF_DCLHEAD.g5021
  is 'G5021';
comment on column DBF_DCLHEAD.g5022
  is 'G5022';
comment on column DBF_DCLHEAD.g5023
  is 'G5023';
comment on column DBF_DCLHEAD.g5031
  is 'G5031';
comment on column DBF_DCLHEAD.g5032
  is 'G5032';
comment on column DBF_DCLHEAD.g5033
  is 'G5033';
comment on column DBF_DCLHEAD.g504
  is 'G504';
comment on column DBF_DCLHEAD.g507
  is 'G507';
comment on column DBF_DCLHEAD.g5081
  is 'G5081';
comment on column DBF_DCLHEAD.g5081a
  is 'G5081A';
comment on column DBF_DCLHEAD.g50821
  is 'G50821';
comment on column DBF_DCLHEAD.g50822
  is 'G50822';
comment on column DBF_DCLHEAD.g50823
  is 'G50823';
comment on column DBF_DCLHEAD.g5083
  is 'G5083';
comment on column DBF_DCLHEAD.g502
  is 'G502';
comment on column DBF_DCLHEAD.g52
  is 'G52';
comment on column DBF_DCLHEAD.g54_itn
  is '��� ��������� ���';
comment on column DBF_DCLHEAD.g5410
  is '��� ���������: 2 ? ������������� �����������  ������������� (����';
comment on column DBF_DCLHEAD.g541
  is '����� ������������� � ��������� � ������ ���������� �������������';
comment on column DBF_DCLHEAD.g541d
  is '���� ������ ������������� � ��������� � ������ ���������� �������';
comment on column DBF_DCLHEAD.g5411
  is '����� �������� ����������� �������������  (�������) � �����������';
comment on column DBF_DCLHEAD.g5411d
  is '���� ���������� �������� ����������� �������������  (�������) � �';
comment on column DBF_DCLHEAD.g541_inn
  is '������';
comment on column DBF_DCLHEAD.g541_kpp
  is '������';
comment on column DBF_DCLHEAD.g542
  is '���� ����������� ��';
comment on column DBF_DCLHEAD.g5441
  is '�������';
comment on column DBF_DCLHEAD.g5442
  is '������ ��������� (���, ����� ��������) (����������� ? , ?)';
comment on column DBF_DCLHEAD.g5443
  is '������������ ���������, ��������������� ����������';
comment on column DBF_DCLHEAD.g5444
  is '����� ���������, ��������������� ����������';
comment on column DBF_DCLHEAD.g5445
  is '���� ���������, ��������������� ����������';
comment on column DBF_DCLHEAD.g5446
  is '���� ��������� ����������';
comment on column DBF_DCLHEAD.g5447
  is '���������';
comment on column DBF_DCLHEAD.g5451
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g5451a
  is '�������  ������������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g54521
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g54522
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.g54523
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLHEAD.g5453
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_DCLHEAD.ga1
  is 'GA1';
comment on column DBF_DCLHEAD.ga2
  is 'GA2';
comment on column DBF_DCLHEAD.ga1a
  is 'GA1A';
comment on column DBF_DCLHEAD.ga2a
  is 'GA2A';
comment on column DBF_DCLHEAD.gd0
  is '��� �������: - � ������������ � ��������������� �������, ��������';
comment on column DBF_DCLHEAD.gd1
  is '����';
comment on column DBF_DCLHEAD.gd11
  is '�����  (hh:mm:ss)';
comment on column DBF_DCLHEAD.gd2
  is '��� ������������ ����';
comment on column DBF_DCLHEAD.gd00
  is '�����������';
comment on column DBF_DCLHEAD.gddf
  is '���� ������������ ����������� �������';
comment on column DBF_DCLHEAD.gd3
  is 'GD3';
comment on column DBF_DCLHEAD.gd4
  is 'GD4';
comment on column DBF_DCLHEAD.recplatv
  is 'DCLPLATV';
comment on column DBF_DCLHEAD.recslotm
  is 'DCLSLOTM';
comment on column DBF_DCLHEAD.rectrans
  is 'DCLTRANS';
comment on column DBF_DCLHEAD.recsumpp
  is 'DCLSUMPP';
comment on column DBF_DCLHEAD.recmhc50
  is 'RECMHC50';
comment on column DBF_DCLHEAD.recusl
  is 'RECUSL';
comment on column DBF_DCLHEAD.pprr
  is '��������� ����';
comment on column DBF_DCLHEAD.pprv
  is '��������� ����';
comment on column DBF_DCLHEAD.pposh
  is '��������� ����';
comment on column DBF_DCLHEAD.pnal
  is '��������� ����';
comment on column DBF_DCLHEAD.gnuser
  is '��������� ����';
comment on column DBF_DCLHEAD.flduser
  is '��������� ����';
comment on column DBF_DCLHEAD.nrelise
  is '����������� ����';
comment on column DBF_DCLHEAD.kodtop
  is '��� ��������������� �������� �����������:-�001- ��� �������� ���';
comment on column DBF_DCLHEAD.g071top
  is '��������������� ����� �� ? ��� ������� (������������ ��������) ?';
comment on column DBF_DCLHEAD.g072top
  is '��������������� ����� �� ? ���� ����������� (������������ �������';
comment on column DBF_DCLHEAD.g073top
  is '��������������� ����� �� ? ���������� ����� (������������ �������';
comment on column DBF_DCLHEAD.typdtop
  is '��� ��������� (����������� ������ KODTOP=?001? ��� KODTOP=?002?)';
comment on column DBF_DCLHEAD.numdtop
  is '����� ��������� (����������� ������ KODTOP=?001? ��� KODTOP=?002?';
comment on column DBF_DCLHEAD.datdtop
  is '���� ��������� (����������� ������ KODTOP=?001? ��� KODTOP=?002?)';
comment on column DBF_DCLHEAD.fiotop
  is '��� ������������ ����, �������� ���������� �� ����������� �������';
comment on column DBF_DCLHEAD.dattop
  is '���� �������� ���������� �� ����������� ��������������� ��������';
comment on column DBF_DCLHEAD.dmodify
  is '���� ����� / ���� ��������� ����������� ���������� ������ �������';
comment on column DBF_DCLHEAD.tmodify
  is '����� ����� / ��������� ����������� ���������� ������ �����������';
comment on column DBF_DCLHEAD.gd5lnp
  is 'GD5LNP';
comment on column DBF_DCLHEAD.gd5
  is 'GD5';
comment on column DBF_DCLHEAD.g5452
  is 'G5452';
comment on column DBF_DCLHEAD.gb_kd
  is 'GB_KD';
comment on column DBF_DCLHEAD.gb_rub
  is 'GB_RUB';
comment on column DBF_DCLHEAD.g474_rub
  is 'G474_RUB';
comment on column DBF_DCLHEAD.g204
  is 'G204';
comment on column DBF_DCLHEAD.g146d
  is 'G146D';
comment on column DBF_DCLHEAD.g146a
  is 'G146A';
comment on column DBF_DCLHEAD.g096d
  is 'G096D';
comment on column DBF_DCLHEAD.g096a
  is 'G096A';
comment on column DBF_DCLHEAD.g086d
  is 'G086D';
comment on column DBF_DCLHEAD.g086a
  is 'G086A';
comment on column DBF_DCLHEAD.g026d
  is 'G026D';
comment on column DBF_DCLHEAD.g026a
  is 'G026A';
comment on column DBF_DCLHEAD.lnpbegctrl
  is 'LNPBEGCTRL';
comment on column DBF_DCLHEAD.tbegctrl
  is 'TBEGCTRL';
comment on column DBF_DCLHEAD.dbegctrl
  is 'DBEGCTRL';
comment on column DBF_DCLHEAD.tpriem
  is 'TPRIEM';
comment on column DBF_DCLHEAD.id
  is 'ID';
comment on column DBF_DCLHEAD.load_id
  is 'LOAD_ID';
comment on column DBF_DCLHEAD.p_status1
  is '���������� ������ ��. (1 - ������������������ ��; 2 ? �����������';
comment on column DBF_DCLHEAD.p_status2
  is '������ ��������� ��. (�� ���������; 1 ?  �������� ������� �� ����';
comment on column DBF_DCLHEAD.edoc_id
  is '������������� ��������� � ������';
comment on column DBF_DCLHEAD.edoc_guid
  is '���������� ������������� ��. ����������� �������� ����������� ���';
comment on column DBF_DCLHEAD.complectbl
  is '������';
comment on column DBF_DCLHEAD.g0121
  is '��� ���������� ��������� � ������������ � ��������������� ����� �';
comment on column DBF_DCLHEAD.g023post
  is '���, ������������ �������� ����';
comment on column DBF_DCLHEAD.g0231c
  is 'G0231C';
comment on column DBF_DCLHEAD.g023subd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g023city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLHEAD.g023street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_DCLHEAD.g040
  is '����� ���-�� ������������, �������� � �������� ����������';
comment on column DBF_DCLHEAD.g07
  is '��� ����������� �������������� ������� � ������������ � ���������';
comment on column DBF_DCLHEAD.g083post
  is '���, ������������ �������� ����';
comment on column DBF_DCLHEAD.g0831c
  is 'G0831C';
comment on column DBF_DCLHEAD.g083subd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g083city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLHEAD.g083street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_DCLHEAD.g093post
  is '���, ������������ �������� ����';
comment on column DBF_DCLHEAD.g0931
  is '��� �����-2 ������  ���������������';
comment on column DBF_DCLHEAD.g093subd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g093city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLHEAD.g093street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_DCLHEAD.g093apost
  is '���, ������������ �������� ���� (������������ �������������)';
comment on column DBF_DCLHEAD.g0931a
  is '��� �����-2 ������  ��������������� (������������ �������������)';
comment on column DBF_DCLHEAD.g093asubd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g093acity
  is '�������� ����������� ������ (����� � �.�.) (������������ ��������';
comment on column DBF_DCLHEAD.g093astree
  is '�������� �����, ����� ����, ����� ����� /�������� (������������ �';
comment on column DBF_DCLHEAD.g11c
  is 'G11C';
comment on column DBF_DCLHEAD.g143post
  is '���, ������������ �������� ����';
comment on column DBF_DCLHEAD.g1431
  is '��� �����-2 ������  ���������������';
comment on column DBF_DCLHEAD.g143subd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g143city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLHEAD.g143street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_DCLHEAD.g143apost
  is '���, ������������ �������� ���� (������������ �������������)';
comment on column DBF_DCLHEAD.g1431a
  is '��� �����-2 ������  ��������������� (������������ �������������)';
comment on column DBF_DCLHEAD.g143asubd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g143acity
  is '�������� ����������� ������ (����� � �.�.) (������������ ��������';
comment on column DBF_DCLHEAD.g143astree
  is '�������� �����, ����� ����, ����� ����� /�������� (������������ �';
comment on column DBF_DCLHEAD.g15ac
  is 'G15AC';
comment on column DBF_DCLHEAD.g160
  is 'G160';
comment on column DBF_DCLHEAD.g161
  is 'G161';
comment on column DBF_DCLHEAD.g17ac
  is 'G17AC';
comment on column DBF_DCLHEAD.g221c
  is 'G221C';
comment on column DBF_DCLHEAD.g2810
  is 'G2810';
comment on column DBF_DCLHEAD.g28okpo
  is '������';
comment on column DBF_DCLHEAD.g28inn
  is '������';
comment on column DBF_DCLHEAD.g28gtd_1
  is 'G28GTD_1';
comment on column DBF_DCLHEAD.g28gtd_2
  is 'G28GTD_2';
comment on column DBF_DCLHEAD.g28gtd_3
  is 'G28GTD_3';
comment on column DBF_DCLHEAD.g281oth
  is '������';
comment on column DBF_DCLHEAD.g28zajmb
  is 'G28ZAJMB';
comment on column DBF_DCLHEAD.g28zajmn
  is '������';
comment on column DBF_DCLHEAD.g28211
  is '������';
comment on column DBF_DCLHEAD.g28212
  is '��� ����������� ������ (��������). � ������������ � �������������';
comment on column DBF_DCLHEAD.g28221
  is '��� ��������� ������ � �������������� �������� � ������������ � �';
comment on column DBF_DCLHEAD.g28222
  is '������';
comment on column DBF_DCLHEAD.g2823
  is '������';
comment on column DBF_DCLHEAD.g2824
  is '������';
comment on column DBF_DCLHEAD.g2825
  is '������';
comment on column DBF_DCLHEAD.g30_itn
  is '������';
comment on column DBF_DCLHEAD.g300
  is '��� ����������: 11 ���
21 ��
25 ��������� �����
31 ����� ��������';
comment on column DBF_DCLHEAD.g3010
  is '��� ��������� (��� ����� ���������� 11,21,25): 1-�������� 2-�����';
comment on column DBF_DCLHEAD.g301
  is '����� ������������� � ��������� � ������ ���������� ���/��, �����';
comment on column DBF_DCLHEAD.g30
  is '����� ��������� (��� 60, 99, 31, 41)/��� �� (��� 52)';
comment on column DBF_DCLHEAD.g30subd
  is '�����  ���������������  - �������� ������� ��������������� -�����';
comment on column DBF_DCLHEAD.g30city
  is '����� ��������������� ������� -�������� ����������� ������ (�����';
comment on column DBF_DCLHEAD.g30street
  is '����� ��������������� ������� ? �������� ����� � �.�.';
comment on column DBF_DCLHEAD.g3012
  is '��� ����������� ������, � ������� ������������ �������� ���������';
comment on column DBF_DCLHEAD.recpasp
  is 'DCLPASP';
comment on column DBF_DCLHEAD.frm_decl
  is 'FRM_DECL';
comment on column DBF_DCLHEAD.ed_idid
  is 'ED_IDID';
comment on column DBF_DCLHEAD.g28230
  is '������';
comment on column DBF_DCLHEAD.g28240
  is '������';
comment on column DBF_DCLHEAD.ed_ididkmp
  is 'ED_IDIDKMP';
comment on column DBF_DCLHEAD.ed_ididcnt
  is 'ED_IDIDCNT';
comment on column DBF_DCLHEAD.sds_cust
  is '��� ������������� ����������� ������. ����������� ��� �����������';
comment on column DBF_DCLHEAD.g1431n
  is '������� �������� ������ ���������������';
comment on column DBF_DCLHEAD.g1431an
  is '������� �������� ������ ��������������� (������������ �����������';
comment on column DBF_DCLHEAD.g147a
  is '��� (������������ �������������)';
comment on column DBF_DCLHEAD.g182
  is '��� �����-2 ������ ����������� ������������ ������� ��� ���������';
comment on column DBF_DCLHEAD.g212
  is '��� �����-2 ������ ����������� ������������ ������� �� �������';
comment on column DBF_DCLHEAD.g3011
  is '���� ������ ������������� � ��������� � ������,  ���� ������ ����';
comment on column DBF_DCLHEAD.g30post
  is '����� ��������������� - ���, ������������ �������� ����';
comment on column DBF_DCLHEAD.g30a
  is '����� ��������������� ? ��� �����-2 ������';
comment on column DBF_DCLHEAD.g30an
  is '����� ��������������� ? ������� �������� ������';
comment on column DBF_DCLHEAD.g30121
  is '��� ������ ����������� ������';
comment on column DBF_DCLHEAD.g30122
  is '��������������� ����� ���� ����������� ��������';
comment on column DBF_DCLHEAD.g5441nm
  is '���';
comment on column DBF_DCLHEAD.g5441mdnm
  is '��������';
comment on column DBF_DCLHEAD.rccncode
  is '��� ������ ����������� ������, �������� �������������� ��������';
comment on column DBF_DCLHEAD.dpresent
  is '���� ������ �� (�������� ��� � �� ����������� ������)';
comment on column DBF_DCLHEAD.tpresent
  is '����� ������ �� (�������� ��� � �� ����������� ������)';
comment on column DBF_DCLHEAD.g0231n
  is '������� �������� ������  ���������������';
comment on column DBF_DCLHEAD.g027a
  is '��� (������������ �������������)';
comment on column DBF_DCLHEAD.g023apost
  is '���, ������������ �������� ���� (������������ �������������)';
comment on column DBF_DCLHEAD.g0231an
  is '������� �������� ������  ��������������� (���������.���������.)';
comment on column DBF_DCLHEAD.g023asubd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g023acity
  is '�������� ����������� ������ (����� � �.�.) (������������ ��������';
comment on column DBF_DCLHEAD.g023astree
  is '�������� �����, ����� ����, ����� ����� /�������� (������������ �';
comment on column DBF_DCLHEAD.g087a
  is '��� (������������ �������������)';
comment on column DBF_DCLHEAD.g083apost
  is '���, ������������ �������� ���� (������������ �������������)';
comment on column DBF_DCLHEAD.g0831aa
  is '��� �����-2 ������  ��������������� (������������ �������������)';
comment on column DBF_DCLHEAD.g0831an
  is '������� �������� ������  ��������������� (���������.���������.)';
comment on column DBF_DCLHEAD.g083asubd
  is '�������� ������� ��������������� -���������������� ������� ������';
comment on column DBF_DCLHEAD.g083acity
  is '�������� ����������� ������ (����� � �.�.) (������������ ��������';
comment on column DBF_DCLHEAD.g083astree
  is '�������� �����, ����� ����, ����� ����� /�������� (������������ �';
comment on column DBF_DCLHEAD.g0931n
  is '������� �������� ������ ���������������';
comment on column DBF_DCLHEAD.g0931an
  is '������� �������� ������ ��������������� (������������ �����������';
comment on column DBF_DCLHEAD.g097a
  is '��� (������������ �������������)';
comment on column DBF_DCLHEAD.g029
  is '����������� ��������� ��������: 1-����������';
comment on column DBF_DCLHEAD.g30lname
  is '������������ ��������������� ������� / �������� (�������) �����';
comment on column DBF_DCLHEAD.ed_procid
  is 'ED_PROCID';
comment on column DBF_DCLHEAD.g231
  is 'G231';
comment on column DBF_DCLHEAD.remotepay
  is '������� ��������� ������ ���������� �������� � ������';
comment on column DBF_DCLHEAD.g5411aid
  is '������������� ������������ ������ ����������, ��� �������� ������� ����������� �������������';
comment on column DBF_DCLHEAD.g5411adid
  is '������������� �������� ����������� �������������  � ����������� ������ ����������';
comment on column DBF_DCLHEAD.g5411modid
  is '��� ��������� - ������� ����������� �������������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
comment on column DBF_DCLHEAD.g5411doc
  is '��� ���� ��������� - ������� ����������� �������������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_DCLHEAD.g544aid
  is '������������� ������������ ������ ����������, ��� �������� ��������, �������������� ����������';
comment on column DBF_DCLHEAD.g544adid
  is '������������� ���������, ��������������� ����������  � ����������� ������ ����������';
comment on column DBF_DCLHEAD.g544modid
  is '��� ��������� ��������������� ����������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
comment on column DBF_DCLHEAD.g544doc
  is '��� ���� ���������, ��������������� ����������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_DCLHEAD.val_contr
  is '������� ������� ���������� � ��������� ����� ����� �� ����� � ���� ������ � ����� ������������ �������� �������� ������� � ������ ����������� (0 � ������� �����������, 1 - ������� ������������)';
comment on column DBF_DCLHEAD.ps_contr
  is '��������� ������ �������� �� �� � �������� ������: 0 � �� �� ������� � �� ��� �� �������, 1 � �� �� �������� � ��, 2 � �� �������� � ��, ����������� ���, 3 � ���������� ����������� �� � ��, ���������� (��� F_DECL= 3 � 4) ���������� �� �������������';
comment on column DBF_DCLHEAD.prprov541
  is '������� ������������� �������� ����������� �������������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_DCLHEAD.prevnum541
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_DCLHEAD.prprov544
  is '������� ������������� ���������, ��������������� ����������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_DCLHEAD.prevnum544
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_DCLHEAD.g545aid
  is '������������� ������������ ������ ����������, ��� �������� ��������, �������������� ��������';
comment on column DBF_DCLHEAD.g545adid
  is '������������� ���������, ��������������� ��������, � ����������� ������ ����������';
comment on column DBF_DCLHEAD.g545modid
  is '��� ���������, ��������������� ��������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
comment on column DBF_DCLHEAD.g545doc
  is '��� ���� ���������, ��������������� ��������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_DCLHEAD.prprov545
  is '������� ������������� ���������, ��������������� ��������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_DCLHEAD.prevnum545
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_DCLHEAD.gd01
  is '�������� ��������� �������';
create index DBF_DCLHEAD_ID on DBF_DCLHEAD (ID);
create index DBF_DCLHEAD_LOAD_ID on DBF_DCLHEAD (LOAD_ID);
alter table DBF_DCLHEAD
  add constraint DCLHEAD_PK primary key (G071, G072, G073);

prompt
prompt Creating table DBF_DCLKMP
prompt =========================
prompt
create table DBF_DCLKMP
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  g32       FLOAT not null,
  kmpfb     FLOAT,
  kmpnm     VARCHAR2(250),
  kmpkod    VARCHAR2(10),
  kmpadd    VARCHAR2(3),
  kmpqadd   FLOAT,
  kmpqmain  FLOAT,
  kmppr     FLOAT,
  kmpprval  VARCHAR2(3),
  kmpqk     FLOAT,
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT
)
;
comment on table DBF_DCLKMP
  is '������� DBF_DCLKMP';
comment on column DBF_DCLKMP.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLKMP.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLKMP.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLKMP.g32
  is '����� ������ �� ��';
comment on column DBF_DCLKMP.kmpfb
  is '����� ��������������� ����� (��) /����� ����';
comment on column DBF_DCLKMP.kmpnm
  is 'KMPNM';
comment on column DBF_DCLKMP.kmpkod
  is '��� �� �� ��� ��';
comment on column DBF_DCLKMP.kmpadd
  is '��� �������������� ������� ���������';
comment on column DBF_DCLKMP.kmpqadd
  is '���������� � �������������� ������� ��������';
comment on column DBF_DCLKMP.kmpqmain
  is '��� ����� � ��';
comment on column DBF_DCLKMP.kmppr
  is '��������� ���������';
comment on column DBF_DCLKMP.kmpprval
  is '��������� ��� ������ ��������� ���������';
comment on column DBF_DCLKMP.kmpqk
  is '����� ���������� ���������,  �� ������� ����';
comment on column DBF_DCLKMP.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLKMP.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLKMP.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLKMP.p_edoc_id
  is '������ �� ������������� ��������� � ������';
alter table DBF_DCLKMP
  add constraint DBF_DCLKMP_PK primary key (G071, G072, G073, G32, DMODIFY, TMODIFY);

prompt
prompt Creating table DBF_DCLPLATR
prompt ===========================
prompt
create table DBF_DCLPLATR
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  g32       FLOAT,
  g470      NUMBER(1),
  g471      VARCHAR2(4),
  g47_k     VARCHAR2(2),
  g472      FLOAT,
  g4721     VARCHAR2(3),
  g473      FLOAT,
  g4731     VARCHAR2(1),
  g4732     VARCHAR2(3),
  g4733     VARCHAR2(3),
  g4734     FLOAT,
  npp       FLOAT,
  g474      FLOAT,
  g4741     VARCHAR2(3),
  g475      VARCHAR2(2),
  g473z1_2  VARCHAR2(1),
  g473_2    FLOAT,
  g4731_2   VARCHAR2(1),
  g4732_2   VARCHAR2(3),
  g4733_2   VARCHAR2(3),
  g4734_2   FLOAT,
  g473z1_3  VARCHAR2(1),
  g473_3    FLOAT,
  g4731_3   VARCHAR2(1),
  g4732_3   VARCHAR2(3),
  g4733_3   VARCHAR2(3),
  g4734_3   FLOAT,
  g473z2_2  FLOAT,
  g4730     DATE,
  g4740     DATE,
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  id        INTEGER not null,
  g471npp   NUMBER,
  g47_nd    NUMBER,
  g47_ns    NUMBER,
  g47_nm    NUMBER,
  g47_tr    NUMBER,
  g47_g40   NUMBER,
  g4722     VARCHAR2(50),
  load_id   INTEGER
)
;
comment on table DBF_DCLPLATR
  is '������� DBF_DCLPLATR';
comment on column DBF_DCLPLATR.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLPLATR.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLPLATR.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLPLATR.g32
  is '����� ������ �� ��';
comment on column DBF_DCLPLATR.g470
  is '������';
comment on column DBF_DCLPLATR.g471
  is '��� ���� ������� � ������������ � �������������';
comment on column DBF_DCLPLATR.g47_k
  is 'G47_K';
comment on column DBF_DCLPLATR.g472
  is '������ ����������';
comment on column DBF_DCLPLATR.g4721
  is '�������� ��� ������ ������ ���������� (��������';
comment on column DBF_DCLPLATR.g473
  is '������/������ ����������������';
comment on column DBF_DCLPLATR.g4731
  is '��� ������ (���������� ??%?, ������������� ? ?*';
comment on column DBF_DCLPLATR.g4732
  is '�������� ��� ������ ������ (������������� �����';
comment on column DBF_DCLPLATR.g4733
  is '��� ������� ��������� ������ (������������� ���';
comment on column DBF_DCLPLATR.g4734
  is '������� ����������� ������� ��������� (��������';
comment on column DBF_DCLPLATR.npp
  is '������� �������������� ������:
    0 ? ��������';
comment on column DBF_DCLPLATR.g474
  is '����� �������';
comment on column DBF_DCLPLATR.g4741
  is '�������� ��� ������ ����� �������';
comment on column DBF_DCLPLATR.g475
  is '������ (���������) �������';
comment on column DBF_DCLPLATR.g473z1_2
  is '���� �������� ���������';
comment on column DBF_DCLPLATR.g473_2
  is '������';
comment on column DBF_DCLPLATR.g4731_2
  is '��� ������ (���������� ??%?, ������������� ? ?*';
comment on column DBF_DCLPLATR.g4732_2
  is '�������� ��� ������ ������ (������������� �����';
comment on column DBF_DCLPLATR.g4733_2
  is '��� ������� ��������� ������ (������������� ���';
comment on column DBF_DCLPLATR.g4734_2
  is '������� ����������� ������� ��������� (��������';
comment on column DBF_DCLPLATR.g473z1_3
  is '���� ��������';
comment on column DBF_DCLPLATR.g473_3
  is '������';
comment on column DBF_DCLPLATR.g4731_3
  is '��� ������ (���������� ??%?, ������������� ? ?*';
comment on column DBF_DCLPLATR.g4732_3
  is '�������� ��� ������ ������ (������������� �����';
comment on column DBF_DCLPLATR.g4733_3
  is '��� ������� ��������� ������ (������������� ���';
comment on column DBF_DCLPLATR.g4734_3
  is '������� ����������� ������� ��������� (��������';
comment on column DBF_DCLPLATR.g473z2_2
  is '��������� ���������� �������� ���������:
-�����';
comment on column DBF_DCLPLATR.g4730
  is '���� ���������� ������ ����������� �������';
comment on column DBF_DCLPLATR.g4740
  is '������';
comment on column DBF_DCLPLATR.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLPLATR.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLPLATR.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLPLATR.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLPLATR.id
  is 'ID';
comment on column DBF_DCLPLATR.g471npp
  is '���������� ����� ������ �� ���� �������';
comment on column DBF_DCLPLATR.g47_nd
  is '���������� ����';
comment on column DBF_DCLPLATR.g47_ns
  is '���������� ������';
comment on column DBF_DCLPLATR.g47_nm
  is '����� ������ � �������� ����������� �������';
comment on column DBF_DCLPLATR.g47_tr
  is '������� �� ������ ����������������';
comment on column DBF_DCLPLATR.g47_g40
  is '���������� ����� ������ � 40 �����';
comment on column DBF_DCLPLATR.g4722
  is '����� ������ (������ �����) � ������������ � �� ��� ��';
comment on column DBF_DCLPLATR.load_id
  is 'LOAD_ID';
create index DBF_DCLPLATR_ID on DBF_DCLPLATR (ID);
create index DBF_DCLPLATR_INX on DBF_DCLPLATR (G071, G072, G073);
create index DBF_DCLPLATR_INX2 on DBF_DCLPLATR (G071, G072, G073, G471, G475);
create index DBF_DCLPLATR_LOAD_ID on DBF_DCLPLATR (LOAD_ID);
alter table DBF_DCLPLATR
  add constraint DCLPLATR_UQ unique (G071, G072, G073, G32, G471, G4731, NPP, G471NPP);
alter table DBF_DCLPLATR
  add constraint DCLPLATR_HEAD foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DCLPLATV
prompt ===========================
prompt
create table DBF_DCLPLATV
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  gb0       NUMBER(1),
  gb1       VARCHAR2(4),
  gb_k      VARCHAR2(2),
  gb1_1     NUMBER(1),
  gb2       FLOAT,
  gb3       VARCHAR2(3),
  gb4       FLOAT,
  gb5       VARCHAR2(2),
  iret      FLOAT,
  g48       DATE,
  g481      VARCHAR2(1),
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  g482      VARCHAR2(50),
  g482d     DATE,
  load_id   INTEGER,
  id        INTEGER
)
;
comment on table DBF_DCLPLATV
  is '������� DBF_DCLPLATV';
comment on column DBF_DCLPLATV.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLPLATV.g072
  is '��������������� ����� �� ? ���� �������';
comment on column DBF_DCLPLATV.g073
  is '��������������� ����� �� ? ���������� �';
comment on column DBF_DCLPLATV.gb0
  is '������';
comment on column DBF_DCLPLATV.gb1
  is '��� ���� ������� � ������������ � �����';
comment on column DBF_DCLPLATV.gb_k
  is 'GB_K';
comment on column DBF_DCLPLATV.gb1_1
  is 'GB1_1';
comment on column DBF_DCLPLATV.gb2
  is '����� ������� / �����������';
comment on column DBF_DCLPLATV.gb3
  is '�������� ��� ������ ����� ������� / ���';
comment on column DBF_DCLPLATV.gb4
  is '���� ������ ������� / �����������';
comment on column DBF_DCLPLATV.gb5
  is '������ ������/��� ���� ����������� ����';
comment on column DBF_DCLPLATV.iret
  is '������� �������� �������� �������: ?-1?';
comment on column DBF_DCLPLATV.g48
  is '���� ���������� ��� �������� ������';
comment on column DBF_DCLPLATV.g481
  is '����������� ������ ���������� ��������:1-��� �����������';
comment on column DBF_DCLPLATV.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLPLATV.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLPLATV.tmodify
  is '����� ����� / ����������� ������ (��:��';
comment on column DBF_DCLPLATV.p_edoc_id
  is '������ �� ������������� ��������� � ���';
comment on column DBF_DCLPLATV.g482
  is '����� ���������� �� ��������, ���������';
comment on column DBF_DCLPLATV.g482d
  is '���� ����������';
comment on column DBF_DCLPLATV.load_id
  is 'LOAD_ID';
comment on column DBF_DCLPLATV.id
  is 'ID';
create index DBF_DCLPLATV_INX on DBF_DCLPLATV (G071, G072, G073);
alter table DBF_DCLPLATV
  add constraint DCLPLATV_UQ unique (G071, G072, G073, GB1, GB1_1, GB3, IRET, GB5, NZP, GB2);
alter table DBF_DCLPLATV
  add constraint DCLPLATV_HEAD foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DCLPREDD
prompt ===========================
prompt
create table DBF_DCLPREDD
(
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(7) not null,
  g32        FLOAT not null,
  g40_0      VARCHAR2(2),
  g40_1      VARCHAR2(8) not null,
  g40_2      DATE not null,
  g40_3      VARCHAR2(7) not null,
  g40_4      FLOAT not null,
  nzp        FLOAT,
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  id         INTEGER,
  p_edoc_id  NUMBER(19),
  g40_21     VARCHAR2(2),
  g40_naim   VARCHAR2(250),
  numrec     NUMBER,
  g40_cntry  VARCHAR2(2),
  g40_doctyp VARCHAR2(5),
  g40_g45    NUMBER(17,2),
  g40_g38    NUMBER(19,6),
  load_id    INTEGER
)
;
comment on table DBF_DCLPREDD
  is '������� DBF_DCLPREDD';
comment on column DBF_DCLPREDD.g071
  is '��������������� ����� �� ? ��� ������';
comment on column DBF_DCLPREDD.g072
  is '��������������� ����� �� ? ���� �����';
comment on column DBF_DCLPREDD.g073
  is '��������������� ����� �� ? ����������';
comment on column DBF_DCLPREDD.g32
  is '����� ������ �� ��';
comment on column DBF_DCLPREDD.g40_0
  is '������';
comment on column DBF_DCLPREDD.g40_1
  is 'G40_1';
comment on column DBF_DCLPREDD.g40_2
  is '�������������� �������� ? ����';
comment on column DBF_DCLPREDD.g40_3
  is '�������������� �������� ? ����������';
comment on column DBF_DCLPREDD.g40_4
  is '����� ������ � �������������� �������';
comment on column DBF_DCLPREDD.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLPREDD.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLPREDD.tmodify
  is '����� ����� / ����������� ������ (��:';
comment on column DBF_DCLPREDD.id
  is 'ID';
comment on column DBF_DCLPREDD.p_edoc_id
  is '������ �� ������������� ��������� � �';
comment on column DBF_DCLPREDD.g40_21
  is '������.';
comment on column DBF_DCLPREDD.g40_naim
  is 'G40_NAIM';
comment on column DBF_DCLPREDD.numrec
  is '���������� ����� ������ �� �����';
comment on column DBF_DCLPREDD.g40_cntry
  is '��� ������ ����������� ������';
comment on column DBF_DCLPREDD.g40_doctyp
  is '��� ���� ��������������� ��������� �';
comment on column DBF_DCLPREDD.g40_g45
  is '��� - ���������� ��������� ������, ��������� � ��. 45';
comment on column DBF_DCLPREDD.g40_g38
  is '��� - ����� ����� ������, ��������� � ��. 38';
comment on column DBF_DCLPREDD.load_id
  is 'LOAD_ID';
create index DBF_DCLPREDD_ID on DBF_DCLPREDD (ID);
create index DBF_DCLPREDD_LOAD_ID on DBF_DCLPREDD (LOAD_ID);
alter table DBF_DCLPREDD
  add constraint DBF_DCLPREDD_PK primary key (G071, G072, G073, G32, G40_1, G40_2, G40_3, G40_4);

prompt
prompt Creating table DBF_DCLSLOTM
prompt ===========================
prompt
create table DBF_DCLSLOTM
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  ngr       VARCHAR2(2),
  gc_01     VARCHAR2(1),
  gc_02     VARCHAR2(2),
  gc_03     VARCHAR2(1),
  nrecc     FLOAT,
  krecc     VARCHAR2(2),
  gc_1      VARCHAR2(150),
  gc_2      DATE,
  gc_21     VARCHAR2(8),
  gc_3      FLOAT,
  gc_31     VARCHAR2(4),
  gc_32     FLOAT,
  gc_4      VARCHAR2(3),
  gc_5      VARCHAR2(17),
  gc_6      VARCHAR2(4),
  gc_7      VARCHAR2(40),
  gc_8      DATE,
  gc_81     VARCHAR2(8),
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  gc_doc    VARCHAR2(50),
  gc_docd   DATE,
  gc_9      DATE,
  gc_nm_itn VARCHAR2(13),
  gc_nm     VARCHAR2(150),
  gc_ogrn   VARCHAR2(15),
  gc_inn    VARCHAR2(12),
  gc_kpp    VARCHAR2(9),
  gc_ktam   VARCHAR2(8),
  gc_10     DATE,
  gc_doc0   VARCHAR2(1),
  gc_9m     NUMBER(2),
  g�_3      NUMBER,
  gc_nresh  VARCHAR2(29),
  inpi_guid VARCHAR2(32),
  gc_2k     VARCHAR2(2),
  gc_opoutp VARCHAR2(1),
  gc_ksoutp VARCHAR2(2),
  load_id   INTEGER,
  gc_42     VARCHAR2(3)
)
;
comment on table DBF_DCLSLOTM
  is '������� DBF_DCLSLOTM';
comment on column DBF_DCLSLOTM.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLSLOTM.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLSLOTM.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLSLOTM.ngr
  is '����������� ����� (���������� �����) (A,C,D,E1,E2,28';
comment on column DBF_DCLSLOTM.gc_01
  is '������������� ������������� ��������������� �������';
comment on column DBF_DCLSLOTM.gc_02
  is '������������� ������������� ��������������� �������';
comment on column DBF_DCLSLOTM.gc_03
  is '��� ������������� ��������������� �������:1-�������, ���������� �� ������� ����� ���� �������� 2-����������, ���������� ������� �������� ������ � �';
comment on column DBF_DCLSLOTM.nrecc
  is '���������� ����� ������ �� �������������� ����������';
comment on column DBF_DCLSLOTM.krecc
  is '��� ���� ����������  (SKRECC)';
comment on column DBF_DCLSLOTM.gc_1
  is '��������� ������';
comment on column DBF_DCLSLOTM.gc_2
  is '���� ������������ ������� / ���� �������� ������� �';
comment on column DBF_DCLSLOTM.gc_21
  is '�����';
comment on column DBF_DCLSLOTM.gc_3
  is '����� �������� �������/ ��������� ����� ��������� �';
comment on column DBF_DCLSLOTM.gc_31
  is '��� ���� ������� � ������������ � ���������������  �';
comment on column DBF_DCLSLOTM.gc_32
  is '������� �� �������������� �������� / ��������� �����';
comment on column DBF_DCLSLOTM.gc_4
  is '�������� ��� ������ �������� ������� / ��� ������� �';
comment on column DBF_DCLSLOTM.gc_5
  is '������������ ������ �������� ������� / ������� �����';
comment on column DBF_DCLSLOTM.gc_6
  is '����� ��� ����������, ����������� ������';
comment on column DBF_DCLSLOTM.gc_7
  is '��� ����������, ����������� ������';
comment on column DBF_DCLSLOTM.gc_8
  is '���� ������������ ������� ����������� ������';
comment on column DBF_DCLSLOTM.gc_81
  is '����� ������������ ������� ����������� ������ (hh:mm:ss) ';
comment on column DBF_DCLSLOTM.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLSLOTM.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLSLOTM.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLSLOTM.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLSLOTM.gc_doc
  is '����� ���������';
comment on column DBF_DCLSLOTM.gc_docd
  is '���� ���������';
comment on column DBF_DCLSLOTM.gc_9
  is '����';
comment on column DBF_DCLSLOTM.gc_nm_itn
  is '��� �������� ���';
comment on column DBF_DCLSLOTM.gc_nm
  is '������������ ����';
comment on column DBF_DCLSLOTM.gc_ogrn
  is '����';
comment on column DBF_DCLSLOTM.gc_inn
  is '���';
comment on column DBF_DCLSLOTM.gc_kpp
  is '���';
comment on column DBF_DCLSLOTM.gc_ktam
  is '��� �������';
comment on column DBF_DCLSLOTM.gc_10
  is '���� ���������� ��������� ���������� ��������';
comment on column DBF_DCLSLOTM.gc_doc0
  is '������� ��������� / ��������� ������ �����������:-';
comment on column DBF_DCLSLOTM.gc_9m
  is '���� ��������� / ����� � �������';
comment on column DBF_DCLSLOTM.g�_3
  is '����� �������� ������� / ��������� ����� ��������� �';
comment on column DBF_DCLSLOTM.gc_nresh
  is '����� ������� � �������� ��������� � ��������, �����';
comment on column DBF_DCLSLOTM.inpi_guid
  is '����������������� ����� ��������������� ���������� � �������, ������������ ����������� �������� �������� ���������� � ���� ���������� ������� ���������� ��������� (���������� �������������)';
comment on column DBF_DCLSLOTM.gc_2k
  is '��� ��������� ��������� ����� ������� �������';
comment on column DBF_DCLSLOTM.gc_opoutp
  is '��������� �������������� ����������� ������ ����������  ������, �������, �����������, ���������������, ��������������� ������';
comment on column DBF_DCLSLOTM.gc_ksoutp
  is '��� ������� ����������� ������ ���������� ������, �������, �����������, ���������������, ��������������� ������ � ������������ � ��������������� �������� ����������� ������ ���������� ������, �������';
comment on column DBF_DCLSLOTM.load_id
  is 'LOAD_ID';
comment on column DBF_DCLSLOTM.gc_42
  is '��� ������ ��������� ��������� ��������������� � �����������';
create index DBF_DCLSLOTM_LOAD_ID on DBF_DCLSLOTM (LOAD_ID);
create index DCLSLOTM_HEAD_FDC on DBF_DCLSLOTM (G071, G072, G073);
alter table DBF_DCLSLOTM
  add constraint DCLSLOTM_UQ unique (G071, G072, G073, NGR, GC_01, GC_02, NRECC, DMODIFY, TMODIFY);
alter table DBF_DCLSLOTM
  add constraint DCLSLOTM_HEAD foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DCLSUMPP
prompt ===========================
prompt
create table DBF_DCLSUMPP
(
  id        INTEGER not null,
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  gb1       VARCHAR2(4),
  gb1_1     VARCHAR2(1),
  gb3       VARCHAR2(3),
  iret      NUMBER(2),
  numpdok   VARCHAR2(50),
  datpdok   DATE,
  sum_all   NUMBER(17,2),
  sumpdok   NUMBER(17,2),
  valpdok   VARCHAR2(3),
  datpostd  DATE,
  innplat   VARCHAR2(12),
  kppplat   VARCHAR2(9),
  okpoplat  VARCHAR2(10),
  lnpins    VARCHAR2(4),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER(19),
  fioins    VARCHAR2(40),
  datins    DATE,
  timins    VARCHAR2(8),
  datpaymt  DATE,
  gb5       VARCHAR2(2),
  load_id   INTEGER
)
;
comment on table DBF_DCLSUMPP
  is '������� DBF_DCLSUMPP';
comment on column DBF_DCLSUMPP.id
  is 'ID';
comment on column DBF_DCLSUMPP.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLSUMPP.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLSUMPP.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLSUMPP.gb1
  is '��� ���� ������� � ������������ � ����������';
comment on column DBF_DCLSUMPP.gb1_1
  is 'GB1_1';
comment on column DBF_DCLSUMPP.gb3
  is '�������� ��� ������ ����� ������� / ��������';
comment on column DBF_DCLSUMPP.iret
  is '������� �������� �������� �������';
comment on column DBF_DCLSUMPP.numpdok
  is '����� ���������� ���������';
comment on column DBF_DCLSUMPP.datpdok
  is '���� ���������� ���������';
comment on column DBF_DCLSUMPP.sum_all
  is '����� ����� �� ���������� ���������';
comment on column DBF_DCLSUMPP.sumpdok
  is '����������� ����� �� ���������� ���������';
comment on column DBF_DCLSUMPP.valpdok
  is '�������� ��� ������ �����';
comment on column DBF_DCLSUMPP.datpostd
  is '���� ����������� �������� ������� �� ���� ��';
comment on column DBF_DCLSUMPP.innplat
  is '��� �����������';
comment on column DBF_DCLSUMPP.kppplat
  is '��� �����������';
comment on column DBF_DCLSUMPP.okpoplat
  is 'OKPOPLAT';
comment on column DBF_DCLSUMPP.lnpins
  is '��� ����������, ����������� ������';
comment on column DBF_DCLSUMPP.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLSUMPP.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLSUMPP.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLSUMPP.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLSUMPP.fioins
  is '��� ����������, ����������� ������';
comment on column DBF_DCLSUMPP.datins
  is '���� ������������ �������';
comment on column DBF_DCLSUMPP.timins
  is '����� ������������ ������� (hh:mm:ss)';
comment on column DBF_DCLSUMPP.datpaymt
  is 'DATPAYMT';
comment on column DBF_DCLSUMPP.gb5
  is '������ ������ � ������������ � ��������������� �������� ������ ���������� � ���� ��������, �������� ������� ��������� �� ���������� ������';
comment on column DBF_DCLSUMPP.load_id
  is 'LOAD_ID';
create index DBF_DCLSUMPP_ID on DBF_DCLSUMPP (ID);
create index DBF_DCLSUMPP_INX on DBF_DCLSUMPP (G071, G072, G073);
create index DBF_DCLSUMPP_INX2 on DBF_DCLSUMPP (ID, G071, G072, G073, INNPLAT, KPPPLAT, NUMPDOK, DATPDOK, SUM_ALL, VALPDOK, SUMPDOK, GB1, IRET);
create index DBF_DCLSUMPP_LOAD_ID on DBF_DCLSUMPP (LOAD_ID);
alter table DBF_DCLSUMPP
  add constraint DBF_DCLSUMPP_UQ unique (G071, G072, G073, GB1, GB3, IRET, GB5, VALPDOK, NUMPDOK, DATPDOK, INNPLAT, KPPPLAT, OKPOPLAT, SUMPDOK, SUM_ALL);
alter table DBF_DCLSUMPP
  add constraint DBF_DCLSUMPP_HEAD foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DCLTECHD
prompt ===========================
prompt
create table DBF_DCLTECHD
(
  g071       VARCHAR2(8),
  g072       DATE,
  g073       VARCHAR2(7),
  g32        FLOAT,
  g4401      FLOAT,
  g4402      FLOAT,
  g4403      VARCHAR2(1),
  g440       VARCHAR2(4),
  g441       VARCHAR2(5),
  g441a      VARCHAR2(2),
  g442       VARCHAR2(50),
  g442r      VARCHAR2(28),
  g443       DATE,
  g444       VARCHAR2(250),
  g445       VARCHAR2(150),
  g446       DATE,
  g447       DATE,
  g4480et    VARCHAR2(10),
  g4481et    DATE,
  g44s       FLOAT,
  g44kv      VARCHAR2(3),
  g44nv      VARCHAR2(17),
  g44okpo    VARCHAR2(10),
  g44dd      DATE,
  nzp        FLOAT,
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  g449       VARCHAR2(8),
  g442a      VARCHAR2(1),
  id         INTEGER,
  p_edoc_id  NUMBER(19),
  g44020     VARCHAR2(1),
  g4491      DATE,
  g4492      DATE,
  g4493      VARCHAR2(2),
  g44_cust   VARCHAR2(8),
  id_bdrd    VARCHAR2(36),
  prsbdrd    VARCHAR2(1),
  g442simp   VARCHAR2(1),
  g44mdp1    NUMBER,
  g44mdp2    VARCHAR2(18),
  g44sfcntry VARCHAR2(2),
  g44alldoc  NUMBER(3),
  g44stper   NUMBER(17,2),
  g442lic1   NUMBER(3),
  g442lic2   NUMBER(6),
  prsfoiv    VARCHAR2(1),
  load_id    INTEGER,
  prprovid   VARCHAR2(1),
  ed_aid     VARCHAR2(50),
  ed_adid    VARCHAR2(50),
  prevnumdoc VARCHAR2(50),
  recordid   VARCHAR2(36),
  executbody VARCHAR2(10),
  docmodeid  VARCHAR2(10),
  prsdecl    VARCHAR2(1)
)
;
comment on table DBF_DCLTECHD
  is '������� DBF_DCLTECHD';
comment on column DBF_DCLTECHD.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLTECHD.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLTECHD.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLTECHD.g32
  is '����� ������ �� ��';
comment on column DBF_DCLTECHD.g4401
  is '������';
comment on column DBF_DCLTECHD.g4402
  is '������';
comment on column DBF_DCLTECHD.g4403
  is 'G4403';
comment on column DBF_DCLTECHD.g440
  is '��� ���� ������� � ������������ � ����������';
comment on column DBF_DCLTECHD.g441
  is '��� ���� ��������������� ���������(����������� � ������������ � ��������������';
comment on column DBF_DCLTECHD.g441a
  is '������';
comment on column DBF_DCLTECHD.g442
  is '����� ���������';
comment on column DBF_DCLTECHD.g442r
  is '������';
comment on column DBF_DCLTECHD.g443
  is '���� ������ ���������/ ���� ������ ���������';
comment on column DBF_DCLTECHD.g444
  is '������������ ���������';
comment on column DBF_DCLTECHD.g445
  is '������������ �����������, �������� ��������';
comment on column DBF_DCLTECHD.g446
  is '���� ������ �������� ���������';
comment on column DBF_DCLTECHD.g447
  is '���� ��������� �������� ���������';
comment on column DBF_DCLTECHD.g4480et
  is '����� ���� � ����������� ����������� �������';
comment on column DBF_DCLTECHD.g4481et
  is '���� ���� � ����������� ����������� �������';
comment on column DBF_DCLTECHD.g44s
  is 'G44S';
comment on column DBF_DCLTECHD.g44kv
  is 'G44KV';
comment on column DBF_DCLTECHD.g44nv
  is 'G44NV';
comment on column DBF_DCLTECHD.g44okpo
  is 'G44OKPO';
comment on column DBF_DCLTECHD.g44dd
  is '���� ������������� ������������ ��������� /';
comment on column DBF_DCLTECHD.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLTECHD.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLTECHD.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLTECHD.g449
  is 'G449';
comment on column DBF_DCLTECHD.g442a
  is 'G442A';
comment on column DBF_DCLTECHD.id
  is 'ID';
comment on column DBF_DCLTECHD.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLTECHD.g44020
  is '������';
comment on column DBF_DCLTECHD.g4491
  is '���� ��������';
comment on column DBF_DCLTECHD.g4492
  is '���������� ���� ���������� �����/������/���� �������� �������/������������� ���� �����������';
comment on column DBF_DCLTECHD.g4493
  is '����������� ��������, ���������� ��� �������';
comment on column DBF_DCLTECHD.g44_cust
  is '��� ����������� ������, �������������������';
comment on column DBF_DCLTECHD.id_bdrd
  is '���������� ���������� ������������� ��������';
comment on column DBF_DCLTECHD.prsbdrd
  is '������� ������������ ���������� � �� �� ����';
comment on column DBF_DCLTECHD.g442simp
  is '��� ���� ����������� ��������� � �����������';
comment on column DBF_DCLTECHD.g44mdp1
  is '���������� ����� ����� ������ ���';
comment on column DBF_DCLTECHD.g44mdp2
  is '������������� ��������� ������ ���';
comment on column DBF_DCLTECHD.g44sfcntry
  is '��� ������, � ������� ����� ����������';
comment on column DBF_DCLTECHD.g44alldoc
  is '����� ���������� ���������� (�������������� ��������� ��� ����������, �������������� ���������� ���������� � ������� ��������� ��������)';
comment on column DBF_DCLTECHD.g44stper
  is '��������� �������� ����������� �������, ���������� ��� ���������� ��������� ����������� ������� ��� ���������� ����������';
comment on column DBF_DCLTECHD.g442lic1
  is '����� ���������� / ������� ������� � ��������';
comment on column DBF_DCLTECHD.g442lic2
  is '���������� ����� �������������� ������ �� ���������� / ������� � ��������';
comment on column DBF_DCLTECHD.prsfoiv
  is 'PRSFOIV';
comment on column DBF_DCLTECHD.load_id
  is 'LOAD_ID';
comment on column DBF_DCLTECHD.prprovid
  is '������� ������������� ���������: 0-�� ����������� ��� ������ ��; 1-����������� ��� ������ ��; 2-�� ����������� � �����. � �.2 �.4 ��.183 �� ��; 3-����� ����������� ����� ������� �������';
comment on column DBF_DCLTECHD.ed_aid
  is '������������� ������������ ������ ����������, ��� ���������� ��������';
comment on column DBF_DCLTECHD.ed_adid
  is '������������� ��������� � ����������� ������ ����������';
comment on column DBF_DCLTECHD.prevnumdoc
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_DCLTECHD.recordid
  is '���������� ������������� ������ � XML-���������';
comment on column DBF_DCLTECHD.executbody
  is '������������� ��������������� ������, ��������� �������������� �������� / ������������� ������� ����';
comment on column DBF_DCLTECHD.docmodeid
  is '��� ��������������� ��������� � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
comment on column DBF_DCLTECHD.prsdecl
  is '������� ���������� ������� ��������� � ���������� (����):
0 � ������ ���������, ����� �� �������, 1 � ����������� �������� ������� �� ����, 3 � �������� ��������� �� ������, 4 � ����������� �������� ������� �� ����������';
create index DBF_DCLTECHD_ID on DBF_DCLTECHD (ID);
create index DBF_DCLTECHD_INX on DBF_DCLTECHD (G071, G072, G073, G32);
create index DBF_DCLTECHD_LOAD_ID on DBF_DCLTECHD (LOAD_ID);
alter table DBF_DCLTECHD
  add constraint DBF_DCLTECHD unique (G071, G072, G073, G32, G4401, G4402, G442, G442R, G443, G441);

prompt
prompt Creating table DBF_DCLTOVAR
prompt ===========================
prompt
create table DBF_DCLTOVAR
(
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(7) not null,
  g020       VARCHAR2(15),
  g02_itn    VARCHAR2(13),
  g021       VARCHAR2(12),
  g022       VARCHAR2(150),
  g022a      VARCHAR2(150),
  g023       VARCHAR2(80),
  g0231      VARCHAR2(3),
  g0231a     VARCHAR2(35),
  g023a      VARCHAR2(80),
  g024a      VARCHAR2(2),
  g024p      VARCHAR2(1),
  g024b      VARCHAR2(5),
  g024c      VARCHAR2(10),
  g024n      VARCHAR2(10),
  g024in     VARCHAR2(12),
  g027       VARCHAR2(9),
  g0281      VARCHAR2(2),
  g0281a     VARCHAR2(15),
  g02821     VARCHAR2(11),
  g02822     VARCHAR2(25),
  g02823     VARCHAR2(150),
  g0283      DATE,
  g029       VARCHAR2(1),
  g031       FLOAT,
  g30        VARCHAR2(15),
  g31_1      VARCHAR2(250),
  g31_10     VARCHAR2(4),
  g31_11     VARCHAR2(50),
  g31_12     VARCHAR2(50),
  g31_13     VARCHAR2(40),
  g31_2      NUMBER(8),
  g31_21     VARCHAR2(150),
  g31_22     FLOAT,
  g31_23     VARCHAR2(150),
  g31_3      FLOAT,
  g31_4      VARCHAR2(12),
  g31_41     FLOAT,
  g31_5      VARCHAR2(70),
  g31_6      VARCHAR2(2),
  g31_7      FLOAT,
  g31_71     VARCHAR2(13),
  g31_8      FLOAT,
  g31_81     VARCHAR2(13),
  g31_82     VARCHAR2(3),
  g31_9      FLOAT,
  g31_91     VARCHAR2(13),
  g31_92     VARCHAR2(3),
  g31_d1     DATE,
  g31_d2     DATE,
  g32        FLOAT not null,
  g33        VARCHAR2(10),
  g330       VARCHAR2(1),
  g331       VARCHAR2(1),
  g332       VARCHAR2(1),
  g34        VARCHAR2(3),
  g35        FLOAT,
  g36        VARCHAR2(7),
  g37        VARCHAR2(7),
  g372       VARCHAR2(1),
  g38        FLOAT,
  g39        FLOAT,
  g3911      VARCHAR2(3),
  g3912      VARCHAR2(3),
  g392       VARCHAR2(17),
  g41a       VARCHAR2(3),
  g42        FLOAT,
  g43        VARCHAR2(1),
  g430       VARCHAR2(2),
  g45        FLOAT,
  g451       VARCHAR2(2),
  g46        FLOAT,
  nblank     VARCHAR2(10),
  gd0        VARCHAR2(2),
  gd1        DATE,
  gd11       VARCHAR2(8),
  gd2        VARCHAR2(4),
  gd00       VARCHAR2(250),
  kod_str    VARCHAR2(3),
  dstat      DATE,
  stat       VARCHAR2(1),
  recplatr   FLOAT,
  rectechd   FLOAT,
  recpredd   FLOAT,
  recavtmb   FLOAT,
  recsltov   FLOAT,
  recrisk    FLOAT,
  recvrsk    FLOAT,
  recddtec   FLOAT,
  nzp        FLOAT,
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  gb_kd      NUMBER,
  g474_rub   NUMBER,
  gb_rub     NUMBER,
  g30a       VARCHAR2(3),
  g026a      VARCHAR2(15),
  g026d      DATE,
  id         INTEGER,
  p_edoc_id  NUMBER(19),
  g31_14     VARCHAR2(60),
  g31_401    NUMBER(8),
  g31_402    NUMBER(8),
  g31_20     VARCHAR2(1),
  g340       VARCHAR2(1),
  g34c       VARCHAR2(3),
  g461       VARCHAR2(1),
  kod_strc   VARCHAR2(3),
  recpk      NUMBER(8),
  recamnum   NUMBER(8),
  recdog     NUMBER(8),
  recdoga    NUMBER(8),
  recdogt    NUMBER(8),
  recuslt    NUMBER(8),
  rectovg    NUMBER(8),
  reckmp     FLOAT,
  g31_2part  NUMBER(8),
  recterms   NUMBER(8),
  fksign     VARCHAR2(1),
  g333       VARCHAR2(4),
  rectov2    NUMBER(8),
  recplat2   NUMBER(8),
  recdinf2   NUMBER(8),
  rectovg2   NUMBER(8),
  g023post   VARCHAR2(9),
  g0231n     VARCHAR2(40),
  g023subd   VARCHAR2(50),
  g023city   VARCHAR2(35),
  g023street VARCHAR2(50),
  g027a      VARCHAR2(9),
  g023apost  VARCHAR2(9),
  g0231an    VARCHAR2(40),
  g023asubd  VARCHAR2(50),
  g023acity  VARCHAR2(35),
  g023astree VARCHAR2(50),
  g31_p1     VARCHAR2(7),
  g31_p2     VARCHAR2(7),
  g31_fact   NUMBER(20),
  g31_fc_1   VARCHAR2(3),
  g32_1      VARCHAR2(3),
  g31_1_prdt DATE,
  g38_1      NUMBER,
  g31_1_oilf VARCHAR2(250),
  load_id    INTEGER,
  cimsign    VARCHAR2(1),
  tcimflag   VARCHAR2(2),
  tcimkol    NUMBER(6),
  gd01       VARCHAR2(250)
)
;
comment on table DBF_DCLTOVAR
  is '������� DBF_DCLTOVAR';
comment on column DBF_DCLTOVAR.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLTOVAR.g072
  is '��������������� ����� �� ? ���� ����������';
comment on column DBF_DCLTOVAR.g073
  is '��������������� ����� �� ? ���������� ����';
comment on column DBF_DCLTOVAR.g020
  is '����/ ������';
comment on column DBF_DCLTOVAR.g02_itn
  is '��� ��������� ���';
comment on column DBF_DCLTOVAR.g021
  is '���';
comment on column DBF_DCLTOVAR.g022
  is '������������ (�������, ���, ��������)';
comment on column DBF_DCLTOVAR.g022a
  is '������� ������������ (������������ �������';
comment on column DBF_DCLTOVAR.g023
  is 'G023';
comment on column DBF_DCLTOVAR.g0231
  is '��� �����-2 ������  ���������������';
comment on column DBF_DCLTOVAR.g0231a
  is '��� �����-2 ������  ��������������� (�����';
comment on column DBF_DCLTOVAR.g023a
  is 'G023A';
comment on column DBF_DCLTOVAR.g024a
  is 'G024A';
comment on column DBF_DCLTOVAR.g024p
  is 'G024P';
comment on column DBF_DCLTOVAR.g024b
  is '��� ����� (����������� ������������� � ���';
comment on column DBF_DCLTOVAR.g024c
  is 'G024C';
comment on column DBF_DCLTOVAR.g024n
  is '��� ���� �����������������';
comment on column DBF_DCLTOVAR.g024in
  is '��� ��� �����������������';
comment on column DBF_DCLTOVAR.g027
  is '���';
comment on column DBF_DCLTOVAR.g0281
  is '��� ���� ���������, ��������������� ������';
comment on column DBF_DCLTOVAR.g0281a
  is '������� ������������ ���������, ����������';
comment on column DBF_DCLTOVAR.g02821
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLTOVAR.g02822
  is '����� ���������, ��������������� ��������';
comment on column DBF_DCLTOVAR.g02823
  is '������������ �����������, �������� �������';
comment on column DBF_DCLTOVAR.g0283
  is '���� ������ ���������, ��������������� ���';
comment on column DBF_DCLTOVAR.g029
  is 'G029';
comment on column DBF_DCLTOVAR.g031
  is '���������� ����� ����� ���������';
comment on column DBF_DCLTOVAR.g30
  is 'G30';
comment on column DBF_DCLTOVAR.g31_1
  is '������������ (��������, ������������ ��� �';
comment on column DBF_DCLTOVAR.g31_10
  is 'G31_10';
comment on column DBF_DCLTOVAR.g31_11
  is 'G31_11';
comment on column DBF_DCLTOVAR.g31_12
  is 'G31_12';
comment on column DBF_DCLTOVAR.g31_13
  is '������ ������� �������� ������ �����������';
comment on column DBF_DCLTOVAR.g31_2
  is '����� ���������� �������� ����, ������� ��';
comment on column DBF_DCLTOVAR.g31_21
  is 'G31_21';
comment on column DBF_DCLTOVAR.g31_22
  is 'G31_22';
comment on column DBF_DCLTOVAR.g31_23
  is 'G31_23';
comment on column DBF_DCLTOVAR.g31_3
  is '���-�� �����������';
comment on column DBF_DCLTOVAR.g31_4
  is 'G31_4';
comment on column DBF_DCLTOVAR.g31_41
  is 'G31_41';
comment on column DBF_DCLTOVAR.g31_5
  is 'G31_5';
comment on column DBF_DCLTOVAR.g31_6
  is 'G31_6';
comment on column DBF_DCLTOVAR.g31_7
  is '���-�� ������ (� �������������� ������� ��';
comment on column DBF_DCLTOVAR.g31_71
  is '������������ �������������� ������� ������';
comment on column DBF_DCLTOVAR.g31_8
  is '���������� ������ � ������� ���������, ���';
comment on column DBF_DCLTOVAR.g31_81
  is '������������ ������� ���������, �������� �';
comment on column DBF_DCLTOVAR.g31_82
  is '��� ������� ���������, �������� �� �������';
comment on column DBF_DCLTOVAR.g31_9
  is '���������� ������ � ������� ���������, ���';
comment on column DBF_DCLTOVAR.g31_91
  is '������������ ������� ���������, �������� �';
comment on column DBF_DCLTOVAR.g31_92
  is '��� ������� ���������, �������� �� �������';
comment on column DBF_DCLTOVAR.g31_d1
  is '������';
comment on column DBF_DCLTOVAR.g31_d2
  is '������';
comment on column DBF_DCLTOVAR.g32
  is '����� ������ �� ��';
comment on column DBF_DCLTOVAR.g33
  is '��� ������ �� �� ��� ��';
comment on column DBF_DCLTOVAR.g330
  is '����������� ������������������ ����:
1-�(�����)
2-����� ������
� ��������� ������� �� �����������';
comment on column DBF_DCLTOVAR.g331
  is '�������������� ������� ����������� �������';
comment on column DBF_DCLTOVAR.g332
  is '������� ������� ���������������� ���������';
comment on column DBF_DCLTOVAR.g34
  is '��� ������ �������������';
comment on column DBF_DCLTOVAR.g35
  is '��� ������ (��)';
comment on column DBF_DCLTOVAR.g36
  is '�����������, ������ � ���� ����������� ��';
comment on column DBF_DCLTOVAR.g37
  is '���������';
comment on column DBF_DCLTOVAR.g372
  is 'G372';
comment on column DBF_DCLTOVAR.g38
  is '��� ����� (��) (� ������ ����������� �����';
comment on column DBF_DCLTOVAR.g39
  is '�����';
comment on column DBF_DCLTOVAR.g3911
  is '�������� ��� ������ �����';
comment on column DBF_DCLTOVAR.g3912
  is '��� ������� ��������� �����';
comment on column DBF_DCLTOVAR.g392
  is '������������ ������ / ������� ��������� ��';
comment on column DBF_DCLTOVAR.g41a
  is '��� �������������� ������� ���������';
comment on column DBF_DCLTOVAR.g42
  is '���� ������';
comment on column DBF_DCLTOVAR.g43
  is '��� �������� ������������� ���������� ����';
comment on column DBF_DCLTOVAR.g430
  is '����� ������ ����������� ���������� ������';
comment on column DBF_DCLTOVAR.g45
  is '���������� ��������� ������ (��� ����� � �';
comment on column DBF_DCLTOVAR.g451
  is '������ ����� ������ ����������� ����������';
comment on column DBF_DCLTOVAR.g46
  is '�������������� ��������� ������';
comment on column DBF_DCLTOVAR.nblank
  is '������ ������� ����� ������ (�� ����������';
comment on column DBF_DCLTOVAR.gd0
  is '��� ������� � ������������ � �������������';
comment on column DBF_DCLTOVAR.gd1
  is '����';
comment on column DBF_DCLTOVAR.gd11
  is '�����  (hh:mm:ss)';
comment on column DBF_DCLTOVAR.gd2
  is '��� ������������ ����';
comment on column DBF_DCLTOVAR.gd00
  is '�����������';
comment on column DBF_DCLTOVAR.kod_str
  is '��������� �������� ������ ������������� /';
comment on column DBF_DCLTOVAR.dstat
  is '���� ����� ( �� �����) ������ � ����������';
comment on column DBF_DCLTOVAR.stat
  is '������� ����� ������ �� ������ � ��������� 0 - �� �����������,1 - �����������';
comment on column DBF_DCLTOVAR.recplatr
  is 'DCLPLATR';
comment on column DBF_DCLTOVAR.rectechd
  is 'DCLTECHD';
comment on column DBF_DCLTOVAR.recpredd
  is 'DCLPREDD';
comment on column DBF_DCLTOVAR.recavtmb
  is 'DCLAVTMB';
comment on column DBF_DCLTOVAR.recsltov
  is 'DCLSLTOV';
comment on column DBF_DCLTOVAR.recrisk
  is 'RECRISK';
comment on column DBF_DCLTOVAR.recvrsk
  is 'DCLVRSK';
comment on column DBF_DCLTOVAR.recddtec
  is 'RECDDTEC';
comment on column DBF_DCLTOVAR.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLTOVAR.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLTOVAR.tmodify
  is '����� ����� / ����������� ������ (��:��:��';
comment on column DBF_DCLTOVAR.gb_kd
  is 'GB_KD';
comment on column DBF_DCLTOVAR.g474_rub
  is 'G474_RUB';
comment on column DBF_DCLTOVAR.gb_rub
  is 'GB_RUB';
comment on column DBF_DCLTOVAR.g30a
  is 'G30A';
comment on column DBF_DCLTOVAR.g026a
  is 'G026A';
comment on column DBF_DCLTOVAR.g026d
  is 'G026D';
comment on column DBF_DCLTOVAR.id
  is 'ID';
comment on column DBF_DCLTOVAR.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLTOVAR.g31_14
  is 'G31_14';
comment on column DBF_DCLTOVAR.g31_401
  is 'G31_401';
comment on column DBF_DCLTOVAR.g31_402
  is 'G31_402';
comment on column DBF_DCLTOVAR.g31_20
  is '��� ������� �������� ������:0 ? ��� ��������1 ?2 ? ��� �������� � ������������� �������� � ���������';
comment on column DBF_DCLTOVAR.g340
  is '������� ���� ������ �������������:
1- ��������� ��� �����-2 �� ��. OKSMT
2- ��������� ��� EU
����� �� �����������';
comment on column DBF_DCLTOVAR.g34c
  is 'G34C';
comment on column DBF_DCLTOVAR.g461
  is '������ ������� ���������� �������������� � 0 - �� ���������, 1 -  ���������';
comment on column DBF_DCLTOVAR.kod_strc
  is 'KOD_STRC';
comment on column DBF_DCLTOVAR.recpk
  is 'DCLPK';
comment on column DBF_DCLTOVAR.recamnum
  is 'DCLAMNUM';
comment on column DBF_DCLTOVAR.recdog
  is 'DCLDOG';
comment on column DBF_DCLTOVAR.recdoga
  is 'DCLDOGA';
comment on column DBF_DCLTOVAR.recdogt
  is 'DCLDOGT';
comment on column DBF_DCLTOVAR.recuslt
  is 'DCLUSLT';
comment on column DBF_DCLTOVAR.rectovg
  is 'DCLTOVG';
comment on column DBF_DCLTOVAR.reckmp
  is 'DCLKMP';
comment on column DBF_DCLTOVAR.g31_2part
  is '���������� �������� ����, ���������� �����';
comment on column DBF_DCLTOVAR.recterms
  is 'DCLTERMS';
comment on column DBF_DCLTOVAR.fksign
  is '������� ������������� �� :1-����������� ��� �������� ��������� � �� ����� �� �����������.';
comment on column DBF_DCLTOVAR.g333
  is '�������������� ��� �� �������������� �����';
comment on column DBF_DCLTOVAR.rectov2
  is 'DCLTOV2';
comment on column DBF_DCLTOVAR.recplat2
  is 'DCLPLAT2';
comment on column DBF_DCLTOVAR.recdinf2
  is 'DCLDINF2';
comment on column DBF_DCLTOVAR.rectovg2
  is 'DCLTOVG2';
comment on column DBF_DCLTOVAR.g023post
  is '���, ������������ �������� ����';
comment on column DBF_DCLTOVAR.g0231n
  is '������� �������� ������  ���������������';
comment on column DBF_DCLTOVAR.g023subd
  is '�������� ������� ��������������� -��������';
comment on column DBF_DCLTOVAR.g023city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLTOVAR.g023street
  is '�������� �����, ����� ����, ����� ����� /�';
comment on column DBF_DCLTOVAR.g027a
  is '��� (������������ �������������)';
comment on column DBF_DCLTOVAR.g023apost
  is '���, ������������ �������� ���� (���������';
comment on column DBF_DCLTOVAR.g0231an
  is '������� �������� ������  ��������������� (';
comment on column DBF_DCLTOVAR.g023asubd
  is '�������� ������� ��������������� -��������';
comment on column DBF_DCLTOVAR.g023acity
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_DCLTOVAR.g023astree
  is '�������� �����, ����� ����, ����� ����� /�';
comment on column DBF_DCLTOVAR.g31_p1
  is '�������� � �������. ����������� ����������';
comment on column DBF_DCLTOVAR.g31_p2
  is '�������� � �������. ����������� ����������';
comment on column DBF_DCLTOVAR.g31_fact
  is '���������� �������, ���������� ����������';
comment on column DBF_DCLTOVAR.g31_fc_1
  is '��� ������� ��������� �������, ����������';
comment on column DBF_DCLTOVAR.g32_1
  is '��� (��� �������������� �������, ���������';
comment on column DBF_DCLTOVAR.g31_1_prdt
  is '���� ������� ���������';
comment on column DBF_DCLTOVAR.g38_1
  is '��� ����� ��� ����� �����-���� ����� �����';
comment on column DBF_DCLTOVAR.g31_1_oilf
  is '�������� � �������������';
comment on column DBF_DCLTOVAR.load_id
  is 'LOAD_ID';
comment on column DBF_DCLTOVAR.cimsign
  is '������� ��������� ������� � �������, ���������� ���������� ������������ (������������������) ������� (�̻). ��.33 ��, ������ ���������';
comment on column DBF_DCLTOVAR.tcimflag
  is '������� ��������� ����������� (�����������������) ������ ����� ������� ������� ��»';
comment on column DBF_DCLTOVAR.tcimkol
  is '���������� ���������� ����������� (�����������������) ������';
comment on column DBF_DCLTOVAR.gd01
  is '�������� ��������� �������';
create index DBF_DCLTOVAR_ID on DBF_DCLTOVAR (ID);
create index DBF_DCLTOVAR_LOAD_ID on DBF_DCLTOVAR (LOAD_ID);
alter table DBF_DCLTOVAR
  add constraint DBF_DCLTOVAR_PK primary key (G071, G072, G073, G32);

prompt
prompt Creating table DBF_DCLTOVG
prompt ==========================
prompt
create table DBF_DCLTOVG
(
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(7) not null,
  g32        FLOAT not null,
  g32g       FLOAT,
  numrec     FLOAT,
  g31_10     VARCHAR2(4),
  g31_11     VARCHAR2(150),
  g31_12     VARCHAR2(150),
  g31_14     VARCHAR2(50),
  g31_15     VARCHAR2(50),
  g31_16     VARCHAR2(50),
  g31_17     VARCHAR2(50),
  g31_18     VARCHAR2(30),
  g31_19     VARCHAR2(20),
  g31_20     VARCHAR2(50),
  kolvo      FLOAT,
  code_edi   VARCHAR2(3),
  name_edi   VARCHAR2(13),
  nzp        FLOAT,
  dmodify    DATE not null,
  tmodify    VARCHAR2(8) not null,
  p_edoc_id  FLOAT,
  g31_15_mod VARCHAR2(50)
)
;
comment on table DBF_DCLTOVG
  is '������� DBF_DCLTOVG';
comment on column DBF_DCLTOVG.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLTOVG.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLTOVG.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLTOVG.g32
  is '����� ������ �� ��';
comment on column DBF_DCLTOVG.g32g
  is '����� ������ ������� ������ ������������ � ���';
comment on column DBF_DCLTOVG.numrec
  is '���������� ����� ������ �� ������';
comment on column DBF_DCLTOVG.g31_10
  is '��������� ��������� �������� ����������';
comment on column DBF_DCLTOVG.g31_11
  is '������������ ����� ������������';
comment on column DBF_DCLTOVG.g31_12
  is '���. ����, ����� �������������, ������ �������';
comment on column DBF_DCLTOVG.g31_14
  is '�����';
comment on column DBF_DCLTOVG.g31_15
  is '�������';
comment on column DBF_DCLTOVG.g31_16
  is '�������� (����, ���, ���, ���, ��)';
comment on column DBF_DCLTOVG.g31_17
  is '���� / ���� ��� ������ ������ (��� ����- � ���';
comment on column DBF_DCLTOVG.g31_18
  is '������������ ���������� (��� �������������� ��';
comment on column DBF_DCLTOVG.g31_19
  is '������ ���������';
comment on column DBF_DCLTOVG.g31_20
  is '�������';
comment on column DBF_DCLTOVG.kolvo
  is '����������';
comment on column DBF_DCLTOVG.code_edi
  is '��� ������� ���������';
comment on column DBF_DCLTOVG.name_edi
  is '������� ������������ ������� ���������';
comment on column DBF_DCLTOVG.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLTOVG.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLTOVG.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLTOVG.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLTOVG.g31_15_mod
  is '������';
alter table DBF_DCLTOVG
  add constraint DBF_DCLTOVG_PK primary key (G071, G072, G073, G32, DMODIFY, TMODIFY);

prompt
prompt Creating table DBF_DCLTRANS
prompt ===========================
prompt
create table DBF_DCLTRANS
(
  g071       VARCHAR2(8),
  g072       DATE,
  g073       VARCHAR2(7),
  ngr        VARCHAR2(2),
  numrec     FLOAT,
  vidtrans   VARCHAR2(2),
  ntrans     VARCHAR2(40),
  g19        VARCHAR2(1),
  g212       VARCHAR2(3),
  g29        VARCHAR2(8),
  gc5        DATE,
  gc51       VARCHAR2(8),
  nzp        NUMBER(10),
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  p_edoc_id  NUMBER(19),
  nametrans  VARCHAR2(100),
  ntrans1    VARCHAR2(40),
  ntrans2    VARCHAR2(40),
  g212c      VARCHAR2(3),
  mthtrans   VARCHAR2(1),
  movetrans  VARCHAR2(1),
  st_control VARCHAR2(250),
  g291       VARCHAR2(3),
  activeid   VARCHAR2(40),
  load_id    INTEGER
)
;
comment on table DBF_DCLTRANS
  is '������� DBF_DCLTRANS';
comment on column DBF_DCLTRANS.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLTRANS.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLTRANS.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLTRANS.ngr
  is '����� ����� (18,21,25,26,29,30)';
comment on column DBF_DCLTRANS.numrec
  is '���������� ����� ������ �� �����';
comment on column DBF_DCLTRANS.vidtrans
  is '��� ���� ������������� ��������';
comment on column DBF_DCLTRANS.ntrans
  is '����������������� ������ ������������� ��������';
comment on column DBF_DCLTRANS.g19
  is '������� ������������ ���������';
comment on column DBF_DCLTRANS.g212
  is '��� �����-2 ������ ����������� ������������� ����';
comment on column DBF_DCLTRANS.g29
  is '��� ������� �� ������� (NGR="29")';
comment on column DBF_DCLTRANS.gc5
  is '���� ������������� ������� ����������� ������';
comment on column DBF_DCLTRANS.gc51
  is '����� ������������� ������� ����������� ������ (h';
comment on column DBF_DCLTRANS.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLTRANS.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLTRANS.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLTRANS.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLTRANS.nametrans
  is '������������ ������������ ������������� ��������';
comment on column DBF_DCLTRANS.ntrans1
  is '������';
comment on column DBF_DCLTRANS.ntrans2
  is '������';
comment on column DBF_DCLTRANS.g212c
  is 'G212C';
comment on column DBF_DCLTRANS.mthtrans
  is '������ ��������������� ������� ��� ����������� ��';
comment on column DBF_DCLTRANS.movetrans
  is '������� ������������� �������� (1 - �������� ����';
comment on column DBF_DCLTRANS.st_control
  is '������������ �������, �� ������� ����������� ����';
comment on column DBF_DCLTRANS.g291
  is '��� ������ ����������� ������';
comment on column DBF_DCLTRANS.activeid
  is '������������� ��������� ������������� �������� ��� ��������, ������������ � ��,';
comment on column DBF_DCLTRANS.load_id
  is 'LOAD_ID';
create index DBF_DCLTRANS_LOAD_ID on DBF_DCLTRANS (LOAD_ID);
create index DCLTRANS_HEAD_FDC on DBF_DCLTRANS (G071, G072, G073);
alter table DBF_DCLTRANS
  add constraint DCLTRANS_UQ unique (G071, G073, G072, NGR, NUMREC, VIDTRANS, NTRANS);
alter table DBF_DCLTRANS
  add constraint DCLTRANS_HEAD foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DCLUSL
prompt =========================
prompt
create table DBF_DCLUSL
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  gu01      NUMBER(2) not null,
  gu02      NUMBER(2) not null,
  gunpp     NUMBER(5) not null,
  gu10      VARCHAR2(1),
  gu2       VARCHAR2(250),
  gu2d      DATE,
  gu3       DATE,
  gu31      DATE,
  gu4       VARCHAR2(8),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id INTEGER,
  g32       NUMBER(5),
  gu1       VARCHAR2(50),
  gu1d      DATE,
  gudd      DATE,
  gu03      VARCHAR2(2)
)
;
comment on table DBF_DCLUSL
  is '������� DBF_DCLUSL';
comment on column DBF_DCLUSL.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_DCLUSL.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_DCLUSL.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_DCLUSL.gu01
  is '������';
comment on column DBF_DCLUSL.gu02
  is '������';
comment on column DBF_DCLUSL.gunpp
  is '���������� �����';
comment on column DBF_DCLUSL.gu10
  is 'GU10';
comment on column DBF_DCLUSL.gu2
  is '�������� �������� �������';
comment on column DBF_DCLUSL.gu2d
  is 'GU2D';
comment on column DBF_DCLUSL.gu3
  is '���� �����������';
comment on column DBF_DCLUSL.gu31
  is 'GU31';
comment on column DBF_DCLUSL.gu4
  is 'GU4';
comment on column DBF_DCLUSL.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_DCLUSL.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_DCLUSL.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_DCLUSL.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_DCLUSL.g32
  is '����� ������ �� ��';
comment on column DBF_DCLUSL.gu1
  is '����� ���������';
comment on column DBF_DCLUSL.gu1d
  is '���� ���������';
comment on column DBF_DCLUSL.gudd
  is '���� ������������� ������������ ��������� /';
comment on column DBF_DCLUSL.gu03
  is '���������� ����� ���������';
create index DCLUSL_HEAD_FK_FDC on DBF_DCLUSL (G071, G072, G073);
alter table DBF_DCLUSL
  add constraint DCLUSL_PK primary key (G071, G072, G073, GU01, GU02, GUNPP);
alter table DBF_DCLUSL
  add constraint DCLUSL_HEAD_FK foreign key (G071, G072, G073)
  references DBF_DCLHEAD (G071, G072, G073) on delete cascade;

prompt
prompt Creating table DBF_DEBT_REASON
prompt ==============================
prompt
create table DBF_DEBT_REASON
(
  code      VARCHAR2(2),
  code2     VARCHAR2(250),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_DEBT_REASON
  is '������� DBF_DEBT_REASON';
comment on column DBF_DEBT_REASON.code
  is 'CODE';
comment on column DBF_DEBT_REASON.code2
  is 'CODE2';
comment on column DBF_DEBT_REASON.name
  is 'NAME';
comment on column DBF_DEBT_REASON.datbeg
  is 'DATBEG';
comment on column DBF_DEBT_REASON.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_DEBT_REASON.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_DEBT_REASON.datend
  is 'DATEND';
comment on column DBF_DEBT_REASON.numenddoc
  is 'NUMENDDOC';
comment on column DBF_DEBT_REASON.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_DEBT_TYPES
prompt =============================
prompt
create table DBF_DEBT_TYPES
(
  code      VARCHAR2(2),
  code2     VARCHAR2(250),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_DEBT_TYPES
  is '������� DBF_DEBT_TYPES';
comment on column DBF_DEBT_TYPES.code
  is 'CODE';
comment on column DBF_DEBT_TYPES.code2
  is 'CODE2';
comment on column DBF_DEBT_TYPES.name
  is 'NAME';
comment on column DBF_DEBT_TYPES.datbeg
  is 'DATBEG';
comment on column DBF_DEBT_TYPES.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_DEBT_TYPES.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_DEBT_TYPES.datend
  is 'DATEND';
comment on column DBF_DEBT_TYPES.numenddoc
  is 'NUMENDDOC';
comment on column DBF_DEBT_TYPES.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_DK1
prompt ======================
prompt
create table DBF_DK1
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  k21     FLOAT,
  k22     FLOAT,
  k3      FLOAT,
  k4      VARCHAR2(3),
  k5      FLOAT,
  k6      VARCHAR2(12),
  k9      NUMBER(1),
  k9a     VARCHAR2(4),
  k9k     FLOAT,
  k10     NUMBER(1),
  k10a    NUMBER(1),
  k10c    NUMBER(1),
  k10b    VARCHAR2(3),
  k110    NUMBER(1),
  k111    NUMBER(1),
  k112    NUMBER(1),
  k112a   DATE,
  k113    NUMBER(1),
  k114    NUMBER(1),
  k114a   VARCHAR2(23),
  k114b   DATE,
  k115    VARCHAR2(20),
  k115a   DATE,
  k121    NUMBER(1),
  k122    VARCHAR2(23),
  k122a   DATE,
  k123    VARCHAR2(20),
  k123a   DATE,
  k124    VARCHAR2(1),
  k125    VARCHAR2(1),
  k126    FLOAT,
  k130    VARCHAR2(8),
  kpech1  VARCHAR2(4),
  kpech2  VARCHAR2(4),
  dmodify DATE,
  load_id INTEGER
)
;
comment on table DBF_DK1
  is '������� DBF_DK1';
comment on column DBF_DK1.g071
  is 'G071';
comment on column DBF_DK1.g072
  is 'G072';
comment on column DBF_DK1.g073
  is 'G073';
comment on column DBF_DK1.k21
  is 'K21';
comment on column DBF_DK1.k22
  is 'K22';
comment on column DBF_DK1.k3
  is 'K3';
comment on column DBF_DK1.k4
  is 'K4';
comment on column DBF_DK1.k5
  is 'K5';
comment on column DBF_DK1.k6
  is 'K6';
comment on column DBF_DK1.k9
  is 'K9';
comment on column DBF_DK1.k9a
  is 'K9A';
comment on column DBF_DK1.k9k
  is 'K9K';
comment on column DBF_DK1.k10
  is 'K10';
comment on column DBF_DK1.k10a
  is 'K10A';
comment on column DBF_DK1.k10c
  is 'K10C';
comment on column DBF_DK1.k10b
  is 'K10B';
comment on column DBF_DK1.k110
  is 'K110';
comment on column DBF_DK1.k111
  is 'K111';
comment on column DBF_DK1.k112
  is 'K112';
comment on column DBF_DK1.k112a
  is 'K112A';
comment on column DBF_DK1.k113
  is 'K113';
comment on column DBF_DK1.k114
  is 'K114';
comment on column DBF_DK1.k114a
  is 'K114A';
comment on column DBF_DK1.k114b
  is 'K114B';
comment on column DBF_DK1.k115
  is 'K115';
comment on column DBF_DK1.k115a
  is 'K115A';
comment on column DBF_DK1.k121
  is 'K121';
comment on column DBF_DK1.k122
  is 'K122';
comment on column DBF_DK1.k122a
  is 'K122A';
comment on column DBF_DK1.k123
  is 'K123';
comment on column DBF_DK1.k123a
  is 'K123A';
comment on column DBF_DK1.k124
  is 'K124';
comment on column DBF_DK1.k125
  is 'K125';
comment on column DBF_DK1.k126
  is 'K126';
comment on column DBF_DK1.k130
  is 'K130';
comment on column DBF_DK1.kpech1
  is 'KPECH1';
comment on column DBF_DK1.kpech2
  is 'KPECH2';
comment on column DBF_DK1.dmodify
  is 'DMODIFY';
comment on column DBF_DK1.load_id
  is 'LOAD_ID';
create index DBF_DK1_LOAD_ID on DBF_DK1 (LOAD_ID);
alter table DBF_DK1
  add constraint DBF_DK1_UQ unique (G071, G072, G073);

prompt
prompt Creating table DBF_DKISCH
prompt =========================
prompt
create table DBF_DKISCH
(
  g071     VARCHAR2(8) not null,
  g072     DATE not null,
  g073     VARCHAR2(7) not null,
  g32      FLOAT not null,
  g470     VARCHAR2(1),
  g471     VARCHAR2(4) not null,
  g471_1   VARCHAR2(1),
  g472     FLOAT,
  g473     FLOAT,
  g4731    VARCHAR2(1),
  g4732    VARCHAR2(3),
  g4733    VARCHAR2(3),
  g474     FLOAT,
  g4741    VARCHAR2(3),
  g475     VARCHAR2(2),
  npp      FLOAT,
  id       INTEGER,
  load_id  INTEGER,
  g471npp  NUMBER,
  g4721    VARCHAR2(3),
  g4734    NUMBER,
  g473z1_2 VARCHAR2(1),
  g473_2   NUMBER,
  g4731_2  VARCHAR2(1),
  g4732_2  VARCHAR2(3),
  g4733_2  VARCHAR2(3),
  g4734_2  NUMBER,
  g473z1_3 VARCHAR2(1),
  g473_3   NUMBER,
  g4731_3  VARCHAR2(1),
  g4732_3  VARCHAR2(3),
  g4733_3  VARCHAR2(3),
  g4734_3  NUMBER,
  g473z2_2 NUMBER,
  g4730    DATE,
  g47_nd   NUMBER,
  g47_ns   NUMBER,
  g47_nm   NUMBER,
  g47_tr   NUMBER,
  g47_g40  NUMBER,
  g4722    VARCHAR2(50)
)
;
comment on table DBF_DKISCH
  is '������� DBF_DKISCH';
comment on column DBF_DKISCH.g071
  is '����� �� � ��� �������';
comment on column DBF_DKISCH.g072
  is '����� �� � ����';
comment on column DBF_DKISCH.g073
  is '����� �� � ����������';
comment on column DBF_DKISCH.g32
  is '����� ������ �� �� ';
comment on column DBF_DKISCH.g470
  is '������';
comment on column DBF_DKISCH.g471
  is '��� ���� ������� � ������������ � ���������������  ����� �������, ������ � ���� ��������, �������� ������� ��������� �� ���������� ������';
comment on column DBF_DKISCH.g471_1
  is '������';
comment on column DBF_DKISCH.g472
  is '��������� ����������';
comment on column DBF_DKISCH.g473
  is '������';
comment on column DBF_DKISCH.g4731
  is '������� ������';
comment on column DBF_DKISCH.g4732
  is '��� ������ �������';
comment on column DBF_DKISCH.g4733
  is '������� ��������� ������';
comment on column DBF_DKISCH.g474
  is '�����';
comment on column DBF_DKISCH.g4741
  is '��� ������ �����';
comment on column DBF_DKISCH.g475
  is '������ (���������) �������';
comment on column DBF_DKISCH.npp
  is '������';
comment on column DBF_DKISCH.id
  is '������������� ������';
comment on column DBF_DKISCH.load_id
  is '������������� ������ ��������';
comment on column DBF_DKISCH.g471npp
  is '���������� ����� ������ �� ���� �������';
comment on column DBF_DKISCH.g4721
  is '�������� ��� ������ ������ ���������� (���������� ������)';
comment on column DBF_DKISCH.g4734
  is '������� ����������� ������� ��������� (������������� ������)';
comment on column DBF_DKISCH.g473z1_2
  is '���� �������� ��������� ';
comment on column DBF_DKISCH.g473_2
  is '������';
comment on column DBF_DKISCH.g4731_2
  is '��� ������ (���������� ��%�, ������������� � �*�)';
comment on column DBF_DKISCH.g4732_2
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_DKISCH.g4733_2
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_DKISCH.g4734_2
  is '������� ����������� ������� ��������� (������������� ������)';
comment on column DBF_DKISCH.g473z1_3
  is '���� ��������';
comment on column DBF_DKISCH.g473_3
  is '������';
comment on column DBF_DKISCH.g4731_3
  is '��� ������ (���������� ��%�, ������������� � �*�)';
comment on column DBF_DKISCH.g4732_3
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_DKISCH.g4733_3
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_DKISCH.g4734_3
  is '������� ����������� ������� ��������� (������������� ������)';
comment on column DBF_DKISCH.g473z2_2
  is '��������� ���������� �������� ���������:
1 � ������,
0 � ����.';
comment on column DBF_DKISCH.g4730
  is '���� ���������� ������ ����������� �������';
comment on column DBF_DKISCH.g47_nd
  is '���������� ����';
comment on column DBF_DKISCH.g47_ns
  is '���������� ������';
comment on column DBF_DKISCH.g47_nm
  is '����� ������ � �������� ����������� �������';
comment on column DBF_DKISCH.g47_tr
  is '������� �� ������ ����������������';
comment on column DBF_DKISCH.g47_g40
  is '���������� ����� ������ � 40 �����';
comment on column DBF_DKISCH.g4722
  is '����� ������ (������ �����) � ������������ � �� ��� ��';
create index DBF_DKISCH_GTD on DBF_DKISCH (G071, G072, G073);
create index DBF_DKISCH_ID on DBF_DKISCH (ID);
create index DBF_DKISCH_LOAD_ID on DBF_DKISCH (LOAD_ID);
alter table DBF_DKISCH
  add constraint DBF_DKISCH_PK unique (G071, G072, G073, G32, G471);

prompt
prompt Creating table DBF_DKKUPL
prompt =========================
prompt
create table DBF_DKKUPL
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  gb0     VARCHAR2(1),
  gb1     VARCHAR2(4),
  gb1_1   VARCHAR2(1),
  gb2     FLOAT,
  gb3     VARCHAR2(3),
  gb4     FLOAT,
  id      INTEGER,
  load_id INTEGER
)
;
comment on table DBF_DKKUPL
  is '������� DBF_DKKUPL';
comment on column DBF_DKKUPL.g071
  is 'G071';
comment on column DBF_DKKUPL.g072
  is 'G072';
comment on column DBF_DKKUPL.g073
  is 'G073';
comment on column DBF_DKKUPL.gb0
  is 'GB0';
comment on column DBF_DKKUPL.gb1
  is 'GB1';
comment on column DBF_DKKUPL.gb1_1
  is 'GB1_1';
comment on column DBF_DKKUPL.gb2
  is 'GB2';
comment on column DBF_DKKUPL.gb3
  is 'GB3';
comment on column DBF_DKKUPL.gb4
  is 'GB4';
comment on column DBF_DKKUPL.id
  is 'ID';
comment on column DBF_DKKUPL.load_id
  is 'LOAD_ID';
create index DBF_DKKUPL_ID on DBF_DKKUPL (ID);
create index DBF_DKKUPL_INDX on DBF_DKKUPL (G071, G072, G073);
alter table DBF_DKKUPL
  add constraint DBF_DKKUPL_UQ unique (G071, G072, G073, GB1, GB1_1, GB2, GB3);

prompt
prompt Creating table DBF_DKOPRP
prompt =========================
prompt
create table DBF_DKOPRP
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  gb0     VARCHAR2(1),
  gb1     VARCHAR2(3),
  gb1_1   VARCHAR2(1),
  gb2     NUMBER(17,2),
  gb3     VARCHAR2(3),
  gb5     VARCHAR2(2),
  ndoc    VARCHAR2(15),
  stav    NUMBER(8,2),
  prcs    NUMBER(9,2),
  g48     DATE,
  id      INTEGER,
  load_id INTEGER
)
;
comment on table DBF_DKOPRP
  is '������� DBF_DKOPRP';
comment on column DBF_DKOPRP.g071
  is 'G071';
comment on column DBF_DKOPRP.g072
  is 'G072';
comment on column DBF_DKOPRP.g073
  is 'G073';
comment on column DBF_DKOPRP.gb0
  is 'GB0';
comment on column DBF_DKOPRP.gb1
  is 'GB1';
comment on column DBF_DKOPRP.gb1_1
  is 'GB1_1';
comment on column DBF_DKOPRP.gb2
  is 'GB2';
comment on column DBF_DKOPRP.gb3
  is 'GB3';
comment on column DBF_DKOPRP.gb5
  is 'GB5';
comment on column DBF_DKOPRP.ndoc
  is 'NDOC';
comment on column DBF_DKOPRP.stav
  is 'STAV';
comment on column DBF_DKOPRP.prcs
  is 'PRCS';
comment on column DBF_DKOPRP.g48
  is 'G48';
comment on column DBF_DKOPRP.id
  is 'ID';
comment on column DBF_DKOPRP.load_id
  is 'LOAD_ID';
create index DBF_DKOPRP_LOAD_ID on DBF_DKOPRP (LOAD_ID);
alter table DBF_DKOPRP
  add constraint DBF_DKOPRP_UQ unique (G071, G072, G073, GB1, GB1_1);

prompt
prompt Creating table DBF_DK_PP
prompt ========================
prompt
create table DBF_DK_PP
(
  g071       VARCHAR2(8),
  g072       DATE,
  g073       VARCHAR2(7),
  okpo       VARCHAR2(10),
  inn        VARCHAR2(12),
  kpp        VARCHAR2(9),
  k92        VARCHAR2(50),
  k93        DATE,
  k94        FLOAT,
  k95        FLOAT,
  k96        DATE,
  k_val      VARCHAR2(3),
  priz       VARCHAR2(3),
  who        VARCHAR2(1),
  sp         VARCHAR2(2),
  crypt      VARCHAR2(10),
  code       VARCHAR2(20),
  bank_id    VARCHAR2(20),
  vp         VARCHAR2(4),
  bk         VARCHAR2(7),
  id         INTEGER,
  iret       NUMBER(2),
  dsp        DATE,
  tsp        VARCHAR2(8),
  nblktc1    VARCHAR2(8),
  load_id    INTEGER,
  n_sv       VARCHAR2(14),
  d_sv       DATE,
  n_cntr     VARCHAR2(50),
  d_cntr     DATE,
  ntr        VARCHAR2(26),
  process_id VARCHAR2(36),
  lnpinsp    VARCHAR2(4)
)
;
comment on table DBF_DK_PP
  is '������� DBF_DK_PP';
comment on column DBF_DK_PP.g071
  is '����� �� � ��� �������';
comment on column DBF_DK_PP.g072
  is '����� �� � ����';
comment on column DBF_DK_PP.g073
  is '����� �� � ����������';
comment on column DBF_DK_PP.okpo
  is '���� �����������';
comment on column DBF_DK_PP.inn
  is '��� �����������';
comment on column DBF_DK_PP.kpp
  is '��� �����������';
comment on column DBF_DK_PP.k92
  is '����� ���������� ���������';
comment on column DBF_DK_PP.k93
  is '���� ���������� ���������';
comment on column DBF_DK_PP.k94
  is '����������� ����� �� ���������� ���������';
comment on column DBF_DK_PP.k95
  is '����� �� ���������� ���������';
comment on column DBF_DK_PP.k96
  is '���� ����������� ����� �� ����';
comment on column DBF_DK_PP.k_val
  is '��� ������ �����';
comment on column DBF_DK_PP.priz
  is '���������';
comment on column DBF_DK_PP.who
  is '������';
comment on column DBF_DK_PP.sp
  is '������ �������';
comment on column DBF_DK_PP.crypt
  is '����������� ����� ������';
comment on column DBF_DK_PP.code
  is '���������';
comment on column DBF_DK_PP.bank_id
  is '���������� �������������';
comment on column DBF_DK_PP.vp
  is '��� �������';
comment on column DBF_DK_PP.bk
  is 'BK';
comment on column DBF_DK_PP.id
  is 'ID';
comment on column DBF_DK_PP.iret
  is '������� �������� �������: 1 � ������������, -1 � ������������, 2 - ����������������';
comment on column DBF_DK_PP.dsp
  is '���� �������� �� ������� ���������� ���������';
comment on column DBF_DK_PP.tsp
  is '����� �������� �� ������� ���������� ���������';
comment on column DBF_DK_PP.nblktc1
  is '����� ������ ���';
comment on column DBF_DK_PP.load_id
  is 'LOAD_ID';
comment on column DBF_DK_PP.n_sv
  is '����� ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_DK_PP.d_sv
  is '����� ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_DK_PP.n_cntr
  is '���� ������ ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_DK_PP.d_cntr
  is '����� �������� ����������� �������������  (�������) � �����������';
comment on column DBF_DK_PP.ntr
  is '������ ����� ��';
comment on column DBF_DK_PP.process_id
  is '������ ����� ��';
comment on column DBF_DK_PP.lnpinsp
  is '��� ����������, ������������ ��������';
create index DBF_DK_PP_ID on DBF_DK_PP (ID);
create index DBF_DK_PP_ID_C on DBF_DK_PP (TO_CHAR(ID));
create index DBF_DK_PP_INX on DBF_DK_PP (G071, G072, G073);
create index DBF_DK_PP_LOAD_ID on DBF_DK_PP (LOAD_ID);
alter table DBF_DK_PP
  add constraint DBF_DK_PP_UQ unique (G071, G072, G073, INN, KPP, K92, K93, VP, PRIZ, K94, K95, K96, IRET, NTR, NBLKTC1);

prompt
prompt Creating table DBF_FDC_NSI_DECLARANT_ELS
prompt ========================================
prompt
create table DBF_FDC_NSI_DECLARANT_ELS
(
  inn        VARCHAR2(12),
  name       VARCHAR2(4000),
  date_begin DATE,
  date_end   DATE,
  note       VARCHAR2(4000)
)
;
comment on table DBF_FDC_NSI_DECLARANT_ELS
  is '������� DBF_FDC_NSI_DECLARANT_ELS';
comment on column DBF_FDC_NSI_DECLARANT_ELS.inn
  is 'INN';
comment on column DBF_FDC_NSI_DECLARANT_ELS.name
  is 'NAME';
comment on column DBF_FDC_NSI_DECLARANT_ELS.date_begin
  is 'DATE_BEGIN';
comment on column DBF_FDC_NSI_DECLARANT_ELS.date_end
  is 'DATE_END';
comment on column DBF_FDC_NSI_DECLARANT_ELS.note
  is 'NOTE';

prompt
prompt Creating table DBF_KTCHEAD
prompt ==========================
prompt
create table DBF_KTCHEAD
(
  id        NUMBER not null,
  load_id   NUMBER not null,
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  k0131     VARCHAR2(2),
  k032      NUMBER(5),
  k05       NUMBER(5),
  k07       VARCHAR2(3),
  kcurcode  VARCHAR2(3),
  k121      NUMBER(17,2),
  k122      NUMBER(17,2),
  k202      VARCHAR2(3),
  k2021     VARCHAR2(40),
  k203      VARCHAR2(250),
  k221      VARCHAR2(3),
  k222      NUMBER(17,2),
  k23       NUMBER(11,4),
  k230      DATE,
  k54_itn   VARCHAR2(13),
  k5410     VARCHAR2(1),
  k541      VARCHAR2(14),
  k541d     DATE,
  k5411     VARCHAR2(50),
  k5411d    DATE,
  k541_inn  VARCHAR2(12),
  k541_kpp  VARCHAR2(9),
  k542      DATE,
  k543      VARCHAR2(4),
  k5441     VARCHAR2(150),
  k5441nm   VARCHAR2(150),
  k5441mdnm VARCHAR2(150),
  k5442     VARCHAR2(50),
  k5443     VARCHAR2(250),
  k5444     VARCHAR2(50),
  k5445     DATE,
  k5446     DATE,
  k5447     VARCHAR2(50),
  k5451     VARCHAR2(2),
  k5451a    VARCHAR2(15),
  k54521    VARCHAR2(11),
  k54522    VARCHAR2(25),
  k54523    VARCHAR2(150),
  k5453     DATE,
  kb0       NUMBER(17,2),
  ka        DATE,
  kc30      VARCHAR2(2),
  nblktc1   VARCHAR2(8) not null,
  nblktc1p  VARCHAR2(8),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER(19)
)
;
comment on table DBF_KTCHEAD
  is '������� DBF_KTCHEAD';
comment on column DBF_KTCHEAD.id
  is '���������� �������������';
comment on column DBF_KTCHEAD.load_id
  is '������������� ��������';
comment on column DBF_KTCHEAD.g071
  is '��������������� ����� �� � ��� �������';
comment on column DBF_KTCHEAD.g072
  is '��������������� ����� �� � ���� �����������';
comment on column DBF_KTCHEAD.g073
  is '��������������� ����� �� � ���������� �����';
comment on column DBF_KTCHEAD.k0131
  is '������� ������������� ��� � ����� ������������ ���������. ��';
comment on column DBF_KTCHEAD.k032
  is '����� ���������� ���������� ������� ���-1 � ���-2 ';
comment on column DBF_KTCHEAD.k05
  is '�������� ����� �������, ���������� ��������� ������� ��������������';
comment on column DBF_KTCHEAD.k07
  is '��� ����������� �������������� ������� �� �������������� ������������ ����������� �������������� �������. ��.7';
comment on column DBF_KTCHEAD.kcurcode
  is '��������� ��� ������������ ������ � ������������ � ��������������� �����';
comment on column DBF_KTCHEAD.k121
  is '����� ���������� ��������� (��)';
comment on column DBF_KTCHEAD.k122
  is '���������� �������� ����� ��';
comment on column DBF_KTCHEAD.k202
  is '��������� ��� ������� ��������';
comment on column DBF_KTCHEAD.k2021
  is '����� �������� �������/ ������';
comment on column DBF_KTCHEAD.k203
  is '����� �������� ������ � ������������ � ��������� �������� (���������).';
comment on column DBF_KTCHEAD.k221
  is '��������� ��� ������ ���� ��������';
comment on column DBF_KTCHEAD.k222
  is '����� ����� �� �����';
comment on column DBF_KTCHEAD.k23
  is '���� ������';
comment on column DBF_KTCHEAD.k230
  is '���� ���������� ����� ������ = ���� ����������� �� (����������� �������������)';
comment on column DBF_KTCHEAD.k54_itn
  is '��� ��������� ��� ';
comment on column DBF_KTCHEAD.k5410
  is '��� ���������:
2 � ������������� �����������  ������������� (�������)
3 � ������������� ����������� �������������.
';
comment on column DBF_KTCHEAD.k541
  is '����� ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTCHEAD.k541d
  is '���� ������ ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTCHEAD.k5411
  is '����� �������� ����������� ������������� (�������) � �����������  ';
comment on column DBF_KTCHEAD.k5411d
  is '���� ���������� �������� ����������� ������������� (�������) � �����������';
comment on column DBF_KTCHEAD.k541_inn
  is '������ ';
comment on column DBF_KTCHEAD.k541_kpp
  is '������ ';
comment on column DBF_KTCHEAD.k542
  is '���� ���������� ���';
comment on column DBF_KTCHEAD.k543
  is '��� ������������ ���� ����������� ������';
comment on column DBF_KTCHEAD.k5441
  is '������� ����, ������������ ��� ';
comment on column DBF_KTCHEAD.k5441nm
  is '���';
comment on column DBF_KTCHEAD.k5441mdnm
  is '��������';
comment on column DBF_KTCHEAD.k5442
  is '������ ��������� (���, ����� ��������) (����������� � , �)';
comment on column DBF_KTCHEAD.k5443
  is '������������ ���������, ��������������� ����������';
comment on column DBF_KTCHEAD.k5444
  is '����� ���������, ��������������� ����������';
comment on column DBF_KTCHEAD.k5445
  is '���� ���������, ��������������� ����������';
comment on column DBF_KTCHEAD.k5446
  is '���� ��������� ���������� ';
comment on column DBF_KTCHEAD.k5447
  is '��������� ';
comment on column DBF_KTCHEAD.k5451
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTCHEAD.k5451a
  is '�������  ������������ ���������, ��������������� �������� ';
comment on column DBF_KTCHEAD.k54521
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTCHEAD.k54522
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTCHEAD.k54523
  is '������������ �����������, �������� ��������';
comment on column DBF_KTCHEAD.k5453
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTCHEAD.kb0
  is '����� �����, ���������� �������� (���������), ���. �� ���';
comment on column DBF_KTCHEAD.ka
  is '���� ��������� ����� �������������� ��������������  ���������� � �������� � ������������ � �������� ����������� ������';
comment on column DBF_KTCHEAD.kc30
  is '��� �������:
50  ������� �� ������ ��� ������������� ��� �� �����������
51  ��� ������������ �� ��������� ������� �������� �������
52  ��� ������������ �� ��������� ������� ������������ ����������� ������ ��� ������������ ������������ ���� ����������� ������ (�� ����������� �������, �������� �� ��������� ������� �������� �������)
53  ��� �������� �� ���������� ���������� � ������������� ������� �������
54  ��� ������������ �� ���� ����������
';
comment on column DBF_KTCHEAD.nblktc1
  is '����� ��� �� ������� ';
comment on column DBF_KTCHEAD.nblktc1p
  is '����� �� ������� �������������� ��� ';
comment on column DBF_KTCHEAD.nzp
  is '����������������� ����� ������';
comment on column DBF_KTCHEAD.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTCHEAD.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTCHEAD.p_edoc_id
  is '������ �� ������������� ��������� � ������';
create index DBF_KTCHEAD_ID on DBF_KTCHEAD (ID);
create index DBF_KTCHEAD_LOAD_ID on DBF_KTCHEAD (LOAD_ID);
alter table DBF_KTCHEAD
  add constraint KTCHEAD_PK primary key (G071, G072, G073, NBLKTC1);

prompt
prompt Creating table DBF_KTCPLTIZ
prompt ===========================
prompt
create table DBF_KTCPLTIZ
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  k32       FLOAT not null,
  k470      VARCHAR2(1),
  k471      VARCHAR2(4) not null,
  k472      FLOAT,
  k4721     VARCHAR2(3),
  k473      FLOAT,
  k4731     VARCHAR2(1),
  k4732     VARCHAR2(3),
  k4733     VARCHAR2(3),
  k4734     FLOAT,
  kpp       FLOAT,
  k474      FLOAT not null,
  k4741     VARCHAR2(3),
  k475      VARCHAR2(2) not null,
  k476      FLOAT not null,
  k4761     VARCHAR2(3),
  k473z1_2  VARCHAR2(1),
  k473_2    FLOAT,
  k4731_2   VARCHAR2(1),
  k4732_2   VARCHAR2(3),
  k4733_2   VARCHAR2(3),
  k4734_2   FLOAT,
  k473z1_3  VARCHAR2(1),
  k473_3    FLOAT,
  k4731_3   VARCHAR2(1),
  k4732_3   VARCHAR2(3),
  k4733_3   VARCHAR2(3),
  k4734_3   FLOAT,
  k473z2_2  FLOAT,
  k477      FLOAT,
  k4730     DATE,
  k4740     DATE,
  nblktc1   VARCHAR2(8) not null,
  nblktc1p  VARCHAR2(8),
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT,
  dateload  DATE,
  id        NUMBER,
  load_id   NUMBER,
  k471npp   NUMBER,
  k47_nd    NUMBER,
  k47_ns    NUMBER,
  k47_nm    NUMBER,
  k47_tr    NUMBER,
  iret      NUMBER
)
;
comment on table DBF_KTCPLTIZ
  is '������� DBF_KTCPLTIZ';
comment on column DBF_KTCPLTIZ.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_KTCPLTIZ.g072
  is '��������������� ����� �� ? ���� �����������';
comment on column DBF_KTCPLTIZ.g073
  is '��������������� ����� �� ? ���������� �����';
comment on column DBF_KTCPLTIZ.k32
  is '���������� ����� ������ �� ��';
comment on column DBF_KTCPLTIZ.k470
  is '������';
comment on column DBF_KTCPLTIZ.k471
  is '��� ���� ������� � ������������ � ��������������� ��';
comment on column DBF_KTCPLTIZ.k472
  is '������ ����������';
comment on column DBF_KTCPLTIZ.k4721
  is '�������� ��� ������ ������ ���������� (���������� ��';
comment on column DBF_KTCPLTIZ.k473
  is '������/������ ����������������';
comment on column DBF_KTCPLTIZ.k4731
  is '��� ������ (���������� ??%?, ������������� ? ?*?)';
comment on column DBF_KTCPLTIZ.k4732
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4733
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4734
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTCPLTIZ.kpp
  is '������� �������������� ������ (0, 1)';
comment on column DBF_KTCPLTIZ.k474
  is '����� �������';
comment on column DBF_KTCPLTIZ.k4741
  is '�������� ��� ������ ����� �������';
comment on column DBF_KTCPLTIZ.k475
  is '������ (���������) �������';
comment on column DBF_KTCPLTIZ.k476
  is '���������� ����� �������';
comment on column DBF_KTCPLTIZ.k4761
  is '�������� ��� ������ ���������� ����� �������';
comment on column DBF_KTCPLTIZ.k473z1_2
  is '���� �������� ���������';
comment on column DBF_KTCPLTIZ.k473_2
  is '������';
comment on column DBF_KTCPLTIZ.k4731_2
  is '��� ������ (���������� ??%?, ������������� ? ?*?)';
comment on column DBF_KTCPLTIZ.k4732_2
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4733_2
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4734_2
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTCPLTIZ.k473z1_3
  is '���� ��������';
comment on column DBF_KTCPLTIZ.k473_3
  is '������';
comment on column DBF_KTCPLTIZ.k4731_3
  is '��� ������ (���������� ??%?, ������������� ? ?*?)';
comment on column DBF_KTCPLTIZ.k4732_3
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4733_3
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTCPLTIZ.k4734_3
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTCPLTIZ.k473z2_2
  is '-��������� ��������� ���������� �������� ���������:1';
comment on column DBF_KTCPLTIZ.k477
  is '��������� (� ������������ ������ ������)';
comment on column DBF_KTCPLTIZ.k4730
  is '���� ���������� ������ ����������� �������';
comment on column DBF_KTCPLTIZ.k4740
  is '������';
comment on column DBF_KTCPLTIZ.nblktc1
  is '����� ��� �� �������';
comment on column DBF_KTCPLTIZ.nblktc1p
  is '����� �� ������� �������������� ���';
comment on column DBF_KTCPLTIZ.nzp
  is '����������������� ����� ������';
comment on column DBF_KTCPLTIZ.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTCPLTIZ.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTCPLTIZ.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTCPLTIZ.dateload
  is 'DATELOAD';
comment on column DBF_KTCPLTIZ.id
  is 'ID';
comment on column DBF_KTCPLTIZ.load_id
  is 'LOAD_ID';
comment on column DBF_KTCPLTIZ.k471npp
  is '���������� ����� ������ �� ���� �������';
comment on column DBF_KTCPLTIZ.k47_nd
  is '���������� ����';
comment on column DBF_KTCPLTIZ.k47_ns
  is '���������� ������';
comment on column DBF_KTCPLTIZ.k47_nm
  is '����� ������ � �������� ����������� �������';
comment on column DBF_KTCPLTIZ.k47_tr
  is '������� �� ������ ����������������';
comment on column DBF_KTCPLTIZ.iret
  is '������� �������� �������� �������';
create index DBF_KTCPLTIZ_GTD on DBF_KTCPLTIZ (G071, G072, G073);
create index DBF_KTCPLTIZ_LOAD_ID on DBF_KTCPLTIZ (LOAD_ID);
create index DBF_KTCPLTIZ_NBLKTC on DBF_KTCPLTIZ (NBLKTC1);
alter table DBF_KTCPLTIZ
  add constraint DBF_KTCPLTIZ_UQ unique (G071, G072, G073, NBLKTC1, NBLKTC1P, K32, K471, K471NPP, K4741, IRET, K475);

prompt
prompt Creating table DBF_KTCSUMPP
prompt ===========================
prompt
create table DBF_KTCSUMPP
(
  id        NUMBER,
  load_id   NUMBER,
  dateload  DATE,
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  k32       NUMBER,
  k471      VARCHAR2(4),
  k471npp   NUMBER,
  k4741     VARCHAR2(3),
  iret      NUMBER,
  numpdok   VARCHAR2(50),
  datpdok   DATE,
  sum_all   NUMBER,
  sumpdok   NUMBER,
  valpdok   VARCHAR2(3),
  datpostd  DATE,
  innplat   VARCHAR2(12),
  kppplat   VARCHAR2(9),
  lnpins    VARCHAR2(4),
  fioins    VARCHAR2(40),
  datins    DATE,
  timins    VARCHAR2(8),
  nblktc1   VARCHAR2(8),
  nblktc1p  VARCHAR2(8),
  nzp       NUMBER,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER,
  k475      VARCHAR2(2)
)
;
comment on table DBF_KTCSUMPP
  is '������� DBF_KTCSUMPP';
comment on column DBF_KTCSUMPP.id
  is 'ID';
comment on column DBF_KTCSUMPP.load_id
  is 'LOAD_ID';
comment on column DBF_KTCSUMPP.dateload
  is 'DATELOAD';
comment on column DBF_KTCSUMPP.g071
  is '��������������� ����� �� ? ��� �������';
comment on column DBF_KTCSUMPP.g072
  is '��������������� ����� �� ? ���� ���������';
comment on column DBF_KTCSUMPP.g073
  is '��������������� ����� �� ? ���������� ���';
comment on column DBF_KTCSUMPP.k32
  is '����� ������ �� ��';
comment on column DBF_KTCSUMPP.k471
  is '��� ���� ������� � ������������ � �������';
comment on column DBF_KTCSUMPP.k471npp
  is '���������� ����� ������ �� ���� �������';
comment on column DBF_KTCSUMPP.k4741
  is '�������� ��� ������ ����� ������� / �����';
comment on column DBF_KTCSUMPP.iret
  is '������� �������� �������� �������';
comment on column DBF_KTCSUMPP.numpdok
  is '����� ���������� ���������';
comment on column DBF_KTCSUMPP.datpdok
  is '���� ���������� ���������';
comment on column DBF_KTCSUMPP.sum_all
  is '����� ����� �� ���������� ���������';
comment on column DBF_KTCSUMPP.sumpdok
  is '����������� ����� �� ���������� ���������';
comment on column DBF_KTCSUMPP.valpdok
  is '�������� ��� ������ �����';
comment on column DBF_KTCSUMPP.datpostd
  is '���� ����������� �������� ������� �� ����';
comment on column DBF_KTCSUMPP.innplat
  is '��� �����������';
comment on column DBF_KTCSUMPP.kppplat
  is '��� �����������';
comment on column DBF_KTCSUMPP.lnpins
  is '��� ����������, ����������� ������';
comment on column DBF_KTCSUMPP.fioins
  is '��� ����������, ����������� ������';
comment on column DBF_KTCSUMPP.datins
  is '���� ������������ �������';
comment on column DBF_KTCSUMPP.timins
  is '����� ������������ ������� (hh:mm:ss)';
comment on column DBF_KTCSUMPP.nblktc1
  is '����� ��� �� �������';
comment on column DBF_KTCSUMPP.nblktc1p
  is '����� �� ������� �������������� ���';
comment on column DBF_KTCSUMPP.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_KTCSUMPP.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTCSUMPP.tmodify
  is '����� ����� / ����������� ������ (��:��:�';
comment on column DBF_KTCSUMPP.p_edoc_id
  is '������ �� ������������� ��������� � �����';
comment on column DBF_KTCSUMPP.k475
  is '������ ������ � ������������ � ��������������� �������� ������ ���������� � ���� ��������, �������� ������� ��������� �� ���������� ������';
alter table DBF_KTCSUMPP
  add constraint DBF_KTCSUMPP_UQ unique (G071, G072, G073, NBLKTC1, NBLKTC1P, K32, K471, K471NPP, K4741, IRET, K475, VALPDOK, NUMPDOK, DATPDOK, INNPLAT, KPPPLAT);

prompt
prompt Creating table DBF_KTCTOVIZ
prompt ===========================
prompt
create table DBF_KTCTOVIZ
(
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(7) not null,
  typ_ktc    FLOAT,
  k011       VARCHAR2(1) not null,
  k012       VARCHAR2(4),
  k013       VARCHAR2(1),
  k031       FLOAT,
  ch         FLOAT,
  k31_1      VARCHAR2(250),
  k31_11     VARCHAR2(50),
  k31_2      FLOAT,
  k31_2part  FLOAT,
  k31_20     VARCHAR2(1),
  k31_21     VARCHAR2(150),
  k31_7      FLOAT,
  k31_8      FLOAT,
  k31_9      FLOAT,
  k32        FLOAT not null,
  k35        FLOAT,
  k38        FLOAT,
  k42        FLOAT,
  k43        VARCHAR2(2),
  k451       FLOAT not null,
  k452       FLOAT not null,
  k46        FLOAT,
  k461       VARCHAR2(1),
  k470       FLOAT,
  nblktc1    VARCHAR2(8) not null,
  nblktc2    VARCHAR2(8),
  nblktc1p   VARCHAR2(8),
  nzp        FLOAT,
  dmodify    DATE not null,
  tmodify    VARCHAR2(8) not null,
  p_edoc_id  FLOAT,
  k31_1_prdt DATE,
  k31_fact   NUMBER,
  k38_1      NUMBER,
  k31_1_oilf VARCHAR2(250),
  load_id    INTEGER
)
;
comment on table DBF_KTCTOVIZ
  is '������� DBF_KTCTOVIZ';
comment on column DBF_KTCTOVIZ.g071
  is '��������������� ����� �� ? ���';
comment on column DBF_KTCTOVIZ.g072
  is '��������������� ����� �� ? ����';
comment on column DBF_KTCTOVIZ.g073
  is '��������������� ����� �� ? ����';
comment on column DBF_KTCTOVIZ.typ_ktc
  is '��� ��� (1-2)';
comment on column DBF_KTCTOVIZ.k011
  is '��� ������������� ? ������� 1';
comment on column DBF_KTCTOVIZ.k012
  is '��� ������������� ? ������� 2';
comment on column DBF_KTCTOVIZ.k013
  is '��� ������������� ? ������� 3';
comment on column DBF_KTCTOVIZ.k031
  is '���������� ����� ����� (1-���-1';
comment on column DBF_KTCTOVIZ.ch
  is '����� ����� (1-2)';
comment on column DBF_KTCTOVIZ.k31_1
  is '������������ (��������, �������';
comment on column DBF_KTCTOVIZ.k31_11
  is 'K31_11';
comment on column DBF_KTCTOVIZ.k31_2
  is '����� ���������� �������� ����,';
comment on column DBF_KTCTOVIZ.k31_2part
  is '���������� �������� ����, �����';
comment on column DBF_KTCTOVIZ.k31_20
  is '��� ������� �������� ������: 0';
comment on column DBF_KTCTOVIZ.k31_21
  is 'K31_21';
comment on column DBF_KTCTOVIZ.k31_7
  is '���-�� ������ � ��������������';
comment on column DBF_KTCTOVIZ.k31_8
  is '���������� ������ � ������� ���';
comment on column DBF_KTCTOVIZ.k31_9
  is '���������� ������ � ������� ���';
comment on column DBF_KTCTOVIZ.k32
  is '���������� ����� ������ �� ��';
comment on column DBF_KTCTOVIZ.k35
  is '��� ������ ������ (��)';
comment on column DBF_KTCTOVIZ.k38
  is '��� ������ ����� (��)';
comment on column DBF_KTCTOVIZ.k42
  is '���� ������';
comment on column DBF_KTCTOVIZ.k43
  is '����� ������ ����������� ������';
comment on column DBF_KTCTOVIZ.k451
  is '���������� ��������� (��) �����';
comment on column DBF_KTCTOVIZ.k452
  is '���������� �������� ��';
comment on column DBF_KTCTOVIZ.k46
  is '�������������� ��������� ������';
comment on column DBF_KTCTOVIZ.k461
  is '������';
comment on column DBF_KTCTOVIZ.k470
  is '����� �����, ���������� �������';
comment on column DBF_KTCTOVIZ.nblktc1
  is '����� ��� �� �������';
comment on column DBF_KTCTOVIZ.nblktc2
  is '������';
comment on column DBF_KTCTOVIZ.nblktc1p
  is '����� �� ������� ��������������';
comment on column DBF_KTCTOVIZ.nzp
  is '����������������� ����� ������';
comment on column DBF_KTCTOVIZ.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTCTOVIZ.tmodify
  is '����� ����� / ����������� �����';
comment on column DBF_KTCTOVIZ.p_edoc_id
  is '������ �� ������������� �������';
comment on column DBF_KTCTOVIZ.k31_1_prdt
  is '���� ������� ���������';
comment on column DBF_KTCTOVIZ.k31_fact
  is '���������� �������, ����������';
comment on column DBF_KTCTOVIZ.k38_1
  is '��� ����� ��� ����� �����-����';
comment on column DBF_KTCTOVIZ.k31_1_oilf
  is '�������� � �������������';
comment on column DBF_KTCTOVIZ.load_id
  is 'LOAD_ID';
create index DBF_KTCTOVIZ_GTD on DBF_KTCTOVIZ (G071, G072, G073);
create index DBF_KTCTOVIZ_LOAD_ID on DBF_KTCTOVIZ (LOAD_ID);
alter table DBF_KTCTOVIZ
  add constraint DBF_KTCTOVIZ_PK primary key (G071, G072, G073, K011, K32, NBLKTC1);

prompt
prompt Creating table DBF_KTDHEAD
prompt ==========================
prompt
create table DBF_KTDHEAD
(
  g071       VARCHAR2(8) not null,
  g072       DATE,
  g073       VARCHAR2(7),
  num_pp     NUMBER(2),
  kstage     VARCHAR2(1),
  kedsign    VARCHAR2(2),
  g011       VARCHAR2(2),
  g0121      VARCHAR2(2),
  g0131      VARCHAR2(2),
  k0131      VARCHAR2(2),
  kbase      VARCHAR2(150),
  kbasenum   VARCHAR2(50),
  kbasedate  DATE,
  g020       VARCHAR2(15),
  g021       VARCHAR2(12),
  g022       VARCHAR2(150),
  g023post   VARCHAR2(9),
  g0231      VARCHAR2(2),
  g0231n     VARCHAR2(40),
  g023subd   VARCHAR2(50),
  g023city   VARCHAR2(35),
  g023street VARCHAR2(50),
  g027       VARCHAR2(9),
  g0281      VARCHAR2(2),
  g0281a     VARCHAR2(15),
  g02821     VARCHAR2(11),
  g02822     VARCHAR2(25),
  g02823     VARCHAR2(150),
  g0283      DATE,
  g022a      VARCHAR2(150),
  g027a      VARCHAR2(9),
  g023apost  VARCHAR2(9),
  g0231a     VARCHAR2(2),
  g0231an    VARCHAR2(40),
  g023asubd  VARCHAR2(50),
  g023acity  VARCHAR2(35),
  g023astree VARCHAR2(50),
  g029       VARCHAR2(1),
  k032       NUMBER(5),
  g032       NUMBER(5),
  g040       NUMBER(5),
  g04        NUMBER(7),
  k05        NUMBER(5),
  g05        NUMBER(5),
  g06        NUMBER(8),
  g07        VARCHAR2(3),
  g080       VARCHAR2(15),
  g081       VARCHAR2(12),
  g082       VARCHAR2(150),
  g083post   VARCHAR2(9),
  g0831      VARCHAR2(2),
  g0831a     VARCHAR2(40),
  g083subd   VARCHAR2(50),
  g083city   VARCHAR2(35),
  g083street VARCHAR2(50),
  g087       VARCHAR2(9),
  g0881      VARCHAR2(2),
  g0881a     VARCHAR2(15),
  g08821     VARCHAR2(11),
  g08822     VARCHAR2(25),
  g08823     VARCHAR2(150),
  g0883      DATE,
  g089       VARCHAR2(1),
  g082a      VARCHAR2(150),
  g087a      VARCHAR2(9),
  g083apost  VARCHAR2(9),
  g0831aa    VARCHAR2(2),
  g0831an    VARCHAR2(40),
  g083asubd  VARCHAR2(50),
  g083acity  VARCHAR2(35),
  g083astree VARCHAR2(50),
  g090       VARCHAR2(15),
  g091       VARCHAR2(12),
  g092       VARCHAR2(150),
  g092a      VARCHAR2(150),
  g093post   VARCHAR2(9),
  g0931      VARCHAR2(2),
  g0931n     VARCHAR2(40),
  g093subd   VARCHAR2(50),
  g093city   VARCHAR2(35),
  g093street VARCHAR2(50),
  g093apost  VARCHAR2(9),
  g0931a     VARCHAR2(2),
  g0931an    VARCHAR2(40),
  g093asubd  VARCHAR2(50),
  g093acity  VARCHAR2(35),
  g093astree VARCHAR2(50),
  g097       VARCHAR2(9),
  g097a      VARCHAR2(9),
  g0981      VARCHAR2(2),
  g0981a     VARCHAR2(15),
  g09821     VARCHAR2(11),
  g09822     VARCHAR2(25),
  g09823     VARCHAR2(150),
  g0983      DATE,
  g11        VARCHAR2(2),
  g12        NUMBER,
  g121       VARCHAR2(3),
  g122       NUMBER,
  g140       VARCHAR2(15),
  g141       VARCHAR2(12),
  g142       VARCHAR2(150),
  g142a      VARCHAR2(150),
  g143post   VARCHAR2(9),
  g1431      VARCHAR2(2),
  g1431n     VARCHAR2(40),
  g143subd   VARCHAR2(50),
  g143city   VARCHAR2(35),
  g143street VARCHAR2(50),
  g143apost  VARCHAR2(9),
  g1431a     VARCHAR2(2),
  g1431an    VARCHAR2(40),
  g143asubd  VARCHAR2(50),
  g143acity  VARCHAR2(35),
  g143astree VARCHAR2(50),
  g147       VARCHAR2(9),
  g147a      VARCHAR2(9),
  g1481      VARCHAR2(2),
  g1481a     VARCHAR2(15),
  g14821     VARCHAR2(11),
  g14822     VARCHAR2(25),
  g14823     VARCHAR2(150),
  g1483      DATE,
  g15        VARCHAR2(40),
  g15a       VARCHAR2(2),
  g16        VARCHAR2(40),
  g17a       VARCHAR2(2),
  g17b       VARCHAR2(40),
  g180       NUMBER(5),
  g182       VARCHAR2(2),
  g19        VARCHAR2(1),
  g202       VARCHAR2(3),
  g2021      VARCHAR2(50),
  g203       VARCHAR2(250),
  g210       NUMBER(5),
  g212       VARCHAR2(2),
  g221       VARCHAR2(3),
  g222       NUMBER,
  g23        NUMBER,
  g230       DATE,
  g270       VARCHAR2(2),
  g2710      VARCHAR2(1),
  g271       VARCHAR2(13),
  g27        VARCHAR2(40),
  g2711      DATE,
  g2712      VARCHAR2(8),
  g28okpo    VARCHAR2(10),
  g28inn     VARCHAR2(12),
  g281oth    VARCHAR2(30),
  g282       VARCHAR2(70),
  g28211     VARCHAR2(1),
  g28212     VARCHAR2(2),
  g28221     VARCHAR2(3),
  g28222     VARCHAR2(1),
  g28230     VARCHAR2(1),
  g2823      DATE,
  g28240     VARCHAR2(1),
  g2824      DATE,
  g2825      VARCHAR2(3),
  g300       VARCHAR2(2),
  g3010      VARCHAR2(1),
  g301       VARCHAR2(21),
  g3011      DATE,
  g30        VARCHAR2(50),
  g30post    VARCHAR2(9),
  g30a       VARCHAR2(2),
  g30an      VARCHAR2(40),
  g30subd    VARCHAR2(50),
  g30city    VARCHAR2(35),
  g30street  VARCHAR2(50),
  g30lname   VARCHAR2(150),
  g3012      VARCHAR2(8),
  g30121     VARCHAR2(2),
  g30122     VARCHAR2(15),
  g45a1      VARCHAR2(1),
  g45a2      VARCHAR2(1),
  g45a3      VARCHAR2(1),
  g45a4      VARCHAR2(1),
  g45a5      VARCHAR2(1),
  g45a6      VARCHAR2(1),
  g45a7      VARCHAR2(1),
  g45a8      VARCHAR2(1),
  d54_itn    VARCHAR2(13),
  d5410      VARCHAR2(1),
  d541       VARCHAR2(14),
  d541d      DATE,
  d5411      VARCHAR2(50),
  d5411d     DATE,
  d541_inn   VARCHAR2(12),
  d541_kpp   VARCHAR2(9),
  d542       DATE,
  d5441      VARCHAR2(150),
  d5441nm    VARCHAR2(150),
  d5441mdnm  VARCHAR2(150),
  d5442      VARCHAR2(50),
  d5443      VARCHAR2(250),
  d5444      VARCHAR2(50),
  d5445      DATE,
  d5446      DATE,
  d5447      VARCHAR2(50),
  d5451      VARCHAR2(2),
  d5451a     VARCHAR2(15),
  d54521     VARCHAR2(11),
  d54522     VARCHAR2(25),
  d54523     VARCHAR2(150),
  d5453      DATE,
  g54_itn    VARCHAR2(13),
  g5410      VARCHAR2(1),
  g541       VARCHAR2(14),
  g541d      DATE,
  g5411      VARCHAR2(50),
  g5411d     DATE,
  g541_inn   VARCHAR2(12),
  g541_kpp   VARCHAR2(9),
  g542       DATE,
  g543       VARCHAR2(4),
  g5441      VARCHAR2(150),
  g5441nm    VARCHAR2(150),
  g5441mdnm  VARCHAR2(150),
  g5442      VARCHAR2(50),
  g5443      VARCHAR2(250),
  g5444      VARCHAR2(50),
  g5445      DATE,
  g5446      DATE,
  g5447      VARCHAR2(50),
  g5451      VARCHAR2(2),
  g5451a     VARCHAR2(15),
  g54521     VARCHAR2(11),
  g54522     VARCHAR2(25),
  g54523     VARCHAR2(150),
  g5453      DATE,
  kb0        NUMBER,
  nzp        NUMBER(10),
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  p_edoc_id  NUMBER(19),
  id         NUMBER,
  load_id    NUMBER,
  dateload   DATE,
  d5411aid   VARCHAR2(50),
  d5411adid  VARCHAR2(50),
  d5411modid VARCHAR2(10),
  d5411doc   VARCHAR2(5),
  d544aid    VARCHAR2(50),
  d544adid   VARCHAR2(50),
  d544modid  VARCHAR2(10),
  d544doc    VARCHAR2(5),
  prvnumg545 VARCHAR2(50),
  prprovg545 VARCHAR2(1),
  g545doc    VARCHAR2(5),
  g545modid  VARCHAR2(10),
  g545adid   VARCHAR2(50),
  g545aid    VARCHAR2(50),
  prvnumg544 VARCHAR2(50),
  prprovg544 VARCHAR2(1),
  g544doc    VARCHAR2(5),
  g544modid  VARCHAR2(10),
  g544adid   VARCHAR2(50),
  g544aid    VARCHAR2(50),
  prvnumg541 VARCHAR2(50),
  prprovg541 VARCHAR2(1),
  g5411doc   VARCHAR2(5),
  g5411modid VARCHAR2(10),
  g5411adid  VARCHAR2(50),
  g5411aid   VARCHAR2(50),
  prvnumd545 VARCHAR2(50),
  prprovd545 VARCHAR2(1),
  d545doc    VARCHAR2(5),
  d545modid  VARCHAR2(10),
  d545adid   VARCHAR2(50),
  d545aid    VARCHAR2(50),
  prvnumd544 VARCHAR2(50),
  prprovd544 VARCHAR2(1),
  prvnumd541 VARCHAR2(50),
  prprovd541 VARCHAR2(1)
)
;
comment on table DBF_KTDHEAD
  is '������� DBF_KTDHEAD';
comment on column DBF_KTDHEAD.g071
  is '��������������� ����� �� � ��� �������';
comment on column DBF_KTDHEAD.g072
  is '��������������� ����� �� � ���� �����������';
comment on column DBF_KTDHEAD.g073
  is '��������������� ����� �� � ���������� �����';
comment on column DBF_KTDHEAD.num_pp
  is '����� ��� �� ������� (��������� � 1)';
comment on column DBF_KTDHEAD.kstage
  is '������';
comment on column DBF_KTDHEAD.kedsign
  is '������� ������������� ��� � ����� ������������ ���������. ��';
comment on column DBF_KTDHEAD.g011
  is '����������� ����������� ������';
comment on column DBF_KTDHEAD.g0121
  is '��� ���������� ��������� � ������������ � ��������������� ����� ���������� ��������.  ��. 1. ���. ������ ���������. ������ ������� ������� ���������� ��. 37. / �00� - ��� ��������';
comment on column DBF_KTDHEAD.g0131
  is '������� ������������� �� � ����� ������������ ���������. ��. ��. 1 ���. ������ ���������. ';
comment on column DBF_KTDHEAD.k0131
  is '������';
comment on column DBF_KTDHEAD.kbase
  is '������';
comment on column DBF_KTDHEAD.kbasenum
  is '������';
comment on column DBF_KTDHEAD.kbasedate
  is '������';
comment on column DBF_KTDHEAD.g020
  is '���� / ������';
comment on column DBF_KTDHEAD.g021
  is '��� ';
comment on column DBF_KTDHEAD.g022
  is '������������ (�������, ���, ��������)';
comment on column DBF_KTDHEAD.g023post
  is '���, ������������ �������� ����';
comment on column DBF_KTDHEAD.g0231
  is '��� �����-2 ������  ��������������� ';
comment on column DBF_KTDHEAD.g0231n
  is '������� �������� ������  ��������������� � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g023subd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) ';
comment on column DBF_KTDHEAD.g023city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDHEAD.g023street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_KTDHEAD.g027
  is '��� ';
comment on column DBF_KTDHEAD.g0281
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g0281a
  is '������� ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g02821
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g02822
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g02823
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.g0283
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g022a
  is '������� ������������ (�������.�������.)';
comment on column DBF_KTDHEAD.g027a
  is '���(�������.�������.) ';
comment on column DBF_KTDHEAD.g023apost
  is '���, ������������ �������� ����(�������.�������.)';
comment on column DBF_KTDHEAD.g0231a
  is '��� �����-2 ������  ��������������� (�������.�������.)   ';
comment on column DBF_KTDHEAD.g0231an
  is '������� �������� ������  ��������������� (���������.���������.) � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g023asubd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) (�������.�������.) ';
comment on column DBF_KTDHEAD.g023acity
  is '�������� ����������� ������ (����� � �.�.) (�������.�������.)';
comment on column DBF_KTDHEAD.g023astree
  is '�������� �����, ����� ����, ����� ����� /��������(�������.�������.)';
comment on column DBF_KTDHEAD.g029
  is '����������� ��������� ��������: 1-����������';
comment on column DBF_KTDHEAD.k032
  is '����� ���������� ���� ���1 � ���2
(������� ���������� ���������� ������� ���������� ��.3 ��)
';
comment on column DBF_KTDHEAD.g032
  is '����� ���������� ������ ��';
comment on column DBF_KTDHEAD.g040
  is '����� ���-�� ������������, �������� � �������� ����������';
comment on column DBF_KTDHEAD.g04
  is '����� ���-�� ������ ������������, �������� � �������� ����������';
comment on column DBF_KTDHEAD.k05
  is '����� ���������� ������� � ���';
comment on column DBF_KTDHEAD.g05
  is '����� ������������ ������� � ��';
comment on column DBF_KTDHEAD.g06
  is '����� ���������� �������� ����';
comment on column DBF_KTDHEAD.g07
  is '��� ���� ���������� ���������� � ������������ � ���������������  ������������  �������������� �������';
comment on column DBF_KTDHEAD.g080
  is '���� / ������';
comment on column DBF_KTDHEAD.g081
  is '���';
comment on column DBF_KTDHEAD.g082
  is '������������ (�������, ���, ��������)';
comment on column DBF_KTDHEAD.g083post
  is '���, ������������ �������� ����';
comment on column DBF_KTDHEAD.g0831
  is '��� �����-2 ������  ��������������� ';
comment on column DBF_KTDHEAD.g0831a
  is '������� �������� ������ ��������������� � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g083subd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) ';
comment on column DBF_KTDHEAD.g083city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDHEAD.g083street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_KTDHEAD.g087
  is '���';
comment on column DBF_KTDHEAD.g0881
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g0881a
  is '������� ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g08821
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g08822
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g08823
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.g0883
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g089
  is '����������� ��������� ��������:
1-����������, 2 � ������ �� ������
';
comment on column DBF_KTDHEAD.g082a
  is '������� ������������ (�������.�������.)';
comment on column DBF_KTDHEAD.g087a
  is '���(�������.�������.) ';
comment on column DBF_KTDHEAD.g083apost
  is '���, ������������ �������� ����(�������.�������.)';
comment on column DBF_KTDHEAD.g0831aa
  is '��� �����-2 ������  ��������������� (�������.�������.) ';
comment on column DBF_KTDHEAD.g0831an
  is '������� �������� ������  ��������������� (���������.���������.) � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g083asubd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) (�������.�������.) ';
comment on column DBF_KTDHEAD.g083acity
  is '�������� ����������� ������ (����� � �.�.) (�������.�������.)';
comment on column DBF_KTDHEAD.g083astree
  is '�������� �����, ����� ����, ����� ����� /��������(�������.�������.)';
comment on column DBF_KTDHEAD.g090
  is '���� / ������';
comment on column DBF_KTDHEAD.g091
  is '���';
comment on column DBF_KTDHEAD.g092
  is '������������ (�������, ���, ��������)';
comment on column DBF_KTDHEAD.g092a
  is '������� ������������  ������������� �������������';
comment on column DBF_KTDHEAD.g093post
  is '���, ������������ �������� ����';
comment on column DBF_KTDHEAD.g0931
  is '��� �����-2 ������  ��������������� ';
comment on column DBF_KTDHEAD.g0931n
  is '������� �������� ������ ��������������� � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g093subd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) ';
comment on column DBF_KTDHEAD.g093city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDHEAD.g093street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_KTDHEAD.g093apost
  is '���, ������������ �������� ���� (�������.�������.)';
comment on column DBF_KTDHEAD.g0931a
  is '��� �����-2 ������  ��������������� (�������.�������.) ';
comment on column DBF_KTDHEAD.g0931an
  is '������� �������� ������ ��������������� (������������ �������������)';
comment on column DBF_KTDHEAD.g093asubd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.)  (�������.�������.)';
comment on column DBF_KTDHEAD.g093acity
  is '�������� ����������� ������ (����� � �.�.) (�������.�������.)';
comment on column DBF_KTDHEAD.g093astree
  is '�������� �����, ����� ����, ����� ����� /�������� (�������. �������.)';
comment on column DBF_KTDHEAD.g097
  is '���';
comment on column DBF_KTDHEAD.g097a
  is '��� (�������.�������.)';
comment on column DBF_KTDHEAD.g0981
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g0981a
  is '������� ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g09821
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g09822
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g09823
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.g0983
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g11
  is '��� �����-2 ��������� ������';
comment on column DBF_KTDHEAD.g12
  is '����� ���������� ���������';
comment on column DBF_KTDHEAD.g121
  is '��������� ��� ������ ���������� ���������';
comment on column DBF_KTDHEAD.g122
  is '���������� �������� ����� ���������� ���������, ��.12 � ������ ���������';
comment on column DBF_KTDHEAD.g140
  is '���� / ������';
comment on column DBF_KTDHEAD.g141
  is '���';
comment on column DBF_KTDHEAD.g142
  is '������������ (�������, ���, ��������)';
comment on column DBF_KTDHEAD.g142a
  is '������� ������������ ������������� �������������';
comment on column DBF_KTDHEAD.g143post
  is '���, ������������ �������� ���� ';
comment on column DBF_KTDHEAD.g1431
  is '��� �����-2 ������  ��������������� ';
comment on column DBF_KTDHEAD.g1431n
  is '������� �������� ������ ��������������� � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g143subd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.)  ';
comment on column DBF_KTDHEAD.g143city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDHEAD.g143street
  is '�������� �����, ����� ����, ����� ����� /�������� ';
comment on column DBF_KTDHEAD.g143apost
  is '���, ������������ �������� ���� (�������.�������.)';
comment on column DBF_KTDHEAD.g1431a
  is '��� �����-2 ������  ��������������� (�������.�������.) ';
comment on column DBF_KTDHEAD.g1431an
  is '������� �������� ������ ��������������� (������������ �������������) � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g143asubd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.)  (�������.�������.)';
comment on column DBF_KTDHEAD.g143acity
  is '�������� ����������� ������ (����� � �.�.) (�������.�������.)';
comment on column DBF_KTDHEAD.g143astree
  is '�������� �����, ����� ����, ����� ����� /��������
(�������.�������.)
';
comment on column DBF_KTDHEAD.g147
  is '��� ';
comment on column DBF_KTDHEAD.g147a
  is '��� (�������. �������.)';
comment on column DBF_KTDHEAD.g1481
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g1481a
  is '������� ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g14821
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g14822
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g14823
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.g1483
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g15
  is '������ �����������. ������� ��������.  ��.15.';
comment on column DBF_KTDHEAD.g15a
  is '��� �����-2 ������ �����������';
comment on column DBF_KTDHEAD.g16
  is '������� �������� ������ ������������� / ������ / ����������/��������';
comment on column DBF_KTDHEAD.g17a
  is '��� �����-2 ������ ���������� / 00';
comment on column DBF_KTDHEAD.g17b
  is '������ ����������. ��.17 ��������/ ����������';
comment on column DBF_KTDHEAD.g180
  is '����� ���������� ������������ ������� ��� �����������/��������';
comment on column DBF_KTDHEAD.g182
  is '��� �����-2 ������ ����������� ������������ ������� ��� �����������/��������';
comment on column DBF_KTDHEAD.g19
  is 'G19';
comment on column DBF_KTDHEAD.g202
  is '��������� ��� ������� (������) �������� �������';
comment on column DBF_KTDHEAD.g2021
  is '����� �������� ������� / ������';
comment on column DBF_KTDHEAD.g203
  is '����� �������� ������ � ������������ � ��������� �������� (���������).';
comment on column DBF_KTDHEAD.g210
  is '����� ���������� ������������ ������� �� �������';
comment on column DBF_KTDHEAD.g212
  is '��� �����-2 ������ ����������� ������������ ������� �� �������';
comment on column DBF_KTDHEAD.g221
  is '��������� ��� ������ ���� �������� ';
comment on column DBF_KTDHEAD.g222
  is '����� ��������� ������� ';
comment on column DBF_KTDHEAD.g23
  is '���� ������';
comment on column DBF_KTDHEAD.g230
  is '���� ���������� ����� ������ = ���� ����������� �� (����������� �������������)';
comment on column DBF_KTDHEAD.g270
  is '������';
comment on column DBF_KTDHEAD.g2710
  is '������';
comment on column DBF_KTDHEAD.g271
  is '������';
comment on column DBF_KTDHEAD.g27
  is '������';
comment on column DBF_KTDHEAD.g2711
  is '������';
comment on column DBF_KTDHEAD.g2712
  is '������';
comment on column DBF_KTDHEAD.g28okpo
  is '������';
comment on column DBF_KTDHEAD.g28inn
  is '������';
comment on column DBF_KTDHEAD.g281oth
  is '������';
comment on column DBF_KTDHEAD.g282
  is '������';
comment on column DBF_KTDHEAD.g28211
  is '������';
comment on column DBF_KTDHEAD.g28212
  is '��� ����������� ������ (��������). � ������������ � ��������������� ����������� ������������������� ������, ������������ � ������������-������ ����������� �����. ��. 24 ��';
comment on column DBF_KTDHEAD.g28221
  is '��� ��������� ������ � �������������� �������� � ������������ � ��������������� ��������� ������, ������������ � ������������-������ ����������� �����. ��.24  ��';
comment on column DBF_KTDHEAD.g28222
  is '������';
comment on column DBF_KTDHEAD.g28230
  is '������';
comment on column DBF_KTDHEAD.g2823
  is '������';
comment on column DBF_KTDHEAD.g28240
  is '������';
comment on column DBF_KTDHEAD.g2824
  is '������';
comment on column DBF_KTDHEAD.g2825
  is '������';
comment on column DBF_KTDHEAD.g300
  is '��� ����� ���������� ������� � ������������ � ��������������� ���� ���������� �������';
comment on column DBF_KTDHEAD.g3010
  is '��� ���������:
1-��������
2-�������������
';
comment on column DBF_KTDHEAD.g301
  is '����� ������������� / ��������';
comment on column DBF_KTDHEAD.g3011
  is '���� ������ ������������� / �������� /���� ��������� ';
comment on column DBF_KTDHEAD.g30
  is '����� ���������';
comment on column DBF_KTDHEAD.g30post
  is '����� ��������������� - ���, ������������ �������� ����';
comment on column DBF_KTDHEAD.g30a
  is '����� ��������������� � ��� �����-2 ������';
comment on column DBF_KTDHEAD.g30an
  is '����� ��������������� � ������� �������� ������ � ������������ � ��������������� ����� ����';
comment on column DBF_KTDHEAD.g30subd
  is '�����  ���������������  - �������� ������� ��������������� -���������������� ������� ������ (�������, ����� � �.�.) ';
comment on column DBF_KTDHEAD.g30city
  is '����� ��������������� ������� -�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDHEAD.g30street
  is '����� ��������������� ������� � �������� ����� � �.�.';
comment on column DBF_KTDHEAD.g30lname
  is '������������ ��������������� ������� / �������� (�������) �����';
comment on column DBF_KTDHEAD.g3012
  is '��� ����������� ������, � ������� ������������ �������� ��������� ����� ����������, �������� �������';
comment on column DBF_KTDHEAD.g30121
  is '��� ������ ����������� ������';
comment on column DBF_KTDHEAD.g30122
  is '��������������� ����� ���� ����������� ��������';
comment on column DBF_KTDHEAD.g45a1
  is 'G45A1';
comment on column DBF_KTDHEAD.g45a2
  is 'G45A2';
comment on column DBF_KTDHEAD.g45a3
  is 'G45A3';
comment on column DBF_KTDHEAD.g45a4
  is 'G45A4';
comment on column DBF_KTDHEAD.g45a5
  is 'G45A5';
comment on column DBF_KTDHEAD.g45a6
  is 'G45A6';
comment on column DBF_KTDHEAD.g45a7
  is '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ����������� (����������) ����������, ���� ��������';
comment on column DBF_KTDHEAD.g45a8
  is '��������� � (���) ���������� ���� ��������, ��������� � ��';
comment on column DBF_KTDHEAD.d54_itn
  is '��� ��������� ���';
comment on column DBF_KTDHEAD.d5410
  is '��� ���������: 2 � ������������� �����������  ������������� (�������); 3 � ������������� ����������� �������������.';
comment on column DBF_KTDHEAD.d541
  is '����� ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTDHEAD.d541d
  is '���� ������ ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTDHEAD.d5411
  is '����� �������� ����������� ������������� (�������)  � �����������  ';
comment on column DBF_KTDHEAD.d5411d
  is '���� ���������� �������� ����������� ������������� (�������) � �����������';
comment on column DBF_KTDHEAD.d541_inn
  is '��� ����������� �������������';
comment on column DBF_KTDHEAD.d541_kpp
  is '��� ����������� �������������';
comment on column DBF_KTDHEAD.d542
  is '���� ����������� �� ';
comment on column DBF_KTDHEAD.d5441
  is '������� ';
comment on column DBF_KTDHEAD.d5441nm
  is '���';
comment on column DBF_KTDHEAD.d5441mdnm
  is '��������';
comment on column DBF_KTDHEAD.d5442
  is '������ ��������� (���, ����� ��������) (����������� � , �) ';
comment on column DBF_KTDHEAD.d5443
  is '������������ ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.d5444
  is '����� ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.d5445
  is '���� ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.d5446
  is '���� ��������� ���������� ';
comment on column DBF_KTDHEAD.d5447
  is '���������';
comment on column DBF_KTDHEAD.d5451
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.d5451a
  is '�������  ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.d54521
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.d54522
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.d54523
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.d5453
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g54_itn
  is '��� ��������� ���';
comment on column DBF_KTDHEAD.g5410
  is 'G5410';
comment on column DBF_KTDHEAD.g541
  is '����� ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTDHEAD.g541d
  is '���� ������ ������������� � ��������� � ������ ���������� �������������� (��������)';
comment on column DBF_KTDHEAD.g5411
  is '����� �������� ����������� ������������� (�������)  � �����������  ';
comment on column DBF_KTDHEAD.g5411d
  is '���� ���������� �������� ����������� ������������� (�������) � �����������';
comment on column DBF_KTDHEAD.g541_inn
  is '��� ����������� �������������';
comment on column DBF_KTDHEAD.g541_kpp
  is '��� ����������� �������������';
comment on column DBF_KTDHEAD.g542
  is '���� ����������� ���';
comment on column DBF_KTDHEAD.g543
  is '��� ��������������� ������������ ����';
comment on column DBF_KTDHEAD.g5441
  is '������� ';
comment on column DBF_KTDHEAD.g5441nm
  is '���';
comment on column DBF_KTDHEAD.g5441mdnm
  is '��������';
comment on column DBF_KTDHEAD.g5442
  is '������ ��������� (���, ����� ��������) (����������� � , �) ';
comment on column DBF_KTDHEAD.g5443
  is '������������ ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.g5444
  is '����� ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.g5445
  is '���� ���������, ��������������� ����������';
comment on column DBF_KTDHEAD.g5446
  is '���� ��������� ���������� ';
comment on column DBF_KTDHEAD.g5447
  is '���������';
comment on column DBF_KTDHEAD.g5451
  is '��� ���� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g5451a
  is '�������  ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g54521
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.g54522
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDHEAD.g54523
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDHEAD.g5453
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDHEAD.kb0
  is '����� �����, ���������� �������� (���������), ���. �� ���';
comment on column DBF_KTDHEAD.nzp
  is '����������������� ����� ������';
comment on column DBF_KTDHEAD.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDHEAD.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTDHEAD.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTDHEAD.id
  is '���������� �������������';
comment on column DBF_KTDHEAD.load_id
  is '������������� ��������';
comment on column DBF_KTDHEAD.dateload
  is '���� ��������';
comment on column DBF_KTDHEAD.d5411aid
  is '������������� ������������ ������ ����������, ��� ���������� ������� ����������� �������������';
comment on column DBF_KTDHEAD.d5411adid
  is '������������� �������� ����������� �������������  � ����������� ������ ����������';
comment on column DBF_KTDHEAD.d5411modid
  is '��� ���� �������� ����������� �������������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
comment on column DBF_KTDHEAD.d5411doc
  is '��� ���� �������� ����������� ������������� � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.d544aid
  is '������������� ������������ ������ ����������, ��� ���������� ��������, �������������� ����������';
comment on column DBF_KTDHEAD.d544adid
  is '������������� ���������, ��������������� ����������  � ����������� ������ ����������';
comment on column DBF_KTDHEAD.d544modid
  is '��� ���� ���������, ��������������� ����������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
comment on column DBF_KTDHEAD.d544doc
  is '��� ���������, ��������������� ����������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.prvnumg545
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_KTDHEAD.prprovg545
  is '������� ������������� ���������, ��������������� ��������: 1 - �������� ����������� ��� ������ ���; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_KTDHEAD.g545doc
  is '��� ���� ���������, ��������������� ��������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.g545modid
  is '��� ���������, ��������������� ��������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
comment on column DBF_KTDHEAD.g545adid
  is '������������� ���������, ��������������� ��������, � ����������� ������ ����������';
comment on column DBF_KTDHEAD.g545aid
  is '������������� ������������ ������ ����������, ��� �������� ��������, �������������� ��������';
comment on column DBF_KTDHEAD.prvnumg544
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_KTDHEAD.prprovg544
  is '������� ������������� ���������, ��������������� ����������: 1 - �������� ����������� ��� ������ ���; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_KTDHEAD.g544doc
  is '��� ���������, ��������������� ����������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.g544modid
  is '��� ���� ���������, ��������������� ����������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
comment on column DBF_KTDHEAD.g544adid
  is '������������� ���������, ��������������� ����������  � ����������� ������ ����������';
comment on column DBF_KTDHEAD.g544aid
  is '������������� ������������ ������ ����������, ��� ���������� ��������, �������������� ���������� ';
comment on column DBF_KTDHEAD.prvnumg541
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_KTDHEAD.prprovg541
  is '������� ������������� �������� ����������� �������������: 1 - �������� ����������� ��� ������ ���; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_KTDHEAD.g5411doc
  is '��� ���� �������� ����������� ������������� � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.g5411modid
  is '��� ���� �������� ����������� �������������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
comment on column DBF_KTDHEAD.g5411adid
  is '������������� �������� ����������� �������������  � ����������� ������ ����������';
comment on column DBF_KTDHEAD.g5411aid
  is '������������� ������������ ������ ����������, ��� ���������� ������� ����������� �������������';
comment on column DBF_KTDHEAD.prvnumd545
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������';
comment on column DBF_KTDHEAD.prprovd545
  is '������� ������������� ���������, ��������������� ��������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��';
comment on column DBF_KTDHEAD.d545doc
  is '��� ���� ���������, ��������������� ��������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
comment on column DBF_KTDHEAD.d545modid
  is '��� ���������, ��������������� ��������,  � ������������ � �������� �������� ����������� ���� ���������� ';
comment on column DBF_KTDHEAD.d545adid
  is '������������� ���������, ��������������� ��������, � ����������� ������ ����������';
comment on column DBF_KTDHEAD.d545aid
  is '������������� ������������ ������ ����������, ��� �������� ��������, �������������� ��������';
comment on column DBF_KTDHEAD.prvnumd544
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������]';
comment on column DBF_KTDHEAD.prprovd544
  is '������� ������������� ���������, ��������������� ����������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��]';
comment on column DBF_KTDHEAD.prvnumd541
  is '��������������� ����� ����������� ���������, � ������� �� ��� ������������� �����������]';
comment on column DBF_KTDHEAD.prprovd541
  is '������� ������������� �������� ����������� �������������: 1 - �������� ����������� ��� ������ ��; 2 - �������� ��  �����������  � ������������ �  ������ ������ ������ 4 ��. 183 �� ��]';
COMMENT ON COLUMN DBF_KTDHEAD.G089 IS '����������� ��������� ��������: 1-����������, 2 � ������ �� ������';
COMMENT ON COLUMN DBF_KTDHEAD.G143ASTREE IS '�������� �����, ����� ����, ����� ����� /�������� (�������.�������.)';
COMMENT ON COLUMN DBF_KTDHEAD.G19 IS '������� ������������ ��������� (������� ��): "1"- ���� ��������� ������� (��� ���� �� ������ �� ���) ����� ���������� ������� ������������ (�������������) � ����������; "0" � ���� ������� (� ��� �����, ���� ���������� �������� � ���, ��� ����������� (������������) ������)';
COMMENT ON COLUMN DBF_KTDHEAD.G3010 IS '��� ���������: 1-�������� 2-�������������';
COMMENT ON COLUMN DBF_KTDHEAD.G45A1 IS '���� �������� ��������� � (���) ���������� � ��������, ��������� � ��: 0 - �� ������� �������; 1 - ����� ������� �������';
COMMENT ON COLUMN DBF_KTDHEAD.G45A2 IS '��������������, ����������� ���������� ��� �������� ��������� � (���) ���������� � ��������, ��������� � ��: 0 - ��������� ���������� � �������� ��������� � (���) ���������� � ��������, ��������� � ��; 1 - ���������� �������� ���������� � ��������; 2 - ���������� �������������� ��������; 3 - ���������� ������������ ����� �� �������, �������� (�����������) ���������� ������� � �� ����������� ���; 4 - ���������� ����������� ���������� ��������; 5 - ���������� �������� ���������� ��������; 6 - ���������� � �������� ���� ������� �������� ������� ���������� - ������ ����������� �����';
COMMENT ON COLUMN DBF_KTDHEAD.G45A3 IS '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ���������� (����) �������: 0 - ��������� � (���) ���������� �����������; 1 - ����������� ������ (�������� �������� ������ ���������, ������ � ������������ ��������� � �.�.); 2 - �������������� ������������ ���������� � (���) ���� ������� ���������� � (���) ���� �������, ��������� � �� � (���) ��������������� ��������� ������������������� ������, � ��� ����� ��� ������������� ��������� ����������� ������';
COMMENT ON COLUMN DBF_KTDHEAD.G45A4 IS '��������� � (���) ���������� ��������, ��������� � ��, � ������ ������������� ������� � (���) �������� ������������: 0 - ��������� � (���) ���������� �����������; 1 - ��������� ������������� �������� � ������ ������������� �������; 2 - ��������� ������������ ������� �������������� �������� �����������; 3 - �������������� �������� ����������� ����� ������� ������� �� ����������� ������������ ����� �� �������, �������� (�����������) ���������� ������� � �� ����������� ��� ���� �� ��������� ���������� � �������� ���� ������� �������� ������� ���������� - ������ ����������� �����; 4 - �������������� ����� ������� ������� �������� ����������� �� ��������� ���������� ��� ����������� ������������� � �������������� �������� �����������';
COMMENT ON COLUMN DBF_KTDHEAD.G45A5 IS '��������� ��������, ��������� � ��, � ��������� ������������������ ���� ������ �� ������ �������� ������������ ������������������� ������������ ����������� �����: 0 - ��������� �����������; 1 - ��������� �������� ������������� ������� �� ������ �������� ������������ ������������������� ������������ ����������� �����';
COMMENT ON COLUMN DBF_KTDHEAD.G45A6 IS '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ���������� ��������� �������: 0 - ��������� � (���) ���������� �����������; 1 - ����������� ������ (��������, �������������� ������, � ��� ����� ��-�� ������������� ���������� ����� ������); 2 - ������ � ��������� �������������� ���������� (�������), � ��� ����� ��� ������������� ��������� ����������� ������; 3 - ������ � ������ ������ ����������� ���������� ��������� � (���) ������ ��� ������� ���������� ��������� �������, � ��� ����� ��� ������������� ��������� ����������� ������ ��� ������ � ��������� �������������� ���������� (�������)';
COMMENT ON COLUMN DBF_KTDHEAD.G5410 IS '��� ���������: 2 � ������������� �����������  ������������� (�������); 3 � ������������� ����������� �������������.';
COMMENT ON COLUMN DBF_KTDHEAD.K032 IS '����� ���������� ���� ���1 � ���2 (������� ���������� ���������� ������� ���������� ��.3 ��)';
create index DBF_KTDHEAD_ID on DBF_KTDHEAD (ID);
create index DBF_KTDHEAD_LOAD_ID on DBF_KTDHEAD (LOAD_ID);
create index DBF_KTDHEAD_NZP on DBF_KTDHEAD (G071, G072, G073, NZP);
alter table DBF_KTDHEAD
  add constraint DBF_KTDHEAD_NUM_PP unique (G071, G072, G073, NUM_PP);

prompt
prompt Creating table DBF_KTDPLBIZ
prompt ===========================
prompt
create table DBF_KTDPLBIZ
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  num_pp    NUMBER not null,
  kb0       VARCHAR2(1),
  kb1       VARCHAR2(4),
  kb2       NUMBER,
  kb3       VARCHAR2(3),
  kb4       NUMBER,
  kb5       VARCHAR2(2),
  iret      NUMBER,
  kb6       NUMBER,
  kb61      VARCHAR2(3),
  kb7       NUMBER,
  nzp       NUMBER,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER,
  id        NUMBER,
  load_id   NUMBER,
  dateload  DATE
)
;
comment on table DBF_KTDPLBIZ
  is '������� DBF_KTDPLBIZ';
comment on column DBF_KTDPLBIZ.g071
  is '��������������� ����� �� - ��� �������';
comment on column DBF_KTDPLBIZ.g072
  is '��������������� ����� �� - ���� �����������';
comment on column DBF_KTDPLBIZ.g073
  is '��������������� ����� �� - ���������� �����';
comment on column DBF_KTDPLBIZ.num_pp
  is '����� ��� �� �������';
comment on column DBF_KTDPLBIZ.kb0
  is '������';
comment on column DBF_KTDPLBIZ.kb1
  is '��� ���� ������� �� �������������� ';
comment on column DBF_KTDPLBIZ.kb2
  is '����� �������';
comment on column DBF_KTDPLBIZ.kb3
  is '�������� ��� ������ ����� �������';
comment on column DBF_KTDPLBIZ.kb4
  is '���� ������ �������';
comment on column DBF_KTDPLBIZ.kb5
  is '������ ������';
comment on column DBF_KTDPLBIZ.iret
  is '������� �������� �������� �������';
comment on column DBF_KTDPLBIZ.kb6
  is '���������� ����� �������';
comment on column DBF_KTDPLBIZ.kb61
  is '�������� ��� ������ ���������� ����� �������';
comment on column DBF_KTDPLBIZ.kb7
  is '��������� (� ������������ ������)';
comment on column DBF_KTDPLBIZ.nzp
  is '����������������� ����� ������';
comment on column DBF_KTDPLBIZ.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDPLBIZ.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTDPLBIZ.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTDPLBIZ.id
  is 'ID';
comment on column DBF_KTDPLBIZ.load_id
  is 'LOAD_ID';
comment on column DBF_KTDPLBIZ.dateload
  is 'DATELOAD';
create index DBF_KTDPLBIZ_GTD on DBF_KTDPLBIZ (G071, G072, G073, NZP);
create index DBF_KTDPLBIZ_LOAD_ID on DBF_KTDPLBIZ (LOAD_ID);
alter table DBF_KTDPLBIZ
  add constraint DBF_KTDPLBIZ_UQ unique (G071, G072, G073, NUM_PP, KB1, KB3, IRET, KB5);

prompt
prompt Creating table DBF_KTDPLTIZ
prompt ===========================
prompt
create table DBF_KTDPLTIZ
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  num_pp    NUMBER not null,
  k32       NUMBER,
  k470      VARCHAR2(1),
  k471      VARCHAR2(4),
  k471npp   NUMBER,
  k472      NUMBER,
  k4721     VARCHAR2(3),
  k4722     VARCHAR2(50),
  k473      NUMBER,
  k4731     VARCHAR2(1),
  k4732     VARCHAR2(3),
  k4733     VARCHAR2(3),
  k4734     NUMBER,
  kpp       NUMBER,
  k474      NUMBER not null,
  k4741     VARCHAR2(3),
  k475      VARCHAR2(2),
  k476      NUMBER,
  k4761     VARCHAR2(3),
  k473z1_2  VARCHAR2(1),
  k473_2    NUMBER,
  k4731_2   VARCHAR2(1),
  k4732_2   VARCHAR2(3),
  k4733_2   VARCHAR2(3),
  k4734_2   NUMBER,
  k473z1_3  VARCHAR2(1),
  k473_3    NUMBER,
  k4731_3   VARCHAR2(1),
  k4732_3   VARCHAR2(3),
  k4733_3   VARCHAR2(3),
  k4734_3   NUMBER,
  k473z2_2  NUMBER,
  k4730     DATE,
  k4740     DATE,
  k47_nd    NUMBER,
  k47_ns    NUMBER,
  k47_nm    NUMBER,
  k47_tr    NUMBER,
  k47_g40   NUMBER,
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT,
  dateload  DATE,
  id        NUMBER,
  load_id   NUMBER
)
;
comment on table DBF_KTDPLTIZ
  is '������� DBF_KTDPLTIZ';
comment on column DBF_KTDPLTIZ.g071
  is '��������������� ����� �� - ��� �������';
comment on column DBF_KTDPLTIZ.g072
  is '��������������� ����� �� - ���� �����������';
comment on column DBF_KTDPLTIZ.g073
  is '��������������� ����� �� - ���������� �����';
comment on column DBF_KTDPLTIZ.num_pp
  is '����� ��� �� �������';
comment on column DBF_KTDPLTIZ.k32
  is '���������� ����� ������';
comment on column DBF_KTDPLTIZ.k470
  is '������';
comment on column DBF_KTDPLTIZ.k471
  is '��� ���� ������� � ������������ � ��������������� ��';
comment on column DBF_KTDPLTIZ.k471npp
  is '���������� ����� ������ �� ���� �������';
comment on column DBF_KTDPLTIZ.k472
  is '������ ����������';
comment on column DBF_KTDPLTIZ.k4721
  is '�������� ��� ������ ������ ���������� (���������� ��';
comment on column DBF_KTDPLTIZ.k4722
  is '����� ������ (������ �����)';
comment on column DBF_KTDPLTIZ.k473
  is '������/������ ����������������';
comment on column DBF_KTDPLTIZ.k4731
  is '��� ������ (���������� - %, ������������� - *)';
comment on column DBF_KTDPLTIZ.k4732
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4733
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4734
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTDPLTIZ.kpp
  is '������� �������������� ������ (0, 1)';
comment on column DBF_KTDPLTIZ.k474
  is '����� �������';
comment on column DBF_KTDPLTIZ.k4741
  is '�������� ��� ������ ����� �������';
comment on column DBF_KTDPLTIZ.k475
  is '������ (���������) �������';
comment on column DBF_KTDPLTIZ.k476
  is '������';
comment on column DBF_KTDPLTIZ.k4761
  is '������';
comment on column DBF_KTDPLTIZ.k473z1_2
  is '���� �������� ���������';
comment on column DBF_KTDPLTIZ.k473_2
  is '������';
comment on column DBF_KTDPLTIZ.k4731_2
  is '��� ������ (���������� - %, ������������� - *)';
comment on column DBF_KTDPLTIZ.k4732_2
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4733_2
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4734_2
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTDPLTIZ.k473z1_3
  is '���� ��������';
comment on column DBF_KTDPLTIZ.k473_3
  is '������';
comment on column DBF_KTDPLTIZ.k4731_3
  is '��� ������ (���������� - %, ������������� - *)';
comment on column DBF_KTDPLTIZ.k4732_3
  is '�������� ��� ������ ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4733_3
  is '��� ������� ��������� ������ (������������� ������)';
comment on column DBF_KTDPLTIZ.k4734_3
  is '������� ����������� ������� ��������� (�������������';
comment on column DBF_KTDPLTIZ.k473z2_2
  is '��������� ���������� �������� ���������: 1 ��� 0';
comment on column DBF_KTDPLTIZ.k4730
  is '���� ���������� ������ ����������� �������';
comment on column DBF_KTDPLTIZ.k4740
  is '������';
comment on column DBF_KTDPLTIZ.k47_nd
  is '���������� ����';
comment on column DBF_KTDPLTIZ.k47_ns
  is '���������� ������';
comment on column DBF_KTDPLTIZ.k47_nm
  is '����� ������ � �������� ����������� �������';
comment on column DBF_KTDPLTIZ.k47_tr
  is '������� �� ������ ����������������';
comment on column DBF_KTDPLTIZ.k47_g40
  is '���������� ����� ������ � 40 �����';
comment on column DBF_KTDPLTIZ.nzp
  is '����������������� ����� ������';
comment on column DBF_KTDPLTIZ.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDPLTIZ.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTDPLTIZ.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTDPLTIZ.dateload
  is 'DATELOAD';
comment on column DBF_KTDPLTIZ.id
  is 'ID';
comment on column DBF_KTDPLTIZ.load_id
  is 'LOAD_ID';
create index DBF_KTDPLTIZ_GTD on DBF_KTDPLTIZ (G071, G072, G073, NZP);
create index DBF_KTDPLTIZ_LOAD_ID on DBF_KTDPLTIZ (LOAD_ID);
alter table DBF_KTDPLTIZ
  add constraint DBF_KTDPLTIZ_UQ unique (G071, G072, G073, NUM_PP, K32, K471, K471NPP);

prompt
prompt Creating table DBF_KTDSUMPP
prompt ===========================
prompt
create table DBF_KTDSUMPP
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  num_pp    NUMBER,
  gb1       VARCHAR2(4),
  gb3       VARCHAR2(3),
  gb5       VARCHAR2(2),
  iret      NUMBER,
  numpdok   VARCHAR2(50),
  datpdok   DATE,
  sum_all   NUMBER,
  sumpdok   NUMBER,
  valpdok   VARCHAR2(3),
  datpostd  DATE,
  datpaymt  DATE,
  innplat   VARCHAR2(12),
  kppplat   VARCHAR2(9),
  lnpins    VARCHAR2(4),
  fioins    VARCHAR2(40),
  datins    DATE,
  timins    VARCHAR2(8),
  nzp       NUMBER,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER,
  id        NUMBER,
  load_id   NUMBER,
  dateload  DATE
)
;
comment on table DBF_KTDSUMPP
  is '������� DBF_KTDSUMPP';
comment on column DBF_KTDSUMPP.g071
  is '��������������� ����� �� - ��� �������';
comment on column DBF_KTDSUMPP.g072
  is '��������������� ����� �� - ���� ���������';
comment on column DBF_KTDSUMPP.g073
  is '��������������� ����� �� - ���������� ���';
comment on column DBF_KTDSUMPP.num_pp
  is '����� ��� �� �������';
comment on column DBF_KTDSUMPP.gb1
  is '��� ���� ������� �� ��������������';
comment on column DBF_KTDSUMPP.gb3
  is '�������� ��� ������ ����� �������';
comment on column DBF_KTDSUMPP.gb5
  is '������ ������ �� ��������������';
comment on column DBF_KTDSUMPP.iret
  is '������� �������� �������� �������';
comment on column DBF_KTDSUMPP.numpdok
  is '����� ���������� ���������';
comment on column DBF_KTDSUMPP.datpdok
  is '���� ���������� ���������';
comment on column DBF_KTDSUMPP.sum_all
  is '����� ����� �� ���������� ���������';
comment on column DBF_KTDSUMPP.sumpdok
  is '����������� ����� �� ���������� ���������';
comment on column DBF_KTDSUMPP.valpdok
  is '�������� ��� ������ �����';
comment on column DBF_KTDSUMPP.datpostd
  is '���� ����������� �������� ������� �� ����';
comment on column DBF_KTDSUMPP.datpaymt
  is '���� ������';
comment on column DBF_KTDSUMPP.innplat
  is '��� �����������';
comment on column DBF_KTDSUMPP.kppplat
  is '��� �����������';
comment on column DBF_KTDSUMPP.lnpins
  is '��� ����������, ����������� ������';
comment on column DBF_KTDSUMPP.fioins
  is '��� ����������, ����������� ������';
comment on column DBF_KTDSUMPP.datins
  is '���� ������������ �������';
comment on column DBF_KTDSUMPP.timins
  is '����� ������������ ������� (hh:mm:ss)';
comment on column DBF_KTDSUMPP.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_KTDSUMPP.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDSUMPP.tmodify
  is '����� ����� / ����������� ������ (��:��:�';
comment on column DBF_KTDSUMPP.p_edoc_id
  is '������ �� ������������� ��������� � �����';
comment on column DBF_KTDSUMPP.id
  is 'ID';
comment on column DBF_KTDSUMPP.load_id
  is 'LOAD_ID';
comment on column DBF_KTDSUMPP.dateload
  is 'DATELOAD';
create index DBF_KTDSUMPP_GTD on DBF_KTDSUMPP (G071, G072, G073, NZP);
create index DBF_KTDSUMPP_LOAD_ID on DBF_KTDSUMPP (LOAD_ID);
alter table DBF_KTDSUMPP
  add constraint DBF_KTDSUMPP_UQ unique (G071, G072, G073, NUM_PP, GB1, GB3, IRET, GB5, VALPDOK, NUMPDOK, DATPDOK, INNPLAT, KPPPLAT);

prompt
prompt Creating table DBF_KTDTOVAR
prompt ===========================
prompt
create table DBF_KTDTOVAR
(
  g071       VARCHAR2(8),
  g072       DATE,
  g073       VARCHAR2(7),
  num_pp     NUMBER(2),
  g020       VARCHAR2(15),
  g021       VARCHAR2(12),
  g022       VARCHAR2(150),
  g023post   VARCHAR2(9),
  g0231      VARCHAR2(2),
  g0231n     VARCHAR2(40),
  g023subd   VARCHAR2(50),
  g023city   VARCHAR2(35),
  g023street VARCHAR2(50),
  g027       VARCHAR2(9),
  g022a      VARCHAR2(150),
  g027a      VARCHAR2(9),
  g0281      VARCHAR2(2),
  g0281a     VARCHAR2(15),
  g02821     VARCHAR2(11),
  g02822     VARCHAR2(25),
  g02823     VARCHAR2(150),
  g0283      DATE,
  k031       NUMBER(5),
  g031       NUMBER(5),
  ch         NUMBER(1),
  g31_1      VARCHAR2(250),
  g31_13     VARCHAR2(40),
  g31_1_prdt DATE,
  g31_1_oilf VARCHAR2(250),
  g31_2      NUMBER(8),
  g31_2part  NUMBER(8),
  g31_20     VARCHAR2(1),
  g31_3      NUMBER(6),
  g31_7      NUMBER,
  g31_71     VARCHAR2(13),
  g31_8      NUMBER,
  g31_81     VARCHAR2(13),
  g31_82     VARCHAR2(3),
  g31_9      NUMBER,
  g31_91     VARCHAR2(13),
  g31_92     VARCHAR2(3),
  g31_d1     DATE,
  g31_d2     DATE,
  g31_p1     VARCHAR2(7),
  g31_p2     VARCHAR2(7),
  g31_fact   NUMBER,
  g31_fc_1   VARCHAR2(3),
  g32        NUMBER(5),
  g32kdt     NUMBER(5),
  g32_1      VARCHAR2(3),
  g33        VARCHAR2(10),
  g330       VARCHAR2(1),
  g331       VARCHAR2(1),
  g332       VARCHAR2(1),
  g333       VARCHAR2(4),
  g340       VARCHAR2(1),
  g34        VARCHAR2(2),
  g35        NUMBER,
  g36        VARCHAR2(7),
  g37        VARCHAR2(7),
  g38        NUMBER,
  g38_1      NUMBER,
  g39        NUMBER,
  g3911      VARCHAR2(3),
  g3912      VARCHAR2(3),
  g392       VARCHAR2(70),
  g41a       VARCHAR2(3),
  g42        NUMBER,
  g43        VARCHAR2(1),
  g430       VARCHAR2(2),
  g45        NUMBER,
  g451       VARCHAR2(2),
  g452       NUMBER,
  g45a1      VARCHAR2(1),
  g45a2      VARCHAR2(1),
  g45a3      VARCHAR2(1),
  g45a4      VARCHAR2(1),
  g45a5      VARCHAR2(1),
  g45a6      VARCHAR2(1),
  g45a7      VARCHAR2(1),
  g45a8      VARCHAR2(1),
  g46        NUMBER,
  g461       VARCHAR2(1),
  k470       NUMBER,
  nzp        NUMBER(10),
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  p_edoc_id  NUMBER(19),
  id         NUMBER,
  load_id    NUMBER,
  dateload   DATE,
  cimsign    VARCHAR2(1),
  tcimflag   VARCHAR2(2),
  tcimkol    NUMBER(6)
)
;
comment on table DBF_KTDTOVAR
  is '������� DBF_KTDTOVAR';
comment on column DBF_KTDTOVAR.g071
  is '��������������� ����� �� � ��� �������';
comment on column DBF_KTDTOVAR.g072
  is '��������������� ����� �� � ���� �����������';
comment on column DBF_KTDTOVAR.g073
  is '��������������� ����� �� � ���������� �����';
comment on column DBF_KTDTOVAR.num_pp
  is '����� ��� �� �������';
comment on column DBF_KTDTOVAR.g020
  is '����/ ������';
comment on column DBF_KTDTOVAR.g021
  is '��� ';
comment on column DBF_KTDTOVAR.g022
  is '������������ (�������, ���, ��������)';
comment on column DBF_KTDTOVAR.g023post
  is '���, ������������ �������� ����';
comment on column DBF_KTDTOVAR.g0231
  is '��� �����-2 ������  ��������������� ';
comment on column DBF_KTDTOVAR.g0231n
  is '������� �������� ������  ��������������� � ������������ � ��������������� ����� ����';
comment on column DBF_KTDTOVAR.g023subd
  is '�������� ������� ��������������� -���������������� ������� ������ (�������, �����, ����, ��������� � �.�.) ';
comment on column DBF_KTDTOVAR.g023city
  is '�������� ����������� ������ (����� � �.�.)';
comment on column DBF_KTDTOVAR.g023street
  is '�������� �����, ����� ����, ����� ����� /��������';
comment on column DBF_KTDTOVAR.g027
  is '��� ';
comment on column DBF_KTDTOVAR.g022a
  is '������� ������������ (������������ �������������)';
comment on column DBF_KTDTOVAR.g027a
  is '��� (������������ �������������) ';
comment on column DBF_KTDTOVAR.g0281
  is '��� ���� ���������, ��������������� �������� ';
comment on column DBF_KTDTOVAR.g0281a
  is '������� ������������ ���������, ��������������� �������� ';
comment on column DBF_KTDTOVAR.g02821
  is '����� ���������, ��������������� ��������';
comment on column DBF_KTDTOVAR.g02822
  is '����� ���������, ��������������� �������� ';
comment on column DBF_KTDTOVAR.g02823
  is '������������ �����������, �������� ��������';
comment on column DBF_KTDTOVAR.g0283
  is '���� ������ ���������, ��������������� ��������';
comment on column DBF_KTDTOVAR.k031
  is '���������� ����� ����� ���
(������� ���������� ���������� ������� ���������� ��.3 ��)
';
comment on column DBF_KTDTOVAR.g031
  is '���������� ����� ��������� �� ';
comment on column DBF_KTDTOVAR.ch
  is '����� ����� (1-3)';
comment on column DBF_KTDTOVAR.g31_1
  is '������������ (��������, ������������ ��� ���� ������������ ������������) �������';
comment on column DBF_KTDTOVAR.g31_13
  is '������';
comment on column DBF_KTDTOVAR.g31_1_prdt
  is '���� ������� ���������';
comment on column DBF_KTDTOVAR.g31_1_oilf
  is '�������� � �������������';
comment on column DBF_KTDTOVAR.g31_2
  is '����� ���������� �������� ����, ������� �������';
comment on column DBF_KTDTOVAR.g31_2part
  is '���������� �������� ����, ���������� ������� ��������';
comment on column DBF_KTDTOVAR.g31_20
  is '��� ������� �������� ������:
0 � ��� ��������
1 � � ���������
2 � ��� �������� � ������������� �������� ������������� ��������
';
comment on column DBF_KTDTOVAR.g31_3
  is '���-�� �����������';
comment on column DBF_KTDTOVAR.g31_7
  is '���-�� ������ (� �������������� ������� ���������)';
comment on column DBF_KTDTOVAR.g31_71
  is '�������� ����������� �������������� ������� ���������';
comment on column DBF_KTDTOVAR.g31_8
  is '���������� ������ � ������� ���������, �������� �� �������� � �������������� (1)';
comment on column DBF_KTDTOVAR.g31_81
  is '�������� ����������� ������� ���������, �������� �� �������� � �������������� (1)';
comment on column DBF_KTDTOVAR.g31_82
  is '��� ������� ���������, �������� �� �������� � �������������� (1)';
comment on column DBF_KTDTOVAR.g31_9
  is '���������� ������ � ������� ���������, �������� �� �������� � �������������� (2)';
comment on column DBF_KTDTOVAR.g31_91
  is '�������� ����������� ������� ���������, �������� �� �������� � �������������� (2)';
comment on column DBF_KTDTOVAR.g31_92
  is '��� ������� ���������, �������� �� �������� � �������������� (2)';
comment on column DBF_KTDTOVAR.g31_d1
  is '�������� � ������ (�)';
comment on column DBF_KTDTOVAR.g31_d2
  is '�������� � ������ (��)';
comment on column DBF_KTDTOVAR.g31_p1
  is '������';
comment on column DBF_KTDTOVAR.g31_p2
  is '������';
comment on column DBF_KTDTOVAR.g31_fact
  is '���������� �������, ���������� ���������� ���������� � ������������ � ��������� �������� (������� 8 ��. 31 ��).';
comment on column DBF_KTDTOVAR.g31_fc_1
  is '��� ������� ��������� �������, ���������� ���������� ����������';
comment on column DBF_KTDTOVAR.g32
  is '����� ������ �� ��';
comment on column DBF_KTDTOVAR.g32kdt
  is '����� ������ �� ���';
comment on column DBF_KTDTOVAR.g32_1
  is '��� (��� �������������� �������, ������������ � ������������� �������� ������������). ��� (��� �������������� ��������-������). ��.32, 2-� ��������� ��';
comment on column DBF_KTDTOVAR.g33
  is '��� ������ �� �� ��� ��';
comment on column DBF_KTDTOVAR.g330
  is '����������� ������������������ ����:
1-�(�����)
2-����� ������
� ��������� ������� �� �����������
';
comment on column DBF_KTDTOVAR.g331
  is '�������������� ������� ����������� �������������';
comment on column DBF_KTDTOVAR.g332
  is '������� ������� ���������������� �������������';
comment on column DBF_KTDTOVAR.g333
  is '���  ������ � ������������ � ��������������� �������������� ���������� ���������� ';
comment on column DBF_KTDTOVAR.g340
  is '������� ���� ������ �������������:
1- ��������� ��� �����-2 �� ��. OKSMT
2- ��������� ��� �� ��. EK_EU
����� �� �����������
';
comment on column DBF_KTDTOVAR.g34
  is '��� ������ �������������';
comment on column DBF_KTDTOVAR.g35
  is '��� ������ (��)';
comment on column DBF_KTDTOVAR.g36
  is '�����������, ������ � ���� ����������� �� ������ ���������� ��������';
comment on column DBF_KTDTOVAR.g37
  is '��������� / �0000010� - ��� ��������';
comment on column DBF_KTDTOVAR.g38
  is '��� ����� (��)';
comment on column DBF_KTDTOVAR.g38_1
  is '��� ����� ��� ����� �����-���� ����� �������� (��) ';
comment on column DBF_KTDTOVAR.g39
  is '�����';
comment on column DBF_KTDTOVAR.g3911
  is '�������� ��� ������ �����';
comment on column DBF_KTDTOVAR.g3912
  is '��� ������� ��������� �����';
comment on column DBF_KTDTOVAR.g392
  is '������������ ������ / ������� ��������� �����';
comment on column DBF_KTDTOVAR.g41a
  is '��� �������������� ������� ���������';
comment on column DBF_KTDTOVAR.g42
  is '���� ������ ';
comment on column DBF_KTDTOVAR.g43
  is '��� �������� ������������� ���������� ��������� �� �������������� ������� �� ���������� ���������';
comment on column DBF_KTDTOVAR.g430
  is '��� ������ ����������� ���������� ��������� ������������� ������� � ������������ � ��������������� ������� ����������� ���������� ��������� ';
comment on column DBF_KTDTOVAR.g45
  is '����������������� ���������� ��������� ������ (��� ����� � ������) / ������ ��� ������� ����� ����������� ������ ���������� ������, �������';
comment on column DBF_KTDTOVAR.g451
  is '������ ';
comment on column DBF_KTDTOVAR.g452
  is '���������� �������� ���������� ���������, ��.45 � ������ ���������';
comment on column DBF_KTDTOVAR.g45a1
  is '���� �������� ��������� � (���) ���������� � ��������, ��������� � ��: 0 - �� ������� �������; 1 - ����� ������� �������';
comment on column DBF_KTDTOVAR.g45a2
  is '��������������, ����������� ���������� ��� �������� ��������� � (���) ���������� � ��������, ��������� � ��';
comment on column DBF_KTDTOVAR.g45a3
  is '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ���������� (����) �������';
comment on column DBF_KTDTOVAR.g45a4
  is '��������� � (���) ���������� ��������, ��������� � ��, � ������ ������������� ������� � (���) �������� ������������';
comment on column DBF_KTDTOVAR.g45a5
  is '��������� ��������, ��������� � ��, � ��������� ������������������ ���� ������ �� ������ �������� ������������ ������������������� ������������ ����������� �����';
comment on column DBF_KTDTOVAR.g45a6
  is '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ���������� ��������� �������';
comment on column DBF_KTDTOVAR.g45a7
  is '��������� � (���) ���������� ��������, ��������� � ��, � ��������� ����������� (����������) ����������, ���� ��������';
comment on column DBF_KTDTOVAR.g45a8
  is '��������� � (���) ���������� ���� ��������, ��������� � ��';
comment on column DBF_KTDTOVAR.g46
  is '�������������� ��������� ������';
comment on column DBF_KTDTOVAR.g461
  is '������ ';
comment on column DBF_KTDTOVAR.k470
  is '����� �����, ���������� ��������� (��������), ���. �� ������';
comment on column DBF_KTDTOVAR.nzp
  is '����������������� ����� ������';
comment on column DBF_KTDTOVAR.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDTOVAR.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTDTOVAR.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTDTOVAR.id
  is '���������� �������������';
comment on column DBF_KTDTOVAR.load_id
  is '������������� ��������';
comment on column DBF_KTDTOVAR.dateload
  is '���� ��������';
comment on column DBF_KTDTOVAR.cimsign
  is '������� ��������� ������� � �������, ���������� ���������� ������������ (������������������) ������� (�̻). ��.33 ��, ������ ���������';
comment on column DBF_KTDTOVAR.tcimflag
  is '������� ��������� ����������� (�����������������) ������ ����� ������� ������� ��»';
comment on column DBF_KTDTOVAR.tcimkol
  is '���������� ���������� ����������� (�����������������) ������';
COMMENT ON COLUMN DBF_KTDTOVAR.G31_20 IS '��� ������� �������� ������: 0 � ��� �������� 1 � � ��������� 2 � ��� �������� � ������������� �������� ������������� ��������';
COMMENT ON COLUMN DBF_KTDTOVAR.G330 IS '����������� ������������������ ����: 1-�(�����) 2-����� ������ � ��������� ������� �� �����������';
COMMENT ON COLUMN DBF_KTDTOVAR.G340 IS '������� ���� ������ �������������: 1- ��������� ��� �����-2 �� ��. OKSMT 2- ��������� ��� �� ��. EK_EU ����� �� �����������';
COMMENT ON COLUMN DBF_KTDTOVAR.K031 IS '���������� ����� ����� ���
(������� ���������� ���������� ������� ���������� ��.3 ��)';
create index DBF_KTDTOVAR_ID on DBF_KTDTOVAR (ID);
create index DBF_KTDTOVAR_LOAD_ID on DBF_KTDTOVAR (LOAD_ID);
create index DBF_KTDTOVAR_NZP on DBF_KTDTOVAR (G071, G072, G073, NZP);
alter table DBF_KTDTOVAR
  add constraint DBF_KTDTOVAR_NUM_PP_G32 unique (G071, G072, G073, NUM_PP, G32);

prompt
prompt Creating table DBF_KTDTOVG
prompt ==========================
prompt
create table DBF_KTDTOVG
(
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(7) not null,
  g32        NUMBER not null,
  g32g       NUMBER,
  numrec     NUMBER,
  g31_10     VARCHAR2(4),
  g31_11     VARCHAR2(150),
  g31_12     VARCHAR2(150),
  g31_14     VARCHAR2(50),
  g31_15     VARCHAR2(50),
  g31_16     VARCHAR2(50),
  g31_17     VARCHAR2(50),
  g31_18     VARCHAR2(30),
  g31_19     VARCHAR2(20),
  g31_20     VARCHAR2(50),
  kolvo      FLOAT,
  code_edi   VARCHAR2(3),
  name_edi   VARCHAR2(13),
  nzp        FLOAT,
  dmodify    DATE not null,
  tmodify    VARCHAR2(8) not null,
  p_edoc_id  FLOAT,
  g31_15_mod VARCHAR2(50),
  num_pp     NUMBER,
  id         NUMBER,
  load_id    NUMBER,
  dateload   DATE
)
;
comment on table DBF_KTDTOVG
  is '������� DBF_KTDTOVG';
comment on column DBF_KTDTOVG.g071
  is '��������������� ����� �� - ��� �������';
comment on column DBF_KTDTOVG.g072
  is '��������������� ����� �� - ���� �����������';
comment on column DBF_KTDTOVG.g073
  is '��������������� ����� �� - ���������� �����';
comment on column DBF_KTDTOVG.g32
  is '����� ������ �� ��';
comment on column DBF_KTDTOVG.g32g
  is '����� ������ ������� ������ ������������ � ���';
comment on column DBF_KTDTOVG.numrec
  is '���������� ����� ������ �� ������';
comment on column DBF_KTDTOVG.g31_10
  is '��������� ��������� �������� ����������';
comment on column DBF_KTDTOVG.g31_11
  is '������������ ����� ������������';
comment on column DBF_KTDTOVG.g31_12
  is '���. ����, ����� �������������, ������ �������';
comment on column DBF_KTDTOVG.g31_14
  is '�����';
comment on column DBF_KTDTOVG.g31_15
  is '�������';
comment on column DBF_KTDTOVG.g31_16
  is '�������� (����, ���, ���, ���, ��)';
comment on column DBF_KTDTOVG.g31_17
  is '���� / ���� ��� ������ ������ (��� ����- � ���';
comment on column DBF_KTDTOVG.g31_18
  is '������������ ���������� (��� �������������� ��';
comment on column DBF_KTDTOVG.g31_19
  is '������ ���������';
comment on column DBF_KTDTOVG.g31_20
  is '�������';
comment on column DBF_KTDTOVG.kolvo
  is '����������';
comment on column DBF_KTDTOVG.code_edi
  is '��� ������� ���������';
comment on column DBF_KTDTOVG.name_edi
  is '������� ������������ ������� ���������';
comment on column DBF_KTDTOVG.nzp
  is '����������������� ����� ������ �� ��';
comment on column DBF_KTDTOVG.dmodify
  is '���� ����� / ����������� ������';
comment on column DBF_KTDTOVG.tmodify
  is '����� ����� / ����������� ������ (��:��:��)';
comment on column DBF_KTDTOVG.p_edoc_id
  is '������ �� ������������� ��������� � ������';
comment on column DBF_KTDTOVG.g31_15_mod
  is '������';
comment on column DBF_KTDTOVG.num_pp
  is '����� ��� �� �������';
comment on column DBF_KTDTOVG.id
  is 'ID';
comment on column DBF_KTDTOVG.load_id
  is 'LOAD_ID';
comment on column DBF_KTDTOVG.dateload
  is 'DATELOAD';
create index DBF_KDTTOVG_GTD on DBF_KTDTOVG (G071, G072, G073, NZP);
create index DBF_KDTTOVG_LOAD_ID on DBF_KTDTOVG (LOAD_ID);
alter table DBF_KTDTOVG
  add constraint DBF_KTDTOVG_UQ unique (G071, G072, G073, NUM_PP, G32, G32G, NUMREC);

prompt
prompt Creating table DBF_NSI_BNKSEEK
prompt ==============================
prompt
create table DBF_NSI_BNKSEEK
(
  vkey    VARCHAR2(8),
  real    VARCHAR2(4),
  pzn     VARCHAR2(2),
  uer     VARCHAR2(1),
  rgn     VARCHAR2(2),
  ind     VARCHAR2(6),
  tnp     VARCHAR2(1),
  nnp     VARCHAR2(25),
  adr     VARCHAR2(30),
  rkc     VARCHAR2(9),
  namep   VARCHAR2(45),
  namen   VARCHAR2(30),
  newnum  VARCHAR2(9),
  newks   VARCHAR2(9),
  permfo  VARCHAR2(6),
  srok    VARCHAR2(2),
  at1     VARCHAR2(7),
  at2     VARCHAR2(7),
  telef   VARCHAR2(25),
  regn    VARCHAR2(9),
  okpo    VARCHAR2(8),
  dt_izm  DATE,
  cks     VARCHAR2(6),
  ksnp    VARCHAR2(20),
  date_in DATE,
  date_ch DATE,
  vkeydel VARCHAR2(8)
)
;
comment on table DBF_NSI_BNKSEEK
  is '������� DBF_NSI_BNKSEEK';
comment on column DBF_NSI_BNKSEEK.vkey
  is '���������� ���������� ���';
comment on column DBF_NSI_BNKSEEK.real
  is '��� �������� ������������ ���������� ��������� ��������';
comment on column DBF_NSI_BNKSEEK.pzn
  is '��� ���� ��������� ��������';
comment on column DBF_NSI_BNKSEEK.uer
  is '��� ���� ��������� (������������) ������� ����������� ��������';
comment on column DBF_NSI_BNKSEEK.rgn
  is '��� ���������� ���������� ���������';
comment on column DBF_NSI_BNKSEEK.ind
  is '������';
comment on column DBF_NSI_BNKSEEK.tnp
  is '��� ���� ����������� ������';
comment on column DBF_NSI_BNKSEEK.nnp
  is '���������� �����';
comment on column DBF_NSI_BNKSEEK.adr
  is '�����';
comment on column DBF_NSI_BNKSEEK.rkc
  is '��� ��� (����)';
comment on column DBF_NSI_BNKSEEK.namep
  is '������������ ��������� ��������';
comment on column DBF_NSI_BNKSEEK.namen
  is '������������ ��������� �������� ��� ������ � ���';
comment on column DBF_NSI_BNKSEEK.newnum
  is '���';
comment on column DBF_NSI_BNKSEEK.newks
  is '���� ���� (�������), ������. �� ���������� ����� ���� ������ ��������';
comment on column DBF_NSI_BNKSEEK.permfo
  is '����� ���';
comment on column DBF_NSI_BNKSEEK.srok
  is '���� ����������� ����������';
comment on column DBF_NSI_BNKSEEK.at1
  is '����������� �������� 1';
comment on column DBF_NSI_BNKSEEK.at2
  is '����������� �������� 2';
comment on column DBF_NSI_BNKSEEK.telef
  is '�������';
comment on column DBF_NSI_BNKSEEK.regn
  is '��������������� �����';
comment on column DBF_NSI_BNKSEEK.okpo
  is '��� ����';
comment on column DBF_NSI_BNKSEEK.dt_izm
  is '���� ���������� ��������� ������';
comment on column DBF_NSI_BNKSEEK.cks
  is '����� ��������� ���������������� ���������';
comment on column DBF_NSI_BNKSEEK.ksnp
  is '����� �����';
comment on column DBF_NSI_BNKSEEK.date_in
  is '���� ��������� ���������� �� ��������� �������� � ���';
comment on column DBF_NSI_BNKSEEK.date_ch
  is '���� ��������';
comment on column DBF_NSI_BNKSEEK.vkeydel
  is '���������� ���������� ��� ���������';

prompt
prompt Creating table DBF_NSI_KBK
prompt ==========================
prompt
create table DBF_NSI_KBK
(
  kbk        VARCHAR2(20) not null,
  pay_code   VARCHAR2(6) not null,
  name       VARCHAR2(250) not null,
  begin_date DATE not null,
  end_date   DATE,
  b_doc_num  VARCHAR2(30) not null,
  b_doc_date DATE not null,
  e_doc_num  VARCHAR2(30),
  e_doc_date DATE,
  advance    VARCHAR2(1)
)
;
comment on table DBF_NSI_KBK
  is '�������� ������� ��� �������� ����������� ���: ���';
comment on column DBF_NSI_KBK.kbk
  is '���';
comment on column DBF_NSI_KBK.pay_code
  is '��� ���� �������';
comment on column DBF_NSI_KBK.name
  is '������������';
comment on column DBF_NSI_KBK.begin_date
  is '���� ������ ��������';
comment on column DBF_NSI_KBK.end_date
  is '���� ��������� ��������';
comment on column DBF_NSI_KBK.b_doc_num
  is '����� ��������� ������ ��������';
comment on column DBF_NSI_KBK.b_doc_date
  is '���� ��������� ������ ��������';
comment on column DBF_NSI_KBK.e_doc_num
  is '����� ��������� ��������� ��������';
comment on column DBF_NSI_KBK.e_doc_date
  is '���� ��������� ��������� ��������';
comment on column DBF_NSI_KBK.advance
  is '������� ���������� ���
Y - ��� ����� ������������ ��� ���������
N - � ��������� ������';
alter table DBF_NSI_KBK
  add constraint FDC#PK#DBF_NSI_KBK primary key (KBK, PAY_CODE, BEGIN_DATE);

prompt
prompt Creating table DBF_NSI_KL_STAV
prompt ==============================
prompt
create table DBF_NSI_KL_STAV
(
  stav    NUMBER(7,4),
  datbeg  DATE,
  datend  DATE,
  datemod DATE
)
;
comment on table DBF_NSI_KL_STAV
  is '������� DBF_NSI_KL_STAV';
comment on column DBF_NSI_KL_STAV.stav
  is 'STAV';
comment on column DBF_NSI_KL_STAV.datbeg
  is 'DATBEG';
comment on column DBF_NSI_KL_STAV.datend
  is 'DATEND';
comment on column DBF_NSI_KL_STAV.datemod
  is 'DATEMOD';

prompt
prompt Creating table DBF_NSI_KTAM
prompt ===========================
prompt
create table DBF_NSI_KTAM
(
  code      VARCHAR2(8),
  dbegin    DATE,
  nprcreate VARCHAR2(40),
  dprcreate DATE,
  atrchange VARCHAR2(1),
  dend      DATE,
  dendcust  DATE,
  nprend    VARCHAR2(40),
  dprend    DATE,
  newcode   VARCHAR2(8),
  kodt      VARCHAR2(5),
  ttt       VARCHAR2(3),
  owner     VARCHAR2(5),
  kodzon    VARCHAR2(5),
  kodtn     VARCHAR2(5),
  datas     DATE,
  oldcode   VARCHAR2(8),
  soato     VARCHAR2(30),
  okpo      VARCHAR2(10),
  inn       VARCHAR2(12),
  kpp       VARCHAR2(9),
  namt      VARCHAR2(50),
  name_all  VARCHAR2(255),
  pstindex  VARCHAR2(6),
  okato     VARCHAR2(5),
  gorod     VARCHAR2(30),
  adrtam    VARCHAR2(255),
  prosf     VARCHAR2(2),
  sign      VARCHAR2(10),
  telefon   VARCHAR2(20),
  fax       VARCHAR2(20),
  teleks    VARCHAR2(20),
  email     VARCHAR2(50),
  rpsi      VARCHAR2(8),
  sovam     VARCHAR2(8),
  rsovam    VARCHAR2(8),
  adr_okdt  VARCHAR2(100),
  ruk_okdt  VARCHAR2(50),
  tel_okdt  VARCHAR2(20),
  fax_okdt  VARCHAR2(20),
  tx_okdt   VARCHAR2(20),
  adr_dost  VARCHAR2(100),
  tel_dost  VARCHAR2(20),
  fax_dost  VARCHAR2(20),
  tx_dost   VARCHAR2(20),
  reg_dost  VARCHAR2(150),
  trn_dost  VARCHAR2(25),
  ogrn      VARCHAR2(15),
  strana2   VARCHAR2(2),
  ustp      VARCHAR2(64),
  tzone     NUMBER(2)
)
;
comment on table DBF_NSI_KTAM
  is '������� DBF_NSI_KTAM';
comment on column DBF_NSI_KTAM.code
  is 'CODE';
comment on column DBF_NSI_KTAM.dbegin
  is 'DBEGIN';
comment on column DBF_NSI_KTAM.nprcreate
  is 'NPRCREATE';
comment on column DBF_NSI_KTAM.dprcreate
  is 'DPRCREATE';
comment on column DBF_NSI_KTAM.atrchange
  is 'ATRCHANGE';
comment on column DBF_NSI_KTAM.dend
  is 'DEND';
comment on column DBF_NSI_KTAM.dendcust
  is 'DENDCUST';
comment on column DBF_NSI_KTAM.nprend
  is 'NPREND';
comment on column DBF_NSI_KTAM.dprend
  is 'DPREND';
comment on column DBF_NSI_KTAM.newcode
  is 'NEWCODE';
comment on column DBF_NSI_KTAM.kodt
  is 'KODT';
comment on column DBF_NSI_KTAM.ttt
  is 'TTT';
comment on column DBF_NSI_KTAM.owner
  is 'OWNER';
comment on column DBF_NSI_KTAM.kodzon
  is 'KODZON';
comment on column DBF_NSI_KTAM.kodtn
  is 'KODTN';
comment on column DBF_NSI_KTAM.datas
  is 'DATAS';
comment on column DBF_NSI_KTAM.oldcode
  is 'OLDCODE';
comment on column DBF_NSI_KTAM.soato
  is 'SOATO';
comment on column DBF_NSI_KTAM.okpo
  is 'OKPO';
comment on column DBF_NSI_KTAM.inn
  is 'INN';
comment on column DBF_NSI_KTAM.kpp
  is 'KPP';
comment on column DBF_NSI_KTAM.namt
  is 'NAMT';
comment on column DBF_NSI_KTAM.name_all
  is 'NAME_ALL';
comment on column DBF_NSI_KTAM.pstindex
  is 'PSTINDEX';
comment on column DBF_NSI_KTAM.okato
  is 'OKATO';
comment on column DBF_NSI_KTAM.gorod
  is 'GOROD';
comment on column DBF_NSI_KTAM.adrtam
  is 'ADRTAM';
comment on column DBF_NSI_KTAM.prosf
  is 'PROSF';
comment on column DBF_NSI_KTAM.sign
  is 'SIGN';
comment on column DBF_NSI_KTAM.telefon
  is 'TELEFON';
comment on column DBF_NSI_KTAM.fax
  is 'FAX';
comment on column DBF_NSI_KTAM.teleks
  is 'TELEKS';
comment on column DBF_NSI_KTAM.email
  is 'EMAIL';
comment on column DBF_NSI_KTAM.rpsi
  is 'RPSI';
comment on column DBF_NSI_KTAM.sovam
  is 'SOVAM';
comment on column DBF_NSI_KTAM.rsovam
  is 'RSOVAM';
comment on column DBF_NSI_KTAM.adr_okdt
  is 'ADR_OKDT';
comment on column DBF_NSI_KTAM.ruk_okdt
  is 'RUK_OKDT';
comment on column DBF_NSI_KTAM.tel_okdt
  is 'TEL_OKDT';
comment on column DBF_NSI_KTAM.fax_okdt
  is 'FAX_OKDT';
comment on column DBF_NSI_KTAM.tx_okdt
  is 'TX_OKDT';
comment on column DBF_NSI_KTAM.adr_dost
  is 'ADR_DOST';
comment on column DBF_NSI_KTAM.tel_dost
  is 'TEL_DOST';
comment on column DBF_NSI_KTAM.fax_dost
  is 'FAX_DOST';
comment on column DBF_NSI_KTAM.tx_dost
  is 'TX_DOST';
comment on column DBF_NSI_KTAM.reg_dost
  is 'REG_DOST';
comment on column DBF_NSI_KTAM.trn_dost
  is 'TRN_DOST';
comment on column DBF_NSI_KTAM.ogrn
  is 'OGRN';
comment on column DBF_NSI_KTAM.strana2
  is '��� ������ (�����-2)';
comment on column DBF_NSI_KTAM.ustp
  is '����� ����';
comment on column DBF_NSI_KTAM.tzone
  is '������� �� ������� � ���';

prompt
prompt Creating table DBF_NSI_NS_DUL
prompt =============================
prompt
create table DBF_NSI_NS_DUL
(
  kod      VARCHAR2(2),
  name     VARCHAR2(75),
  abbrev   VARCHAR2(6),
  series   VARCHAR2(11),
  number1  VARCHAR2(25),
  comment1 VARCHAR2(120)
)
;
comment on table DBF_NSI_NS_DUL
  is '������� DBF_NSI_NS_DUL';
comment on column DBF_NSI_NS_DUL.kod
  is 'KOD';
comment on column DBF_NSI_NS_DUL.name
  is 'NAME';
comment on column DBF_NSI_NS_DUL.abbrev
  is 'ABBREV';
comment on column DBF_NSI_NS_DUL.series
  is 'SERIES';
comment on column DBF_NSI_NS_DUL.number1
  is 'NUMBER1';
comment on column DBF_NSI_NS_DUL.comment1
  is 'COMMENT1';

prompt
prompt Creating table DBF_NSI_OKSMT
prompt ============================
prompt
create table DBF_NSI_OKSMT
(
  kod       VARCHAR2(3),
  abc2      VARCHAR2(2),
  abc3      VARCHAR2(3),
  anaim     VARCHAR2(40),
  krname    VARCHAR2(35),
  naim      VARCHAR2(62),
  pr_str    NUMBER(1),
  pr_lic    NUMBER(1),
  pr_regio  VARCHAR2(2),
  kod_ar    VARCHAR2(14),
  reserv    VARCHAR2(10),
  date_mod  DATE,
  date_nil  DATE,
  ata       VARCHAR2(1),
  tpp       VARCHAR2(90),
  b1        VARCHAR2(1),
  b2        VARCHAR2(1),
  b3        VARCHAR2(1),
  b5        VARCHAR2(1),
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_NSI_OKSMT
  is '������� DBF_NSI_OKSMT';
comment on column DBF_NSI_OKSMT.kod
  is 'KOD';
comment on column DBF_NSI_OKSMT.abc2
  is 'ABC2';
comment on column DBF_NSI_OKSMT.abc3
  is 'ABC3';
comment on column DBF_NSI_OKSMT.anaim
  is 'ANAIM';
comment on column DBF_NSI_OKSMT.krname
  is 'KRNAME';
comment on column DBF_NSI_OKSMT.naim
  is 'NAIM';
comment on column DBF_NSI_OKSMT.pr_str
  is 'PR_STR';
comment on column DBF_NSI_OKSMT.pr_lic
  is 'PR_LIC';
comment on column DBF_NSI_OKSMT.pr_regio
  is 'PR_REGIO';
comment on column DBF_NSI_OKSMT.kod_ar
  is 'KOD_AR';
comment on column DBF_NSI_OKSMT.reserv
  is 'RESERV';
comment on column DBF_NSI_OKSMT.date_mod
  is 'DATE_MOD';
comment on column DBF_NSI_OKSMT.date_nil
  is 'DATE_NIL';
comment on column DBF_NSI_OKSMT.ata
  is 'ATA';
comment on column DBF_NSI_OKSMT.tpp
  is 'TPP';
comment on column DBF_NSI_OKSMT.b1
  is 'B1';
comment on column DBF_NSI_OKSMT.b2
  is 'B2';
comment on column DBF_NSI_OKSMT.b3
  is 'B3';
comment on column DBF_NSI_OKSMT.b5
  is 'B5';
comment on column DBF_NSI_OKSMT.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_NSI_OKSMT.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_NSI_OKSMT.numenddoc
  is 'NUMENDDOC';
comment on column DBF_NSI_OKSMT.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_NSI_PRCB
prompt ===========================
prompt
create table DBF_NSI_PRCB
(
  name   VARCHAR2(10),
  prcb   NUMBER(7,3),
  kodval VARCHAR2(3),
  ddat   DATE
)
;
comment on table DBF_NSI_PRCB
  is '������� DBF_NSI_PRCB';
comment on column DBF_NSI_PRCB.name
  is 'NAME';
comment on column DBF_NSI_PRCB.prcb
  is 'PRCB';
comment on column DBF_NSI_PRCB.kodval
  is 'KODVAL';
comment on column DBF_NSI_PRCB.ddat
  is 'DDAT';

prompt
prompt Creating table DBF_NSI_REG_S
prompt ============================
prompt
create table DBF_NSI_REG_S
(
  norm3 VARCHAR2(10),
  okpob VARCHAR2(10),
  schet VARCHAR2(20),
  tsh   VARCHAR2(2),
  ksh   VARCHAR2(20),
  inn   VARCHAR2(12)
)
;
comment on table DBF_NSI_REG_S
  is '������� DBF_NSI_REG_S';
comment on column DBF_NSI_REG_S.norm3
  is 'NORM3';
comment on column DBF_NSI_REG_S.okpob
  is 'OKPOB';
comment on column DBF_NSI_REG_S.schet
  is 'SCHET';
comment on column DBF_NSI_REG_S.tsh
  is 'TSH';
comment on column DBF_NSI_REG_S.ksh
  is 'KSH';
comment on column DBF_NSI_REG_S.inn
  is 'INN';

prompt
prompt Creating table DBF_NSI_REG_TI
prompt =============================
prompt
create table DBF_NSI_REG_TI
(
  adress   VARCHAR2(150),
  telefon  VARCHAR2(12),
  telegraf VARCHAR2(50),
  telefax  VARCHAR2(12),
  telex    VARCHAR2(20),
  zayv     VARCHAR2(80),
  nomr1    VARCHAR2(2),
  nomr2    VARCHAR2(4),
  nomr3    VARCHAR2(10),
  psu      VARCHAR2(1),
  okato    VARCHAR2(11),
  okpobr   VARCHAR2(10),
  schet1   VARCHAR2(20),
  korschr  VARCHAR2(20),
  okpobv   VARCHAR2(10),
  schet2   VARCHAR2(20),
  korschv  VARCHAR2(20),
  kodtam   VARCHAR2(8),
  datr     DATE,
  ogrn     VARCHAR2(15),
  inn      VARCHAR2(12),
  kpp      VARCHAR2(9),
  datn     DATE,
  datm     DATE,
  post9    VARCHAR2(9),
  alfa2    VARCHAR2(2)
)
;
comment on table DBF_NSI_REG_TI
  is '������� DBF_NSI_REG_TI';
comment on column DBF_NSI_REG_TI.adress
  is 'ADRESS';
comment on column DBF_NSI_REG_TI.telefon
  is 'TELEFON';
comment on column DBF_NSI_REG_TI.telegraf
  is 'TELEGRAF';
comment on column DBF_NSI_REG_TI.telefax
  is 'TELEFAX';
comment on column DBF_NSI_REG_TI.telex
  is 'TELEX';
comment on column DBF_NSI_REG_TI.zayv
  is 'ZAYV';
comment on column DBF_NSI_REG_TI.nomr1
  is 'NOMR1';
comment on column DBF_NSI_REG_TI.nomr2
  is 'NOMR2';
comment on column DBF_NSI_REG_TI.nomr3
  is 'NOMR3';
comment on column DBF_NSI_REG_TI.psu
  is 'PSU';
comment on column DBF_NSI_REG_TI.okato
  is 'OKATO';
comment on column DBF_NSI_REG_TI.okpobr
  is 'OKPOBR';
comment on column DBF_NSI_REG_TI.schet1
  is 'SCHET1';
comment on column DBF_NSI_REG_TI.korschr
  is 'KORSCHR';
comment on column DBF_NSI_REG_TI.okpobv
  is 'OKPOBV';
comment on column DBF_NSI_REG_TI.schet2
  is 'SCHET2';
comment on column DBF_NSI_REG_TI.korschv
  is 'KORSCHV';
comment on column DBF_NSI_REG_TI.kodtam
  is 'KODTAM';
comment on column DBF_NSI_REG_TI.datr
  is 'DATR';
comment on column DBF_NSI_REG_TI.ogrn
  is 'OGRN';
comment on column DBF_NSI_REG_TI.inn
  is 'INN';
comment on column DBF_NSI_REG_TI.kpp
  is 'KPP';
comment on column DBF_NSI_REG_TI.datn
  is 'DATN';
comment on column DBF_NSI_REG_TI.datm
  is 'DATM';
comment on column DBF_NSI_REG_TI.post9
  is 'POST9';
comment on column DBF_NSI_REG_TI.alfa2
  is 'ALFA2';

prompt
prompt Creating table DBF_NSI_RESHEN
prompt =============================
prompt
create table DBF_NSI_RESHEN
(
  kod   VARCHAR2(2),
  naim  VARCHAR2(250),
  info1 VARCHAR2(250),
  info2 VARCHAR2(250)
)
;
comment on table DBF_NSI_RESHEN
  is '������� DBF_NSI_RESHEN';
comment on column DBF_NSI_RESHEN.kod
  is 'KOD';
comment on column DBF_NSI_RESHEN.naim
  is 'NAIM';
comment on column DBF_NSI_RESHEN.info1
  is 'INFO1';
comment on column DBF_NSI_RESHEN.info2
  is 'INFO2';

prompt
prompt Creating table DBF_NSI_SUD
prompt ==========================
prompt
create table DBF_NSI_SUD
(
  kodpost   NUMBER,
  info      VARCHAR2(254),
  kod       VARCHAR2(3),
  naim      VARCHAR2(250),
  tip       VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_NSI_SUD
  is '�������� ������� ��� �������� ����������� "������� ��������� ��������� �������� �������� (�������) ���������� ������� ��������������"';
comment on column DBF_NSI_SUD.kodpost
  is '��� �������� �����������';
comment on column DBF_NSI_SUD.info
  is '�������� �����������';
comment on column DBF_NSI_SUD.kod
  is 'KOD';
comment on column DBF_NSI_SUD.naim
  is 'NAIM';
comment on column DBF_NSI_SUD.tip
  is 'TIP';
comment on column DBF_NSI_SUD.datbeg
  is 'DATBEG';
comment on column DBF_NSI_SUD.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_NSI_SUD.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_NSI_SUD.datend
  is 'DATEND';
comment on column DBF_NSI_SUD.numenddoc
  is 'NUMENDDOC';
comment on column DBF_NSI_SUD.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_NSI_TAMPLAT
prompt ==============================
prompt
create table DBF_NSI_TAMPLAT
(
  shifr     VARCHAR2(4),
  pr_plat   VARCHAR2(1),
  naim      VARCHAR2(1000),
  bankrec   VARCHAR2(70),
  grp_id    VARCHAR2(3),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE,
  pr_rb     NUMBER(1),
  pr_rk     NUMBER(1),
  pr_rf     NUMBER(1),
  razdel_1  VARCHAR2(10)
)
;
comment on table DBF_NSI_TAMPLAT
  is '������� DBF_NSI_TAMPLAT';
comment on column DBF_NSI_TAMPLAT.shifr
  is 'SHIFR';
comment on column DBF_NSI_TAMPLAT.pr_plat
  is 'PR_PLAT';
comment on column DBF_NSI_TAMPLAT.naim
  is 'NAIM';
comment on column DBF_NSI_TAMPLAT.bankrec
  is 'BANKREC';
comment on column DBF_NSI_TAMPLAT.grp_id
  is 'GRP_ID';
comment on column DBF_NSI_TAMPLAT.datbeg
  is 'DATBEG';
comment on column DBF_NSI_TAMPLAT.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_NSI_TAMPLAT.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_NSI_TAMPLAT.datend
  is 'DATEND';
comment on column DBF_NSI_TAMPLAT.numenddoc
  is 'NUMENDDOC';
comment on column DBF_NSI_TAMPLAT.datenddoc
  is 'DATENDDOC';
comment on column DBF_NSI_TAMPLAT.pr_rb
  is 'PR_RB';
comment on column DBF_NSI_TAMPLAT.pr_rk
  is 'PR_RK';
comment on column DBF_NSI_TAMPLAT.pr_rf
  is 'PR_RF';
comment on column DBF_NSI_TAMPLAT.razdel_1
  is 'RAZDEL_1';

prompt
prompt Creating table DBF_NSI_TBROK
prompt ============================
prompt
create table DBF_NSI_TBROK
(
  typ_doc   VARCHAR2(1),
  bktlic    VARCHAR2(25),
  bnpplic   FLOAT,
  bdbegin   DATE,
  prz_prim  VARCHAR2(1),
  bdend     DATE,
  brokname  VARCHAR2(255),
  brokmail  VARCHAR2(255),
  brokokpo  VARCHAR2(10),
  ogrn      VARCHAR2(15),
  brokinn   VARCHAR2(20),
  brokkpp   VARCHAR2(9),
  bskoltoi  FLOAT,
  bskoltoii FLOAT,
  dmodify   DATE,
  st        VARCHAR2(2),
  adrown    VARCHAR2(255)
)
;
comment on table DBF_NSI_TBROK
  is '������� DBF_NSI_TBROK';
comment on column DBF_NSI_TBROK.typ_doc
  is 'TYP_DOC';
comment on column DBF_NSI_TBROK.bktlic
  is 'BKTLIC';
comment on column DBF_NSI_TBROK.bnpplic
  is 'BNPPLIC';
comment on column DBF_NSI_TBROK.bdbegin
  is 'BDBEGIN';
comment on column DBF_NSI_TBROK.prz_prim
  is 'PRZ_PRIM';
comment on column DBF_NSI_TBROK.bdend
  is 'BDEND';
comment on column DBF_NSI_TBROK.brokname
  is 'BROKNAME';
comment on column DBF_NSI_TBROK.brokmail
  is 'BROKMAIL';
comment on column DBF_NSI_TBROK.brokokpo
  is 'BROKOKPO';
comment on column DBF_NSI_TBROK.ogrn
  is 'OGRN';
comment on column DBF_NSI_TBROK.brokinn
  is 'BROKINN';
comment on column DBF_NSI_TBROK.brokkpp
  is 'BROKKPP';
comment on column DBF_NSI_TBROK.bskoltoi
  is 'BSKOLTOI';
comment on column DBF_NSI_TBROK.bskoltoii
  is 'BSKOLTOII';
comment on column DBF_NSI_TBROK.dmodify
  is 'DMODIFY';
comment on column DBF_NSI_TBROK.st
  is '��� ������ ��������� (�����-2)';
comment on column DBF_NSI_TBROK.adrown
  is '��������������� ����������� �������������';

prompt
prompt Creating table DBF_NSI_TYPE_CORRECTION
prompt ======================================
prompt
create table DBF_NSI_TYPE_CORRECTION
(
  kod       VARCHAR2(3),
  naim      VARCHAR2(180),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE,
  code2     VARCHAR2(3)
)
;
comment on table DBF_NSI_TYPE_CORRECTION
  is '������� DBF_NSI_TYPE_CORRECTION';
comment on column DBF_NSI_TYPE_CORRECTION.kod
  is 'KOD';
comment on column DBF_NSI_TYPE_CORRECTION.naim
  is 'NAIM';
comment on column DBF_NSI_TYPE_CORRECTION.datbeg
  is 'DATBEG';
comment on column DBF_NSI_TYPE_CORRECTION.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_NSI_TYPE_CORRECTION.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_NSI_TYPE_CORRECTION.datend
  is 'DATEND';
comment on column DBF_NSI_TYPE_CORRECTION.numenddoc
  is 'NUMENDDOC';
comment on column DBF_NSI_TYPE_CORRECTION.datenddoc
  is 'DATENDDOC';
comment on column DBF_NSI_TYPE_CORRECTION.code2
  is 'CODE2';

prompt
prompt Creating table DBF_NSI_VALNAME
prompt ==============================
prompt
create table DBF_NSI_VALNAME
(
  kod       VARCHAR2(3),
  buk       VARCHAR2(3),
  kod_old   VARCHAR2(3),
  krnaim    VARCHAR2(17),
  fnaim     VARCHAR2(110),
  pr_val    VARCHAR2(2),
  data      DATE,
  data1     DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_NSI_VALNAME
  is '������� DBF_NSI_VALNAME';
comment on column DBF_NSI_VALNAME.kod
  is 'KOD';
comment on column DBF_NSI_VALNAME.buk
  is 'BUK';
comment on column DBF_NSI_VALNAME.kod_old
  is 'KOD_OLD';
comment on column DBF_NSI_VALNAME.krnaim
  is 'KRNAIM';
comment on column DBF_NSI_VALNAME.fnaim
  is 'FNAIM';
comment on column DBF_NSI_VALNAME.pr_val
  is 'PR_VAL';
comment on column DBF_NSI_VALNAME.data
  is 'DATA';
comment on column DBF_NSI_VALNAME.data1
  is 'DATA1';
comment on column DBF_NSI_VALNAME.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_NSI_VALNAME.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_NSI_VALNAME.numenddoc
  is 'NUMENDDOC';
comment on column DBF_NSI_VALNAME.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_NSI_VALUTA
prompt =============================
prompt
create table DBF_NSI_VALUTA
(
  kod   VARCHAR2(3),
  kol   NUMBER(8),
  okurs NUMBER(11,4),
  kkurs NUMBER(11,4),
  data  DATE,
  buk   VARCHAR2(3)
)
;
comment on table DBF_NSI_VALUTA
  is '������� DBF_NSI_VALUTA';
comment on column DBF_NSI_VALUTA.kod
  is 'KOD';
comment on column DBF_NSI_VALUTA.kol
  is 'KOL';
comment on column DBF_NSI_VALUTA.okurs
  is 'OKURS';
comment on column DBF_NSI_VALUTA.kkurs
  is 'KKURS';
comment on column DBF_NSI_VALUTA.data
  is 'DATA';
comment on column DBF_NSI_VALUTA.buk
  is 'BUK';

prompt
prompt Creating table DBF_NSI_VAL_USE
prompt ==============================
prompt
create table DBF_NSI_VAL_USE
(
  kod VARCHAR2(3) not null
)
;
comment on table DBF_NSI_VAL_USE
  is '�������� ������� ��� �������� �����������: "������������ ������"';
comment on column DBF_NSI_VAL_USE.kod
  is '��� ������';

prompt
prompt Creating table DBF_OTVET
prompt ========================
prompt
create global temporary table DBF_OTVET
(
  g_ndok     VARCHAR2(26),
  key        VARCHAR2(3),
  kodval     VARCHAR2(3),
  p_ndok     VARCHAR2(19),
  n_ndok     VARCHAR2(23),
  n_ddok     DATE,
  summa      NUMBER(17,2),
  summa1     NUMBER(17,2),
  id_ndok    VARCHAR2(4),
  key_owner  VARCHAR2(4),
  n_post     VARCHAR2(8),
  kindvp     VARCHAR2(30),
  key_ex     VARCHAR2(40),
  load_id    VARCHAR2(64),
  k96        DATE,
  sp         VARCHAR2(2),
  kbk        VARCHAR2(20),
  advance    VARCHAR2(1),
  ntr        VARCHAR2(26),
  status     VARCHAR2(40),
  process_id VARCHAR2(36),
  v_reason   VARCHAR2(2),
  v_doc_num  VARCHAR2(15),
  v_doc_date DATE
)
on commit delete rows;
comment on table DBF_OTVET
  is '������� DBF_OTVET';
comment on column DBF_OTVET.g_ndok
  is '����� ���������, ���, ���/���';
comment on column DBF_OTVET.key
  is '����, ���������� �������� ��������� ����� ';
comment on column DBF_OTVET.kodval
  is '�������� ��� ������ ������� ';
comment on column DBF_OTVET.p_ndok
  is '����� ���������� ��������� ';
comment on column DBF_OTVET.n_ndok
  is '����� ���������, ������� ��� �������� � ����. ���-�� ';
comment on column DBF_OTVET.n_ddok
  is '���� ����� ��������� ';
comment on column DBF_OTVET.summa
  is '�����, ����� ������, ������� �� �������� ���� KEY ';
comment on column DBF_OTVET.summa1
  is '��������������� ';
comment on column DBF_OTVET.id_ndok
  is '��������������� ';
comment on column DBF_OTVET.key_owner
  is '������� ���� ��� ��� (�������� "OKPO" ��� "INN" ) ';
comment on column DBF_OTVET.n_post
  is '����� �����';
comment on column DBF_OTVET.kindvp
  is '��������������� ���� �������';
comment on column DBF_OTVET.key_ex
  is '�������������� ����� �� ������';
comment on column DBF_OTVET.load_id
  is '��. ��������';
comment on column DBF_OTVET.k96
  is '���� ����������� �������� �������';
comment on column DBF_OTVET.sp
  is '������ �������';
comment on column DBF_OTVET.kbk
  is '��� ��������� �������������';
comment on column DBF_OTVET.advance
  is '������� ���������� ���';
comment on column DBF_OTVET.ntr
  is '����� ��';
comment on column DBF_OTVET.status
  is '������ ��';
comment on column DBF_OTVET.process_id
  is '���������� ������������� ��������� ������������ �������������� (GUID)';
comment on column DBF_OTVET.v_reason
  is '���������� ��������� �������';
comment on column DBF_OTVET.v_doc_num
  is '���������� ������ ���������';
comment on column DBF_OTVET.v_doc_date
  is '���������� ���� ���������';

prompt
prompt Creating table DBF_REG_TI
prompt =========================
prompt
create table DBF_REG_TI
(
  adress   VARCHAR2(150),
  telefon  VARCHAR2(12),
  telegraf VARCHAR2(50),
  telefax  VARCHAR2(12),
  telex    VARCHAR2(20),
  zayv     VARCHAR2(80),
  nomr1    VARCHAR2(2),
  nomr2    VARCHAR2(4),
  nomr3    VARCHAR2(10),
  psu      VARCHAR2(1),
  okato    VARCHAR2(11),
  okpobr   VARCHAR2(10),
  schet1   VARCHAR2(20),
  korschr  VARCHAR2(20),
  okpobv   VARCHAR2(10),
  schet2   VARCHAR2(20),
  korschv  VARCHAR2(20),
  kodtam   VARCHAR2(8),
  datr     DATE,
  ogrn     VARCHAR2(15),
  inn      VARCHAR2(12),
  kpp      VARCHAR2(9),
  datn     DATE,
  datm     DATE
)
;
comment on table DBF_REG_TI
  is '������� DBF_REG_TI';
comment on column DBF_REG_TI.adress
  is 'ADRESS';
comment on column DBF_REG_TI.telefon
  is 'TELEFON';
comment on column DBF_REG_TI.telegraf
  is 'TELEGRAF';
comment on column DBF_REG_TI.telefax
  is 'TELEFAX';
comment on column DBF_REG_TI.telex
  is 'TELEX';
comment on column DBF_REG_TI.zayv
  is 'ZAYV';
comment on column DBF_REG_TI.nomr1
  is 'NOMR1';
comment on column DBF_REG_TI.nomr2
  is 'NOMR2';
comment on column DBF_REG_TI.nomr3
  is 'NOMR3';
comment on column DBF_REG_TI.psu
  is 'PSU';
comment on column DBF_REG_TI.okato
  is 'OKATO';
comment on column DBF_REG_TI.okpobr
  is 'OKPOBR';
comment on column DBF_REG_TI.schet1
  is 'SCHET1';
comment on column DBF_REG_TI.korschr
  is 'KORSCHR';
comment on column DBF_REG_TI.okpobv
  is 'OKPOBV';
comment on column DBF_REG_TI.schet2
  is 'SCHET2';
comment on column DBF_REG_TI.korschv
  is 'KORSCHV';
comment on column DBF_REG_TI.kodtam
  is 'KODTAM';
comment on column DBF_REG_TI.datr
  is 'DATR';
comment on column DBF_REG_TI.ogrn
  is 'OGRN';
comment on column DBF_REG_TI.inn
  is 'INN';
comment on column DBF_REG_TI.kpp
  is 'KPP';
comment on column DBF_REG_TI.datn
  is 'DATN';
comment on column DBF_REG_TI.datm
  is 'DATM';

prompt
prompt Creating table DBF_REZULTTO
prompt ===========================
prompt
create table DBF_REZULTTO
(
  code      VARCHAR2(2),
  name      VARCHAR2(250),
  datbeg    DATE,
  numbegdoc VARCHAR2(20),
  datbegdoc DATE,
  datend    DATE,
  numenddoc VARCHAR2(20),
  datenddoc DATE
)
;
comment on table DBF_REZULTTO
  is '������� DBF_REZULTTO';
comment on column DBF_REZULTTO.code
  is 'CODE';
comment on column DBF_REZULTTO.name
  is 'NAME';
comment on column DBF_REZULTTO.datbeg
  is 'DATBEG';
comment on column DBF_REZULTTO.numbegdoc
  is 'NUMBEGDOC';
comment on column DBF_REZULTTO.datbegdoc
  is 'DATBEGDOC';
comment on column DBF_REZULTTO.datend
  is 'DATEND';
comment on column DBF_REZULTTO.numenddoc
  is 'NUMENDDOC';
comment on column DBF_REZULTTO.datenddoc
  is 'DATENDDOC';

prompt
prompt Creating table DBF_SBJ
prompt ======================
prompt
create table DBF_SBJ
(
  sbj_id NUMBER(15),
  itn    VARCHAR2(13),
  inn    VARCHAR2(12),
  kpp    VARCHAR2(9),
  ogrn   VARCHAR2(15),
  sname  VARCHAR2(254)
)
;
comment on table DBF_SBJ
  is '������� DBF_SBJ';
comment on column DBF_SBJ.sbj_id
  is 'SBJ_ID';
comment on column DBF_SBJ.itn
  is 'ITN';
comment on column DBF_SBJ.inn
  is 'INN';
comment on column DBF_SBJ.kpp
  is 'KPP';
comment on column DBF_SBJ.ogrn
  is 'OGRN';
comment on column DBF_SBJ.sname
  is 'SNAME';

prompt
prompt Creating table DBF_TBROK
prompt ========================
prompt
create table DBF_TBROK
(
  typ_doc   VARCHAR2(1),
  bktlic    VARCHAR2(5),
  bnpplic   FLOAT,
  bdbegin   DATE,
  prz_prim  VARCHAR2(1),
  bdend     DATE,
  brokname  VARCHAR2(80),
  brokmail  VARCHAR2(80),
  brokokpo  VARCHAR2(10),
  ogrn      VARCHAR2(15),
  brokinn   VARCHAR2(12),
  brokkpp   VARCHAR2(9),
  bskoltoi  FLOAT,
  bskoltoii FLOAT,
  dmodify   DATE
)
;
comment on table DBF_TBROK
  is '������� DBF_TBROK';
comment on column DBF_TBROK.typ_doc
  is 'TYP_DOC';
comment on column DBF_TBROK.bktlic
  is 'BKTLIC';
comment on column DBF_TBROK.bnpplic
  is 'BNPPLIC';
comment on column DBF_TBROK.bdbegin
  is 'BDBEGIN';
comment on column DBF_TBROK.prz_prim
  is 'PRZ_PRIM';
comment on column DBF_TBROK.bdend
  is 'BDEND';
comment on column DBF_TBROK.brokname
  is 'BROKNAME';
comment on column DBF_TBROK.brokmail
  is 'BROKMAIL';
comment on column DBF_TBROK.brokokpo
  is 'BROKOKPO';
comment on column DBF_TBROK.ogrn
  is 'OGRN';
comment on column DBF_TBROK.brokinn
  is 'BROKINN';
comment on column DBF_TBROK.brokkpp
  is 'BROKKPP';
comment on column DBF_TBROK.bskoltoi
  is 'BSKOLTOI';
comment on column DBF_TBROK.bskoltoii
  is 'BSKOLTOII';
comment on column DBF_TBROK.dmodify
  is 'DMODIFY';

prompt
prompt Creating table DBF_TPO
prompt ======================
prompt
create table DBF_TPO
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
  blank_ver  VARCHAR2(1),
  genprov    VARCHAR2(1)
)
;
comment on table DBF_TPO
  is '������� DBF_TPO';
comment on column DBF_TPO.tpo_number
  is '������������ ����� ���';
comment on column DBF_TPO.order_type
  is '��� ������';
comment on column DBF_TPO.ext_list
  is '���������� ���������� ������';
comment on column DBF_TPO.cod_tam
  is '��� �������';
comment on column DBF_TPO.cod_tamp
  is '��� ����������� �����';
comment on column DBF_TPO.day_tpo
  is '����';
comment on column DBF_TPO.mon_tpo
  is '�����';
comment on column DBF_TPO.jar_tpo
  is '���';
comment on column DBF_TPO.num_mpo
  is '����� ���';
comment on column DBF_TPO.idpayer
  is '������������� ����������� (��� ��.��� ?';
comment on column DBF_TPO.kodval
  is '��� ������ �������';
comment on column DBF_TPO.tovcost_pl
  is '���������� ���������';
comment on column DBF_TPO.sum_rub
  is '����� ����� �� ��� � ���.';
comment on column DBF_TPO.fiotam
  is '������� �������������� �� ���������� ���';
comment on column DBF_TPO.fiokas
  is '������� �������';
comment on column DBF_TPO.curs_usd
  is '���� �������';
comment on column DBF_TPO.curs_eku
  is '���� ����';
comment on column DBF_TPO.regim
  is '��� ����������� ������ �� ���';
comment on column DBF_TPO.meth_move
  is '������ �����������';
comment on column DBF_TPO.curs_val
  is '���� ������ ������� � �����';
comment on column DBF_TPO.dat_curs
  is '���� ��������� ������ �����';
comment on column DBF_TPO.signprt
  is '������� ������';
comment on column DBF_TPO.annul
  is '������� ������������� ���';
comment on column DBF_TPO.datecheck
  is '���� �������� ���';
comment on column DBF_TPO.depozit
  is '������� "�����������" ���';
comment on column DBF_TPO.sign_pass
  is '������� �������� ���';
comment on column DBF_TPO.dop_inf1
  is '1-�� ������ ���. ����������';
comment on column DBF_TPO.dop_inf2
  is '2-�� ������ ���. ����������';
comment on column DBF_TPO.dop_inf3
  is '3-�� ������ ���. ����������';
comment on column DBF_TPO.pod1
  is '��� ���������� ��������� � ������';
comment on column DBF_TPO.pod2
  is '� ���������� ��������� � ������';
comment on column DBF_TPO.pod3
  is '���� ���������� ��������� � ������';
comment on column DBF_TPO.pod4
  is '��� ���������� ��������� � ������';
comment on column DBF_TPO.pod5
  is '�  ���������� ��������� � ������';
comment on column DBF_TPO.pod6
  is '���� ���������� ��������� � ������';
comment on column DBF_TPO.pod7
  is '�������������� ���������� ��� ����������';
comment on column DBF_TPO.pod8
  is '�������������� ���������� ��� ����������';
comment on column DBF_TPO.sign_pay
  is '������� ������ (1 ? ��������, 0 ? �� ���';
comment on column DBF_TPO.codcountry
  is '��� ������  ������������� ������';
comment on column DBF_TPO.oplval
  is '�������� � ������';
comment on column DBF_TPO.oplrub
  is '�������� � ������';
comment on column DBF_TPO.dateout
  is '���� �������� (� ����������� ����������';
comment on column DBF_TPO.dategnivz
  is '���� �������� (� �����)';
comment on column DBF_TPO.annul_tpo
  is '������������ ���';
comment on column DBF_TPO.dep_tpo
  is '����������  ?����������? ���';
comment on column DBF_TPO.vertpo
  is '������ ��� ?���-�?, � ������� ����������';
comment on column DBF_TPO.sprub
  is '������ ������� � ������';
comment on column DBF_TPO.spval
  is '������ ������� � ������';
comment on column DBF_TPO.datvypbank
  is '���� ������� �� �����';
comment on column DBF_TPO.nazntov
  is '���������� ������';
comment on column DBF_TPO.famurlic
  is '������� ����������� ����, ���������� ��';
comment on column DBF_TPO.dat_annul
  is '���� ������������� ���';
comment on column DBF_TPO.sign_corr
  is '������� ������������� ���
 ?1? - ������';
comment on column DBF_TPO.schet
  is '���������';
comment on column DBF_TPO.signvar
  is '��������� ��������';
comment on column DBF_TPO.code
  is '��� ����������� ������ (8-�������), ����';
comment on column DBF_TPO.pr_privil
  is '������� ������
1-����������� � �� �� ���';
comment on column DBF_TPO.tovcost_al
  is '������ ��������� ������ � �������� ���';
comment on column DBF_TPO.weight_al
  is '������ ��� ������';
comment on column DBF_TPO.numpts
  is 'NUMPTS';
comment on column DBF_TPO.load_id
  is 'LOAD_ID';
comment on column DBF_TPO.id
  is 'ID';
comment on column DBF_TPO.pod9
  is '��� ���������� ���������';
comment on column DBF_TPO.pod10
  is '� ���������� ���������';
comment on column DBF_TPO.pod11
  is '���� ���������� ���������';
comment on column DBF_TPO.pod12
  is '��� ���������� ���������';
comment on column DBF_TPO.pod13
  is '�  ���������� ���������';
comment on column DBF_TPO.pod14
  is '���� ���������� ���������';
comment on column DBF_TPO.sp3
  is '������ �������';
comment on column DBF_TPO.opl3
  is '��������';
comment on column DBF_TPO.sp4
  is '������ �������';
comment on column DBF_TPO.opl4
  is '��������';
comment on column DBF_TPO.kodval3
  is '��� ������ �������';
comment on column DBF_TPO.curs_val3
  is '���� ������ ������� � �����';
comment on column DBF_TPO.dat_curs3
  is '���� ��������� ������ �����';
comment on column DBF_TPO.kodval4
  is '��� ������ �������';
comment on column DBF_TPO.curs_val4
  is '���� ������ ������� � �����';
comment on column DBF_TPO.dat_curs4
  is '���� ��������� ������ �����';
comment on column DBF_TPO.idpayer2
  is '������������� �������� ���� (��� ��.���';
comment on column DBF_TPO.typ_payer2
  is '��� �������� ���� (���������� ����������';
comment on column DBF_TPO.reg_cntr
  is '��� ������, ���������� ���������� ������';
comment on column DBF_TPO.reg_tdoc
  is '��� ��������� (��, ���)';
comment on column DBF_TPO.reg_num
  is '���������� ����� ��������� ������, �����';
comment on column DBF_TPO.reg_ddoc
  is '���� ���������� ���������� ��� ���';
comment on column DBF_TPO.reg_cdec
  is '������� �������������� ����� ��������� �';
comment on column DBF_TPO.vid_trans
  is '��� ���� ����������, ������������� ��� ����������� ������';
comment on column DBF_TPO.blank_ver
  is '������ ������';
comment on column DBF_TPO.genprov
  is '������� ������������ �����������';
create index DBF_TPO_LOAD_ID on DBF_TPO (LOAD_ID);
create index IDX_DBF_TPO_IDPAYER on DBF_TPO (IDPAYER);
create index IDX_DBF_TPO_IDPAYER2 on DBF_TPO (IDPAYER2);
alter table DBF_TPO
  add constraint DBF_TOP_PK primary key (TPO_NUMBER);

prompt
prompt Creating table DBF_TPO_AUD
prompt ==========================
prompt
create table DBF_TPO_AUD
(
  num_tpo  VARCHAR2(10) not null,
  model    VARCHAR2(36),
  den      NUMBER(5),
  mes      NUMBER(5),
  god      NUMBER(5),
  srok     NUMBER(5),
  mest     NUMBER(5),
  obdvig   NUMBER,
  cod_nazn VARCHAR2(1),
  powerls  NUMBER,
  powerkw  NUMBER,
  vin      VARCHAR2(20),
  numdvig  VARCHAR2(40),
  shassi   VARCHAR2(40),
  kuzov    VARCHAR2(40),
  nomer    VARCHAR2(12),
  tipdv    VARCHAR2(2),
  tnved    VARCHAR2(10),
  tamstoim NUMBER,
  udvvoz   VARCHAR2(10),
  datud    DATE,
  tamu     VARCHAR2(8),
  numpts   VARCHAR2(11),
  datpts   DATE,
  tamp     VARCHAR2(8),
  codt_to  VARCHAR2(8),
  dat_to   DATE,
  num_dkd  VARCHAR2(7),
  codt_tn  VARCHAR2(8),
  pred_tpo VARCHAR2(26),
  reserv   VARCHAR2(10),
  kodmrk   VARCHAR2(3),
  kabina   VARCHAR2(40)
)
;
comment on table DBF_TPO_AUD
  is '������� DBF_TPO_AUD';
comment on column DBF_TPO_AUD.num_tpo
  is 'NUM_TPO';
comment on column DBF_TPO_AUD.model
  is 'MODEL';
comment on column DBF_TPO_AUD.den
  is 'DEN';
comment on column DBF_TPO_AUD.mes
  is 'MES';
comment on column DBF_TPO_AUD.god
  is 'GOD';
comment on column DBF_TPO_AUD.srok
  is 'SROK';
comment on column DBF_TPO_AUD.mest
  is 'MEST';
comment on column DBF_TPO_AUD.obdvig
  is 'OBDVIG';
comment on column DBF_TPO_AUD.cod_nazn
  is 'COD_NAZN';
comment on column DBF_TPO_AUD.powerls
  is 'POWERLS';
comment on column DBF_TPO_AUD.powerkw
  is 'POWERKW';
comment on column DBF_TPO_AUD.vin
  is 'VIN';
comment on column DBF_TPO_AUD.numdvig
  is 'NUMDVIG';
comment on column DBF_TPO_AUD.shassi
  is 'SHASSI';
comment on column DBF_TPO_AUD.kuzov
  is 'KUZOV';
comment on column DBF_TPO_AUD.nomer
  is 'NOMER';
comment on column DBF_TPO_AUD.tipdv
  is 'TIPDV';
comment on column DBF_TPO_AUD.tnved
  is 'TNVED';
comment on column DBF_TPO_AUD.tamstoim
  is 'TAMSTOIM';
comment on column DBF_TPO_AUD.udvvoz
  is 'UDVVOZ';
comment on column DBF_TPO_AUD.datud
  is 'DATUD';
comment on column DBF_TPO_AUD.tamu
  is 'TAMU';
comment on column DBF_TPO_AUD.numpts
  is 'NUMPTS';
comment on column DBF_TPO_AUD.datpts
  is 'DATPTS';
comment on column DBF_TPO_AUD.tamp
  is 'TAMP';
comment on column DBF_TPO_AUD.codt_to
  is 'CODT_TO';
comment on column DBF_TPO_AUD.dat_to
  is 'DAT_TO';
comment on column DBF_TPO_AUD.num_dkd
  is 'NUM_DKD';
comment on column DBF_TPO_AUD.codt_tn
  is 'CODT_TN';
comment on column DBF_TPO_AUD.pred_tpo
  is 'PRED_TPO';
comment on column DBF_TPO_AUD.reserv
  is 'RESERV';
comment on column DBF_TPO_AUD.kodmrk
  is 'KODMRK';
comment on column DBF_TPO_AUD.kabina
  is 'KABINA';
alter table DBF_TPO_AUD
  add constraint DBF_TPO_AUD_PK primary key (NUM_TPO);

prompt
prompt Creating table DBF_TPO_DOC
prompt ==========================
prompt
create table DBF_TPO_DOC
(
  num_tpo VARCHAR2(10) not null,
  nrow    NUMBER(5) not null,
  pdoc    VARCHAR2(50),
  cod_doc VARCHAR2(8)
)
;
comment on table DBF_TPO_DOC
  is '������� DBF_TPO_DOC';
comment on column DBF_TPO_DOC.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_DOC.nrow
  is '����� ������';
comment on column DBF_TPO_DOC.pdoc
  is '�������� ��������������� �����';
comment on column DBF_TPO_DOC.cod_doc
  is '��� ��������������� ���������';
alter table DBF_TPO_DOC
  add constraint DBF_TPO_DOC_PK primary key (NUM_TPO, NROW);

prompt
prompt Creating table DBF_TPO_DOP
prompt ==========================
prompt
create table DBF_TPO_DOP
(
  num_tpo   VARCHAR2(10) not null,
  num_dtpo  VARCHAR2(3) not null,
  tdop_inf1 VARCHAR2(72),
  tdop_inf2 VARCHAR2(72),
  tdop_inf3 VARCHAR2(72),
  tdop_inf4 VARCHAR2(72),
  stoim     NUMBER,
  plat      NUMBER,
  poshl     NUMBER,
  akciz     NUMBER,
  nds       NUMBER
)
;
comment on table DBF_TPO_DOP
  is '������� DBF_TPO_DOP';
comment on column DBF_TPO_DOP.num_tpo
  is 'NUM_TPO';
comment on column DBF_TPO_DOP.num_dtpo
  is '����� ����';
comment on column DBF_TPO_DOP.tdop_inf1
  is '1-�� ������ ���. ����������';
comment on column DBF_TPO_DOP.tdop_inf2
  is '2-�� ������ ���. ����������';
comment on column DBF_TPO_DOP.tdop_inf3
  is '3-�� ������ ���. ����������';
comment on column DBF_TPO_DOP.tdop_inf4
  is '4-�� ������ ���. ����������';
comment on column DBF_TPO_DOP.stoim
  is '���������� ��������� � ����';
comment on column DBF_TPO_DOP.plat
  is '������ ������ �� ����������';
comment on column DBF_TPO_DOP.poshl
  is '������� �� ����������� ����';
comment on column DBF_TPO_DOP.akciz
  is '����� �� ����������� �����';
comment on column DBF_TPO_DOP.nds
  is '��� �� ����������� �����';
alter table DBF_TPO_DOP
  add constraint DBF_TPO_DOP_PK primary key (NUM_TPO, NUM_DTPO);

prompt
prompt Creating table DBF_TPO_FIZLIC
prompt =============================
prompt
create table DBF_TPO_FIZLIC
(
  num_doc   VARCHAR2(10) not null,
  ser_doc   VARCHAR2(11),
  cod_doc   VARCHAR2(2) not null,
  familia   VARCHAR2(30),
  imya      VARCHAR2(25),
  otchestvo VARCHAR2(25),
  strana    VARCHAR2(3),
  soato     VARCHAR2(4),
  adres     VARCHAR2(120),
  give_doc  VARCHAR2(60),
  kogd_doc  DATE,
  inn       VARCHAR2(12),
  kod1      VARCHAR2(3),
  kod2      VARCHAR2(3),
  kod3      VARCHAR2(3),
  shablon   VARCHAR2(25),
  okpo      VARCHAR2(10),
  idpayer   VARCHAR2(30) not null,
  priznak   VARCHAR2(1)
)
;
comment on table DBF_TPO_FIZLIC
  is '������� DBF_TPO_FIZLIC';
comment on column DBF_TPO_FIZLIC.num_doc
  is '����� ���������, ����������';
comment on column DBF_TPO_FIZLIC.ser_doc
  is '����� ���������, ����������';
comment on column DBF_TPO_FIZLIC.cod_doc
  is '��� ���������, ������������';
comment on column DBF_TPO_FIZLIC.familia
  is '�������';
comment on column DBF_TPO_FIZLIC.imya
  is '���';
comment on column DBF_TPO_FIZLIC.otchestvo
  is '��������';
comment on column DBF_TPO_FIZLIC.strana
  is '��� ������ ����������';
comment on column DBF_TPO_FIZLIC.soato
  is '��� ������� (����������)';
comment on column DBF_TPO_FIZLIC.adres
  is '�����';
comment on column DBF_TPO_FIZLIC.give_doc
  is '��� ����� ��������, �������';
comment on column DBF_TPO_FIZLIC.kogd_doc
  is '���� ������ ���������, ����';
comment on column DBF_TPO_FIZLIC.inn
  is '���';
comment on column DBF_TPO_FIZLIC.kod1
  is '��� ������/������';
comment on column DBF_TPO_FIZLIC.kod2
  is '��� ��������� ������';
comment on column DBF_TPO_FIZLIC.kod3
  is '��� ���';
comment on column DBF_TPO_FIZLIC.shablon
  is '������ ����� ����� � ������';
comment on column DBF_TPO_FIZLIC.okpo
  is '��� ����';
comment on column DBF_TPO_FIZLIC.idpayer
  is 'IDPAYER';
comment on column DBF_TPO_FIZLIC.priznak
  is '������� �����������. ������';
alter table DBF_TPO_FIZLIC
  add constraint DBF_TPO_FIZLIC_PK unique (IDPAYER);

prompt
prompt Creating table DBF_TPO_GOODS
prompt ============================
prompt
create table DBF_TPO_GOODS
(
  num_tpo    VARCHAR2(10),
  num_dtpo   VARCHAR2(3),
  pos_dtpo   VARCHAR2(2),
  codtnved   VARCHAR2(10),
  naimenov   VARCHAR2(58),
  tovcost_us NUMBER,
  tovcost_pl NUMBER,
  weight     NUMBER,
  kolvo      NUMBER,
  codcountry VARCHAR2(3),
  edizm      VARCHAR2(3),
  sertif     NUMBER(5),
  pr_sbr     VARCHAR2(1),
  codmainpl  VARCHAR2(4),
  cod_plat   VARCHAR2(6),
  osnov_nach NUMBER,
  edosnov    VARCHAR2(15),
  stavka     NUMBER,
  edstav     NUMBER(5),
  prim_plt   NUMBER(1),
  sum_val    NUMBER,
  signperiod NUMBER(5),
  calcul     NUMBER(5),
  osnov_n1   NUMBER,
  osnov_n2   NUMBER,
  tovcost_al NUMBER,
  weight_al  NUMBER,
  servsign   VARCHAR2(1),
  costal_rur NUMBER
)
;
comment on table DBF_TPO_GOODS
  is '������� DBF_TPO_GOODS';
comment on column DBF_TPO_GOODS.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_GOODS.num_dtpo
  is '����� ����';
comment on column DBF_TPO_GOODS.pos_dtpo
  is '������� � ����';
comment on column DBF_TPO_GOODS.codtnved
  is '��� ������ �� �� ���';
comment on column DBF_TPO_GOODS.naimenov
  is '�������� ������';
comment on column DBF_TPO_GOODS.tovcost_us
  is '��������� � ��������';
comment on column DBF_TPO_GOODS.tovcost_pl
  is '���������� ���������';
comment on column DBF_TPO_GOODS.weight
  is '��� ������';
comment on column DBF_TPO_GOODS.kolvo
  is '���-�� ������';
comment on column DBF_TPO_GOODS.codcountry
  is '��� ������ ������������� (�����';
comment on column DBF_TPO_GOODS.edizm
  is '��� ������� ���������';
comment on column DBF_TPO_GOODS.sertif
  is '������� ������� �����������(1/0';
comment on column DBF_TPO_GOODS.pr_sbr
  is '������� ���������� ������';
comment on column DBF_TPO_GOODS.codmainpl
  is '��� ��������� �������';
comment on column DBF_TPO_GOODS.cod_plat
  is '��� �������';
comment on column DBF_TPO_GOODS.osnov_nach
  is '������ ���������� (NUM)';
comment on column DBF_TPO_GOODS.edosnov
  is '�������� ������ ����������';
comment on column DBF_TPO_GOODS.stavka
  is '������ (NUM)';
comment on column DBF_TPO_GOODS.edstav
  is '��� ������� ������';
comment on column DBF_TPO_GOODS.prim_plt
  is '������� ������� � �������� ����';
comment on column DBF_TPO_GOODS.sum_val
  is '����� ������� � ������';
comment on column DBF_TPO_GOODS.signperiod
  is '������� �������������� �������.';
comment on column DBF_TPO_GOODS.calcul
  is '����� �������';
comment on column DBF_TPO_GOODS.osnov_n1
  is '������ ������������ ������ ����';
comment on column DBF_TPO_GOODS.osnov_n2
  is '������ ������������ ������ ����';
comment on column DBF_TPO_GOODS.tovcost_al
  is '������ ��������� ������ � �����';
comment on column DBF_TPO_GOODS.weight_al
  is '������ ��� ������';
comment on column DBF_TPO_GOODS.servsign
  is '��������� �������, ������������';
comment on column DBF_TPO_GOODS.costal_rur
  is '����� ��������� ������ � ������';
create index DBF_TPO_GOODS_NUM_TPO on DBF_TPO_GOODS (NUM_TPO);
alter table DBF_TPO_GOODS
  add constraint DBF_TPO_GOODS_UQ unique (NUM_TPO, NUM_DTPO, POS_DTPO, PR_SBR, COD_PLAT);

prompt
prompt Creating table DBF_TPO_ITP
prompt ==========================
prompt
create table DBF_TPO_ITP
(
  num_tpo    VARCHAR2(10) not null,
  cod_mainpl VARCHAR2(4) not null,
  cod_plat   VARCHAR2(6),
  osn_natch  NUMBER,
  stavka     NUMBER,
  sum_rub    NUMBER,
  edstav     NUMBER(5),
  edosnov    VARCHAR2(15),
  sumpl1     VARCHAR2(22),
  sumpl2     VARCHAR2(22),
  pr_plt     NUMBER(5),
  pr_cod     VARCHAR2(4),
  calcul     NUMBER(5),
  reg_paid   NUMBER
)
;
comment on table DBF_TPO_ITP
  is '������� DBF_TPO_ITP';
comment on column DBF_TPO_ITP.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_ITP.cod_mainpl
  is '�������� ��� �������';
comment on column DBF_TPO_ITP.cod_plat
  is '��� �������';
comment on column DBF_TPO_ITP.osn_natch
  is '������ ���������� (NUM)';
comment on column DBF_TPO_ITP.stavka
  is '������ (NUM)';
comment on column DBF_TPO_ITP.sum_rub
  is '����� ������� � ������';
comment on column DBF_TPO_ITP.edstav
  is '��� ������� ������';
comment on column DBF_TPO_ITP.edosnov
  is '������� ������ ����������.';
comment on column DBF_TPO_ITP.sumpl1
  is '����� ������� (�  �������� ������';
comment on column DBF_TPO_ITP.sumpl2
  is '����� ������� (� ������, ���� ���';
comment on column DBF_TPO_ITP.pr_plt
  is '�������� ���� ����������';
comment on column DBF_TPO_ITP.pr_cod
  is '���������������';
comment on column DBF_TPO_ITP.calcul
  is '����� �������';
comment on column DBF_TPO_ITP.reg_paid
  is 'C���� ������� ���������� �������/';
create index DBF_TPO_ITP_NUM_TPO on DBF_TPO_ITP (NUM_TPO);

prompt
prompt Creating table DBF_TPO_OKPO
prompt ===========================
prompt
create table DBF_TPO_OKPO
(
  cod     VARCHAR2(10),
  name    VARCHAR2(80),
  inn     VARCHAR2(12) not null,
  strana  VARCHAR2(3),
  soato   VARCHAR2(4),
  adres   VARCHAR2(120),
  kodtam  VARCHAR2(5),
  kod1    VARCHAR2(3),
  kod2    VARCHAR2(3),
  kod3    VARCHAR2(3),
  idpayer VARCHAR2(34),
  priznak VARCHAR2(1),
  kpp     VARCHAR2(9)
)
;
comment on table DBF_TPO_OKPO
  is '������� DBF_TPO_OKPO';
comment on column DBF_TPO_OKPO.cod
  is '��� ����';
comment on column DBF_TPO_OKPO.name
  is '������������';
comment on column DBF_TPO_OKPO.inn
  is '���';
comment on column DBF_TPO_OKPO.strana
  is '��� ������ ������������';
comment on column DBF_TPO_OKPO.soato
  is '��� ������� (����������';
comment on column DBF_TPO_OKPO.adres
  is '�����';
comment on column DBF_TPO_OKPO.kodtam
  is '��� ������� � ���� ����';
comment on column DBF_TPO_OKPO.kod1
  is '��� ������/������';
comment on column DBF_TPO_OKPO.kod2
  is '��� ��������� ������';
comment on column DBF_TPO_OKPO.kod3
  is '��� ���';
comment on column DBF_TPO_OKPO.idpayer
  is 'IDPAYER';
comment on column DBF_TPO_OKPO.priznak
  is '������� �����������. ��';
comment on column DBF_TPO_OKPO.kpp
  is '���';
alter table DBF_TPO_OKPO
  add constraint DBF_TPO_OKPO_UK_001 unique (IDPAYER);

prompt
prompt Creating table DBF_TPO_PLT
prompt ==========================
prompt
create table DBF_TPO_PLT
(
  num_tpo  VARCHAR2(10),
  sp       VARCHAR2(2),
  inn      VARCHAR2(12),
  kpp      VARCHAR2(9),
  num_doc  VARCHAR2(50),
  date_doc DATE,
  summa    NUMBER,
  kodval   VARCHAR2(3),
  sum_tpo  NUMBER,
  vidnac   VARCHAR2(4),
  schr     VARCHAR2(20),
  bic      VARCHAR2(9),
  kpph     VARCHAR2(9),
  id       INTEGER,
  name     VARCHAR2(80),
  kbk      VARCHAR2(20),
  ntr      VARCHAR2(26)
)
;
comment on table DBF_TPO_PLT
  is '������� DBF_TPO_PLT';
comment on column DBF_TPO_PLT.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_PLT.sp
  is '������ ������� (�� TPO.DBF)';
comment on column DBF_TPO_PLT.inn
  is '��� �����������';
comment on column DBF_TPO_PLT.kpp
  is '���������������';
comment on column DBF_TPO_PLT.num_doc
  is '����� ���������� ��������� (�� T';
comment on column DBF_TPO_PLT.date_doc
  is '���� ���������� ���������';
comment on column DBF_TPO_PLT.summa
  is '����� ����� ���������';
comment on column DBF_TPO_PLT.kodval
  is '��� ������';
comment on column DBF_TPO_PLT.sum_tpo
  is '����� ��������';
comment on column DBF_TPO_PLT.vidnac
  is '��� ���� �������, ��������������';
comment on column DBF_TPO_PLT.schr
  is '��������� ���� �����������';
comment on column DBF_TPO_PLT.bic
  is '��� �����';
comment on column DBF_TPO_PLT.kpph
  is '��� ���������';
comment on column DBF_TPO_PLT.id
  is 'ID';
comment on column DBF_TPO_PLT.name
  is 'NAME';
comment on column DBF_TPO_PLT.kbk
  is '��� ��������� ������������� ����';
comment on column DBF_TPO_PLT.ntr
  is '����� ��';
create index DBF_TPO_PLT_ID on DBF_TPO_PLT (ID);
create index DBF_TPO_PLT_NUM_TPO on DBF_TPO_PLT (NUM_TPO);

prompt
prompt Creating table DBF_TPO_PLTPERIO
prompt ===============================
prompt
create table DBF_TPO_PLTPERIO
(
  num_tpo  VARCHAR2(10) not null,
  num_dtpo VARCHAR2(1) not null,
  pos_dtpo VARCHAR2(2) not null,
  begdat   DATE,
  enddat   DATE,
  mont     NUMBER(5),
  stavka   NUMBER,
  sum_val  NUMBER,
  sum_usd  NUMBER,
  prevtpo  VARCHAR2(26)
)
;
comment on table DBF_TPO_PLTPERIO
  is '������� DBF_TPO_PLTPERIO';
comment on column DBF_TPO_PLTPERIO.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_PLTPERIO.num_dtpo
  is '����� ����';
comment on column DBF_TPO_PLTPERIO.pos_dtpo
  is '������� � ����';
comment on column DBF_TPO_PLTPERIO.begdat
  is '��������� ���� �������';
comment on column DBF_TPO_PLTPERIO.enddat
  is '�������� ���� �������';
comment on column DBF_TPO_PLTPERIO.mont
  is '���-�� ������� �������';
comment on column DBF_TPO_PLTPERIO.stavka
  is '������ (NUM)';
comment on column DBF_TPO_PLTPERIO.sum_val
  is '����� ������� � ������';
comment on column DBF_TPO_PLTPERIO.sum_usd
  is '����� ������� � �������� ���.';
comment on column DBF_TPO_PLTPERIO.prevtpo
  is '����� ��� ��������� �������';
alter table DBF_TPO_PLTPERIO
  add constraint DBF_TPO_PLTPERIO_PK primary key (NUM_TPO, NUM_DTPO, POS_DTPO);

prompt
prompt Creating table DBF_TPO_TDOP
prompt ===========================
prompt
create table DBF_TPO_TDOP
(
  num_tpo    VARCHAR2(10),
  num_dtpo   VARCHAR2(3),
  pos_dtpo   VARCHAR2(2),
  stavposhl  NUMBER,
  stavposhl2 NUMBER,
  stavakciz  NUMBER,
  stavnds    NUMBER,
  edposhl    NUMBER(5),
  edakciz    NUMBER(5),
  ednds      NUMBER(5),
  sumposhl   NUMBER,
  sumakciz   NUMBER,
  sumnds     NUMBER,
  osnposhl   NUMBER,
  osnakciz   NUMBER,
  osnnds     NUMBER,
  edosnposhl VARCHAR2(7),
  edosnakciz VARCHAR2(7),
  edosnnds   VARCHAR2(7),
  sto        NUMBER,
  sumsb      NUMBER,
  cod_poshl  VARCHAR2(4),
  cod_akc    VARCHAR2(4),
  cod_nds    VARCHAR2(4)
)
;
comment on table DBF_TPO_TDOP
  is '������� DBF_TPO_TDOP';
comment on column DBF_TPO_TDOP.num_tpo
  is '������������ ����� ���';
comment on column DBF_TPO_TDOP.num_dtpo
  is '����� ����';
comment on column DBF_TPO_TDOP.pos_dtpo
  is '������� � ����';
comment on column DBF_TPO_TDOP.stavposhl
  is '������ ������� ��������';
comment on column DBF_TPO_TDOP.stavposhl2
  is '������ ������� ����������';
comment on column DBF_TPO_TDOP.stavakciz
  is '������ ������';
comment on column DBF_TPO_TDOP.stavnds
  is '������ ���';
comment on column DBF_TPO_TDOP.edposhl
  is '������� ������ �������';
comment on column DBF_TPO_TDOP.edakciz
  is '������� ������ ������';
comment on column DBF_TPO_TDOP.ednds
  is '������� ������ ���';
comment on column DBF_TPO_TDOP.sumposhl
  is '����� ������� �� �������';
comment on column DBF_TPO_TDOP.sumakciz
  is '����� ������� �� ������';
comment on column DBF_TPO_TDOP.sumnds
  is '����� ������� �� ���';
comment on column DBF_TPO_TDOP.osnposhl
  is '������ �������';
comment on column DBF_TPO_TDOP.osnakciz
  is '������ ������';
comment on column DBF_TPO_TDOP.osnnds
  is '������ ���';
comment on column DBF_TPO_TDOP.edosnposhl
  is '��. ������ �������';
comment on column DBF_TPO_TDOP.edosnakciz
  is '��. ������ ������';
comment on column DBF_TPO_TDOP.edosnnds
  is '��. ������ ���';
comment on column DBF_TPO_TDOP.sto
  is '������ ����� �� ���������';
comment on column DBF_TPO_TDOP.sumsb
  is '����� ���� ������';
comment on column DBF_TPO_TDOP.cod_poshl
  is '��� �������';
comment on column DBF_TPO_TDOP.cod_akc
  is '��� ������';
comment on column DBF_TPO_TDOP.cod_nds
  is '��� ���';
alter table DBF_TPO_TDOP
  add constraint DBF_TPO_TDOP_UQ unique (NUM_TPO, NUM_DTPO, POS_DTPO);

prompt
prompt Creating table DICT_NSI_PZN
prompt ===========================
prompt
create table DICT_NSI_PZN
(
  vkey    VARCHAR2(2),
  id      VARCHAR2(2) not null,
  imy     VARCHAR2(4),
  name    VARCHAR2(40),
  cb_date DATE,
  ce_date DATE
)
;
comment on table DICT_NSI_PZN
  is '��������� ����� ����������� ��������� ������';
comment on column DICT_NSI_PZN.vkey
  is 'VKEY';
comment on column DICT_NSI_PZN.id
  is 'ID';
comment on column DICT_NSI_PZN.imy
  is 'IMY';
comment on column DICT_NSI_PZN.name
  is 'NAME';
comment on column DICT_NSI_PZN.cb_date
  is 'CB_DATE';
comment on column DICT_NSI_PZN.ce_date
  is 'CE_DATE';
alter table DICT_NSI_PZN
  add constraint DICT#PK#NSI_PZN#ID primary key (ID);

prompt
prompt Creating table DICT_NSI_TNP
prompt ===========================
prompt
create table DICT_NSI_TNP
(
  vkey      VARCHAR2(2),
  id        VARCHAR2(2) not null,
  fullname  VARCHAR2(25),
  shortname VARCHAR2(5)
)
;
comment on table DICT_NSI_TNP
  is '��������� ����� ����������� ��������� ������';
comment on column DICT_NSI_TNP.vkey
  is 'VKEY';
comment on column DICT_NSI_TNP.id
  is 'ID';
comment on column DICT_NSI_TNP.fullname
  is 'FULLNAME';
comment on column DICT_NSI_TNP.shortname
  is 'SHORTNAME';
alter table DICT_NSI_TNP
  add constraint DICT#PK#NSI_TNP#ID primary key (ID);

prompt
prompt Creating table DICT_NSI_BANK
prompt ============================
prompt
create table DICT_NSI_BANK
(
  id     NUMBER not null,
  vkey   VARCHAR2(8),
  real   VARCHAR2(4),
  pzn    VARCHAR2(2),
  uer    VARCHAR2(1),
  rgn    VARCHAR2(2),
  ind    VARCHAR2(6),
  tnp    VARCHAR2(2),
  nnp    VARCHAR2(25),
  adr    VARCHAR2(30),
  rkc    VARCHAR2(9),
  namep  VARCHAR2(45),
  namen  VARCHAR2(40),
  newnum VARCHAR2(9),
  newks  VARCHAR2(9),
  permfo VARCHAR2(6),
  srok   VARCHAR2(2),
  at1    VARCHAR2(7),
  at2    VARCHAR2(7),
  telef  VARCHAR2(25),
  regn   VARCHAR2(9),
  okpo   VARCHAR2(8),
  dt_izm DATE,
  p      VARCHAR2(1),
  cks    VARCHAR2(6),
  ksnp   VARCHAR2(20)
)
;
comment on table DICT_NSI_BANK
  is 'REFERENCE#���������� ������';
comment on column DICT_NSI_BANK.id
  is 'ID';
comment on column DICT_NSI_BANK.vkey
  is 'VKEY';
comment on column DICT_NSI_BANK.real
  is 'REAL';
comment on column DICT_NSI_BANK.pzn
  is 'PZN';
comment on column DICT_NSI_BANK.uer
  is 'UER';
comment on column DICT_NSI_BANK.rgn
  is 'RGN';
comment on column DICT_NSI_BANK.ind
  is 'IND';
comment on column DICT_NSI_BANK.tnp
  is 'TNP';
comment on column DICT_NSI_BANK.nnp
  is 'NNP';
comment on column DICT_NSI_BANK.adr
  is 'ADR';
comment on column DICT_NSI_BANK.rkc
  is '���';
comment on column DICT_NSI_BANK.namep
  is '������������';
comment on column DICT_NSI_BANK.namen
  is '������������';
comment on column DICT_NSI_BANK.newnum
  is '���';
comment on column DICT_NSI_BANK.newks
  is 'NEWKS';
comment on column DICT_NSI_BANK.permfo
  is 'PERMFO';
comment on column DICT_NSI_BANK.srok
  is 'SROK';
comment on column DICT_NSI_BANK.at1
  is 'AT1';
comment on column DICT_NSI_BANK.at2
  is 'AT2';
comment on column DICT_NSI_BANK.telef
  is 'TELEF';
comment on column DICT_NSI_BANK.regn
  is 'REGN';
comment on column DICT_NSI_BANK.okpo
  is '����';
comment on column DICT_NSI_BANK.dt_izm
  is 'DT_IZM';
comment on column DICT_NSI_BANK.p
  is 'P';
comment on column DICT_NSI_BANK.cks
  is 'CKS';
comment on column DICT_NSI_BANK.ksnp
  is 'KSNP';
create index FDC#FK#NSI_BANK#PZN on DICT_NSI_BANK (PZN);
create index FDC#FK#NSI_BANK#TNP on DICT_NSI_BANK (TNP);
alter table DICT_NSI_BANK
  add constraint DICT#PK#NSI_BANK#ID primary key (ID);
alter table DICT_NSI_BANK
  add constraint FDC#FK#NSI_BANK#PZN foreign key (PZN)
  references DICT_NSI_PZN (ID);
alter table DICT_NSI_BANK
  add constraint FDC#FK#NSI_BANK#TNP foreign key (TNP)
  references DICT_NSI_TNP (ID);

prompt
prompt Creating table EXCH_MESSAGEDATA
prompt ===============================
prompt
create table EXCH_MESSAGEDATA
(
  messagedata_id NUMBER(20) not null,
  createstamp    TIMESTAMP(6) default systimestamp not null,
  data           CLOB not null
)
;
comment on table EXCH_MESSAGEDATA
  is '������� ����������� ���������';
comment on column EXCH_MESSAGEDATA.messagedata_id
  is 'MESSAGEDATA_ID';
comment on column EXCH_MESSAGEDATA.createstamp
  is '���� �������� ���������';
comment on column EXCH_MESSAGEDATA.data
  is '����� ���������';
alter table EXCH_MESSAGEDATA
  add constraint EXCH_MESSAGEDATA_PK primary key (MESSAGEDATA_ID);

prompt
prompt Creating table EXCH_MESSAGEPROP
prompt ===============================
prompt
create table EXCH_MESSAGEPROP
(
  messagedata_id      NUMBER(20) not null,
  isvalid             NUMBER(1) default 0,
  address_id          NUMBER(11),
  messagekind         VARCHAR2(50),
  envelopeid          VARCHAR2(50),
  initialenvelopeid   VARCHAR2(50),
  senderinformation   VARCHAR2(50),
  receiverinformation VARCHAR2(50),
  softkind            VARCHAR2(50),
  softversion         VARCHAR2(50)
)
;
comment on table EXCH_MESSAGEPROP
  is '������� ��� �������� ���������� �������� ��������� �� exch_messages';
comment on column EXCH_MESSAGEPROP.messagedata_id
  is 'ID ������� exch_messageData';
comment on column EXCH_MESSAGEPROP.isvalid
  is '��������� �������� �� ������������ ����� 0-������������ 1-�� 2-err';
comment on column EXCH_MESSAGEPROP.address_id
  is 'id ������ ����������� ��� ��������\���������� ��� ���������';
comment on column EXCH_MESSAGEPROP.messagekind
  is '��� ���������';
comment on column EXCH_MESSAGEPROP.envelopeid
  is '������������ ������������� ���������';
comment on column EXCH_MESSAGEPROP.initialenvelopeid
  is '��������� ������������ ������������� ���������';
comment on column EXCH_MESSAGEPROP.senderinformation
  is '���������� �� �����������';
comment on column EXCH_MESSAGEPROP.receiverinformation
  is '���������� � ����������';
comment on column EXCH_MESSAGEPROP.softkind
  is '��� ������������ �����������';
comment on column EXCH_MESSAGEPROP.softversion
  is '������ ������������ �����������';
alter table EXCH_MESSAGEPROP
  add constraint EXCH_MESSAGEPROP_PK primary key (MESSAGEDATA_ID);
alter table EXCH_MESSAGEPROP
  add constraint EXCH_MESSAGES_PARSE_FK foreign key (MESSAGEDATA_ID)
  references EXCH_MESSAGEDATA (MESSAGEDATA_ID);

prompt
prompt Creating table EXCH_MESSAGES
prompt ============================
prompt
create table EXCH_MESSAGES
(
  message_id     NUMBER(20) not null,
  messagedata_id NUMBER(20) not null,
  insstamp       TIMESTAMP(6) WITH TIME ZONE default systimestamp not null,
  isincoming     NUMBER(1) default 1 not null,
  tag            VARCHAR2(30) not null,
  status         NUMBER(1) default 0,
  mqmessageid    RAW(24),
  refmessage_id  NUMBER(20)
)
;
comment on table EXCH_MESSAGES
  is '������� ����������� �������\����� ���������';
comment on column EXCH_MESSAGES.message_id
  is 'MESSAGE_ID';
comment on column EXCH_MESSAGES.messagedata_id
  is 'MESSAGEDATA_ID';
comment on column EXCH_MESSAGES.insstamp
  is '����� �������  ��������� � �������';
comment on column EXCH_MESSAGES.isincoming
  is '1 - �������� ���������
0- ��������� ���������
';
comment on column EXCH_MESSAGES.tag
  is '������ ��� ����� � ������������ ����������. ������ ��� �������� ������ ��������( ������� MQ)';
comment on column EXCH_MESSAGES.status
  is '������ ��������� ��������� -0 - �� ����������, 1- ���������� �������, 2 - ���������� � ��������';
comment on column EXCH_MESSAGES.mqmessageid
  is 'ID MQ ���������';
comment on column EXCH_MESSAGES.refmessage_id
  is 'ID  ��������� ������. �������� ��������� ������� ���������';
create index EXCH_MESSAGES_LIST_I on EXCH_MESSAGES (TAG, ISINCOMING, STATUS);
create index EXCH_MESSAGE_DATA_I on EXCH_MESSAGES (MESSAGEDATA_ID);
alter table EXCH_MESSAGES
  add constraint EXCH_MESSAGES_PK primary key (MESSAGE_ID);
alter table EXCH_MESSAGES
  add constraint MESSAGEDATA_TRANS_FK foreign key (MESSAGEDATA_ID)
  references EXCH_MESSAGEDATA (MESSAGEDATA_ID);

prompt
prompt Creating table EXP_ADVICE
prompt =========================
prompt
create table EXP_ADVICE
(
  id              NUMBER(15) not null,
  descript        VARCHAR2(1500),
  doc_number      VARCHAR2(100),
  doc_date        DATE,
  customs_code_8  VARCHAR2(8),
  subject_id      NUMBER(15),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15),
  new_id          NUMBER(15),
  imperrmsg       VARCHAR2(2000)
)
;
comment on table EXP_ADVICE
  is '������� EXP_ADVICE';
comment on column EXP_ADVICE.id
  is 'ID';
comment on column EXP_ADVICE.descript
  is 'DESCRIPT';
comment on column EXP_ADVICE.doc_number
  is 'DOC_NUMBER';
comment on column EXP_ADVICE.doc_date
  is 'DOC_DATE';
comment on column EXP_ADVICE.customs_code_8
  is 'CUSTOMS_CODE_8';
comment on column EXP_ADVICE.subject_id
  is 'SUBJECT_ID';
comment on column EXP_ADVICE.ext_source
  is 'EXT_SOURCE';
comment on column EXP_ADVICE.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_ADVICE.ext_id
  is 'EXT_ID';
comment on column EXP_ADVICE.new_id
  is 'NEW_ID';
comment on column EXP_ADVICE.imperrmsg
  is 'IMPERRMSG';
alter table EXP_ADVICE
  add constraint PK#EXP_ADVICE#ID primary key (ID);

prompt
prompt Creating table EXP_DBF_DCLHEAD
prompt ==============================
prompt
create table EXP_DBF_DCLHEAD
(
  num_ver    VARCHAR2(8),
  data_ver   DATE,
  typ_dcl    VARCHAR2(2),
  gugtk      NUMBER(1),
  copy       NUMBER(1),
  dcopy      DATE,
  q_edit     FLOAT,
  d_edit     DATE,
  sol        FLOAT,
  max_err    FLOAT,
  dd         DATE,
  tm         VARCHAR2(8),
  extrnl     VARCHAR2(80),
  schet      VARCHAR2(160),
  stepctrl   VARCHAR2(20),
  typ_dtc    VARCHAR2(1),
  vid_ktc    VARCHAR2(1),
  ind_k      VARCHAR2(5),
  stat       VARCHAR2(1),
  g071       VARCHAR2(8) not null,
  g072       DATE not null,
  g073       VARCHAR2(10) not null,
  ui_b_1     VARCHAR2(8),
  ui_b_2     DATE,
  ui_b_3     VARCHAR2(7),
  sds_srv    VARCHAR2(4),
  sds_num    FLOAT,
  f_decl     VARCHAR2(1),
  g011       VARCHAR2(2),
  g012       VARCHAR2(2),
  g0131      VARCHAR2(3),
  g020       VARCHAR2(15),
  g02_itn    VARCHAR2(13),
  g021       VARCHAR2(12),
  g022       VARCHAR2(150),
  g022a      VARCHAR2(80),
  g023       VARCHAR2(80),
  g0231      VARCHAR2(3),
  g0231a     VARCHAR2(35),
  g023a      VARCHAR2(80),
  g024a      VARCHAR2(2),
  g024p      VARCHAR2(1),
  g024b      VARCHAR2(5),
  g024c      VARCHAR2(10),
  g024n      VARCHAR2(10),
  g024in     VARCHAR2(12),
  g027       VARCHAR2(9),
  g0281      VARCHAR2(2),
  g0281a     VARCHAR2(6),
  g02821     VARCHAR2(11),
  g02822     VARCHAR2(25),
  g02823     VARCHAR2(150),
  g0283      DATE,
  g032       FLOAT,
  g04        FLOAT,
  g05        FLOAT,
  g06        FLOAT,
  g080       VARCHAR2(15),
  g08_itn    VARCHAR2(13),
  g081       VARCHAR2(12),
  g082       VARCHAR2(150),
  g082a      VARCHAR2(80),
  g083       VARCHAR2(80),
  g0831      VARCHAR2(3),
  g0831a     VARCHAR2(35),
  g083a      VARCHAR2(80),
  g084a      VARCHAR2(2),
  g084p      VARCHAR2(1),
  g084b      VARCHAR2(5),
  g084c      VARCHAR2(10),
  g087       VARCHAR2(9),
  g0881      VARCHAR2(2),
  g0881a     VARCHAR2(6),
  g08821     VARCHAR2(11),
  g08822     VARCHAR2(25),
  g08823     VARCHAR2(150),
  g0883      DATE,
  g089       VARCHAR2(1),
  g090       VARCHAR2(15),
  g09_itn    VARCHAR2(13),
  g091       VARCHAR2(12),
  g092       VARCHAR2(150),
  g092a      VARCHAR2(150),
  g093       VARCHAR2(80),
  g093a      VARCHAR2(80),
  g094a      VARCHAR2(2),
  g094p      VARCHAR2(1),
  g094b      VARCHAR2(5),
  g094c      VARCHAR2(10),
  g097       VARCHAR2(9),
  g0981      VARCHAR2(2),
  g0981a     VARCHAR2(6),
  g09821     VARCHAR2(11),
  g09822     VARCHAR2(25),
  g09823     VARCHAR2(150),
  g0983      DATE,
  g10        VARCHAR2(3),
  g11        VARCHAR2(3),
  g12        FLOAT,
  g121       VARCHAR2(3),
  g13        VARCHAR2(8),
  g140       VARCHAR2(15),
  g14_itn    VARCHAR2(13),
  g141       VARCHAR2(12),
  g142       VARCHAR2(150),
  g142a      VARCHAR2(150),
  g143       VARCHAR2(80),
  g143a      VARCHAR2(80),
  g144a      VARCHAR2(2),
  g144p      VARCHAR2(1),
  g144b      VARCHAR2(5),
  g144c      VARCHAR2(10),
  g144d1     VARCHAR2(5),
  g144d2     FLOAT,
  g144d3     FLOAT,
  g144e      VARCHAR2(13),
  g145       DATE,
  g147       VARCHAR2(9),
  g1481      VARCHAR2(2),
  g1481a     VARCHAR2(6),
  g14821     VARCHAR2(11),
  g14822     VARCHAR2(25),
  g14823     VARCHAR2(150),
  g1483      DATE,
  g15        VARCHAR2(35),
  g15a       VARCHAR2(3),
  g16        VARCHAR2(35),
  g17a       VARCHAR2(3),
  g17b       VARCHAR2(35),
  g180       NUMBER(5),
  g19        VARCHAR2(1),
  g201       FLOAT,
  g202       VARCHAR2(3),
  g2021      VARCHAR2(40),
  g203       VARCHAR2(2),
  g210       FLOAT,
  g221       VARCHAR2(3),
  g222       FLOAT,
  g23        FLOAT,
  g230       DATE,
  g24        VARCHAR2(3),
  g25        VARCHAR2(2),
  g26        VARCHAR2(2),
  g270       VARCHAR2(2),
  g27_itn    VARCHAR2(13),
  g2710      VARCHAR2(1),
  g271       VARCHAR2(13),
  g27        VARCHAR2(40),
  g2711      DATE,
  g2712      VARCHAR2(8),
  g28_itn    VARCHAR2(13),
  g281       VARCHAR2(70),
  g2811      VARCHAR2(1),
  g281d      DATE,
  g281dd     DATE,
  g282       VARCHAR2(70),
  g282d      DATE,
  g2831      VARCHAR2(2),
  g283       VARCHAR2(70),
  g284       VARCHAR2(50),
  g284d      DATE,
  g284dd     DATE,
  g4910      VARCHAR2(1),
  g491       VARCHAR2(30),
  g492       DATE,
  g500       VARCHAR2(15),
  g50_itn    VARCHAR2(13),
  g5011      VARCHAR2(80),
  g5012      VARCHAR2(80),
  g5021      VARCHAR2(20),
  g5022      VARCHAR2(10),
  g5023      VARCHAR2(80),
  g5031      VARCHAR2(20),
  g5032      VARCHAR2(10),
  g5033      VARCHAR2(80),
  g504       VARCHAR2(12),
  g507       VARCHAR2(9),
  g5081      VARCHAR2(2),
  g5081a     VARCHAR2(6),
  g50821     VARCHAR2(11),
  g50822     VARCHAR2(25),
  g50823     VARCHAR2(80),
  g5083      DATE,
  g502       DATE,
  g52        VARCHAR2(3),
  g54_itn    VARCHAR2(13),
  g5410      VARCHAR2(1),
  g541       VARCHAR2(14),
  g541d      DATE,
  g5411      VARCHAR2(50),
  g5411d     DATE,
  g541_inn   VARCHAR2(12),
  g541_kpp   VARCHAR2(9),
  g542       DATE,
  g5441      VARCHAR2(40),
  g5442      VARCHAR2(50),
  g5443      VARCHAR2(250),
  g5444      VARCHAR2(50),
  g5445      DATE,
  g5446      DATE,
  g5447      VARCHAR2(50),
  g5451      VARCHAR2(2),
  g5451a     VARCHAR2(6),
  g54521     VARCHAR2(11),
  g54522     VARCHAR2(25),
  g54523     VARCHAR2(150),
  g5453      DATE,
  ga1        VARCHAR2(20),
  ga2        VARCHAR2(100),
  ga1a       VARCHAR2(20),
  ga2a       VARCHAR2(100),
  gd0        VARCHAR2(2),
  gd1        DATE,
  gd11       VARCHAR2(8),
  gd2        VARCHAR2(4),
  gd00       VARCHAR2(150),
  gddf       DATE,
  gd3        VARCHAR2(6),
  gd4        VARCHAR2(6),
  recplatv   FLOAT,
  recslotm   FLOAT,
  rectrans   FLOAT,
  recsumpp   FLOAT,
  recmhc50   FLOAT,
  recusl     FLOAT,
  pprr       FLOAT,
  pprv       FLOAT,
  pposh      FLOAT,
  pnal       FLOAT,
  gnuser     VARCHAR2(40),
  flduser    VARCHAR2(40),
  nrelise    VARCHAR2(10),
  kodtop     VARCHAR2(3),
  g071top    VARCHAR2(8),
  g072top    DATE,
  g073top    VARCHAR2(7),
  typdtop    VARCHAR2(2),
  numdtop    VARCHAR2(50),
  datdtop    DATE,
  fiotop     VARCHAR2(40),
  dattop     DATE,
  dmodify    DATE,
  tmodify    VARCHAR2(8),
  gd5lnp     VARCHAR2(20),
  gd5        VARCHAR2(6),
  g5452      VARCHAR2(20),
  gb_kd      NUMBER,
  gb_rub     NUMBER,
  g474_rub   NUMBER,
  g204       VARCHAR2(10),
  g146d      DATE,
  g146a      VARCHAR2(10),
  g096d      DATE,
  g096a      VARCHAR2(10),
  g086d      DATE,
  g086a      VARCHAR2(10),
  g026d      DATE,
  g026a      VARCHAR2(20),
  lnpbegctrl VARCHAR2(30),
  tbegctrl   VARCHAR2(30),
  dbegctrl   DATE,
  tpriem     VARCHAR2(30),
  id         INTEGER not null,
  load_id    INTEGER not null,
  p_status1  NUMBER(2),
  p_status2  NUMBER(2),
  edoc_id    NUMBER(19),
  edoc_guid  VARCHAR2(32),
  complectbl VARCHAR2(1),
  g0121      VARCHAR2(1),
  g023post   VARCHAR2(9),
  g0231c     VARCHAR2(3),
  g023subd   VARCHAR2(35),
  g023city   VARCHAR2(35),
  g023street VARCHAR2(35),
  g040       NUMBER(5),
  g07        VARCHAR2(3),
  g083post   VARCHAR2(9),
  g0831c     VARCHAR2(3),
  g083subd   VARCHAR2(35),
  g083city   VARCHAR2(35),
  g083street VARCHAR2(35),
  g093post   VARCHAR2(9),
  g0931      VARCHAR2(2),
  g093subd   VARCHAR2(35),
  g093city   VARCHAR2(35),
  g093street VARCHAR2(35),
  g093apost  VARCHAR2(9),
  g0931a     VARCHAR2(2),
  g093asubd  VARCHAR2(35),
  g093acity  VARCHAR2(35),
  g093astree VARCHAR2(35),
  g11c       VARCHAR2(3),
  g143post   VARCHAR2(9),
  g1431      VARCHAR2(2),
  g143subd   VARCHAR2(35),
  g143city   VARCHAR2(35),
  g143street VARCHAR2(35),
  g143apost  VARCHAR2(9),
  g1431a     VARCHAR2(2),
  g143asubd  VARCHAR2(35),
  g143acity  VARCHAR2(35),
  g143astree VARCHAR2(35),
  g15ac      VARCHAR2(3),
  g160       VARCHAR2(1),
  g161       VARCHAR2(2),
  g17ac      VARCHAR2(3),
  g221c      VARCHAR2(3),
  g2810      VARCHAR2(1),
  g28okpo    VARCHAR2(10),
  g28inn     VARCHAR2(12),
  g28gtd_1   VARCHAR2(8),
  g28gtd_2   DATE,
  g28gtd_3   VARCHAR2(7),
  g281oth    VARCHAR2(30),
  g28zajmb   VARCHAR2(70),
  g28zajmn   VARCHAR2(50),
  g28211     VARCHAR2(1),
  g28212     VARCHAR2(1),
  g28221     VARCHAR2(2),
  g28222     VARCHAR2(1),
  g2823      DATE,
  g2824      DATE,
  g2825      VARCHAR2(3),
  g30_itn    VARCHAR2(13),
  g300       VARCHAR2(2),
  g3010      VARCHAR2(1),
  g301       VARCHAR2(13),
  g30        VARCHAR2(40),
  g30subd    VARCHAR2(35),
  g30city    VARCHAR2(35),
  g30street  VARCHAR2(35),
  g3012      VARCHAR2(8),
  recpasp    NUMBER(8),
  frm_decl   VARCHAR2(1),
  ed_idid    VARCHAR2(36),
  g28230     VARCHAR2(1),
  g28240     VARCHAR2(1),
  ed_ididkmp VARCHAR2(36),
  ed_ididcnt VARCHAR2(36)
)
;
comment on table EXP_DBF_DCLHEAD
  is '������� EXP_DBF_DCLHEAD';
comment on column EXP_DBF_DCLHEAD.num_ver
  is 'NUM_VER';
comment on column EXP_DBF_DCLHEAD.data_ver
  is 'DATA_VER';
comment on column EXP_DBF_DCLHEAD.typ_dcl
  is 'TYP_DCL';
comment on column EXP_DBF_DCLHEAD.gugtk
  is 'GUGTK';
comment on column EXP_DBF_DCLHEAD.copy
  is 'COPY';
comment on column EXP_DBF_DCLHEAD.dcopy
  is 'DCOPY';
comment on column EXP_DBF_DCLHEAD.q_edit
  is 'Q_EDIT';
comment on column EXP_DBF_DCLHEAD.d_edit
  is 'D_EDIT';
comment on column EXP_DBF_DCLHEAD.sol
  is 'SOL';
comment on column EXP_DBF_DCLHEAD.max_err
  is 'MAX_ERR';
comment on column EXP_DBF_DCLHEAD.dd
  is 'DD';
comment on column EXP_DBF_DCLHEAD.tm
  is 'TM';
comment on column EXP_DBF_DCLHEAD.extrnl
  is 'EXTRNL';
comment on column EXP_DBF_DCLHEAD.schet
  is 'SCHET';
comment on column EXP_DBF_DCLHEAD.stepctrl
  is 'STEPCTRL';
comment on column EXP_DBF_DCLHEAD.typ_dtc
  is 'TYP_DTC';
comment on column EXP_DBF_DCLHEAD.vid_ktc
  is 'VID_KTC';
comment on column EXP_DBF_DCLHEAD.ind_k
  is 'IND_K';
comment on column EXP_DBF_DCLHEAD.stat
  is 'STAT';
comment on column EXP_DBF_DCLHEAD.g071
  is 'G071';
comment on column EXP_DBF_DCLHEAD.g072
  is 'G072';
comment on column EXP_DBF_DCLHEAD.g073
  is 'G073';
comment on column EXP_DBF_DCLHEAD.ui_b_1
  is 'UI_B_1';
comment on column EXP_DBF_DCLHEAD.ui_b_2
  is 'UI_B_2';
comment on column EXP_DBF_DCLHEAD.ui_b_3
  is 'UI_B_3';
comment on column EXP_DBF_DCLHEAD.sds_srv
  is 'SDS_SRV';
comment on column EXP_DBF_DCLHEAD.sds_num
  is 'SDS_NUM';
comment on column EXP_DBF_DCLHEAD.f_decl
  is 'F_DECL';
comment on column EXP_DBF_DCLHEAD.g011
  is 'G011';
comment on column EXP_DBF_DCLHEAD.g012
  is 'G012';
comment on column EXP_DBF_DCLHEAD.g0131
  is 'G0131';
comment on column EXP_DBF_DCLHEAD.g020
  is 'G020';
comment on column EXP_DBF_DCLHEAD.g02_itn
  is 'G02_ITN';
comment on column EXP_DBF_DCLHEAD.g021
  is 'G021';
comment on column EXP_DBF_DCLHEAD.g022
  is 'G022';
comment on column EXP_DBF_DCLHEAD.g022a
  is 'G022A';
comment on column EXP_DBF_DCLHEAD.g023
  is 'G023';
comment on column EXP_DBF_DCLHEAD.g0231
  is 'G0231';
comment on column EXP_DBF_DCLHEAD.g0231a
  is 'G0231A';
comment on column EXP_DBF_DCLHEAD.g023a
  is 'G023A';
comment on column EXP_DBF_DCLHEAD.g024a
  is 'G024A';
comment on column EXP_DBF_DCLHEAD.g024p
  is 'G024P';
comment on column EXP_DBF_DCLHEAD.g024b
  is 'G024B';
comment on column EXP_DBF_DCLHEAD.g024c
  is 'G024C';
comment on column EXP_DBF_DCLHEAD.g024n
  is 'G024N';
comment on column EXP_DBF_DCLHEAD.g024in
  is 'G024IN';
comment on column EXP_DBF_DCLHEAD.g027
  is 'G027';
comment on column EXP_DBF_DCLHEAD.g0281
  is 'G0281';
comment on column EXP_DBF_DCLHEAD.g0281a
  is 'G0281A';
comment on column EXP_DBF_DCLHEAD.g02821
  is 'G02821';
comment on column EXP_DBF_DCLHEAD.g02822
  is 'G02822';
comment on column EXP_DBF_DCLHEAD.g02823
  is 'G02823';
comment on column EXP_DBF_DCLHEAD.g0283
  is 'G0283';
comment on column EXP_DBF_DCLHEAD.g032
  is 'G032';
comment on column EXP_DBF_DCLHEAD.g04
  is 'G04';
comment on column EXP_DBF_DCLHEAD.g05
  is 'G05';
comment on column EXP_DBF_DCLHEAD.g06
  is 'G06';
comment on column EXP_DBF_DCLHEAD.g080
  is 'G080';
comment on column EXP_DBF_DCLHEAD.g08_itn
  is 'G08_ITN';
comment on column EXP_DBF_DCLHEAD.g081
  is 'G081';
comment on column EXP_DBF_DCLHEAD.g082
  is 'G082';
comment on column EXP_DBF_DCLHEAD.g082a
  is 'G082A';
comment on column EXP_DBF_DCLHEAD.g083
  is 'G083';
comment on column EXP_DBF_DCLHEAD.g0831
  is 'G0831';
comment on column EXP_DBF_DCLHEAD.g0831a
  is 'G0831A';
comment on column EXP_DBF_DCLHEAD.g083a
  is 'G083A';
comment on column EXP_DBF_DCLHEAD.g084a
  is 'G084A';
comment on column EXP_DBF_DCLHEAD.g084p
  is 'G084P';
comment on column EXP_DBF_DCLHEAD.g084b
  is 'G084B';
comment on column EXP_DBF_DCLHEAD.g084c
  is 'G084C';
comment on column EXP_DBF_DCLHEAD.g087
  is 'G087';
comment on column EXP_DBF_DCLHEAD.g0881
  is 'G0881';
comment on column EXP_DBF_DCLHEAD.g0881a
  is 'G0881A';
comment on column EXP_DBF_DCLHEAD.g08821
  is 'G08821';
comment on column EXP_DBF_DCLHEAD.g08822
  is 'G08822';
comment on column EXP_DBF_DCLHEAD.g08823
  is 'G08823';
comment on column EXP_DBF_DCLHEAD.g0883
  is 'G0883';
comment on column EXP_DBF_DCLHEAD.g089
  is 'G089';
comment on column EXP_DBF_DCLHEAD.g090
  is 'G090';
comment on column EXP_DBF_DCLHEAD.g09_itn
  is 'G09_ITN';
comment on column EXP_DBF_DCLHEAD.g091
  is 'G091';
comment on column EXP_DBF_DCLHEAD.g092
  is 'G092';
comment on column EXP_DBF_DCLHEAD.g092a
  is 'G092A';
comment on column EXP_DBF_DCLHEAD.g093
  is 'G093';
comment on column EXP_DBF_DCLHEAD.g093a
  is 'G093A';
comment on column EXP_DBF_DCLHEAD.g094a
  is 'G094A';
comment on column EXP_DBF_DCLHEAD.g094p
  is 'G094P';
comment on column EXP_DBF_DCLHEAD.g094b
  is 'G094B';
comment on column EXP_DBF_DCLHEAD.g094c
  is 'G094C';
comment on column EXP_DBF_DCLHEAD.g097
  is 'G097';
comment on column EXP_DBF_DCLHEAD.g0981
  is 'G0981';
comment on column EXP_DBF_DCLHEAD.g0981a
  is 'G0981A';
comment on column EXP_DBF_DCLHEAD.g09821
  is 'G09821';
comment on column EXP_DBF_DCLHEAD.g09822
  is 'G09822';
comment on column EXP_DBF_DCLHEAD.g09823
  is 'G09823';
comment on column EXP_DBF_DCLHEAD.g0983
  is 'G0983';
comment on column EXP_DBF_DCLHEAD.g10
  is 'G10';
comment on column EXP_DBF_DCLHEAD.g11
  is 'G11';
comment on column EXP_DBF_DCLHEAD.g12
  is 'G12';
comment on column EXP_DBF_DCLHEAD.g121
  is 'G121';
comment on column EXP_DBF_DCLHEAD.g13
  is 'G13';
comment on column EXP_DBF_DCLHEAD.g140
  is 'G140';
comment on column EXP_DBF_DCLHEAD.g14_itn
  is 'G14_ITN';
comment on column EXP_DBF_DCLHEAD.g141
  is 'G141';
comment on column EXP_DBF_DCLHEAD.g142
  is 'G142';
comment on column EXP_DBF_DCLHEAD.g142a
  is 'G142A';
comment on column EXP_DBF_DCLHEAD.g143
  is 'G143';
comment on column EXP_DBF_DCLHEAD.g143a
  is 'G143A';
comment on column EXP_DBF_DCLHEAD.g144a
  is 'G144A';
comment on column EXP_DBF_DCLHEAD.g144p
  is 'G144P';
comment on column EXP_DBF_DCLHEAD.g144b
  is 'G144B';
comment on column EXP_DBF_DCLHEAD.g144c
  is 'G144C';
comment on column EXP_DBF_DCLHEAD.g144d1
  is 'G144D1';
comment on column EXP_DBF_DCLHEAD.g144d2
  is 'G144D2';
comment on column EXP_DBF_DCLHEAD.g144d3
  is 'G144D3';
comment on column EXP_DBF_DCLHEAD.g144e
  is 'G144E';
comment on column EXP_DBF_DCLHEAD.g145
  is 'G145';
comment on column EXP_DBF_DCLHEAD.g147
  is 'G147';
comment on column EXP_DBF_DCLHEAD.g1481
  is 'G1481';
comment on column EXP_DBF_DCLHEAD.g1481a
  is 'G1481A';
comment on column EXP_DBF_DCLHEAD.g14821
  is 'G14821';
comment on column EXP_DBF_DCLHEAD.g14822
  is 'G14822';
comment on column EXP_DBF_DCLHEAD.g14823
  is 'G14823';
comment on column EXP_DBF_DCLHEAD.g1483
  is 'G1483';
comment on column EXP_DBF_DCLHEAD.g15
  is 'G15';
comment on column EXP_DBF_DCLHEAD.g15a
  is 'G15A';
comment on column EXP_DBF_DCLHEAD.g16
  is 'G16';
comment on column EXP_DBF_DCLHEAD.g17a
  is 'G17A';
comment on column EXP_DBF_DCLHEAD.g17b
  is 'G17B';
comment on column EXP_DBF_DCLHEAD.g180
  is 'G180';
comment on column EXP_DBF_DCLHEAD.g19
  is 'G19';
comment on column EXP_DBF_DCLHEAD.g201
  is 'G201';
comment on column EXP_DBF_DCLHEAD.g202
  is 'G202';
comment on column EXP_DBF_DCLHEAD.g2021
  is 'G2021';
comment on column EXP_DBF_DCLHEAD.g203
  is 'G203';
comment on column EXP_DBF_DCLHEAD.g210
  is 'G210';
comment on column EXP_DBF_DCLHEAD.g221
  is 'G221';
comment on column EXP_DBF_DCLHEAD.g222
  is 'G222';
comment on column EXP_DBF_DCLHEAD.g23
  is 'G23';
comment on column EXP_DBF_DCLHEAD.g230
  is 'G230';
comment on column EXP_DBF_DCLHEAD.g24
  is 'G24';
comment on column EXP_DBF_DCLHEAD.g25
  is 'G25';
comment on column EXP_DBF_DCLHEAD.g26
  is 'G26';
comment on column EXP_DBF_DCLHEAD.g270
  is 'G270';
comment on column EXP_DBF_DCLHEAD.g27_itn
  is 'G27_ITN';
comment on column EXP_DBF_DCLHEAD.g2710
  is 'G2710';
comment on column EXP_DBF_DCLHEAD.g271
  is 'G271';
comment on column EXP_DBF_DCLHEAD.g27
  is 'G27';
comment on column EXP_DBF_DCLHEAD.g2711
  is 'G2711';
comment on column EXP_DBF_DCLHEAD.g2712
  is 'G2712';
comment on column EXP_DBF_DCLHEAD.g28_itn
  is 'G28_ITN';
comment on column EXP_DBF_DCLHEAD.g281
  is 'G281';
comment on column EXP_DBF_DCLHEAD.g2811
  is 'G2811';
comment on column EXP_DBF_DCLHEAD.g281d
  is 'G281D';
comment on column EXP_DBF_DCLHEAD.g281dd
  is 'G281DD';
comment on column EXP_DBF_DCLHEAD.g282
  is 'G282';
comment on column EXP_DBF_DCLHEAD.g282d
  is 'G282D';
comment on column EXP_DBF_DCLHEAD.g2831
  is 'G2831';
comment on column EXP_DBF_DCLHEAD.g283
  is 'G283';
comment on column EXP_DBF_DCLHEAD.g284
  is 'G284';
comment on column EXP_DBF_DCLHEAD.g284d
  is 'G284D';
comment on column EXP_DBF_DCLHEAD.g284dd
  is 'G284DD';
comment on column EXP_DBF_DCLHEAD.g4910
  is 'G4910';
comment on column EXP_DBF_DCLHEAD.g491
  is 'G491';
comment on column EXP_DBF_DCLHEAD.g492
  is 'G492';
comment on column EXP_DBF_DCLHEAD.g500
  is 'G500';
comment on column EXP_DBF_DCLHEAD.g50_itn
  is 'G50_ITN';
comment on column EXP_DBF_DCLHEAD.g5011
  is 'G5011';
comment on column EXP_DBF_DCLHEAD.g5012
  is 'G5012';
comment on column EXP_DBF_DCLHEAD.g5021
  is 'G5021';
comment on column EXP_DBF_DCLHEAD.g5022
  is 'G5022';
comment on column EXP_DBF_DCLHEAD.g5023
  is 'G5023';
comment on column EXP_DBF_DCLHEAD.g5031
  is 'G5031';
comment on column EXP_DBF_DCLHEAD.g5032
  is 'G5032';
comment on column EXP_DBF_DCLHEAD.g5033
  is 'G5033';
comment on column EXP_DBF_DCLHEAD.g504
  is 'G504';
comment on column EXP_DBF_DCLHEAD.g507
  is 'G507';
comment on column EXP_DBF_DCLHEAD.g5081
  is 'G5081';
comment on column EXP_DBF_DCLHEAD.g5081a
  is 'G5081A';
comment on column EXP_DBF_DCLHEAD.g50821
  is 'G50821';
comment on column EXP_DBF_DCLHEAD.g50822
  is 'G50822';
comment on column EXP_DBF_DCLHEAD.g50823
  is 'G50823';
comment on column EXP_DBF_DCLHEAD.g5083
  is 'G5083';
comment on column EXP_DBF_DCLHEAD.g502
  is 'G502';
comment on column EXP_DBF_DCLHEAD.g52
  is 'G52';
comment on column EXP_DBF_DCLHEAD.g54_itn
  is 'G54_ITN';
comment on column EXP_DBF_DCLHEAD.g5410
  is 'G5410';
comment on column EXP_DBF_DCLHEAD.g541
  is 'G541';
comment on column EXP_DBF_DCLHEAD.g541d
  is 'G541D';
comment on column EXP_DBF_DCLHEAD.g5411
  is 'G5411';
comment on column EXP_DBF_DCLHEAD.g5411d
  is 'G5411D';
comment on column EXP_DBF_DCLHEAD.g541_inn
  is 'G541_INN';
comment on column EXP_DBF_DCLHEAD.g541_kpp
  is 'G541_KPP';
comment on column EXP_DBF_DCLHEAD.g542
  is 'G542';
comment on column EXP_DBF_DCLHEAD.g5441
  is 'G5441';
comment on column EXP_DBF_DCLHEAD.g5442
  is 'G5442';
comment on column EXP_DBF_DCLHEAD.g5443
  is 'G5443';
comment on column EXP_DBF_DCLHEAD.g5444
  is 'G5444';
comment on column EXP_DBF_DCLHEAD.g5445
  is 'G5445';
comment on column EXP_DBF_DCLHEAD.g5446
  is 'G5446';
comment on column EXP_DBF_DCLHEAD.g5447
  is 'G5447';
comment on column EXP_DBF_DCLHEAD.g5451
  is 'G5451';
comment on column EXP_DBF_DCLHEAD.g5451a
  is 'G5451A';
comment on column EXP_DBF_DCLHEAD.g54521
  is 'G54521';
comment on column EXP_DBF_DCLHEAD.g54522
  is 'G54522';
comment on column EXP_DBF_DCLHEAD.g54523
  is 'G54523';
comment on column EXP_DBF_DCLHEAD.g5453
  is 'G5453';
comment on column EXP_DBF_DCLHEAD.ga1
  is 'GA1';
comment on column EXP_DBF_DCLHEAD.ga2
  is 'GA2';
comment on column EXP_DBF_DCLHEAD.ga1a
  is 'GA1A';
comment on column EXP_DBF_DCLHEAD.ga2a
  is 'GA2A';
comment on column EXP_DBF_DCLHEAD.gd0
  is 'GD0';
comment on column EXP_DBF_DCLHEAD.gd1
  is 'GD1';
comment on column EXP_DBF_DCLHEAD.gd11
  is 'GD11';
comment on column EXP_DBF_DCLHEAD.gd2
  is 'GD2';
comment on column EXP_DBF_DCLHEAD.gd00
  is 'GD00';
comment on column EXP_DBF_DCLHEAD.gddf
  is 'GDDF';
comment on column EXP_DBF_DCLHEAD.gd3
  is 'GD3';
comment on column EXP_DBF_DCLHEAD.gd4
  is 'GD4';
comment on column EXP_DBF_DCLHEAD.recplatv
  is 'RECPLATV';
comment on column EXP_DBF_DCLHEAD.recslotm
  is 'RECSLOTM';
comment on column EXP_DBF_DCLHEAD.rectrans
  is 'RECTRANS';
comment on column EXP_DBF_DCLHEAD.recsumpp
  is 'RECSUMPP';
comment on column EXP_DBF_DCLHEAD.recmhc50
  is 'RECMHC50';
comment on column EXP_DBF_DCLHEAD.recusl
  is 'RECUSL';
comment on column EXP_DBF_DCLHEAD.pprr
  is 'PPRR';
comment on column EXP_DBF_DCLHEAD.pprv
  is 'PPRV';
comment on column EXP_DBF_DCLHEAD.pposh
  is 'PPOSH';
comment on column EXP_DBF_DCLHEAD.pnal
  is 'PNAL';
comment on column EXP_DBF_DCLHEAD.gnuser
  is 'GNUSER';
comment on column EXP_DBF_DCLHEAD.flduser
  is 'FLDUSER';
comment on column EXP_DBF_DCLHEAD.nrelise
  is 'NRELISE';
comment on column EXP_DBF_DCLHEAD.kodtop
  is 'KODTOP';
comment on column EXP_DBF_DCLHEAD.g071top
  is 'G071TOP';
comment on column EXP_DBF_DCLHEAD.g072top
  is 'G072TOP';
comment on column EXP_DBF_DCLHEAD.g073top
  is 'G073TOP';
comment on column EXP_DBF_DCLHEAD.typdtop
  is 'TYPDTOP';
comment on column EXP_DBF_DCLHEAD.numdtop
  is 'NUMDTOP';
comment on column EXP_DBF_DCLHEAD.datdtop
  is 'DATDTOP';
comment on column EXP_DBF_DCLHEAD.fiotop
  is 'FIOTOP';
comment on column EXP_DBF_DCLHEAD.dattop
  is 'DATTOP';
comment on column EXP_DBF_DCLHEAD.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLHEAD.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLHEAD.gd5lnp
  is 'GD5LNP';
comment on column EXP_DBF_DCLHEAD.gd5
  is 'GD5';
comment on column EXP_DBF_DCLHEAD.g5452
  is 'G5452';
comment on column EXP_DBF_DCLHEAD.gb_kd
  is 'GB_KD';
comment on column EXP_DBF_DCLHEAD.gb_rub
  is 'GB_RUB';
comment on column EXP_DBF_DCLHEAD.g474_rub
  is 'G474_RUB';
comment on column EXP_DBF_DCLHEAD.g204
  is 'G204';
comment on column EXP_DBF_DCLHEAD.g146d
  is 'G146D';
comment on column EXP_DBF_DCLHEAD.g146a
  is 'G146A';
comment on column EXP_DBF_DCLHEAD.g096d
  is 'G096D';
comment on column EXP_DBF_DCLHEAD.g096a
  is 'G096A';
comment on column EXP_DBF_DCLHEAD.g086d
  is 'G086D';
comment on column EXP_DBF_DCLHEAD.g086a
  is 'G086A';
comment on column EXP_DBF_DCLHEAD.g026d
  is 'G026D';
comment on column EXP_DBF_DCLHEAD.g026a
  is 'G026A';
comment on column EXP_DBF_DCLHEAD.lnpbegctrl
  is 'LNPBEGCTRL';
comment on column EXP_DBF_DCLHEAD.tbegctrl
  is 'TBEGCTRL';
comment on column EXP_DBF_DCLHEAD.dbegctrl
  is 'DBEGCTRL';
comment on column EXP_DBF_DCLHEAD.tpriem
  is 'TPRIEM';
comment on column EXP_DBF_DCLHEAD.id
  is 'ID';
comment on column EXP_DBF_DCLHEAD.load_id
  is 'LOAD_ID';
comment on column EXP_DBF_DCLHEAD.p_status1
  is 'P_STATUS1';
comment on column EXP_DBF_DCLHEAD.p_status2
  is 'P_STATUS2';
comment on column EXP_DBF_DCLHEAD.edoc_id
  is 'EDOC_ID';
comment on column EXP_DBF_DCLHEAD.edoc_guid
  is 'EDOC_GUID';
comment on column EXP_DBF_DCLHEAD.complectbl
  is 'COMPLECTBL';
comment on column EXP_DBF_DCLHEAD.g0121
  is 'G0121';
comment on column EXP_DBF_DCLHEAD.g023post
  is 'G023POST';
comment on column EXP_DBF_DCLHEAD.g0231c
  is 'G0231C';
comment on column EXP_DBF_DCLHEAD.g023subd
  is 'G023SUBD';
comment on column EXP_DBF_DCLHEAD.g023city
  is 'G023CITY';
comment on column EXP_DBF_DCLHEAD.g023street
  is 'G023STREET';
comment on column EXP_DBF_DCLHEAD.g040
  is 'G040';
comment on column EXP_DBF_DCLHEAD.g07
  is 'G07';
comment on column EXP_DBF_DCLHEAD.g083post
  is 'G083POST';
comment on column EXP_DBF_DCLHEAD.g0831c
  is 'G0831C';
comment on column EXP_DBF_DCLHEAD.g083subd
  is 'G083SUBD';
comment on column EXP_DBF_DCLHEAD.g083city
  is 'G083CITY';
comment on column EXP_DBF_DCLHEAD.g083street
  is 'G083STREET';
comment on column EXP_DBF_DCLHEAD.g093post
  is 'G093POST';
comment on column EXP_DBF_DCLHEAD.g0931
  is 'G0931';
comment on column EXP_DBF_DCLHEAD.g093subd
  is 'G093SUBD';
comment on column EXP_DBF_DCLHEAD.g093city
  is 'G093CITY';
comment on column EXP_DBF_DCLHEAD.g093street
  is 'G093STREET';
comment on column EXP_DBF_DCLHEAD.g093apost
  is 'G093APOST';
comment on column EXP_DBF_DCLHEAD.g0931a
  is 'G0931A';
comment on column EXP_DBF_DCLHEAD.g093asubd
  is 'G093ASUBD';
comment on column EXP_DBF_DCLHEAD.g093acity
  is 'G093ACITY';
comment on column EXP_DBF_DCLHEAD.g093astree
  is 'G093ASTREE';
comment on column EXP_DBF_DCLHEAD.g11c
  is 'G11C';
comment on column EXP_DBF_DCLHEAD.g143post
  is 'G143POST';
comment on column EXP_DBF_DCLHEAD.g1431
  is 'G1431';
comment on column EXP_DBF_DCLHEAD.g143subd
  is 'G143SUBD';
comment on column EXP_DBF_DCLHEAD.g143city
  is 'G143CITY';
comment on column EXP_DBF_DCLHEAD.g143street
  is 'G143STREET';
comment on column EXP_DBF_DCLHEAD.g143apost
  is 'G143APOST';
comment on column EXP_DBF_DCLHEAD.g1431a
  is 'G1431A';
comment on column EXP_DBF_DCLHEAD.g143asubd
  is 'G143ASUBD';
comment on column EXP_DBF_DCLHEAD.g143acity
  is 'G143ACITY';
comment on column EXP_DBF_DCLHEAD.g143astree
  is 'G143ASTREE';
comment on column EXP_DBF_DCLHEAD.g15ac
  is 'G15AC';
comment on column EXP_DBF_DCLHEAD.g160
  is 'G160';
comment on column EXP_DBF_DCLHEAD.g161
  is 'G161';
comment on column EXP_DBF_DCLHEAD.g17ac
  is 'G17AC';
comment on column EXP_DBF_DCLHEAD.g221c
  is 'G221C';
comment on column EXP_DBF_DCLHEAD.g2810
  is 'G2810';
comment on column EXP_DBF_DCLHEAD.g28okpo
  is 'G28OKPO';
comment on column EXP_DBF_DCLHEAD.g28inn
  is 'G28INN';
comment on column EXP_DBF_DCLHEAD.g28gtd_1
  is 'G28GTD_1';
comment on column EXP_DBF_DCLHEAD.g28gtd_2
  is 'G28GTD_2';
comment on column EXP_DBF_DCLHEAD.g28gtd_3
  is 'G28GTD_3';
comment on column EXP_DBF_DCLHEAD.g281oth
  is 'G281OTH';
comment on column EXP_DBF_DCLHEAD.g28zajmb
  is 'G28ZAJMB';
comment on column EXP_DBF_DCLHEAD.g28zajmn
  is 'G28ZAJMN';
comment on column EXP_DBF_DCLHEAD.g28211
  is 'G28211';
comment on column EXP_DBF_DCLHEAD.g28212
  is 'G28212';
comment on column EXP_DBF_DCLHEAD.g28221
  is 'G28221';
comment on column EXP_DBF_DCLHEAD.g28222
  is 'G28222';
comment on column EXP_DBF_DCLHEAD.g2823
  is 'G2823';
comment on column EXP_DBF_DCLHEAD.g2824
  is 'G2824';
comment on column EXP_DBF_DCLHEAD.g2825
  is 'G2825';
comment on column EXP_DBF_DCLHEAD.g30_itn
  is 'G30_ITN';
comment on column EXP_DBF_DCLHEAD.g300
  is 'G300';
comment on column EXP_DBF_DCLHEAD.g3010
  is 'G3010';
comment on column EXP_DBF_DCLHEAD.g301
  is 'G301';
comment on column EXP_DBF_DCLHEAD.g30
  is 'G30';
comment on column EXP_DBF_DCLHEAD.g30subd
  is 'G30SUBD';
comment on column EXP_DBF_DCLHEAD.g30city
  is 'G30CITY';
comment on column EXP_DBF_DCLHEAD.g30street
  is 'G30STREET';
comment on column EXP_DBF_DCLHEAD.g3012
  is 'G3012';
comment on column EXP_DBF_DCLHEAD.recpasp
  is 'RECPASP';
comment on column EXP_DBF_DCLHEAD.frm_decl
  is 'FRM_DECL';
comment on column EXP_DBF_DCLHEAD.ed_idid
  is 'ED_IDID';
comment on column EXP_DBF_DCLHEAD.g28230
  is 'G28230';
comment on column EXP_DBF_DCLHEAD.g28240
  is 'G28240';
comment on column EXP_DBF_DCLHEAD.ed_ididkmp
  is 'ED_IDIDKMP';
comment on column EXP_DBF_DCLHEAD.ed_ididcnt
  is 'ED_IDIDCNT';

prompt
prompt Creating table EXP_DBF_DCLPLATR
prompt ===============================
prompt
create table EXP_DBF_DCLPLATR
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  g32       FLOAT,
  g470      NUMBER(1),
  g471      VARCHAR2(3),
  g47_k     VARCHAR2(2),
  g472      FLOAT,
  g4721     VARCHAR2(3),
  g473      FLOAT,
  g4731     VARCHAR2(1),
  g4732     VARCHAR2(3),
  g4733     VARCHAR2(3),
  g4734     FLOAT,
  npp       FLOAT,
  g474      FLOAT,
  g4741     VARCHAR2(3),
  g475      VARCHAR2(2),
  g473z1_2  VARCHAR2(1),
  g473_2    FLOAT,
  g4731_2   VARCHAR2(1),
  g4732_2   VARCHAR2(3),
  g4733_2   VARCHAR2(3),
  g4734_2   FLOAT,
  g473z1_3  VARCHAR2(1),
  g473_3    FLOAT,
  g4731_3   VARCHAR2(1),
  g4732_3   VARCHAR2(3),
  g4733_3   VARCHAR2(3),
  g4734_3   FLOAT,
  g473z2_2  FLOAT,
  g4730     DATE,
  g4740     DATE,
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  id        INTEGER not null
)
;
comment on table EXP_DBF_DCLPLATR
  is '������� EXP_DBF_DCLPLATR';
comment on column EXP_DBF_DCLPLATR.g071
  is 'G071';
comment on column EXP_DBF_DCLPLATR.g072
  is 'G072';
comment on column EXP_DBF_DCLPLATR.g073
  is 'G073';
comment on column EXP_DBF_DCLPLATR.g32
  is 'G32';
comment on column EXP_DBF_DCLPLATR.g470
  is 'G470';
comment on column EXP_DBF_DCLPLATR.g471
  is 'G471';
comment on column EXP_DBF_DCLPLATR.g47_k
  is 'G47_K';
comment on column EXP_DBF_DCLPLATR.g472
  is 'G472';
comment on column EXP_DBF_DCLPLATR.g4721
  is 'G4721';
comment on column EXP_DBF_DCLPLATR.g473
  is 'G473';
comment on column EXP_DBF_DCLPLATR.g4731
  is 'G4731';
comment on column EXP_DBF_DCLPLATR.g4732
  is 'G4732';
comment on column EXP_DBF_DCLPLATR.g4733
  is 'G4733';
comment on column EXP_DBF_DCLPLATR.g4734
  is 'G4734';
comment on column EXP_DBF_DCLPLATR.npp
  is 'NPP';
comment on column EXP_DBF_DCLPLATR.g474
  is 'G474';
comment on column EXP_DBF_DCLPLATR.g4741
  is 'G4741';
comment on column EXP_DBF_DCLPLATR.g475
  is 'G475';
comment on column EXP_DBF_DCLPLATR.g473z1_2
  is 'G473Z1_2';
comment on column EXP_DBF_DCLPLATR.g473_2
  is 'G473_2';
comment on column EXP_DBF_DCLPLATR.g4731_2
  is 'G4731_2';
comment on column EXP_DBF_DCLPLATR.g4732_2
  is 'G4732_2';
comment on column EXP_DBF_DCLPLATR.g4733_2
  is 'G4733_2';
comment on column EXP_DBF_DCLPLATR.g4734_2
  is 'G4734_2';
comment on column EXP_DBF_DCLPLATR.g473z1_3
  is 'G473Z1_3';
comment on column EXP_DBF_DCLPLATR.g473_3
  is 'G473_3';
comment on column EXP_DBF_DCLPLATR.g4731_3
  is 'G4731_3';
comment on column EXP_DBF_DCLPLATR.g4732_3
  is 'G4732_3';
comment on column EXP_DBF_DCLPLATR.g4733_3
  is 'G4733_3';
comment on column EXP_DBF_DCLPLATR.g4734_3
  is 'G4734_3';
comment on column EXP_DBF_DCLPLATR.g473z2_2
  is 'G473Z2_2';
comment on column EXP_DBF_DCLPLATR.g4730
  is 'G4730';
comment on column EXP_DBF_DCLPLATR.g4740
  is 'G4740';
comment on column EXP_DBF_DCLPLATR.nzp
  is 'NZP';
comment on column EXP_DBF_DCLPLATR.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLPLATR.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLPLATR.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLPLATR.id
  is 'ID';

prompt
prompt Creating table EXP_DBF_DCLPLATV
prompt ===============================
prompt
create table EXP_DBF_DCLPLATV
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  gb0       NUMBER(1),
  gb1       VARCHAR2(3),
  gb_k      VARCHAR2(2),
  gb1_1     NUMBER(1),
  gb2       FLOAT,
  gb3       VARCHAR2(3),
  gb4       FLOAT,
  gb5       VARCHAR2(2),
  iret      FLOAT,
  g48       DATE,
  g481      VARCHAR2(1),
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  g482      VARCHAR2(50),
  g482d     DATE
)
;
comment on table EXP_DBF_DCLPLATV
  is '������� EXP_DBF_DCLPLATV';
comment on column EXP_DBF_DCLPLATV.g071
  is 'G071';
comment on column EXP_DBF_DCLPLATV.g072
  is 'G072';
comment on column EXP_DBF_DCLPLATV.g073
  is 'G073';
comment on column EXP_DBF_DCLPLATV.gb0
  is 'GB0';
comment on column EXP_DBF_DCLPLATV.gb1
  is 'GB1';
comment on column EXP_DBF_DCLPLATV.gb_k
  is 'GB_K';
comment on column EXP_DBF_DCLPLATV.gb1_1
  is 'GB1_1';
comment on column EXP_DBF_DCLPLATV.gb2
  is 'GB2';
comment on column EXP_DBF_DCLPLATV.gb3
  is 'GB3';
comment on column EXP_DBF_DCLPLATV.gb4
  is 'GB4';
comment on column EXP_DBF_DCLPLATV.gb5
  is 'GB5';
comment on column EXP_DBF_DCLPLATV.iret
  is 'IRET';
comment on column EXP_DBF_DCLPLATV.g48
  is 'G48';
comment on column EXP_DBF_DCLPLATV.g481
  is 'G481';
comment on column EXP_DBF_DCLPLATV.nzp
  is 'NZP';
comment on column EXP_DBF_DCLPLATV.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLPLATV.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLPLATV.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLPLATV.g482
  is 'G482';
comment on column EXP_DBF_DCLPLATV.g482d
  is 'G482D';

prompt
prompt Creating table EXP_DBF_DCLPREDD
prompt ===============================
prompt
create table EXP_DBF_DCLPREDD
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  g32       FLOAT not null,
  g40_0     VARCHAR2(2),
  g40_1     VARCHAR2(8) not null,
  g40_2     DATE not null,
  g40_3     VARCHAR2(7) not null,
  g40_4     FLOAT not null,
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  id        INTEGER,
  p_edoc_id NUMBER(19),
  g40_21    VARCHAR2(2),
  g40_naim  VARCHAR2(250)
)
;
comment on table EXP_DBF_DCLPREDD
  is '������� EXP_DBF_DCLPREDD';
comment on column EXP_DBF_DCLPREDD.g071
  is 'G071';
comment on column EXP_DBF_DCLPREDD.g072
  is 'G072';
comment on column EXP_DBF_DCLPREDD.g073
  is 'G073';
comment on column EXP_DBF_DCLPREDD.g32
  is 'G32';
comment on column EXP_DBF_DCLPREDD.g40_0
  is 'G40_0';
comment on column EXP_DBF_DCLPREDD.g40_1
  is 'G40_1';
comment on column EXP_DBF_DCLPREDD.g40_2
  is 'G40_2';
comment on column EXP_DBF_DCLPREDD.g40_3
  is 'G40_3';
comment on column EXP_DBF_DCLPREDD.g40_4
  is 'G40_4';
comment on column EXP_DBF_DCLPREDD.nzp
  is 'NZP';
comment on column EXP_DBF_DCLPREDD.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLPREDD.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLPREDD.id
  is 'ID';
comment on column EXP_DBF_DCLPREDD.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLPREDD.g40_21
  is 'G40_21';
comment on column EXP_DBF_DCLPREDD.g40_naim
  is 'G40_NAIM';

prompt
prompt Creating table EXP_DBF_DCLSLOTM
prompt ===============================
prompt
create table EXP_DBF_DCLSLOTM
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  ngr       VARCHAR2(2),
  gc_01     VARCHAR2(1),
  gc_02     VARCHAR2(2),
  gc_03     VARCHAR2(1),
  nrecc     FLOAT,
  krecc     VARCHAR2(2),
  gc_1      VARCHAR2(150),
  gc_2      DATE,
  gc_21     VARCHAR2(8),
  gc_3      FLOAT,
  gc_31     VARCHAR2(3),
  gc_32     FLOAT,
  gc_4      VARCHAR2(3),
  gc_5      VARCHAR2(17),
  gc_6      VARCHAR2(4),
  gc_7      VARCHAR2(40),
  gc_8      DATE,
  gc_81     VARCHAR2(8),
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id FLOAT,
  gc_doc    VARCHAR2(50),
  gc_docd   DATE,
  gc_9      DATE,
  gc_nm_itn VARCHAR2(13),
  gc_nm     VARCHAR2(150),
  gc_ogrn   VARCHAR2(15),
  gc_inn    VARCHAR2(12),
  gc_kpp    VARCHAR2(9),
  gc_ktam   VARCHAR2(8),
  gc_10     DATE,
  gc_doc0   VARCHAR2(1),
  gc_9m     VARCHAR2(10)
)
;
comment on table EXP_DBF_DCLSLOTM
  is '������� EXP_DBF_DCLSLOTM';
comment on column EXP_DBF_DCLSLOTM.g071
  is 'G071';
comment on column EXP_DBF_DCLSLOTM.g072
  is 'G072';
comment on column EXP_DBF_DCLSLOTM.g073
  is 'G073';
comment on column EXP_DBF_DCLSLOTM.ngr
  is 'NGR';
comment on column EXP_DBF_DCLSLOTM.gc_01
  is 'GC_01';
comment on column EXP_DBF_DCLSLOTM.gc_02
  is 'GC_02';
comment on column EXP_DBF_DCLSLOTM.gc_03
  is 'GC_03';
comment on column EXP_DBF_DCLSLOTM.nrecc
  is 'NRECC';
comment on column EXP_DBF_DCLSLOTM.krecc
  is 'KRECC';
comment on column EXP_DBF_DCLSLOTM.gc_1
  is 'GC_1';
comment on column EXP_DBF_DCLSLOTM.gc_2
  is 'GC_2';
comment on column EXP_DBF_DCLSLOTM.gc_21
  is 'GC_21';
comment on column EXP_DBF_DCLSLOTM.gc_3
  is 'GC_3';
comment on column EXP_DBF_DCLSLOTM.gc_31
  is 'GC_31';
comment on column EXP_DBF_DCLSLOTM.gc_32
  is 'GC_32';
comment on column EXP_DBF_DCLSLOTM.gc_4
  is 'GC_4';
comment on column EXP_DBF_DCLSLOTM.gc_5
  is 'GC_5';
comment on column EXP_DBF_DCLSLOTM.gc_6
  is 'GC_6';
comment on column EXP_DBF_DCLSLOTM.gc_7
  is 'GC_7';
comment on column EXP_DBF_DCLSLOTM.gc_8
  is 'GC_8';
comment on column EXP_DBF_DCLSLOTM.gc_81
  is 'GC_81';
comment on column EXP_DBF_DCLSLOTM.nzp
  is 'NZP';
comment on column EXP_DBF_DCLSLOTM.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLSLOTM.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLSLOTM.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLSLOTM.gc_doc
  is 'GC_DOC';
comment on column EXP_DBF_DCLSLOTM.gc_docd
  is 'GC_DOCD';
comment on column EXP_DBF_DCLSLOTM.gc_9
  is 'GC_9';
comment on column EXP_DBF_DCLSLOTM.gc_nm_itn
  is 'GC_NM_ITN';
comment on column EXP_DBF_DCLSLOTM.gc_nm
  is 'GC_NM';
comment on column EXP_DBF_DCLSLOTM.gc_ogrn
  is 'GC_OGRN';
comment on column EXP_DBF_DCLSLOTM.gc_inn
  is 'GC_INN';
comment on column EXP_DBF_DCLSLOTM.gc_kpp
  is 'GC_KPP';
comment on column EXP_DBF_DCLSLOTM.gc_ktam
  is 'GC_KTAM';
comment on column EXP_DBF_DCLSLOTM.gc_10
  is 'GC_10';
comment on column EXP_DBF_DCLSLOTM.gc_doc0
  is 'GC_DOC0';
comment on column EXP_DBF_DCLSLOTM.gc_9m
  is 'GC_9M';

prompt
prompt Creating table EXP_DBF_DCLSUMPP
prompt ===============================
prompt
create table EXP_DBF_DCLSUMPP
(
  id        INTEGER not null,
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  gb1       VARCHAR2(3),
  gb1_1     VARCHAR2(1),
  gb3       VARCHAR2(3),
  iret      NUMBER(2),
  numpdok   VARCHAR2(50),
  datpdok   DATE,
  sum_all   NUMBER(17,2),
  sumpdok   NUMBER(17,2),
  valpdok   VARCHAR2(3),
  datpostd  DATE,
  innplat   VARCHAR2(12),
  kppplat   VARCHAR2(9),
  okpoplat  VARCHAR2(10),
  lnpins    VARCHAR2(4),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER(19),
  fioins    VARCHAR2(40),
  datins    DATE,
  timins    VARCHAR2(8)
)
;
comment on table EXP_DBF_DCLSUMPP
  is '������� EXP_DBF_DCLSUMPP';
comment on column EXP_DBF_DCLSUMPP.id
  is 'ID';
comment on column EXP_DBF_DCLSUMPP.g071
  is 'G071';
comment on column EXP_DBF_DCLSUMPP.g072
  is 'G072';
comment on column EXP_DBF_DCLSUMPP.g073
  is 'G073';
comment on column EXP_DBF_DCLSUMPP.gb1
  is 'GB1';
comment on column EXP_DBF_DCLSUMPP.gb1_1
  is 'GB1_1';
comment on column EXP_DBF_DCLSUMPP.gb3
  is 'GB3';
comment on column EXP_DBF_DCLSUMPP.iret
  is 'IRET';
comment on column EXP_DBF_DCLSUMPP.numpdok
  is 'NUMPDOK';
comment on column EXP_DBF_DCLSUMPP.datpdok
  is 'DATPDOK';
comment on column EXP_DBF_DCLSUMPP.sum_all
  is 'SUM_ALL';
comment on column EXP_DBF_DCLSUMPP.sumpdok
  is 'SUMPDOK';
comment on column EXP_DBF_DCLSUMPP.valpdok
  is 'VALPDOK';
comment on column EXP_DBF_DCLSUMPP.datpostd
  is 'DATPOSTD';
comment on column EXP_DBF_DCLSUMPP.innplat
  is 'INNPLAT';
comment on column EXP_DBF_DCLSUMPP.kppplat
  is 'KPPPLAT';
comment on column EXP_DBF_DCLSUMPP.okpoplat
  is 'OKPOPLAT';
comment on column EXP_DBF_DCLSUMPP.lnpins
  is 'LNPINS';
comment on column EXP_DBF_DCLSUMPP.nzp
  is 'NZP';
comment on column EXP_DBF_DCLSUMPP.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLSUMPP.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLSUMPP.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLSUMPP.fioins
  is 'FIOINS';
comment on column EXP_DBF_DCLSUMPP.datins
  is 'DATINS';
comment on column EXP_DBF_DCLSUMPP.timins
  is 'TIMINS';

prompt
prompt Creating table EXP_DBF_DCLTECHD
prompt ===============================
prompt
create table EXP_DBF_DCLTECHD
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  g32       FLOAT,
  g4401     FLOAT,
  g4402     FLOAT,
  g4403     VARCHAR2(1),
  g440      VARCHAR2(3),
  g441      VARCHAR2(4),
  g441a     VARCHAR2(2),
  g442      VARCHAR2(50),
  g442r     VARCHAR2(28),
  g443      DATE,
  g444      VARCHAR2(250),
  g445      VARCHAR2(150),
  g446      DATE,
  g447      DATE,
  g4480et   VARCHAR2(10),
  g4481et   DATE,
  g44s      FLOAT,
  g44kv     VARCHAR2(3),
  g44nv     VARCHAR2(17),
  g44okpo   VARCHAR2(10),
  g44dd     DATE,
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  g449      VARCHAR2(8),
  g442a     VARCHAR2(1),
  id        INTEGER,
  p_edoc_id NUMBER(19),
  g44020    VARCHAR2(1),
  g4491     DATE,
  g4492     DATE,
  g4493     VARCHAR2(2)
)
;
comment on table EXP_DBF_DCLTECHD
  is '������� EXP_DBF_DCLTECHD';
comment on column EXP_DBF_DCLTECHD.g071
  is 'G071';
comment on column EXP_DBF_DCLTECHD.g072
  is 'G072';
comment on column EXP_DBF_DCLTECHD.g073
  is 'G073';
comment on column EXP_DBF_DCLTECHD.g32
  is 'G32';
comment on column EXP_DBF_DCLTECHD.g4401
  is 'G4401';
comment on column EXP_DBF_DCLTECHD.g4402
  is 'G4402';
comment on column EXP_DBF_DCLTECHD.g4403
  is 'G4403';
comment on column EXP_DBF_DCLTECHD.g440
  is 'G440';
comment on column EXP_DBF_DCLTECHD.g441
  is 'G441';
comment on column EXP_DBF_DCLTECHD.g441a
  is 'G441A';
comment on column EXP_DBF_DCLTECHD.g442
  is 'G442';
comment on column EXP_DBF_DCLTECHD.g442r
  is 'G442R';
comment on column EXP_DBF_DCLTECHD.g443
  is 'G443';
comment on column EXP_DBF_DCLTECHD.g444
  is 'G444';
comment on column EXP_DBF_DCLTECHD.g445
  is 'G445';
comment on column EXP_DBF_DCLTECHD.g446
  is 'G446';
comment on column EXP_DBF_DCLTECHD.g447
  is 'G447';
comment on column EXP_DBF_DCLTECHD.g4480et
  is 'G4480ET';
comment on column EXP_DBF_DCLTECHD.g4481et
  is 'G4481ET';
comment on column EXP_DBF_DCLTECHD.g44s
  is 'G44S';
comment on column EXP_DBF_DCLTECHD.g44kv
  is 'G44KV';
comment on column EXP_DBF_DCLTECHD.g44nv
  is 'G44NV';
comment on column EXP_DBF_DCLTECHD.g44okpo
  is 'G44OKPO';
comment on column EXP_DBF_DCLTECHD.g44dd
  is 'G44DD';
comment on column EXP_DBF_DCLTECHD.nzp
  is 'NZP';
comment on column EXP_DBF_DCLTECHD.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLTECHD.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLTECHD.g449
  is 'G449';
comment on column EXP_DBF_DCLTECHD.g442a
  is 'G442A';
comment on column EXP_DBF_DCLTECHD.id
  is 'ID';
comment on column EXP_DBF_DCLTECHD.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLTECHD.g44020
  is 'G44020';
comment on column EXP_DBF_DCLTECHD.g4491
  is 'G4491';
comment on column EXP_DBF_DCLTECHD.g4492
  is 'G4492';
comment on column EXP_DBF_DCLTECHD.g4493
  is 'G4493';

prompt
prompt Creating table EXP_DBF_DCLTOVAR
prompt ===============================
prompt
create table EXP_DBF_DCLTOVAR
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  g020      VARCHAR2(15),
  g02_itn   VARCHAR2(13),
  g021      VARCHAR2(12),
  g022      VARCHAR2(150),
  g022a     VARCHAR2(80),
  g023      VARCHAR2(80),
  g0231     VARCHAR2(3),
  g0231a    VARCHAR2(35),
  g023a     VARCHAR2(80),
  g024a     VARCHAR2(2),
  g024p     VARCHAR2(1),
  g024b     VARCHAR2(5),
  g024c     VARCHAR2(10),
  g024n     VARCHAR2(10),
  g024in    VARCHAR2(12),
  g027      VARCHAR2(9),
  g0281     VARCHAR2(2),
  g0281a    VARCHAR2(6),
  g02821    VARCHAR2(11),
  g02822    VARCHAR2(25),
  g02823    VARCHAR2(150),
  g0283     DATE,
  g029      VARCHAR2(1),
  g031      FLOAT,
  g30       VARCHAR2(15),
  g31_1     VARCHAR2(250),
  g31_10    VARCHAR2(4),
  g31_11    VARCHAR2(50),
  g31_12    VARCHAR2(50),
  g31_13    VARCHAR2(35),
  g31_2     NUMBER(8),
  g31_21    VARCHAR2(150),
  g31_22    FLOAT,
  g31_23    VARCHAR2(150),
  g31_3     FLOAT,
  g31_4     VARCHAR2(12),
  g31_41    FLOAT,
  g31_5     VARCHAR2(70),
  g31_6     VARCHAR2(2),
  g31_7     FLOAT,
  g31_71    VARCHAR2(13),
  g31_8     FLOAT,
  g31_81    VARCHAR2(13),
  g31_82    VARCHAR2(3),
  g31_9     FLOAT,
  g31_91    VARCHAR2(13),
  g31_92    VARCHAR2(3),
  g31_d1    DATE,
  g31_d2    DATE,
  g32       FLOAT not null,
  g33       VARCHAR2(10),
  g330      VARCHAR2(1),
  g331      VARCHAR2(1),
  g332      VARCHAR2(1),
  g34       VARCHAR2(3),
  g35       FLOAT,
  g36       VARCHAR2(4),
  g37       VARCHAR2(6),
  g372      VARCHAR2(1),
  g38       FLOAT,
  g39       FLOAT,
  g3911     VARCHAR2(3),
  g3912     VARCHAR2(3),
  g392      VARCHAR2(17),
  g41a      VARCHAR2(3),
  g42       FLOAT,
  g43       VARCHAR2(1),
  g430      VARCHAR2(2),
  g45       FLOAT,
  g451      VARCHAR2(2),
  g46       FLOAT,
  nblank    VARCHAR2(10),
  gd0       VARCHAR2(2),
  gd1       DATE,
  gd11      VARCHAR2(8),
  gd2       VARCHAR2(4),
  gd00      VARCHAR2(150),
  kod_str   VARCHAR2(3),
  dstat     DATE,
  stat      VARCHAR2(1),
  recplatr  FLOAT,
  rectechd  FLOAT,
  recpredd  FLOAT,
  recavtmb  FLOAT,
  recsltov  FLOAT,
  recrisk   FLOAT,
  recvrsk   FLOAT,
  recddtec  FLOAT,
  nzp       FLOAT,
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  gb_kd     NUMBER,
  g474_rub  NUMBER,
  gb_rub    NUMBER,
  g30a      VARCHAR2(3),
  g026a     VARCHAR2(15),
  g026d     DATE,
  id        INTEGER,
  p_edoc_id NUMBER(19),
  g31_14    VARCHAR2(60),
  g31_401   NUMBER(8),
  g31_402   NUMBER(8),
  g31_20    VARCHAR2(1),
  g340      VARCHAR2(1),
  g34c      VARCHAR2(3),
  g461      VARCHAR2(1),
  kod_strc  VARCHAR2(3),
  recpk     NUMBER(8),
  recamnum  NUMBER(8),
  recdog    NUMBER(8),
  recdoga   NUMBER(8),
  recdogt   NUMBER(8),
  recuslt   NUMBER(8),
  rectovg   NUMBER(8),
  reckmp    FLOAT,
  g31_2part NUMBER(8),
  recterms  NUMBER(8),
  fksign    VARCHAR2(1),
  g333      VARCHAR2(4),
  rectov2   NUMBER(22,8),
  recplat2  NUMBER(22,8),
  recdinf2  NUMBER(22,8),
  rectovg2  NUMBER(22,8)
)
;
comment on table EXP_DBF_DCLTOVAR
  is '������� EXP_DBF_DCLTOVAR';
comment on column EXP_DBF_DCLTOVAR.g071
  is 'G071';
comment on column EXP_DBF_DCLTOVAR.g072
  is 'G072';
comment on column EXP_DBF_DCLTOVAR.g073
  is 'G073';
comment on column EXP_DBF_DCLTOVAR.g020
  is 'G020';
comment on column EXP_DBF_DCLTOVAR.g02_itn
  is 'G02_ITN';
comment on column EXP_DBF_DCLTOVAR.g021
  is 'G021';
comment on column EXP_DBF_DCLTOVAR.g022
  is 'G022';
comment on column EXP_DBF_DCLTOVAR.g022a
  is 'G022A';
comment on column EXP_DBF_DCLTOVAR.g023
  is 'G023';
comment on column EXP_DBF_DCLTOVAR.g0231
  is 'G0231';
comment on column EXP_DBF_DCLTOVAR.g0231a
  is 'G0231A';
comment on column EXP_DBF_DCLTOVAR.g023a
  is 'G023A';
comment on column EXP_DBF_DCLTOVAR.g024a
  is 'G024A';
comment on column EXP_DBF_DCLTOVAR.g024p
  is 'G024P';
comment on column EXP_DBF_DCLTOVAR.g024b
  is 'G024B';
comment on column EXP_DBF_DCLTOVAR.g024c
  is 'G024C';
comment on column EXP_DBF_DCLTOVAR.g024n
  is 'G024N';
comment on column EXP_DBF_DCLTOVAR.g024in
  is 'G024IN';
comment on column EXP_DBF_DCLTOVAR.g027
  is 'G027';
comment on column EXP_DBF_DCLTOVAR.g0281
  is 'G0281';
comment on column EXP_DBF_DCLTOVAR.g0281a
  is 'G0281A';
comment on column EXP_DBF_DCLTOVAR.g02821
  is 'G02821';
comment on column EXP_DBF_DCLTOVAR.g02822
  is 'G02822';
comment on column EXP_DBF_DCLTOVAR.g02823
  is 'G02823';
comment on column EXP_DBF_DCLTOVAR.g0283
  is 'G0283';
comment on column EXP_DBF_DCLTOVAR.g029
  is 'G029';
comment on column EXP_DBF_DCLTOVAR.g031
  is 'G031';
comment on column EXP_DBF_DCLTOVAR.g30
  is 'G30';
comment on column EXP_DBF_DCLTOVAR.g31_1
  is 'G31_1';
comment on column EXP_DBF_DCLTOVAR.g31_10
  is 'G31_10';
comment on column EXP_DBF_DCLTOVAR.g31_11
  is 'G31_11';
comment on column EXP_DBF_DCLTOVAR.g31_12
  is 'G31_12';
comment on column EXP_DBF_DCLTOVAR.g31_13
  is 'G31_13';
comment on column EXP_DBF_DCLTOVAR.g31_2
  is 'G31_2';
comment on column EXP_DBF_DCLTOVAR.g31_21
  is 'G31_21';
comment on column EXP_DBF_DCLTOVAR.g31_22
  is 'G31_22';
comment on column EXP_DBF_DCLTOVAR.g31_23
  is 'G31_23';
comment on column EXP_DBF_DCLTOVAR.g31_3
  is 'G31_3';
comment on column EXP_DBF_DCLTOVAR.g31_4
  is 'G31_4';
comment on column EXP_DBF_DCLTOVAR.g31_41
  is 'G31_41';
comment on column EXP_DBF_DCLTOVAR.g31_5
  is 'G31_5';
comment on column EXP_DBF_DCLTOVAR.g31_6
  is 'G31_6';
comment on column EXP_DBF_DCLTOVAR.g31_7
  is 'G31_7';
comment on column EXP_DBF_DCLTOVAR.g31_71
  is 'G31_71';
comment on column EXP_DBF_DCLTOVAR.g31_8
  is 'G31_8';
comment on column EXP_DBF_DCLTOVAR.g31_81
  is 'G31_81';
comment on column EXP_DBF_DCLTOVAR.g31_82
  is 'G31_82';
comment on column EXP_DBF_DCLTOVAR.g31_9
  is 'G31_9';
comment on column EXP_DBF_DCLTOVAR.g31_91
  is 'G31_91';
comment on column EXP_DBF_DCLTOVAR.g31_92
  is 'G31_92';
comment on column EXP_DBF_DCLTOVAR.g31_d1
  is 'G31_D1';
comment on column EXP_DBF_DCLTOVAR.g31_d2
  is 'G31_D2';
comment on column EXP_DBF_DCLTOVAR.g32
  is 'G32';
comment on column EXP_DBF_DCLTOVAR.g33
  is 'G33';
comment on column EXP_DBF_DCLTOVAR.g330
  is 'G330';
comment on column EXP_DBF_DCLTOVAR.g331
  is 'G331';
comment on column EXP_DBF_DCLTOVAR.g332
  is 'G332';
comment on column EXP_DBF_DCLTOVAR.g34
  is 'G34';
comment on column EXP_DBF_DCLTOVAR.g35
  is 'G35';
comment on column EXP_DBF_DCLTOVAR.g36
  is 'G36';
comment on column EXP_DBF_DCLTOVAR.g37
  is 'G37';
comment on column EXP_DBF_DCLTOVAR.g372
  is 'G372';
comment on column EXP_DBF_DCLTOVAR.g38
  is 'G38';
comment on column EXP_DBF_DCLTOVAR.g39
  is 'G39';
comment on column EXP_DBF_DCLTOVAR.g3911
  is 'G3911';
comment on column EXP_DBF_DCLTOVAR.g3912
  is 'G3912';
comment on column EXP_DBF_DCLTOVAR.g392
  is 'G392';
comment on column EXP_DBF_DCLTOVAR.g41a
  is 'G41A';
comment on column EXP_DBF_DCLTOVAR.g42
  is 'G42';
comment on column EXP_DBF_DCLTOVAR.g43
  is 'G43';
comment on column EXP_DBF_DCLTOVAR.g430
  is 'G430';
comment on column EXP_DBF_DCLTOVAR.g45
  is 'G45';
comment on column EXP_DBF_DCLTOVAR.g451
  is 'G451';
comment on column EXP_DBF_DCLTOVAR.g46
  is 'G46';
comment on column EXP_DBF_DCLTOVAR.nblank
  is 'NBLANK';
comment on column EXP_DBF_DCLTOVAR.gd0
  is 'GD0';
comment on column EXP_DBF_DCLTOVAR.gd1
  is 'GD1';
comment on column EXP_DBF_DCLTOVAR.gd11
  is 'GD11';
comment on column EXP_DBF_DCLTOVAR.gd2
  is 'GD2';
comment on column EXP_DBF_DCLTOVAR.gd00
  is 'GD00';
comment on column EXP_DBF_DCLTOVAR.kod_str
  is 'KOD_STR';
comment on column EXP_DBF_DCLTOVAR.dstat
  is 'DSTAT';
comment on column EXP_DBF_DCLTOVAR.stat
  is 'STAT';
comment on column EXP_DBF_DCLTOVAR.recplatr
  is 'RECPLATR';
comment on column EXP_DBF_DCLTOVAR.rectechd
  is 'RECTECHD';
comment on column EXP_DBF_DCLTOVAR.recpredd
  is 'RECPREDD';
comment on column EXP_DBF_DCLTOVAR.recavtmb
  is 'RECAVTMB';
comment on column EXP_DBF_DCLTOVAR.recsltov
  is 'RECSLTOV';
comment on column EXP_DBF_DCLTOVAR.recrisk
  is 'RECRISK';
comment on column EXP_DBF_DCLTOVAR.recvrsk
  is 'RECVRSK';
comment on column EXP_DBF_DCLTOVAR.recddtec
  is 'RECDDTEC';
comment on column EXP_DBF_DCLTOVAR.nzp
  is 'NZP';
comment on column EXP_DBF_DCLTOVAR.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLTOVAR.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLTOVAR.gb_kd
  is 'GB_KD';
comment on column EXP_DBF_DCLTOVAR.g474_rub
  is 'G474_RUB';
comment on column EXP_DBF_DCLTOVAR.gb_rub
  is 'GB_RUB';
comment on column EXP_DBF_DCLTOVAR.g30a
  is 'G30A';
comment on column EXP_DBF_DCLTOVAR.g026a
  is 'G026A';
comment on column EXP_DBF_DCLTOVAR.g026d
  is 'G026D';
comment on column EXP_DBF_DCLTOVAR.id
  is 'ID';
comment on column EXP_DBF_DCLTOVAR.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLTOVAR.g31_14
  is 'G31_14';
comment on column EXP_DBF_DCLTOVAR.g31_401
  is 'G31_401';
comment on column EXP_DBF_DCLTOVAR.g31_402
  is 'G31_402';
comment on column EXP_DBF_DCLTOVAR.g31_20
  is 'G31_20';
comment on column EXP_DBF_DCLTOVAR.g340
  is 'G340';
comment on column EXP_DBF_DCLTOVAR.g34c
  is 'G34C';
comment on column EXP_DBF_DCLTOVAR.g461
  is 'G461';
comment on column EXP_DBF_DCLTOVAR.kod_strc
  is 'KOD_STRC';
comment on column EXP_DBF_DCLTOVAR.recpk
  is 'RECPK';
comment on column EXP_DBF_DCLTOVAR.recamnum
  is 'RECAMNUM';
comment on column EXP_DBF_DCLTOVAR.recdog
  is 'RECDOG';
comment on column EXP_DBF_DCLTOVAR.recdoga
  is 'RECDOGA';
comment on column EXP_DBF_DCLTOVAR.recdogt
  is 'RECDOGT';
comment on column EXP_DBF_DCLTOVAR.recuslt
  is 'RECUSLT';
comment on column EXP_DBF_DCLTOVAR.rectovg
  is 'RECTOVG';
comment on column EXP_DBF_DCLTOVAR.reckmp
  is 'RECKMP';
comment on column EXP_DBF_DCLTOVAR.g31_2part
  is 'G31_2PART';
comment on column EXP_DBF_DCLTOVAR.recterms
  is 'RECTERMS';
comment on column EXP_DBF_DCLTOVAR.fksign
  is 'FKSIGN';
comment on column EXP_DBF_DCLTOVAR.g333
  is 'G333';
comment on column EXP_DBF_DCLTOVAR.rectov2
  is 'RECTOV2';
comment on column EXP_DBF_DCLTOVAR.recplat2
  is 'RECPLAT2';
comment on column EXP_DBF_DCLTOVAR.recdinf2
  is 'RECDINF2';
comment on column EXP_DBF_DCLTOVAR.rectovg2
  is 'RECTOVG2';

prompt
prompt Creating table EXP_DBF_DCLTRANS
prompt ===============================
prompt
create table EXP_DBF_DCLTRANS
(
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  ngr       VARCHAR2(2),
  numrec    FLOAT,
  vidtrans  VARCHAR2(2),
  ntrans    VARCHAR2(40),
  g19       VARCHAR2(1),
  g212      VARCHAR2(3),
  g29       VARCHAR2(8),
  gc5       DATE,
  gc51      VARCHAR2(8),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER(19),
  nametrans VARCHAR2(100),
  ntrans1   VARCHAR2(40),
  ntrans2   VARCHAR2(40),
  g212c     VARCHAR2(3)
)
;
comment on table EXP_DBF_DCLTRANS
  is '������� EXP_DBF_DCLTRANS';
comment on column EXP_DBF_DCLTRANS.g071
  is 'G071';
comment on column EXP_DBF_DCLTRANS.g072
  is 'G072';
comment on column EXP_DBF_DCLTRANS.g073
  is 'G073';
comment on column EXP_DBF_DCLTRANS.ngr
  is 'NGR';
comment on column EXP_DBF_DCLTRANS.numrec
  is 'NUMREC';
comment on column EXP_DBF_DCLTRANS.vidtrans
  is 'VIDTRANS';
comment on column EXP_DBF_DCLTRANS.ntrans
  is 'NTRANS';
comment on column EXP_DBF_DCLTRANS.g19
  is 'G19';
comment on column EXP_DBF_DCLTRANS.g212
  is 'G212';
comment on column EXP_DBF_DCLTRANS.g29
  is 'G29';
comment on column EXP_DBF_DCLTRANS.gc5
  is 'GC5';
comment on column EXP_DBF_DCLTRANS.gc51
  is 'GC51';
comment on column EXP_DBF_DCLTRANS.nzp
  is 'NZP';
comment on column EXP_DBF_DCLTRANS.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLTRANS.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLTRANS.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLTRANS.nametrans
  is 'NAMETRANS';
comment on column EXP_DBF_DCLTRANS.ntrans1
  is 'NTRANS1';
comment on column EXP_DBF_DCLTRANS.ntrans2
  is 'NTRANS2';
comment on column EXP_DBF_DCLTRANS.g212c
  is 'G212C';

prompt
prompt Creating table EXP_DBF_DCLUSL
prompt =============================
prompt
create table EXP_DBF_DCLUSL
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  gu01      NUMBER(2) not null,
  gu02      NUMBER(2) not null,
  gunpp     NUMBER(5) not null,
  gu10      VARCHAR2(1),
  gu2       VARCHAR2(250),
  gu2d      DATE,
  gu3       DATE,
  gu31      DATE,
  gu4       VARCHAR2(8),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id INTEGER,
  g32       NUMBER(5),
  gu1       VARCHAR2(50),
  gu1d      DATE,
  gudd      DATE
)
;
comment on table EXP_DBF_DCLUSL
  is '������� EXP_DBF_DCLUSL';
comment on column EXP_DBF_DCLUSL.g071
  is 'G071';
comment on column EXP_DBF_DCLUSL.g072
  is 'G072';
comment on column EXP_DBF_DCLUSL.g073
  is 'G073';
comment on column EXP_DBF_DCLUSL.gu01
  is 'GU01';
comment on column EXP_DBF_DCLUSL.gu02
  is 'GU02';
comment on column EXP_DBF_DCLUSL.gunpp
  is 'GUNPP';
comment on column EXP_DBF_DCLUSL.gu10
  is 'GU10';
comment on column EXP_DBF_DCLUSL.gu2
  is 'GU2';
comment on column EXP_DBF_DCLUSL.gu2d
  is 'GU2D';
comment on column EXP_DBF_DCLUSL.gu3
  is 'GU3';
comment on column EXP_DBF_DCLUSL.gu31
  is 'GU31';
comment on column EXP_DBF_DCLUSL.gu4
  is 'GU4';
comment on column EXP_DBF_DCLUSL.nzp
  is 'NZP';
comment on column EXP_DBF_DCLUSL.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_DCLUSL.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_DCLUSL.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_DCLUSL.g32
  is 'G32';
comment on column EXP_DBF_DCLUSL.gu1
  is 'GU1';
comment on column EXP_DBF_DCLUSL.gu1d
  is 'GU1D';
comment on column EXP_DBF_DCLUSL.gudd
  is 'GUDD';

prompt
prompt Creating table EXP_DBF_DK1
prompt ==========================
prompt
create table EXP_DBF_DK1
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  k21     FLOAT,
  k22     FLOAT,
  k3      FLOAT,
  k4      VARCHAR2(3),
  k5      FLOAT,
  k6      VARCHAR2(12),
  k9      NUMBER(1),
  k9a     VARCHAR2(4),
  k9k     FLOAT,
  k10     NUMBER(1),
  k10a    NUMBER(1),
  k10c    NUMBER(1),
  k10b    VARCHAR2(3),
  k110    NUMBER(1),
  k111    NUMBER(1),
  k112    NUMBER(1),
  k112a   DATE,
  k113    NUMBER(1),
  k114    NUMBER(1),
  k114a   VARCHAR2(23),
  k114b   DATE,
  k115    VARCHAR2(20),
  k115a   DATE,
  k121    NUMBER(1),
  k122    VARCHAR2(23),
  k122a   DATE,
  k123    VARCHAR2(20),
  k123a   DATE,
  k124    VARCHAR2(1),
  k125    VARCHAR2(1),
  k126    FLOAT,
  k130    VARCHAR2(8),
  kpech1  VARCHAR2(4),
  kpech2  VARCHAR2(4),
  dmodify DATE
)
;
comment on table EXP_DBF_DK1
  is '������� EXP_DBF_DK1';
comment on column EXP_DBF_DK1.g071
  is 'G071';
comment on column EXP_DBF_DK1.g072
  is 'G072';
comment on column EXP_DBF_DK1.g073
  is 'G073';
comment on column EXP_DBF_DK1.k21
  is 'K21';
comment on column EXP_DBF_DK1.k22
  is 'K22';
comment on column EXP_DBF_DK1.k3
  is 'K3';
comment on column EXP_DBF_DK1.k4
  is 'K4';
comment on column EXP_DBF_DK1.k5
  is 'K5';
comment on column EXP_DBF_DK1.k6
  is 'K6';
comment on column EXP_DBF_DK1.k9
  is 'K9';
comment on column EXP_DBF_DK1.k9a
  is 'K9A';
comment on column EXP_DBF_DK1.k9k
  is 'K9K';
comment on column EXP_DBF_DK1.k10
  is 'K10';
comment on column EXP_DBF_DK1.k10a
  is 'K10A';
comment on column EXP_DBF_DK1.k10c
  is 'K10C';
comment on column EXP_DBF_DK1.k10b
  is 'K10B';
comment on column EXP_DBF_DK1.k110
  is 'K110';
comment on column EXP_DBF_DK1.k111
  is 'K111';
comment on column EXP_DBF_DK1.k112
  is 'K112';
comment on column EXP_DBF_DK1.k112a
  is 'K112A';
comment on column EXP_DBF_DK1.k113
  is 'K113';
comment on column EXP_DBF_DK1.k114
  is 'K114';
comment on column EXP_DBF_DK1.k114a
  is 'K114A';
comment on column EXP_DBF_DK1.k114b
  is 'K114B';
comment on column EXP_DBF_DK1.k115
  is 'K115';
comment on column EXP_DBF_DK1.k115a
  is 'K115A';
comment on column EXP_DBF_DK1.k121
  is 'K121';
comment on column EXP_DBF_DK1.k122
  is 'K122';
comment on column EXP_DBF_DK1.k122a
  is 'K122A';
comment on column EXP_DBF_DK1.k123
  is 'K123';
comment on column EXP_DBF_DK1.k123a
  is 'K123A';
comment on column EXP_DBF_DK1.k124
  is 'K124';
comment on column EXP_DBF_DK1.k125
  is 'K125';
comment on column EXP_DBF_DK1.k126
  is 'K126';
comment on column EXP_DBF_DK1.k130
  is 'K130';
comment on column EXP_DBF_DK1.kpech1
  is 'KPECH1';
comment on column EXP_DBF_DK1.kpech2
  is 'KPECH2';
comment on column EXP_DBF_DK1.dmodify
  is 'DMODIFY';

prompt
prompt Creating table EXP_DBF_DKISCH
prompt =============================
prompt
create table EXP_DBF_DKISCH
(
  g071    VARCHAR2(8) not null,
  g072    DATE not null,
  g073    VARCHAR2(7) not null,
  g32     FLOAT not null,
  g470    VARCHAR2(1),
  g471    VARCHAR2(3) not null,
  g471_1  VARCHAR2(1),
  g472    FLOAT,
  g473    FLOAT,
  g4731   VARCHAR2(1),
  g4732   VARCHAR2(3),
  g4733   VARCHAR2(3),
  g474    FLOAT,
  g4741   VARCHAR2(3),
  g475    VARCHAR2(2),
  npp     FLOAT,
  id      INTEGER,
  load_id NUMBER(22)
)
;
comment on table EXP_DBF_DKISCH
  is '������� EXP_DBF_DKISCH';
comment on column EXP_DBF_DKISCH.g071
  is 'G071';
comment on column EXP_DBF_DKISCH.g072
  is 'G072';
comment on column EXP_DBF_DKISCH.g073
  is 'G073';
comment on column EXP_DBF_DKISCH.g32
  is 'G32';
comment on column EXP_DBF_DKISCH.g470
  is 'G470';
comment on column EXP_DBF_DKISCH.g471
  is 'G471';
comment on column EXP_DBF_DKISCH.g471_1
  is 'G471_1';
comment on column EXP_DBF_DKISCH.g472
  is 'G472';
comment on column EXP_DBF_DKISCH.g473
  is 'G473';
comment on column EXP_DBF_DKISCH.g4731
  is 'G4731';
comment on column EXP_DBF_DKISCH.g4732
  is 'G4732';
comment on column EXP_DBF_DKISCH.g4733
  is 'G4733';
comment on column EXP_DBF_DKISCH.g474
  is 'G474';
comment on column EXP_DBF_DKISCH.g4741
  is 'G4741';
comment on column EXP_DBF_DKISCH.g475
  is 'G475';
comment on column EXP_DBF_DKISCH.npp
  is 'NPP';
comment on column EXP_DBF_DKISCH.id
  is 'ID';
comment on column EXP_DBF_DKISCH.load_id
  is 'LOAD_ID';

prompt
prompt Creating table EXP_DBF_DKKUPL
prompt =============================
prompt
create table EXP_DBF_DKKUPL
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  gb0     VARCHAR2(1),
  gb1     VARCHAR2(3),
  gb1_1   VARCHAR2(1),
  gb2     FLOAT,
  gb3     VARCHAR2(3),
  gb4     FLOAT,
  id      INTEGER,
  load_id INTEGER
)
;
comment on table EXP_DBF_DKKUPL
  is '������� EXP_DBF_DKKUPL';
comment on column EXP_DBF_DKKUPL.g071
  is 'G071';
comment on column EXP_DBF_DKKUPL.g072
  is 'G072';
comment on column EXP_DBF_DKKUPL.g073
  is 'G073';
comment on column EXP_DBF_DKKUPL.gb0
  is 'GB0';
comment on column EXP_DBF_DKKUPL.gb1
  is 'GB1';
comment on column EXP_DBF_DKKUPL.gb1_1
  is 'GB1_1';
comment on column EXP_DBF_DKKUPL.gb2
  is 'GB2';
comment on column EXP_DBF_DKKUPL.gb3
  is 'GB3';
comment on column EXP_DBF_DKKUPL.gb4
  is 'GB4';
comment on column EXP_DBF_DKKUPL.id
  is 'ID';
comment on column EXP_DBF_DKKUPL.load_id
  is 'LOAD_ID';

prompt
prompt Creating table EXP_DBF_DKOPRP
prompt =============================
prompt
create table EXP_DBF_DKOPRP
(
  g071  VARCHAR2(8),
  g072  DATE,
  g073  VARCHAR2(7),
  gb0   VARCHAR2(1),
  gb1   VARCHAR2(3),
  gb1_1 VARCHAR2(1),
  gb2   NUMBER(17,2),
  gb3   VARCHAR2(3),
  gb5   VARCHAR2(2),
  ndoc  VARCHAR2(15),
  stav  NUMBER(8,2),
  prcs  NUMBER(9,2),
  g48   DATE,
  id    INTEGER
)
;
comment on table EXP_DBF_DKOPRP
  is '������� EXP_DBF_DKOPRP';
comment on column EXP_DBF_DKOPRP.g071
  is 'G071';
comment on column EXP_DBF_DKOPRP.g072
  is 'G072';
comment on column EXP_DBF_DKOPRP.g073
  is 'G073';
comment on column EXP_DBF_DKOPRP.gb0
  is 'GB0';
comment on column EXP_DBF_DKOPRP.gb1
  is 'GB1';
comment on column EXP_DBF_DKOPRP.gb1_1
  is 'GB1_1';
comment on column EXP_DBF_DKOPRP.gb2
  is 'GB2';
comment on column EXP_DBF_DKOPRP.gb3
  is 'GB3';
comment on column EXP_DBF_DKOPRP.gb5
  is 'GB5';
comment on column EXP_DBF_DKOPRP.ndoc
  is 'NDOC';
comment on column EXP_DBF_DKOPRP.stav
  is 'STAV';
comment on column EXP_DBF_DKOPRP.prcs
  is 'PRCS';
comment on column EXP_DBF_DKOPRP.g48
  is 'G48';
comment on column EXP_DBF_DKOPRP.id
  is 'ID';

prompt
prompt Creating table EXP_DBF_DK_PP
prompt ============================
prompt
create table EXP_DBF_DK_PP
(
  g071    VARCHAR2(8),
  g072    DATE,
  g073    VARCHAR2(7),
  okpo    VARCHAR2(10),
  inn     VARCHAR2(12),
  kpp     VARCHAR2(9),
  k92     VARCHAR2(50),
  k93     DATE,
  k94     FLOAT,
  k95     FLOAT,
  k96     DATE,
  k_val   VARCHAR2(3),
  priz    VARCHAR2(3),
  who     VARCHAR2(1),
  sp      VARCHAR2(2),
  crypt   VARCHAR2(10),
  code    VARCHAR2(20),
  bank_id VARCHAR2(20),
  vp      VARCHAR2(3),
  bk      VARCHAR2(7),
  id      INTEGER,
  iret    NUMBER(2),
  dsp     DATE,
  tsp     VARCHAR2(8),
  nblktc1 VARCHAR2(8),
  load_id NUMBER(22)
)
;
comment on table EXP_DBF_DK_PP
  is '������� EXP_DBF_DK_PP';
comment on column EXP_DBF_DK_PP.g071
  is 'G071';
comment on column EXP_DBF_DK_PP.g072
  is 'G072';
comment on column EXP_DBF_DK_PP.g073
  is 'G073';
comment on column EXP_DBF_DK_PP.okpo
  is 'OKPO';
comment on column EXP_DBF_DK_PP.inn
  is 'INN';
comment on column EXP_DBF_DK_PP.kpp
  is 'KPP';
comment on column EXP_DBF_DK_PP.k92
  is 'K92';
comment on column EXP_DBF_DK_PP.k93
  is 'K93';
comment on column EXP_DBF_DK_PP.k94
  is 'K94';
comment on column EXP_DBF_DK_PP.k95
  is 'K95';
comment on column EXP_DBF_DK_PP.k96
  is 'K96';
comment on column EXP_DBF_DK_PP.k_val
  is 'K_VAL';
comment on column EXP_DBF_DK_PP.priz
  is 'PRIZ';
comment on column EXP_DBF_DK_PP.who
  is 'WHO';
comment on column EXP_DBF_DK_PP.sp
  is 'SP';
comment on column EXP_DBF_DK_PP.crypt
  is 'CRYPT';
comment on column EXP_DBF_DK_PP.code
  is 'CODE';
comment on column EXP_DBF_DK_PP.bank_id
  is 'BANK_ID';
comment on column EXP_DBF_DK_PP.vp
  is 'VP';
comment on column EXP_DBF_DK_PP.bk
  is 'BK';
comment on column EXP_DBF_DK_PP.id
  is 'ID';
comment on column EXP_DBF_DK_PP.iret
  is 'IRET';
comment on column EXP_DBF_DK_PP.dsp
  is 'DSP';
comment on column EXP_DBF_DK_PP.tsp
  is 'TSP';
comment on column EXP_DBF_DK_PP.nblktc1
  is 'NBLKTC1';
comment on column EXP_DBF_DK_PP.load_id
  is 'LOAD_ID';

prompt
prompt Creating table EXP_DBF_KTCPLTIZ
prompt ===============================
prompt
create table EXP_DBF_KTCPLTIZ
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  k32       FLOAT,
  k470      VARCHAR2(1),
  k471      VARCHAR2(3),
  k472      FLOAT,
  k4721     VARCHAR2(3),
  k473      FLOAT,
  k4731     VARCHAR2(1),
  k4732     VARCHAR2(3),
  k4733     VARCHAR2(3),
  k4734     FLOAT,
  kpp       FLOAT,
  k474      FLOAT not null,
  k4741     VARCHAR2(3),
  k475      VARCHAR2(2),
  k476      FLOAT not null,
  k4761     VARCHAR2(3),
  k473z1_2  VARCHAR2(1),
  k473_2    FLOAT,
  k4731_2   VARCHAR2(1),
  k4732_2   VARCHAR2(3),
  k4733_2   VARCHAR2(3),
  k4734_2   FLOAT,
  k473z1_3  VARCHAR2(1),
  k473_3    FLOAT,
  k4731_3   VARCHAR2(1),
  k4732_3   VARCHAR2(3),
  k4733_3   VARCHAR2(3),
  k4734_3   FLOAT,
  k473z2_2  FLOAT,
  k477      FLOAT,
  k4730     DATE,
  k4740     DATE,
  nblktc1   VARCHAR2(8),
  nblktc1p  VARCHAR2(8),
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT,
  dateload  DATE,
  id        NUMBER,
  load_id   NUMBER
)
;
comment on table EXP_DBF_KTCPLTIZ
  is '������� EXP_DBF_KTCPLTIZ';
comment on column EXP_DBF_KTCPLTIZ.g071
  is 'G071';
comment on column EXP_DBF_KTCPLTIZ.g072
  is 'G072';
comment on column EXP_DBF_KTCPLTIZ.g073
  is 'G073';
comment on column EXP_DBF_KTCPLTIZ.k32
  is 'K32';
comment on column EXP_DBF_KTCPLTIZ.k470
  is 'K470';
comment on column EXP_DBF_KTCPLTIZ.k471
  is 'K471';
comment on column EXP_DBF_KTCPLTIZ.k472
  is 'K472';
comment on column EXP_DBF_KTCPLTIZ.k4721
  is 'K4721';
comment on column EXP_DBF_KTCPLTIZ.k473
  is 'K473';
comment on column EXP_DBF_KTCPLTIZ.k4731
  is 'K4731';
comment on column EXP_DBF_KTCPLTIZ.k4732
  is 'K4732';
comment on column EXP_DBF_KTCPLTIZ.k4733
  is 'K4733';
comment on column EXP_DBF_KTCPLTIZ.k4734
  is 'K4734';
comment on column EXP_DBF_KTCPLTIZ.kpp
  is 'KPP';
comment on column EXP_DBF_KTCPLTIZ.k474
  is 'K474';
comment on column EXP_DBF_KTCPLTIZ.k4741
  is 'K4741';
comment on column EXP_DBF_KTCPLTIZ.k475
  is 'K475';
comment on column EXP_DBF_KTCPLTIZ.k476
  is 'K476';
comment on column EXP_DBF_KTCPLTIZ.k4761
  is 'K4761';
comment on column EXP_DBF_KTCPLTIZ.k473z1_2
  is 'K473Z1_2';
comment on column EXP_DBF_KTCPLTIZ.k473_2
  is 'K473_2';
comment on column EXP_DBF_KTCPLTIZ.k4731_2
  is 'K4731_2';
comment on column EXP_DBF_KTCPLTIZ.k4732_2
  is 'K4732_2';
comment on column EXP_DBF_KTCPLTIZ.k4733_2
  is 'K4733_2';
comment on column EXP_DBF_KTCPLTIZ.k4734_2
  is 'K4734_2';
comment on column EXP_DBF_KTCPLTIZ.k473z1_3
  is 'K473Z1_3';
comment on column EXP_DBF_KTCPLTIZ.k473_3
  is 'K473_3';
comment on column EXP_DBF_KTCPLTIZ.k4731_3
  is 'K4731_3';
comment on column EXP_DBF_KTCPLTIZ.k4732_3
  is 'K4732_3';
comment on column EXP_DBF_KTCPLTIZ.k4733_3
  is 'K4733_3';
comment on column EXP_DBF_KTCPLTIZ.k4734_3
  is 'K4734_3';
comment on column EXP_DBF_KTCPLTIZ.k473z2_2
  is 'K473Z2_2';
comment on column EXP_DBF_KTCPLTIZ.k477
  is 'K477';
comment on column EXP_DBF_KTCPLTIZ.k4730
  is 'K4730';
comment on column EXP_DBF_KTCPLTIZ.k4740
  is 'K4740';
comment on column EXP_DBF_KTCPLTIZ.nblktc1
  is 'NBLKTC1';
comment on column EXP_DBF_KTCPLTIZ.nblktc1p
  is 'NBLKTC1P';
comment on column EXP_DBF_KTCPLTIZ.nzp
  is 'NZP';
comment on column EXP_DBF_KTCPLTIZ.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_KTCPLTIZ.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_KTCPLTIZ.p_edoc_id
  is 'P_EDOC_ID';
comment on column EXP_DBF_KTCPLTIZ.dateload
  is 'DATELOAD';
comment on column EXP_DBF_KTCPLTIZ.id
  is 'ID';
comment on column EXP_DBF_KTCPLTIZ.load_id
  is 'LOAD_ID';

prompt
prompt Creating table EXP_DBF_KTCTOVIZ
prompt ===============================
prompt
create table EXP_DBF_KTCTOVIZ
(
  g071      VARCHAR2(8) not null,
  g072      DATE not null,
  g073      VARCHAR2(7) not null,
  typ_ktc   FLOAT,
  k011      VARCHAR2(1),
  k012      VARCHAR2(4),
  k013      VARCHAR2(1),
  k031      FLOAT,
  ch        FLOAT,
  k31_1     VARCHAR2(250),
  k31_11    VARCHAR2(50),
  k31_2     FLOAT,
  k31_2part FLOAT,
  k31_20    VARCHAR2(1),
  k31_21    VARCHAR2(150),
  k31_7     FLOAT,
  k31_8     FLOAT,
  k31_9     FLOAT,
  k32       FLOAT,
  k35       FLOAT,
  k38       FLOAT,
  k42       FLOAT,
  k43       VARCHAR2(2),
  k451      FLOAT not null,
  k452      FLOAT not null,
  k46       FLOAT,
  k461      VARCHAR2(1),
  k470      FLOAT,
  nblktc1   VARCHAR2(8),
  nblktc2   VARCHAR2(8),
  nblktc1p  VARCHAR2(8),
  nzp       FLOAT,
  dmodify   DATE not null,
  tmodify   VARCHAR2(8) not null,
  p_edoc_id FLOAT
)
;
comment on table EXP_DBF_KTCTOVIZ
  is '������� EXP_DBF_KTCTOVIZ';
comment on column EXP_DBF_KTCTOVIZ.g071
  is 'G071';
comment on column EXP_DBF_KTCTOVIZ.g072
  is 'G072';
comment on column EXP_DBF_KTCTOVIZ.g073
  is 'G073';
comment on column EXP_DBF_KTCTOVIZ.typ_ktc
  is 'TYP_KTC';
comment on column EXP_DBF_KTCTOVIZ.k011
  is 'K011';
comment on column EXP_DBF_KTCTOVIZ.k012
  is 'K012';
comment on column EXP_DBF_KTCTOVIZ.k013
  is 'K013';
comment on column EXP_DBF_KTCTOVIZ.k031
  is 'K031';
comment on column EXP_DBF_KTCTOVIZ.ch
  is 'CH';
comment on column EXP_DBF_KTCTOVIZ.k31_1
  is 'K31_1';
comment on column EXP_DBF_KTCTOVIZ.k31_11
  is 'K31_11';
comment on column EXP_DBF_KTCTOVIZ.k31_2
  is 'K31_2';
comment on column EXP_DBF_KTCTOVIZ.k31_2part
  is 'K31_2PART';
comment on column EXP_DBF_KTCTOVIZ.k31_20
  is 'K31_20';
comment on column EXP_DBF_KTCTOVIZ.k31_21
  is 'K31_21';
comment on column EXP_DBF_KTCTOVIZ.k31_7
  is 'K31_7';
comment on column EXP_DBF_KTCTOVIZ.k31_8
  is 'K31_8';
comment on column EXP_DBF_KTCTOVIZ.k31_9
  is 'K31_9';
comment on column EXP_DBF_KTCTOVIZ.k32
  is 'K32';
comment on column EXP_DBF_KTCTOVIZ.k35
  is 'K35';
comment on column EXP_DBF_KTCTOVIZ.k38
  is 'K38';
comment on column EXP_DBF_KTCTOVIZ.k42
  is 'K42';
comment on column EXP_DBF_KTCTOVIZ.k43
  is 'K43';
comment on column EXP_DBF_KTCTOVIZ.k451
  is 'K451';
comment on column EXP_DBF_KTCTOVIZ.k452
  is 'K452';
comment on column EXP_DBF_KTCTOVIZ.k46
  is 'K46';
comment on column EXP_DBF_KTCTOVIZ.k461
  is 'K461';
comment on column EXP_DBF_KTCTOVIZ.k470
  is 'K470';
comment on column EXP_DBF_KTCTOVIZ.nblktc1
  is 'NBLKTC1';
comment on column EXP_DBF_KTCTOVIZ.nblktc2
  is 'NBLKTC2';
comment on column EXP_DBF_KTCTOVIZ.nblktc1p
  is 'NBLKTC1P';
comment on column EXP_DBF_KTCTOVIZ.nzp
  is 'NZP';
comment on column EXP_DBF_KTCTOVIZ.dmodify
  is 'DMODIFY';
comment on column EXP_DBF_KTCTOVIZ.tmodify
  is 'TMODIFY';
comment on column EXP_DBF_KTCTOVIZ.p_edoc_id
  is 'P_EDOC_ID';

prompt
prompt Creating table EXP_DBF_TPO
prompt ==========================
prompt
create table EXP_DBF_TPO
(
  tpo_number VARCHAR2(10) not null,
  order_type VARCHAR2(1),
  ext_list   VARCHAR2(1),
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
  famurlic   VARCHAR2(58),
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
  idpayer2   VARCHAR2(40),
  typ_payer2 VARCHAR2(1)
)
;
comment on table EXP_DBF_TPO
  is '������� EXP_DBF_TPO';
comment on column EXP_DBF_TPO.tpo_number
  is 'TPO_NUMBER';
comment on column EXP_DBF_TPO.order_type
  is 'ORDER_TYPE';
comment on column EXP_DBF_TPO.ext_list
  is 'EXT_LIST';
comment on column EXP_DBF_TPO.cod_tam
  is 'COD_TAM';
comment on column EXP_DBF_TPO.cod_tamp
  is 'COD_TAMP';
comment on column EXP_DBF_TPO.day_tpo
  is 'DAY_TPO';
comment on column EXP_DBF_TPO.mon_tpo
  is 'MON_TPO';
comment on column EXP_DBF_TPO.jar_tpo
  is 'JAR_TPO';
comment on column EXP_DBF_TPO.num_mpo
  is 'NUM_MPO';
comment on column EXP_DBF_TPO.idpayer
  is 'IDPAYER';
comment on column EXP_DBF_TPO.kodval
  is 'KODVAL';
comment on column EXP_DBF_TPO.tovcost_pl
  is 'TOVCOST_PL';
comment on column EXP_DBF_TPO.sum_rub
  is 'SUM_RUB';
comment on column EXP_DBF_TPO.fiotam
  is 'FIOTAM';
comment on column EXP_DBF_TPO.fiokas
  is 'FIOKAS';
comment on column EXP_DBF_TPO.curs_usd
  is 'CURS_USD';
comment on column EXP_DBF_TPO.curs_eku
  is 'CURS_EKU';
comment on column EXP_DBF_TPO.regim
  is 'REGIM';
comment on column EXP_DBF_TPO.meth_move
  is 'METH_MOVE';
comment on column EXP_DBF_TPO.curs_val
  is 'CURS_VAL';
comment on column EXP_DBF_TPO.dat_curs
  is 'DAT_CURS';
comment on column EXP_DBF_TPO.signprt
  is 'SIGNPRT';
comment on column EXP_DBF_TPO.annul
  is 'ANNUL';
comment on column EXP_DBF_TPO.datecheck
  is 'DATECHECK';
comment on column EXP_DBF_TPO.depozit
  is 'DEPOZIT';
comment on column EXP_DBF_TPO.sign_pass
  is 'SIGN_PASS';
comment on column EXP_DBF_TPO.dop_inf1
  is 'DOP_INF1';
comment on column EXP_DBF_TPO.dop_inf2
  is 'DOP_INF2';
comment on column EXP_DBF_TPO.dop_inf3
  is 'DOP_INF3';
comment on column EXP_DBF_TPO.pod1
  is 'POD1';
comment on column EXP_DBF_TPO.pod2
  is 'POD2';
comment on column EXP_DBF_TPO.pod3
  is 'POD3';
comment on column EXP_DBF_TPO.pod4
  is 'POD4';
comment on column EXP_DBF_TPO.pod5
  is 'POD5';
comment on column EXP_DBF_TPO.pod6
  is 'POD6';
comment on column EXP_DBF_TPO.pod7
  is 'POD7';
comment on column EXP_DBF_TPO.pod8
  is 'POD8';
comment on column EXP_DBF_TPO.sign_pay
  is 'SIGN_PAY';
comment on column EXP_DBF_TPO.codcountry
  is 'CODCOUNTRY';
comment on column EXP_DBF_TPO.oplval
  is 'OPLVAL';
comment on column EXP_DBF_TPO.oplrub
  is 'OPLRUB';
comment on column EXP_DBF_TPO.dateout
  is 'DATEOUT';
comment on column EXP_DBF_TPO.dategnivz
  is 'DATEGNIVZ';
comment on column EXP_DBF_TPO.annul_tpo
  is 'ANNUL_TPO';
comment on column EXP_DBF_TPO.dep_tpo
  is 'DEP_TPO';
comment on column EXP_DBF_TPO.vertpo
  is 'VERTPO';
comment on column EXP_DBF_TPO.sprub
  is 'SPRUB';
comment on column EXP_DBF_TPO.spval
  is 'SPVAL';
comment on column EXP_DBF_TPO.datvypbank
  is 'DATVYPBANK';
comment on column EXP_DBF_TPO.nazntov
  is 'NAZNTOV';
comment on column EXP_DBF_TPO.famurlic
  is 'FAMURLIC';
comment on column EXP_DBF_TPO.dat_annul
  is 'DAT_ANNUL';
comment on column EXP_DBF_TPO.sign_corr
  is 'SIGN_CORR';
comment on column EXP_DBF_TPO.schet
  is 'SCHET';
comment on column EXP_DBF_TPO.signvar
  is 'SIGNVAR';
comment on column EXP_DBF_TPO.code
  is 'CODE';
comment on column EXP_DBF_TPO.pr_privil
  is 'PR_PRIVIL';
comment on column EXP_DBF_TPO.tovcost_al
  is 'TOVCOST_AL';
comment on column EXP_DBF_TPO.weight_al
  is 'WEIGHT_AL';
comment on column EXP_DBF_TPO.numpts
  is 'NUMPTS';
comment on column EXP_DBF_TPO.load_id
  is 'LOAD_ID';
comment on column EXP_DBF_TPO.id
  is 'ID';
comment on column EXP_DBF_TPO.pod9
  is 'POD9';
comment on column EXP_DBF_TPO.pod10
  is 'POD10';
comment on column EXP_DBF_TPO.pod11
  is 'POD11';
comment on column EXP_DBF_TPO.pod12
  is 'POD12';
comment on column EXP_DBF_TPO.pod13
  is 'POD13';
comment on column EXP_DBF_TPO.pod14
  is 'POD14';
comment on column EXP_DBF_TPO.sp3
  is 'SP3';
comment on column EXP_DBF_TPO.opl3
  is 'OPL3';
comment on column EXP_DBF_TPO.sp4
  is 'SP4';
comment on column EXP_DBF_TPO.opl4
  is 'OPL4';
comment on column EXP_DBF_TPO.kodval3
  is 'KODVAL3';
comment on column EXP_DBF_TPO.curs_val3
  is 'CURS_VAL3';
comment on column EXP_DBF_TPO.dat_curs3
  is 'DAT_CURS3';
comment on column EXP_DBF_TPO.kodval4
  is 'KODVAL4';
comment on column EXP_DBF_TPO.curs_val4
  is 'CURS_VAL4';
comment on column EXP_DBF_TPO.dat_curs4
  is 'DAT_CURS4';
comment on column EXP_DBF_TPO.idpayer2
  is 'IDPAYER2';
comment on column EXP_DBF_TPO.typ_payer2
  is 'TYP_PAYER2';

prompt
prompt Creating table EXP_DBF_TPO_AUD
prompt ==============================
prompt
create table EXP_DBF_TPO_AUD
(
  num_tpo  VARCHAR2(10) not null,
  model    VARCHAR2(36),
  den      NUMBER(5),
  mes      NUMBER(5),
  god      NUMBER(5),
  srok     NUMBER(5),
  mest     NUMBER(5),
  obdvig   NUMBER,
  cod_nazn VARCHAR2(1),
  powerls  NUMBER,
  powerkw  NUMBER,
  vin      VARCHAR2(20),
  numdvig  VARCHAR2(40),
  shassi   VARCHAR2(40),
  kuzov    VARCHAR2(40),
  nomer    VARCHAR2(12),
  tipdv    VARCHAR2(2),
  tnved    VARCHAR2(10),
  tamstoim NUMBER,
  udvvoz   VARCHAR2(10),
  datud    DATE,
  tamu     VARCHAR2(8),
  numpts   VARCHAR2(11),
  datpts   DATE,
  tamp     VARCHAR2(8),
  codt_to  VARCHAR2(8),
  dat_to   DATE,
  num_dkd  VARCHAR2(7),
  codt_tn  VARCHAR2(8),
  pred_tpo VARCHAR2(26),
  reserv   VARCHAR2(10),
  kodmrk   VARCHAR2(3),
  kabina   VARCHAR2(40)
)
;
comment on table EXP_DBF_TPO_AUD
  is '������� EXP_DBF_TPO_AUD';
comment on column EXP_DBF_TPO_AUD.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_AUD.model
  is 'MODEL';
comment on column EXP_DBF_TPO_AUD.den
  is 'DEN';
comment on column EXP_DBF_TPO_AUD.mes
  is 'MES';
comment on column EXP_DBF_TPO_AUD.god
  is 'GOD';
comment on column EXP_DBF_TPO_AUD.srok
  is 'SROK';
comment on column EXP_DBF_TPO_AUD.mest
  is 'MEST';
comment on column EXP_DBF_TPO_AUD.obdvig
  is 'OBDVIG';
comment on column EXP_DBF_TPO_AUD.cod_nazn
  is 'COD_NAZN';
comment on column EXP_DBF_TPO_AUD.powerls
  is 'POWERLS';
comment on column EXP_DBF_TPO_AUD.powerkw
  is 'POWERKW';
comment on column EXP_DBF_TPO_AUD.vin
  is 'VIN';
comment on column EXP_DBF_TPO_AUD.numdvig
  is 'NUMDVIG';
comment on column EXP_DBF_TPO_AUD.shassi
  is 'SHASSI';
comment on column EXP_DBF_TPO_AUD.kuzov
  is 'KUZOV';
comment on column EXP_DBF_TPO_AUD.nomer
  is 'NOMER';
comment on column EXP_DBF_TPO_AUD.tipdv
  is 'TIPDV';
comment on column EXP_DBF_TPO_AUD.tnved
  is 'TNVED';
comment on column EXP_DBF_TPO_AUD.tamstoim
  is 'TAMSTOIM';
comment on column EXP_DBF_TPO_AUD.udvvoz
  is 'UDVVOZ';
comment on column EXP_DBF_TPO_AUD.datud
  is 'DATUD';
comment on column EXP_DBF_TPO_AUD.tamu
  is 'TAMU';
comment on column EXP_DBF_TPO_AUD.numpts
  is 'NUMPTS';
comment on column EXP_DBF_TPO_AUD.datpts
  is 'DATPTS';
comment on column EXP_DBF_TPO_AUD.tamp
  is 'TAMP';
comment on column EXP_DBF_TPO_AUD.codt_to
  is 'CODT_TO';
comment on column EXP_DBF_TPO_AUD.dat_to
  is 'DAT_TO';
comment on column EXP_DBF_TPO_AUD.num_dkd
  is 'NUM_DKD';
comment on column EXP_DBF_TPO_AUD.codt_tn
  is 'CODT_TN';
comment on column EXP_DBF_TPO_AUD.pred_tpo
  is 'PRED_TPO';
comment on column EXP_DBF_TPO_AUD.reserv
  is 'RESERV';
comment on column EXP_DBF_TPO_AUD.kodmrk
  is 'KODMRK';
comment on column EXP_DBF_TPO_AUD.kabina
  is 'KABINA';

prompt
prompt Creating table EXP_DBF_TPO_DOC
prompt ==============================
prompt
create table EXP_DBF_TPO_DOC
(
  num_tpo VARCHAR2(10) not null,
  nrow    NUMBER(5) not null,
  pdoc    VARCHAR2(50),
  cod_doc VARCHAR2(8)
)
;
comment on table EXP_DBF_TPO_DOC
  is '������� EXP_DBF_TPO_DOC';
comment on column EXP_DBF_TPO_DOC.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_DOC.nrow
  is 'NROW';
comment on column EXP_DBF_TPO_DOC.pdoc
  is 'PDOC';
comment on column EXP_DBF_TPO_DOC.cod_doc
  is 'COD_DOC';

prompt
prompt Creating table EXP_DBF_TPO_DOP
prompt ==============================
prompt
create table EXP_DBF_TPO_DOP
(
  num_tpo   VARCHAR2(10) not null,
  num_dtpo  VARCHAR2(1) not null,
  tdop_inf1 VARCHAR2(72),
  tdop_inf2 VARCHAR2(72),
  tdop_inf3 VARCHAR2(72),
  tdop_inf4 VARCHAR2(72),
  stoim     NUMBER,
  plat      NUMBER,
  poshl     NUMBER,
  akciz     NUMBER,
  nds       NUMBER
)
;
comment on table EXP_DBF_TPO_DOP
  is '������� EXP_DBF_TPO_DOP';
comment on column EXP_DBF_TPO_DOP.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_DOP.num_dtpo
  is 'NUM_DTPO';
comment on column EXP_DBF_TPO_DOP.tdop_inf1
  is 'TDOP_INF1';
comment on column EXP_DBF_TPO_DOP.tdop_inf2
  is 'TDOP_INF2';
comment on column EXP_DBF_TPO_DOP.tdop_inf3
  is 'TDOP_INF3';
comment on column EXP_DBF_TPO_DOP.tdop_inf4
  is 'TDOP_INF4';
comment on column EXP_DBF_TPO_DOP.stoim
  is 'STOIM';
comment on column EXP_DBF_TPO_DOP.plat
  is 'PLAT';
comment on column EXP_DBF_TPO_DOP.poshl
  is 'POSHL';
comment on column EXP_DBF_TPO_DOP.akciz
  is 'AKCIZ';
comment on column EXP_DBF_TPO_DOP.nds
  is 'NDS';

prompt
prompt Creating table EXP_DBF_TPO_GOODS
prompt ================================
prompt
create table EXP_DBF_TPO_GOODS
(
  num_tpo    VARCHAR2(10),
  num_dtpo   VARCHAR2(1),
  pos_dtpo   VARCHAR2(2),
  codtnved   VARCHAR2(10),
  naimenov   VARCHAR2(58),
  tovcost_us NUMBER,
  tovcost_pl NUMBER,
  weight     NUMBER,
  kolvo      NUMBER,
  codcountry VARCHAR2(3),
  edizm      VARCHAR2(3),
  sertif     NUMBER(5),
  pr_sbr     VARCHAR2(1),
  codmainpl  VARCHAR2(3),
  cod_plat   VARCHAR2(6),
  osnov_nach NUMBER,
  edosnov    VARCHAR2(15),
  stavka     NUMBER,
  edstav     NUMBER(5),
  prim_plt   NUMBER(1),
  sum_val    NUMBER,
  signperiod NUMBER(5),
  calcul     NUMBER(5),
  osnov_n1   NUMBER,
  osnov_n2   NUMBER,
  tovcost_al NUMBER,
  weight_al  NUMBER,
  servsign   VARCHAR2(1),
  costal_rur NUMBER
)
;
comment on table EXP_DBF_TPO_GOODS
  is '������� EXP_DBF_TPO_GOODS';
comment on column EXP_DBF_TPO_GOODS.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_GOODS.num_dtpo
  is 'NUM_DTPO';
comment on column EXP_DBF_TPO_GOODS.pos_dtpo
  is 'POS_DTPO';
comment on column EXP_DBF_TPO_GOODS.codtnved
  is 'CODTNVED';
comment on column EXP_DBF_TPO_GOODS.naimenov
  is 'NAIMENOV';
comment on column EXP_DBF_TPO_GOODS.tovcost_us
  is 'TOVCOST_US';
comment on column EXP_DBF_TPO_GOODS.tovcost_pl
  is 'TOVCOST_PL';
comment on column EXP_DBF_TPO_GOODS.weight
  is 'WEIGHT';
comment on column EXP_DBF_TPO_GOODS.kolvo
  is 'KOLVO';
comment on column EXP_DBF_TPO_GOODS.codcountry
  is 'CODCOUNTRY';
comment on column EXP_DBF_TPO_GOODS.edizm
  is 'EDIZM';
comment on column EXP_DBF_TPO_GOODS.sertif
  is 'SERTIF';
comment on column EXP_DBF_TPO_GOODS.pr_sbr
  is 'PR_SBR';
comment on column EXP_DBF_TPO_GOODS.codmainpl
  is 'CODMAINPL';
comment on column EXP_DBF_TPO_GOODS.cod_plat
  is 'COD_PLAT';
comment on column EXP_DBF_TPO_GOODS.osnov_nach
  is 'OSNOV_NACH';
comment on column EXP_DBF_TPO_GOODS.edosnov
  is 'EDOSNOV';
comment on column EXP_DBF_TPO_GOODS.stavka
  is 'STAVKA';
comment on column EXP_DBF_TPO_GOODS.edstav
  is 'EDSTAV';
comment on column EXP_DBF_TPO_GOODS.prim_plt
  is 'PRIM_PLT';
comment on column EXP_DBF_TPO_GOODS.sum_val
  is 'SUM_VAL';
comment on column EXP_DBF_TPO_GOODS.signperiod
  is 'SIGNPERIOD';
comment on column EXP_DBF_TPO_GOODS.calcul
  is 'CALCUL';
comment on column EXP_DBF_TPO_GOODS.osnov_n1
  is 'OSNOV_N1';
comment on column EXP_DBF_TPO_GOODS.osnov_n2
  is 'OSNOV_N2';
comment on column EXP_DBF_TPO_GOODS.tovcost_al
  is 'TOVCOST_AL';
comment on column EXP_DBF_TPO_GOODS.weight_al
  is 'WEIGHT_AL';
comment on column EXP_DBF_TPO_GOODS.servsign
  is 'SERVSIGN';
comment on column EXP_DBF_TPO_GOODS.costal_rur
  is 'COSTAL_RUR';

prompt
prompt Creating table EXP_DBF_TPO_ITP
prompt ==============================
prompt
create table EXP_DBF_TPO_ITP
(
  num_tpo    VARCHAR2(10) not null,
  cod_mainpl VARCHAR2(3) not null,
  cod_plat   VARCHAR2(6),
  osn_natch  NUMBER,
  stavka     NUMBER,
  sum_rub    NUMBER,
  edstav     NUMBER(5),
  edosnov    VARCHAR2(15),
  sumpl1     VARCHAR2(22),
  sumpl2     VARCHAR2(22),
  pr_plt     NUMBER(5),
  pr_cod     VARCHAR2(4),
  calcul     NUMBER(5)
)
;
comment on table EXP_DBF_TPO_ITP
  is '������� EXP_DBF_TPO_ITP';
comment on column EXP_DBF_TPO_ITP.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_ITP.cod_mainpl
  is 'COD_MAINPL';
comment on column EXP_DBF_TPO_ITP.cod_plat
  is 'COD_PLAT';
comment on column EXP_DBF_TPO_ITP.osn_natch
  is 'OSN_NATCH';
comment on column EXP_DBF_TPO_ITP.stavka
  is 'STAVKA';
comment on column EXP_DBF_TPO_ITP.sum_rub
  is 'SUM_RUB';
comment on column EXP_DBF_TPO_ITP.edstav
  is 'EDSTAV';
comment on column EXP_DBF_TPO_ITP.edosnov
  is 'EDOSNOV';
comment on column EXP_DBF_TPO_ITP.sumpl1
  is 'SUMPL1';
comment on column EXP_DBF_TPO_ITP.sumpl2
  is 'SUMPL2';
comment on column EXP_DBF_TPO_ITP.pr_plt
  is 'PR_PLT';
comment on column EXP_DBF_TPO_ITP.pr_cod
  is 'PR_COD';
comment on column EXP_DBF_TPO_ITP.calcul
  is 'CALCUL';

prompt
prompt Creating table EXP_DBF_TPO_PLT
prompt ==============================
prompt
create table EXP_DBF_TPO_PLT
(
  num_tpo  VARCHAR2(10),
  sp       VARCHAR2(2),
  inn      VARCHAR2(12),
  kpp      VARCHAR2(9),
  num_doc  VARCHAR2(50),
  date_doc DATE,
  summa    NUMBER,
  kodval   VARCHAR2(3),
  sum_tpo  NUMBER,
  vidnac   VARCHAR2(3),
  schr     VARCHAR2(20),
  bic      VARCHAR2(9),
  kpph     VARCHAR2(9),
  id       INTEGER,
  name     VARCHAR2(80),
  kbk      VARCHAR2(20)
)
;
comment on table EXP_DBF_TPO_PLT
  is '������� EXP_DBF_TPO_PLT';
comment on column EXP_DBF_TPO_PLT.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_PLT.sp
  is 'SP';
comment on column EXP_DBF_TPO_PLT.inn
  is 'INN';
comment on column EXP_DBF_TPO_PLT.kpp
  is 'KPP';
comment on column EXP_DBF_TPO_PLT.num_doc
  is 'NUM_DOC';
comment on column EXP_DBF_TPO_PLT.date_doc
  is 'DATE_DOC';
comment on column EXP_DBF_TPO_PLT.summa
  is 'SUMMA';
comment on column EXP_DBF_TPO_PLT.kodval
  is 'KODVAL';
comment on column EXP_DBF_TPO_PLT.sum_tpo
  is 'SUM_TPO';
comment on column EXP_DBF_TPO_PLT.vidnac
  is 'VIDNAC';
comment on column EXP_DBF_TPO_PLT.schr
  is 'SCHR';
comment on column EXP_DBF_TPO_PLT.bic
  is 'BIC';
comment on column EXP_DBF_TPO_PLT.kpph
  is 'KPPH';
comment on column EXP_DBF_TPO_PLT.id
  is 'ID';
comment on column EXP_DBF_TPO_PLT.name
  is 'NAME';
comment on column EXP_DBF_TPO_PLT.kbk
  is 'KBK';

prompt
prompt Creating table EXP_DBF_TPO_PLTPERIO
prompt ===================================
prompt
create table EXP_DBF_TPO_PLTPERIO
(
  num_tpo  VARCHAR2(10) not null,
  num_dtpo VARCHAR2(1) not null,
  pos_dtpo VARCHAR2(2) not null,
  begdat   DATE,
  enddat   DATE,
  mont     NUMBER(5),
  stavka   NUMBER,
  sum_val  NUMBER,
  sum_usd  NUMBER,
  prevtpo  VARCHAR2(26)
)
;
comment on table EXP_DBF_TPO_PLTPERIO
  is '������� EXP_DBF_TPO_PLTPERIO';
comment on column EXP_DBF_TPO_PLTPERIO.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_PLTPERIO.num_dtpo
  is 'NUM_DTPO';
comment on column EXP_DBF_TPO_PLTPERIO.pos_dtpo
  is 'POS_DTPO';
comment on column EXP_DBF_TPO_PLTPERIO.begdat
  is 'BEGDAT';
comment on column EXP_DBF_TPO_PLTPERIO.enddat
  is 'ENDDAT';
comment on column EXP_DBF_TPO_PLTPERIO.mont
  is 'MONT';
comment on column EXP_DBF_TPO_PLTPERIO.stavka
  is 'STAVKA';
comment on column EXP_DBF_TPO_PLTPERIO.sum_val
  is 'SUM_VAL';
comment on column EXP_DBF_TPO_PLTPERIO.sum_usd
  is 'SUM_USD';
comment on column EXP_DBF_TPO_PLTPERIO.prevtpo
  is 'PREVTPO';

prompt
prompt Creating table EXP_DBF_TPO_TDOP
prompt ===============================
prompt
create table EXP_DBF_TPO_TDOP
(
  num_tpo    VARCHAR2(10),
  num_dtpo   VARCHAR2(1),
  pos_dtpo   VARCHAR2(2),
  stavposhl  NUMBER,
  stavposhl2 NUMBER,
  stavakciz  NUMBER,
  stavnds    NUMBER,
  edposhl    NUMBER(5),
  edakciz    NUMBER(5),
  ednds      NUMBER(5),
  sumposhl   NUMBER,
  sumakciz   NUMBER,
  sumnds     NUMBER,
  osnposhl   NUMBER,
  osnakciz   NUMBER,
  osnnds     NUMBER,
  edosnposhl VARCHAR2(7),
  edosnakciz VARCHAR2(7),
  edosnnds   VARCHAR2(7),
  sto        NUMBER,
  sumsb      NUMBER,
  cod_poshl  VARCHAR2(3),
  cod_akc    VARCHAR2(3),
  cod_nds    VARCHAR2(3)
)
;
comment on table EXP_DBF_TPO_TDOP
  is '������� EXP_DBF_TPO_TDOP';
comment on column EXP_DBF_TPO_TDOP.num_tpo
  is 'NUM_TPO';
comment on column EXP_DBF_TPO_TDOP.num_dtpo
  is 'NUM_DTPO';
comment on column EXP_DBF_TPO_TDOP.pos_dtpo
  is 'POS_DTPO';
comment on column EXP_DBF_TPO_TDOP.stavposhl
  is 'STAVPOSHL';
comment on column EXP_DBF_TPO_TDOP.stavposhl2
  is 'STAVPOSHL2';
comment on column EXP_DBF_TPO_TDOP.stavakciz
  is 'STAVAKCIZ';
comment on column EXP_DBF_TPO_TDOP.stavnds
  is 'STAVNDS';
comment on column EXP_DBF_TPO_TDOP.edposhl
  is 'EDPOSHL';
comment on column EXP_DBF_TPO_TDOP.edakciz
  is 'EDAKCIZ';
comment on column EXP_DBF_TPO_TDOP.ednds
  is 'EDNDS';
comment on column EXP_DBF_TPO_TDOP.sumposhl
  is 'SUMPOSHL';
comment on column EXP_DBF_TPO_TDOP.sumakciz
  is 'SUMAKCIZ';
comment on column EXP_DBF_TPO_TDOP.sumnds
  is 'SUMNDS';
comment on column EXP_DBF_TPO_TDOP.osnposhl
  is 'OSNPOSHL';
comment on column EXP_DBF_TPO_TDOP.osnakciz
  is 'OSNAKCIZ';
comment on column EXP_DBF_TPO_TDOP.osnnds
  is 'OSNNDS';
comment on column EXP_DBF_TPO_TDOP.edosnposhl
  is 'EDOSNPOSHL';
comment on column EXP_DBF_TPO_TDOP.edosnakciz
  is 'EDOSNAKCIZ';
comment on column EXP_DBF_TPO_TDOP.edosnnds
  is 'EDOSNNDS';
comment on column EXP_DBF_TPO_TDOP.sto
  is 'STO';
comment on column EXP_DBF_TPO_TDOP.sumsb
  is 'SUMSB';
comment on column EXP_DBF_TPO_TDOP.cod_poshl
  is 'COD_POSHL';
comment on column EXP_DBF_TPO_TDOP.cod_akc
  is 'COD_AKC';
comment on column EXP_DBF_TPO_TDOP.cod_nds
  is 'COD_NDS';

prompt
prompt Creating table EXP_DECL_GOODS
prompt =============================
prompt
create table EXP_DECL_GOODS
(
  id          NUMBER(15) not null,
  decl_id     NUMBER(15) not null,
  no          NUMBER(4),
  goods_code  VARCHAR2(1500),
  g36         VARCHAR2(5),
  g37         VARCHAR2(6),
  goods_count NUMBER(30,6),
  new_id      NUMBER(15),
  imperrmsg   VARCHAR2(2000)
)
;
comment on table EXP_DECL_GOODS
  is '������� EXP_DECL_GOODS';
comment on column EXP_DECL_GOODS.id
  is 'ID';
comment on column EXP_DECL_GOODS.decl_id
  is 'DECL_ID';
comment on column EXP_DECL_GOODS.no
  is 'NO';
comment on column EXP_DECL_GOODS.goods_code
  is 'GOODS_CODE';
comment on column EXP_DECL_GOODS.g36
  is 'G36';
comment on column EXP_DECL_GOODS.g37
  is 'G37';
comment on column EXP_DECL_GOODS.goods_count
  is 'GOODS_COUNT';
comment on column EXP_DECL_GOODS.new_id
  is 'NEW_ID';
comment on column EXP_DECL_GOODS.imperrmsg
  is 'IMPERRMSG';
create index FK#EXP_DECL_GOODS#DECL_ID on EXP_DECL_GOODS (DECL_ID);
alter table EXP_DECL_GOODS
  add constraint PK#EXP_DECL_GOODS#ID primary key (ID);

prompt
prompt Creating table EXP_GOODS_CHARGE
prompt ===============================
prompt
create table EXP_GOODS_CHARGE
(
  id            NUMBER(15) not null,
  decl_goods_id NUMBER(15) not null,
  pay_type_code VARCHAR2(1500) not null,
  pay_mode_code VARCHAR2(1500) not null,
  summa         NUMBER(22,2),
  currency_code VARCHAR2(1500) not null,
  change_desc   VARCHAR2(2000),
  change_date   DATE,
  new_id        NUMBER(15),
  imperrmsg     VARCHAR2(2000)
)
;
comment on table EXP_GOODS_CHARGE
  is '������� EXP_GOODS_CHARGE';
comment on column EXP_GOODS_CHARGE.id
  is 'ID';
comment on column EXP_GOODS_CHARGE.decl_goods_id
  is 'DECL_GOODS_ID';
comment on column EXP_GOODS_CHARGE.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column EXP_GOODS_CHARGE.pay_mode_code
  is 'PAY_MODE_CODE';
comment on column EXP_GOODS_CHARGE.summa
  is 'SUMMA';
comment on column EXP_GOODS_CHARGE.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_GOODS_CHARGE.change_desc
  is 'CHANGE_DESC';
comment on column EXP_GOODS_CHARGE.change_date
  is 'CHANGE_DATE';
comment on column EXP_GOODS_CHARGE.new_id
  is 'NEW_ID';
comment on column EXP_GOODS_CHARGE.imperrmsg
  is 'IMPERRMSG';
create index FK#EXP_GOODS_CHARGE#DECL_ID on EXP_GOODS_CHARGE (DECL_GOODS_ID);
alter table EXP_GOODS_CHARGE
  add constraint PK#EXP_GOODS_CHARGE#ID primary key (ID);

prompt
prompt Creating table EXP_GTD
prompt ======================
prompt
create table EXP_GTD
(
  id               NUMBER(15) not null,
  g011             VARCHAR2(2),
  okpo             VARCHAR2(10),
  inn              VARCHAR2(12),
  g12              NUMBER(22,2),
  g444a            VARCHAR2(80),
  g444b            DATE,
  g447a            VARCHAR2(50),
  g447b            DATE,
  k115             VARCHAR2(100),
  g40              VARCHAR2(23),
  g221             VARCHAR2(3),
  act_no           VARCHAR2(30),
  gd1              DATE,
  export_date      DATE,
  g0131_code       VARCHAR2(1500),
  charge_month     DATE,
  load_from_dk     NUMBER(1),
  tax_exemption    NUMBER(1),
  payed_months     NUMBER(2),
  next_pay_month   DATE,
  subject_id       NUMBER(15),
  subject_name     VARCHAR2(1500),
  subject_inn      VARCHAR2(12),
  subject_kpp      VARCHAR2(10),
  currency_code    VARCHAR2(3),
  custom_mode_code VARCHAR2(1500),
  customs_code     VARCHAR2(8),
  reg_date         DATE,
  decl_no          VARCHAR2(10),
  modify_date      DATE not null,
  decision_code    VARCHAR2(2),
  doc_date         DATE,
  doc_number       VARCHAR2(100),
  is_active        CHAR(1) not null,
  activation_date  DATE,
  state_name       VARCHAR2(1500),
  ext_source       VARCHAR2(8),
  ext_typesysname  VARCHAR2(1500),
  ext_id           NUMBER(15),
  step             NUMBER,
  new_id           NUMBER(15),
  imperrmsg        VARCHAR2(2000)
)
;
comment on table EXP_GTD
  is '������� EXP_GTD';
comment on column EXP_GTD.id
  is 'ID';
comment on column EXP_GTD.g011
  is 'G011';
comment on column EXP_GTD.okpo
  is 'OKPO';
comment on column EXP_GTD.inn
  is 'INN';
comment on column EXP_GTD.g12
  is 'G12';
comment on column EXP_GTD.g444a
  is 'G444A';
comment on column EXP_GTD.g444b
  is 'G444B';
comment on column EXP_GTD.g447a
  is 'G447A';
comment on column EXP_GTD.g447b
  is 'G447B';
comment on column EXP_GTD.k115
  is 'K115';
comment on column EXP_GTD.g40
  is 'G40';
comment on column EXP_GTD.g221
  is 'G221';
comment on column EXP_GTD.act_no
  is 'ACT_NO';
comment on column EXP_GTD.gd1
  is 'GD1';
comment on column EXP_GTD.export_date
  is 'EXPORT_DATE';
comment on column EXP_GTD.g0131_code
  is 'G0131_CODE';
comment on column EXP_GTD.charge_month
  is 'CHARGE_MONTH';
comment on column EXP_GTD.load_from_dk
  is 'LOAD_FROM_DK';
comment on column EXP_GTD.tax_exemption
  is 'TAX_EXEMPTION';
comment on column EXP_GTD.payed_months
  is 'PAYED_MONTHS';
comment on column EXP_GTD.next_pay_month
  is 'NEXT_PAY_MONTH';
comment on column EXP_GTD.subject_id
  is 'SUBJECT_ID';
comment on column EXP_GTD.subject_name
  is 'SUBJECT_NAME';
comment on column EXP_GTD.subject_inn
  is 'SUBJECT_INN';
comment on column EXP_GTD.subject_kpp
  is 'SUBJECT_KPP';
comment on column EXP_GTD.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_GTD.custom_mode_code
  is 'CUSTOM_MODE_CODE';
comment on column EXP_GTD.customs_code
  is 'CUSTOMS_CODE';
comment on column EXP_GTD.reg_date
  is 'REG_DATE';
comment on column EXP_GTD.decl_no
  is 'DECL_NO';
comment on column EXP_GTD.modify_date
  is 'MODIFY_DATE';
comment on column EXP_GTD.decision_code
  is 'DECISION_CODE';
comment on column EXP_GTD.doc_date
  is 'DOC_DATE';
comment on column EXP_GTD.doc_number
  is 'DOC_NUMBER';
comment on column EXP_GTD.is_active
  is 'IS_ACTIVE';
comment on column EXP_GTD.activation_date
  is 'ACTIVATION_DATE';
comment on column EXP_GTD.state_name
  is 'STATE_NAME';
comment on column EXP_GTD.ext_source
  is 'EXT_SOURCE';
comment on column EXP_GTD.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_GTD.ext_id
  is 'EXT_ID';
comment on column EXP_GTD.step
  is 'STEP';
comment on column EXP_GTD.new_id
  is 'NEW_ID';
comment on column EXP_GTD.imperrmsg
  is 'IMPERRMSG';
alter table EXP_GTD
  add constraint PK#EXP_GTD#ID primary key (ID);
alter table EXP_GTD
  add constraint UNQ#EXP_GTD unique (EXT_SOURCE, EXT_TYPESYSNAME, EXT_ID);

prompt
prompt Creating table EXP_GTD_CHARGE
prompt =============================
prompt
create table EXP_GTD_CHARGE
(
  id                 NUMBER(15) not null,
  decl_id            NUMBER(15) not null,
  pay_type_code      VARCHAR2(1500),
  summa              NUMBER(22,2) not null,
  currency_code      VARCHAR2(3),
  change_reason_code VARCHAR2(1500),
  change_desc        VARCHAR2(2000),
  change_date        DATE,
  kbkcode            VARCHAR2(1500),
  charge_month       DATE,
  ext_source         VARCHAR2(8),
  ext_typesysname    VARCHAR2(1500),
  ext_id             NUMBER(15),
  new_id             NUMBER(15),
  imperrmsg          VARCHAR2(2000)
)
;
comment on table EXP_GTD_CHARGE
  is '������� EXP_GTD_CHARGE';
comment on column EXP_GTD_CHARGE.id
  is 'ID';
comment on column EXP_GTD_CHARGE.decl_id
  is 'DECL_ID';
comment on column EXP_GTD_CHARGE.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column EXP_GTD_CHARGE.summa
  is 'SUMMA';
comment on column EXP_GTD_CHARGE.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_GTD_CHARGE.change_reason_code
  is 'CHANGE_REASON_CODE';
comment on column EXP_GTD_CHARGE.change_desc
  is 'CHANGE_DESC';
comment on column EXP_GTD_CHARGE.change_date
  is 'CHANGE_DATE';
comment on column EXP_GTD_CHARGE.kbkcode
  is 'KBKCODE';
comment on column EXP_GTD_CHARGE.charge_month
  is 'CHARGE_MONTH';
comment on column EXP_GTD_CHARGE.ext_source
  is 'EXT_SOURCE';
comment on column EXP_GTD_CHARGE.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_GTD_CHARGE.ext_id
  is 'EXT_ID';
comment on column EXP_GTD_CHARGE.new_id
  is 'NEW_ID';
comment on column EXP_GTD_CHARGE.imperrmsg
  is 'IMPERRMSG';
create index FK#EXP_GTD_CHARGE#DECL_ID on EXP_GTD_CHARGE (DECL_ID);
alter table EXP_GTD_CHARGE
  add constraint PK#EXP_GTD_CHARGE#ID primary key (ID);
alter table EXP_GTD_CHARGE
  add constraint UNQ#EXP_GTD_CHARGE unique (EXT_SOURCE, EXT_TYPESYSNAME, EXT_ID);

prompt
prompt Creating table EXP_GTD_DEDUCTION
prompt ================================
prompt
create table EXP_GTD_DEDUCTION
(
  id              NUMBER(15) not null,
  decl_id         NUMBER(15),
  payment_id      NUMBER(15),
  pay_type_code   VARCHAR2(1500),
  summa           NUMBER(24,4) not null,
  payment_date    DATE,
  payment_month   DATE,
  currency_code   VARCHAR2(3),
  charge_summa    NUMBER(24,4),
  charge_id       INTEGER,
  kbkcode         VARCHAR2(1500),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15),
  new_id          NUMBER(15),
  imperrmsg       VARCHAR2(2000)
)
;
comment on table EXP_GTD_DEDUCTION
  is '������� EXP_GTD_DEDUCTION';
comment on column EXP_GTD_DEDUCTION.id
  is 'ID';
comment on column EXP_GTD_DEDUCTION.decl_id
  is 'DECL_ID';
comment on column EXP_GTD_DEDUCTION.payment_id
  is 'PAYMENT_ID';
comment on column EXP_GTD_DEDUCTION.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column EXP_GTD_DEDUCTION.summa
  is 'SUMMA';
comment on column EXP_GTD_DEDUCTION.payment_date
  is 'PAYMENT_DATE';
comment on column EXP_GTD_DEDUCTION.payment_month
  is 'PAYMENT_MONTH';
comment on column EXP_GTD_DEDUCTION.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_GTD_DEDUCTION.charge_summa
  is 'CHARGE_SUMMA';
comment on column EXP_GTD_DEDUCTION.charge_id
  is 'CHARGE_ID';
comment on column EXP_GTD_DEDUCTION.kbkcode
  is 'KBKCODE';
comment on column EXP_GTD_DEDUCTION.ext_source
  is 'EXT_SOURCE';
comment on column EXP_GTD_DEDUCTION.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_GTD_DEDUCTION.ext_id
  is 'EXT_ID';
comment on column EXP_GTD_DEDUCTION.new_id
  is 'NEW_ID';
comment on column EXP_GTD_DEDUCTION.imperrmsg
  is 'IMPERRMSG';
create index FK#EXP_GTD_DED#CHANGE on EXP_GTD_DEDUCTION (CHARGE_ID);
create index FK#EXP_GTD_DED#DECL_ID on EXP_GTD_DEDUCTION (DECL_ID);
create index FK#EXP_GTD_DED#PAYMENT on EXP_GTD_DEDUCTION (PAYMENT_ID);
alter table EXP_GTD_DEDUCTION
  add constraint PK#EXP_GTD_DED#ID primary key (ID);
alter table EXP_GTD_DEDUCTION
  add constraint UNQ#EXP_GTD_DEDUCTION unique (EXT_SOURCE, EXT_TYPESYSNAME, EXT_ID);

prompt
prompt Creating table EXP_NSI_BANK
prompt ===========================
prompt
create table EXP_NSI_BANK
(
  id             NUMBER(15),
  name           VARCHAR2(1500),
  shortname      VARCHAR2(1500),
  typesysname    VARCHAR2(1500),
  descript       VARCHAR2(1500),
  address        VARCHAR2(200),
  full_name      VARCHAR2(4000),
  okpo           VARCHAR2(10),
  inn            VARCHAR2(12),
  ogrn           VARCHAR2(30),
  soato          VARCHAR2(8),
  kpp            VARCHAR2(10),
  phone          VARCHAR2(40),
  fax            VARCHAR2(30),
  telex          VARCHAR2(30),
  telegraph      VARCHAR2(100),
  teletype       VARCHAR2(100),
  bic            VARCHAR2(10),
  rur_lic_date   DATE,
  val_lic_date   DATE,
  chief_name     VARCHAR2(100),
  chief_acc_name VARCHAR2(100),
  new_id         NUMBER(15),
  imperrmsg      VARCHAR2(2000)
)
;
comment on table EXP_NSI_BANK
  is '������� EXP_NSI_BANK';
comment on column EXP_NSI_BANK.id
  is 'ID';
comment on column EXP_NSI_BANK.name
  is 'NAME';
comment on column EXP_NSI_BANK.shortname
  is 'SHORTNAME';
comment on column EXP_NSI_BANK.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_BANK.descript
  is 'DESCRIPT';
comment on column EXP_NSI_BANK.address
  is 'ADDRESS';
comment on column EXP_NSI_BANK.full_name
  is 'FULL_NAME';
comment on column EXP_NSI_BANK.okpo
  is 'OKPO';
comment on column EXP_NSI_BANK.inn
  is 'INN';
comment on column EXP_NSI_BANK.ogrn
  is 'OGRN';
comment on column EXP_NSI_BANK.soato
  is 'SOATO';
comment on column EXP_NSI_BANK.kpp
  is 'KPP';
comment on column EXP_NSI_BANK.phone
  is 'PHONE';
comment on column EXP_NSI_BANK.fax
  is 'FAX';
comment on column EXP_NSI_BANK.telex
  is 'TELEX';
comment on column EXP_NSI_BANK.telegraph
  is 'TELEGRAPH';
comment on column EXP_NSI_BANK.teletype
  is 'TELETYPE';
comment on column EXP_NSI_BANK.bic
  is 'BIC';
comment on column EXP_NSI_BANK.rur_lic_date
  is 'RUR_LIC_DATE';
comment on column EXP_NSI_BANK.val_lic_date
  is 'VAL_LIC_DATE';
comment on column EXP_NSI_BANK.chief_name
  is 'CHIEF_NAME';
comment on column EXP_NSI_BANK.chief_acc_name
  is 'CHIEF_ACC_NAME';
comment on column EXP_NSI_BANK.new_id
  is 'NEW_ID';
comment on column EXP_NSI_BANK.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_NSI_BANKFORCASH
prompt ==================================
prompt
create table EXP_NSI_BANKFORCASH
(
  id                     NUMBER(15),
  typesysname            VARCHAR2(1500),
  bank_name              VARCHAR2(1500),
  bic                    VARCHAR2(10),
  inn                    VARCHAR2(12),
  kpp                    VARCHAR2(10),
  payment_to_order_ratio VARCHAR2(10) not null,
  file_format_code       VARCHAR2(20),
  new_id                 NUMBER(15),
  imperrmsg              VARCHAR2(2000)
)
;
comment on table EXP_NSI_BANKFORCASH
  is '������� EXP_NSI_BANKFORCASH';
comment on column EXP_NSI_BANKFORCASH.id
  is 'ID';
comment on column EXP_NSI_BANKFORCASH.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_BANKFORCASH.bank_name
  is 'BANK_NAME';
comment on column EXP_NSI_BANKFORCASH.bic
  is 'BIC';
comment on column EXP_NSI_BANKFORCASH.inn
  is 'INN';
comment on column EXP_NSI_BANKFORCASH.kpp
  is 'KPP';
comment on column EXP_NSI_BANKFORCASH.payment_to_order_ratio
  is 'PAYMENT_TO_ORDER_RATIO';
comment on column EXP_NSI_BANKFORCASH.file_format_code
  is 'FILE_FORMAT_CODE';
comment on column EXP_NSI_BANKFORCASH.new_id
  is 'NEW_ID';
comment on column EXP_NSI_BANKFORCASH.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_NSI_BROKER
prompt =============================
prompt
create table EXP_NSI_BROKER
(
  id          NUMBER(15),
  name        VARCHAR2(1500),
  shortname   VARCHAR2(1500),
  typesysname VARCHAR2(1500),
  descript    VARCHAR2(1500),
  address     VARCHAR2(200),
  full_name   VARCHAR2(4000),
  okpo        VARCHAR2(10),
  inn         VARCHAR2(12),
  ogrn        VARCHAR2(30),
  soato       VARCHAR2(8),
  kpp         VARCHAR2(10),
  phone       VARCHAR2(40),
  fax         VARCHAR2(30),
  telex       VARCHAR2(30),
  telegraph   VARCHAR2(100),
  teletype    VARCHAR2(100),
  license_no  VARCHAR2(30) not null,
  beg_date    DATE,
  end_date    DATE,
  bskoltoi    NUMBER,
  bskoltoii   NUMBER,
  new_id      NUMBER(15),
  imperrmsg   VARCHAR2(2000)
)
;
comment on table EXP_NSI_BROKER
  is '������� EXP_NSI_BROKER';
comment on column EXP_NSI_BROKER.id
  is 'ID';
comment on column EXP_NSI_BROKER.name
  is 'NAME';
comment on column EXP_NSI_BROKER.shortname
  is 'SHORTNAME';
comment on column EXP_NSI_BROKER.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_BROKER.descript
  is 'DESCRIPT';
comment on column EXP_NSI_BROKER.address
  is 'ADDRESS';
comment on column EXP_NSI_BROKER.full_name
  is 'FULL_NAME';
comment on column EXP_NSI_BROKER.okpo
  is 'OKPO';
comment on column EXP_NSI_BROKER.inn
  is 'INN';
comment on column EXP_NSI_BROKER.ogrn
  is 'OGRN';
comment on column EXP_NSI_BROKER.soato
  is 'SOATO';
comment on column EXP_NSI_BROKER.kpp
  is 'KPP';
comment on column EXP_NSI_BROKER.phone
  is 'PHONE';
comment on column EXP_NSI_BROKER.fax
  is 'FAX';
comment on column EXP_NSI_BROKER.telex
  is 'TELEX';
comment on column EXP_NSI_BROKER.telegraph
  is 'TELEGRAPH';
comment on column EXP_NSI_BROKER.teletype
  is 'TELETYPE';
comment on column EXP_NSI_BROKER.license_no
  is 'LICENSE_NO';
comment on column EXP_NSI_BROKER.beg_date
  is 'BEG_DATE';
comment on column EXP_NSI_BROKER.end_date
  is 'END_DATE';
comment on column EXP_NSI_BROKER.bskoltoi
  is 'BSKOLTOI';
comment on column EXP_NSI_BROKER.bskoltoii
  is 'BSKOLTOII';
comment on column EXP_NSI_BROKER.new_id
  is 'NEW_ID';
comment on column EXP_NSI_BROKER.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_NSI_CASHDESK
prompt ===============================
prompt
create table EXP_NSI_CASHDESK
(
  id          NUMBER(15),
  name        VARCHAR2(1500),
  shortname   VARCHAR2(1500),
  sysname     VARCHAR2(1500),
  typesysname VARCHAR2(1500),
  descript    VARCHAR2(1500),
  bank_id     NUMBER(15),
  new_id      NUMBER(15),
  imperrmsg   VARCHAR2(2000)
)
;
comment on table EXP_NSI_CASHDESK
  is '������� EXP_NSI_CASHDESK';
comment on column EXP_NSI_CASHDESK.id
  is 'ID';
comment on column EXP_NSI_CASHDESK.name
  is 'NAME';
comment on column EXP_NSI_CASHDESK.shortname
  is 'SHORTNAME';
comment on column EXP_NSI_CASHDESK.sysname
  is 'SYSNAME';
comment on column EXP_NSI_CASHDESK.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_CASHDESK.descript
  is 'DESCRIPT';
comment on column EXP_NSI_CASHDESK.bank_id
  is 'BANK_ID';
comment on column EXP_NSI_CASHDESK.new_id
  is 'NEW_ID';
comment on column EXP_NSI_CASHDESK.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_NSI_DECLARANT
prompt ================================
prompt
create table EXP_NSI_DECLARANT
(
  id          NUMBER(15),
  name        VARCHAR2(1500),
  shortname   VARCHAR2(1500),
  typesysname VARCHAR2(1500),
  descript    VARCHAR2(1500),
  address     VARCHAR2(200),
  full_name   VARCHAR2(4000),
  okpo        VARCHAR2(10),
  inn         VARCHAR2(12),
  ogrn        VARCHAR2(30),
  soato       VARCHAR2(8),
  kpp         VARCHAR2(10),
  phone       VARCHAR2(40),
  fax         VARCHAR2(30),
  telex       VARCHAR2(30),
  telegraph   VARCHAR2(100),
  teletype    VARCHAR2(100),
  category    VARCHAR2(3),
  custom_code VARCHAR2(10),
  reg_date    DATE,
  post9       VARCHAR2(9),
  alfa2       VARCHAR2(2),
  is_big      NUMBER,
  is_nsi      NUMBER,
  new_id      NUMBER(15),
  imperrmsg   VARCHAR2(2000)
)
;
comment on table EXP_NSI_DECLARANT
  is '������� EXP_NSI_DECLARANT';
comment on column EXP_NSI_DECLARANT.id
  is 'ID';
comment on column EXP_NSI_DECLARANT.name
  is 'NAME';
comment on column EXP_NSI_DECLARANT.shortname
  is 'SHORTNAME';
comment on column EXP_NSI_DECLARANT.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_DECLARANT.descript
  is 'DESCRIPT';
comment on column EXP_NSI_DECLARANT.address
  is 'ADDRESS';
comment on column EXP_NSI_DECLARANT.full_name
  is 'FULL_NAME';
comment on column EXP_NSI_DECLARANT.okpo
  is 'OKPO';
comment on column EXP_NSI_DECLARANT.inn
  is 'INN';
comment on column EXP_NSI_DECLARANT.ogrn
  is 'OGRN';
comment on column EXP_NSI_DECLARANT.soato
  is 'SOATO';
comment on column EXP_NSI_DECLARANT.kpp
  is 'KPP';
comment on column EXP_NSI_DECLARANT.phone
  is 'PHONE';
comment on column EXP_NSI_DECLARANT.fax
  is 'FAX';
comment on column EXP_NSI_DECLARANT.telex
  is 'TELEX';
comment on column EXP_NSI_DECLARANT.telegraph
  is 'TELEGRAPH';
comment on column EXP_NSI_DECLARANT.teletype
  is 'TELETYPE';
comment on column EXP_NSI_DECLARANT.category
  is 'CATEGORY';
comment on column EXP_NSI_DECLARANT.custom_code
  is 'CUSTOM_CODE';
comment on column EXP_NSI_DECLARANT.reg_date
  is 'REG_DATE';
comment on column EXP_NSI_DECLARANT.post9
  is 'POST9';
comment on column EXP_NSI_DECLARANT.alfa2
  is 'ALFA2';
comment on column EXP_NSI_DECLARANT.is_big
  is 'IS_BIG';
comment on column EXP_NSI_DECLARANT.is_nsi
  is 'IS_NSI';
comment on column EXP_NSI_DECLARANT.new_id
  is 'NEW_ID';
comment on column EXP_NSI_DECLARANT.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_NSI_PERSON
prompt =============================
prompt
create table EXP_NSI_PERSON
(
  id           NUMBER(15),
  name         VARCHAR2(1500),
  shortname    VARCHAR2(1500),
  typesysname  VARCHAR2(1500),
  address      VARCHAR2(200),
  inn          VARCHAR2(12),
  phone        VARCHAR2(40),
  last_name    VARCHAR2(100) not null,
  first_name   VARCHAR2(100),
  middle_name  VARCHAR2(100),
  country_code VARCHAR2(3),
  doc_type     VARCHAR2(3),
  ser_no       VARCHAR2(30),
  doc_no       VARCHAR2(30),
  issued_by    VARCHAR2(100),
  issued_date  DATE,
  new_id       NUMBER(15),
  imperrmsg    VARCHAR2(2000)
)
;
comment on table EXP_NSI_PERSON
  is '������� EXP_NSI_PERSON';
comment on column EXP_NSI_PERSON.id
  is 'ID';
comment on column EXP_NSI_PERSON.name
  is 'NAME';
comment on column EXP_NSI_PERSON.shortname
  is 'SHORTNAME';
comment on column EXP_NSI_PERSON.typesysname
  is 'TYPESYSNAME';
comment on column EXP_NSI_PERSON.address
  is 'ADDRESS';
comment on column EXP_NSI_PERSON.inn
  is 'INN';
comment on column EXP_NSI_PERSON.phone
  is 'PHONE';
comment on column EXP_NSI_PERSON.last_name
  is 'LAST_NAME';
comment on column EXP_NSI_PERSON.first_name
  is 'FIRST_NAME';
comment on column EXP_NSI_PERSON.middle_name
  is 'MIDDLE_NAME';
comment on column EXP_NSI_PERSON.country_code
  is 'COUNTRY_CODE';
comment on column EXP_NSI_PERSON.doc_type
  is 'DOC_TYPE';
comment on column EXP_NSI_PERSON.ser_no
  is 'SER_NO';
comment on column EXP_NSI_PERSON.doc_no
  is 'DOC_NO';
comment on column EXP_NSI_PERSON.issued_by
  is 'ISSUED_BY';
comment on column EXP_NSI_PERSON.issued_date
  is 'ISSUED_DATE';
comment on column EXP_NSI_PERSON.new_id
  is 'NEW_ID';
comment on column EXP_NSI_PERSON.imperrmsg
  is 'IMPERRMSG';

prompt
prompt Creating table EXP_PERIODIC_CHARGE
prompt ==================================
prompt
create table EXP_PERIODIC_CHARGE
(
  id            NUMBER(15) not null,
  decl_id       NUMBER(15) not null,
  month_summa   NUMBER(22,2),
  currency_id   NUMBER(15) not null,
  pay_type_id   NUMBER(15) not null,
  kbk_code_id   NUMBER(15),
  currency_code VARCHAR2(50),
  pay_type_code VARCHAR2(50),
  kbk_code      VARCHAR2(50),
  new_id        NUMBER(15),
  imperrmsg     VARCHAR2(2000)
)
;
comment on table EXP_PERIODIC_CHARGE
  is '������� EXP_PERIODIC_CHARGE';
comment on column EXP_PERIODIC_CHARGE.id
  is 'ID';
comment on column EXP_PERIODIC_CHARGE.decl_id
  is 'DECL_ID';
comment on column EXP_PERIODIC_CHARGE.month_summa
  is 'MONTH_SUMMA';
comment on column EXP_PERIODIC_CHARGE.currency_id
  is 'CURRENCY_ID';
comment on column EXP_PERIODIC_CHARGE.pay_type_id
  is 'PAY_TYPE_ID';
comment on column EXP_PERIODIC_CHARGE.kbk_code_id
  is 'KBK_CODE_ID';
comment on column EXP_PERIODIC_CHARGE.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_PERIODIC_CHARGE.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column EXP_PERIODIC_CHARGE.kbk_code
  is 'KBK_CODE';
comment on column EXP_PERIODIC_CHARGE.new_id
  is 'NEW_ID';
comment on column EXP_PERIODIC_CHARGE.imperrmsg
  is 'IMPERRMSG';
alter table EXP_PERIODIC_CHARGE
  add constraint EXP_PERIODIC_CHARGES_PK primary key (ID);

prompt
prompt Creating table EXP_RESERV
prompt =========================
prompt
create table EXP_RESERV
(
  id              NUMBER(15) not null,
  doc_number      VARCHAR2(100),
  doc_date        DATE,
  payment_id      NUMBER(15) not null,
  summa           NUMBER(22,2) not null,
  payment_date    DATE not null,
  reason_code     VARCHAR2(2) not null,
  bdate           DATE not null,
  edate           DATE,
  customs_code    VARCHAR2(8),
  reg_date        DATE,
  decl_no         VARCHAR2(10),
  note            VARCHAR2(1000),
  subject_id      NUMBER(15),
  subject_inn     VARCHAR2(12),
  subject_kpp     VARCHAR2(10),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15),
  new_id          NUMBER(15),
  imperrmsg       VARCHAR2(2000)
)
;
comment on table EXP_RESERV
  is '������� EXP_RESERV';
comment on column EXP_RESERV.id
  is 'ID';
comment on column EXP_RESERV.doc_number
  is 'DOC_NUMBER';
comment on column EXP_RESERV.doc_date
  is 'DOC_DATE';
comment on column EXP_RESERV.payment_id
  is 'PAYMENT_ID';
comment on column EXP_RESERV.summa
  is 'SUMMA';
comment on column EXP_RESERV.payment_date
  is 'PAYMENT_DATE';
comment on column EXP_RESERV.reason_code
  is 'REASON_CODE';
comment on column EXP_RESERV.bdate
  is 'BDATE';
comment on column EXP_RESERV.edate
  is 'EDATE';
comment on column EXP_RESERV.customs_code
  is 'CUSTOMS_CODE';
comment on column EXP_RESERV.reg_date
  is 'REG_DATE';
comment on column EXP_RESERV.decl_no
  is 'DECL_NO';
comment on column EXP_RESERV.note
  is 'NOTE';
comment on column EXP_RESERV.subject_id
  is 'SUBJECT_ID';
comment on column EXP_RESERV.subject_inn
  is 'SUBJECT_INN';
comment on column EXP_RESERV.subject_kpp
  is 'SUBJECT_KPP';
comment on column EXP_RESERV.ext_source
  is 'EXT_SOURCE';
comment on column EXP_RESERV.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_RESERV.ext_id
  is 'EXT_ID';
comment on column EXP_RESERV.new_id
  is 'NEW_ID';
comment on column EXP_RESERV.imperrmsg
  is 'IMPERRMSG';
create index FK#EXP_RESERV#PAYMENT on EXP_RESERV (PAYMENT_ID);
alter table EXP_RESERV
  add constraint PK#EXP_RESERV#ID primary key (ID);

prompt
prompt Creating table EXP_REST_PAYS
prompt ============================
prompt
create table EXP_REST_PAYS
(
  id              NUMBER(15) not null,
  typesysname     VARCHAR2(1500) not null,
  doc_number      VARCHAR2(100),
  doc_date        DATE not null,
  doc_no2         VARCHAR2(50),
  doc_date2       DATE,
  doc_summa       NUMBER(22,2) not null,
  summa           NUMBER,
  exec_date       DATE,
  pay_type_code   VARCHAR2(1500),
  curr_code       VARCHAR2(3),
  income_date     DATE,
  nref            VARCHAR2(25),
  coming_date     DATE,
  assure_date     DATE,
  payer_id        NUMBER(15),
  payer_name      VARCHAR2(1500),
  payer_inn       VARCHAR2(12),
  payer_kpp       VARCHAR2(10),
  note            VARCHAR2(400),
  descript        VARCHAR2(1500),
  descript2       VARCHAR2(280),
  bic_k           VARCHAR2(9),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15),
  cardnum         VARCHAR2(19),
  cashdesk_id     NUMBER(15),
  cashdesk_name   VARCHAR2(1500),
  step            NUMBER,
  new_id          NUMBER(15),
  imperrmsg       VARCHAR2(2000),
  last_use        DATE
)
;
comment on table EXP_REST_PAYS
  is '������� EXP_REST_PAYS';
comment on column EXP_REST_PAYS.id
  is 'ID';
comment on column EXP_REST_PAYS.typesysname
  is 'TYPESYSNAME';
comment on column EXP_REST_PAYS.doc_number
  is 'DOC_NUMBER';
comment on column EXP_REST_PAYS.doc_date
  is 'DOC_DATE';
comment on column EXP_REST_PAYS.doc_no2
  is 'DOC_NO2';
comment on column EXP_REST_PAYS.doc_date2
  is 'DOC_DATE2';
comment on column EXP_REST_PAYS.doc_summa
  is 'DOC_SUMMA';
comment on column EXP_REST_PAYS.summa
  is 'SUMMA';
comment on column EXP_REST_PAYS.exec_date
  is 'EXEC_DATE';
comment on column EXP_REST_PAYS.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column EXP_REST_PAYS.curr_code
  is 'CURR_CODE';
comment on column EXP_REST_PAYS.income_date
  is 'INCOME_DATE';
comment on column EXP_REST_PAYS.nref
  is 'NREF';
comment on column EXP_REST_PAYS.coming_date
  is 'COMING_DATE';
comment on column EXP_REST_PAYS.assure_date
  is 'ASSURE_DATE';
comment on column EXP_REST_PAYS.payer_id
  is 'PAYER_ID';
comment on column EXP_REST_PAYS.payer_name
  is 'PAYER_NAME';
comment on column EXP_REST_PAYS.payer_inn
  is 'PAYER_INN';
comment on column EXP_REST_PAYS.payer_kpp
  is 'PAYER_KPP';
comment on column EXP_REST_PAYS.note
  is 'NOTE';
comment on column EXP_REST_PAYS.descript
  is 'DESCRIPT';
comment on column EXP_REST_PAYS.descript2
  is 'DESCRIPT2';
comment on column EXP_REST_PAYS.bic_k
  is 'BIC_K';
comment on column EXP_REST_PAYS.ext_source
  is 'EXT_SOURCE';
comment on column EXP_REST_PAYS.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_REST_PAYS.ext_id
  is 'EXT_ID';
comment on column EXP_REST_PAYS.cardnum
  is 'CARDNUM';
comment on column EXP_REST_PAYS.cashdesk_id
  is 'CASHDESK_ID';
comment on column EXP_REST_PAYS.cashdesk_name
  is 'CASHDESK_NAME';
comment on column EXP_REST_PAYS.step
  is 'STEP';
comment on column EXP_REST_PAYS.new_id
  is 'NEW_ID';
comment on column EXP_REST_PAYS.imperrmsg
  is 'IMPERRMSG';
comment on column EXP_REST_PAYS.last_use
  is 'LAST_USE';
create index FDC#EXP_REST_PAYS#NEW_ID on EXP_REST_PAYS (NEW_ID);
alter table EXP_REST_PAYS
  add constraint PK#EXP_REST_PAYS#ID primary key (ID);
alter table EXP_REST_PAYS
  add constraint UNQ#EXP_REST_PAYS unique (EXT_SOURCE, EXT_TYPESYSNAME, EXT_ID);

prompt
prompt Creating table EXP_TR
prompt =====================
prompt
create table EXP_TR
(
  id               NUMBER(15) not null,
  num_mpo          VARCHAR2(13),
  regim            VARCHAR2(2),
  meth_move        VARCHAR2(3),
  order_type       VARCHAR2(1),
  sum_rub          NUMBER,
  carrier_id       NUMBER(15),
  carrier_name     VARCHAR2(1500),
  carrier_inn      VARCHAR2(12),
  carrier_kpp      VARCHAR2(10),
  subject_id       NUMBER(15),
  subject_name     VARCHAR2(1500),
  subject_inn      VARCHAR2(12),
  subject_kpp      VARCHAR2(10),
  currency_code    VARCHAR2(3),
  custom_mode_code VARCHAR2(1500),
  customs_code     VARCHAR2(8),
  reg_date         DATE,
  decl_no          VARCHAR2(11),
  modify_date      DATE not null,
  decision_code    VARCHAR2(2),
  doc_date         DATE,
  doc_number       VARCHAR2(100),
  descript         VARCHAR2(1500),
  is_active        CHAR(1) not null,
  activation_date  DATE,
  state_name       VARCHAR2(1500),
  ext_source       VARCHAR2(8),
  ext_typesysname  VARCHAR2(1500),
  ext_id           NUMBER(15),
  new_id           NUMBER(15),
  imperrmsg        VARCHAR2(2000),
  step             NUMBER
)
;
comment on table EXP_TR
  is '������� EXP_TR';
comment on column EXP_TR.id
  is 'ID';
comment on column EXP_TR.num_mpo
  is 'NUM_MPO';
comment on column EXP_TR.regim
  is 'REGIM';
comment on column EXP_TR.meth_move
  is 'METH_MOVE';
comment on column EXP_TR.order_type
  is 'ORDER_TYPE';
comment on column EXP_TR.sum_rub
  is 'SUM_RUB';
comment on column EXP_TR.carrier_id
  is 'CARRIER_ID';
comment on column EXP_TR.carrier_name
  is 'CARRIER_NAME';
comment on column EXP_TR.carrier_inn
  is 'CARRIER_INN';
comment on column EXP_TR.carrier_kpp
  is 'CARRIER_KPP';
comment on column EXP_TR.subject_id
  is 'SUBJECT_ID';
comment on column EXP_TR.subject_name
  is 'SUBJECT_NAME';
comment on column EXP_TR.subject_inn
  is 'SUBJECT_INN';
comment on column EXP_TR.subject_kpp
  is 'SUBJECT_KPP';
comment on column EXP_TR.currency_code
  is 'CURRENCY_CODE';
comment on column EXP_TR.custom_mode_code
  is 'CUSTOM_MODE_CODE';
comment on column EXP_TR.customs_code
  is 'CUSTOMS_CODE';
comment on column EXP_TR.reg_date
  is 'REG_DATE';
comment on column EXP_TR.decl_no
  is 'DECL_NO';
comment on column EXP_TR.modify_date
  is 'MODIFY_DATE';
comment on column EXP_TR.decision_code
  is 'DECISION_CODE';
comment on column EXP_TR.doc_date
  is 'DOC_DATE';
comment on column EXP_TR.doc_number
  is 'DOC_NUMBER';
comment on column EXP_TR.descript
  is 'DESCRIPT';
comment on column EXP_TR.is_active
  is 'IS_ACTIVE';
comment on column EXP_TR.activation_date
  is 'ACTIVATION_DATE';
comment on column EXP_TR.state_name
  is 'STATE_NAME';
comment on column EXP_TR.ext_source
  is 'EXT_SOURCE';
comment on column EXP_TR.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column EXP_TR.ext_id
  is 'EXT_ID';
comment on column EXP_TR.new_id
  is 'NEW_ID';
comment on column EXP_TR.imperrmsg
  is 'IMPERRMSG';
comment on column EXP_TR.step
  is 'STEP';
alter table EXP_TR
  add constraint PK#EXP_TR#ID primary key (ID);

prompt
prompt Creating table EXP_VAL
prompt ======================
prompt
create table EXP_VAL
(
  id               NUMBER(15) not null,
  typesysname      VARCHAR2(1500) not null,
  owner_object_id  NUMBER(15),
  ownertypesysname VARCHAR2(1500),
  ref_object_id    NUMBER(15),
  reftypesysname   VARCHAR2(1500),
  new_id           NUMBER(15),
  imperrmsg        VARCHAR2(2000)
)
;
comment on table EXP_VAL
  is '������� EXP_VAL';
comment on column EXP_VAL.id
  is 'ID';
comment on column EXP_VAL.typesysname
  is 'TYPESYSNAME';
comment on column EXP_VAL.owner_object_id
  is 'OWNER_OBJECT_ID';
comment on column EXP_VAL.ownertypesysname
  is 'OWNERTYPESYSNAME';
comment on column EXP_VAL.ref_object_id
  is 'REF_OBJECT_ID';
comment on column EXP_VAL.reftypesysname
  is 'REFTYPESYSNAME';
comment on column EXP_VAL.new_id
  is 'NEW_ID';
comment on column EXP_VAL.imperrmsg
  is 'IMPERRMSG';
alter table EXP_VAL
  add constraint PK#EXP_VAL#ID primary key (ID);

prompt
prompt Creating table FDC_NSI_DICT
prompt ===========================
prompt
create table FDC_NSI_DICT
(
  id        NUMBER(15) not null,
  sdate     DATE,
  edate     DATE,
  datbegdoc DATE,
  numbegdoc VARCHAR2(100),
  datenddoc DATE,
  numenddoc VARCHAR2(100)
)
;
comment on table FDC_NSI_DICT
  is '������� FDC_NSI_DICT';
comment on column FDC_NSI_DICT.id
  is 'ID';
comment on column FDC_NSI_DICT.sdate
  is '���� ������ ��������';
comment on column FDC_NSI_DICT.edate
  is '���� ��������� ��������';
comment on column FDC_NSI_DICT.datbegdoc
  is '���� ��������� ������ ��������';
comment on column FDC_NSI_DICT.numbegdoc
  is '����� ��������� ������ ��������';
comment on column FDC_NSI_DICT.datenddoc
  is '���� ��������� ��������� ��������';
comment on column FDC_NSI_DICT.numenddoc
  is '����� ��������� ��������� ��������';
create index FDC_NSI_DICT_EDATE_I on FDC_NSI_DICT (EDATE);
create index FDC_NSI_DICT_SDATE_I on FDC_NSI_DICT (SDATE);
alter table FDC_NSI_DICT
  add constraint FDC_NSI_DICT_P primary key (ID);
alter table FDC_NSI_DICT
  add constraint FK_NSI_DICT_DICT_ID foreign key (ID)
  references FDC_DICT (ID) on delete cascade;

prompt
prompt Creating table FDC_ACC
prompt ======================
prompt
create table FDC_ACC
(
  id            NUMBER(15) not null,
  parent_id     NUMBER(15),
  is_active     CHAR(1) default 'Y' not null,
  to_level_sign VARCHAR2(1),
  kbk_sign      VARCHAR2(1)
)
;
comment on table FDC_ACC
  is '����. ���� ������';
comment on column FDC_ACC.id
  is '��� �������';
comment on column FDC_ACC.parent_id
  is '��� �������';
comment on column FDC_ACC.is_active
  is '������� �������������� �����:
Y - �����
N - ������';
comment on column FDC_ACC.to_level_sign
  is '������� ��������� ����� � ������ ������� (� - ����������; � - ���; � - ���)';
comment on column FDC_ACC.kbk_sign
  is '������� - �� ������ ��� ������ ���� (S - ���, � �������� ��������; T - ���, �� ������� ��������)';
create index FDC#FK#ACC#PARENT_FDC on FDC_ACC (PARENT_ID);
alter table FDC_ACC
  add constraint FDC#PK#ACC primary key (ID);
alter table FDC_ACC
  add constraint FDC#FK#ACC#PARENT foreign key (PARENT_ID)
  references FDC_ACC (ID) on delete set null;
alter table FDC_ACC
  add constraint FDC#FK#ACC_IS_NSI_DICT foreign key (ID)
  references FDC_NSI_DICT (ID) on delete cascade;
alter table FDC_ACC
  add constraint FDC#CHK#BOOL12
  check (IS_ACTIVE IN ('Y', 'N', 'Z'));

prompt
prompt Creating table FDC_ACCESS_LOG
prompt =============================
prompt
create table FDC_ACCESS_LOG
(
  id             NUMBER(15) not null,
  object_id      NUMBER(15) not null,
  action_dict_id NUMBER(15) not null,
  login          VARCHAR2(1500) not null,
  moment         DATE not null
)
;
comment on table FDC_ACCESS_LOG
  is '������ ������� ������������';
comment on column FDC_ACCESS_LOG.id
  is 'ID';
comment on column FDC_ACCESS_LOG.object_id
  is 'OBJECT_ID';
comment on column FDC_ACCESS_LOG.action_dict_id
  is 'ACTION_DICT_ID';
comment on column FDC_ACCESS_LOG.login
  is 'LOGIN';
comment on column FDC_ACCESS_LOG.moment
  is 'MOMENT';
create index FDC_ACCESS_LOG_IE1 on FDC_ACCESS_LOG (OBJECT_ID);
create index FDC_ACCESS_LOG_IE2 on FDC_ACCESS_LOG (MOMENT);
create index FDC_ACCESS_LOG_IE3 on FDC_ACCESS_LOG (LOGIN);
create index FDC_ACCESS_LOG_IF1 on FDC_ACCESS_LOG (ACTION_DICT_ID);
alter table FDC_ACCESS_LOG
  add constraint FDC_ACCESS_LOG_PK primary key (ID);
alter table FDC_ACCESS_LOG
  add constraint ACCESS_LOG_ACTION_DICT_ID foreign key (ACTION_DICT_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_NSI_CURRENCY
prompt ===============================
prompt
create table FDC_NSI_CURRENCY
(
  id       NUMBER(15) not null,
  code     VARCHAR2(3),
  acode    VARCHAR2(3),
  old_code VARCHAR2(3)
)
;
comment on table FDC_NSI_CURRENCY
  is '������� FDC_NSI_CURRENCY';
comment on column FDC_NSI_CURRENCY.id
  is 'ID';
comment on column FDC_NSI_CURRENCY.code
  is 'CODE';
comment on column FDC_NSI_CURRENCY.acode
  is 'ACODE';
comment on column FDC_NSI_CURRENCY.old_code
  is 'OLD_CODE';
alter table FDC_NSI_CURRENCY
  add constraint FDC_NSI_CURRENCY_PK primary key (ID);
alter table FDC_NSI_CURRENCY
  add constraint NSI_CURRENCY_AK1 unique (CODE);
alter table FDC_NSI_CURRENCY
  add constraint NSI_CURRENCY_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_ACC_BALANCE
prompt ==============================
prompt
create table FDC_ACC_BALANCE
(
  account_id         NUMBER(15) not null,
  currency_id        NUMBER(15) not null,
  balance_date       DATE not null,
  is_current         NUMBER(1) not null,
  balance_sum        NUMBER(36,4),
  balance_sum_rur    NUMBER(36,4),
  balance_sum_ts     NUMBER(36,4),
  balance_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_BALANCE primary key (ACCOUNT_ID, CURRENCY_ID, BALANCE_DATE, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_BALANCE
  is '������ �� ������. �����������. ���� - ������ ����� ������� ������ ������ �� ���������� ������ �� ������� ����';
comment on column FDC_ACC_BALANCE.account_id
  is '��� �������';
comment on column FDC_ACC_BALANCE.currency_id
  is '������';
comment on column FDC_ACC_BALANCE.balance_date
  is '����. ������ ����� ������, ���������� �� ��������.';
comment on column FDC_ACC_BALANCE.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_BALANCE.balance_sum
  is '�����';
comment on column FDC_ACC_BALANCE.balance_sum_rur
  is '����� � ������';
comment on column FDC_ACC_BALANCE.balance_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_BALANCE.balance_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#ACC_BALANCE#ACCOUNT_FDC on FDC_ACC_BALANCE (ACCOUNT_ID);
create index FDC#FK#ACC_BALANCE#CURRENC_FDC on FDC_ACC_BALANCE (CURRENCY_ID);
alter table FDC_ACC_BALANCE
  add constraint FDC#FK#ACC_BALANCE#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_BALANCE
  add constraint FDC#FK#ACC_BALANCE#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);

prompt
prompt Creating table FDC_BP_AGREEMENT
prompt ===============================
prompt
create table FDC_BP_AGREEMENT
(
  id         NUMBER(15) not null,
  doc_no     VARCHAR2(10) not null,
  doc_date   DATE not null,
  subject_id NUMBER(15) not null,
  from_date  DATE not null,
  to_date    DATE
)
;
comment on table FDC_BP_AGREEMENT
  is '���������� ������� ������������';
comment on column FDC_BP_AGREEMENT.id
  is 'ID';
comment on column FDC_BP_AGREEMENT.doc_no
  is '����� ����������';
comment on column FDC_BP_AGREEMENT.doc_date
  is '���� ����������';
comment on column FDC_BP_AGREEMENT.subject_id
  is '�����������';
comment on column FDC_BP_AGREEMENT.from_date
  is '���� ������ ��������';
comment on column FDC_BP_AGREEMENT.to_date
  is '���� ��������� ��������';
create index FDC_BP_AGGREENENT_FROM_DATE_I on FDC_BP_AGREEMENT (FROM_DATE);
create index FDC_BP_AGGREENENT_TO_DATE_I on FDC_BP_AGREEMENT (TO_DATE);
create index FDC_BP_AGREEMENT_SUBJECT_I_FDC on FDC_BP_AGREEMENT (SUBJECT_ID);
alter table FDC_BP_AGREEMENT
  add constraint FDC_BP_AGREEMENT_PK primary key (ID);
alter table FDC_BP_AGREEMENT
  add constraint FDC_BP_AGREEMENT_UQ unique (DOC_NO, DOC_DATE);
alter table FDC_BP_AGREEMENT
  add constraint FDC_BP_AGREEMENT_ID_FK foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_BP_AGREEMENT
  add constraint FDC_BP_AGREEMENT_SUBJECT_ID_FK foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_BP_AGREEMENT
  add constraint FDC#CHK#BPAGRMT#DATE
  check (FROM_DATE < TO_DATE);

prompt
prompt Creating table FDC_ACC_BALANCE_AGREEMENT
prompt ========================================
prompt
create table FDC_ACC_BALANCE_AGREEMENT
(
  account_id         NUMBER(15) not null,
  agreement_id       NUMBER(15) not null,
  currency_id        NUMBER(15) not null,
  balance_date       DATE not null,
  is_current         NUMBER(1) not null,
  balance_sum        NUMBER(36,4),
  balance_sum_rur    NUMBER(36,4),
  balance_sum_ts     NUMBER(36,4),
  balance_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_BALANCE_AGREEMENT primary key (ACCOUNT_ID, AGREEMENT_ID, CURRENCY_ID, BALANCE_DATE, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_BALANCE_AGREEMENT
  is '������ �� ���������� � ���. �����������. ���� - ������ ����� ������� ������ ������ �� ���������� ������ �� ������� ����';
comment on column FDC_ACC_BALANCE_AGREEMENT.account_id
  is '��� �������';
comment on column FDC_ACC_BALANCE_AGREEMENT.agreement_id
  is '������������� ���������� � ���';
comment on column FDC_ACC_BALANCE_AGREEMENT.currency_id
  is '������';
comment on column FDC_ACC_BALANCE_AGREEMENT.balance_date
  is '����. ������ ����� ������, ���������� �� ��������.';
comment on column FDC_ACC_BALANCE_AGREEMENT.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_BALANCE_AGREEMENT.balance_sum
  is '�����';
comment on column FDC_ACC_BALANCE_AGREEMENT.balance_sum_rur
  is '����� � ������';
comment on column FDC_ACC_BALANCE_AGREEMENT.balance_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_BALANCE_AGREEMENT.balance_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#BALANCE_AGR#ACC_FDC on FDC_ACC_BALANCE_AGREEMENT (ACCOUNT_ID);
create index FDC#FK#BALANCE_AGR#AGR_FDC on FDC_ACC_BALANCE_AGREEMENT (AGREEMENT_ID);
create index FDC#FK#BALANCE_AGR#CURR_FDC on FDC_ACC_BALANCE_AGREEMENT (CURRENCY_ID);
alter table FDC_ACC_BALANCE_AGREEMENT
  add constraint FDC#FK#BALANCE_AGR#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_BALANCE_AGREEMENT
  add constraint FDC#FK#BALANCE_AGR#AGREEMENT foreign key (AGREEMENT_ID)
  references FDC_BP_AGREEMENT (ID);
alter table FDC_ACC_BALANCE_AGREEMENT
  add constraint FDC#FK#BALANCE_AGR#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_BALANCE_AGREEMENT
  add constraint FDC#CHK#BALANCE_AGR#CURR
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_BALANCE_KBK
prompt ==================================
prompt
create table FDC_ACC_BALANCE_KBK
(
  account_id         NUMBER(15) not null,
  kbk_id             NUMBER(15) not null,
  currency_id        NUMBER(15) not null,
  balance_date       DATE not null,
  is_current         NUMBER(1) not null,
  balance_sum        NUMBER(36,4),
  balance_sum_rur    NUMBER(36,4),
  balance_sum_ts     NUMBER(36,4),
  balance_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_BALANCE_KBK primary key (ACCOUNT_ID, KBK_ID, CURRENCY_ID, BALANCE_DATE, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_BALANCE_KBK
  is '������ �� ���. �����������. ���� - ������ ����� ������� ������ ������ �� ���������� ������ �� ������� ����';
comment on column FDC_ACC_BALANCE_KBK.account_id
  is '��� �������';
comment on column FDC_ACC_BALANCE_KBK.kbk_id
  is '���';
comment on column FDC_ACC_BALANCE_KBK.currency_id
  is '������';
comment on column FDC_ACC_BALANCE_KBK.balance_date
  is '����. ������ ����� ������, ���������� �� ��������.';
comment on column FDC_ACC_BALANCE_KBK.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_BALANCE_KBK.balance_sum
  is '�����';
comment on column FDC_ACC_BALANCE_KBK.balance_sum_rur
  is '����� � ������';
comment on column FDC_ACC_BALANCE_KBK.balance_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_BALANCE_KBK.balance_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#BALANCE_KBK#ACCOUNT_FDC on FDC_ACC_BALANCE_KBK (ACCOUNT_ID);
create index FDC#FK#BALANCE_KBK#CURRENC_FDC on FDC_ACC_BALANCE_KBK (CURRENCY_ID);
create index FDC#FK#BALANCE_KBK#KBK_FDC on FDC_ACC_BALANCE_KBK (KBK_ID);
alter table FDC_ACC_BALANCE_KBK
  add constraint FDC#FK#BALANCE_KBK#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_BALANCE_KBK
  add constraint FDC#FK#BALANCE_KBK#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_BALANCE_KBK
  add constraint FDC#FK#BALANCE_KBK#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_BALANCE_KBK
  add constraint FDC#CHK#BALANCE_KBK#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_BALANCE_SBJ_KBK
prompt ======================================
prompt
create table FDC_ACC_BALANCE_SBJ_KBK
(
  account_id         NUMBER(15) not null,
  subject_id         NUMBER(15) not null,
  kbk_id             NUMBER(15) not null,
  currency_id        NUMBER(15) not null,
  balance_date       DATE not null,
  is_current         NUMBER(1) not null,
  balance_sum        NUMBER(36,4),
  balance_sum_rur    NUMBER(36,4),
  balance_sum_ts     NUMBER(36,4),
  balance_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_BALANCE_SBJ_KBK primary key (ACCOUNT_ID, SUBJECT_ID, KBK_ID, CURRENCY_ID, BALANCE_DATE, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_BALANCE_SBJ_KBK
  is '������ �� �������� � ���. �����������. ���� - ������ ����� ������� ������ ������ �� ���������� ������ �� ������� ����';
comment on column FDC_ACC_BALANCE_SBJ_KBK.account_id
  is '��� �������';
comment on column FDC_ACC_BALANCE_SBJ_KBK.subject_id
  is '������������� ��������';
comment on column FDC_ACC_BALANCE_SBJ_KBK.kbk_id
  is '���';
comment on column FDC_ACC_BALANCE_SBJ_KBK.currency_id
  is '������';
comment on column FDC_ACC_BALANCE_SBJ_KBK.balance_date
  is '����. ������ ����� ������, ���������� �� ��������.';
comment on column FDC_ACC_BALANCE_SBJ_KBK.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_BALANCE_SBJ_KBK.balance_sum
  is '�����';
comment on column FDC_ACC_BALANCE_SBJ_KBK.balance_sum_rur
  is '����� � ������';
comment on column FDC_ACC_BALANCE_SBJ_KBK.balance_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_BALANCE_SBJ_KBK.balance_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#BALANCE_SBJ_KBK#ACC_FDC on FDC_ACC_BALANCE_SBJ_KBK (ACCOUNT_ID);
create index FDC#FK#BALANCE_SBJ_KBK#CUR_FDC on FDC_ACC_BALANCE_SBJ_KBK (CURRENCY_ID);
create index FDC#FK#BALANCE_SBJ_KBK#KBK_FDC on FDC_ACC_BALANCE_SBJ_KBK (KBK_ID);
create index FDC#FK#BALANCE_SBJ_KBK#SBJ_FDC on FDC_ACC_BALANCE_SBJ_KBK (SUBJECT_ID);
alter table FDC_ACC_BALANCE_SBJ_KBK
  add constraint FDC#FK#BALANCE_SBJ_KBK#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_BALANCE_SBJ_KBK
  add constraint FDC#FK#BALANCE_SUBJ_KBK#ACC foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_BALANCE_SBJ_KBK
  add constraint FDC#FK#BALANCE_SUBJ_KBK#CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_BALANCE_SBJ_KBK
  add constraint FDC#CHK#BALANCE_SBJ_KBK#IS_CUR
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_BALANCE_SUBJECT
prompt ======================================
prompt
create table FDC_ACC_BALANCE_SUBJECT
(
  account_id         NUMBER(15) not null,
  subject_id         NUMBER(15) not null,
  currency_id        NUMBER(15) not null,
  balance_date       DATE not null,
  is_current         NUMBER(1) not null,
  balance_sum        NUMBER(36,4),
  balance_sum_rur    NUMBER(36,4),
  balance_sum_ts     NUMBER(36,4),
  balance_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_BALANCE_SUBJECT primary key (ACCOUNT_ID, SUBJECT_ID, CURRENCY_ID, BALANCE_DATE, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_BALANCE_SUBJECT
  is '������ �� ��������. �����������. ���� - ������ ����� ������� ������ ������ �� ���������� ������ �� ������� ����';
comment on column FDC_ACC_BALANCE_SUBJECT.account_id
  is '��� �������';
comment on column FDC_ACC_BALANCE_SUBJECT.subject_id
  is '�������';
comment on column FDC_ACC_BALANCE_SUBJECT.currency_id
  is '������';
comment on column FDC_ACC_BALANCE_SUBJECT.balance_date
  is '����. ������ ����� ������, ���������� �� ��������.';
comment on column FDC_ACC_BALANCE_SUBJECT.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_BALANCE_SUBJECT.balance_sum
  is '�����';
comment on column FDC_ACC_BALANCE_SUBJECT.balance_sum_rur
  is '����� � ������';
comment on column FDC_ACC_BALANCE_SUBJECT.balance_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_BALANCE_SUBJECT.balance_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#BALANCE_SUBJ#ACCOUN_FDC on FDC_ACC_BALANCE_SUBJECT (ACCOUNT_ID);
create index FDC#FK#BALANCE_SUBJ#CURREN_FDC on FDC_ACC_BALANCE_SUBJECT (CURRENCY_ID);
create index FDC#FK#BALANCE_SUBJ#SUBJEC_FDC on FDC_ACC_BALANCE_SUBJECT (SUBJECT_ID);
alter table FDC_ACC_BALANCE_SUBJECT
  add constraint FDC#FK#BALANCE_SUBJ#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_BALANCE_SUBJECT
  add constraint FDC#FK#BALANCE_SUBJ#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_BALANCE_SUBJECT
  add constraint FDC#FK#BALANCE_SUBJ#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_ACC_BALANCE_SUBJECT
  add constraint FDC#CHK#BALANCE_SUBJ#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_FLAG_TEMP
prompt ================================
prompt
create global temporary table FDC_ACC_FLAG_TEMP
(
  id          NUMBER not null,
  is_debit    CHAR(1),
  is_kredit   CHAR(1),
  window_type VARCHAR2(64)
)
on commit delete rows;
comment on table FDC_ACC_FLAG_TEMP
  is '������� FDC_ACC_FLAG_TEMP';
comment on column FDC_ACC_FLAG_TEMP.id
  is 'ID';
comment on column FDC_ACC_FLAG_TEMP.is_debit
  is 'IS_DEBIT';
comment on column FDC_ACC_FLAG_TEMP.is_kredit
  is 'IS_KREDIT';
comment on column FDC_ACC_FLAG_TEMP.window_type
  is 'WINDOW_TYPE';
alter table FDC_ACC_FLAG_TEMP
  add constraint PK#FDC#ACC#FLAG#TEMP primary key (ID);

prompt
prompt Creating table FDC_ACC_REG
prompt ==========================
prompt
create table FDC_ACC_REG
(
  account_id     NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  reg_date       DATE not null,
  is_debit       CHAR(1) not null,
  is_current     NUMBER(1) not null,
  reg_sum        NUMBER(36,4),
  reg_sum_rur    NUMBER(36,4),
  reg_sum_ts     NUMBER(36,4),
  reg_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_REG primary key (REG_DATE, ACCOUNT_ID, CURRENCY_ID, IS_DEBIT, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_REG
  is '������� �� ������. �� ������ ����';
comment on column FDC_ACC_REG.account_id
  is '��� �������';
comment on column FDC_ACC_REG.currency_id
  is '������';
comment on column FDC_ACC_REG.reg_date
  is '����';
comment on column FDC_ACC_REG.is_debit
  is '������� ����� Y - ��������� N - ���������';
comment on column FDC_ACC_REG.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_REG.reg_sum
  is '�����';
comment on column FDC_ACC_REG.reg_sum_rur
  is '����� � ������';
comment on column FDC_ACC_REG.reg_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_REG.reg_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#ACC_REG#ACCOUNT_FDC on FDC_ACC_REG (ACCOUNT_ID);
create index FDC#FK#ACC_REG#CURRENCY_FDC on FDC_ACC_REG (CURRENCY_ID);
alter table FDC_ACC_REG
  add constraint FDC#FK#ACC_REG#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_REG
  add constraint FDC#FK#ACC_REG#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_REG
  add constraint FDC#CHK#ACC_REG#CURRENT
  check (is_current IN (0, 1));
alter table FDC_ACC_REG
  add constraint FDC#CHK#BOOL13
  check (IS_DEBIT IN ('Y', 'N'));

prompt
prompt Creating table FDC_ACC_REG_AGREEMENT
prompt ====================================
prompt
create table FDC_ACC_REG_AGREEMENT
(
  account_id     NUMBER(15) not null,
  agreement_id   NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  reg_date       DATE not null,
  is_debit       CHAR(1) not null,
  is_current     NUMBER(1) not null,
  reg_sum        NUMBER(36,4),
  reg_sum_rur    NUMBER(36,4),
  reg_sum_ts     NUMBER(36,4),
  reg_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_REG_AGREEMENT primary key (REG_DATE, ACCOUNT_ID, AGREEMENT_ID, CURRENCY_ID, IS_DEBIT, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_REG_AGREEMENT
  is '������� �� ���������� � ���. �� ������ ����';
comment on column FDC_ACC_REG_AGREEMENT.account_id
  is '��� �������';
comment on column FDC_ACC_REG_AGREEMENT.agreement_id
  is '������������� ���������� � ���';
comment on column FDC_ACC_REG_AGREEMENT.currency_id
  is '������';
comment on column FDC_ACC_REG_AGREEMENT.reg_date
  is '���� (��� �������)';
comment on column FDC_ACC_REG_AGREEMENT.is_debit
  is '������� ����� Y - ��������� N - ���������';
comment on column FDC_ACC_REG_AGREEMENT.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_REG_AGREEMENT.reg_sum
  is '�����';
comment on column FDC_ACC_REG_AGREEMENT.reg_sum_rur
  is '����� � ������';
comment on column FDC_ACC_REG_AGREEMENT.reg_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_REG_AGREEMENT.reg_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#REG_AGR#ACCOUNT_FDC on FDC_ACC_REG_AGREEMENT (ACCOUNT_ID);
create index FDC#FK#REG_AGR#AGREEMENT_FDC on FDC_ACC_REG_AGREEMENT (AGREEMENT_ID);
create index FDC#FK#REG_AGR#CURRENCY_FDC on FDC_ACC_REG_AGREEMENT (CURRENCY_ID);
alter table FDC_ACC_REG_AGREEMENT
  add constraint FDC#FK#REG_AGR#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_REG_AGREEMENT
  add constraint FDC#FK#REG_AGR#AGREEMENT foreign key (AGREEMENT_ID)
  references FDC_BP_AGREEMENT (ID);
alter table FDC_ACC_REG_AGREEMENT
  add constraint FDC#FK#REG_AGR#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_REG_AGREEMENT
  add constraint FDC#CHK#REG_AGR#BOOL14
  check (IS_DEBIT IN ('Y', 'N'));
alter table FDC_ACC_REG_AGREEMENT
  add constraint FDC#CHK#REG_AGR#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_REG_KBK
prompt ==============================
prompt
create table FDC_ACC_REG_KBK
(
  account_id     NUMBER(15) not null,
  kbk_id         NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  reg_date       DATE not null,
  is_debit       CHAR(1) not null,
  is_current     NUMBER(1) not null,
  reg_sum        NUMBER(36,4),
  reg_sum_rur    NUMBER(36,4),
  reg_sum_ts     NUMBER(36,4),
  reg_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_REG_KBK primary key (REG_DATE, ACCOUNT_ID, KBK_ID, CURRENCY_ID, IS_DEBIT, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_REG_KBK
  is '������� �� ���. �� ������ ����';
comment on column FDC_ACC_REG_KBK.account_id
  is '���� (��� �������)';
comment on column FDC_ACC_REG_KBK.kbk_id
  is '��� �������';
comment on column FDC_ACC_REG_KBK.currency_id
  is '���';
comment on column FDC_ACC_REG_KBK.reg_date
  is '������';
comment on column FDC_ACC_REG_KBK.is_debit
  is '������� ����� Y - ��������� N - ���������';
comment on column FDC_ACC_REG_KBK.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_REG_KBK.reg_sum
  is '�����';
comment on column FDC_ACC_REG_KBK.reg_sum_rur
  is '����� � ������';
comment on column FDC_ACC_REG_KBK.reg_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_REG_KBK.reg_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#REG_KBK#ACCOUNT_FDC on FDC_ACC_REG_KBK (ACCOUNT_ID);
create index FDC#FK#REG_KBK#CURRENCY_FDC on FDC_ACC_REG_KBK (CURRENCY_ID);
create index FDC#FK#REG_KBK#KBK_FDC on FDC_ACC_REG_KBK (KBK_ID);
alter table FDC_ACC_REG_KBK
  add constraint FDC#FK#REG_KBK#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_REG_KBK
  add constraint FDC#FK#REG_KBK#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_REG_KBK
  add constraint FDC#FK#REG_KBK#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_REG_KBK
  add constraint FDC#CHK#BOOL14
  check (IS_DEBIT IN ('Y', 'N'));
alter table FDC_ACC_REG_KBK
  add constraint FDC#CHK#REG_KBK#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_REG_SBJ_KBK
prompt ==================================
prompt
create table FDC_ACC_REG_SBJ_KBK
(
  account_id     NUMBER(15) not null,
  subject_id     NUMBER(15) not null,
  kbk_id         NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  reg_date       DATE not null,
  is_debit       CHAR(1) not null,
  is_current     NUMBER(1) not null,
  reg_sum        NUMBER(36,4),
  reg_sum_rur    NUMBER(36,4),
  reg_sum_ts     NUMBER(36,4),
  reg_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_REG_SBJ_KBK primary key (REG_DATE, ACCOUNT_ID, SUBJECT_ID, KBK_ID, CURRENCY_ID, IS_DEBIT, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_REG_SBJ_KBK
  is '������� �� �������� � ���. �� ������ ����';
comment on column FDC_ACC_REG_SBJ_KBK.account_id
  is '���� (��� �������)';
comment on column FDC_ACC_REG_SBJ_KBK.subject_id
  is '��� �������';
comment on column FDC_ACC_REG_SBJ_KBK.kbk_id
  is '������������� ��������';
comment on column FDC_ACC_REG_SBJ_KBK.currency_id
  is '���';
comment on column FDC_ACC_REG_SBJ_KBK.reg_date
  is '������';
comment on column FDC_ACC_REG_SBJ_KBK.is_debit
  is '������� ����� Y - ��������� N - ���������';
comment on column FDC_ACC_REG_SBJ_KBK.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_REG_SBJ_KBK.reg_sum
  is '�����';
comment on column FDC_ACC_REG_SBJ_KBK.reg_sum_rur
  is '����� � ������';
comment on column FDC_ACC_REG_SBJ_KBK.reg_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_REG_SBJ_KBK.reg_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#REG_SBJ_KBK#ACC_FDC on FDC_ACC_REG_SBJ_KBK (ACCOUNT_ID);
create index FDC#FK#REG_SBJ_KBK#KBK_FDC on FDC_ACC_REG_SBJ_KBK (KBK_ID);
create index FDC#FK#REG_SBJ_KBK#SBJ_FDC on FDC_ACC_REG_SBJ_KBK (SUBJECT_ID);
create index FDC#FK#REG_SUBJ_KBK#CURR_FDC on FDC_ACC_REG_SBJ_KBK (CURRENCY_ID);
alter table FDC_ACC_REG_SBJ_KBK
  add constraint FDC#FK#REG_SBJ_KBK#ACC foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_REG_SBJ_KBK
  add constraint FDC#FK#REG_SBJ_KBK#CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_REG_SBJ_KBK
  add constraint FDC#FK#REG_SBJ_KBK#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_REG_SBJ_KBK
  add constraint FDC#CHK#ACC_REG_SBJ_KBK#BOOL
  check (IS_DEBIT IN ('Y', 'N'));
alter table FDC_ACC_REG_SBJ_KBK
  add constraint FDC#CHK#REG_SBJ_KBK#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_REG_SUBJECT
prompt ==================================
prompt
create table FDC_ACC_REG_SUBJECT
(
  account_id     NUMBER(15) not null,
  subject_id     NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  reg_date       DATE not null,
  is_debit       CHAR(1) not null,
  is_current     NUMBER(1) not null,
  reg_sum        NUMBER(36,4),
  reg_sum_rur    NUMBER(36,4),
  reg_sum_ts     NUMBER(36,4),
  reg_sum_rur_ts NUMBER(36,4),
  constraint FDC#PK#ACC_REG_SUBJECT primary key (REG_DATE, ACCOUNT_ID, SUBJECT_ID, CURRENCY_ID, IS_DEBIT, IS_CURRENT)
)
organization index;
comment on table FDC_ACC_REG_SUBJECT
  is '������� �� ���������. �� ������ ����';
comment on column FDC_ACC_REG_SUBJECT.account_id
  is '����';
comment on column FDC_ACC_REG_SUBJECT.subject_id
  is '��� �������';
comment on column FDC_ACC_REG_SUBJECT.currency_id
  is '�������';
comment on column FDC_ACC_REG_SUBJECT.reg_date
  is '������';
comment on column FDC_ACC_REG_SUBJECT.is_debit
  is '������� ����� Y - ��������� N - ���������';
comment on column FDC_ACC_REG_SUBJECT.is_current
  is '������� ������������� ����������: 1 - ����� �� ����������� ������� ������� 0 - ����� �� ���������� �� ����������� ��������';
comment on column FDC_ACC_REG_SUBJECT.reg_sum
  is '�����';
comment on column FDC_ACC_REG_SUBJECT.reg_sum_rur
  is '����� � ������';
comment on column FDC_ACC_REG_SUBJECT.reg_sum_ts
  is '����� �� ����������� �����';
comment on column FDC_ACC_REG_SUBJECT.reg_sum_rur_ts
  is '����� � ������ �� ����������� �����';
create index FDC#FK#REG_SUBJ#ACCOUNT_FDC on FDC_ACC_REG_SUBJECT (ACCOUNT_ID);
create index FDC#FK#REG_SUBJ#CURRENCY_FDC on FDC_ACC_REG_SUBJECT (CURRENCY_ID);
create index FDC#FK#REG_SUBJ#SUBJECT_FDC on FDC_ACC_REG_SUBJECT (SUBJECT_ID);
alter table FDC_ACC_REG_SUBJECT
  add constraint FDC#FK#REG_SUBJ#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_REG_SUBJECT
  add constraint FDC#FK#REG_SUBJ#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_REG_SUBJECT
  add constraint FDC#FK#REG_SUBJ#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_ACC_REG_SUBJECT
  add constraint FDC#CHK#BOOL15
  check (IS_DEBIT IN ('Y', 'N'));
alter table FDC_ACC_REG_SUBJECT
  add constraint FDC#CHK#REG_SUBJECT#CURRENT
  check (is_current IN (0, 1));

prompt
prompt Creating table FDC_ACC_TRANSACTION
prompt ==================================
prompt
create table FDC_ACC_TRANSACTION
(
  id              NUMBER(15) not null,
  doc_id          NUMBER(15) not null,
  kbk_id          NUMBER(15),
  operation_id    NUMBER(15) not null,
  payment_type_id NUMBER(15),
  subject_id      NUMBER(15) not null,
  currency_id     NUMBER(15) not null,
  account_id      NUMBER(15) not null,
  operation_date  DATE,
  is_debit        CHAR(1) default 'Y' not null,
  operation_sum   NUMBER(36,4),
  exch_rate       INTEGER,
  sum_rur         NUMBER(36,4),
  agreement_id    NUMBER(15),
  is_ts           VARCHAR2(1) not null,
  is_current      NUMBER(1)
)
;
comment on table FDC_ACC_TRANSACTION
  is '�������� (�� ������ ����� ������ � 01.09.07)';
comment on column FDC_ACC_TRANSACTION.id
  is '��� �������';
comment on column FDC_ACC_TRANSACTION.doc_id
  is '��� �������';
comment on column FDC_ACC_TRANSACTION.kbk_id
  is '���';
comment on column FDC_ACC_TRANSACTION.operation_id
  is '��������';
comment on column FDC_ACC_TRANSACTION.payment_type_id
  is '��� �������';
comment on column FDC_ACC_TRANSACTION.subject_id
  is '�������';
comment on column FDC_ACC_TRANSACTION.currency_id
  is '������';
comment on column FDC_ACC_TRANSACTION.account_id
  is '��� �������';
comment on column FDC_ACC_TRANSACTION.operation_date
  is '���� ��������';
comment on column FDC_ACC_TRANSACTION.is_debit
  is '������� �����: Y - �����, N - ������';
comment on column FDC_ACC_TRANSACTION.operation_sum
  is '�����';
comment on column FDC_ACC_TRANSACTION.exch_rate
  is '���� ������ �� ���� ��������';
comment on column FDC_ACC_TRANSACTION.sum_rur
  is '����� � ������';
comment on column FDC_ACC_TRANSACTION.agreement_id
  is '������������� ���������� � ���';
comment on column FDC_ACC_TRANSACTION.is_ts
  is '������� ����������� �����';
comment on column FDC_ACC_TRANSACTION.is_current
  is '������� ������������� ����������: 1 - ���������� ������� ������� 0 - ��������� �� ����������� ��������';
create unique index FDC#AK#ACC_TRANSACTION on FDC_ACC_TRANSACTION (DOC_ID, ACCOUNT_ID, SUBJECT_ID, OPERATION_ID, IS_DEBIT, PAYMENT_TYPE_ID, KBK_ID, CURRENCY_ID, OPERATION_DATE, IS_TS, IS_CURRENT);
create index FDC#FK#ACC_TRANS#DOC_FDC on FDC_ACC_TRANSACTION (DOC_ID);
create index FDC#FK#TRANS#ACCOUNT_FDC on FDC_ACC_TRANSACTION (ACCOUNT_ID);
create index FDC#FK#TRANS#AGREEMENT_FDC on FDC_ACC_TRANSACTION (AGREEMENT_ID);
create index FDC#FK#TRANS#CURRENCY_FDC on FDC_ACC_TRANSACTION (CURRENCY_ID);
create index FDC#FK#TRANS#KBK_FDC on FDC_ACC_TRANSACTION (KBK_ID);
create index FDC#FK#TRANS#OPERATION_FDC on FDC_ACC_TRANSACTION (OPERATION_ID);
create index FDC#FK#TRANS#PAY_TYPE_FDC on FDC_ACC_TRANSACTION (PAYMENT_TYPE_ID);
create index FDC#FK#TRANS#SUBJECT_FDC on FDC_ACC_TRANSACTION (SUBJECT_ID);
create index FDC#IDX#ACC_TRANSACTION_DATE on FDC_ACC_TRANSACTION (OPERATION_DATE);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#PK#ACC_TRANSACTION primary key (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#ACC_TRANS#DOC foreign key (DOC_ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#AGREEMENT_ID foreign key (AGREEMENT_ID)
  references FDC_BP_AGREEMENT (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#OPERATION foreign key (OPERATION_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#PAY_TYPE foreign key (PAYMENT_TYPE_ID)
  references FDC_DICT (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_ACC_TRANSACTION
  add constraint FDC#FK#TRANS_IS_OBJECT foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_ACC_TRANSACTION
  add constraint FDC#ACC#TRANS#CH#IS_CURRENT
  check (is_current IN (1, 0));
alter table FDC_ACC_TRANSACTION
  add constraint FDC#ACC#TRANSACTION#CH#ISTS
  check (is_ts IN ('N', 'Y'));
alter table FDC_ACC_TRANSACTION
  add constraint FDC#CHK#BOOL4
  check (IS_DEBIT IN ('Y', 'N'));

prompt
prompt Creating table FDC_ACTCORRECTOPERBALANS
prompt =======================================
prompt
create table FDC_ACTCORRECTOPERBALANS
(
  id           NUMBER(15) not null,
  balans_type  NUMBER(1) not null,
  date_created DATE,
  signed_by    VARCHAR2(50),
  sign_date    DATE
)
;
comment on table FDC_ACTCORRECTOPERBALANS
  is '��� � �������� ��������� � ����������� ������';
comment on column FDC_ACTCORRECTOPERBALANS.id
  is '������������� ���� � �������� ��������� � ����������� ������';
comment on column FDC_ACTCORRECTOPERBALANS.balans_type
  is '��� �������: 0 - �� �������� ��; 1 - ��������������� ���/���; 2 - ���������;';
comment on column FDC_ACTCORRECTOPERBALANS.date_created
  is '���� ������������ ���������';
comment on column FDC_ACTCORRECTOPERBALANS.signed_by
  is '�����������';
comment on column FDC_ACTCORRECTOPERBALANS.sign_date
  is '���� ������� ����';
alter table FDC_ACTCORRECTOPERBALANS
  add constraint FDC#PK#ACTCORRECTBALANS primary key (ID);
alter table FDC_ACTCORRECTOPERBALANS
  add constraint FDC#FK#ACTCORRECTBALANS#ID foreign key (ID)
  references FDC_DOCUMENT (ID);

prompt
prompt Creating table FDC_ACTCORRECTOPERBALANS_TRAN
prompt ============================================
prompt
create table FDC_ACTCORRECTOPERBALANS_TRAN
(
  id              NUMBER(15) not null,
  act_id          NUMBER(15) not null,
  doc_id          NUMBER(15),
  kbk_id          NUMBER(15),
  payment_type_id NUMBER(15),
  subject_id      NUMBER(15) not null,
  account_id      NUMBER(15) not null,
  is_debit        CHAR(1) default 'Y' not null,
  operation_sum   NUMBER(36,4),
  is_ts           VARCHAR2(1) not null
)
;
comment on table FDC_ACTCORRECTOPERBALANS_TRAN
  is '��������� ���������� ��� ��������� "��� � �������� ��������� � ����������� ������"';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.id
  is '������������� �������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.act_id
  is '������������� ����';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.doc_id
  is '������������� ���������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.kbk_id
  is '������������� ���';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.payment_type_id
  is '������������� ���� �������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.subject_id
  is '������������� ��������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.account_id
  is '������������� �����';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.is_debit
  is '������� �����: Y - �����, N - ������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.operation_sum
  is '����� �������������� ���������� � ������';
comment on column FDC_ACTCORRECTOPERBALANS_TRAN.is_ts
  is '������� ����������� �����';
create index FDC#FK#CORROB_TRAN#ACCOUNT_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (ACCOUNT_ID);
create index FDC#FK#CORROB_TRAN#ACT_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (ACT_ID);
create index FDC#FK#CORROB_TRAN#DOC_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (DOC_ID);
create index FDC#FK#CORROB_TRAN#KBK_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (KBK_ID);
create index FDC#FK#CORROB_TRAN#PAYTYPE_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (PAYMENT_TYPE_ID);
create index FDC#FK#CORROB_TRAN#SUBJ_FDC on FDC_ACTCORRECTOPERBALANS_TRAN (SUBJECT_ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#PK#ACTCORROPERBALANS_TRAN primary key (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROB#ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROB#PAY_TYPE foreign key (PAYMENT_TYPE_ID)
  references FDC_DICT (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROB#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROB_IS_OBJECT foreign key (ID)
  references FDC_OBJECT (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROPERBALANS#ACT foreign key (ACT_ID)
  references FDC_ACTCORRECTOPERBALANS (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROPERBALANS#DOC foreign key (DOC_ID)
  references FDC_DOCUMENT (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#FK#ACT#CORROPERBALANS#KBK foreign key (KBK_ID)
  references FDC_DICT (ID);
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#ACT#CORROB#CH#IS_DEBIT
  check (IS_DEBIT IN ('Y', 'N'));
alter table FDC_ACTCORRECTOPERBALANS_TRAN
  add constraint FDC#ACT#CORROPERBALANS#CH#ISTS
  check (is_ts IN ('N', 'Y'));

prompt
prompt Creating table FDC_ACT_CHANGE_OST_KBK
prompt =====================================
prompt
create table FDC_ACT_CHANGE_OST_KBK
(
  id              NUMBER(15) not null,
  signed_by       VARCHAR2(50),
  signed_by_chief VARCHAR2(50),
  sign_date       DATE,
  currency_id     NUMBER(15)
)
;
comment on table FDC_ACT_CHANGE_OST_KBK
  is '��� � �������� �������� � �������� ���';
comment on column FDC_ACT_CHANGE_OST_KBK.id
  is '������������� �������';
comment on column FDC_ACT_CHANGE_OST_KBK.signed_by
  is '�����������';
comment on column FDC_ACT_CHANGE_OST_KBK.signed_by_chief
  is '��������� ������';
comment on column FDC_ACT_CHANGE_OST_KBK.sign_date
  is '���� ������� ����';
comment on column FDC_ACT_CHANGE_OST_KBK.currency_id
  is '������������� ������';
create index FDC#FK_ACT_CH_KBK#CURR_FDC on FDC_ACT_CHANGE_OST_KBK (CURRENCY_ID);
alter table FDC_ACT_CHANGE_OST_KBK
  add constraint FDC#PK_ACT_CH_KBK#ID primary key (ID);
alter table FDC_ACT_CHANGE_OST_KBK
  add constraint FDC#FK_ACT_CH_KBK#CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_ACT_CHANGE_OST_KBK
  add constraint FDC#FK_ACT_CH_KBK_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_CHANGE_OST_KBK_SUM
prompt =========================================
prompt
create table FDC_ACT_CHANGE_OST_KBK_SUM
(
  id NUMBER(15) not null,
  constraint FDC#PK#ACT_CH_OST_KBK_SUM primary key (ID)
)
organization index;
comment on table FDC_ACT_CHANGE_OST_KBK_SUM
  is '��� � �������� �������� � ���� ��� (���������)';
comment on column FDC_ACT_CHANGE_OST_KBK_SUM.id
  is '������������� �������';
alter table FDC_ACT_CHANGE_OST_KBK_SUM
  add constraint FDC#FK#ACT_CH_OST_KBK_SM_ISACT foreign key (ID)
  references FDC_ACT_CHANGE_OST_KBK (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_CHANGE_OST_KBK_TRANS
prompt ===========================================
prompt
create table FDC_ACT_CHANGE_OST_KBK_TRANS
(
  id NUMBER(15) not null,
  constraint FDC#PK#ACT_CH_OST_KBK_TRANS primary key (ID)
)
organization index;
comment on table FDC_ACT_CHANGE_OST_KBK_TRANS
  is '��� � �������� �������� � �������� ��� ��� ���������� �/�';
comment on column FDC_ACT_CHANGE_OST_KBK_TRANS.id
  is '������������� �������';
alter table FDC_ACT_CHANGE_OST_KBK_TRANS
  add constraint FDC#FK#ACT_CH_OST_KBK_TR_ISACT foreign key (ID)
  references FDC_ACT_CHANGE_OST_KBK (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_DEDUCTION
prompt ================================
prompt
create table FDC_ACT_DEDUCTION
(
  id              NUMBER(15) not null,
  subject_id      NUMBER(15) not null,
  currency_id     NUMBER(15) not null,
  kbkcode_id      NUMBER(15) not null,
  signed_by       VARCHAR2(50),
  signed_by_chief VARCHAR2(50),
  sign_date       DATE
)
;
comment on table FDC_ACT_DEDUCTION
  is '��� �� �������� �������� �������';
comment on column FDC_ACT_DEDUCTION.id
  is '������������� �������';
comment on column FDC_ACT_DEDUCTION.subject_id
  is '������������� ��������� ���';
comment on column FDC_ACT_DEDUCTION.currency_id
  is '������������� ������';
comment on column FDC_ACT_DEDUCTION.kbkcode_id
  is '������������� ���';
comment on column FDC_ACT_DEDUCTION.signed_by
  is '�����������';
comment on column FDC_ACT_DEDUCTION.signed_by_chief
  is '���������� ������';
comment on column FDC_ACT_DEDUCTION.sign_date
  is '���� ������� ����';
create index FDC#FKIDX#ACT#CUR on FDC_ACT_DEDUCTION (CURRENCY_ID);
create index FDC#FKIDX#ACT#KBK on FDC_ACT_DEDUCTION (KBKCODE_ID);
create index FDC#FKIDX#ACT#PAYER on FDC_ACT_DEDUCTION (SUBJECT_ID);
alter table FDC_ACT_DEDUCTION
  add constraint FDC#PK#ACT_DEDUCTION primary key (ID);
alter table FDC_ACT_DEDUCTION
  add constraint FDC#FK#ACT#CUR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID) on delete set null;
alter table FDC_ACT_DEDUCTION
  add constraint FDC#FK#ACT#KBK foreign key (KBKCODE_ID)
  references FDC_DICT (ID) on delete set null;
alter table FDC_ACT_DEDUCTION
  add constraint FDC#FK#ACT#PAYER foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_ACT_DEDUCTION
  add constraint FDC#FK#ACT_DED_IS_DOCUMENT foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_DED_DEPOSIT
prompt ==================================
prompt
create table FDC_ACT_DED_DEPOSIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_ACT_DED_DEPOSIT
  is '��� �� �������� ����������������� ��������� ������';
comment on column FDC_ACT_DED_DEPOSIT.id
  is '������������� �������';
alter table FDC_ACT_DED_DEPOSIT
  add constraint FDC#PK#ACTDEDDEP primary key (ID);
alter table FDC_ACT_DED_DEPOSIT
  add constraint FDC#FK#DEDDEPOSIT_IS_ACT foreign key (ID)
  references FDC_ACT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_DED_OVERPAY
prompt ==================================
prompt
create table FDC_ACT_DED_OVERPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_ACT_DED_OVERPAY
  is '��� �� �������� ����������������  �������� ������/���������';
comment on column FDC_ACT_DED_OVERPAY.id
  is '������������� �������';
alter table FDC_ACT_DED_OVERPAY
  add constraint FDC#PK#ACTDEDOVERPAY primary key (ID);
alter table FDC_ACT_DED_OVERPAY
  add constraint FDC#FK#DEDOVERPAY_IS_ACT foreign key (ID)
  references FDC_ACT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_ACT_DED_PAYS
prompt ===============================
prompt
create table FDC_ACT_DED_PAYS
(
  id NUMBER(15) not null
)
;
comment on table FDC_ACT_DED_PAYS
  is '��� �� �������� ���������������� ��������� ����������';
comment on column FDC_ACT_DED_PAYS.id
  is '������������� �������';
alter table FDC_ACT_DED_PAYS
  add constraint FDC#PK#ACTDEDPAYS primary key (ID);
alter table FDC_ACT_DED_PAYS
  add constraint FDC#FK#DEDPAYS_IS_ACT foreign key (ID)
  references FDC_ACT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_ADDRESS
prompt ==========================
prompt
create table FDC_ADDRESS
(
  id              NUMBER(15) not null,
  country_dict_id NUMBER(15)
)
;
comment on table FDC_ADDRESS
  is '����� ��������.
����:
����� ���������� (�� �� - ����������),
����� ����������� (�� �� - ����������� �����)
����� ����� ��������
';
comment on column FDC_ADDRESS.id
  is 'ID';
comment on column FDC_ADDRESS.country_dict_id
  is 'COUNTRY_DICT_ID';
create index FDC_ADDRESS_IF241 on FDC_ADDRESS (COUNTRY_DICT_ID);
alter table FDC_ADDRESS
  add constraint FDC_ADDRESS_PK primary key (ID);
alter table FDC_ADDRESS
  add constraint ADDRESS_COUNTRY_ID foreign key (COUNTRY_DICT_ID)
  references FDC_DICT (ID);
alter table FDC_ADDRESS
  add constraint ADDRESS_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_CUSTOMS
prompt ==========================
prompt
create table FDC_CUSTOMS
(
  id             NUMBER(15) not null,
  customs_code   VARCHAR2(5) not null,
  customs_code_8 VARCHAR2(8),
  dt_start       DATE,
  ttt            VARCHAR2(3),
  cert_subject   VARCHAR2(250),
  syscrypto      VARCHAR2(250),
  dt_end         DATE,
  tzone          NUMBER(2)
)
;
comment on table FDC_CUSTOMS
  is '������� FDC_CUSTOMS';
comment on column FDC_CUSTOMS.id
  is 'ID';
comment on column FDC_CUSTOMS.customs_code
  is '8��������� ��� �������';
comment on column FDC_CUSTOMS.customs_code_8
  is 'CUSTOMS_CODE_8';
comment on column FDC_CUSTOMS.dt_start
  is '���� ��������� �������';
comment on column FDC_CUSTOMS.ttt
  is 'TTT';
comment on column FDC_CUSTOMS.cert_subject
  is '��� �������� � ����������� �������-���������� (e-mail)';
comment on column FDC_CUSTOMS.syscrypto
  is '������� ���������� (���������/�����)';
comment on column FDC_CUSTOMS.dt_end
  is '���� ����������';
comment on column FDC_CUSTOMS.tzone
  is '������� �� ������� � ���';
create index FDC#IDX#CUSTOMS#DT_END on FDC_CUSTOMS (DT_END);
create index IDX#CUSTOMS#CODE8 on FDC_CUSTOMS (CUSTOMS_CODE_8);
alter table FDC_CUSTOMS
  add constraint FDC_CUSTOM_PK primary key (ID);
alter table FDC_CUSTOMS
  add constraint FDC_CUSTOMS_AK1 unique (CUSTOMS_CODE, CUSTOMS_CODE_8, DT_START);
alter table FDC_CUSTOMS
  add constraint CUSTOMS_ID foreign key (ID)
  references FDC_SUBJECT (ID) on delete cascade;
alter table FDC_CUSTOMS
  add constraint FDC_CUSTOMS_CK1
  check (NVL(tzone, 0) BETWEEN -12 AND 12);

prompt
prompt Creating table FDC_ADVICE
prompt =========================
prompt
create table FDC_ADVICE
(
  id         NUMBER(15) not null,
  customs_id NUMBER(15),
  subject_id NUMBER(15)
)
;
comment on table FDC_ADVICE
  is '����������� ��������� ���';
comment on column FDC_ADVICE.id
  is '������������� �������';
comment on column FDC_ADVICE.customs_id
  is '�������';
comment on column FDC_ADVICE.subject_id
  is '�������';
create index FDC#FK#ADVICE#CUSTOMS_FDC on FDC_ADVICE (CUSTOMS_ID);
create index FDC#FK#ADVICE#SUBJECT_FDC on FDC_ADVICE (SUBJECT_ID);
alter table FDC_ADVICE
  add constraint FDC#PK#ADVICE primary key (ID);
alter table FDC_ADVICE
  add constraint FDC#FK#ADVICE#CUSTOMS foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_ADVICE
  add constraint FDC#FK#ADVICE#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_ADVICE
  add constraint FDC#FK#ADVICE_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_BACK
prompt ==============================
prompt
create table FDC_ADVICE_BACK
(
  id NUMBER(15) not null
)
;
comment on table FDC_ADVICE_BACK
  is '������� FDC_ADVICE_BACK';
comment on column FDC_ADVICE_BACK.id
  is '��� �����������';
alter table FDC_ADVICE_BACK
  add constraint FDC#PK#ADVICE_BACK primary key (ID);
alter table FDC_ADVICE_BACK
  add constraint FDC#FK#FDC_ADVICE_IS_DOC foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_KNP
prompt =============================
prompt
create table FDC_ADVICE_KNP
(
  id NUMBER(15) not null
)
;
comment on table FDC_ADVICE_KNP
  is '������� FDC_ADVICE_KNP';
comment on column FDC_ADVICE_KNP.id
  is '��� �����������';
alter table FDC_ADVICE_KNP
  add constraint FDC#PK#ADVICE_KNP primary key (ID);
alter table FDC_ADVICE_KNP
  add constraint FDC#FK#ADVICE_KNP_IS_ADVICE foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_LEVY
prompt ==============================
prompt
create table FDC_ADVICE_LEVY
(
  id NUMBER(15) not null,
  constraint FDC#PK#_ADVICE_LEVY primary key (ID)
)
organization index;
comment on table FDC_ADVICE_LEVY
  is '����������� �� �������� ���������';
comment on column FDC_ADVICE_LEVY.id
  is '������������� �������';
alter table FDC_ADVICE_LEVY
  add constraint FDC#FK#ADVICE_LEVY_IS_A_ADVICE foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_PAY
prompt =============================
prompt
create table FDC_ADVICE_PAY
(
  id NUMBER(15) not null,
  constraint FDC#PK#_ADVICE_PAY primary key (ID)
)
organization index;
comment on table FDC_ADVICE_PAY
  is '����������� �� �������� ������';
comment on column FDC_ADVICE_PAY.id
  is '������������� �������';
alter table FDC_ADVICE_PAY
  add constraint FDC#FK#ADVICE_PAY_IS_A_ADVICE foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_PAY_PERIODIC
prompt ======================================
prompt
create table FDC_ADVICE_PAY_PERIODIC
(
  id NUMBER(15) not null,
  constraint FDC#PK#ADVICE_PAY_PERIODIC primary key (ID)
)
organization index;
comment on table FDC_ADVICE_PAY_PERIODIC
  is '����������� �� �������� ������ ��� ������������� ��������� ��������������';
comment on column FDC_ADVICE_PAY_PERIODIC.id
  is '������������� �������';
alter table FDC_ADVICE_PAY_PERIODIC
  add constraint FDC#FK#ADVICE_PAYP_IS_A_ADVICE foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ADVICE_PAY_TPO
prompt =================================
prompt
create table FDC_ADVICE_PAY_TPO
(
  id NUMBER(15) not null,
  constraint FDC#PK#_ADVICE_PAY_TPO primary key (ID)
)
organization index;
comment on table FDC_ADVICE_PAY_TPO
  is '����������� �� �������� ������ �� ���';
comment on column FDC_ADVICE_PAY_TPO.id
  is '������������� �������';
alter table FDC_ADVICE_PAY_TPO
  add constraint FDC#FK#ADVICE_PAY_TPO_IS_A_ADV foreign key (ID)
  references FDC_ADVICE (ID) on delete cascade;

prompt
prompt Creating table FDC_ANNULMENT
prompt ============================
prompt
create table FDC_ANNULMENT
(
  id          NUMBER(15) not null,
  document_id NUMBER(15) not null
)
;
comment on table FDC_ANNULMENT
  is '�������� "�������������"';
comment on column FDC_ANNULMENT.id
  is '������������� �������';
comment on column FDC_ANNULMENT.document_id
  is '������������� ������������� ���������';
create index FDC#FK#ANNULMENT#ANNUL_DOC on FDC_ANNULMENT (DOCUMENT_ID);
alter table FDC_ANNULMENT
  add constraint FDC#PK#ANNULMENT primary key (ID);
alter table FDC_ANNULMENT
  add constraint FDC#FK#ANNULMENT_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_ANNULMENT
  add constraint FDC#FK#ANNUL_DOC foreign key (DOCUMENT_ID)
  references FDC_DOCUMENT (ID);

prompt
prompt Creating table FDC_ANNUL_TPO
prompt ============================
prompt
create table FDC_ANNUL_TPO
(
  id NUMBER(15) not null
)
;
comment on table FDC_ANNUL_TPO
  is '������� FDC_ANNUL_TPO';
comment on column FDC_ANNUL_TPO.id
  is 'ID';
alter table FDC_ANNUL_TPO
  add constraint FDC#PK#ANNUL_TPO primary key (ID);
alter table FDC_ANNUL_TPO
  add constraint FDC#FK#ANNUL_TPO_IS_ANNULMENT foreign key (ID)
  references FDC_ANNULMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_ANNUL_TR
prompt ===========================
prompt
create table FDC_ANNUL_TR
(
  id NUMBER(15) not null
)
;
comment on table FDC_ANNUL_TR
  is '�������� ������������� ��';
comment on column FDC_ANNUL_TR.id
  is '������������� �������';
alter table FDC_ANNUL_TR
  add constraint FDC#PK#ANNUL_TR primary key (ID);
alter table FDC_ANNUL_TR
  add constraint FDC#FK#ANNUL_TR_IS_ANNULMENT foreign key (ID)
  references FDC_ANNULMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_BANK
prompt =======================
prompt
create table FDC_BANK
(
  id             NUMBER(15) not null,
  bic            VARCHAR2(10) not null,
  rur_lic_date   DATE,
  val_lic_date   DATE,
  chief_name     VARCHAR2(100),
  chief_acc_name VARCHAR2(100),
  corr_account   VARCHAR2(20),
  exc_date       DATE
)
;
comment on table FDC_BANK
  is '������� FDC_BANK';
comment on column FDC_BANK.id
  is 'ID';
comment on column FDC_BANK.bic
  is 'BIC';
comment on column FDC_BANK.rur_lic_date
  is 'RUR_LIC_DATE';
comment on column FDC_BANK.val_lic_date
  is 'VAL_LIC_DATE';
comment on column FDC_BANK.chief_name
  is 'CHIEF_NAME';
comment on column FDC_BANK.chief_acc_name
  is 'CHIEF_ACC_NAME';
comment on column FDC_BANK.corr_account
  is 'CORR_ACCOUNT';
comment on column FDC_BANK.exc_date
  is '���� ���������� �� �����������';
alter table FDC_BANK
  add constraint FDC_BANK_PK primary key (ID);
alter table FDC_BANK
  add constraint FDC_BANK_BIC_UK unique (BIC);
alter table FDC_BANK
  add constraint BANK_ID foreign key (ID)
  references FDC_SUBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_BANK_FOR_CASH
prompt ================================
prompt
create table FDC_BANK_FOR_CASH
(
  id                     NUMBER(15) not null,
  bank_id                NUMBER(15) not null,
  payment_to_order_ratio VARCHAR2(10) not null,
  file_format_code       VARCHAR2(20)
)
;
comment on table FDC_BANK_FOR_CASH
  is '������� FDC_BANK_FOR_CASH';
comment on column FDC_BANK_FOR_CASH.id
  is 'ID';
comment on column FDC_BANK_FOR_CASH.bank_id
  is 'BANK_ID';
comment on column FDC_BANK_FOR_CASH.payment_to_order_ratio
  is 'PAYMENT_TO_ORDER_RATIO';
comment on column FDC_BANK_FOR_CASH.file_format_code
  is 'FILE_FORMAT_CODE';
alter table FDC_BANK_FOR_CASH
  add constraint FDC_BANK_FOR_CASH_PK primary key (ID);
alter table FDC_BANK_FOR_CASH
  add constraint FDC_BANK_FOR_CASH_UK unique (BANK_ID);
alter table FDC_BANK_FOR_CASH
  add constraint BANK_FOR_CASH_BANK_ID foreign key (BANK_ID)
  references FDC_BANK (ID);
alter table FDC_BANK_FOR_CASH
  add constraint BANK_FOR_CASH_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_BP_LICENCE
prompt =============================
prompt
create table FDC_BP_LICENCE
(
  id         NUMBER(15) not null,
  doc_no     VARCHAR2(10) not null,
  doc_date   DATE not null,
  subject_id NUMBER(15) not null,
  from_date  DATE not null,
  to_date    DATE not null,
  agrmt_no   VARCHAR2(10),
  agrmt_date DATE,
  level_mark NUMBER(1)
)
;
comment on table FDC_BP_LICENCE
  is '���������� ������� ������������ (������������)';
comment on column FDC_BP_LICENCE.id
  is 'ID';
comment on column FDC_BP_LICENCE.doc_no
  is '����� �������';
comment on column FDC_BP_LICENCE.doc_date
  is '���� �������';
comment on column FDC_BP_LICENCE.subject_id
  is '�����������';
comment on column FDC_BP_LICENCE.from_date
  is '���� ������ ��������';
comment on column FDC_BP_LICENCE.to_date
  is '���� ��������� ��������';
comment on column FDC_BP_LICENCE.agrmt_no
  is '����� ����������';
comment on column FDC_BP_LICENCE.agrmt_date
  is '���� ����������';
comment on column FDC_BP_LICENCE.level_mark
  is '������� ������ ��� (0-��C, 1-���)';
create index FDC_BP_LICENCE_FROM_DATE_I on FDC_BP_LICENCE (FROM_DATE);
create index FDC_BP_LICENCE_SUBJECT_ID__FDC on FDC_BP_LICENCE (SUBJECT_ID);
create index FDC_BP_LICENCE_TO_DATE_I on FDC_BP_LICENCE (TO_DATE);
alter table FDC_BP_LICENCE
  add constraint FDC_BP_LICENCE_PK primary key (ID);
alter table FDC_BP_LICENCE
  add constraint FDC_BP_LICENCE_UQ unique (DOC_NO, DOC_DATE);
alter table FDC_BP_LICENCE
  add constraint FDC_BP_LICENCE_ID_FK foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_BP_LICENCE
  add constraint FDC_BP_LICENCE_SUBJECT_ID_FK foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_BP_LICENCE
  add constraint FDC#CHK#BPLIC#LVL
  check (LEVEL_MARK IN (0, 1));

prompt
prompt Creating table FDC_BP_LICENCE_BROKER
prompt ====================================
prompt
create table FDC_BP_LICENCE_BROKER
(
  licence_id NUMBER(15) not null,
  broker_id  NUMBER(15) not null,
  from_date  DATE not null,
  to_date    DATE
)
;
comment on table FDC_BP_LICENCE_BROKER
  is '������� �� ������������';
comment on column FDC_BP_LICENCE_BROKER.licence_id
  is 'LICENCE_ID';
comment on column FDC_BP_LICENCE_BROKER.broker_id
  is 'BROKER_ID';
comment on column FDC_BP_LICENCE_BROKER.from_date
  is 'FROM_DATE';
comment on column FDC_BP_LICENCE_BROKER.to_date
  is 'TO_DATE';
create index FDC_BP_LBROKER_BROKER_ID_F_FDC on FDC_BP_LICENCE_BROKER (BROKER_ID);
create index FDC_BP_LBROKER_LICENCE_ID__FDC on FDC_BP_LICENCE_BROKER (LICENCE_ID);
create index FDC_BP_LIC_BROK_FROM_DATE_I on FDC_BP_LICENCE_BROKER (FROM_DATE);
create index FDC_BP_LIC_BROK_TO_DATE_I on FDC_BP_LICENCE_BROKER (TO_DATE);
alter table FDC_BP_LICENCE_BROKER
  add constraint FDC_BP_LICENCE_BROKER_PK primary key (LICENCE_ID, BROKER_ID);
alter table FDC_BP_LICENCE_BROKER
  add constraint FDC_BP_LBROKER_BROKER_ID_FK foreign key (BROKER_ID)
  references FDC_SUBJECT (ID);
alter table FDC_BP_LICENCE_BROKER
  add constraint FDC_BP_LBROKER_LICENCE_ID_FK foreign key (LICENCE_ID)
  references FDC_BP_LICENCE (ID) on delete cascade;
alter table FDC_BP_LICENCE_BROKER
  add constraint FDC#CHK#BPLIC_BR#DATE
  check (FROM_DATE < TO_DATE);

prompt
prompt Creating table FDC_BROKER
prompt =========================
prompt
create table FDC_BROKER
(
  id         NUMBER(15) not null,
  license_no VARCHAR2(30),
  beg_date   DATE,
  end_date   DATE,
  bskoltoi   NUMBER,
  bskoltoii  NUMBER,
  reestr_no  VARCHAR2(30),
  subject_id NUMBER(15),
  bnpplic    NUMBER,
  st         VARCHAR2(2),
  adrown     VARCHAR2(255)
)
;
comment on table FDC_BROKER
  is '������� FDC_BROKER';
comment on column FDC_BROKER.id
  is 'ID';
comment on column FDC_BROKER.license_no
  is '����� ��������';
comment on column FDC_BROKER.beg_date
  is '���� ������ ��������';
comment on column FDC_BROKER.end_date
  is '���� ��������� ��������';
comment on column FDC_BROKER.bskoltoi
  is 'BSKOLTOI';
comment on column FDC_BROKER.bskoltoii
  is 'BSKOLTOII';
comment on column FDC_BROKER.reestr_no
  is '����� � �������';
comment on column FDC_BROKER.subject_id
  is '��� ��������';
comment on column FDC_BROKER.bnpplic
  is 'BNPPLIC';
comment on column FDC_BROKER.st
  is '��� ������ ��������� (�����-2)';
comment on column FDC_BROKER.adrown
  is '��������������� ����������� �������������';
create unique index FDC_BROKER_AK_I on FDC_BROKER (REESTR_NO, BEG_DATE, BNPPLIC);
create index FDC_BROKER_BEG_DATE_I on FDC_BROKER (BEG_DATE);
create index FDC_BROKER_END_DATE_I on FDC_BROKER (END_DATE);
create index FDC_BROKER_SUBJECT_ID_I on FDC_BROKER (SUBJECT_ID);
create index FDC_BROKER_SVID on FDC_BROKER (LPAD(LICENSE_NO,4,'0')||'/'||LPAD(TO_CHAR(BNPPLIC),2,'0'));
alter table FDC_BROKER
  add constraint FDC_BROKER_PK primary key (ID);
alter table FDC_BROKER
  add constraint FDC#BROKER#IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_BROKER
  add constraint FDC#BROKER#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_BROKER_CONTRACT
prompt ==================================
prompt
create table FDC_BROKER_CONTRACT
(
  id            NUMBER(15) not null,
  broker_id     NUMBER(15) not null,
  subject_id    NUMBER(15) not null,
  contract_no   VARCHAR2(150) not null,
  contract_date DATE not null,
  begin_date    DATE not null,
  end_date      DATE not null,
  is_authorize  CHAR(1) default 'Y' not null
)
;
comment on table FDC_BROKER_CONTRACT
  is '�������� ���������� �������� � ������������';
comment on column FDC_BROKER_CONTRACT.id
  is '������������� �������';
comment on column FDC_BROKER_CONTRACT.broker_id
  is '������������� �������';
comment on column FDC_BROKER_CONTRACT.subject_id
  is '������������� �������';
comment on column FDC_BROKER_CONTRACT.contract_no
  is '� ��������';
comment on column FDC_BROKER_CONTRACT.contract_date
  is '���� ��������';
comment on column FDC_BROKER_CONTRACT.begin_date
  is '���� ������ �������� ��������';
comment on column FDC_BROKER_CONTRACT.end_date
  is '���� ��������� �������� ��������';
comment on column FDC_BROKER_CONTRACT.is_authorize
  is '����������� ������: Y - ������ ��������, N - ������ �� ��������';
create unique index FDC#AK$BROKER_CONTRACT on FDC_BROKER_CONTRACT (BROKER_ID, SUBJECT_ID, CONTRACT_NO, CONTRACT_DATE);
create index FDC#FK$BROKER_CONTRACT#SUBJECT on FDC_BROKER_CONTRACT (SUBJECT_ID);
create index FDC#IDX#BRK_CNTR#UPPER_CNTR_NO on FDC_BROKER_CONTRACT (UPPER(CONTRACT_NO), CONTRACT_DATE);
create index FDC_BROKER_CONTRACT_BEG_DATE_I on FDC_BROKER_CONTRACT (BEGIN_DATE);
create index FDC_BROKER_CONTRACT_END_DATE_I on FDC_BROKER_CONTRACT (END_DATE);
alter table FDC_BROKER_CONTRACT
  add constraint FDC#PK$BROKER_CONTRACT primary key (ID);
alter table FDC_BROKER_CONTRACT
  add constraint FDC#FK$BROKER_CNTRCT_IS_OBJECT foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_BROKER_CONTRACT
  add constraint FDC#FK$BROKER_CONTRACT#BROKER foreign key (BROKER_ID)
  references FDC_SUBJECT (ID);
alter table FDC_BROKER_CONTRACT
  add constraint FDC#FK$BROKER_CONTRACT#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_BROKER_CONTRACT
  add constraint FDC#CHK$BROKER_CNTRCT#AUTH
  check (IS_AUTHORIZE IN ('Y', 'N'));

prompt
prompt Creating table FDC_DOC_PACK
prompt ===========================
prompt
create table FDC_DOC_PACK
(
  id                    NUMBER(15) not null,
  sender_soft_code_id   NUMBER,
  receiver_soft_code_id NUMBER
)
;
comment on table FDC_DOC_PACK
  is '����� ����������';
comment on column FDC_DOC_PACK.id
  is '������������� �������';
comment on column FDC_DOC_PACK.sender_soft_code_id
  is 'ID ���� ��-����������� ������';
comment on column FDC_DOC_PACK.receiver_soft_code_id
  is 'ID ���� ��-���������� �����';
create index FDC#FK#DOC_PACK#RECV_SCODE_ID on FDC_DOC_PACK (RECEIVER_SOFT_CODE_ID);
create index FDC#FK#DOC_PACK#SENDR_SCODE_ID on FDC_DOC_PACK (SENDER_SOFT_CODE_ID);
alter table FDC_DOC_PACK
  add constraint FDC#PK#DOC_PACK primary key (ID);
alter table FDC_DOC_PACK
  add constraint FDC#FK#DOC_PACK#RECV_SCODE_ID foreign key (RECEIVER_SOFT_CODE_ID)
  references FDC_DICT (ID);
alter table FDC_DOC_PACK
  add constraint FDC#FK#DOC_PACK#SENDR_SCODE_ID foreign key (SENDER_SOFT_CODE_ID)
  references FDC_DICT (ID);
alter table FDC_DOC_PACK
  add constraint FDC#FK#PACK_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_BUDGET_PAYMENT
prompt =================================
prompt
create table FDC_BUDGET_PAYMENT
(
  id           NUMBER(15) not null,
  currency_id  NUMBER(15) not null,
  doc_date     DATE,
  doc_no       VARCHAR2(5),
  date_confirm DATE
)
;
comment on table FDC_BUDGET_PAYMENT
  is '������� FDC_BUDGET_PAYMENT';
comment on column FDC_BUDGET_PAYMENT.id
  is 'ID';
comment on column FDC_BUDGET_PAYMENT.currency_id
  is 'CURRENCY_ID';
comment on column FDC_BUDGET_PAYMENT.doc_date
  is 'DOC_DATE';
comment on column FDC_BUDGET_PAYMENT.doc_no
  is 'DOC_NO';
comment on column FDC_BUDGET_PAYMENT.date_confirm
  is '���� ������������� ��������� ����������� ������������';
create index FDC_BUDGET_PAYMENT_IF2 on FDC_BUDGET_PAYMENT (CURRENCY_ID);
alter table FDC_BUDGET_PAYMENT
  add constraint FDC_BUDGET_PAYMENT_PK primary key (ID);
alter table FDC_BUDGET_PAYMENT
  add constraint BUDGET_PAYMENT_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_BUDGET_PAYMENT
  add constraint FDC#FK#BUDGET_PAY_IS_DOCPACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_SPECIFY_KINDPAY
prompt ======================================
prompt
create table FDC_BUD_SPECIFY_KINDPAY
(
  id            NUMBER(15) not null,
  currency_id   NUMBER(15) not null,
  summa         NUMBER(22,2),
  kbk_source_id NUMBER(15) not null,
  kbk_target_id NUMBER(15) not null,
  direction     VARCHAR2(2)
)
;
comment on table FDC_BUD_SPECIFY_KINDPAY
  is '��������� ���� �������';
comment on column FDC_BUD_SPECIFY_KINDPAY.id
  is '������������� �������';
comment on column FDC_BUD_SPECIFY_KINDPAY.currency_id
  is '������������� ������, ���������� �����';
comment on column FDC_BUD_SPECIFY_KINDPAY.summa
  is '���������� �����';
comment on column FDC_BUD_SPECIFY_KINDPAY.kbk_source_id
  is '������������� ���� ��������� ������������� � �������� ��������';
comment on column FDC_BUD_SPECIFY_KINDPAY.kbk_target_id
  is '������������� ���� ��������� �������������, �� ������� ��������';
comment on column FDC_BUD_SPECIFY_KINDPAY.direction
  is '����������� ����������� ������ (��,��)';
alter table FDC_BUD_SPECIFY_KINDPAY
  add constraint XPKFDC_BUD_SPECIFY_KINDPAY primary key (ID);
alter table FDC_BUD_SPECIFY_KINDPAY
  add foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_CNOTICE_KINDPAY
prompt ======================================
prompt
create table FDC_BUD_CNOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_CNOTICE_KINDPAY
  is '����������� �� ��������� ���� ������� ��� �������� ������';
comment on column FDC_BUD_CNOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_BUD_CNOTICE_KINDPAY
  add constraint XPKFDC_BUD_CNOTICE_KINDPAY primary key (ID);
alter table FDC_BUD_CNOTICE_KINDPAY
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_CNOTICE_KINDPAYS
prompt =======================================
prompt
create table FDC_BUD_CNOTICE_KINDPAYS
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_CNOTICE_KINDPAYS
  is '����������� �� ��������� ���� ������� ��� �������� ������ ��������� �� ���������� ��';
comment on column FDC_BUD_CNOTICE_KINDPAYS.id
  is '������������� �������';
alter table FDC_BUD_CNOTICE_KINDPAYS
  add constraint XPKFDC_BUD_CNOTICE_KINDPAYS primary key (ID);
alter table FDC_BUD_CNOTICE_KINDPAYS
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_CONFIRM_KINDPAY
prompt ======================================
prompt
create table FDC_BUD_CONFIRM_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_CONFIRM_KINDPAY
  is '������������� �� ��������� ���� �������';
comment on column FDC_BUD_CONFIRM_KINDPAY.id
  is '������������� �������';
alter table FDC_BUD_CONFIRM_KINDPAY
  add constraint XPKFDC_BUD_CONFIRM_KINDPAY primary key (ID);
alter table FDC_BUD_CONFIRM_KINDPAY
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_CONFIRM_KINDPAYS
prompt =======================================
prompt
create table FDC_BUD_CONFIRM_KINDPAYS
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_CONFIRM_KINDPAYS
  is '������������� �� ��������� ���� ������� ��������� �� ���������� ��';
comment on column FDC_BUD_CONFIRM_KINDPAYS.id
  is '������������� �������';
alter table FDC_BUD_CONFIRM_KINDPAYS
  add constraint XPKFDC_BUD_CONFIRM_KINDPAYS primary key (ID);
alter table FDC_BUD_CONFIRM_KINDPAYS
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_NOTICE_KINDPAY
prompt =====================================
prompt
create table FDC_BUD_NOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_NOTICE_KINDPAY
  is '����������� �� ��������� ���� �������';
comment on column FDC_BUD_NOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_BUD_NOTICE_KINDPAY
  add constraint XPKFDC_BUD_NOTICE_KINDPAY primary key (ID);
alter table FDC_BUD_NOTICE_KINDPAY
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUD_NOTICE_KINDPAYS
prompt ======================================
prompt
create table FDC_BUD_NOTICE_KINDPAYS
(
  id NUMBER(15) not null
)
;
comment on table FDC_BUD_NOTICE_KINDPAYS
  is '����������� �� ��������� ���� ������� ��������� �� ���������� ��';
comment on column FDC_BUD_NOTICE_KINDPAYS.id
  is '������������� �������';
alter table FDC_BUD_NOTICE_KINDPAYS
  add constraint XPKFDC_BUD_NOTICE_KINDPAYS primary key (ID);
alter table FDC_BUD_NOTICE_KINDPAYS
  add foreign key (ID)
  references FDC_BUD_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_BUFFER
prompt =========================
prompt
create global temporary table FDC_BUFFER
(
  id    NUMBER(15),
  sess  NUMBER(15),
  txt   VARCHAR2(1500),
  mark1 NUMBER,
  mark2 NUMBER,
  mark3 NUMBER,
  mark4 NUMBER
)
on commit preserve rows;
comment on table FDC_BUFFER
  is '��������� �����, ����������� �� ������������� � ������ ������';
comment on column FDC_BUFFER.id
  is '������������� �������, ���������� �� ��������� �����';
comment on column FDC_BUFFER.sess
  is '������������� ������ ������ (��������, ������� ��� ����� ���������). �� ����� ��������� � �������� ��������� ������ fdc_session';
comment on column FDC_BUFFER.txt
  is '������������ ����������� �����';
comment on column FDC_BUFFER.mark1
  is '�������������� ������������� ��� ������������ �������� �������';
comment on column FDC_BUFFER.mark2
  is '�������������� ������������� ��� ������������ �������� �������';
comment on column FDC_BUFFER.mark3
  is '�������������� ������������� ��� ������������ �������� �������';
comment on column FDC_BUFFER.mark4
  is '�������������� ������������� ��� ������������ �������� �������';
create index FDC_BUFFER_IE1 on FDC_BUFFER (ID);
create index FDC_BUFFER_IE2 on FDC_BUFFER (SESS);

prompt
prompt Creating table FDC_DECISION
prompt ===========================
prompt
create table FDC_DECISION
(
  id                  NUMBER(15) not null,
  reason_id           NUMBER(15),
  subject_id          NUMBER(15),
  app_number          VARCHAR2(50),
  app_date            DATE,
  app_date_income     DATE,
  signed_by           VARCHAR2(50),
  sign_date           DATE,
  signed_by_chief     VARCHAR2(50),
  signed_by_chief_udf VARCHAR2(50),
  app_number_income   VARCHAR2(50),
  customs_code        VARCHAR2(8),
  doc_code            VARCHAR2(8),
  doc_osn_code        VARCHAR2(2),
  sud_reason_id       NUMBER(15),
  debts_summa         NUMBER(24,2),
  debt_pay_summa      NUMBER(24,2),
  debt_peny_summa     NUMBER(24,2),
  debt_proc_summa     NUMBER(24,2),
  is_external         VARCHAR2(1)
)
;
comment on table FDC_DECISION
  is '�������� "�������"';
comment on column FDC_DECISION.id
  is '������������� �������';
comment on column FDC_DECISION.reason_id
  is '������������� �������';
comment on column FDC_DECISION.subject_id
  is '������������� �������';
comment on column FDC_DECISION.app_number
  is '� ���������';
comment on column FDC_DECISION.app_date
  is '���� ���������';
comment on column FDC_DECISION.app_date_income
  is '���� ��������� ��������';
comment on column FDC_DECISION.signed_by
  is '�����������';
comment on column FDC_DECISION.sign_date
  is '���� �������';
comment on column FDC_DECISION.signed_by_chief
  is '��������� (����������� ����������)';
comment on column FDC_DECISION.signed_by_chief_udf
  is '��������� ���� � ���';
comment on column FDC_DECISION.app_number_income
  is '� ��������� ��������';
comment on column FDC_DECISION.customs_code
  is '��� ����������� ������, ���������� �������';
comment on column FDC_DECISION.doc_code
  is '����������� �������� ����� �������';
comment on column FDC_DECISION.doc_osn_code
  is '����������� �������� ���-�� ���������';
comment on column FDC_DECISION.sud_reason_id
  is '������������� ������� ��������� ����� �������� �� ��������������';
comment on column FDC_DECISION.debts_summa
  is '����� ����� ������������� ��������� ��� �� ������ �������� �������';
comment on column FDC_DECISION.debt_pay_summa
  is '����� ������������ ������������� �� ��������';
comment on column FDC_DECISION.debt_peny_summa
  is '����� ������������ ������������� �� ����';
comment on column FDC_DECISION.debt_proc_summa
  is '����� ������������ ������������� �� ���������';
comment on column FDC_DECISION.is_external
  is '������� �� ������� �������';
create index FDC#FK#DECISION#NSI_DIC_FDC on FDC_DECISION (REASON_ID);
create index FDC#FK#DECISION#SUBJECT_FDC on FDC_DECISION (SUBJECT_ID);
create index FDC#IDX#DECISION#SUD_REASON on FDC_DECISION (SUD_REASON_ID);
alter table FDC_DECISION
  add constraint FDC#PK#DECISION primary key (ID);
alter table FDC_DECISION
  add constraint FDC#FK#DECISION#NSI_DICT foreign key (REASON_ID)
  references FDC_NSI_DICT (ID);
alter table FDC_DECISION
  add constraint FDC#FK#DECISION#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_DECISION
  add constraint FDC#FK#DECISION#SUD_REASON foreign key (SUD_REASON_ID)
  references FDC_DICT (ID);
alter table FDC_DECISION
  add constraint FDC#FK#DECISION_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECISION_PAYBACK
prompt ===================================
prompt
create table FDC_DECISION_PAYBACK
(
  id                NUMBER(15) not null,
  summa             NUMBER(22,2),
  bank_date         DATE,
  currency_id       NUMBER,
  destsub_id        NUMBER(15),
  account           VARCHAR2(20),
  bank_id           NUMBER(15),
  kbkcode_id        NUMBER(15),
  personal_account  VARCHAR2(20),
  date_last_doc     DATE,
  destsub_name      VARCHAR2(1500),
  excise_pay        VARCHAR2(1) default 'N' not null,
  decision_court    VARCHAR2(1) default 'N' not null,
  date_court        DATE,
  court_act_attrs   VARCHAR2(50),
  customs_dec_attrs VARCHAR2(50),
  summa_base        NUMBER(22,2),
  prev_decision_id  NUMBER(15)
)
;
comment on table FDC_DECISION_PAYBACK
  is '������� � ��������';
comment on column FDC_DECISION_PAYBACK.id
  is '������������� �������';
comment on column FDC_DECISION_PAYBACK.summa
  is '�����, ���������� ��������';
comment on column FDC_DECISION_PAYBACK.bank_date
  is '���� �������� ������';
comment on column FDC_DECISION_PAYBACK.currency_id
  is '������';
comment on column FDC_DECISION_PAYBACK.destsub_id
  is '���������� ��������';
comment on column FDC_DECISION_PAYBACK.account
  is '���� ���������� ��������';
comment on column FDC_DECISION_PAYBACK.bank_id
  is '������������� ����� ����������';
comment on column FDC_DECISION_PAYBACK.kbkcode_id
  is '��� ���';
comment on column FDC_DECISION_PAYBACK.personal_account
  is 'PERSONAL_ACCOUNT';
comment on column FDC_DECISION_PAYBACK.date_last_doc
  is 'DATE_LAST_DOC';
comment on column FDC_DECISION_PAYBACK.destsub_name
  is '������������ ���������� ��� ����� (�� ��������)';
comment on column FDC_DECISION_PAYBACK.excise_pay
  is '�� ������� �������� �����';
comment on column FDC_DECISION_PAYBACK.decision_court
  is '�� ������� ����';
comment on column FDC_DECISION_PAYBACK.date_court
  is '���� �� ����';
comment on column FDC_DECISION_PAYBACK.court_act_attrs
  is '��������� ��������� ����';
comment on column FDC_DECISION_PAYBACK.customs_dec_attrs
  is '��������� ������� ��';
comment on column FDC_DECISION_PAYBACK.summa_base
  is '����� ��� �������������';
comment on column FDC_DECISION_PAYBACK.prev_decision_id
  is '������������� ��������� �������';
create index FDC#FK#DEC_PAYBACK#CURRENCY on FDC_DECISION_PAYBACK (CURRENCY_ID);
create index FDC#FK#DEC_PAYBACK#DESTSUB on FDC_DECISION_PAYBACK (DESTSUB_ID);
create index FDC#FK#DP_KBKCODE on FDC_DECISION_PAYBACK (KBKCODE_ID);
create index IDX#DEC_BACK#DEC_COURT on FDC_DECISION_PAYBACK (DECISION_COURT);
create index IDX#DEC_BACK#EXCISE_PAY on FDC_DECISION_PAYBACK (EXCISE_PAY);
create index IDX#FK#PREV_PAYBACK on FDC_DECISION_PAYBACK (PREV_DECISION_ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#PK#DECISION_PAYBACK primary key (ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#FK#DECISION_PAYBACK_IS_DEC foreign key (ID)
  references FDC_DECISION (ID) on delete cascade;
alter table FDC_DECISION_PAYBACK
  add constraint FDC#FK#DEC_PAYBACK#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#FK#DEC_PAYBACK#DESTSUB foreign key (DESTSUB_ID)
  references FDC_SUBJECT (ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#FK#DP_KBKCODE foreign key (KBKCODE_ID)
  references FDC_DICT (ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#FK#PREV_PAYBACK foreign key (PREV_DECISION_ID)
  references FDC_DECISION (ID);
alter table FDC_DECISION_PAYBACK
  add constraint FDC#CHK#DEC_BACK#EXCISE_PAY
  check (Excise_Pay IN ('Y', 'N'));

prompt
prompt Creating table FDC_CANCEL_DECISION_PAYBACK
prompt ==========================================
prompt
create table FDC_CANCEL_DECISION_PAYBACK
(
  id           NUMBER(15) not null,
  subject_id   NUMBER(15),
  dec_pay_id   NUMBER(15),
  cancellevel  VARCHAR2(150),
  cancelreason VARCHAR2(1500)
)
;
comment on table FDC_CANCEL_DECISION_PAYBACK
  is '������� FDC_CANCEL_DECISION_PAYBACK';
comment on column FDC_CANCEL_DECISION_PAYBACK.id
  is 'ID';
comment on column FDC_CANCEL_DECISION_PAYBACK.subject_id
  is 'SUBJECT_ID';
comment on column FDC_CANCEL_DECISION_PAYBACK.dec_pay_id
  is 'DEC_PAY_ID';
comment on column FDC_CANCEL_DECISION_PAYBACK.cancellevel
  is '������� �� ������� ��������� �����';
comment on column FDC_CANCEL_DECISION_PAYBACK.cancelreason
  is '������� �� ������� ��������� �����';
create unique index FDC#FK#CANCEL#SUB#PAY on FDC_CANCEL_DECISION_PAYBACK (SUBJECT_ID, DEC_PAY_ID);
create index FDC#FK#CANCEL_BACK#DEC_PAY_ID on FDC_CANCEL_DECISION_PAYBACK (DEC_PAY_ID);
alter table FDC_CANCEL_DECISION_PAYBACK
  add constraint FDC#PK#CANCEL_PAYBACK primary key (ID);
alter table FDC_CANCEL_DECISION_PAYBACK
  add constraint FDC#FK#CANCEL_BACK#DEC_PAY_ID foreign key (DEC_PAY_ID)
  references FDC_DECISION_PAYBACK (ID);
alter table FDC_CANCEL_DECISION_PAYBACK
  add constraint FDC#FK#CANCEL_BACK#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_CANCEL_DECISION_PAYBACK
  add constraint FDC#FK#CANCEL_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_CASHDESK
prompt ===========================
prompt
create table FDC_CASHDESK
(
  id        NUMBER(15) not null,
  custom_id NUMBER(15)
)
;
comment on table FDC_CASHDESK
  is '��������� �����';
comment on column FDC_CASHDESK.id
  is '������������� ��������� �����';
comment on column FDC_CASHDESK.custom_id
  is '������������� ����������� ������ ��������� �����';
create index FDC_CASHDESK_CUSTOM_ID_I on FDC_CASHDESK (CUSTOM_ID);
alter table FDC_CASHDESK
  add constraint FDC_CASHDESK_PK primary key (ID);
alter table FDC_CASHDESK
  add constraint FDC_CASHDESK_CUSTOMS_FK foreign key (CUSTOM_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_CASHDESK
  add constraint FDC_CASHDESK_OBJECT_FK foreign key (ID)
  references FDC_OBJECT (ID);

prompt
prompt Creating table FDC_CERT_RECEPIENT
prompt =================================
prompt
create table FDC_CERT_RECEPIENT
(
  id           NUMBER(15) not null,
  customs_id   NUMBER(15) not null,
  soft_id      NUMBER(15),
  cert_subject VARCHAR2(255) not null,
  is_active    CHAR(1) default 'Y' not null
)
;
comment on table FDC_CERT_RECEPIENT
  is '���������� ����������� ����������� ���������';
comment on column FDC_CERT_RECEPIENT.id
  is '������������� �������';
comment on column FDC_CERT_RECEPIENT.customs_id
  is '������������� ����������� ������';
comment on column FDC_CERT_RECEPIENT.soft_id
  is '������������� ������������ �����������';
comment on column FDC_CERT_RECEPIENT.cert_subject
  is '������� � �����������';
comment on column FDC_CERT_RECEPIENT.is_active
  is '������������ ������ - (�������� "Y" - ���������; "N" - ���)';
create index FDC_CERT_RECEPIENT_CUST_ID_I on FDC_CERT_RECEPIENT (CUSTOMS_ID);
create index FDC_CERT_RECEPIENT_SOFT_ID_I on FDC_CERT_RECEPIENT (SOFT_ID);
alter table FDC_CERT_RECEPIENT
  add constraint FDC#PK#FDC_CERT_RECEPIENT primary key (ID);
alter table FDC_CERT_RECEPIENT
  add constraint FDC#FK#CERT_RECEPIENT#CUST foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_CERT_RECEPIENT
  add constraint FDC#FK#CERT_RECEPIENT#ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_CERT_RECEPIENT
  add constraint FDC#FK#CERT_RECEPIENT#SOFT foreign key (SOFT_ID)
  references FDC_DICT (ID);
alter table FDC_CERT_RECEPIENT
  add constraint FDC#CHK#CERT_RECEPIENT#IS_ACT
  check (IS_ACTIVE IN ('Y', 'N'));

prompt
prompt Creating table FDC_CHANGE_TABLE
prompt ===============================
prompt
create table FDC_CHANGE_TABLE
(
  id            NUMBER(15) not null,
  date_from     DATE default SYSDATE,
  object_id     NUMBER(15),
  event_type_id NUMBER(15),
  user_id       NUMBER(15),
  table_name    VARCHAR2(30)
)
;
comment on table FDC_CHANGE_TABLE
  is '������� FDC_CHANGE_TABLE';
comment on column FDC_CHANGE_TABLE.id
  is 'ID';
comment on column FDC_CHANGE_TABLE.date_from
  is 'DATE_FROM';
comment on column FDC_CHANGE_TABLE.object_id
  is 'OBJECT_ID';
comment on column FDC_CHANGE_TABLE.event_type_id
  is 'EVENT_TYPE_ID';
comment on column FDC_CHANGE_TABLE.user_id
  is 'USER_ID';
comment on column FDC_CHANGE_TABLE.table_name
  is 'TABLE_NAME';
alter table FDC_CHANGE_TABLE
  add constraint FDC_CHANGE_TABLE_PK primary key (ID);

prompt
prompt Creating table FDC_CHANGE_COLUMN
prompt ================================
prompt
create table FDC_CHANGE_COLUMN
(
  id       NUMBER(15) not null,
  table_id NUMBER(15),
  col_name VARCHAR2(30),
  num_new  NUMBER,
  num_old  NUMBER,
  date_new DATE,
  date_old DATE,
  char_new VARCHAR2(4000),
  char_old VARCHAR2(4000)
)
;
comment on table FDC_CHANGE_COLUMN
  is '������� FDC_CHANGE_COLUMN';
comment on column FDC_CHANGE_COLUMN.id
  is 'ID';
comment on column FDC_CHANGE_COLUMN.table_id
  is 'TABLE_ID';
comment on column FDC_CHANGE_COLUMN.col_name
  is 'COL_NAME';
comment on column FDC_CHANGE_COLUMN.num_new
  is 'NUM_NEW';
comment on column FDC_CHANGE_COLUMN.num_old
  is 'NUM_OLD';
comment on column FDC_CHANGE_COLUMN.date_new
  is 'DATE_NEW';
comment on column FDC_CHANGE_COLUMN.date_old
  is 'DATE_OLD';
comment on column FDC_CHANGE_COLUMN.char_new
  is 'CHAR_NEW';
comment on column FDC_CHANGE_COLUMN.char_old
  is 'CHAR_OLD';
create index FDC_COLUMN_TABLE_ID_FDC on FDC_CHANGE_COLUMN (TABLE_ID);
alter table FDC_CHANGE_COLUMN
  add constraint FDC_CHANGE_COLUMN_PK primary key (ID);
alter table FDC_CHANGE_COLUMN
  add constraint FDC_COLUMN_TABLE_ID foreign key (TABLE_ID)
  references FDC_CHANGE_TABLE (ID);

prompt
prompt Creating table FDC_CHANGE_KBK
prompt =============================
prompt
create table FDC_CHANGE_KBK
(
  id           NUMBER(15) not null,
  date_begin   DATE,
  date_end     DATE,
  from_kbkcode VARCHAR2(20) not null,
  to_kbkcode   VARCHAR2(20) not null,
  is_ro        CHAR(1) default 'N' not null
)
;
comment on table FDC_CHANGE_KBK
  is '������������ ����� �������������� � ������������ ���';
comment on column FDC_CHANGE_KBK.id
  is 'ID';
comment on column FDC_CHANGE_KBK.date_begin
  is 'DATE_BEGIN';
comment on column FDC_CHANGE_KBK.date_end
  is 'DATE_END';
comment on column FDC_CHANGE_KBK.from_kbkcode
  is 'FROM_KBKCODE';
comment on column FDC_CHANGE_KBK.to_kbkcode
  is 'TO_KBKCODE';
comment on column FDC_CHANGE_KBK.is_ro
  is 'IS_RO';
alter table FDC_CHANGE_KBK
  add constraint FDC#PK#FDC_CHANGE_KBK primary key (ID);
alter table FDC_CHANGE_KBK
  add constraint FDC#FK#CHANGE_KBK_IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_CHANGE_KBK_DED
prompt =================================
prompt
create table FDC_CHANGE_KBK_DED
(
  id            NUMBER(15) not null,
  change_kbk_id NUMBER(15) not null,
  doc_id        NUMBER(15) not null,
  change_date   DATE not null,
  summa         NUMBER(22,2) not null
)
;
comment on table FDC_CHANGE_KBK_DED
  is '�������� �������� � ��� �� ���';
comment on column FDC_CHANGE_KBK_DED.id
  is '������������� �������';
comment on column FDC_CHANGE_KBK_DED.change_kbk_id
  is '������������� ������������ ���';
comment on column FDC_CHANGE_KBK_DED.doc_id
  is '������������� ���� � �������� ��������';
comment on column FDC_CHANGE_KBK_DED.change_date
  is '���� ��������';
comment on column FDC_CHANGE_KBK_DED.summa
  is '����� ��������';
create index FDC#FK#CH_KBK_DED#CHKBK on FDC_CHANGE_KBK_DED (CHANGE_KBK_ID);
create index FDC#FK#CH_KBK_DED#IN_ACT on FDC_CHANGE_KBK_DED (DOC_ID);
alter table FDC_CHANGE_KBK_DED
  add constraint FDC#PK_CH_KBK_DED#ID primary key (ID);
alter table FDC_CHANGE_KBK_DED
  add constraint FDC#FK_CH_KBK_DED#CHKBK foreign key (CHANGE_KBK_ID)
  references FDC_CHANGE_KBK (ID);
alter table FDC_CHANGE_KBK_DED
  add constraint FDC#FK_CH_KBK_DED#IN_ACT foreign key (DOC_ID)
  references FDC_DOCUMENT (ID);
alter table FDC_CHANGE_KBK_DED
  add constraint FDC#FK_CH_KBK_DED#IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CHARGE
prompt =============================
prompt
create table FDC_DOC_CHARGE
(
  id             NUMBER(15) not null,
  subject_id     NUMBER(15),
  currency_id    NUMBER(15),
  custom_mode_id NUMBER(22,2),
  customs_code   VARCHAR2(8),
  reg_date       DATE,
  decl_no        VARCHAR2(100),
  modify_date    DATE,
  decision_code  VARCHAR2(2),
  aggrement_id   NUMBER(15),
  uin            VARCHAR2(36)
)
;
comment on table FDC_DOC_CHARGE
  is '������� FDC_DOC_CHARGE';
comment on column FDC_DOC_CHARGE.id
  is 'ID';
comment on column FDC_DOC_CHARGE.subject_id
  is 'SUBJECT_ID';
comment on column FDC_DOC_CHARGE.currency_id
  is 'CURRENCY_ID';
comment on column FDC_DOC_CHARGE.custom_mode_id
  is 'CUSTOM_MODE_ID';
comment on column FDC_DOC_CHARGE.customs_code
  is 'CUSTOMS_CODE';
comment on column FDC_DOC_CHARGE.reg_date
  is 'REG_DATE';
comment on column FDC_DOC_CHARGE.decl_no
  is 'DECL_NO';
comment on column FDC_DOC_CHARGE.modify_date
  is 'MODIFY_DATE';
comment on column FDC_DOC_CHARGE.decision_code
  is 'DECISION_CODE';
comment on column FDC_DOC_CHARGE.aggrement_id
  is '�� ������ ������� ������ �� ����������, �� ������ ��� ������ �� ���������� ';
comment on column FDC_DOC_CHARGE.uin
  is '���������� ������������� ����������';
create index FDC#FK#IDX#AGGREMENT on FDC_DOC_CHARGE (AGGREMENT_ID);
create index FDC#FK#IDX#DOC_CHARGE#CMODE on FDC_DOC_CHARGE (CUSTOM_MODE_ID);
create index FDC#FK#IDX#DOC_CHARGE#CURR on FDC_DOC_CHARGE (CURRENCY_ID);
create index FDC#FK#IDX#DOC_CHARGE#NO on FDC_DOC_CHARGE (CUSTOMS_CODE, REG_DATE, DECL_NO);
create index FDC#FK#IDX#DOC_CHARGE#SUBJECT on FDC_DOC_CHARGE (SUBJECT_ID);
create index FDC#IDX#DOC_CHARGE#CUST_CODE on FDC_DOC_CHARGE (CUSTOMS_CODE);
alter table FDC_DOC_CHARGE
  add constraint XPKFDC_DOC_CHARGE primary key (ID);
alter table FDC_DOC_CHARGE
  add constraint FK#FDC_DOC_CHARGE#UIN unique (UIN);
alter table FDC_DOC_CHARGE
  add constraint FK#FDC_DOC_CHARGE#CMODE foreign key (CUSTOM_MODE_ID)
  references FDC_DICT (ID);
alter table FDC_DOC_CHARGE
  add constraint FK#FDC_DOC_CHARGE#CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DOC_CHARGE
  add constraint FK#FDC_DOC_CHARGE#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_DOC_CHARGE
  add foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_CHARGE
prompt ==============================
prompt
create table FDC_DECL_CHARGE
(
  id               NUMBER(15) not null,
  decl_id          NUMBER(15) not null,
  pay_type_id      NUMBER(15) not null,
  summa            NUMBER(22,2) not null,
  currency_id      NUMBER(15) not null,
  change_reason_id INTEGER,
  change_desc      VARCHAR2(2000),
  change_date      DATE,
  kbkcode_id       NUMBER(15),
  charge_month     DATE
)
;
comment on table FDC_DECL_CHARGE
  is '������� FDC_DECL_CHARGE';
comment on column FDC_DECL_CHARGE.id
  is 'ID';
comment on column FDC_DECL_CHARGE.decl_id
  is 'DECL_ID';
comment on column FDC_DECL_CHARGE.pay_type_id
  is 'PAY_TYPE_ID';
comment on column FDC_DECL_CHARGE.summa
  is 'SUMMA';
comment on column FDC_DECL_CHARGE.currency_id
  is 'CURRENCY_ID';
comment on column FDC_DECL_CHARGE.change_reason_id
  is 'CHANGE_REASON_ID';
comment on column FDC_DECL_CHARGE.change_desc
  is 'CHANGE_DESC';
comment on column FDC_DECL_CHARGE.change_date
  is 'CHANGE_DATE';
comment on column FDC_DECL_CHARGE.kbkcode_id
  is '��� ���';
comment on column FDC_DECL_CHARGE.charge_month
  is 'CHARGE_MONTH';
create index DECL_KBKCODE_ID_FDC on FDC_DECL_CHARGE (KBKCODE_ID);
create index FDC_DECL_CHARGE_IF2 on FDC_DECL_CHARGE (DECL_ID);
create index FDC_DECL_CHARGE_IF3 on FDC_DECL_CHARGE (PAY_TYPE_ID);
create index FDC_DECL_CHARGE_IF6 on FDC_DECL_CHARGE (CURRENCY_ID);
create index FDC_DECL_CHARGE_IF7 on FDC_DECL_CHARGE (CHANGE_REASON_ID);
alter table FDC_DECL_CHARGE
  add constraint FDC_DECL_CHARGE_PK primary key (ID);
alter table FDC_DECL_CHARGE
  add constraint DECL_CHARGE_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DECL_CHARGE
  add constraint DECL_CHARGE_DECL_ID foreign key (DECL_ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;
alter table FDC_DECL_CHARGE
  add constraint DECL_CHARGE_PAY_TYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);
alter table FDC_DECL_CHARGE
  add constraint DECL_KBKCODE_ID foreign key (KBKCODE_ID)
  references FDC_DICT (ID);
alter table FDC_DECL_CHARGE
  add constraint FDC#FK#DECL_CHARGE_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_DICT_KBK
prompt ===============================
prompt
create table FDC_NSI_DICT_KBK
(
  id               NUMBER(15) not null,
  is_prepaymentkbk VARCHAR2(1) default 'N',
  is_for_report    VARCHAR2(1) default 'Y' not null
)
;
comment on table FDC_NSI_DICT_KBK
  is '������� FDC_NSI_DICT_KBK';
comment on column FDC_NSI_DICT_KBK.id
  is 'ID';
comment on column FDC_NSI_DICT_KBK.is_prepaymentkbk
  is '������� ���������� ���
Y - ��� ����� ������������ ��� ���������
N - � ��������� ������';
comment on column FDC_NSI_DICT_KBK.is_for_report
  is '������� ������������� ��� � �������� ������: Y - ������������ N - �� ������������';
alter table FDC_NSI_DICT_KBK
  add constraint XPKFDC_NSI_DICT_KBK primary key (ID);
alter table FDC_NSI_DICT_KBK
  add constraint FDC#FK#NSI_KBK_IS_DICT_NSI foreign key (ID)
  references FDC_NSI_DICT (ID) on delete cascade;
alter table FDC_NSI_DICT_KBK
  add constraint FDC#CHK#BOOL71
  check (IS_PREPAYMENTKBK IN ('Y', 'N'));

prompt
prompt Creating table FDC_CHARGE_TR
prompt ============================
prompt
create table FDC_CHARGE_TR
(
  id          NUMBER(15) not null,
  pay_type_id NUMBER(15),
  kbkcode_id  NUMBER(15)
)
;
comment on table FDC_CHARGE_TR
  is '������� FDC_CHARGE_TR';
comment on column FDC_CHARGE_TR.id
  is 'ID';
comment on column FDC_CHARGE_TR.pay_type_id
  is '��� ������� ��������';
comment on column FDC_CHARGE_TR.kbkcode_id
  is '��� ��������';
create index FDC_CHARGE_TR_KBKCODE_IF on FDC_CHARGE_TR (KBKCODE_ID);
create index FDC_CHARGE_TR_PAYTYPE_IF on FDC_CHARGE_TR (PAY_TYPE_ID);
alter table FDC_CHARGE_TR
  add constraint FDC_TR_CHARGE_PK primary key (ID);
alter table FDC_CHARGE_TR
  add constraint FDC_TR_CHARGE_CHARGE foreign key (ID)
  references FDC_DECL_CHARGE (ID) on delete cascade;
alter table FDC_CHARGE_TR
  add constraint FDC_TR_CHARGE_KBKCDE_ID foreign key (KBKCODE_ID)
  references FDC_NSI_DICT_KBK (ID);
alter table FDC_CHARGE_TR
  add constraint FDC_TR_CHARGE_PAYTYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_CHILD_OBJECT_TYPE
prompt ====================================
prompt
create table FDC_CHILD_OBJECT_TYPE
(
  object_type_id       NUMBER(15) not null,
  child_object_type_id NUMBER(15) not null
)
;
comment on table FDC_CHILD_OBJECT_TYPE
  is '��� ������� ���� ��������� ��� ��� �������. ��� ��� ��������� ���������� ��������.';
comment on column FDC_CHILD_OBJECT_TYPE.object_type_id
  is 'OBJECT_TYPE_ID';
comment on column FDC_CHILD_OBJECT_TYPE.child_object_type_id
  is 'CHILD_OBJECT_TYPE_ID';
create index CHILD_OBJECT_TYPE_CHILD_OB_FDC on FDC_CHILD_OBJECT_TYPE (CHILD_OBJECT_TYPE_ID);
create index CHILD_OBJECT_TYPE_OBJECT_T_FDC on FDC_CHILD_OBJECT_TYPE (OBJECT_TYPE_ID);
alter table FDC_CHILD_OBJECT_TYPE
  add constraint FDC_CHILD_OBJECT_TYPE_PK primary key (OBJECT_TYPE_ID, CHILD_OBJECT_TYPE_ID);
alter table FDC_CHILD_OBJECT_TYPE
  add constraint FDC_CHILD_OBJECT_TYPE_AK1 unique (CHILD_OBJECT_TYPE_ID, OBJECT_TYPE_ID);
alter table FDC_CHILD_OBJECT_TYPE
  add constraint CHILD_OBJECT_TYPE_CHILD_OBJECT foreign key (CHILD_OBJECT_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);
alter table FDC_CHILD_OBJECT_TYPE
  add constraint CHILD_OBJECT_TYPE_OBJECT_TYPE_ foreign key (OBJECT_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_DOC_CONFIRM
prompt ==============================
prompt
create table FDC_DOC_CONFIRM
(
  id               NUMBER(15) not null,
  confirmed_doc_id NUMBER(15) not null,
  constraint FDC#PK#DOC_CONFIRM primary key (ID)
)
organization index;
comment on table FDC_DOC_CONFIRM
  is '������������� ��������-���������';
comment on column FDC_DOC_CONFIRM.id
  is '������������� �������';
comment on column FDC_DOC_CONFIRM.confirmed_doc_id
  is '�������������� ��������';
create index FDC#FK#DOC_CONFIRM#DOCUMENT on FDC_DOC_CONFIRM (CONFIRMED_DOC_ID);
alter table FDC_DOC_CONFIRM
  add constraint FDC#FK#DOC_CONFIRM#DOCUMENT foreign key (CONFIRMED_DOC_ID)
  references FDC_DOCUMENT (ID);
alter table FDC_DOC_CONFIRM
  add constraint FDC#FK#DOC_CONFIRM_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CNFRM_BP
prompt ===============================
prompt
create table FDC_DOC_CNFRM_BP
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CNFRM_BP primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_BP
  is '���������-������������� ��������� ������� ����������� ��';
comment on column FDC_DOC_CNFRM_BP.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_BP
  add constraint FDC#FK#DOC_CNFRM_BP_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_CNFRM_CNOTICE_KINDPAY
prompt ========================================
prompt
create table FDC_CNFRM_CNOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_CNFRM_CNOTICE_KINDPAY
  is '������������� ��������� ������� ����������� �� ��������� ���� ������� ��� �������� ������ ����������� ��';
comment on column FDC_CNFRM_CNOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_CNFRM_CNOTICE_KINDPAY
  add constraint XPKFDC_CNFRM_CNOTICE_KINDPAY primary key (ID);
alter table FDC_CNFRM_CNOTICE_KINDPAY
  add foreign key (ID)
  references FDC_DOC_CNFRM_BP (ID) on delete cascade;

prompt
prompt Creating table FDC_CNFRM_CONFIRM_KINDPAY
prompt ========================================
prompt
create table FDC_CNFRM_CONFIRM_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_CNFRM_CONFIRM_KINDPAY
  is '������������� ��������� ������� ������������� �� ��������� ���� ������� ����������� ��';
comment on column FDC_CNFRM_CONFIRM_KINDPAY.id
  is '������������� �������';
alter table FDC_CNFRM_CONFIRM_KINDPAY
  add constraint XPKFDC_CNFRM_CONFIRM_KINDPAY primary key (ID);
alter table FDC_CNFRM_CONFIRM_KINDPAY
  add foreign key (ID)
  references FDC_DOC_CNFRM_BP (ID) on delete cascade;

prompt
prompt Creating table FDC_CNFRM_NOTICE_KINDPAY
prompt =======================================
prompt
create table FDC_CNFRM_NOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_CNFRM_NOTICE_KINDPAY
  is '������������� ��������� ������� ����������� �� ��������� ���� ������� ����������� ��';
comment on column FDC_CNFRM_NOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_CNFRM_NOTICE_KINDPAY
  add constraint XPKFDC_CNFRM_NOTICE_KINDPAY primary key (ID);
alter table FDC_CNFRM_NOTICE_KINDPAY
  add foreign key (ID)
  references FDC_DOC_CNFRM_BP (ID) on delete cascade;

prompt
prompt Creating table FDC_CNFRM_REUSE
prompt ==============================
prompt
create table FDC_CNFRM_REUSE
(
  id NUMBER(15) not null
)
;
comment on table FDC_CNFRM_REUSE
  is '���������-������������� ��������� ������ ����� �� ����������� ��';
comment on column FDC_CNFRM_REUSE.id
  is '������������� �������';
alter table FDC_CNFRM_REUSE
  add constraint FDC#PK#CNFRM#REUSE primary key (ID);
alter table FDC_CNFRM_REUSE
  add foreign key (ID)
  references FDC_DOC_CONFIRM (ID);

prompt
prompt Creating table FDC_CNFRM_SPECIFY_KINDPAY
prompt ========================================
prompt
create table FDC_CNFRM_SPECIFY_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_CNFRM_SPECIFY_KINDPAY
  is '���������-������������� ��������� �����������/������������� �� ��������� ���� ������� ����������� ��';
comment on column FDC_CNFRM_SPECIFY_KINDPAY.id
  is '������������� �������';
alter table FDC_CNFRM_SPECIFY_KINDPAY
  add constraint XPKFDC_CNFRM_SPECIFY_KINDPAY primary key (ID);
alter table FDC_CNFRM_SPECIFY_KINDPAY
  add foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_USER
prompt =======================
prompt
create table FDC_USER
(
  id               NUMBER(15) not null,
  login            VARCHAR2(1500) not null,
  lastname         VARCHAR2(1500) not null,
  firstname        VARCHAR2(1500),
  middlename       VARCHAR2(1500),
  allowgrantoption NUMBER(1) default 0 not null,
  cryptcontainer   VARCHAR2(250),
  cert_subject     VARCHAR2(250),
  custom_id        NUMBER,
  oimid            VARCHAR2(10),
  global_id        VARCHAR2(10),
  must_change_pw   NUMBER(1) default 0,
  email            VARCHAR2(150),
  status           VARCHAR2(16) default 'ENABLED',
  last_modified    DATE,
  exp_date         DATE
)
;
comment on table FDC_USER
  is '������������ ���������� �������';
comment on column FDC_USER.id
  is 'ID';
comment on column FDC_USER.login
  is 'LOGIN';
comment on column FDC_USER.lastname
  is 'LASTNAME';
comment on column FDC_USER.firstname
  is 'FIRSTNAME';
comment on column FDC_USER.middlename
  is 'MIDDLENAME';
comment on column FDC_USER.allowgrantoption
  is 'ALLOWGRANTOPTION';
comment on column FDC_USER.cryptcontainer
  is '�������� ��������� ���������';
comment on column FDC_USER.cert_subject
  is '������� � �����������';
comment on column FDC_USER.custom_id
  is '�� ������������';
comment on column FDC_USER.oimid
  is '���������� ������������ ������������� ������� ������ ������������ �� � �����';
comment on column FDC_USER.global_id
  is '���������� ������������ ������������� ������� ������ ������������ �����';
comment on column FDC_USER.must_change_pw
  is '������� ������ ��� ��������� ����� (��������: 0 - ���������; 1 - ��������)';
comment on column FDC_USER.email
  is '����� ����������� �����';
comment on column FDC_USER.status
  is '������ ������������ (��������: ENABLED � ������������ �������; DISABLED � ������������ �������� ������������; DELETED � ������������ ������)';
comment on column FDC_USER.last_modified
  is '���� ���������� ��������� ������������';
comment on column FDC_USER.exp_date
  is '���� �������� ������';
create index FDC_USER_CUSTOMS_FK1_I on FDC_USER (CUSTOM_ID);
alter table FDC_USER
  add constraint FDC_USER_PK primary key (ID);
alter table FDC_USER
  add constraint FDC_USER_AK1 unique (LOGIN);
alter table FDC_USER
  add constraint FDC_USER_FK1 foreign key (CUSTOM_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_USER
  add constraint USER_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_USER
  add constraint FDC_USER_CK1
  check (status IN ('ENABLED', 'DISABLED', 'DELETED'));
alter table FDC_USER
  add constraint FDC_USER_CK2
  check (must_change_pw IN (0, 1));
alter table FDC_USER
  add constraint YESORNO640
  check (AllowGrantOption IN (0, 1));

prompt
prompt Creating table FDC_COLLECTION
prompt =============================
prompt
create table FDC_COLLECTION
(
  id            NUMBER(15) not null,
  user_id       NUMBER(15) not null,
  coldate       DATE,
  defcollection NUMBER(1) not null
)
;
comment on table FDC_COLLECTION
  is '�������� �������� ��� ���������� �����. �������� ��� ���������� �� ��������.';
comment on column FDC_COLLECTION.id
  is 'ID';
comment on column FDC_COLLECTION.user_id
  is 'USER_ID';
comment on column FDC_COLLECTION.coldate
  is 'COLDATE';
comment on column FDC_COLLECTION.defcollection
  is 'DEFCOLLECTION';
create index FDC_COLLECTION_IF1 on FDC_COLLECTION (USER_ID);
alter table FDC_COLLECTION
  add constraint FDC_COLLECTION_PK primary key (ID);
alter table FDC_COLLECTION
  add constraint COLLECTION_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_COLLECTION
  add constraint COLLECTION_USER_ID foreign key (USER_ID)
  references FDC_USER (ID);
alter table FDC_COLLECTION
  add constraint YESORNO624
  check (DefCollection IN (0, 1));

prompt
prompt Creating table FDC_COLLECTION_OBJECT
prompt ====================================
prompt
create table FDC_COLLECTION_OBJECT
(
  id            NUMBER(15) not null,
  collection_id NUMBER(15) not null,
  object_id     NUMBER(15) not null,
  rolename      VARCHAR2(1500),
  descript      VARCHAR2(1500)
)
;
comment on table FDC_COLLECTION_OBJECT
  is '������, ���������� � ��������.';
comment on column FDC_COLLECTION_OBJECT.id
  is 'ID';
comment on column FDC_COLLECTION_OBJECT.collection_id
  is 'COLLECTION_ID';
comment on column FDC_COLLECTION_OBJECT.object_id
  is 'OBJECT_ID';
comment on column FDC_COLLECTION_OBJECT.rolename
  is 'ROLENAME';
comment on column FDC_COLLECTION_OBJECT.descript
  is 'DESCRIPT';
create index COLLECTION_OBJECT_COLLECTI_FDC on FDC_COLLECTION_OBJECT (COLLECTION_ID);
create index FDC_COLLECTION_OBJECT_IE1 on FDC_COLLECTION_OBJECT (OBJECT_ID);
alter table FDC_COLLECTION_OBJECT
  add constraint FDC_COLLECTION_OBJECT_PK primary key (ID);
alter table FDC_COLLECTION_OBJECT
  add constraint FDC_COLLECTION_OBJECT_AK1 unique (COLLECTION_ID, OBJECT_ID, ROLENAME);
alter table FDC_COLLECTION_OBJECT
  add constraint COLLECTION_OBJECT_COLLECTION_I foreign key (COLLECTION_ID)
  references FDC_COLLECTION (ID);
alter table FDC_COLLECTION_OBJECT
  add constraint COLLECTION_OBJECT_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);

prompt
prompt Creating table FDC_TABLE
prompt ========================
prompt
create table FDC_TABLE
(
  tablename VARCHAR2(1500) not null,
  name      VARCHAR2(1500) not null,
  descript  VARCHAR2(1500),
  local     NUMBER(1) default 1 not null,
  logging   NUMBER(1) default 0 not null
)
;
comment on table FDC_TABLE
  is '�������� ���������� � �������� ����������. ������������ ��� ���������������� ����, ������������� � ����������������.';
comment on column FDC_TABLE.tablename
  is 'TABLENAME';
comment on column FDC_TABLE.name
  is '���������� (����������) ��������';
comment on column FDC_TABLE.descript
  is 'DESCRIPT';
comment on column FDC_TABLE.local
  is '���� ����������� �� ��� ���������� ������ �������:
  0 - �������������
  1 - ��������� (�� �������������)';
comment on column FDC_TABLE.logging
  is '������������ ��� �������� ��������� �������������� ������������� (�� ���������) ������:
  0 - �������� �� ���������
  1 - �������� ���������';
alter table FDC_TABLE
  add constraint FDC_TABLE_PK primary key (TABLENAME);
alter table FDC_TABLE
  add constraint YESORNO636
  check (Local in (0,1));
alter table FDC_TABLE
  add constraint YESORNO637
  check (Logging in (0,1));

prompt
prompt Creating table FDC_COLUMN
prompt =========================
prompt
create table FDC_COLUMN
(
  tablename    VARCHAR2(1500) not null,
  colname      VARCHAR2(1500) not null,
  name         VARCHAR2(1500) not null,
  ispk         NUMBER(1) not null,
  descript     VARCHAR2(1500),
  pktablename  VARCHAR2(1500),
  pkcolname    VARCHAR2(1500),
  fkname       VARCHAR2(1500),
  defaultvalue VARCHAR2(4000),
  local        NUMBER(1) default 1 not null
)
;
comment on table FDC_COLUMN
  is '�������� ���������� � �������� ������ ����������. ������������ ��� ���������������� ����, ������������� � ����������������.';
comment on column FDC_COLUMN.tablename
  is 'TABLENAME';
comment on column FDC_COLUMN.colname
  is 'COLNAME';
comment on column FDC_COLUMN.name
  is '���������� (����������) ��������';
comment on column FDC_COLUMN.ispk
  is 'ISPK';
comment on column FDC_COLUMN.descript
  is 'DESCRIPT';
comment on column FDC_COLUMN.pktablename
  is 'PKTABLENAME';
comment on column FDC_COLUMN.pkcolname
  is 'PKCOLNAME';
comment on column FDC_COLUMN.fkname
  is 'FKNAME';
comment on column FDC_COLUMN.defaultvalue
  is 'DEFAULTVALUE';
comment on column FDC_COLUMN.local
  is '���� ����������� �� ��� ���������� ������ ����:
  0 - �������������
  1 - ��������� (�� �������������)';
create index FDC_COLUMN_IF65 on FDC_COLUMN (TABLENAME);
alter table FDC_COLUMN
  add constraint FDC_COLUMN_PK primary key (TABLENAME, COLNAME);
alter table FDC_COLUMN
  add constraint COLUMN_TABLENAME foreign key (TABLENAME)
  references FDC_TABLE (TABLENAME) on delete cascade;
alter table FDC_COLUMN
  add constraint YESORNO625
  check (IsPK in (0,1));
alter table FDC_COLUMN
  add constraint YESORNO626
  check (Local in (0,1));

prompt
prompt Creating table FDC_CORRECTION_DOC
prompt =================================
prompt
create table FDC_CORRECTION_DOC
(
  id     NUMBER(15) not null,
  doc_id NUMBER(15) not null
)
;
comment on table FDC_CORRECTION_DOC
  is '�������� ���������';
comment on column FDC_CORRECTION_DOC.id
  is '������������� �������';
comment on column FDC_CORRECTION_DOC.doc_id
  is '������������� ��������� ���������';
create index FDC#IDX#CORRECTION_DOC#DOC_ID on FDC_CORRECTION_DOC (DOC_ID, ID);
alter table FDC_CORRECTION_DOC
  add constraint FDC#PK#FDC_CORRECTION_DOC primary key (ID);
alter table FDC_CORRECTION_DOC
  add constraint FDC#FK#CORRECTION_DOC#DOC_ID foreign key (DOC_ID)
  references FDC_DOCUMENT (ID);
alter table FDC_CORRECTION_DOC
  add constraint FDC#FK#CORRECTION_DOC_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_CD
prompt ================================
prompt
create table FDC_CORRECTION_CD
(
  id             NUMBER not null,
  reason_correct VARCHAR2(1500) not null
)
;
comment on table FDC_CORRECTION_CD
  is '������������� ���������� ����������� ����������';
comment on column FDC_CORRECTION_CD.id
  is '�������������';
comment on column FDC_CORRECTION_CD.reason_correct
  is '������� �������������';
alter table FDC_CORRECTION_CD
  add constraint FDC#PK#CORRECTION_CD primary key (ID);
alter table FDC_CORRECTION_CD
  add constraint FDC#FK#CORRECTION_CD#IS_DOC foreign key (ID)
  references FDC_CORRECTION_DOC (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_GTD
prompt =================================
prompt
create table FDC_CORRECTION_GTD
(
  id NUMBER not null
)
;
comment on table FDC_CORRECTION_GTD
  is '������� FDC_CORRECTION_GTD';
comment on column FDC_CORRECTION_GTD.id
  is 'ID';
alter table FDC_CORRECTION_GTD
  add constraint FDC#PK#CORRECTION_GTD primary key (ID);
alter table FDC_CORRECTION_GTD
  add constraint FDC#FK#CORRECTION_GTD#IS_DOC foreign key (ID)
  references FDC_CORRECTION_CD (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_GTD_CCHARGE
prompt =========================================
prompt
create table FDC_CORRECTION_GTD_CCHARGE
(
  id NUMBER not null
)
;
comment on table FDC_CORRECTION_GTD_CCHARGE
  is '������� FDC_CORRECTION_GTD_CCHARGE';
comment on column FDC_CORRECTION_GTD_CCHARGE.id
  is 'ID';
alter table FDC_CORRECTION_GTD_CCHARGE
  add constraint FDC#PK#CORRECTION_GTD_CCHARGE primary key (ID);
alter table FDC_CORRECTION_GTD_CCHARGE
  add constraint FDC#CORRECTION_GTD_CCHARGE#DOC foreign key (ID)
  references FDC_CORRECTION_GTD (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_GTD_KNP
prompt =====================================
prompt
create table FDC_CORRECTION_GTD_KNP
(
  id NUMBER(15) not null,
  constraint FDC#PK#CORRECTION_GTD_KNP primary key (ID)
)
organization index;
comment on table FDC_CORRECTION_GTD_KNP
  is '���������. ������� ��� � ����� ���';
comment on column FDC_CORRECTION_GTD_KNP.id
  is '������������� �������';
alter table FDC_CORRECTION_GTD_KNP
  add constraint FDC#FK#CORRECTION_GTD_IS_CORR foreign key (ID)
  references FDC_CORRECTION_GTD (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_GTD_SUBJECT
prompt =========================================
prompt
create table FDC_CORRECTION_GTD_SUBJECT
(
  id             NUMBER not null,
  subject_id     NUMBER not null,
  old_subject_id NUMBER(15) not null
)
;
comment on table FDC_CORRECTION_GTD_SUBJECT
  is '������� FDC_CORRECTION_GTD_SUBJECT';
comment on column FDC_CORRECTION_GTD_SUBJECT.id
  is '������������� �������';
comment on column FDC_CORRECTION_GTD_SUBJECT.subject_id
  is 'ID ������ ��������';
comment on column FDC_CORRECTION_GTD_SUBJECT.old_subject_id
  is 'ID ����������� ��������';
create index FDC#IDX#CORR_GTD_SUBJ#OSUBJ on FDC_CORRECTION_GTD_SUBJECT (OLD_SUBJECT_ID);
create index FDC#IDX#CORR_GTD_SUBJ#SUBJ on FDC_CORRECTION_GTD_SUBJECT (SUBJECT_ID);
alter table FDC_CORRECTION_GTD_SUBJECT
  add constraint FDC#PK#CORRECTION_GTD_SUBJECT primary key (ID);
alter table FDC_CORRECTION_GTD_SUBJECT
  add constraint FDC#CORRECT_GTD_SUBJECT#IS_DOC foreign key (ID)
  references FDC_CORRECTION_GTD (ID) on delete cascade;
alter table FDC_CORRECTION_GTD_SUBJECT
  add constraint FDC#CORRECT_GTD_SUBJECT#SBJ_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_CORRECTION_GTD_SUBJECT
  add constraint FDC#CORR_GTD_SUBJ#O_SBJ_ID foreign key (OLD_SUBJECT_ID)
  references FDC_SUBJECT (ID);

prompt
prompt Creating table FDC_CORRECTION_PO
prompt ================================
prompt
create table FDC_CORRECTION_PO
(
  id             NUMBER(15) not null,
  reason_correct VARCHAR2(1500) not null
)
;
comment on table FDC_CORRECTION_PO
  is '������� FDC_CORRECTION_PO';
comment on column FDC_CORRECTION_PO.id
  is '������������� �������';
comment on column FDC_CORRECTION_PO.reason_correct
  is 'REASON_CORRECT';
alter table FDC_CORRECTION_PO
  add constraint FDC#PK#FDC_CORRECTION_PO primary key (ID);
alter table FDC_CORRECTION_PO
  add constraint FDC#FK#CORRECTION_PO_IS_DOC foreign key (ID)
  references FDC_CORRECTION_DOC (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_PO_BACK
prompt =====================================
prompt
create table FDC_CORRECTION_PO_BACK
(
  reason_back    VARCHAR2(1500) not null,
  id             NUMBER(15) not null,
  subject_id     NUMBER(15) not null,
  old_subject_id NUMBER(15)
)
;
comment on table FDC_CORRECTION_PO_BACK
  is '������� FDC_CORRECTION_PO_BACK';
comment on column FDC_CORRECTION_PO_BACK.reason_back
  is '������� ��������';
comment on column FDC_CORRECTION_PO_BACK.id
  is '������������� �������';
comment on column FDC_CORRECTION_PO_BACK.subject_id
  is '������������� �������';
comment on column FDC_CORRECTION_PO_BACK.old_subject_id
  is '��� ��������� ��� (�� �������������)';
create index FDC#CORRECT_PO_BACK#OSUBJ_FDC on FDC_CORRECTION_PO_BACK (OLD_SUBJECT_ID);
create index FDC#CORRECT_PO_BACK#SUBJECT_ID on FDC_CORRECTION_PO_BACK (SUBJECT_ID);
alter table FDC_CORRECTION_PO_BACK
  add constraint FDC#PK#FDC_CORRECTION_PO_BACK primary key (ID);
alter table FDC_CORRECTION_PO_BACK
  add constraint FDC#CORRECT_PO_BACK#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete cascade;
alter table FDC_CORRECTION_PO_BACK
  add constraint FDC#CORR_PO_BACK#OLDSUBJECT_ID foreign key (OLD_SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_CORRECTION_PO_BACK
  add constraint FDC#FK#CORRECT_PO_BACK_IS_DOC foreign key (ID)
  references FDC_CORRECTION_PO (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_PO_SUBJECT
prompt ========================================
prompt
create table FDC_CORRECTION_PO_SUBJECT
(
  id             NUMBER(15) not null,
  subject_id     NUMBER(15),
  old_subject_id NUMBER(15)
)
;
comment on table FDC_CORRECTION_PO_SUBJECT
  is '������� FDC_CORRECTION_PO_SUBJECT';
comment on column FDC_CORRECTION_PO_SUBJECT.id
  is '������������� �������';
comment on column FDC_CORRECTION_PO_SUBJECT.subject_id
  is '��� ��������� ���';
comment on column FDC_CORRECTION_PO_SUBJECT.old_subject_id
  is '��� ��������� ��� (�� �������������)';
create index FDC#CORRECT_PO_SUB#OSUBJ_FDC on FDC_CORRECTION_PO_SUBJECT (OLD_SUBJECT_ID);
create index FDC#CORRECT_PO_SUB#SUBJECT_ID on FDC_CORRECTION_PO_SUBJECT (SUBJECT_ID);
alter table FDC_CORRECTION_PO_SUBJECT
  add constraint FDC#PK#FDC_CORR_PO_SUB primary key (ID);
alter table FDC_CORRECTION_PO_SUBJECT
  add constraint FDC#CORRECT_PO_SUB#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_CORRECTION_PO_SUBJECT
  add constraint FDC#CORR_PO_SUB#OLDSUBJECT_ID foreign key (OLD_SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_CORRECTION_PO_SUBJECT
  add constraint FDC#FK#CORR_PO_SUB_IS_PO foreign key (ID)
  references FDC_CORRECTION_PO (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_PO_SUM
prompt ====================================
prompt
create table FDC_CORRECTION_PO_SUM
(
  id        NUMBER not null,
  summa     NUMBER not null,
  old_summa NUMBER(22,2)
)
;
comment on table FDC_CORRECTION_PO_SUM
  is '������������� ���� � ��������� ���������';
comment on column FDC_CORRECTION_PO_SUM.id
  is '�������������';
comment on column FDC_CORRECTION_PO_SUM.summa
  is 'SUMMA';
comment on column FDC_CORRECTION_PO_SUM.old_summa
  is 'OLD_SUMMA';
alter table FDC_CORRECTION_PO_SUM
  add constraint FDC#PK#CORRECTION_PO_SUM primary key (ID);
alter table FDC_CORRECTION_PO_SUM
  add constraint FDC#FK#CORRECTION_PO#IS_DOC foreign key (ID)
  references FDC_CORRECTION_PO (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_TPO
prompt =================================
prompt
create table FDC_CORRECTION_TPO
(
  id NUMBER not null
)
;
comment on table FDC_CORRECTION_TPO
  is '������� FDC_CORRECTION_TPO';
comment on column FDC_CORRECTION_TPO.id
  is 'ID';
alter table FDC_CORRECTION_TPO
  add constraint FDC#PK#CORRECTION_TPO primary key (ID);
alter table FDC_CORRECTION_TPO
  add constraint FDC#FK#CORRECTION_TPO#IS_DOC foreign key (ID)
  references FDC_CORRECTION_CD (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_TPO_CCHARGE
prompt =========================================
prompt
create table FDC_CORRECTION_TPO_CCHARGE
(
  id NUMBER not null
)
;
comment on table FDC_CORRECTION_TPO_CCHARGE
  is '������� FDC_CORRECTION_TPO_CCHARGE';
comment on column FDC_CORRECTION_TPO_CCHARGE.id
  is 'ID';
alter table FDC_CORRECTION_TPO_CCHARGE
  add constraint FDC#PK#CORRECTION_TPO_CCHARGE primary key (ID);
alter table FDC_CORRECTION_TPO_CCHARGE
  add constraint FDC#CORRECTION_TPO_CCHARGE#DOC foreign key (ID)
  references FDC_CORRECTION_TPO (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_TPO_KNP
prompt =====================================
prompt
create table FDC_CORRECTION_TPO_KNP
(
  id NUMBER(15) not null,
  constraint FDC#PK#CORRECTION_TPO_KNP primary key (ID)
)
organization index;
comment on table FDC_CORRECTION_TPO_KNP
  is '���������. ������� ��� � ����� ���';
comment on column FDC_CORRECTION_TPO_KNP.id
  is '������������� �������';
alter table FDC_CORRECTION_TPO_KNP
  add constraint FDC#FK#CORRECTION_TPO_IS_CORR foreign key (ID)
  references FDC_CORRECTION_TPO (ID) on delete cascade;

prompt
prompt Creating table FDC_CORRECTION_TPO_SUBJECT
prompt =========================================
prompt
create table FDC_CORRECTION_TPO_SUBJECT
(
  id             NUMBER not null,
  subject_id     NUMBER not null,
  old_subject_id NUMBER(15) not null
)
;
comment on table FDC_CORRECTION_TPO_SUBJECT
  is '������� FDC_CORRECTION_TPO_SUBJECT';
comment on column FDC_CORRECTION_TPO_SUBJECT.id
  is '������������� �������';
comment on column FDC_CORRECTION_TPO_SUBJECT.subject_id
  is 'ID ������ ��������';
comment on column FDC_CORRECTION_TPO_SUBJECT.old_subject_id
  is 'ID ����������� ��������';
create index FDC#IDX#CORR_TPO_SUBJ#OSUBJ on FDC_CORRECTION_TPO_SUBJECT (OLD_SUBJECT_ID);
create index FDC#IDX#CORR_TPO_SUBJ#SUBJ on FDC_CORRECTION_TPO_SUBJECT (SUBJECT_ID);
alter table FDC_CORRECTION_TPO_SUBJECT
  add constraint FDC#PK#CORRECTION_TPO_SUBJECT primary key (ID);
alter table FDC_CORRECTION_TPO_SUBJECT
  add constraint FDC#CORRECT_TPO_SUBJECT#IS_DOC foreign key (ID)
  references FDC_CORRECTION_TPO (ID) on delete cascade;
alter table FDC_CORRECTION_TPO_SUBJECT
  add constraint FDC#CORRECT_TPO_SUBJECT#SBJ_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_CORRECTION_TPO_SUBJECT
  add constraint FDC#CORR_TPO_SUBJ#O_SBJ_ID foreign key (OLD_SUBJECT_ID)
  references FDC_SUBJECT (ID);

prompt
prompt Creating table FDC_CORRECTPO_CUSTOMCODE
prompt =======================================
prompt
create table FDC_CORRECTPO_CUSTOMCODE
(
  id                NUMBER(15) not null,
  customcode_old_id NUMBER not null,
  customcode_new_id NUMBER not null,
  user_id           NUMBER not null
)
;
comment on table FDC_CORRECTPO_CUSTOMCODE
  is '������� � ��������� ������������� ���������� ���������';
comment on column FDC_CORRECTPO_CUSTOMCODE.id
  is '������������� ������� � ��������� ������������� ���������� ���������';
comment on column FDC_CORRECTPO_CUSTOMCODE.customcode_old_id
  is '������������� ������� ���� �� ���������� ���������� ���������';
comment on column FDC_CORRECTPO_CUSTOMCODE.customcode_new_id
  is '������������� ������ ���� �� ���������� ���������� ���������';
comment on column FDC_CORRECTPO_CUSTOMCODE.user_id
  is '������������� ������������ ���������� ������� � ��������� ������������� ���������� ���������';
create index FDC#IX#CORR_CUSTOMCODE#NCODEID on FDC_CORRECTPO_CUSTOMCODE (CUSTOMCODE_NEW_ID);
create index FDC#IX#CORR_CUSTOMCODE#OCODEID on FDC_CORRECTPO_CUSTOMCODE (CUSTOMCODE_OLD_ID);
create index FDC#IX#CORR_CUSTOMCODE#USERID on FDC_CORRECTPO_CUSTOMCODE (USER_ID);
alter table FDC_CORRECTPO_CUSTOMCODE
  add constraint FDC#PK#CORRECTPO_CUSTOMCODE primary key (ID);
alter table FDC_CORRECTPO_CUSTOMCODE
  add constraint FDC#FK#CORRECTPO_CUSTOMCODE#ID foreign key (ID)
  references FDC_CORRECTION_PO (ID);
alter table FDC_CORRECTPO_CUSTOMCODE
  add constraint FDC#FK#CORR_CUSTOMCODE#NCODEID foreign key (CUSTOMCODE_NEW_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_CORRECTPO_CUSTOMCODE
  add constraint FDC#FK#CORR_CUSTOMCODE#OCODEID foreign key (CUSTOMCODE_OLD_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_CORRECTPO_CUSTOMCODE
  add constraint FDC#FK#CORR_CUSTOMCODE#USER_ID foreign key (USER_ID)
  references FDC_USER (ID);

prompt
prompt Creating table FDC_CORR_DETAIL
prompt ==============================
prompt
create table FDC_CORR_DETAIL
(
  id          NUMBER(15) not null,
  corr_doc_id NUMBER(15) not null
)
;
comment on table FDC_CORR_DETAIL
  is '��������������� �������� ��� ������������ ��������';
comment on column FDC_CORR_DETAIL.id
  is '������������� �������';
comment on column FDC_CORR_DETAIL.corr_doc_id
  is '������������� ��������������� ���������';
create index FDC#FK#CORR_DETAIL#CORR on FDC_CORR_DETAIL (CORR_DOC_ID);
alter table FDC_CORR_DETAIL
  add constraint FDC#PK#CORR_DETAIL primary key (ID);
alter table FDC_CORR_DETAIL
  add constraint FDC#FK#CORR_DETAIL#CORR foreign key (CORR_DOC_ID)
  references FDC_CORRECTION_DOC (ID);
alter table FDC_CORR_DETAIL
  add constraint FDC#FK#CORR_DETAIL_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_CORR_DETAIL_CD
prompt =================================
prompt
create table FDC_CORR_DETAIL_CD
(
  id NUMBER(15) not null
)
;
comment on table FDC_CORR_DETAIL_CD
  is '��������������� �������� ��� ������������ �������� �� ���������� ��������� ���������� ����������� ����������';
comment on column FDC_CORR_DETAIL_CD.id
  is '������������� �������';
alter table FDC_CORR_DETAIL_CD
  add constraint FDC#PK#CORR_DETAIL_CD primary key (ID);
alter table FDC_CORR_DETAIL_CD
  add constraint FDC#FK#COR_DET_CD_IS_COR_DET foreign key (ID)
  references FDC_CORR_DETAIL (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER
prompt ================================
prompt
create table FDC_PAYMENT_ORDER
(
  id                  NUMBER(15) not null,
  exec_date           DATE,
  payer_id            NUMBER(15),
  summa               NUMBER(22,2),
  currency_id         NUMBER(15),
  doc_summa           NUMBER(22,2) not null,
  doc_no2             VARCHAR2(50),
  doc_date2           DATE,
  nref                VARCHAR2(25),
  name_k              VARCHAR2(160),
  inn_k               VARCHAR2(12),
  kpp_k               VARCHAR2(9),
  pay_type_id         NUMBER(15),
  note                VARCHAR2(400),
  income_date         DATE,
  account_k           VARCHAR2(20),
  bic_k               VARCHAR2(9),
  nls                 VARCHAR2(20),
  kbkcode_id          NUMBER(15),
  inn_p               VARCHAR2(12),
  kpp_p               VARCHAR2(9),
  name_p              VARCHAR2(160),
  recipient_id        NUMBER(15),
  bik_p               VARCHAR2(9),
  account_p           VARCHAR2(20),
  val_payment_reason  VARCHAR2(2),
  val_doc_number      VARCHAR2(15),
  val_doc_date        DATE,
  val_payment_type    VARCHAR2(4),
  in_reg              CHAR(1) default 'N' not null,
  destcustomscode     VARCHAR2(10),
  kbk                 VARCHAR2(20),
  is_kbk_correct      VARCHAR2(1) default 'N' not null,
  kbk_old             VARCHAR2(20),
  destcustomscode_old VARCHAR2(10),
  process_id          VARCHAR2(36),
  uin                 VARCHAR2(25)
)
;
comment on table FDC_PAYMENT_ORDER
  is '��������� ���������';
comment on column FDC_PAYMENT_ORDER.id
  is 'ID';
comment on column FDC_PAYMENT_ORDER.exec_date
  is '���� �������� � ����������';
comment on column FDC_PAYMENT_ORDER.payer_id
  is '����������';
comment on column FDC_PAYMENT_ORDER.summa
  is '�����';
comment on column FDC_PAYMENT_ORDER.currency_id
  is '������';
comment on column FDC_PAYMENT_ORDER.doc_summa
  is '����� �� ���������';
comment on column FDC_PAYMENT_ORDER.doc_no2
  is '����� ���������� ��������� �� ����� ';
comment on column FDC_PAYMENT_ORDER.doc_date2
  is '���� ��������� �� ����� ';
comment on column FDC_PAYMENT_ORDER.nref
  is 'NREF';
comment on column FDC_PAYMENT_ORDER.name_k
  is '������������ ����������';
comment on column FDC_PAYMENT_ORDER.inn_k
  is '��� ����������';
comment on column FDC_PAYMENT_ORDER.kpp_k
  is '��� ����������';
comment on column FDC_PAYMENT_ORDER.pay_type_id
  is '��� �������';
comment on column FDC_PAYMENT_ORDER.note
  is 'NOTE';
comment on column FDC_PAYMENT_ORDER.income_date
  is 'INCOME_DATE';
comment on column FDC_PAYMENT_ORDER.account_k
  is '���� ����������';
comment on column FDC_PAYMENT_ORDER.bic_k
  is '��� ����������';
comment on column FDC_PAYMENT_ORDER.nls
  is '���� ���';
comment on column FDC_PAYMENT_ORDER.kbkcode_id
  is '��� ���';
comment on column FDC_PAYMENT_ORDER.inn_p
  is '��� �����������';
comment on column FDC_PAYMENT_ORDER.kpp_p
  is '��� �����������';
comment on column FDC_PAYMENT_ORDER.name_p
  is '������������ �����������';
comment on column FDC_PAYMENT_ORDER.recipient_id
  is '����������';
comment on column FDC_PAYMENT_ORDER.bik_p
  is '��� �����������';
comment on column FDC_PAYMENT_ORDER.account_p
  is '���� �����������';
comment on column FDC_PAYMENT_ORDER.val_payment_reason
  is '���������� ��������� �������';
comment on column FDC_PAYMENT_ORDER.val_doc_number
  is '���������� ������ ���������';
comment on column FDC_PAYMENT_ORDER.val_doc_date
  is '���������� ���� ���������';
comment on column FDC_PAYMENT_ORDER.val_payment_type
  is '���������� ���� �������';
comment on column FDC_PAYMENT_ORDER.in_reg
  is '������� ��������� ��������� � ������ ��������� ����������';
comment on column FDC_PAYMENT_ORDER.destcustomscode
  is '��� ����������� ������-���������� �������';
comment on column FDC_PAYMENT_ORDER.kbk
  is '20-�� ���������� ��� ';
comment on column FDC_PAYMENT_ORDER.is_kbk_correct
  is '������� ��������� ���';
comment on column FDC_PAYMENT_ORDER.kbk_old
  is '������������ ���, ��������� � ��';
comment on column FDC_PAYMENT_ORDER.destcustomscode_old
  is '������������ ���, ��������� � ��';
comment on column FDC_PAYMENT_ORDER.process_id
  is '���������� ������������� ��������� ������������ �������������� (GUID)';
comment on column FDC_PAYMENT_ORDER.uin
  is '���������� ������������� ����������';
create index FDC#FK#PO_KBKCODE on FDC_PAYMENT_ORDER (KBKCODE_ID);
create index FDC#FKIDX#PO#RECIPIENT_ID on FDC_PAYMENT_ORDER (RECIPIENT_ID);
create index FDC#IDX#PO#INCOME_DATE on FDC_PAYMENT_ORDER (INCOME_DATE);
create index FDC_PAYMENT_ORDER_IF1 on FDC_PAYMENT_ORDER (PAYER_ID);
create index FDC_PAYMENT_ORDER_IF2 on FDC_PAYMENT_ORDER (CURRENCY_ID);
create index IDX#PO#DEST on FDC_PAYMENT_ORDER (SUBSTR(DESTCUSTOMSCODE,1,5));
create index IDX#PO#DESTCUSTOMSCODE on FDC_PAYMENT_ORDER (DESTCUSTOMSCODE);
create index IDX#PO#IN_REG on FDC_PAYMENT_ORDER (IN_REG);
create index PAYMENT_ORDER_DOC_NO2 on FDC_PAYMENT_ORDER (DOC_NO2);
create index PAYMENT_ORDER_DOC_SUMMA on FDC_PAYMENT_ORDER (SUMMA);
create index PAYMENT_ORDER_INN_P on FDC_PAYMENT_ORDER (INN_P);
alter table FDC_PAYMENT_ORDER
  add constraint FDC_PAYMENT_ORDER_PK primary key (ID);
alter table FDC_PAYMENT_ORDER
  add constraint PAYMENT_ORDER_UQ unique (NREF);
alter table FDC_PAYMENT_ORDER
  add constraint FDC#FK#PAYMENT_ORDER_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_PAYMENT_ORDER
  add constraint FDC#FK#PO#RECIPIENT foreign key (RECIPIENT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_PAYMENT_ORDER
  add constraint FDC#FK#PO_KBKCODE foreign key (KBKCODE_ID)
  references FDC_DICT (ID);
alter table FDC_PAYMENT_ORDER
  add constraint PAYMENT_ORDER_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_PAYMENT_ORDER
  add constraint PAYMENT_ORDER_PAYER_ID foreign key (PAYER_ID)
  references FDC_SUBJECT (ID);
alter table FDC_PAYMENT_ORDER
  add constraint FDC#CHK#PO#IN_REG
  check (IN_REG IN ('Y', 'N'));
alter table FDC_PAYMENT_ORDER
  add constraint FDC#CHK#PO#IS_KBK_CORR
  check (IS_KBK_CORRECT IN ('Y', 'N'));

prompt
prompt Creating table FDC_CORR_DETAIL_CD_PO
prompt ====================================
prompt
create table FDC_CORR_DETAIL_CD_PO
(
  id         NUMBER(15) not null,
  payment_id NUMBER(15) not null
)
;
comment on table FDC_CORR_DETAIL_CD_PO
  is '��������������� �������� ��� ������������ �������� �� ���������� ��������� ���������� ����������� ����������
����������� �� �������� ����������';
comment on column FDC_CORR_DETAIL_CD_PO.id
  is '������������� �������';
comment on column FDC_CORR_DETAIL_CD_PO.payment_id
  is '������������� ��������� ���������';
create index FDC#FK#COR_DETAIL_PO#PO on FDC_CORR_DETAIL_CD_PO (PAYMENT_ID);
alter table FDC_CORR_DETAIL_CD_PO
  add constraint FDC#PK#CORR_DETAIL_CD_PO primary key (ID);
alter table FDC_CORR_DETAIL_CD_PO
  add constraint FDC#FK#COR_DETAIL_PO#PO foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);
alter table FDC_CORR_DETAIL_CD_PO
  add constraint FDC#FK#COR_DET_PO_IS_COR_DET foreign key (ID)
  references FDC_CORR_DETAIL_CD (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_DEDUCTION
prompt ====================================
prompt
create table FDC_PAYMENT_DEDUCTION
(
  id             NUMBER(15) not null,
  decl_id        NUMBER(15),
  payment_id     NUMBER(15),
  pay_type_id    NUMBER(15),
  summa          NUMBER(24,4) not null,
  payment_date   DATE,
  payment_month  DATE,
  charge_curr_id NUMBER(15),
  charge_summa   NUMBER(24,4),
  charge_id      INTEGER,
  kbkcode_id     INTEGER,
  kbkcode1_id    INTEGER,
  contract_id    NUMBER(15)
)
;
comment on table FDC_PAYMENT_DEDUCTION
  is '������� FDC_PAYMENT_DEDUCTION';
comment on column FDC_PAYMENT_DEDUCTION.id
  is '�������������';
comment on column FDC_PAYMENT_DEDUCTION.decl_id
  is '������������ �������� ';
comment on column FDC_PAYMENT_DEDUCTION.payment_id
  is '��������� ��������';
comment on column FDC_PAYMENT_DEDUCTION.pay_type_id
  is '��� �������';
comment on column FDC_PAYMENT_DEDUCTION.summa
  is '����� ��������';
comment on column FDC_PAYMENT_DEDUCTION.payment_date
  is '���� ��������';
comment on column FDC_PAYMENT_DEDUCTION.payment_month
  is '����� ������';
comment on column FDC_PAYMENT_DEDUCTION.charge_curr_id
  is '����������';
comment on column FDC_PAYMENT_DEDUCTION.charge_summa
  is '����� � ������ ����������';
comment on column FDC_PAYMENT_DEDUCTION.charge_id
  is '������������ ����������';
comment on column FDC_PAYMENT_DEDUCTION.kbkcode_id
  is '��� ������������� ����������';
comment on column FDC_PAYMENT_DEDUCTION.kbkcode1_id
  is '��� ���������� ��������� ';
comment on column FDC_PAYMENT_DEDUCTION.contract_id
  is '������� � ��������';
create index DECL_PAYMENT_KBK1_FDC on FDC_PAYMENT_DEDUCTION (KBKCODE1_ID);
create index DECL_PAYMENT_KBK_FDC on FDC_PAYMENT_DEDUCTION (KBKCODE_ID);
create index FDC#IDX$DEDUCTION#CONTRACT on FDC_PAYMENT_DEDUCTION (CONTRACT_ID);
create index FDC#IDX$DEDUCTION#PAYMENT_DATE on FDC_PAYMENT_DEDUCTION (PAYMENT_DATE);
create index FDC_DECL_PAYMENT_IF1 on FDC_PAYMENT_DEDUCTION (DECL_ID);
create index FDC_DECL_PAYMENT_IF2 on FDC_PAYMENT_DEDUCTION (PAYMENT_ID);
create index FDC_DECL_PAYMENT_IF3 on FDC_PAYMENT_DEDUCTION (PAY_TYPE_ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint FDC_DECL_PAYMENT_PK primary key (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint DECL_PAYMENT_DECL_ID foreign key (DECL_ID)
  references FDC_OBJECT (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint DECL_PAYMENT_KBK foreign key (KBKCODE_ID)
  references FDC_DICT (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint DECL_PAYMENT_KBK1 foreign key (KBKCODE1_ID)
  references FDC_DICT (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint DECL_PAYMENT_PAYMENT_ID foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint DECL_PAYMENT_PAY_TYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);
alter table FDC_PAYMENT_DEDUCTION
  add constraint FDC#FK#DEDUCTION_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_PAYMENT_DEDUCTION
  add constraint FDC#FK$DEDUCTION#BROKER_CNTRCT foreign key (CONTRACT_ID)
  references FDC_BROKER_CONTRACT (ID);

prompt
prompt Creating table FDC_CROSS_PAY
prompt ============================
prompt
create table FDC_CROSS_PAY
(
  id           NUMBER(15) not null,
  deduction_id NUMBER(15) not null
)
;
comment on table FDC_CROSS_PAY
  is '��������������� �������� ������� ��������. �������� ������ �� �������� � ��(�� ��) ��  ��� ��';
comment on column FDC_CROSS_PAY.id
  is '������������� ���������';
comment on column FDC_CROSS_PAY.deduction_id
  is '������������� ��������';
create index FDC#IDX#CROSS_PAY#DEDUCTION_ID on FDC_CROSS_PAY (DEDUCTION_ID);
alter table FDC_CROSS_PAY
  add constraint FDC#PK#CROSS_PAY primary key (ID);
alter table FDC_CROSS_PAY
  add constraint FDC#FK#CROSS_PAY#DEDUCITION foreign key (DEDUCTION_ID)
  references FDC_PAYMENT_DEDUCTION (ID);
alter table FDC_CROSS_PAY
  add constraint FDC#FK#CROSS_PAY#DOCUMENT foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_CURRENCY_USABLE
prompt ==================================
prompt
create table FDC_CURRENCY_USABLE
(
  id NUMBER(15) not null
)
;
comment on table FDC_CURRENCY_USABLE
  is '������ ����������� ����������';
comment on column FDC_CURRENCY_USABLE.id
  is '������������� �������';
alter table FDC_CURRENCY_USABLE
  add constraint FDC#PK#CURRENCY_USABLE primary key (ID);
alter table FDC_CURRENCY_USABLE
  add constraint FDC#FK#CURR_USABLE_IS_CURRENCY foreign key (ID)
  references FDC_NSI_CURRENCY (ID) on delete cascade;

prompt
prompt Creating table FDC_CUSTOM_DECL
prompt ==============================
prompt
create table FDC_CUSTOM_DECL
(
  id                    NUMBER(15) not null,
  g011                  VARCHAR2(2),
  okpo                  VARCHAR2(10),
  inn                   VARCHAR2(12),
  g12                   NUMBER(22,2),
  g444a                 VARCHAR2(80),
  g444b                 DATE,
  g447a                 VARCHAR2(50),
  g447b                 DATE,
  k115                  VARCHAR2(100),
  g40                   VARCHAR2(23),
  g221                  VARCHAR2(3),
  act_no                VARCHAR2(30),
  gd1                   DATE,
  export_date           DATE,
  g0131                 INTEGER,
  decision_qualifier_id NUMBER(15),
  charge_month          DATE,
  load_from_dk          NUMBER(1),
  broker_id             NUMBER,
  decision_date         DATE
)
;
comment on table FDC_CUSTOM_DECL
  is '������� FDC_CUSTOM_DECL';
comment on column FDC_CUSTOM_DECL.id
  is 'ID';
comment on column FDC_CUSTOM_DECL.g011
  is '����������� ����������� ������';
comment on column FDC_CUSTOM_DECL.okpo
  is '��� ����';
comment on column FDC_CUSTOM_DECL.inn
  is '���';
comment on column FDC_CUSTOM_DECL.g12
  is '����� ���������� ���������';
comment on column FDC_CUSTOM_DECL.g444a
  is '����� ��������� �����/������� ����';
comment on column FDC_CUSTOM_DECL.g444b
  is '���� ��������� �����/������� ����';
comment on column FDC_CUSTOM_DECL.g447a
  is '����� ������������ �� ���������� ��������';
comment on column FDC_CUSTOM_DECL.g447b
  is '���� ���� ������������� �� ����������  ��������';
comment on column FDC_CUSTOM_DECL.k115
  is '��� ������������ ���� ���.���.';
comment on column FDC_CUSTOM_DECL.g40
  is '�������������� ��������';
comment on column FDC_CUSTOM_DECL.g221
  is '��� ������ ��������� (�����)';
comment on column FDC_CUSTOM_DECL.act_no
  is '����� ���� � ��������';
comment on column FDC_CUSTOM_DECL.gd1
  is '���� ���������� ����������� ���������� ';
comment on column FDC_CUSTOM_DECL.export_date
  is 'EXPORT_DATE';
comment on column FDC_CUSTOM_DECL.g0131
  is '�������������� ������� ���';
comment on column FDC_CUSTOM_DECL.decision_qualifier_id
  is 'DECISION_QUALIFIER_ID';
comment on column FDC_CUSTOM_DECL.charge_month
  is 'CHARGE_MONTH';
comment on column FDC_CUSTOM_DECL.load_from_dk
  is 'LOAD_FROM_DK';
comment on column FDC_CUSTOM_DECL.broker_id
  is '������������� ����������� ������������� (�������)';
comment on column FDC_CUSTOM_DECL.decision_date
  is '���� �������� �������';
create index FDC_CUSTOM_DECL_BROKER on FDC_CUSTOM_DECL (BROKER_ID);
alter table FDC_CUSTOM_DECL
  add constraint FDC_CUSTOM_DECL_PK primary key (ID);
alter table FDC_CUSTOM_DECL
  add constraint FDC_PROVISION_SUBJECT_FK foreign key (BROKER_ID)
  references FDC_SUBJECT (ID);
alter table FDC_CUSTOM_DECL
  add foreign key (ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;
alter table FDC_CUSTOM_DECL
  add constraint CUST_DECL_DIRECTION12
  check (G011 IN ('��', '��'));

prompt
prompt Creating table FDC_CUSTOM_DECL_ERROR
prompt ====================================
prompt
create table FDC_CUSTOM_DECL_ERROR
(
  id         NUMBER(15) not null,
  no         VARCHAR2(20),
  doc_date   DATE,
  inn        VARCHAR2(20),
  kpp        VARCHAR2(10),
  payer_name VARCHAR2(200),
  summa      NUMBER(22,2),
  cur_code   VARCHAR2(4)
)
;
comment on table FDC_CUSTOM_DECL_ERROR
  is '������� FDC_CUSTOM_DECL_ERROR';
comment on column FDC_CUSTOM_DECL_ERROR.id
  is 'ID';
comment on column FDC_CUSTOM_DECL_ERROR.no
  is 'NO';
comment on column FDC_CUSTOM_DECL_ERROR.doc_date
  is 'DOC_DATE';
comment on column FDC_CUSTOM_DECL_ERROR.inn
  is 'INN';
comment on column FDC_CUSTOM_DECL_ERROR.kpp
  is 'KPP';
comment on column FDC_CUSTOM_DECL_ERROR.payer_name
  is 'PAYER_NAME';
comment on column FDC_CUSTOM_DECL_ERROR.summa
  is 'SUMMA';
comment on column FDC_CUSTOM_DECL_ERROR.cur_code
  is 'CUR_CODE';
alter table FDC_CUSTOM_DECL_ERROR
  add constraint FDC_CUSTOM_DECL_ERROR_PK primary key (ID);
alter table FDC_CUSTOM_DECL_ERROR
  add constraint CUSTOM_DECL_ERROR_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_CUSTOM_DECL_TIME
prompt ===================================
prompt
create table FDC_CUSTOM_DECL_TIME
(
  id NUMBER(15) not null
)
;
comment on table FDC_CUSTOM_DECL_TIME
  is '������� FDC_CUSTOM_DECL_TIME';
comment on column FDC_CUSTOM_DECL_TIME.id
  is 'ID';
alter table FDC_CUSTOM_DECL_TIME
  add constraint FDC#PK#FDC_CUSTOM_DECL_TIME primary key (ID);
alter table FDC_CUSTOM_DECL_TIME
  add foreign key (ID)
  references FDC_CUSTOM_DECL (ID) on delete cascade;

prompt
prompt Creating table FDC_CUSTOM_DECL_FULL
prompt ===================================
prompt
create table FDC_CUSTOM_DECL_FULL
(
  id      NUMBER(15) not null,
  decl_id NUMBER(15)
)
;
comment on table FDC_CUSTOM_DECL_FULL
  is '������� FDC_CUSTOM_DECL_FULL';
comment on column FDC_CUSTOM_DECL_FULL.id
  is 'ID';
comment on column FDC_CUSTOM_DECL_FULL.decl_id
  is 'DECL_ID';
create index XIF2FDC_CUSTOM_DECL_FULL on FDC_CUSTOM_DECL_FULL (DECL_ID);
alter table FDC_CUSTOM_DECL_FULL
  add constraint FDC#PK#FDC_CUSTOM_DECL_FULL primary key (ID);
alter table FDC_CUSTOM_DECL_FULL
  add constraint R_109 foreign key (DECL_ID)
  references FDC_CUSTOM_DECL_TIME (ID) on delete set null;
alter table FDC_CUSTOM_DECL_FULL
  add foreign key (ID)
  references FDC_CUSTOM_DECL (ID) on delete cascade;

prompt
prompt Creating table FDC_CUSTOM_DECL_TEMP
prompt ===================================
prompt
create table FDC_CUSTOM_DECL_TEMP
(
  id             NUMBER(15) not null,
  tax_exemption  NUMBER(1),
  payed_months   NUMBER(2),
  next_pay_month DATE
)
;
comment on table FDC_CUSTOM_DECL_TEMP
  is '������� FDC_CUSTOM_DECL_TEMP';
comment on column FDC_CUSTOM_DECL_TEMP.id
  is 'ID';
comment on column FDC_CUSTOM_DECL_TEMP.tax_exemption
  is 'TAX_EXEMPTION';
comment on column FDC_CUSTOM_DECL_TEMP.payed_months
  is 'PAYED_MONTHS';
comment on column FDC_CUSTOM_DECL_TEMP.next_pay_month
  is 'NEXT_PAY_MONTH';
alter table FDC_CUSTOM_DECL_TEMP
  add constraint FDC#PK#FDC_CUSTOM_DECL_TEMP primary key (ID);
alter table FDC_CUSTOM_DECL_TEMP
  add foreign key (ID)
  references FDC_CUSTOM_DECL (ID) on delete cascade;

prompt
prompt Creating table FDC_DEBTS_MEASURES
prompt =================================
prompt
create table FDC_DEBTS_MEASURES
(
  id               NUMBER(15) not null,
  measures_type    VARCHAR2(3) not null,
  payments_details VARCHAR2(200),
  customsdoc       VARCHAR2(4000),
  chiefcustoms     VARCHAR2(200),
  chiefotp         VARCHAR2(200),
  executor         VARCHAR2(200),
  conclusiondate   DATE,
  ok               NUMBER(1)
)
;
comment on table FDC_DEBTS_MEASURES
  is '�������� ���� �� �������������';
comment on column FDC_DEBTS_MEASURES.id
  is '������������� �������';
comment on column FDC_DEBTS_MEASURES.measures_type
  is '��� ����';
comment on column FDC_DEBTS_MEASURES.payments_details
  is '��������� ��������� ����������';
comment on column FDC_DEBTS_MEASURES.customsdoc
  is '���������� ���������';
comment on column FDC_DEBTS_MEASURES.chiefcustoms
  is '��� ���������� ��';
comment on column FDC_DEBTS_MEASURES.chiefotp
  is '��� ���������� ���';
comment on column FDC_DEBTS_MEASURES.executor
  is '��� �����������';
comment on column FDC_DEBTS_MEASURES.conclusiondate
  is '���� ��������� ���������� ������������ ��';
comment on column FDC_DEBTS_MEASURES.ok
  is '������� ���������� (1 � ��������, 0-���������)';
alter table FDC_DEBTS_MEASURES
  add constraint FDC#PK#DEBTS_MEASURES_ID primary key (ID);
alter table FDC_DEBTS_MEASURES
  add constraint FDC#FK#DEBTS_MEASURES_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_DEBTS_MEASURES
  add constraint FDC#CHK#DEBTS_MEASURES#OK
  check (OK IN (0, 1));

prompt
prompt Creating table FDC_DECISION_DEBTS
prompt =================================
prompt
create table FDC_DECISION_DEBTS
(
  id           NUMBER(15) not null,
  summa        NUMBER(22,2),
  debt_type_id NUMBER(15),
  currency_id  NUMBER(15),
  sum_rub      NUMBER(22,2)
)
;
comment on table FDC_DECISION_DEBTS
  is '������� � ������ � ���� ��������� �������������';
comment on column FDC_DECISION_DEBTS.id
  is '������������� �������';
comment on column FDC_DECISION_DEBTS.summa
  is '����� ������ � ������';
comment on column FDC_DECISION_DEBTS.debt_type_id
  is '������������� �������  ����������� <���� �������������>';
comment on column FDC_DECISION_DEBTS.currency_id
  is '������ ������';
comment on column FDC_DECISION_DEBTS.sum_rub
  is '����� � ������ �� ����� �� ���� �������';
create index FDC#FK#DEC_DEBTS#NSI_CUR on FDC_DECISION_DEBTS (CURRENCY_ID);
create index FDC#FK#DEC_DEBTS#NSI_DIC_FDC on FDC_DECISION_DEBTS (DEBT_TYPE_ID);
alter table FDC_DECISION_DEBTS
  add constraint FDC#PK#DECISION_DEBTS primary key (ID);
alter table FDC_DECISION_DEBTS
  add constraint FDC#FK#DECISION_DEBTS_IS_DEC foreign key (ID)
  references FDC_DECISION (ID) on delete cascade;
alter table FDC_DECISION_DEBTS
  add constraint FDC#FK#DEC_DEBTS#NSI_CUR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DECISION_DEBTS
  add constraint FDC#FK#DEC_DEBTS#NSI_DICT foreign key (DEBT_TYPE_ID)
  references FDC_NSI_DICT (ID);

prompt
prompt Creating table FDC_DECISION_FOR
prompt ===============================
prompt
create table FDC_DECISION_FOR
(
  id          NUMBER(15) not null,
  subject_id  NUMBER(15) not null,
  currency_id NUMBER(15),
  summa       NUMBER(22,2),
  reason      NUMBER(1) default 0
)
;
comment on table FDC_DECISION_FOR
  is '������� FDC_DECISION_FOR';
comment on column FDC_DECISION_FOR.id
  is '������������� �������';
comment on column FDC_DECISION_FOR.subject_id
  is '������������� �������';
comment on column FDC_DECISION_FOR.currency_id
  is 'CURRENCY_ID';
comment on column FDC_DECISION_FOR.summa
  is 'SUMMA';
comment on column FDC_DECISION_FOR.reason
  is 'REASON';
create index FDC#FK#DECISION_FOR#CUR_ID on FDC_DECISION_FOR (CURRENCY_ID);
create index FDC#FK#DECISION_FOR#SUBJECT_ID on FDC_DECISION_FOR (SUBJECT_ID);
alter table FDC_DECISION_FOR
  add constraint FDC#PK#DECISION_FOR#ID primary key (ID);
alter table FDC_DECISION_FOR
  add constraint FDC#FK#DECISION_FOR#CUR_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID) on delete set null;
alter table FDC_DECISION_FOR
  add constraint FDC#FK#DECISION_FOR#SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_DECISION_FOR
  add constraint FDC#FK#DECISION_FOR_IS_DEC foreign key (ID)
  references FDC_DECISION (ID) on delete cascade;
alter table FDC_DECISION_FOR
  add constraint FDC#CHK#REASON
  check (REASON IN (0, 1));

prompt
prompt Creating table FDC_DECISION_PAYMENT
prompt ===================================
prompt
create table FDC_DECISION_PAYMENT
(
  id                NUMBER(15) not null,
  excise_pay        VARCHAR2(1) default 'N' not null,
  decision_court    VARCHAR2(1) default 'N' not null,
  date_court        DATE,
  court_act_attrs   VARCHAR2(50),
  customs_dec_attrs VARCHAR2(50)
)
;
comment on table FDC_DECISION_PAYMENT
  is '������� � ������ � ���� ������� ��������';
comment on column FDC_DECISION_PAYMENT.id
  is '������������� �������';
comment on column FDC_DECISION_PAYMENT.excise_pay
  is '�� ������� �������� �����';
comment on column FDC_DECISION_PAYMENT.decision_court
  is '�� ������� ����';
comment on column FDC_DECISION_PAYMENT.date_court
  is '���� ������� ����';
comment on column FDC_DECISION_PAYMENT.court_act_attrs
  is '��������� ��������� ����';
comment on column FDC_DECISION_PAYMENT.customs_dec_attrs
  is '��������� ������� ��';
alter table FDC_DECISION_PAYMENT
  add constraint FDC#PK#DECISION_PAYMENT primary key (ID);
alter table FDC_DECISION_PAYMENT
  add constraint FDC#FK#DECISION_PAYMENT_IS_DEC foreign key (ID)
  references FDC_DECISION (ID) on delete cascade;

prompt
prompt Creating table FDC_DECISION_TMP_RESERV
prompt ======================================
prompt
create table FDC_DECISION_TMP_RESERV
(
  decision_id    NUMBER(15) not null,
  decl_id        NUMBER(15) not null,
  payment_id     NUMBER(15) not null,
  pay_type_id    NUMBER(15) not null,
  charge_curr_id NUMBER(15) not null,
  charge_summa   NUMBER(24,4),
  charge_id      NUMBER(15),
  kbkcode_id     NUMBER(15) not null,
  kbkcode1_id    NUMBER(15) not null,
  summa          NUMBER(24,4) not null
)
;
comment on table FDC_DECISION_TMP_RESERV
  is '��������������� ������������� �� ����� ������� ����� ���������� �������������';
comment on column FDC_DECISION_TMP_RESERV.decision_id
  is '������� � ������ � ���� ��������� �������������';
comment on column FDC_DECISION_TMP_RESERV.decl_id
  is '�������� ����������';
comment on column FDC_DECISION_TMP_RESERV.payment_id
  is '�������� ��������';
comment on column FDC_DECISION_TMP_RESERV.pay_type_id
  is '��� �������';
comment on column FDC_DECISION_TMP_RESERV.charge_curr_id
  is '������ ����������';
comment on column FDC_DECISION_TMP_RESERV.charge_summa
  is '����� ����������';
comment on column FDC_DECISION_TMP_RESERV.charge_id
  is '������������ ����������';
comment on column FDC_DECISION_TMP_RESERV.kbkcode_id
  is '��� ����������';
comment on column FDC_DECISION_TMP_RESERV.kbkcode1_id
  is '��� ��������� ���������';
comment on column FDC_DECISION_TMP_RESERV.summa
  is '����� ��������';
create index FDC#FK#DEC_TMP_RESERV#DC on FDC_DECISION_TMP_RESERV (DECL_ID);
create index FDC#IDX#DEC_TMP_RESERV#CHARGE on FDC_DECISION_TMP_RESERV (CHARGE_ID);
create index FDC#IDX#DEC_TMP_RESERV#CH_CURR on FDC_DECISION_TMP_RESERV (CHARGE_CURR_ID);
create index FDC#IDX#DEC_TMP_RESERV#DECIS on FDC_DECISION_TMP_RESERV (DECISION_ID);
create index FDC#IDX#DEC_TMP_RESERV#KBK on FDC_DECISION_TMP_RESERV (KBKCODE_ID);
create index FDC#IDX#DEC_TMP_RESERV#KBK1 on FDC_DECISION_TMP_RESERV (KBKCODE1_ID);
create index FDC#IDX#DEC_TMP_RESERV#PAYMENT on FDC_DECISION_TMP_RESERV (PAYMENT_ID);
create index FDC#IDX#DEC_TMP_RESERV#PAYTYPE on FDC_DECISION_TMP_RESERV (PAY_TYPE_ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#UK#DECISION_TMP_RESERV primary key (DECISION_ID, DECL_ID, PAYMENT_ID, PAY_TYPE_ID, KBKCODE_ID, CHARGE_CURR_ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#CH foreign key (CHARGE_ID)
  references FDC_DECL_CHARGE (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#CUR foreign key (CHARGE_CURR_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#DC foreign key (DECL_ID)
  references FDC_DOC_CHARGE (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#DEC foreign key (DECISION_ID)
  references FDC_DECISION (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#KBK foreign key (KBKCODE_ID)
  references FDC_DICT (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#KBK1 foreign key (KBKCODE1_ID)
  references FDC_DICT (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#PAY foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);
alter table FDC_DECISION_TMP_RESERV
  add constraint FDC#FK#DEC_TMP_RESERV#PT foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_DECLARANT
prompt ============================
prompt
create table FDC_DECLARANT
(
  id          NUMBER(15) not null,
  category    VARCHAR2(3),
  custom_code VARCHAR2(10),
  reg_date    DATE,
  post9       VARCHAR2(9),
  alfa2       VARCHAR2(2),
  resident    VARCHAR2(1)
)
;
comment on table FDC_DECLARANT
  is '������� FDC_DECLARANT';
comment on column FDC_DECLARANT.id
  is 'ID';
comment on column FDC_DECLARANT.category
  is 'CATEGORY';
comment on column FDC_DECLARANT.custom_code
  is 'CUSTOM_CODE';
comment on column FDC_DECLARANT.reg_date
  is 'REG_DATE';
comment on column FDC_DECLARANT.post9
  is 'POST9';
comment on column FDC_DECLARANT.alfa2
  is 'ALFA2';
comment on column FDC_DECLARANT.resident
  is 'Y-�������� N - �� ��������';
alter table FDC_DECLARANT
  add constraint FDC_DECLARANT_PK primary key (ID);
alter table FDC_DECLARANT
  add constraint DECLARANT_ID foreign key (ID)
  references FDC_SUBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECLARANT_ACCOUNT
prompt ====================================
prompt
create table FDC_DECLARANT_ACCOUNT
(
  id                NUMBER(15) not null,
  declarant_id      NUMBER(15) not null,
  bank_okpo         VARCHAR2(10),
  account_curr_type NUMBER(1) not null,
  pay_account       VARCHAR2(20),
  corr_account      VARCHAR2(20)
)
;
comment on table FDC_DECLARANT_ACCOUNT
  is '������� FDC_DECLARANT_ACCOUNT';
comment on column FDC_DECLARANT_ACCOUNT.id
  is '������';
comment on column FDC_DECLARANT_ACCOUNT.declarant_id
  is '�������� ���';
comment on column FDC_DECLARANT_ACCOUNT.bank_okpo
  is '���� �����';
comment on column FDC_DECLARANT_ACCOUNT.account_curr_type
  is '��� �����: 1 - ��������, 2 - ��������';
comment on column FDC_DECLARANT_ACCOUNT.pay_account
  is '����� ���������� �����';
comment on column FDC_DECLARANT_ACCOUNT.corr_account
  is '����� ������������������ �����';
create index DECLARANT_ACCOUNT_DECLARAN_FDC on FDC_DECLARANT_ACCOUNT (DECLARANT_ID);
alter table FDC_DECLARANT_ACCOUNT
  add constraint FDC_DECLARANT_ACCOUNT_PK primary key (ID);
alter table FDC_DECLARANT_ACCOUNT
  add constraint FDC_DECL_ACCOUNT_IU unique (DECLARANT_ID, BANK_OKPO, PAY_ACCOUNT, CORR_ACCOUNT);
alter table FDC_DECLARANT_ACCOUNT
  add constraint DECLARANT_ACCOUNT_DECLARANT_ID foreign key (DECLARANT_ID)
  references FDC_DECLARANT (ID) on delete cascade;
alter table FDC_DECLARANT_ACCOUNT
  add constraint DECLARANT_ACCOUNT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_CHANGE
prompt ==============================
prompt
create table FDC_DECL_CHANGE
(
  id        INTEGER not null,
  summa     NUMBER(22,2) not null,
  cause_id  INTEGER,
  charge_id INTEGER not null
)
;
comment on table FDC_DECL_CHANGE
  is '������� FDC_DECL_CHANGE';
comment on column FDC_DECL_CHANGE.id
  is 'ID';
comment on column FDC_DECL_CHANGE.summa
  is 'SUMMA';
comment on column FDC_DECL_CHANGE.cause_id
  is 'CAUSE_ID';
comment on column FDC_DECL_CHANGE.charge_id
  is 'CHARGE_ID';
alter table FDC_DECL_CHANGE
  add constraint FDC_DECL_CHANGE_PK primary key (ID);
alter table FDC_DECL_CHANGE
  add constraint DECL_CHANGE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_CHARGE_CANCEL
prompt =====================================
prompt
create table FDC_DECL_CHARGE_CANCEL
(
  id NUMBER not null
)
;
comment on table FDC_DECL_CHARGE_CANCEL
  is '������ ���������� ���';
comment on column FDC_DECL_CHARGE_CANCEL.id
  is 'ID';
alter table FDC_DECL_CHARGE_CANCEL
  add constraint FDC_DECL_CHARGE_CANCEL_PK primary key (ID);
alter table FDC_DECL_CHARGE_CANCEL
  add constraint FDC_DECL_CHARGE_CANCEL_FK foreign key (ID)
  references FDC_DECL_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_DEBT
prompt ============================
prompt
create table FDC_DECL_DEBT
(
  id          INTEGER not null,
  decl_id     INTEGER not null,
  currency_id INTEGER not null,
  summa       NUMBER(22,2) default 0 not null,
  pay_type_id INTEGER,
  date_from   DATE,
  kbkcode_id  NUMBER(15),
  pay_month   DATE
)
;
comment on table FDC_DECL_DEBT
  is '������� FDC_DECL_DEBT';
comment on column FDC_DECL_DEBT.id
  is 'ID';
comment on column FDC_DECL_DEBT.decl_id
  is 'DECL_ID';
comment on column FDC_DECL_DEBT.currency_id
  is 'CURRENCY_ID';
comment on column FDC_DECL_DEBT.summa
  is 'SUMMA';
comment on column FDC_DECL_DEBT.pay_type_id
  is 'PAY_TYPE_ID';
comment on column FDC_DECL_DEBT.date_from
  is 'DATE_FROM';
comment on column FDC_DECL_DEBT.kbkcode_id
  is '��� ���';
comment on column FDC_DECL_DEBT.pay_month
  is 'PAY_MONTH';
create index FDC_DECL_DEBT_INDX on FDC_DECL_DEBT (DECL_ID);
alter table FDC_DECL_DEBT
  add constraint FDC_DECL_DEBT_PK primary key (ID);
alter table FDC_DECL_DEBT
  add constraint FDC_DECL_DEBT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_GOODS
prompt =============================
prompt
create table FDC_DECL_GOODS
(
  id          NUMBER(15) not null,
  decl_id     NUMBER(15) not null,
  no          NUMBER(4),
  goods_id    NUMBER(15),
  g36         VARCHAR2(7),
  g37         VARCHAR2(7),
  goods_count NUMBER(30,6)
)
;
comment on table FDC_DECL_GOODS
  is '������� FDC_DECL_GOODS';
comment on column FDC_DECL_GOODS.id
  is 'ID';
comment on column FDC_DECL_GOODS.decl_id
  is '���';
comment on column FDC_DECL_GOODS.no
  is '����� ������';
comment on column FDC_DECL_GOODS.goods_id
  is '��� ������';
comment on column FDC_DECL_GOODS.g36
  is '����������� ������ ��������';
comment on column FDC_DECL_GOODS.g37
  is '���������';
comment on column FDC_DECL_GOODS.goods_count
  is '���������� ������ (��� �����)';
create index FDC_DECL_GOODS_IF1 on FDC_DECL_GOODS (DECL_ID);
create index FDC_DECL_GOODS_IF4 on FDC_DECL_GOODS (GOODS_ID);
alter table FDC_DECL_GOODS
  add constraint FDC_DECL_GOODS_PK primary key (ID);
alter table FDC_DECL_GOODS
  add constraint FDC_DECL_GOODS_AK unique (DECL_ID, NO);
alter table FDC_DECL_GOODS
  add constraint DECL_GOODS_DECL_ID foreign key (DECL_ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;
alter table FDC_DECL_GOODS
  add constraint DECL_GOODS_GOODS_ID foreign key (GOODS_ID)
  references FDC_DICT (ID);
alter table FDC_DECL_GOODS
  add constraint DECL_GOODS_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DECL_PERIOD_PROLONG
prompt ======================================
prompt
create table FDC_DECL_PERIOD_PROLONG
(
  decl_id    NUMBER(15),
  date_begin DATE,
  date_end   DATE,
  id         NUMBER(15) not null
)
;
comment on table FDC_DECL_PERIOD_PROLONG
  is '������� FDC_DECL_PERIOD_PROLONG';
comment on column FDC_DECL_PERIOD_PROLONG.decl_id
  is 'Ko� ��';
comment on column FDC_DECL_PERIOD_PROLONG.date_begin
  is '���� ������';
comment on column FDC_DECL_PERIOD_PROLONG.date_end
  is '���� ���������';
comment on column FDC_DECL_PERIOD_PROLONG.id
  is '��� �������';
create index FDC#IDX#PERIOD_PROLONG#DECL_ID on FDC_DECL_PERIOD_PROLONG (DECL_ID);
alter table FDC_DECL_PERIOD_PROLONG
  add constraint PK#FDC_PERIOD_PROLONG#ID primary key (ID);
alter table FDC_DECL_PERIOD_PROLONG
  add constraint FK#FDC_PERIOD_PROLONG#DECL_ID foreign key (DECL_ID)
  references FDC_CUSTOM_DECL (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_DEBTS_DEPOSIT
prompt ====================================
prompt
create table FDC_DEC_DEBTS_DEPOSIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEC_DEBTS_DEPOSIT
  is '�������� ������������� ���';
comment on column FDC_DEC_DEBTS_DEPOSIT.id
  is '������������� �������';
alter table FDC_DEC_DEBTS_DEPOSIT
  add constraint FDC#PK#DEC_DEBTS_DEPOSIT primary key (ID);
alter table FDC_DEC_DEBTS_DEPOSIT
  add constraint FDC#FK#DDD_IS_DEC_DEBTS foreign key (ID)
  references FDC_DECISION_DEBTS (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_DEBTS_DEPOSIT_OFFSET
prompt ===========================================
prompt
create table FDC_DEC_DEBTS_DEPOSIT_OFFSET
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_DEBTS_DEP_OFFSET primary key (ID)
)
organization index;
comment on table FDC_DEC_DEBTS_DEPOSIT_OFFSET
  is '������� � ������ ��������� ������ � ���� ���������� ����������� �� ������ ���������� ������, �������';
comment on column FDC_DEC_DEBTS_DEPOSIT_OFFSET.id
  is '������������� �������';
alter table FDC_DEC_DEBTS_DEPOSIT_OFFSET
  add constraint FDC#FK#DEC_IS_DEBTS_DEPOSIT foreign key (ID)
  references FDC_DEC_DEBTS_DEPOSIT (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_DEBTS_OVERPAY
prompt ====================================
prompt
create table FDC_DEC_DEBTS_OVERPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEC_DEBTS_OVERPAY
  is '������� � ������ �������� ������ � ���� ��������� �������������';
comment on column FDC_DEC_DEBTS_OVERPAY.id
  is '������������� �������';
alter table FDC_DEC_DEBTS_OVERPAY
  add constraint FDC#PK#DEC_DEBTS_OVERPAY primary key (ID);
alter table FDC_DEC_DEBTS_OVERPAY
  add constraint FDC#FK#DDO_IS_DEC_DEBTS foreign key (ID)
  references FDC_DECISION_DEBTS (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_DEBTS_PAYS
prompt =================================
prompt
create table FDC_DEC_DEBTS_PAYS
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEC_DEBTS_PAYS
  is '������� � ������ ��������� �������� � ���� ��������� �������������';
comment on column FDC_DEC_DEBTS_PAYS.id
  is '������������� �������';
alter table FDC_DEC_DEBTS_PAYS
  add constraint FDC#PK#DEC_DEBTS_PAYS primary key (ID);
alter table FDC_DEC_DEBTS_PAYS
  add constraint FDC#FK#DDP_IS_DEC_DEBTS foreign key (ID)
  references FDC_DECISION_DEBTS (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_OFFSET_OBLIGATION
prompt ========================================
prompt
create table FDC_DEC_OFFSET_OBLIGATION
(
  id          NUMBER(15) not null,
  summa       NUMBER(24,2),
  currency_id NUMBER
)
;
comment on table FDC_DEC_OFFSET_OBLIGATION
  is '������� � ������ ��������� ������ � ���� ���������� ����������� �� ������ ���������� ������, �������';
comment on column FDC_DEC_OFFSET_OBLIGATION.id
  is '������������� ������� � ������ ��������� ������ � ���� ���������� ����������� �� ������ ���������� ������, �������';
comment on column FDC_DEC_OFFSET_OBLIGATION.summa
  is '�����';
comment on column FDC_DEC_OFFSET_OBLIGATION.currency_id
  is '������������� ������';
create index FDC#IX#DEC_OFFSET_OBLIGAT#CURR on FDC_DEC_OFFSET_OBLIGATION (CURRENCY_ID);
alter table FDC_DEC_OFFSET_OBLIGATION
  add constraint FDC#PK#DEC_OFFSET_OBLIGATION primary key (ID);
alter table FDC_DEC_OFFSET_OBLIGATION
  add constraint FDC#FK#DEC_OFFSET_OBLIGAT#CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DEC_OFFSET_OBLIGATION
  add constraint FDC#FK#DEC_OFFSET_OBLIGAT#ID foreign key (ID)
  references FDC_DECISION (ID);

prompt
prompt Creating table FDC_DEC_PAYBACK_356
prompt ==================================
prompt
create table FDC_DEC_PAYBACK_356
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_356 primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_356
  is '������� � �������� ���������� ������, �������, ���������� �������� � �������, ������������� ��. 356 �� ��';
comment on column FDC_DEC_PAYBACK_356.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_356
  add constraint FDC#FK#356_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_ADVANCE
prompt ======================================
prompt
create table FDC_DEC_PAYBACK_ADVANCE
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_ADVANCE primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_ADVANCE
  is '������� � ��������. ��������� �������';
comment on column FDC_DEC_PAYBACK_ADVANCE.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_ADVANCE
  add constraint FDC#FK#ADVANCE_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_DEPOSIT
prompt ======================================
prompt
create table FDC_DEC_PAYBACK_DEPOSIT
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_DEPOSIT primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_DEPOSIT
  is '������� � ��������. �������� �����';
comment on column FDC_DEC_PAYBACK_DEPOSIT.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_DEPOSIT
  add constraint FDC#FK#DEPOSIT_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_LEVY
prompt ===================================
prompt
create table FDC_DEC_PAYBACK_LEVY
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_LEVY primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_LEVY
  is '������� � ��������. ������� ���������� �������';
comment on column FDC_DEC_PAYBACK_LEVY.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_LEVY
  add constraint FDC#FK#LEVY_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_OUTBACK
prompt ======================================
prompt
create table FDC_DEC_PAYBACK_OUTBACK
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_OUTBACK primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_OUTBACK
  is '������� � �������� ��������� �� ��������� ������ ��������';
comment on column FDC_DEC_PAYBACK_OUTBACK.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_OUTBACK
  add constraint FDC#FK#OUTBACK_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_PAY
prompt ==================================
prompt
create table FDC_DEC_PAYBACK_PAY
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_PAY primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_PAY
  is '������� � ��������. ������� ���������� �������';
comment on column FDC_DEC_PAYBACK_PAY.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_PAY
  add constraint FDC#FK#PAY_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_PERIODIC
prompt =======================================
prompt
create table FDC_DEC_PAYBACK_PERIODIC
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_PERIODIC primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_PERIODIC
  is '������� � ��������. �������� ������ ��� ������������� ��������� ��������������.';
comment on column FDC_DEC_PAYBACK_PERIODIC.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_PERIODIC
  add constraint FDC#FK#PERIODIC_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYBACK_TIMEOUT
prompt ======================================
prompt
create table FDC_DEC_PAYBACK_TIMEOUT
(
  id NUMBER(15) not null,
  constraint FDC#PK#DEC_PAYBACK_TIMEOUT primary key (ID)
)
organization index;
comment on table FDC_DEC_PAYBACK_TIMEOUT
  is '������� � �������� ��������� �� ��������� ������ ��������';
comment on column FDC_DEC_PAYBACK_TIMEOUT.id
  is '������������� �������';
alter table FDC_DEC_PAYBACK_TIMEOUT
  add constraint FDC#FK#TIMEOUT_IS_DEC_PAYBACK foreign key (ID)
  references FDC_DECISION_PAYBACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYMENT_DEPOSIT
prompt ======================================
prompt
create table FDC_DEC_PAYMENT_DEPOSIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEC_PAYMENT_DEPOSIT
  is '������� � ������ ������';
comment on column FDC_DEC_PAYMENT_DEPOSIT.id
  is '������������� �������';
alter table FDC_DEC_PAYMENT_DEPOSIT
  add constraint FDC#PK#DEC_PAYMENT_DEPOSIT primary key (ID);
alter table FDC_DEC_PAYMENT_DEPOSIT
  add constraint FDC#FK#DPD_IS_DEC_PAYMENT foreign key (ID)
  references FDC_DECISION_PAYMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DEC_PAYMENT_PERIODIC
prompt =======================================
prompt
create table FDC_DEC_PAYMENT_PERIODIC
(
  id        NUMBER(15) not null,
  advice_id NUMBER(15)
)
;
comment on table FDC_DEC_PAYMENT_PERIODIC
  is '������� � ������ �������� ������ ��� ������������� ��������� ��������������';
comment on column FDC_DEC_PAYMENT_PERIODIC.id
  is '������������� �������';
comment on column FDC_DEC_PAYMENT_PERIODIC.advice_id
  is '������������� �����������';
create index FDC#IDX#DPP#ADVICE_ID on FDC_DEC_PAYMENT_PERIODIC (ADVICE_ID);
alter table FDC_DEC_PAYMENT_PERIODIC
  add constraint FDC#PK#DEC_PAYMENT_PERIODIC primary key (ID);
alter table FDC_DEC_PAYMENT_PERIODIC
  add constraint FDC#FK#DPP#ADVICE foreign key (ADVICE_ID)
  references FDC_ADVICE_PAY_PERIODIC (ID);
alter table FDC_DEC_PAYMENT_PERIODIC
  add constraint FDC#FK#DPP_IS_DEC_PAYMENT foreign key (ID)
  references FDC_DECISION_PAYMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DEDUCTION_BUDGET
prompt ===================================
prompt
create table FDC_DEDUCTION_BUDGET
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEDUCTION_BUDGET
  is '������� FDC_DEDUCTION_BUDGET';
comment on column FDC_DEDUCTION_BUDGET.id
  is '������������� �������';
alter table FDC_DEDUCTION_BUDGET
  add constraint FDC#PK#FDC_DEDUCTION_BUDGET primary key (ID);
alter table FDC_DEDUCTION_BUDGET
  add constraint FDC#PK#DED_BUDGET_IS_PAY_DED foreign key (ID)
  references FDC_PAYMENT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_DEDUCTION_FOR_BUDGET
prompt =======================================
prompt
create table FDC_DEDUCTION_FOR_BUDGET
(
  id NUMBER not null
)
;
comment on table FDC_DEDUCTION_FOR_BUDGET
  is '�������� ��� �������� � ������';
comment on column FDC_DEDUCTION_FOR_BUDGET.id
  is '������������� ��������, ������� ���������� ��������� � ������';
alter table FDC_DEDUCTION_FOR_BUDGET
  add constraint FDC_DEDUCTION_FOR_BUDGET_PK primary key (ID);
alter table FDC_DEDUCTION_FOR_BUDGET
  add constraint FDC_DEDUCTION_FOR_BUDGET_FK foreign key (ID)
  references FDC_PAYMENT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_DEDUCTION_FOR_REUSE
prompt ======================================
prompt
create table FDC_DEDUCTION_FOR_REUSE
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEDUCTION_FOR_REUSE
  is '�������� �� ������� � ������';
comment on column FDC_DEDUCTION_FOR_REUSE.id
  is '������������� �������';
alter table FDC_DEDUCTION_FOR_REUSE
  add constraint FDC#PK#DEDUCTION_FOR_REUSE primary key (ID);
alter table FDC_DEDUCTION_FOR_REUSE
  add constraint FDC#FK#DED_REUSE_IS_DEDUCTION foreign key (ID)
  references FDC_PAYMENT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_DEDUCTION_OTHERS
prompt ===================================
prompt
create table FDC_DEDUCTION_OTHERS
(
  id NUMBER(15) not null
)
;
comment on table FDC_DEDUCTION_OTHERS
  is '������� FDC_DEDUCTION_OTHERS';
comment on column FDC_DEDUCTION_OTHERS.id
  is '������������� �������';
alter table FDC_DEDUCTION_OTHERS
  add constraint FDC#PK#FDC_DEDUCTION_OTHERS primary key (ID);
alter table FDC_DEDUCTION_OTHERS
  add constraint FDC#PK#DED_OTHERS_IS_PAY_DED foreign key (ID)
  references FDC_PAYMENT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_ACT
prompt ==========================
prompt
create table FDC_DED_ACT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_ACT
  is '�������� ���������������� �������� ������� �� ����';
comment on column FDC_DED_ACT.id
  is '������������� �������';
alter table FDC_DED_ACT
  add constraint FDC#PK#DED_ACT primary key (ID);
alter table FDC_DED_ACT
  add constraint FDC#FK#DEDACT_IS_DED_BUDGET foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_ACT_CHANGE_KBK
prompt =====================================
prompt
create table FDC_DED_ACT_CHANGE_KBK
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_ACT_CHANGE_KBK
  is '������� FDC_DED_ACT_CHANGE_KBK';
comment on column FDC_DED_ACT_CHANGE_KBK.id
  is '������������� �������';
alter table FDC_DED_ACT_CHANGE_KBK
  add constraint FDC#PK#FDC_DED_A_CH_KBK primary key (ID);
alter table FDC_DED_ACT_CHANGE_KBK
  add constraint FDC#FK#DED_A_CH_KBK_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_AGREEMENTPAYMENT
prompt =======================================
prompt
create table FDC_DED_AGREEMENTPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_AGREEMENTPAYMENT
  is '������� FDC_DED_AGREEMENTPAYMENT';
comment on column FDC_DED_AGREEMENTPAYMENT.id
  is '������������� �������';
alter table FDC_DED_AGREEMENTPAYMENT
  add constraint FDC#PK#FDC_DED_AGR_PAYMENT primary key (ID);
alter table FDC_DED_AGREEMENTPAYMENT
  add constraint FDC#PK#DED_AGRMEN_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_BACKPAYMENT
prompt ==================================
prompt
create table FDC_DED_BACKPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_BACKPAYMENT
  is '������� FDC_DED_BACKPAYMENT';
comment on column FDC_DED_BACKPAYMENT.id
  is '������������� �������';
alter table FDC_DED_BACKPAYMENT
  add constraint FDC#PK#FDC_DED_BACKPAYMENT primary key (ID);
alter table FDC_DED_BACKPAYMENT
  add constraint FDC#PK#DED_BACK_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_CORRECT
prompt ==============================
prompt
create table FDC_DED_CORRECT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_CORRECT
  is '������� FDC_DED_CORRECT';
comment on column FDC_DED_CORRECT.id
  is '������������� �������';
alter table FDC_DED_CORRECT
  add constraint FDC#PK#FDC_DED_CORRECT primary key (ID);
alter table FDC_DED_CORRECT
  add constraint FDC#PK#DED_DEDCOR_IS_DED_BDG foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_CORRECTACTIVEDOC
prompt =======================================
prompt
create table FDC_DED_CORRECTACTIVEDOC
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_CORRECTACTIVEDOC
  is '������� FDC_DED_CORRECTACTIVEDOC';
comment on column FDC_DED_CORRECTACTIVEDOC.id
  is '������������� �������';
alter table FDC_DED_CORRECTACTIVEDOC
  add constraint FDC#PK#FDC_DED_CORRECTACTDOC primary key (ID);
alter table FDC_DED_CORRECTACTIVEDOC
  add constraint FDC#PK#DED_COR_ACT_IS_DED_COR foreign key (ID)
  references FDC_DED_CORRECT (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DECLPAYMENT
prompt ==================================
prompt
create table FDC_DED_DECLPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DECLPAYMENT
  is '������� FDC_DED_DECLPAYMENT';
comment on column FDC_DED_DECLPAYMENT.id
  is '������������� �������';
alter table FDC_DED_DECLPAYMENT
  add constraint FDC#PK#FDC_DED_DECLPAYMENT primary key (ID);
alter table FDC_DED_DECLPAYMENT
  add constraint FDC#PK#DED_DECPAY_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DECLPAYMENTBACK
prompt ======================================
prompt
create table FDC_DED_DECLPAYMENTBACK
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DECLPAYMENTBACK
  is '������� FDC_DED_DECLPAYMENTBACK';
comment on column FDC_DED_DECLPAYMENTBACK.id
  is '������������� �������';
alter table FDC_DED_DECLPAYMENTBACK
  add constraint FDC#PK#FDC_DED_DECLPAYMENTBACK primary key (ID);
alter table FDC_DED_DECLPAYMENTBACK
  add constraint FDC#PK#DED_PAYMEN_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DECLREPAYMENT
prompt ====================================
prompt
create table FDC_DED_DECLREPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DECLREPAYMENT
  is '������� FDC_DED_DECLREPAYMENT';
comment on column FDC_DED_DECLREPAYMENT.id
  is '������������� �������';
alter table FDC_DED_DECLREPAYMENT
  add constraint FDC#PK#FDC_DED_DECLREPAYMENT primary key (ID);
alter table FDC_DED_DECLREPAYMENT
  add constraint FDC#FK#DED_DECLREP_IS_OTHERS foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DECPAYBACKPAYMENT
prompt ========================================
prompt
create table FDC_DED_DECPAYBACKPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DECPAYBACKPAYMENT
  is '������� FDC_DED_DECPAYBACKPAYMENT';
comment on column FDC_DED_DECPAYBACKPAYMENT.id
  is '������������� �������';
alter table FDC_DED_DECPAYBACKPAYMENT
  add constraint FDC#PK#FDC_DED_DECPAYBACKPAY primary key (ID);
alter table FDC_DED_DECPAYBACKPAYMENT
  add constraint FDC#FK#DEC_BACK_IS_DED_OTHERS foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DEDPAYBACKDEPOSIT
prompt ========================================
prompt
create table FDC_DED_DEDPAYBACKDEPOSIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DEDPAYBACKDEPOSIT
  is '������� FDC_DED_DEDPAYBACKDEPOSIT';
comment on column FDC_DED_DEDPAYBACKDEPOSIT.id
  is '������������� �������';
alter table FDC_DED_DEDPAYBACKDEPOSIT
  add constraint FDC#PK#FDC_DED_PAYBACKDEPOSIT primary key (ID);
alter table FDC_DED_DEDPAYBACKDEPOSIT
  add constraint FDC#PK#DED_PAYDEP_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_DOCDEDUCTIONREUSE
prompt ========================================
prompt
create table FDC_DED_DOCDEDUCTIONREUSE
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_DOCDEDUCTIONREUSE
  is '������� FDC_DED_DOCDEDUCTIONREUSE';
comment on column FDC_DED_DOCDEDUCTIONREUSE.id
  is '������������� �������';
alter table FDC_DED_DOCDEDUCTIONREUSE
  add constraint FDC#PK#FDC_DED_DOCDEDREUSE primary key (ID);
alter table FDC_DED_DOCDEDUCTIONREUSE
  add constraint FDC#PK#DED_DOCREU_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_FINEDEDUCTION
prompt ====================================
prompt
create table FDC_DED_FINEDEDUCTION
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_FINEDEDUCTION
  is '������� FDC_DED_FINEDEDUCTION';
comment on column FDC_DED_FINEDEDUCTION.id
  is '������������� �������';
alter table FDC_DED_FINEDEDUCTION
  add constraint FDC#PK#FDC_DED_FINEDEDUCTION primary key (ID);
alter table FDC_DED_FINEDEDUCTION
  add constraint FDC#PK#DED_FINDED_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_KNP
prompt ==========================
prompt
create table FDC_DED_KNP
(
  id            NUMBER(15) not null,
  bp_license_id NUMBER(15) not null
)
;
comment on table FDC_DED_KNP
  is '������� FDC_DED_KNP';
comment on column FDC_DED_KNP.id
  is '������������� �������';
comment on column FDC_DED_KNP.bp_license_id
  is '������������� ������������ ���';
create index FDC#INDX#DED_KNP#BPLIC on FDC_DED_KNP (BP_LICENSE_ID);
alter table FDC_DED_KNP
  add constraint FDC#PK#FDC_DED_KNP primary key (ID);
alter table FDC_DED_KNP
  add constraint FDC#FK#DED_KNP#BPLIC foreign key (BP_LICENSE_ID)
  references FDC_BP_LICENCE (ID) on delete set null;
alter table FDC_DED_KNP
  add constraint FDC#PK#DED_KNP_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_KNP_CORRECT
prompt ==================================
prompt
create table FDC_DED_KNP_CORRECT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_KNP_CORRECT
  is '�������������� �������� ���';
comment on column FDC_DED_KNP_CORRECT.id
  is '������������� �������';
alter table FDC_DED_KNP_CORRECT
  add constraint FDC#PK#DED_KNP_CORR primary key (ID);
alter table FDC_DED_KNP_CORRECT
  add constraint FDC#PK#KNPCORR_IS_DED_KNP foreign key (ID)
  references FDC_DED_KNP (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_KNP_REPAYMENT
prompt ====================================
prompt
create table FDC_DED_KNP_REPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_KNP_REPAYMENT
  is '������������ �������� ���';
comment on column FDC_DED_KNP_REPAYMENT.id
  is '������������� �������';
alter table FDC_DED_KNP_REPAYMENT
  add constraint FDC#PK#DED_KNP_REPAY primary key (ID);
alter table FDC_DED_KNP_REPAYMENT
  add constraint FDC#PK#REPAYKNP_IS_DED_KNP foreign key (ID)
  references FDC_DED_KNP (ID) on delete cascade;

prompt
prompt Creating table FDC_NOTICEPAY
prompt ============================
prompt
create table FDC_NOTICEPAY
(
  id              NUMBER(15) not null,
  customs_id      NUMBER(15),
  subject_id      NUMBER(15),
  debts_reason_id NUMBER(15),
  payment_date    DATE,
  penalty_sdate   DATE,
  penalty_edate   DATE,
  penalty_summa   NUMBER(22,2),
  execution_date  DATE,
  asd_doc_number  VARCHAR2(100),
  asd_id          NUMBER(15),
  asd_passport_id NUMBER(15)
)
;
comment on table FDC_NOTICEPAY
  is '������� FDC_NOTICEPAY';
comment on column FDC_NOTICEPAY.id
  is 'ID';
comment on column FDC_NOTICEPAY.customs_id
  is 'CUSTOMS_ID';
comment on column FDC_NOTICEPAY.subject_id
  is 'SUBJECT_ID';
comment on column FDC_NOTICEPAY.debts_reason_id
  is 'DEBTS_REASON_ID';
comment on column FDC_NOTICEPAY.payment_date
  is 'PAYMENT_DATE';
comment on column FDC_NOTICEPAY.penalty_sdate
  is 'PENALTY_SDATE';
comment on column FDC_NOTICEPAY.penalty_edate
  is 'PENALTY_EDATE';
comment on column FDC_NOTICEPAY.penalty_summa
  is 'PENALTY_SUMMA';
comment on column FDC_NOTICEPAY.execution_date
  is 'EXECUTION_DATE';
comment on column FDC_NOTICEPAY.asd_doc_number
  is '��������������� ����� ���������� � ��� ���������������';
comment on column FDC_NOTICEPAY.asd_id
  is '������������� ���������� � ��� ���������������';
comment on column FDC_NOTICEPAY.asd_passport_id
  is '������������� �������� ������������� � ��� ���������������';
create index NOTICEPAY_CUSTOMS_ID_FDC on FDC_NOTICEPAY (CUSTOMS_ID);
create index NOTICEPAY_DEBTS_REASON_ID_FDC on FDC_NOTICEPAY (DEBTS_REASON_ID);
create index NOTICEPAY_SUBJECT_ID_FDC on FDC_NOTICEPAY (SUBJECT_ID);
alter table FDC_NOTICEPAY
  add constraint FDC_NOTICEPAY_PK primary key (ID);
alter table FDC_NOTICEPAY
  add constraint FDC#FK#NOTICEPAY_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_NOTICEPAY
  add constraint NOTICEPAY_CUSTOMS_ID foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_NOTICEPAY
  add constraint NOTICEPAY_DEBTS_REASON_ID foreign key (DEBTS_REASON_ID)
  references FDC_DICT (ID);
alter table FDC_NOTICEPAY
  add constraint NOTICEPAY_SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);

prompt
prompt Creating table FDC_DED_PAYDEPT
prompt ==============================
prompt
create table FDC_DED_PAYDEPT
(
  id          NUMBER(15) not null,
  notice_id   NUMBER(15),
  decision_id NUMBER(15)
)
;
comment on table FDC_DED_PAYDEPT
  is '�������� �� ��������� �������������';
comment on column FDC_DED_PAYDEPT.id
  is '������������� �������';
comment on column FDC_DED_PAYDEPT.notice_id
  is '���������� �� ������, �� �������� ��������� ��������� �������������';
comment on column FDC_DED_PAYDEPT.decision_id
  is '������� � ������ � ���� ��������� �������������';
create index FDC#IDX#DED_PAYDEPT#DEC_ID on FDC_DED_PAYDEPT (DECISION_ID);
create index FDC#IDX#DED_PAYDEPT#NOTICE_ID on FDC_DED_PAYDEPT (NOTICE_ID);
alter table FDC_DED_PAYDEPT
  add constraint FDC#PK#FDC_DED_PAYDEPT primary key (ID);
alter table FDC_DED_PAYDEPT
  add constraint FDC#PK#DED_PAYDEP#DECISION foreign key (DECISION_ID)
  references FDC_DECISION_DEBTS (ID);
alter table FDC_DED_PAYDEPT
  add constraint FDC#PK#DED_PAYDEP#NOTICE foreign key (NOTICE_ID)
  references FDC_NOTICEPAY (ID);
alter table FDC_DED_PAYDEPT
  add constraint FDC#PK#DED_PAYDEP_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_PAYINTEREST
prompt ==================================
prompt
create table FDC_DED_PAYINTEREST
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_PAYINTEREST
  is '������� FDC_DED_PAYINTEREST';
comment on column FDC_DED_PAYINTEREST.id
  is '������������� �������';
alter table FDC_DED_PAYINTEREST
  add constraint FDC#PK#FDC_DED_PAYINTEREST primary key (ID);
alter table FDC_DED_PAYINTEREST
  add constraint FDC#PK#DED_PAYINT_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_PAYOFFDEDUCTION
prompt ======================================
prompt
create table FDC_DED_PAYOFFDEDUCTION
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_PAYOFFDEDUCTION
  is '������� FDC_DED_PAYOFFDEDUCTION';
comment on column FDC_DED_PAYOFFDEDUCTION.id
  is '������������� �������';
alter table FDC_DED_PAYOFFDEDUCTION
  add constraint FDC#PK#FDC_DED_PAYOFFDEDUCTION primary key (ID);
alter table FDC_DED_PAYOFFDEDUCTION
  add constraint FDC#PK#DED_PAYOFF_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_PAYPERIODIC
prompt ==================================
prompt
create table FDC_DED_PAYPERIODIC
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_PAYPERIODIC
  is '������� FDC_DED_PAYPERIODIC';
comment on column FDC_DED_PAYPERIODIC.id
  is '������������� �������';
alter table FDC_DED_PAYPERIODIC
  add constraint FDC#PK#FDC_DED_PAYPERIODIC primary key (ID);
alter table FDC_DED_PAYPERIODIC
  add constraint FDC#PK#DED_PAYPER_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_PAYREPAYMENT
prompt ===================================
prompt
create table FDC_DED_PAYREPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_PAYREPAYMENT
  is '������� FDC_DED_PAYREPAYMENT';
comment on column FDC_DED_PAYREPAYMENT.id
  is '������������� �������';
alter table FDC_DED_PAYREPAYMENT
  add constraint FDC#PK#FDC_DED_PAYREPAYMENT primary key (ID);
alter table FDC_DED_PAYREPAYMENT
  add constraint FDC#PK#DED_PAYREP_IS_DED_BUD foreign key (ID)
  references FDC_DEDUCTION_BUDGET (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_REUSECANCEL
prompt ==================================
prompt
create table FDC_DED_REUSECANCEL
(
  id NUMBER not null
)
;
comment on table FDC_DED_REUSECANCEL
  is '�������� �� ������ ����������';
comment on column FDC_DED_REUSECANCEL.id
  is '������������� �������';
alter table FDC_DED_REUSECANCEL
  add constraint FDC#PK#FDC_DED_REUSECANCEL primary key (ID);
alter table FDC_DED_REUSECANCEL
  add constraint FDC#FK#DED_REUCNCL_IS_DED_OTHR foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_REUSEPAYMENT
prompt ===================================
prompt
create table FDC_DED_REUSEPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DED_REUSEPAYMENT
  is '������� FDC_DED_REUSEPAYMENT';
comment on column FDC_DED_REUSEPAYMENT.id
  is '������������� �������';
alter table FDC_DED_REUSEPAYMENT
  add constraint FDC#PK#FDC_DED_REUSEPAYMENT primary key (ID);
alter table FDC_DED_REUSEPAYMENT
  add constraint FDC#PK#DED_REUPAY_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DED_TR
prompt =========================
prompt
create table FDC_DED_TR
(
  id          NUMBER(15) not null,
  pay_type_id NUMBER(15),
  kbkcode_id  NUMBER(15)
)
;
comment on table FDC_DED_TR
  is '������� FDC_DED_TR';
comment on column FDC_DED_TR.id
  is '������������� �������';
comment on column FDC_DED_TR.pay_type_id
  is 'PAY_TYPE_ID';
comment on column FDC_DED_TR.kbkcode_id
  is 'KBKCODE_ID';
create index FDC#FK#FDC_DED_TR#KBKCODE_ID on FDC_DED_TR (KBKCODE_ID);
create index FDC#FK#FDC_DED_TR#PAY_TYPE_ID on FDC_DED_TR (PAY_TYPE_ID);
alter table FDC_DED_TR
  add constraint FDC#PK#FDC_DED_TR primary key (ID);
alter table FDC_DED_TR
  add constraint FDC#FK#DED_TR_KBKCODE_ID foreign key (KBKCODE_ID)
  references FDC_DICT (ID) on delete cascade;
alter table FDC_DED_TR
  add constraint FDC#FK#DED_TR_PAY_TYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID) on delete cascade;
alter table FDC_DED_TR
  add constraint FDC#PK#DED_TR_IS_DED_OTH foreign key (ID)
  references FDC_DEDUCTION_OTHERS (ID) on delete cascade;

prompt
prompt Creating table FDC_DETAIL_CANCELPAY
prompt ===================================
prompt
create table FDC_DETAIL_CANCELPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_DETAIL_CANCELPAY
  is '����������� ������ ������ (������������� ��������� ����������)';
comment on column FDC_DETAIL_CANCELPAY.id
  is '������������� ����������� ��������� ������ ������ (������������� ��������� ����������)';
alter table FDC_DETAIL_CANCELPAY
  add constraint FDC#PK#FDC_DETAIL_CANCELPAY primary key (ID);
alter table FDC_DETAIL_CANCELPAY
  add constraint FDC#FK#DETAIL_CANCELPAY#ID foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DICT_PATH_DOCPACK
prompt ====================================
prompt
create table FDC_DICT_PATH_DOCPACK
(
  id         NUMBER(15) not null,
  customs_id NUMBER(15) not null,
  soft_id    NUMBER(15) not null
)
;
comment on table FDC_DICT_PATH_DOCPACK
  is '���������� ����� ��� ���������� ���������';
comment on column FDC_DICT_PATH_DOCPACK.id
  is '������������� �������';
comment on column FDC_DICT_PATH_DOCPACK.customs_id
  is '������������� ����������� ������';
comment on column FDC_DICT_PATH_DOCPACK.soft_id
  is '������������� ������������ �����������';
create index FDC#FK#DICT_PATH_DOCPACK#SOFT on FDC_DICT_PATH_DOCPACK (SOFT_ID);
create unique index FDC#UK#DICT_PATH_DOCPACK on FDC_DICT_PATH_DOCPACK (CUSTOMS_ID, SOFT_ID);
alter table FDC_DICT_PATH_DOCPACK
  add constraint FDC#PK#FDC_DICT_PATH_DOCPACK primary key (ID);
alter table FDC_DICT_PATH_DOCPACK
  add constraint FDC#FK#DICT_PATH_DOCPACK#CUST foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DICT_PATH_DOCPACK
  add constraint FDC#FK#DICT_PATH_DOCPACK#ID foreign key (ID)
  references FDC_DICT (ID) on delete cascade;
alter table FDC_DICT_PATH_DOCPACK
  add constraint FDC#FK#DICT_PATH_DOCPACK#SOFT foreign key (SOFT_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_DICT_SUD_REASON
prompt ==================================
prompt
create table FDC_DICT_SUD_REASON
(
  id NUMBER(15) not null
)
;
comment on table FDC_DICT_SUD_REASON
  is '���������� ������ ��������� ��������� �������� �������� (�������) ���������� ������� ��������������';
comment on column FDC_DICT_SUD_REASON.id
  is '������������ �������';
alter table FDC_DICT_SUD_REASON
  add constraint FDC#PK#DICT_SUD_REASON primary key (ID);

prompt
prompt Creating table FDC_EXCHANGE_SITE
prompt ================================
prompt
create table FDC_EXCHANGE_SITE
(
  id        NUMBER(15) not null,
  parent_id NUMBER(15),
  host      VARCHAR2(1500),
  active    NUMBER(1) not null,
  keyprefix NUMBER(4) not null,
  iscurrent NUMBER(1) not null
)
;
comment on table FDC_EXCHANGE_SITE
  is '���� ������ ������� ������. ������� ���� ���������������� �� SysName.';
comment on column FDC_EXCHANGE_SITE.id
  is 'ID';
comment on column FDC_EXCHANGE_SITE.parent_id
  is '������ �� ������������ ���� ������ ������ ��������������� �������� ����� ������. ������ �������� ����� �� ��������� � ��������������� ��������� �������. ������ ���� ��� ��������� ���������� ������ ������ ��������� ��� ���� ����� ����������� �����, � ����������� �� ��������� ���������� ������������� ����.';
comment on column FDC_EXCHANGE_SITE.host
  is '������ ������������ ��� ��������� ���� � ������������ �������. ��� �������� ���� ��� ����� �������� ����������, ��� ��������� �������� � ��������� ��������� - ����� ��������� ����������.';
comment on column FDC_EXCHANGE_SITE.active
  is '������� �� ���� ������ � ������ ������. ���� ���, �� ��� ���� �� ����������� �������� ������� ������ �� ��� ���, ���� �� �� ������ ��������.';
comment on column FDC_EXCHANGE_SITE.keyprefix
  is '������� ���������� ����� ������ 4 ������� ����� ���������� ����� ���� ������� �������� ����.';
comment on column FDC_EXCHANGE_SITE.iscurrent
  is '������� �������� ����. ������� ����� ����� ���� �������� ������ ���� ����.';
create index FDC_EXCHANGE_SITE_IF2 on FDC_EXCHANGE_SITE (PARENT_ID);
alter table FDC_EXCHANGE_SITE
  add constraint FDC_EXCHANGE_SITE_PK primary key (ID);
alter table FDC_EXCHANGE_SITE
  add constraint FDC_EXCHANGE_SITE_KEYPREFIX unique (KEYPREFIX);
alter table FDC_EXCHANGE_SITE
  add constraint EXCHANGE_SITE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_EXCHANGE_SITE
  add constraint EXCHANGE_SITE_PARENT_ID foreign key (PARENT_ID)
  references FDC_EXCHANGE_SITE (ID);
alter table FDC_EXCHANGE_SITE
  add constraint YESORNO630
  check (Active IN (0, 1));
alter table FDC_EXCHANGE_SITE
  add constraint YESORNO631
  check (IsCurrent IN (0, 1));

prompt
prompt Creating table FDC_EXCHANGE_PACK
prompt ================================
prompt
create table FDC_EXCHANGE_PACK
(
  id               NUMBER(15) not null,
  previous_id      NUMBER(15),
  exchange_site_id NUMBER(15) not null
)
;
comment on table FDC_EXCHANGE_PACK
  is '����� ������ ����� ���������� ������ ������. ����� ����������� �� ����� ���� � �.�. �������� ���������� �����.';
comment on column FDC_EXCHANGE_PACK.id
  is 'ID';
comment on column FDC_EXCHANGE_PACK.previous_id
  is '����������� �� ���������� ����� � ����� ��������� ��������� �������. ������������ ��� �������� ��� ������������������� ������������ ������� ������.';
comment on column FDC_EXCHANGE_PACK.exchange_site_id
  is 'EXCHANGE_SITE_ID';
create index FDC_EXCHANGE_PACK_IF1 on FDC_EXCHANGE_PACK (EXCHANGE_SITE_ID);
create index FDC_EXCHANGE_PACK_IF3 on FDC_EXCHANGE_PACK (PREVIOUS_ID);
alter table FDC_EXCHANGE_PACK
  add constraint FDC_EXCHANGE_PACK_PK primary key (ID);
alter table FDC_EXCHANGE_PACK
  add constraint EXCHANGE_PACK_EXCHANGE_SITE_ID foreign key (EXCHANGE_SITE_ID)
  references FDC_EXCHANGE_SITE (ID);
alter table FDC_EXCHANGE_PACK
  add constraint EXCHANGE_PACK_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_EXCHANGE_PACK
  add constraint EXCHANGE_PACK_PREVIOUS_ID foreign key (PREVIOUS_ID)
  references FDC_EXCHANGE_PACK (ID);

prompt
prompt Creating table FDC_TRANSACTION
prompt ==============================
prompt
create table FDC_TRANSACTION
(
  id               NUMBER(15) not null,
  exchange_pack_id NUMBER(15),
  sign             VARCHAR2(1500) not null,
  startdatetime    DATE not null,
  login            VARCHAR2(1500) not null,
  processed        NUMBER(1),
  shipped          NUMBER(1)
)
;
comment on table FDC_TRANSACTION
  is '������� FDC_TRANSACTION';
comment on column FDC_TRANSACTION.id
  is 'ID';
comment on column FDC_TRANSACTION.exchange_pack_id
  is 'EXCHANGE_PACK_ID';
comment on column FDC_TRANSACTION.sign
  is 'SIGN';
comment on column FDC_TRANSACTION.startdatetime
  is 'STARTDATETIME';
comment on column FDC_TRANSACTION.login
  is 'LOGIN';
comment on column FDC_TRANSACTION.processed
  is '���� ��� ������� ������������ ���������� �� ������� ���������� ������ ������.';
comment on column FDC_TRANSACTION.shipped
  is '���� �� ���������� �������� � ����� ������. ������ ���� ��������� ����� ������������� ��������� ��������� ���������� � ����� ��� ��� �������� � ������, ���� ����� ��� ����� ������ �� �������.';
create index FDC_TRANSACTION_IF1 on FDC_TRANSACTION (EXCHANGE_PACK_ID);
alter table FDC_TRANSACTION
  add constraint FDC_TRANSACTION_PK primary key (ID);
alter table FDC_TRANSACTION
  add constraint FDC_TRANSACTION_AK1 unique (SIGN);
alter table FDC_TRANSACTION
  add constraint TRANSACTION_EXCHANGE_PACK_ID foreign key (EXCHANGE_PACK_ID)
  references FDC_EXCHANGE_PACK (ID);
alter table FDC_TRANSACTION
  add constraint YESORNO638
  check (Processed IN (0, 1));
alter table FDC_TRANSACTION
  add constraint YESORNO639
  check (Shipped IN (0, 1));

prompt
prompt Creating table FDC_DML_OPERATION
prompt ================================
prompt
create table FDC_DML_OPERATION
(
  id             NUMBER(15) not null,
  transaction_id NUMBER(15) not null,
  parent_id      NUMBER(15),
  tablename      VARCHAR2(1500) not null,
  dmltype        VARCHAR2(1500) not null,
  ignored        NUMBER(1) default 0 not null
)
;
comment on table FDC_DML_OPERATION
  is '�������������� ��������� �������� DML. ����������� - �������� �� ����� ��������� ������ 4�.';
comment on column FDC_DML_OPERATION.id
  is 'ID';
comment on column FDC_DML_OPERATION.transaction_id
  is 'TRANSACTION_ID';
comment on column FDC_DML_OPERATION.parent_id
  is 'PARENT_ID';
comment on column FDC_DML_OPERATION.tablename
  is 'TABLENAME';
comment on column FDC_DML_OPERATION.dmltype
  is 'I - insert
U - update
D - delete';
comment on column FDC_DML_OPERATION.ignored
  is '������������ �������� �� ���������� � ����� ������';
create index FDC_DML_OPERATION_IF1 on FDC_DML_OPERATION (TRANSACTION_ID);
create index FDC_DML_OPERATION_IF2 on FDC_DML_OPERATION (PARENT_ID);
alter table FDC_DML_OPERATION
  add constraint FDC_DML_OPERATION_PK primary key (ID);
alter table FDC_DML_OPERATION
  add constraint DML_OPERATION_PARENT_ID foreign key (PARENT_ID)
  references FDC_DML_OPERATION (ID);
alter table FDC_DML_OPERATION
  add constraint DML_OPERATION_TRANSACTION_ID foreign key (TRANSACTION_ID)
  references FDC_TRANSACTION (ID);
alter table FDC_DML_OPERATION
  add constraint DMLTYPE21
  check (DMLType IN ('I', 'U', 'D'));
alter table FDC_DML_OPERATION
  add constraint YESORNO628
  check (Ignored IN (0, 1));

prompt
prompt Creating table FDC_DML_ERROR
prompt ============================
prompt
create table FDC_DML_ERROR
(
  id               NUMBER(15) not null,
  dml_operation_id NUMBER(15) not null,
  exchange_site_id NUMBER(15) not null,
  errorstring      VARCHAR2(1500) not null
)
;
comment on table FDC_DML_ERROR
  is '������� FDC_DML_ERROR';
comment on column FDC_DML_ERROR.id
  is 'ID';
comment on column FDC_DML_ERROR.dml_operation_id
  is 'DML_OPERATION_ID';
comment on column FDC_DML_ERROR.exchange_site_id
  is 'EXCHANGE_SITE_ID';
comment on column FDC_DML_ERROR.errorstring
  is '�� ������ ���� ���������� �� ������ �� ������� ����.';
create index FDC_DML_ERROR_IF2 on FDC_DML_ERROR (DML_OPERATION_ID);
create index FDC_DML_ERROR_IF3 on FDC_DML_ERROR (EXCHANGE_SITE_ID);
alter table FDC_DML_ERROR
  add constraint FDC_DML_ERROR_PK primary key (ID);
alter table FDC_DML_ERROR
  add constraint DML_ERROR_DML_OPERATION_ID foreign key (DML_OPERATION_ID)
  references FDC_DML_OPERATION (ID);
alter table FDC_DML_ERROR
  add constraint DML_ERROR_EXCHANGE_SITE_ID foreign key (EXCHANGE_SITE_ID)
  references FDC_EXCHANGE_SITE (ID);

prompt
prompt Creating table FDC_DML_FIELD_VALUE
prompt ==================================
prompt
create table FDC_DML_FIELD_VALUE
(
  id               NUMBER(15) not null,
  dml_operation_id NUMBER(15) not null,
  columnname       VARCHAR2(1500) not null,
  newvalue         VARCHAR2(4000),
  oldvalue         VARCHAR2(4000),
  pk               NUMBER(1) not null
)
;
comment on table FDC_DML_FIELD_VALUE
  is '������� FDC_DML_FIELD_VALUE';
comment on column FDC_DML_FIELD_VALUE.id
  is 'ID';
comment on column FDC_DML_FIELD_VALUE.dml_operation_id
  is 'DML_OPERATION_ID';
comment on column FDC_DML_FIELD_VALUE.columnname
  is 'COLUMNNAME';
comment on column FDC_DML_FIELD_VALUE.newvalue
  is 'NEWVALUE';
comment on column FDC_DML_FIELD_VALUE.oldvalue
  is '������������� ��� update ����� ���������� ����� � ��� delete';
comment on column FDC_DML_FIELD_VALUE.pk
  is 'PK';
create index FDC_DML_FIELD_VALUE_IF1 on FDC_DML_FIELD_VALUE (DML_OPERATION_ID);
alter table FDC_DML_FIELD_VALUE
  add constraint FDC_DML_FIELD_VALUE_PK primary key (ID);
alter table FDC_DML_FIELD_VALUE
  add constraint DML_FIELD_VALUE_DML_OPERATION_ foreign key (DML_OPERATION_ID)
  references FDC_DML_OPERATION (ID);
alter table FDC_DML_FIELD_VALUE
  add constraint YESORNO627
  check (PK IN (0, 1));

prompt
prompt Creating table FDC_DOCUMENT_FOR_ACTIVATE
prompt ========================================
prompt
create global temporary table FDC_DOCUMENT_FOR_ACTIVATE
(
  id NUMBER(15) not null
)
on commit preserve rows;
comment on table FDC_DOCUMENT_FOR_ACTIVATE
  is '��������� ������� ��� ����������, �������������� � ����������';
comment on column FDC_DOCUMENT_FOR_ACTIVATE.id
  is 'ID';
alter table FDC_DOCUMENT_FOR_ACTIVATE
  add constraint FDC#PK#DOC_FOR_ACTIVATE primary key (ID);

prompt
prompt Creating table FDC_DOC_ACTIVATE_ERROR
prompt =====================================
prompt
create table FDC_DOC_ACTIVATE_ERROR
(
  doc_id NUMBER(15) not null,
  msg    VARCHAR2(4000),
  constraint PK#DOC_ACTIVATE_ERROR primary key (DOC_ID)
)
organization index overflow;
comment on table FDC_DOC_ACTIVATE_ERROR
  is '������, ����������� ��� ���������� ����������';
comment on column FDC_DOC_ACTIVATE_ERROR.doc_id
  is '������������� ���������';
comment on column FDC_DOC_ACTIVATE_ERROR.msg
  is '��������� �� ������';
alter table FDC_DOC_ACTIVATE_ERROR
  add constraint FK#DOC_ERR#DOC foreign key (DOC_ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CHILDS_BALANCE
prompt =====================================
prompt
create table FDC_DOC_CHILDS_BALANCE
(
  id           NUMBER(15) not null,
  currency_id  NUMBER(15) not null,
  customs_id   NUMBER(15) not null,
  date_from    DATE,
  date_to      DATE,
  balance_type INTEGER default 0
)
;
comment on table FDC_DOC_CHILDS_BALANCE
  is '������ ����������� ����������� ������';
comment on column FDC_DOC_CHILDS_BALANCE.id
  is '������������� �������';
comment on column FDC_DOC_CHILDS_BALANCE.currency_id
  is '������������� �������';
comment on column FDC_DOC_CHILDS_BALANCE.customs_id
  is '������������� �������';
comment on column FDC_DOC_CHILDS_BALANCE.date_from
  is '���� ������ �������';
comment on column FDC_DOC_CHILDS_BALANCE.date_to
  is '���� ����� �������';
comment on column FDC_DOC_CHILDS_BALANCE.balance_type
  is '��� �������';
create index FDC#FK#CHILDS_BALANCE#CURR_FDC on FDC_DOC_CHILDS_BALANCE (CURRENCY_ID);
create index FDC#FK#CHILDS_BALANCE#CUST_FDC on FDC_DOC_CHILDS_BALANCE (CUSTOMS_ID);
alter table FDC_DOC_CHILDS_BALANCE
  add constraint FDC#PK#DOC_CHILDS_BALANCE primary key (ID);
alter table FDC_DOC_CHILDS_BALANCE
  add constraint FDC#FK#CHILDS_BALANCE#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DOC_CHILDS_BALANCE
  add constraint FDC#FK#CHILDS_BALANCE#CUSTOMS foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_CHILDS_BALANCE
  add constraint FDC#FK#CHILDS_BALANCE_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_DOC_CHILDS_BALANCE
  add constraint FDC_CHK#BALANCE_TYPE2
  check (BALANCE_TYPE IN (0, 1));

prompt
prompt Creating table FDC_DOC_CNFRM_DP_ACTCHOSTKBK
prompt ===========================================
prompt
create table FDC_DOC_CNFRM_DP_ACTCHOSTKBK
(
  id NUMBER(15) not null,
  constraint FDC#PK#CNFRM#ACTCHOSTKBK primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_DP_ACTCHOSTKBK
  is '������������� ��������� ������� ����� � �������� �������� � �������� ���';
comment on column FDC_DOC_CNFRM_DP_ACTCHOSTKBK.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_DP_ACTCHOSTKBK
  add constraint FDC#FK#CNFRM_DP_ACT_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CNFRM_DP_RETURNS
prompt =======================================
prompt
create table FDC_DOC_CNFRM_DP_RETURNS
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CNFRM_DP_RETURNS primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_DP_RETURNS
  is '������������� ��������� ������� ���������';
comment on column FDC_DOC_CNFRM_DP_RETURNS.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_DP_RETURNS
  add constraint FDC#FK#CNFRM_DP_RET_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CNFRM_DP_RETURNSY
prompt ========================================
prompt
create table FDC_DOC_CNFRM_DP_RETURNSY
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CNFRM_DP_RETURNSY primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_DP_RETURNSY
  is '������������� ��������� ������� ������������� ���������';
comment on column FDC_DOC_CNFRM_DP_RETURNSY.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_DP_RETURNSY
  add constraint FDC#FK#CNFRM_DP_RETY_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CNFRM_DP_REUSE
prompt =====================================
prompt
create table FDC_DOC_CNFRM_DP_REUSE
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CNFRM_DP_REUSE primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_DP_REUSE
  is '������������� ��������� ������� �����������';
comment on column FDC_DOC_CNFRM_DP_REUSE.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_DP_REUSE
  add constraint FDC#FK#CNFRM_DP_REUSE_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CNFRM_DP_REUSEY
prompt ======================================
prompt
create table FDC_DOC_CNFRM_DP_REUSEY
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CNFRM_DP_REUSEY primary key (ID)
)
organization index;
comment on table FDC_DOC_CNFRM_DP_REUSEY
  is '������������� ��������� ������� ������������� �����������';
comment on column FDC_DOC_CNFRM_DP_REUSEY.id
  is '������������� �������';
alter table FDC_DOC_CNFRM_DP_REUSEY
  add constraint FDC#FK#CNFRM_DP_REUSY_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_CONFIRM_DP_PAYS
prompt ======================================
prompt
create table FDC_DOC_CONFIRM_DP_PAYS
(
  id NUMBER(15) not null,
  constraint FDC#PK#DOC_CONFIRM_DP_PAYS primary key (ID)
)
organization index;
comment on table FDC_DOC_CONFIRM_DP_PAYS
  is '������������� ��������� ������� �������� ����������';
comment on column FDC_DOC_CONFIRM_DP_PAYS.id
  is '������������� �������';
alter table FDC_DOC_CONFIRM_DP_PAYS
  add constraint FDC#FK#CNFRM_DP_PAYS_IS_CNFRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_DETAIL
prompt =============================
prompt
create table FDC_DOC_DETAIL
(
  id     NUMBER(15) not null,
  doc_id NUMBER(15) not null
)
;
comment on table FDC_DOC_DETAIL
  is '����������� ���������';
comment on column FDC_DOC_DETAIL.id
  is '������������� ����������� ���������';
comment on column FDC_DOC_DETAIL.doc_id
  is '������������� ��������������� ���������';
create index FDC#FK#FDC_DOC_DETAIL#DOC_ID on FDC_DOC_DETAIL (DOC_ID);
alter table FDC_DOC_DETAIL
  add constraint FDC#PK#FDC_DOC_DETAIL primary key (ID);
alter table FDC_DOC_DETAIL
  add constraint FDC#FK#DOC_DETAIL#ID foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_DOC_DETAIL
  add constraint FDC#FK#FDC_DOC_DETAIL#DOC_ID foreign key (DOC_ID)
  references FDC_DOCUMENT (ID);

prompt
prompt Creating table FDC_DOC_NUMBER_SEQS
prompt ==================================
prompt
create table FDC_DOC_NUMBER_SEQS
(
  doc_type_id NUMBER(15) not null,
  seq_name    VARCHAR2(30)
)
;
comment on table FDC_DOC_NUMBER_SEQS
  is '����� ������������������� ��� ��������� �������� ������� ����������';
comment on column FDC_DOC_NUMBER_SEQS.doc_type_id
  is '��� ������ ���������';
comment on column FDC_DOC_NUMBER_SEQS.seq_name
  is '��� �������� ������������������';
alter table FDC_DOC_NUMBER_SEQS
  add constraint FDC#PK#DOC_NUMBER_SEQS primary key (DOC_TYPE_ID);
alter table FDC_DOC_NUMBER_SEQS
  add constraint FDC#FK#DOC_NUM_SEQ#DOC_TYPE foreign key (DOC_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_DOC_NUMBER_YEAR_SEQS
prompt =======================================
prompt
create table FDC_DOC_NUMBER_YEAR_SEQS
(
  doc_type_id NUMBER(15) not null,
  doc_year    INTEGER not null,
  seq_name    VARCHAR2(30)
)
;
comment on table FDC_DOC_NUMBER_YEAR_SEQS
  is '����� ������������������� ��� ��������� �������� ������� ������� ����������';
comment on column FDC_DOC_NUMBER_YEAR_SEQS.doc_type_id
  is '��� ������ ���������';
comment on column FDC_DOC_NUMBER_YEAR_SEQS.doc_year
  is '���';
comment on column FDC_DOC_NUMBER_YEAR_SEQS.seq_name
  is '��� ������������������';
create index FDC#FK#DOC_NUM_Y_SEQ#DOC_T_FDC on FDC_DOC_NUMBER_YEAR_SEQS (DOC_TYPE_ID);
alter table FDC_DOC_NUMBER_YEAR_SEQS
  add constraint FDC#PK#DOC_NUMBER_YEAR_SEQS primary key (DOC_TYPE_ID, DOC_YEAR);
alter table FDC_DOC_NUMBER_YEAR_SEQS
  add constraint FDC#FK#DOC_NUM_Y_SEQ#DOC_TYPE foreign key (DOC_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_DOC_PACK_ACTCHOSTKBK
prompt =======================================
prompt
create table FDC_DOC_PACK_ACTCHOSTKBK
(
  id          NUMBER(15) not null,
  date_form   DATE,
  date_send   DATE,
  destination VARCHAR2(8)
)
;
comment on table FDC_DOC_PACK_ACTCHOSTKBK
  is '������ ����� � �������� �������� � �������� ���';
comment on column FDC_DOC_PACK_ACTCHOSTKBK.id
  is '������������� �������';
comment on column FDC_DOC_PACK_ACTCHOSTKBK.date_form
  is '���� ������������ �������';
comment on column FDC_DOC_PACK_ACTCHOSTKBK.date_send
  is '���� �������� �������';
comment on column FDC_DOC_PACK_ACTCHOSTKBK.destination
  is '8-���������� ��� ������� ����������';
alter table FDC_DOC_PACK_ACTCHOSTKBK
  add constraint FDC#PK#DP_ACTCHOSTKBK primary key (ID);
alter table FDC_DOC_PACK_ACTCHOSTKBK
  add constraint FDC#FK#PACK_ACTCHKBK_IS_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_GTD_KNP
prompt ===================================
prompt
create table FDC_DOC_PACK_GTD_KNP
(
  id           NUMBER(15) not null,
  agreement_id NUMBER(15),
  customs_code VARCHAR2(8),
  date_send    DATE,
  executor     VARCHAR2(2000),
  broker_id    NUMBER(15),
  licence_id   NUMBER(15)
)
;
comment on table FDC_DOC_PACK_GTD_KNP
  is '������� FDC_DOC_PACK_GTD_KNP';
comment on column FDC_DOC_PACK_GTD_KNP.id
  is 'ID';
comment on column FDC_DOC_PACK_GTD_KNP.agreement_id
  is '���������� � ��� (����������� �� ������ ���)';
comment on column FDC_DOC_PACK_GTD_KNP.customs_code
  is '��� �������';
comment on column FDC_DOC_PACK_GTD_KNP.date_send
  is '���� �������� ������';
comment on column FDC_DOC_PACK_GTD_KNP.executor
  is '�����������';
comment on column FDC_DOC_PACK_GTD_KNP.broker_id
  is '������';
comment on column FDC_DOC_PACK_GTD_KNP.licence_id
  is '���������� ��� ';
create index FDC#FK#PACK_GTDKNP#AGRM_ID on FDC_DOC_PACK_GTD_KNP (AGREEMENT_ID);
create index FDC#INDX#PACK_GTDKNP#BROKER on FDC_DOC_PACK_GTD_KNP (BROKER_ID);
create index FDC#INDX#PACK_GTDKNP#LIC on FDC_DOC_PACK_GTD_KNP (LICENCE_ID);
alter table FDC_DOC_PACK_GTD_KNP
  add constraint FDC_DOC_PACK_GTD_KNP_PK primary key (ID);
alter table FDC_DOC_PACK_GTD_KNP
  add constraint FDC#FK#DPGTDKNP#AGR foreign key (AGREEMENT_ID)
  references FDC_BP_AGREEMENT (ID) on delete set null;
alter table FDC_DOC_PACK_GTD_KNP
  add constraint FDC#FK#DPGTDKNP#BROKER foreign key (BROKER_ID)
  references FDC_SUBJECT (ID) on delete set null;
alter table FDC_DOC_PACK_GTD_KNP
  add constraint FDC#FK#DPGTDKNP#LIC foreign key (LICENCE_ID)
  references FDC_BP_LICENCE (ID) on delete set null;
alter table FDC_DOC_PACK_GTD_KNP
  add constraint FDC#FK#DPGTDKNP_IS_DOCPACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_INTERACTION
prompt =======================================
prompt
create table FDC_DOC_PACK_INTERACTION
(
  id                NUMBER(15) not null,
  customs_out_id    NUMBER(15) not null,
  customs_in_id     NUMBER(15) not null,
  send_date         DATE,
  income_date       DATE,
  doctype_id        NUMBER(15),
  version           VARCHAR2(20),
  resultcode        VARCHAR2(30),
  resultdescription VARCHAR2(1500),
  documentmodeid    VARCHAR2(30),
  documentid        VARCHAR2(36),
  refdocumentid     VARCHAR2(36)
)
;
comment on table FDC_DOC_PACK_INTERACTION
  is '��������-��������� ��� ������ ������� ��� �������������� �� �������� ��������';
comment on column FDC_DOC_PACK_INTERACTION.id
  is '������������� �������';
comment on column FDC_DOC_PACK_INTERACTION.customs_out_id
  is '������� - �����������';
comment on column FDC_DOC_PACK_INTERACTION.customs_in_id
  is '������� - ����������';
comment on column FDC_DOC_PACK_INTERACTION.send_date
  is '���� ��������';
comment on column FDC_DOC_PACK_INTERACTION.income_date
  is '���� ������������� �����';
comment on column FDC_DOC_PACK_INTERACTION.doctype_id
  is '��� ����������. ������ �� ���������� Dict.InterDocType';
comment on column FDC_DOC_PACK_INTERACTION.version
  is '������ ���������';
comment on column FDC_DOC_PACK_INTERACTION.resultcode
  is '��� ���������� ��������� ������������ ���������.';
comment on column FDC_DOC_PACK_INTERACTION.resultdescription
  is '�������� ���������� ��������� ������������ ���������';
comment on column FDC_DOC_PACK_INTERACTION.documentmodeid
  is '������������� ���� ���������';
comment on column FDC_DOC_PACK_INTERACTION.documentid
  is '���������� ������������� ���������';
comment on column FDC_DOC_PACK_INTERACTION.refdocumentid
  is '���������� ������������� ��������� ���������';
create index FDC#IDX#DP_INTER#CUSTOMS_IN on FDC_DOC_PACK_INTERACTION (CUSTOMS_IN_ID);
create index FDC#IDX#DP_INTER#CUSTOMS_OUT on FDC_DOC_PACK_INTERACTION (CUSTOMS_OUT_ID);
create index FDC#IDX#DP_INTER#DOC_TYPE on FDC_DOC_PACK_INTERACTION (DOCTYPE_ID);
alter table FDC_DOC_PACK_INTERACTION
  add constraint FDC#PK#DOC_PACK_INTERACTION primary key (ID);
alter table FDC_DOC_PACK_INTERACTION
  add constraint FDC#FK#DP_INTER#CUSTOMS_IN foreign key (CUSTOMS_IN_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_INTERACTION
  add constraint FDC#FK#DP_INTER#CUSTOMS_OUT foreign key (CUSTOMS_OUT_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_INTERACTION
  add constraint FDC#FK#INTERACTION_IS_DOC_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;
alter table FDC_DOC_PACK_INTERACTION
  add constraint FDC#FK#INTER_DOCTYPE foreign key (DOCTYPE_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_DOC_PACK_PAYMENTS
prompt ====================================
prompt
create table FDC_DOC_PACK_PAYMENTS
(
  id             NUMBER(15) not null,
  currency_id    NUMBER(15) not null,
  customs_id     NUMBER(15),
  date_in        DATE,
  date_out       DATE,
  load_id        NUMBER(15),
  is_kbk_correct VARCHAR2(1) default 'N' not null
)
;
comment on table FDC_DOC_PACK_PAYMENTS
  is '������� �� �����';
comment on column FDC_DOC_PACK_PAYMENTS.id
  is '������������� �������';
comment on column FDC_DOC_PACK_PAYMENTS.currency_id
  is '������';
comment on column FDC_DOC_PACK_PAYMENTS.customs_id
  is '��� ����������� ������ - ����������';
comment on column FDC_DOC_PACK_PAYMENTS.date_in
  is '���� ���������';
comment on column FDC_DOC_PACK_PAYMENTS.date_out
  is '���� ��������';
comment on column FDC_DOC_PACK_PAYMENTS.load_id
  is 'LOAD_ID';
comment on column FDC_DOC_PACK_PAYMENTS.is_kbk_correct
  is '������� ��������� ���';
create index FDC#FK#PACK_PAYMENTS#CURR_FDC on FDC_DOC_PACK_PAYMENTS (CURRENCY_ID);
create index FDC#FK#PACK_PAYMENTS#LOAD on FDC_DOC_PACK_PAYMENTS (LOAD_ID);
create index FDC#FK#PACK_PAYS#DEST_ID on FDC_DOC_PACK_PAYMENTS (CUSTOMS_ID);
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#PK#DOC_PACK_PAYMENTS primary key (ID);
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#FK#PACK_PAYMENTS#CSTM foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#FK#PACK_PAYMENTS#CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#FK#PACK_PAYMENTS#LOAD foreign key (LOAD_ID)
  references FDC_OBJECT (ID);
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#FK#PACK_PAYS_IS_DOC_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;
alter table FDC_DOC_PACK_PAYMENTS
  add constraint FDC#CHK#DPP#IS_KBK_CORR
  check (IS_KBK_CORRECT IN ('Y', 'N'));

prompt
prompt Creating table FDC_DOC_PACK_PAYMENTS_Y
prompt ======================================
prompt
create table FDC_DOC_PACK_PAYMENTS_Y
(
  id         NUMBER(15) not null,
  customs_id NUMBER(15),
  pack_id    NUMBER(15),
  date_in    DATE,
  date_out   DATE,
  notes      VARCHAR2(2000)
)
;
comment on table FDC_DOC_PACK_PAYMENTS_Y
  is '������ ������������� ��������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.id
  is '������������� �������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.customs_id
  is '������������� �������-����������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.pack_id
  is '������������� ��������������� ������� ��������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.date_in
  is '���� ����� �������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.date_out
  is '���� �������� �������';
comment on column FDC_DOC_PACK_PAYMENTS_Y.notes
  is '�����������';
create index FDC#FK#DEST_CUSTOMS#FDC on FDC_DOC_PACK_PAYMENTS_Y (CUSTOMS_ID);
create index FDC#FK#PACK_PAYS#FDC on FDC_DOC_PACK_PAYMENTS_Y (PACK_ID);
alter table FDC_DOC_PACK_PAYMENTS_Y
  add constraint FDC#PK#DOC_PACK_PAYMENTS_Y primary key (ID);
alter table FDC_DOC_PACK_PAYMENTS_Y
  add constraint FDC#FK#CONFIRM_PACK_PAYMENTS foreign key (PACK_ID)
  references FDC_DOC_PACK_PAYMENTS (ID) on delete cascade;
alter table FDC_DOC_PACK_PAYMENTS_Y
  add constraint FDC#FK#PACK_DEST_CUSTOMS foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID) on delete cascade;
alter table FDC_DOC_PACK_PAYMENTS_Y
  add constraint FDC#FK#PACK_PAYMENTS_Y_IS_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_RETURNS
prompt ===================================
prompt
create table FDC_DOC_PACK_RETURNS
(
  id               NUMBER(15) not null,
  currency_id      NUMBER(15) not null,
  regional_account VARCHAR2(21) not null,
  customs_code     VARCHAR2(8) not null,
  date_in          DATE default SYSDATE not null,
  date_send        DATE,
  destination      VARCHAR2(8)
)
;
comment on table FDC_DOC_PACK_RETURNS
  is '������ �� �������';
comment on column FDC_DOC_PACK_RETURNS.id
  is '������������� �������';
comment on column FDC_DOC_PACK_RETURNS.currency_id
  is '������������� �������';
comment on column FDC_DOC_PACK_RETURNS.regional_account
  is '���� ���';
comment on column FDC_DOC_PACK_RETURNS.customs_code
  is '��� �������';
comment on column FDC_DOC_PACK_RETURNS.date_in
  is '���� �����';
comment on column FDC_DOC_PACK_RETURNS.date_send
  is '���� ��������';
comment on column FDC_DOC_PACK_RETURNS.destination
  is '8-���������� ��� ������� ����������';
create index FDC#FC#PACK_REUSE#CURRENCY_FDC on FDC_DOC_PACK_RETURNS (CURRENCY_ID);
create index FDC#IDX#PACK_RETURNS#CUSTOMS on FDC_DOC_PACK_RETURNS (CUSTOMS_CODE);
create index FDC#IDX#PACK_RETURNS#DEST on FDC_DOC_PACK_RETURNS (DESTINATION);
alter table FDC_DOC_PACK_RETURNS
  add constraint FDC#PK#DOC_PACK_RETURNS primary key (ID);
alter table FDC_DOC_PACK_RETURNS
  add constraint FDC#FC#PACK_REUSE#CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DOC_PACK_RETURNS
  add constraint FDC#FK#PACK_RETURNS_IS_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_RETURNS_Y
prompt =====================================
prompt
create table FDC_DOC_PACK_RETURNS_Y
(
  id            NUMBER(15) not null,
  date_incoming DATE,
  date_send     DATE,
  customs_id    NUMBER(15)
)
;
comment on table FDC_DOC_PACK_RETURNS_Y
  is '������ ������������� ���������';
comment on column FDC_DOC_PACK_RETURNS_Y.id
  is '������������� �������';
comment on column FDC_DOC_PACK_RETURNS_Y.date_incoming
  is '���� ����� �������';
comment on column FDC_DOC_PACK_RETURNS_Y.date_send
  is '���� ��������';
comment on column FDC_DOC_PACK_RETURNS_Y.customs_id
  is '������������� ����������';
create index FDC#FK#PACK_RETURNS_Y_DEST on FDC_DOC_PACK_RETURNS_Y (CUSTOMS_ID);
alter table FDC_DOC_PACK_RETURNS_Y
  add constraint FDC#PK#DOC_PACK_RETURNS_Y primary key (ID);
alter table FDC_DOC_PACK_RETURNS_Y
  add constraint FDC#FK#PACK_RETURNS_Y_DEST foreign key (CUSTOMS_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_RETURNS_Y
  add constraint FDC#FK#PACK_RETURNS_Y_IS_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_REUSE
prompt =================================
prompt
create table FDC_DOC_PACK_REUSE
(
  id          NUMBER(15) not null,
  date_send   DATE,
  destination VARCHAR2(8)
)
;
comment on table FDC_DOC_PACK_REUSE
  is '������ �����������';
comment on column FDC_DOC_PACK_REUSE.id
  is '������������� �������';
comment on column FDC_DOC_PACK_REUSE.date_send
  is '���� ��������';
comment on column FDC_DOC_PACK_REUSE.destination
  is '8-���������� ��� ������� ����������';
alter table FDC_DOC_PACK_REUSE
  add constraint FDC#PK#DOC_PACK_REUSE primary key (ID);
alter table FDC_DOC_PACK_REUSE
  add constraint FDC#FK#PACK_REUSE_IS_DOC_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_REUSE_Y
prompt ===================================
prompt
create table FDC_DOC_PACK_REUSE_Y
(
  id            NUMBER(15) not null,
  date_incoming DATE,
  destination   VARCHAR2(8)
)
;
comment on table FDC_DOC_PACK_REUSE_Y
  is '������ ������������� �����������';
comment on column FDC_DOC_PACK_REUSE_Y.id
  is '������������� �������';
comment on column FDC_DOC_PACK_REUSE_Y.date_incoming
  is '���� ����� �������';
comment on column FDC_DOC_PACK_REUSE_Y.destination
  is '8-���������� ��� ������� ����������';
alter table FDC_DOC_PACK_REUSE_Y
  add constraint FDC#PK#DOC_PACK_REUSE_Y primary key (ID);
alter table FDC_DOC_PACK_REUSE_Y
  add constraint FDC#FK#PACK_REUSE_Y_IS_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_TRANSFER
prompt ====================================
prompt
create table FDC_DOC_PACK_TRANSFER
(
  id             NUMBER(15) not null,
  customs_out_id NUMBER(15) not null,
  customs_in_id  NUMBER(15) not null,
  send_date      DATE,
  income_date    DATE,
  guid           VARCHAR2(32) not null,
  priority       NUMBER,
  soft_kind      VARCHAR2(255),
  soft_version   VARCHAR2(20),
  file_name      VARCHAR2(250)
)
;
comment on table FDC_DOC_PACK_TRANSFER
  is '����� ������������ ����������';
comment on column FDC_DOC_PACK_TRANSFER.id
  is '������������� �������';
comment on column FDC_DOC_PACK_TRANSFER.customs_out_id
  is '������� - �����������';
comment on column FDC_DOC_PACK_TRANSFER.customs_in_id
  is '������� - ����������';
comment on column FDC_DOC_PACK_TRANSFER.send_date
  is '���� ��������';
comment on column FDC_DOC_PACK_TRANSFER.income_date
  is '���� ������������� �����';
comment on column FDC_DOC_PACK_TRANSFER.guid
  is 'GUID-�������������';
comment on column FDC_DOC_PACK_TRANSFER.priority
  is '���������';
comment on column FDC_DOC_PACK_TRANSFER.soft_kind
  is '�������� ��';
comment on column FDC_DOC_PACK_TRANSFER.soft_version
  is '������ ��';
comment on column FDC_DOC_PACK_TRANSFER.file_name
  is '��� �����-������';
create index FDC#IDX#DP_TRANS#CUSTOMS_IN on FDC_DOC_PACK_TRANSFER (CUSTOMS_IN_ID);
create index FDC#IDX#DP_TRANS#CUSTOMS_OUT on FDC_DOC_PACK_TRANSFER (CUSTOMS_OUT_ID);
alter table FDC_DOC_PACK_TRANSFER
  add constraint FDC#PK#DOC_PACK_TRANSFER primary key (ID);
alter table FDC_DOC_PACK_TRANSFER
  add constraint FDC#FK#PACK_TRANS#CUSTOMS_IN foreign key (CUSTOMS_IN_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_TRANSFER
  add constraint FDC#FK#PACK_TRANS#CUSTOMS_OUT foreign key (CUSTOMS_OUT_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_PACK_TRANSFER
  add constraint FDC#FK#TRANS_PACK_IS_DOC_PACK foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_TRANSFER_IN
prompt =======================================
prompt
create table FDC_DOC_PACK_TRANSFER_IN
(
  id NUMBER(15) not null
)
;
comment on table FDC_DOC_PACK_TRANSFER_IN
  is '������������ ����� - ��������';
comment on column FDC_DOC_PACK_TRANSFER_IN.id
  is '������������� �������';
alter table FDC_DOC_PACK_TRANSFER_IN
  add constraint FDC#PK#DOC_PACK_TRANSFER_IN primary key (ID);
alter table FDC_DOC_PACK_TRANSFER_IN
  add constraint FDC#FK#TRANS_IN_IS_DP_TRANS foreign key (ID)
  references FDC_DOC_PACK_TRANSFER (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PACK_TRANSFER_OUT
prompt ========================================
prompt
create table FDC_DOC_PACK_TRANSFER_OUT
(
  id NUMBER(15) not null
)
;
comment on table FDC_DOC_PACK_TRANSFER_OUT
  is '������������ ����� - ���������';
comment on column FDC_DOC_PACK_TRANSFER_OUT.id
  is '������������� �������';
alter table FDC_DOC_PACK_TRANSFER_OUT
  add constraint FDC#PK#DOC_PACK_TRANSFER_OUT primary key (ID);
alter table FDC_DOC_PACK_TRANSFER_OUT
  add constraint FDC#FK#TRANS_OUT_IS_DP_TRANS foreign key (ID)
  references FDC_DOC_PACK_TRANSFER (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_PARAMS_FUNCTION
prompt ======================================
prompt
create table FDC_DOC_PARAMS_FUNCTION
(
  doc_class_id  NUMBER(15) not null,
  function_name VARCHAR2(30) not null
)
;
comment on table FDC_DOC_PARAMS_FUNCTION
  is '��������������� ��������. ������ �������� �������, ������������ ����� ��������� �� ��� ����';
comment on column FDC_DOC_PARAMS_FUNCTION.doc_class_id
  is '��� ������ ���������';
comment on column FDC_DOC_PARAMS_FUNCTION.function_name
  is '�������, ������������ ����� ��������� �� ��� ���� (��������������)';
alter table FDC_DOC_PARAMS_FUNCTION
  add constraint FDC#PK#DOC_SUM_FUNCTION primary key (DOC_CLASS_ID);
alter table FDC_DOC_PARAMS_FUNCTION
  add constraint FDC#FK#DOC_SUM_FUNC#OBJ_TYPE foreign key (DOC_CLASS_ID)
  references FDC_OBJECT_TYPE (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_REUSE_CUSTOMS
prompt ====================================
prompt
create table FDC_DOC_REUSE_CUSTOMS
(
  id               NUMBER(15) not null,
  currency_id      NUMBER(15) not null,
  customs_new_id   NUMBER(15) not null,
  customs_code_old VARCHAR2(8),
  customs_code_new VARCHAR2(8),
  reason           VARCHAR2(150),
  decision_attr    VARCHAR2(50)
)
;
comment on table FDC_DOC_REUSE_CUSTOMS
  is '������� � ������ � ������ ���������� �����';
comment on column FDC_DOC_REUSE_CUSTOMS.id
  is '������������� �������';
comment on column FDC_DOC_REUSE_CUSTOMS.currency_id
  is '������';
comment on column FDC_DOC_REUSE_CUSTOMS.customs_new_id
  is '������������� �������';
comment on column FDC_DOC_REUSE_CUSTOMS.customs_code_old
  is '��� ������� "�"';
comment on column FDC_DOC_REUSE_CUSTOMS.customs_code_new
  is '��� ������� "��"';
comment on column FDC_DOC_REUSE_CUSTOMS.reason
  is '���������(�������) ��� ����������';
comment on column FDC_DOC_REUSE_CUSTOMS.decision_attr
  is '��������� �������������';
create index FDC#FK#REUSE_CURRENCY_FDC on FDC_DOC_REUSE_CUSTOMS (CURRENCY_ID);
create index FDC#FK#REUSE_CUSTOMS_FDC on FDC_DOC_REUSE_CUSTOMS (CUSTOMS_NEW_ID);
create index FDC#IDX#DOC_REUSE#CUST_NEW on FDC_DOC_REUSE_CUSTOMS (SUBSTR(CUSTOMS_CODE_NEW,1,5));
alter table FDC_DOC_REUSE_CUSTOMS
  add constraint FDC#PK#DOC_REUSE_CUSTOMS primary key (ID);
alter table FDC_DOC_REUSE_CUSTOMS
  add constraint FDC#FK#REUSE_CURRENCY foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_DOC_REUSE_CUSTOMS
  add constraint FDC#FK#REUSE_CUSTOMS foreign key (CUSTOMS_NEW_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_DOC_REUSE_CUSTOMS
  add constraint FDC#FK#REUSE_IS_DECISION foreign key (ID)
  references FDC_DECISION (ID) on delete cascade;

prompt
prompt Creating table FDC_DOC_REUSE_CUSTOMS_Y
prompt ======================================
prompt
create table FDC_DOC_REUSE_CUSTOMS_Y
(
  id         NUMBER(15) not null,
  is_confirm VARCHAR2(1) not null,
  constraint FDC#PK#DOC_REUSE_CUSTOMS_Y primary key (ID)
)
organization index;
comment on table FDC_DOC_REUSE_CUSTOMS_Y
  is '������������� ���������';
comment on column FDC_DOC_REUSE_CUSTOMS_Y.id
  is '������������� �������';
comment on column FDC_DOC_REUSE_CUSTOMS_Y.is_confirm
  is '������� ������/������� (Y/N)';
alter table FDC_DOC_REUSE_CUSTOMS_Y
  add constraint FDC#FK#REUSE_Y_IS_DOC_CONFIRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;
alter table FDC_DOC_REUSE_CUSTOMS_Y
  add constraint FDC#CHK#REUSE_Y#IS_CONFIRM
  check (IS_CONFIRM IN ('Y', 'N'));

prompt
prompt Creating table FDC_DUPLICATES
prompt =============================
prompt
create table FDC_DUPLICATES
(
  id       NUMBER(15),
  src_id   NUMBER(15),
  key_id   NUMBER(15),
  criteria INTEGER,
  value    VARCHAR2(100)
)
;
comment on table FDC_DUPLICATES
  is '������� FDC_DUPLICATES';
comment on column FDC_DUPLICATES.id
  is 'ID';
comment on column FDC_DUPLICATES.src_id
  is 'SRC_ID';
comment on column FDC_DUPLICATES.key_id
  is 'KEY_ID';
comment on column FDC_DUPLICATES.criteria
  is 'CRITERIA';
comment on column FDC_DUPLICATES.value
  is 'VALUE';
alter table FDC_DUPLICATES
  add constraint FDC_DUPLICATES_UQ unique (ID, SRC_ID, KEY_ID);

prompt
prompt Creating table FDC_ED_ERROR
prompt ===========================
prompt
create table FDC_ED_ERROR
(
  ed_id       NUMBER(15) not null,
  source      VARCHAR2(35),
  code        NUMBER(4),
  severity    NUMBER(1),
  description VARCHAR2(1500)
)
;
comment on table FDC_ED_ERROR
  is '������ ��������� ������������ ���������';
comment on column FDC_ED_ERROR.ed_id
  is '������ �� ����������� ��������';
comment on column FDC_ED_ERROR.source
  is '�������� ������/��������������.';
comment on column FDC_ED_ERROR.code
  is '��� ������/��������������.';
comment on column FDC_ED_ERROR.severity
  is '������� ����������� ������/��������������.';
comment on column FDC_ED_ERROR.description
  is '�������� ������/��������������.';
create index IDX#ED_ERROR#DOC on FDC_ED_ERROR (ED_ID);
alter table FDC_ED_ERROR
  add constraint FDC#FK#ED_ERR_DOC foreign key (ED_ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_EH_CALL_STACK
prompt ================================
prompt
create table FDC_EH_CALL_STACK
(
  call_stack_id NUMBER(15) not null,
  session_id    NUMBER,
  user_name     VARCHAR2(30),
  host_name     VARCHAR2(30)
)
;
comment on table FDC_EH_CALL_STACK
  is '���� ������';
comment on column FDC_EH_CALL_STACK.call_stack_id
  is '�� ����� ������';
comment on column FDC_EH_CALL_STACK.session_id
  is '�� ������';
comment on column FDC_EH_CALL_STACK.user_name
  is '������������';
comment on column FDC_EH_CALL_STACK.host_name
  is '���������';
alter table FDC_EH_CALL_STACK
  add constraint FDC_EH_CALL_STACK_PK primary key (CALL_STACK_ID);

prompt
prompt Creating table FDC_EH_CALL
prompt ==========================
prompt
create table FDC_EH_CALL
(
  call_id       NUMBER(15) not null,
  module_name   VARCHAR2(200),
  marker        VARCHAR2(30),
  call_stack_id NUMBER(15),
  call_date     DATE,
  call_level    INTEGER
)
;
comment on table FDC_EH_CALL
  is '�����';
comment on column FDC_EH_CALL.call_id
  is '�� ������';
comment on column FDC_EH_CALL.module_name
  is '������';
comment on column FDC_EH_CALL.marker
  is '������';
comment on column FDC_EH_CALL.call_stack_id
  is '�� ����� ������';
comment on column FDC_EH_CALL.call_date
  is '����� ������';
comment on column FDC_EH_CALL.call_level
  is '������� � �����';
create index FDC#IDX#EH_CALL#DATE on FDC_EH_CALL (CALL_DATE);
create index FDC#IDX#EH_CALL#DATE_C on FDC_EH_CALL (TRUNC(CALL_DATE));
create index FDC_EH_CALL_IF1 on FDC_EH_CALL (CALL_STACK_ID);
alter table FDC_EH_CALL
  add constraint FDC_EH_CALL_PK primary key (CALL_ID);
alter table FDC_EH_CALL
  add foreign key (CALL_STACK_ID)
  references FDC_EH_CALL_STACK (CALL_STACK_ID);

prompt
prompt Creating table FDC_EH_ERROR
prompt ===========================
prompt
create table FDC_EH_ERROR
(
  err_id        NUMBER(15) not null,
  err_mess      VARCHAR2(512),
  err_code      VARCHAR2(30),
  err_stack_id  NUMBER(15),
  call_id       NUMBER(15),
  err_lineno    NUMBER(15),
  err_proc_name VARCHAR2(512)
)
;
comment on table FDC_EH_ERROR
  is '������';
comment on column FDC_EH_ERROR.err_id
  is '�� ������';
comment on column FDC_EH_ERROR.err_mess
  is '��������� �� ������';
comment on column FDC_EH_ERROR.err_code
  is '��� ������';
comment on column FDC_EH_ERROR.err_stack_id
  is '�� ����� ������';
comment on column FDC_EH_ERROR.call_id
  is '�� ������';
comment on column FDC_EH_ERROR.err_lineno
  is '����� ������ � �������';
comment on column FDC_EH_ERROR.err_proc_name
  is '��� ���������';
create index FEH_ERROR_IF1 on FDC_EH_ERROR (ERR_CODE);
create index FEH_ERROR_IF2 on FDC_EH_ERROR (ERR_STACK_ID);
create index FEH_ERROR_IF3 on FDC_EH_ERROR (CALL_ID);
alter table FDC_EH_ERROR
  add constraint FDC_EH_ERROR_PK primary key (ERR_ID);

prompt
prompt Creating table FDC_EH_ERROR_CODE
prompt ================================
prompt
create table FDC_EH_ERROR_CODE
(
  type_code VARCHAR2(30) not null,
  err_num   VARCHAR2(11) not null,
  message   VARCHAR2(4000),
  location  VARCHAR2(4000)
)
;
comment on table FDC_EH_ERROR_CODE
  is '���������� ����� ������';
comment on column FDC_EH_ERROR_CODE.type_code
  is '��� ���� ������';
comment on column FDC_EH_ERROR_CODE.err_num
  is '����� ������';
comment on column FDC_EH_ERROR_CODE.message
  is '��������� �� ������';
comment on column FDC_EH_ERROR_CODE.location
  is '� ����� ���������� �����������';
alter table FDC_EH_ERROR_CODE
  add constraint FDC_EH_ERROR_CODE_PK primary key (TYPE_CODE, ERR_NUM);

prompt
prompt Creating table FDC_EH_ERROR_TYPE
prompt ================================
prompt
create table FDC_EH_ERROR_TYPE
(
  err_code       VARCHAR2(30) not null,
  err_mess_templ VARCHAR2(512),
  user_comment   VARCHAR2(256)
)
;
comment on table FDC_EH_ERROR_TYPE
  is '��� ������';
comment on column FDC_EH_ERROR_TYPE.err_code
  is '��� ������';
comment on column FDC_EH_ERROR_TYPE.err_mess_templ
  is '������ ���������';
comment on column FDC_EH_ERROR_TYPE.user_comment
  is '�����������';
alter table FDC_EH_ERROR_TYPE
  add constraint FDC_EH_ERROR_TYPE_PK primary key (ERR_CODE);

prompt
prompt Creating table FDC_EH_REGISTER_STATUS
prompt =====================================
prompt
create table FDC_EH_REGISTER_STATUS
(
  object_name   VARCHAR2(40) not null,
  status        NUMBER,
  modify_moment DATE,
  object_type   VARCHAR2(40)
)
;
comment on table FDC_EH_REGISTER_STATUS
  is '������ ��������� �� ����������� ������� �������� (fdc_error_handler_pack)';
comment on column FDC_EH_REGISTER_STATUS.object_name
  is '��� ������� � ��';
comment on column FDC_EH_REGISTER_STATUS.status
  is 'null - �� ���������, 1 - ������������� �������, 2 - ������� �������, 3 - ������� �� ��� �� �����, 4 - ������������� � ��������';
comment on column FDC_EH_REGISTER_STATUS.modify_moment
  is '������ ����������';
comment on column FDC_EH_REGISTER_STATUS.object_type
  is '��� ������� ��';

prompt
prompt Creating table FDC_EVENT_TYPE
prompt =============================
prompt
create table FDC_EVENT_TYPE
(
  id NUMBER(15) not null
)
;
comment on table FDC_EVENT_TYPE
  is '��������� ���� �������. ����� ��� �����������
����������� ����������� (��� ��������)';
comment on column FDC_EVENT_TYPE.id
  is 'ID';
alter table FDC_EVENT_TYPE
  add constraint FDC_EVENT_TYPE_PK primary key (ID);
alter table FDC_EVENT_TYPE
  add constraint EVENT_TYPE_ID foreign key (ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_EVENT
prompt ========================
prompt
create table FDC_EVENT
(
  id            NUMBER(15) not null,
  object_id     NUMBER(15),
  moment        DATE not null,
  login         VARCHAR2(1500) not null,
  program       VARCHAR2(1500),
  machine       VARCHAR2(1500),
  event_type_id NUMBER(15) not null,
  name          VARCHAR2(1500),
  descript      VARCHAR2(1500),
  os_user       VARCHAR2(1500),
  ip_address    VARCHAR2(1500)
)
;
comment on table FDC_EVENT
  is '������� � �������. ��������������� ����� � ����������� (����������). ��������� ���������� ��� ��������������� ����������. ���� ������ ��������� �� ������, � ������� ��������� ������� (�������� �������� �������). ������� ����� �� ����� ������� (�������� ��������� ������ ������������ �������)';
comment on column FDC_EVENT.id
  is 'ID';
comment on column FDC_EVENT.object_id
  is '���������� Foreign �� ������. ���������� �� �������� ��-�� �������� delete �������';
comment on column FDC_EVENT.moment
  is 'MOMENT';
comment on column FDC_EVENT.login
  is 'LOGIN';
comment on column FDC_EVENT.program
  is 'PROGRAM';
comment on column FDC_EVENT.machine
  is 'MACHINE';
comment on column FDC_EVENT.event_type_id
  is '��� ������� � �������� ��������� �����; ��. ���� ��� ������� �������� ������';
comment on column FDC_EVENT.name
  is '������������ �������; ��. ���� �������� �������� ������';
comment on column FDC_EVENT.descript
  is '��. ���� �������� �������� ������';
comment on column FDC_EVENT.os_user
  is 'OS_USER';
comment on column FDC_EVENT.ip_address
  is 'IP_ADDRESS';
create index FDC#IDX#EVENT#OBJ_TYPE_M on FDC_EVENT (OBJECT_ID, EVENT_TYPE_ID, MOMENT);
create index FDC_EVENT_IE1 on FDC_EVENT (MOMENT);
create index FDC_EVENT_IF1 on FDC_EVENT (EVENT_TYPE_ID);
create index FDC_EVENT_OBJECT_ID on FDC_EVENT (OBJECT_ID);
alter table FDC_EVENT
  add constraint FDC_EVENT_PK primary key (ID);
alter table FDC_EVENT
  add constraint EVENT_EVENT_TYPE_ID foreign key (EVENT_TYPE_ID)
  references FDC_EVENT_TYPE (ID);

prompt
prompt Creating table FDC_EVENT_NOTIFICATION
prompt =====================================
prompt
create table FDC_EVENT_NOTIFICATION
(
  id         NUMBER(15) not null,
  user_id    NUMBER(15) not null,
  event_id   NUMBER(15) not null,
  checked    NUMBER(1) not null,
  check_date DATE
)
;
comment on table FDC_EVENT_NOTIFICATION
  is '����������� � �������. ������������ �������� (��� ������, �������� ���������� ����������� - ������������, ������ ��� ����� ������).';
comment on column FDC_EVENT_NOTIFICATION.id
  is '������������� �����������';
comment on column FDC_EVENT_NOTIFICATION.user_id
  is '������ �� ������������ - �������� �����������';
comment on column FDC_EVENT_NOTIFICATION.event_id
  is '������ �� �������';
comment on column FDC_EVENT_NOTIFICATION.checked
  is '�������, ��� ����������� ��������� ���������';
comment on column FDC_EVENT_NOTIFICATION.check_date
  is '������ ����������� ������� � ���, ��� ����������� ����������� ���������';
create index EVENT_NOTIFICATION_EVENT_I_FDC on FDC_EVENT_NOTIFICATION (EVENT_ID);
create index FDC_EVENT_NOTIFICATION_IF35 on FDC_EVENT_NOTIFICATION (USER_ID);
alter table FDC_EVENT_NOTIFICATION
  add constraint FDC_EVENT_NOTIFICATION_PK primary key (ID);
alter table FDC_EVENT_NOTIFICATION
  add constraint EVENT_NOTIFICATION_EVENT_ID foreign key (EVENT_ID)
  references FDC_EVENT (ID);
alter table FDC_EVENT_NOTIFICATION
  add constraint EVENT_NOTIFICATION_USER_ID foreign key (USER_ID)
  references FDC_USER (ID);
alter table FDC_EVENT_NOTIFICATION
  add constraint NOTIFICATIONCHECKED2
  check ((Checked = 1 AND Check_Date IS NOT NULL) OR (Checked = 0 AND Check_Date IS NULL));
alter table FDC_EVENT_NOTIFICATION
  add constraint YESORNO596
  check (Checked IN (0, 1));

prompt
prompt Creating table FDC_STATE_TRANSIT
prompt ================================
prompt
create table FDC_STATE_TRANSIT
(
  id                  NUMBER(15) not null,
  state_scheme_id     NUMBER(15) not null,
  src_state_id        NUMBER(15),
  dst_state_id        NUMBER(15),
  before_procedure_id NUMBER(15),
  after_procedure_id  NUMBER(15),
  access_level        NUMBER default 1 not null,
  condition           VARCHAR2(1500)
)
;
comment on table FDC_STATE_TRANSIT
  is '������ ����� ���������� �� ������ ��������� � ������ ������ �������� ����������� ��������. ������ �� ������� ��������� ����� �������� ��������� ������ �� ������ ���������� ���������, ��� �������� ��������� null. ������, ������� ��������� ����� ���� ������ ������ ���� ���� ���������� ������� �� ��� ��������� � �������� ���������� null.';
comment on column FDC_STATE_TRANSIT.id
  is 'ID';
comment on column FDC_STATE_TRANSIT.state_scheme_id
  is 'STATE_SCHEME_ID';
comment on column FDC_STATE_TRANSIT.src_state_id
  is 'SRC_STATE_ID';
comment on column FDC_STATE_TRANSIT.dst_state_id
  is 'DST_STATE_ID';
comment on column FDC_STATE_TRANSIT.before_procedure_id
  is 'BEFORE_PROCEDURE_ID';
comment on column FDC_STATE_TRANSIT.after_procedure_id
  is 'AFTER_PROCEDURE_ID';
comment on column FDC_STATE_TRANSIT.access_level
  is '�����������: 1 - ������� �������� � GUI, 0 - �� ��������';
comment on column FDC_STATE_TRANSIT.condition
  is '������� ����������� �������� (SQL)';
create index FDC_STATE_TRANSIT_IF234 on FDC_STATE_TRANSIT (DST_STATE_ID);
create index FDC_STATE_TRANSIT_IF235 on FDC_STATE_TRANSIT (SRC_STATE_ID);
create index FDC_STATE_TRANSIT_IF57 on FDC_STATE_TRANSIT (BEFORE_PROCEDURE_ID);
create index FDC_STATE_TRANSIT_IF58 on FDC_STATE_TRANSIT (AFTER_PROCEDURE_ID);
create index FDC_STATE_TRANSIT_IF59 on FDC_STATE_TRANSIT (STATE_SCHEME_ID);
alter table FDC_STATE_TRANSIT
  add constraint FDC_STATE_TRANSIT_PK primary key (ID);
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_AFTER_PROCEDURE_ foreign key (AFTER_PROCEDURE_ID)
  references FDC_PROCEDURE (ID);
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_BEFORE_PROCEDURE foreign key (BEFORE_PROCEDURE_ID)
  references FDC_PROCEDURE (ID);
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_DST_STATE_ID foreign key (DST_STATE_ID)
  references FDC_STATE (ID);
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_SRC_STATE_ID foreign key (SRC_STATE_ID)
  references FDC_STATE (ID);
alter table FDC_STATE_TRANSIT
  add constraint STATE_TRANSIT_STATE_SCHEME_ID foreign key (STATE_SCHEME_ID)
  references FDC_STATE_SCHEME (ID);

prompt
prompt Creating table FDC_EVENT_STATE
prompt ==============================
prompt
create table FDC_EVENT_STATE
(
  id               NUMBER(15) not null,
  state_transit_id NUMBER(15) not null
)
;
comment on table FDC_EVENT_STATE
  is '������� ��������� ��������� �������';
comment on column FDC_EVENT_STATE.id
  is 'ID';
comment on column FDC_EVENT_STATE.state_transit_id
  is 'STATE_TRANSIT_ID';
create index FDC_EVENT_STATE_IF133 on FDC_EVENT_STATE (STATE_TRANSIT_ID);
alter table FDC_EVENT_STATE
  add constraint FDC_EVENT_STATE_PK primary key (ID);
alter table FDC_EVENT_STATE
  add constraint EVENT_STATE_ID foreign key (ID)
  references FDC_EVENT (ID) on delete cascade;
alter table FDC_EVENT_STATE
  add constraint EVENT_STATE_STATE_TRANSIT_ID foreign key (STATE_TRANSIT_ID)
  references FDC_STATE_TRANSIT (ID) on delete cascade;

prompt
prompt Creating table FDC_EVT_TYPE
prompt ===========================
prompt
create table FDC_EVT_TYPE
(
  code        VARCHAR2(3) not null,
  name        VARCHAR2(150) not null,
  description VARCHAR2(2000) not null,
  constraint FDC#PK$EVT_TYPE primary key (CODE)
)
organization index;
comment on table FDC_EVT_TYPE
  is '���� �������, ����������� � �������';
comment on column FDC_EVT_TYPE.code
  is '��� ���� �������';
comment on column FDC_EVT_TYPE.name
  is '�������� ���� �������';
comment on column FDC_EVT_TYPE.description
  is '������� �������� ���� �������';

prompt
prompt Creating table FDC_EVT_CODE
prompt ===========================
prompt
create table FDC_EVT_CODE
(
  type_code     VARCHAR2(3) not null,
  code          VARCHAR2(5) not null,
  name          VARCHAR2(250) not null,
  dscr_template VARCHAR2(2000),
  constraint FDC#PK$EVT_CODE primary key (TYPE_CODE, CODE)
)
organization index;
comment on table FDC_EVT_CODE
  is '���� ������� � ������� �������� �������';
comment on column FDC_EVT_CODE.type_code
  is '��� ���� �������';
comment on column FDC_EVT_CODE.code
  is '��� �������';
comment on column FDC_EVT_CODE.name
  is '�������� ������� (�������)';
comment on column FDC_EVT_CODE.dscr_template
  is '������ �������� ������� (���������)';
alter table FDC_EVT_CODE
  add constraint FDC#FK$EVT_CODE#EVT_TYPE foreign key (TYPE_CODE)
  references FDC_EVT_TYPE (CODE);

prompt
prompt Creating table FDC_EVT
prompt ======================
prompt
create table FDC_EVT
(
  user_id         NUMBER(15) not null,
  type_code       VARCHAR2(3) not null,
  code            VARCHAR2(5) not null,
  evt_moment      DATE default SYSDATE not null,
  host_name       VARCHAR2(150),
  ip_address      VARCHAR2(35),
  os_user         VARCHAR2(150),
  module          VARCHAR2(150),
  evt_description VARCHAR2(2000)
)
;
comment on table FDC_EVT
  is '�������, ����������� � �������';
comment on column FDC_EVT.user_id
  is '������������� �������';
comment on column FDC_EVT.type_code
  is '��� ���� �������';
comment on column FDC_EVT.code
  is '��� �������';
comment on column FDC_EVT.evt_moment
  is '����� ������������� �������';
comment on column FDC_EVT.host_name
  is '��� �����, � �������� ������������ �������';
comment on column FDC_EVT.ip_address
  is 'IP-����� ����� � �������� ����������� �������';
comment on column FDC_EVT.os_user
  is '��� ������������ ��, ��������������� �������';
comment on column FDC_EVT.module
  is '��� ������������ ������ ��������������� �������';
comment on column FDC_EVT.evt_description
  is '�������� �������';
create index FDC#FK$EVT#EVT_CODE on FDC_EVT (TYPE_CODE, CODE);
alter table FDC_EVT
  add constraint FDC#PK$EVT primary key (USER_ID, TYPE_CODE, CODE, EVT_MOMENT);
alter table FDC_EVT
  add constraint FDC#FK$EVT#EVT_CODE foreign key (TYPE_CODE, CODE)
  references FDC_EVT_CODE (TYPE_CODE, CODE);
alter table FDC_EVT
  add constraint FDC#FK$EVT#USER foreign key (USER_ID)
  references FDC_USER (ID);

prompt
prompt Creating table FDC_EXCHANGE_PACK_DELIVERY
prompt =========================================
prompt
create table FDC_EXCHANGE_PACK_DELIVERY
(
  id               NUMBER(15) not null,
  exchange_pack_id NUMBER(15) not null,
  exchange_site_id NUMBER(15) not null,
  notifysent       NUMBER(1)
)
;
comment on table FDC_EXCHANGE_PACK_DELIVERY
  is '���� ������ ������� ����� ���������� ������ ������';
comment on column FDC_EXCHANGE_PACK_DELIVERY.id
  is 'ID';
comment on column FDC_EXCHANGE_PACK_DELIVERY.exchange_pack_id
  is 'EXCHANGE_PACK_ID';
comment on column FDC_EXCHANGE_PACK_DELIVERY.exchange_site_id
  is 'EXCHANGE_SITE_ID';
comment on column FDC_EXCHANGE_PACK_DELIVERY.notifysent
  is '���� ��� ������� ����� ����������� ����������� �� ���������  �������� ������ ���������� �� ������� ����������.';
create index FDC_EXCHANGE_PACK_DELIVERY_IF1 on FDC_EXCHANGE_PACK_DELIVERY (EXCHANGE_PACK_ID);
create index FDC_EXCHANGE_PACK_DELIVERY_IF2 on FDC_EXCHANGE_PACK_DELIVERY (EXCHANGE_SITE_ID);
alter table FDC_EXCHANGE_PACK_DELIVERY
  add constraint FDC_EXCHANGE_PACK_DELIVERY_PK primary key (ID);
alter table FDC_EXCHANGE_PACK_DELIVERY
  add constraint EXCHANGE_PACK_DELIVERY_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_EXCHANGE_PACK_DELIVERY
  add constraint EXCHANGE_PACK_DELIVERY_PACK foreign key (EXCHANGE_PACK_ID)
  references FDC_EXCHANGE_PACK (ID);
alter table FDC_EXCHANGE_PACK_DELIVERY
  add constraint EXCHANGE_PACK_DELIVERY_SITE foreign key (EXCHANGE_SITE_ID)
  references FDC_EXCHANGE_SITE (ID);
alter table FDC_EXCHANGE_PACK_DELIVERY
  add constraint YESORNO629
  check (NotifySent IN (0, 1));

prompt
prompt Creating table FDC_FILE
prompt =======================
prompt
create table FDC_FILE
(
  id         NUMBER(15) not null,
  sourcename VARCHAR2(1500) not null,
  body       BLOB
)
;
comment on table FDC_FILE
  is '������������ ��� �������� ��������� ������';
comment on column FDC_FILE.id
  is 'ID';
comment on column FDC_FILE.sourcename
  is 'SOURCENAME';
comment on column FDC_FILE.body
  is 'BODY';
alter table FDC_FILE
  add constraint FDC_FILE_PK primary key (ID);

prompt
prompt Creating table FDC_FOLLOWUP
prompt ===========================
prompt
create table FDC_FOLLOWUP
(
  id           NUMBER(15) not null,
  object_id    NUMBER(15),
  momentplan   DATE,
  momentfact   DATE,
  resp_user_id NUMBER(15) not null,
  doer_user_id NUMBER(15),
  result       VARCHAR2(1500)
)
;
comment on table FDC_FOLLOWUP
  is '������� ����������� ��������� � �������������� ���������� ����������� �� ������ �������.
����������� ��� ��������� �������� (����� ��������), ��������������� ������������ ����������� � ��������� �������.
';
comment on column FDC_FOLLOWUP.id
  is 'ID';
comment on column FDC_FOLLOWUP.object_id
  is 'OBJECT_ID';
comment on column FDC_FOLLOWUP.momentplan
  is 'MOMENTPLAN';
comment on column FDC_FOLLOWUP.momentfact
  is 'MOMENTFACT';
comment on column FDC_FOLLOWUP.resp_user_id
  is 'RESP_USER_ID';
comment on column FDC_FOLLOWUP.doer_user_id
  is 'DOER_USER_ID';
comment on column FDC_FOLLOWUP.result
  is 'RESULT';
create index FDC_FOLLOWUP_IF1 on FDC_FOLLOWUP (OBJECT_ID);
create index FDC_FOLLOWUP_IF2 on FDC_FOLLOWUP (RESP_USER_ID);
create index FDC_FOLLOWUP_IF3 on FDC_FOLLOWUP (DOER_USER_ID);
alter table FDC_FOLLOWUP
  add constraint FDC_FOLLOWUP_PK primary key (ID);
alter table FDC_FOLLOWUP
  add constraint FOLLOWUP_DOER_USER_ID foreign key (DOER_USER_ID)
  references FDC_USER (ID);
alter table FDC_FOLLOWUP
  add constraint FOLLOWUP_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_FOLLOWUP
  add constraint FOLLOWUP_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_FOLLOWUP
  add constraint FOLLOWUP_RESP_USER_ID foreign key (RESP_USER_ID)
  references FDC_USER (ID);

prompt
prompt Creating table FDC_GOODS_CHARGE
prompt ===============================
prompt
create table FDC_GOODS_CHARGE
(
  id               NUMBER(15) not null,
  decl_goods_id    NUMBER(15) not null,
  pay_type_id      NUMBER(15) not null,
  pay_mode_id      NUMBER(15) not null,
  summa            NUMBER(22,2),
  currency_id      NUMBER(15) not null,
  change_desc      VARCHAR2(2000),
  change_date      DATE,
  date_begin       DATE,
  date_end         DATE,
  mode_id          NUMBER(15),
  prolong_id       NUMBER(15),
  change_reason_id NUMBER(15)
)
;
comment on table FDC_GOODS_CHARGE
  is '������� FDC_GOODS_CHARGE';
comment on column FDC_GOODS_CHARGE.id
  is '������������� ����������';
comment on column FDC_GOODS_CHARGE.decl_goods_id
  is '����� �� ���';
comment on column FDC_GOODS_CHARGE.pay_type_id
  is '��� �������';
comment on column FDC_GOODS_CHARGE.pay_mode_id
  is '������ �������';
comment on column FDC_GOODS_CHARGE.summa
  is '����� �������';
comment on column FDC_GOODS_CHARGE.currency_id
  is '������ �������';
comment on column FDC_GOODS_CHARGE.change_desc
  is 'CHANGE_DESC';
comment on column FDC_GOODS_CHARGE.change_date
  is 'CHANGE_DATE';
comment on column FDC_GOODS_CHARGE.date_begin
  is '���� ������ ��������';
comment on column FDC_GOODS_CHARGE.date_end
  is '���� ��������� ��������';
comment on column FDC_GOODS_CHARGE.mode_id
  is '���������� �����';
comment on column FDC_GOODS_CHARGE.prolong_id
  is 'PROLONG_ID';
comment on column FDC_GOODS_CHARGE.change_reason_id
  is 'CHANGE_REASON_ID';
create index FDC_GOODS_CHARGE_IE9 on FDC_GOODS_CHARGE (DECL_GOODS_ID, PAY_TYPE_ID, PAY_MODE_ID, CURRENCY_ID, DATE_BEGIN, DATE_END, MODE_ID, PROLONG_ID);
create index FDC_GOODS_CHARGE_IF1 on FDC_GOODS_CHARGE (DECL_GOODS_ID);
create index FDC_GOODS_CHARGE_IF3 on FDC_GOODS_CHARGE (PAY_TYPE_ID);
create index FDC_GOODS_CHARGE_IF4 on FDC_GOODS_CHARGE (PAY_MODE_ID);
create index FDC_GOODS_CHARGE_IF5 on FDC_GOODS_CHARGE (CURRENCY_ID);
create index FDC_GOODS_CHARGE_IF6 on FDC_GOODS_CHARGE (MODE_ID);
create index FDC_GOODS_CHARGE_IF7 on FDC_GOODS_CHARGE (PROLONG_ID);
create index FDC_GOODS_CHARGE_IF8 on FDC_GOODS_CHARGE (CHANGE_REASON_ID);
alter table FDC_GOODS_CHARGE
  add constraint FDC_GOODS_CHARGE_PK primary key (ID);
alter table FDC_GOODS_CHARGE
  add constraint FK#FDC_GOODS_CHARGE#PROLONG_ID foreign key (PROLONG_ID)
  references FDC_DECL_PERIOD_PROLONG (ID) on delete cascade;
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_CHANGE_REASON_ID foreign key (CHANGE_REASON_ID)
  references FDC_DICT (ID);
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_DECL_GOODS_ID foreign key (DECL_GOODS_ID)
  references FDC_DECL_GOODS (ID) on delete cascade;
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_MODE_ID foreign key (MODE_ID)
  references FDC_DICT (ID);
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_PAY_MODE_ID foreign key (PAY_MODE_ID)
  references FDC_DICT (ID);
alter table FDC_GOODS_CHARGE
  add constraint GOODS_CHARGE_PAY_TYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_GOODS_HIST
prompt =============================
prompt
create table FDC_GOODS_HIST
(
  goods_id    INTEGER not null,
  goods_count NUMBER(26,6) not null,
  change_date DATE not null
)
;
comment on table FDC_GOODS_HIST
  is '������� FDC_GOODS_HIST';
comment on column FDC_GOODS_HIST.goods_id
  is '������ �� �����';
comment on column FDC_GOODS_HIST.goods_count
  is '��������� ����������';
comment on column FDC_GOODS_HIST.change_date
  is '���� ���������';
create index GOODS_HIST2GOODS_FDC on FDC_GOODS_HIST (GOODS_ID);
alter table FDC_GOODS_HIST
  add constraint PK_GOODS_HIST primary key (GOODS_ID, CHANGE_DATE)
  disable
  novalidate;
alter table FDC_GOODS_HIST
  add constraint GOODS_HIST2GOODS foreign key (GOODS_ID)
  references FDC_DECL_GOODS (ID) on delete cascade;

prompt
prompt Creating table FDC_GROUNDS_REMOVE_DEBTS
prompt =======================================
prompt
create table FDC_GROUNDS_REMOVE_DEBTS
(
  id             NUMBER(15) not null,
  exclusion_code VARCHAR2(3),
  exclusion_name VARCHAR2(1200)
)
;
comment on table FDC_GROUNDS_REMOVE_DEBTS
  is '��������� ��� ���������� �������������';
comment on column FDC_GROUNDS_REMOVE_DEBTS.id
  is '������������� �������';
comment on column FDC_GROUNDS_REMOVE_DEBTS.exclusion_code
  is '��� ��������� ����������';
comment on column FDC_GROUNDS_REMOVE_DEBTS.exclusion_name
  is '������������ ��������� ����������';
alter table FDC_GROUNDS_REMOVE_DEBTS
  add constraint FDC#PK#GROUNDS_REMOVE_DEBTS_ID primary key (ID);
alter table FDC_GROUNDS_REMOVE_DEBTS
  add constraint FDC#FK#GR_REMOVE_DEBTS_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_GROUNDS_REMOVE_FINES
prompt =======================================
prompt
create table FDC_GROUNDS_REMOVE_FINES
(
  id      NUMBER(15) not null,
  decl_id NUMBER(15)
)
;
comment on table FDC_GROUNDS_REMOVE_FINES
  is '��������� ��� ������';
comment on column FDC_GROUNDS_REMOVE_FINES.id
  is '������������� �������';
comment on column FDC_GROUNDS_REMOVE_FINES.decl_id
  is '������������� ��������� ����������';
alter table FDC_GROUNDS_REMOVE_FINES
  add constraint FDC#PK#GROUNDS_REMOVE_ID primary key (ID);
alter table FDC_GROUNDS_REMOVE_FINES
  add constraint FDC#FK#GR_REMOVE_FINES_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_INITIAL_REST
prompt ===============================
prompt
create table FDC_INITIAL_REST
(
  id              NUMBER(15) not null,
  account_id      NUMBER(15) not null,
  account_from_id NUMBER(15) not null,
  date_rest       DATE not null
)
;
comment on table FDC_INITIAL_REST
  is '��������� ������� �� ������ ������������ �������';
comment on column FDC_INITIAL_REST.id
  is '������������� �������';
comment on column FDC_INITIAL_REST.account_id
  is '������������� �����';
comment on column FDC_INITIAL_REST.account_from_id
  is '������������� ������� �����';
comment on column FDC_INITIAL_REST.date_rest
  is '���� ��������';
create unique index FDC#AK#INITIAL_REST on FDC_INITIAL_REST (DATE_REST, ACCOUNT_FROM_ID, ACCOUNT_ID);
create index FDC#AK#INITIAL_REST_FROM on FDC_INITIAL_REST (ACCOUNT_FROM_ID);
create index FDC#FK#REST_ACCOUNT_FDC on FDC_INITIAL_REST (ACCOUNT_ID);
alter table FDC_INITIAL_REST
  add constraint FDC#PK#INITIAL_REST primary key (ID);
alter table FDC_INITIAL_REST
  add constraint FDC#FK#INITIAL_REST_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_INITIAL_REST
  add constraint FDC#FK#REST_ACCOUNT foreign key (ACCOUNT_ID)
  references FDC_ACC (ID);
alter table FDC_INITIAL_REST
  add constraint FDC#FK#REST_ACCOUNT_FROM foreign key (ACCOUNT_FROM_ID)
  references FDC_ACC (ID);

prompt
prompt Creating table FDC_INTERACT_ADMPKZI
prompt ===================================
prompt
create table FDC_INTERACT_ADMPKZI
(
  id NUMBER(15) not null,
  constraint FDC#PK#INTERACT_ADMPKZI primary key (ID)
)
organization index;
comment on table FDC_INTERACT_ADMPKZI
  is '����� ��� ������ ������� ��� �������������� � ��� "����������������� ������������� � ���� �������" (�� ������)';
comment on column FDC_INTERACT_ADMPKZI.id
  is '������������� ������ ��� ������ ������� ��� �������������� � ��� "����������������� ������������� � ���� �������" (�� ������)';
alter table FDC_INTERACT_ADMPKZI
  add constraint FDC#FK#INTERACT_ADMPKZI#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_ASPAVIS
prompt ===================================
prompt
create table FDC_INTERACT_ASPAVIS
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_ASPAVIS
  is '����� ��� ������ ������� ��� �������������� � �� �����';
comment on column FDC_INTERACT_ASPAVIS.id
  is '������������� ������ ��� ������ ������� ��� �������������� � �� �����';
alter table FDC_INTERACT_ASPAVIS
  add constraint FDC#PK#INTERACT_ASPAVIS primary key (ID);
alter table FDC_INTERACT_ASPAVIS
  add constraint FDC#FK#INTERACT_ASPAVIS#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID);

prompt
prompt Creating table FDC_INTERACT_CASH
prompt ================================
prompt
create table FDC_INTERACT_CASH
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_CASH
  is '����� ��� ������ ������� ��� �������������� � ���������� �������';
comment on column FDC_INTERACT_CASH.id
  is '������������� ������ ��� ������ ������� ��� �������������� � ���������� �������';
alter table FDC_INTERACT_CASH
  add constraint FDC#PK#INTERACT_CASH primary key (ID);
alter table FDC_INTERACT_CASH
  add constraint FDC#FK#INTERACT_CASH#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID);

prompt
prompt Creating table FDC_INTERACT_CIA
prompt ===============================
prompt
create table FDC_INTERACT_CIA
(
  id NUMBER(15) not null,
  constraint FDC#PK#INTERACT_CIA primary key (ID)
)
organization index;
comment on table FDC_INTERACT_CIA
  is '����� ��� ������ ������� ��� �������������� � AC �����';
comment on column FDC_INTERACT_CIA.id
  is '������������� ������ ��� ������ ������� ��� �������������� � AC �����';
alter table FDC_INTERACT_CIA
  add constraint FDC#FK#INTERACT_CIA#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_DEBTS
prompt =================================
prompt
create table FDC_INTERACT_DEBTS
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_DEBTS
  is '�������� ��� ������ ������� ��� �������������� � ��� �������������';
comment on column FDC_INTERACT_DEBTS.id
  is '������������� �������';
alter table FDC_INTERACT_DEBTS
  add constraint FDC#PK#INTERACT_DEBTS primary key (ID);
alter table FDC_INTERACT_DEBTS
  add constraint FDC#FK#INTERACT_DEBTS_ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_FINES
prompt =================================
prompt
create table FDC_INTERACT_FINES
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_FINES
  is '�������� ��� ������ ������� ��� �������������� � ��� ������';
comment on column FDC_INTERACT_FINES.id
  is '������������� �������';
alter table FDC_INTERACT_FINES
  add constraint FDC#PK#INTERACT_FINES primary key (ID);
alter table FDC_INTERACT_FINES
  add constraint FDC#FK#INTERACT_FINES_ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_KTC
prompt ===============================
prompt
create table FDC_INTERACT_KTC
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_KTC
  is '�������� ��� ������ ������� ��� �������������� � ��� ���������-1';
comment on column FDC_INTERACT_KTC.id
  is '������������� �������';
alter table FDC_INTERACT_KTC
  add constraint FDC#PK#INTERACT_KTC primary key (ID);
alter table FDC_INTERACT_KTC
  add constraint FDC#FK#INTERACT_KTC_ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_PRIVILEGE
prompt =====================================
prompt
create table FDC_INTERACT_PRIVILEGE
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_PRIVILEGE
  is '�������� ��� ������ ������� ��� �������������� � ��� �������������';
comment on column FDC_INTERACT_PRIVILEGE.id
  is '������������� �������';
alter table FDC_INTERACT_PRIVILEGE
  add constraint FDC#PK#INTERACT_PRIVILEGE primary key (ID);
alter table FDC_INTERACT_PRIVILEGE
  add constraint FDC#FK#INTERACT_PRIVILEGE_ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID) on delete cascade;

prompt
prompt Creating table FDC_INTERACT_PROVISION
prompt =====================================
prompt
create table FDC_INTERACT_PROVISION
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_PROVISION
  is '����� ��� ������ ������� ��� �������������� � �� �����������';
comment on column FDC_INTERACT_PROVISION.id
  is '������������� ������ ��� ������ ������� ��� �������������� � �� �����������';
alter table FDC_INTERACT_PROVISION
  add constraint FDC#PK#INTERACT_PROVISION primary key (ID);
alter table FDC_INTERACT_PROVISION
  add constraint FDC#FK#INTERACT_PROVISION#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID);

prompt
prompt Creating table FDC_INTERACT_PSDATA
prompt ==================================
prompt
create table FDC_INTERACT_PSDATA
(
  id NUMBER(15) not null
)
;
comment on table FDC_INTERACT_PSDATA
  is '����� ��� ������ ������� ��� �������������� � �������������� ������� ��������� ����';
comment on column FDC_INTERACT_PSDATA.id
  is '������������� ������ ��� ������ ������� ��� �������������� � �������������� ������� ��������� ����';
alter table FDC_INTERACT_PSDATA
  add constraint FDC#PK#INTERACT_PSDATA primary key (ID);
alter table FDC_INTERACT_PSDATA
  add constraint FDC#FK#INTERACT_PSDATA#ID foreign key (ID)
  references FDC_DOC_PACK_INTERACTION (ID);

prompt
prompt Creating table FDC_KIND
prompt =======================
prompt
create table FDC_KIND
(
  id   NUMBER(15) not null,
  rate NUMBER(15) default 0 not null,
  icon VARCHAR2(4000)
)
;
comment on table FDC_KIND
  is '��������������, ������� ����� �������� �������. �������� ����� �������������� ��� �������� ��������. �������: ���������, ������������� � ����������, �������� � �.�. ������������ ������� �������������� �� ������ �������� ����� �������.';
comment on column FDC_KIND.id
  is 'ID';
comment on column FDC_KIND.rate
  is 'RATE';
comment on column FDC_KIND.icon
  is 'ICON';
alter table FDC_KIND
  add constraint FDC_KIND_PK primary key (ID);
alter table FDC_KIND
  add constraint KIND_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_KIND_TYPE
prompt ============================
prompt
create table FDC_KIND_TYPE
(
  object_type_id NUMBER(15) not null,
  kind_id        NUMBER(15) not null
)
;
comment on table FDC_KIND_TYPE
  is '������� FDC_KIND_TYPE';
comment on column FDC_KIND_TYPE.object_type_id
  is 'OBJECT_TYPE_ID';
comment on column FDC_KIND_TYPE.kind_id
  is 'KIND_ID';
create index FDC_KIND_TYPE_IF1 on FDC_KIND_TYPE (OBJECT_TYPE_ID);
create index FDC_KIND_TYPE_IF2 on FDC_KIND_TYPE (KIND_ID);
alter table FDC_KIND_TYPE
  add constraint FDC_KIND_TYPE_PK primary key (OBJECT_TYPE_ID, KIND_ID);
alter table FDC_KIND_TYPE
  add constraint KIND_TYPE_KIND_ID foreign key (KIND_ID)
  references FDC_KIND (ID);
alter table FDC_KIND_TYPE
  add constraint KIND_TYPE_OBJECT_TYPE_ID foreign key (OBJECT_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_LOG_TABLE
prompt ============================
prompt
create table FDC_LOG_TABLE
(
  id         NUMBER not null,
  table_name VARCHAR2(32) not null
)
;
comment on table FDC_LOG_TABLE
  is '������� FDC_LOG_TABLE';
comment on column FDC_LOG_TABLE.id
  is 'ID';
comment on column FDC_LOG_TABLE.table_name
  is 'TABLE_NAME';
alter table FDC_LOG_TABLE
  add constraint PK_LOG_TABLE primary key (ID);
alter table FDC_LOG_TABLE
  add constraint UQ_LOG_TABLE unique (TABLE_NAME);

prompt
prompt Creating table FDC_LOG_COLUMN
prompt =============================
prompt
create table FDC_LOG_COLUMN
(
  id          NUMBER not null,
  table_id    NUMBER not null,
  column_name VARCHAR2(32) not null
)
;
comment on table FDC_LOG_COLUMN
  is '������� FDC_LOG_COLUMN';
comment on column FDC_LOG_COLUMN.id
  is 'ID';
comment on column FDC_LOG_COLUMN.table_id
  is 'TABLE_ID';
comment on column FDC_LOG_COLUMN.column_name
  is 'COLUMN_NAME';
alter table FDC_LOG_COLUMN
  add constraint PK_LOG_COLUMN primary key (ID);
alter table FDC_LOG_COLUMN
  add constraint UQ_LOG_COLUMN unique (TABLE_ID, COLUMN_NAME);
alter table FDC_LOG_COLUMN
  add constraint FK_LOG_COLUMN_TABLE foreign key (TABLE_ID)
  references FDC_LOG_TABLE (ID) on delete cascade;

prompt
prompt Creating table FDC_LOG_REACTIVATE_DOC
prompt =====================================
prompt
create table FDC_LOG_REACTIVATE_DOC
(
  doc_id              NUMBER not null,
  moment              DATE default sysdate not null,
  old_activation_date DATE,
  new_activation_date DATE
)
;
comment on table FDC_LOG_REACTIVATE_DOC
  is '��� �������������� ����������';
comment on column FDC_LOG_REACTIVATE_DOC.doc_id
  is 'DOC_ID';
comment on column FDC_LOG_REACTIVATE_DOC.moment
  is 'MOMENT';
comment on column FDC_LOG_REACTIVATE_DOC.old_activation_date
  is 'OLD_ACTIVATION_DATE';
comment on column FDC_LOG_REACTIVATE_DOC.new_activation_date
  is 'NEW_ACTIVATION_DATE';
alter table FDC_LOG_REACTIVATE_DOC
  add constraint FDC#LOG#REACTIVATE#DOC#PK primary key (DOC_ID, MOMENT);

prompt
prompt Creating table FDC_NOTICEPAY_DED_RESERV
prompt =======================================
prompt
create table FDC_NOTICEPAY_DED_RESERV
(
  decl_id        NUMBER(15) not null,
  payment_id     NUMBER(15) not null,
  pay_type_id    NUMBER(15) not null,
  charge_curr_id NUMBER(15) not null,
  charge_summa   NUMBER(24,4),
  charge_id      NUMBER(15),
  kbkcode_id     NUMBER(15) not null,
  kbkcode1_id    NUMBER(15) not null,
  summa          NUMBER(24,4) not null,
  notice_id      NUMBER(15) not null,
  decision_id    NUMBER(15) not null
)
;
comment on table FDC_NOTICEPAY_DED_RESERV
  is '��������������� ������������� �� ����� ������� ����� ���������� �������������';
comment on column FDC_NOTICEPAY_DED_RESERV.decl_id
  is '�������� ����������';
comment on column FDC_NOTICEPAY_DED_RESERV.payment_id
  is '�������� ��������';
comment on column FDC_NOTICEPAY_DED_RESERV.pay_type_id
  is '��� �������';
comment on column FDC_NOTICEPAY_DED_RESERV.charge_curr_id
  is '������ ����������';
comment on column FDC_NOTICEPAY_DED_RESERV.charge_summa
  is '����� ����������';
comment on column FDC_NOTICEPAY_DED_RESERV.charge_id
  is '������������ ����������';
comment on column FDC_NOTICEPAY_DED_RESERV.kbkcode_id
  is '��� ����������';
comment on column FDC_NOTICEPAY_DED_RESERV.kbkcode1_id
  is '��� ��������� ���������';
comment on column FDC_NOTICEPAY_DED_RESERV.summa
  is '����� ��������';
comment on column FDC_NOTICEPAY_DED_RESERV.notice_id
  is '���������� �� ������';
comment on column FDC_NOTICEPAY_DED_RESERV.decision_id
  is '������� � ������ � ���� ��������� �������������';
create index FDC#IDX#NOTICE_DED_RES#CHARGE on FDC_NOTICEPAY_DED_RESERV (CHARGE_ID);
create index FDC#IDX#NOTICE_DED_RES#CH_CURR on FDC_NOTICEPAY_DED_RESERV (CHARGE_CURR_ID);
create index FDC#IDX#NOTICE_DED_RES#DECIS on FDC_NOTICEPAY_DED_RESERV (DECISION_ID);
create index FDC#IDX#NOTICE_DED_RES#KBK on FDC_NOTICEPAY_DED_RESERV (KBKCODE_ID);
create index FDC#IDX#NOTICE_DED_RES#KBK1 on FDC_NOTICEPAY_DED_RESERV (KBKCODE1_ID);
create index FDC#IDX#NOTICE_DED_RES#NOTICE on FDC_NOTICEPAY_DED_RESERV (NOTICE_ID);
create index FDC#IDX#NOTICE_DED_RES#PAYMENT on FDC_NOTICEPAY_DED_RESERV (PAYMENT_ID);
create index FDC#IDX#NOTICE_DED_RES#PAYTYPE on FDC_NOTICEPAY_DED_RESERV (PAY_TYPE_ID);
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#PK#NOTICE_DED_RESERV unique (DECL_ID, PAYMENT_ID, PAY_TYPE_ID, KBKCODE1_ID, CHARGE_CURR_ID, NOTICE_ID, DECISION_ID, CHARGE_ID);
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#CH foreign key (CHARGE_ID)
  references FDC_DECL_CHARGE (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#CUR foreign key (CHARGE_CURR_ID)
  references FDC_NSI_CURRENCY (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#DC foreign key (DECL_ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#DEC foreign key (DECISION_ID)
  references FDC_DECISION_DEBTS (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#KBK foreign key (KBKCODE_ID)
  references FDC_DICT (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#KBK1 foreign key (KBKCODE1_ID)
  references FDC_DICT (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#NP foreign key (NOTICE_ID)
  references FDC_NOTICEPAY (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#PAY foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;
alter table FDC_NOTICEPAY_DED_RESERV
  add constraint FDC#FK#NOTICE_DED_RES#PT foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_CURR_RATE
prompt ================================
prompt
create table FDC_NSI_CURR_RATE
(
  id          NUMBER(15) not null,
  curr_id     NUMBER(15) not null,
  mult        NUMBER(9) default 1 not null,
  change_rate NUMBER(11,4) not null,
  back_rate   NUMBER(11,4) default 0 not null,
  rate_date   DATE default SYSDATE not null,
  buk         VARCHAR2(3)
)
;
comment on table FDC_NSI_CURR_RATE
  is '������� FDC_NSI_CURR_RATE';
comment on column FDC_NSI_CURR_RATE.id
  is 'ID';
comment on column FDC_NSI_CURR_RATE.curr_id
  is 'CURR_ID';
comment on column FDC_NSI_CURR_RATE.mult
  is 'MULT';
comment on column FDC_NSI_CURR_RATE.change_rate
  is 'CHANGE_RATE';
comment on column FDC_NSI_CURR_RATE.back_rate
  is 'BACK_RATE';
comment on column FDC_NSI_CURR_RATE.rate_date
  is 'RATE_DATE';
comment on column FDC_NSI_CURR_RATE.buk
  is 'BUK';
create index FDC_NSI_CURR_RATE_IF1 on FDC_NSI_CURR_RATE (CURR_ID);
alter table FDC_NSI_CURR_RATE
  add constraint FDC_NSI_CURR_RATE_PK primary key (ID);
alter table FDC_NSI_CURR_RATE
  add constraint CURR_RATE_ON_DATE unique (CURR_ID, RATE_DATE);
alter table FDC_NSI_CURR_RATE
  add constraint NSI_CURR_RATE_CURR_ID foreign key (CURR_ID)
  references FDC_NSI_CURRENCY (ID) on delete cascade;
alter table FDC_NSI_CURR_RATE
  add constraint NSI_CURR_RATE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_DECLARANT_ELS
prompt ====================================
prompt
create table FDC_NSI_DECLARANT_ELS
(
  id         NUMBER(15) not null,
  name       VARCHAR2(4000),
  inn        VARCHAR2(12),
  date_begin DATE,
  date_end   DATE,
  note       VARCHAR2(4000)
)
;
comment on table FDC_NSI_DECLARANT_ELS
  is '��������� ��� � ���';
comment on column FDC_NSI_DECLARANT_ELS.id
  is 'ID';
comment on column FDC_NSI_DECLARANT_ELS.name
  is 'NAME';
comment on column FDC_NSI_DECLARANT_ELS.inn
  is 'INN';
comment on column FDC_NSI_DECLARANT_ELS.date_begin
  is '���� �������� �� ���';
comment on column FDC_NSI_DECLARANT_ELS.date_end
  is '���� ������ �� ���';
comment on column FDC_NSI_DECLARANT_ELS.note
  is '����������';
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_PK primary key (ID);
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_AK1 unique (INN, DATE_BEGIN, DATE_END);
alter table FDC_NSI_DECLARANT_ELS
  add constraint FDC_NSI_DECLARANT_ELS_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_REFINANCING_RATE
prompt =======================================
prompt
create table FDC_NSI_REFINANCING_RATE
(
  id               NUMBER(15) not null,
  rate_date        DATE not null,
  refinancing_rate NUMBER(22,2) not null
)
;
comment on table FDC_NSI_REFINANCING_RATE
  is '������� FDC_NSI_REFINANCING_RATE';
comment on column FDC_NSI_REFINANCING_RATE.id
  is 'ID';
comment on column FDC_NSI_REFINANCING_RATE.rate_date
  is 'RATE_DATE';
comment on column FDC_NSI_REFINANCING_RATE.refinancing_rate
  is 'REFINANCING_RATE';
alter table FDC_NSI_REFINANCING_RATE
  add constraint FDC_NSI_REFINANCING_RATE_PK primary key (ID);
alter table FDC_NSI_REFINANCING_RATE
  add constraint REFINANCING_RATE_ON_DATE unique (RATE_DATE);
alter table FDC_NSI_REFINANCING_RATE
  add constraint REFINANCING_RATE_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_REPORT
prompt =============================
prompt
create table FDC_NSI_REPORT
(
  id            NUMBER not null,
  template_name VARCHAR2(400),
  evt_type      VARCHAR2(3),
  evt_code      VARCHAR2(5)
)
;
comment on table FDC_NSI_REPORT
  is '������� FDC_NSI_REPORT';
comment on column FDC_NSI_REPORT.id
  is 'ID';
comment on column FDC_NSI_REPORT.template_name
  is '��� �������. ����� ������ XLS � SQL ������� ����������� ����������� ����� ����������';
comment on column FDC_NSI_REPORT.evt_type
  is '��� ��������������� ������� ��� ������ ������';
comment on column FDC_NSI_REPORT.evt_code
  is '��� ��������������� ������� ��� ������ ������';
alter table FDC_NSI_REPORT
  add constraint FDC_NSI_REPORT_PK primary key (ID);
alter table FDC_NSI_REPORT
  add constraint NSI_REPORT_ID foreign key (ID)
  references FDC_NSI_DICT (ID) on delete cascade;

prompt
prompt Creating table FDC_NSI_SUBJECT_PAYS
prompt ===================================
prompt
create table FDC_NSI_SUBJECT_PAYS
(
  id         NUMBER(15) not null,
  subject_id NUMBER(15)
)
;
comment on table FDC_NSI_SUBJECT_PAYS
  is '������� FDC_NSI_SUBJECT_PAYS';
comment on column FDC_NSI_SUBJECT_PAYS.id
  is 'ID';
comment on column FDC_NSI_SUBJECT_PAYS.subject_id
  is 'SUBJECT_ID';
alter table FDC_NSI_SUBJECT_PAYS
  add constraint XPKFDC_SUBJECT_PAYS primary key (ID);
alter table FDC_NSI_SUBJECT_PAYS
  add constraint UKFDC_SUBJECT_PAYS unique (SUBJECT_ID);
alter table FDC_NSI_SUBJECT_PAYS
  add constraint FDC#FK#SUB_PAYS_IS_DICT_NSI foreign key (ID)
  references FDC_NSI_DICT (ID) on delete cascade;
alter table FDC_NSI_SUBJECT_PAYS
  add constraint FDC#FK#SUB_PAYS_SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_OBJECT_KIND
prompt ==============================
prompt
create table FDC_OBJECT_KIND
(
  id          NUMBER(15) not null,
  kind_id     NUMBER(15) not null,
  evidence_id NUMBER(15) not null
)
;
comment on table FDC_OBJECT_KIND
  is '��������������,  ������ ������������� �������. ������ ��������� �� �����������. ������������ ����� ������� �������� (������������� ����), ��������� �� �������� � �.�.';
comment on column FDC_OBJECT_KIND.id
  is 'ID';
comment on column FDC_OBJECT_KIND.kind_id
  is 'KIND_ID';
comment on column FDC_OBJECT_KIND.evidence_id
  is 'EVIDENCE_ID';
create index FDC_OBJECT_KIND_IF1 on FDC_OBJECT_KIND (KIND_ID);
create index FDC_OBJECT_KIND_IF2 on FDC_OBJECT_KIND (EVIDENCE_ID);
alter table FDC_OBJECT_KIND
  add constraint FDC_OBJECT_KIND_PK primary key (ID);
alter table FDC_OBJECT_KIND
  add constraint OBJECT_KIND_EVIDENCE_ID foreign key (EVIDENCE_ID)
  references FDC_OBJECT (ID);
alter table FDC_OBJECT_KIND
  add constraint OBJECT_KIND_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_OBJECT_KIND
  add constraint OBJECT_KIND_KIND_ID foreign key (KIND_ID)
  references FDC_KIND (ID);

prompt
prompt Creating table FDC_OBJECT_RELATION
prompt ==================================
prompt
create table FDC_OBJECT_RELATION
(
  id            NUMBER(15) not null,
  object_id     NUMBER(15) not null,
  rel_object_id NUMBER(15) not null,
  role          VARCHAR2(1500),
  backwardrole  VARCHAR2(1500)
)
;
comment on table FDC_OBJECT_RELATION
  is '���������� ��������� �������� ����� �����. ������� ����������� ��� ���������.';
comment on column FDC_OBJECT_RELATION.id
  is 'ID';
comment on column FDC_OBJECT_RELATION.object_id
  is 'OBJECT_ID';
comment on column FDC_OBJECT_RELATION.rel_object_id
  is 'REL_OBJECT_ID';
comment on column FDC_OBJECT_RELATION.role
  is 'ROLE';
comment on column FDC_OBJECT_RELATION.backwardrole
  is 'BACKWARDROLE';
create index FDC_OBJECT_RELATION_IF1 on FDC_OBJECT_RELATION (OBJECT_ID);
create index FDC_OBJECT_RELATION_IF2 on FDC_OBJECT_RELATION (REL_OBJECT_ID);
alter table FDC_OBJECT_RELATION
  add constraint FDC_OBJECT_RELATION_PK primary key (ID);
alter table FDC_OBJECT_RELATION
  add constraint OBJECT_RELATION_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_OBJECT_RELATION
  add constraint OBJECT_RELATION_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_OBJECT_RELATION
  add constraint OBJECT_RELATION_REL_OBJECT_ID foreign key (REL_OBJECT_ID)
  references FDC_OBJECT (ID);

prompt
prompt Creating table FDC_OBJ_KIND
prompt ===========================
prompt
create table FDC_OBJ_KIND
(
  kind_id       NUMBER(22) not null,
  object_id     NUMBER(22) not null,
  date_set      DATE default sysdate not null,
  date_cancel   DATE,
  descript      VARCHAR2(2000),
  ref_id        NUMBER(22),
  reason_set    VARCHAR2(1000),
  reason_cancel VARCHAR2(1000)
)
;
comment on table FDC_OBJ_KIND
  is '�������  ��������';
comment on column FDC_OBJ_KIND.kind_id
  is '�������';
comment on column FDC_OBJ_KIND.object_id
  is '������ - ��������';
comment on column FDC_OBJ_KIND.date_set
  is '���� ����������';
comment on column FDC_OBJ_KIND.date_cancel
  is '���� ������';
comment on column FDC_OBJ_KIND.descript
  is '��������';
comment on column FDC_OBJ_KIND.ref_id
  is '������ �� ���. ����������';
comment on column FDC_OBJ_KIND.reason_set
  is 'REASON_SET';
comment on column FDC_OBJ_KIND.reason_cancel
  is 'REASON_CANCEL';
create index FDC#IDX#KIND#OBJ_KIND_DATE on FDC_OBJ_KIND (OBJECT_ID, KIND_ID, DATE_CANCEL);
create index OBJ_KIND_KIND_ID_FDC on FDC_OBJ_KIND (KIND_ID);
create index OBJ_KIND_OBJECT_ID_INDX on FDC_OBJ_KIND (OBJECT_ID);
alter table FDC_OBJ_KIND
  add constraint OBJ_KIND_KIND_ID foreign key (KIND_ID)
  references FDC_KIND (ID);
alter table FDC_OBJ_KIND
  add constraint OBJ_KIND_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_OTHERS_CHARGE
prompt ================================
prompt
create table FDC_OTHERS_CHARGE
(
  id     NUMBER(15) not null,
  act_no VARCHAR2(30)
)
;
comment on table FDC_OTHERS_CHARGE
  is '������� FDC_OTHERS_CHARGE';
comment on column FDC_OTHERS_CHARGE.id
  is 'ID';
comment on column FDC_OTHERS_CHARGE.act_no
  is 'ACT_NO';
alter table FDC_OTHERS_CHARGE
  add constraint XPKFDC_OTHERS_CHARGE primary key (ID);
alter table FDC_OTHERS_CHARGE
  add foreign key (ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYBACK
prompt ==========================
prompt
create table FDC_PAYBACK
(
  id                    NUMBER(15) not null,
  pay_no                VARCHAR2(30),
  send_date             DATE,
  subject_id            NUMBER(15) not null,
  sub_account_id        NUMBER(15),
  currency_id           NUMBER(15) not null,
  receiver_name         VARCHAR2(1500),
  receiver_inn          VARCHAR2(12),
  receiver_kpp          VARCHAR2(10),
  receiver_bank_name    VARCHAR2(1500),
  receiver_bank_bic     VARCHAR2(10),
  receiver_pay_account  VARCHAR2(40),
  receiver_corr_account VARCHAR2(40),
  receiver_subject_id   NUMBER(15),
  receiver_account_id   NUMBER(15),
  confirm_date          DATE
)
;
comment on table FDC_PAYBACK
  is '������� FDC_PAYBACK';
comment on column FDC_PAYBACK.id
  is 'ID';
comment on column FDC_PAYBACK.pay_no
  is 'PAY_NO';
comment on column FDC_PAYBACK.send_date
  is 'SEND_DATE';
comment on column FDC_PAYBACK.subject_id
  is 'SUBJECT_ID';
comment on column FDC_PAYBACK.sub_account_id
  is '������';
comment on column FDC_PAYBACK.currency_id
  is 'CURRENCY_ID';
comment on column FDC_PAYBACK.receiver_name
  is 'RECEIVER_NAME';
comment on column FDC_PAYBACK.receiver_inn
  is 'RECEIVER_INN';
comment on column FDC_PAYBACK.receiver_kpp
  is 'RECEIVER_KPP';
comment on column FDC_PAYBACK.receiver_bank_name
  is 'RECEIVER_BANK_NAME';
comment on column FDC_PAYBACK.receiver_bank_bic
  is 'RECEIVER_BANK_BIC';
comment on column FDC_PAYBACK.receiver_pay_account
  is 'RECEIVER_PAY_ACCOUNT';
comment on column FDC_PAYBACK.receiver_corr_account
  is 'RECEIVER_CORR_ACCOUNT';
comment on column FDC_PAYBACK.receiver_subject_id
  is 'RECEIVER_SUBJECT_ID';
comment on column FDC_PAYBACK.receiver_account_id
  is 'RECEIVER_ACCOUNT_ID';
comment on column FDC_PAYBACK.confirm_date
  is '���� �������������';
create index FDC_PAYBACK_IF1 on FDC_PAYBACK (SUBJECT_ID);
create index FDC_PAYBACK_IF2 on FDC_PAYBACK (SUB_ACCOUNT_ID);
create index FDC_PAYBACK_IF4 on FDC_PAYBACK (CURRENCY_ID);
alter table FDC_PAYBACK
  add constraint FDC_PAYBACK_PK primary key (ID);
alter table FDC_PAYBACK
  add constraint FDC#FK#PAYBACK_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_PAYBACK
  add constraint PAYBACK_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_PAYBACK
  add constraint PAYBACK_SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID);
alter table FDC_PAYBACK
  add constraint PAYBACK_SUB_ACCOUNT_ID foreign key (SUB_ACCOUNT_ID)
  references FDC_DECLARANT_ACCOUNT (ID);

prompt
prompt Creating table FDC_PAYMENT_DEDUCT_CNFRM
prompt =======================================
prompt
create table FDC_PAYMENT_DEDUCT_CNFRM
(
  id                     NUMBER(15) not null,
  confirmed_deduction_id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_DEDUCT_CNFRM
  is '�������������� ��������.';
comment on column FDC_PAYMENT_DEDUCT_CNFRM.id
  is '������������� �������';
comment on column FDC_PAYMENT_DEDUCT_CNFRM.confirmed_deduction_id
  is '������������� ��������';
create unique index FDC#AK#PAYMENT_DEDUCT_CNFRM on FDC_PAYMENT_DEDUCT_CNFRM (CONFIRMED_DEDUCTION_ID);
alter table FDC_PAYMENT_DEDUCT_CNFRM
  add constraint FDC#PK#PAYMENT_DEDUCT_CNFRM primary key (ID);
alter table FDC_PAYMENT_DEDUCT_CNFRM
  add constraint FDC#FK#DEDUCT_CNFRM#DEDUCT foreign key (CONFIRMED_DEDUCTION_ID)
  references FDC_PAYMENT_DEDUCTION (ID);
alter table FDC_PAYMENT_DEDUCT_CNFRM
  add constraint FDC#FK#DEDUCT_CNFRM_IS_DEDUCT foreign key (ID)
  references FDC_PAYMENT_DEDUCTION (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_FOR
prompt ==============================
prompt
create table FDC_PAYMENT_FOR
(
  id           NUMBER(15) not null,
  payment_id   NUMBER(15),
  subject_id   NUMBER(15),
  summa        NUMBER(22,2),
  doc_date     DATE,
  doc_no       VARCHAR2(20),
  doc_name     VARCHAR2(500),
  subject_inn  VARCHAR2(12),
  subject_kpp  VARCHAR2(10),
  subject_name VARCHAR2(70)
)
;
comment on table FDC_PAYMENT_FOR
  is '������� ������� �� ������� ���� ������� ��������� ���';
comment on column FDC_PAYMENT_FOR.id
  is '������������� �������';
comment on column FDC_PAYMENT_FOR.payment_id
  is '������������� �������';
comment on column FDC_PAYMENT_FOR.subject_id
  is '������������� �������';
comment on column FDC_PAYMENT_FOR.summa
  is '�����';
comment on column FDC_PAYMENT_FOR.doc_date
  is '���� ���������';
comment on column FDC_PAYMENT_FOR.doc_no
  is '����� ���������';
comment on column FDC_PAYMENT_FOR.doc_name
  is '������������ ���������';
comment on column FDC_PAYMENT_FOR.subject_inn
  is '��� ��������, �� �� �������� ����������� ��������';
comment on column FDC_PAYMENT_FOR.subject_kpp
  is '��� ��������, �� �� �������� ����������� ��������';
comment on column FDC_PAYMENT_FOR.subject_name
  is '������������ ��������, �� �� �������� ����������� ��������';
create index FDC_PAYMENT_FOR_IF1 on FDC_PAYMENT_FOR (PAYMENT_ID);
create index FDC_PAYMENT_FOR_IF2 on FDC_PAYMENT_FOR (SUBJECT_ID);
alter table FDC_PAYMENT_FOR
  add constraint FDC_PAYMENT_FOR_PK primary key (ID);
alter table FDC_PAYMENT_FOR
  add constraint FDC_PAYMENT_FOR_PAYMENT_ID foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;
alter table FDC_PAYMENT_FOR
  add constraint FDC_PAYMENT_FOR_SUBJECT_ID foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete cascade;
alter table FDC_PAYMENT_FOR
  add foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CREDIT
prompt =======================================
prompt
create table FDC_PAYMENT_ORDER_CREDIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_CREDIT
  is '���������� �/�';
comment on column FDC_PAYMENT_ORDER_CREDIT.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_CREDIT
  add constraint FDC#PK#PO_CREDIT primary key (ID);
alter table FDC_PAYMENT_ORDER_CREDIT
  add constraint FDC#FK#POCR_IS_PAYMENT_ORDER foreign key (ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CASHORDER
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_CASHORDER
(
  id          NUMBER(15) not null,
  cashdesk_id NUMBER(15)
)
;
comment on table FDC_PAYMENT_ORDER_CASHORDER
  is '�������� �����';
comment on column FDC_PAYMENT_ORDER_CASHORDER.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_CASHORDER.cashdesk_id
  is '�����';
create index FDC#FKIDX#CASHORDER#CASHDESK on FDC_PAYMENT_ORDER_CASHORDER (CASHDESK_ID);
alter table FDC_PAYMENT_ORDER_CASHORDER
  add constraint FDC#PK#PO_CASHORDER primary key (ID);
alter table FDC_PAYMENT_ORDER_CASHORDER
  add constraint FDC#FK#CASHORDER#CASHDESK foreign key (CASHDESK_ID)
  references FDC_OBJECT (ID) on delete set null;
alter table FDC_PAYMENT_ORDER_CASHORDER
  add constraint FDC#FK#POCO_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_AGGR
prompt =====================================
prompt
create table FDC_PAYMENT_ORDER_AGGR
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_AGGR
  is '��������� ������ �� �����';
comment on column FDC_PAYMENT_ORDER_AGGR.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_AGGR
  add constraint FDC#PK#PO_ORDER_AGGR primary key (ID);
alter table FDC_PAYMENT_ORDER_AGGR
  add constraint FDC#FK#POOA_IS_CASHORD foreign key (ID)
  references FDC_PAYMENT_ORDER_CASHORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_AGREEMENT
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_AGREEMENT
(
  id           NUMBER(15) not null,
  agreement_id NUMBER(15)
)
;
comment on table FDC_PAYMENT_ORDER_AGREEMENT
  is '���������� ������ �� ����������';
comment on column FDC_PAYMENT_ORDER_AGREEMENT.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_AGREEMENT.agreement_id
  is '���������� � ���';
create index FDC#FKIDX#PO_AGREEMENT_ID on FDC_PAYMENT_ORDER_AGREEMENT (AGREEMENT_ID);
alter table FDC_PAYMENT_ORDER_AGREEMENT
  add constraint FDC#PK#PO_AGREEMENT primary key (ID);
alter table FDC_PAYMENT_ORDER_AGREEMENT
  add constraint FDC#FK#POA#AGREEMENT foreign key (AGREEMENT_ID)
  references FDC_BP_AGREEMENT (ID) on delete set null;
alter table FDC_PAYMENT_ORDER_AGREEMENT
  add constraint FDC#FK#POAGREMENT_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_BANKORDER
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_BANKORDER
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_BANKORDER
  is '�������� ����� ����� �����';
comment on column FDC_PAYMENT_ORDER_BANKORDER.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_BANKORDER
  add constraint FDC#PK#PO_BANKORDER primary key (ID);
alter table FDC_PAYMENT_ORDER_BANKORDER
  add constraint FDC#FK#POBO_IS_CASHORD foreign key (ID)
  references FDC_PAYMENT_ORDER_CASHORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_BIGPAYER
prompt =========================================
prompt
create table FDC_PAYMENT_ORDER_BIGPAYER
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_BIGPAYER
  is '������ �������� �����������';
comment on column FDC_PAYMENT_ORDER_BIGPAYER.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_BIGPAYER
  add constraint FDC#PK#PO_BIGPAYER primary key (ID);
alter table FDC_PAYMENT_ORDER_BIGPAYER
  add constraint FDC#FK#POBP_IS_PAYMENT_ORDER foreign key (ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_DEBIT
prompt ======================================
prompt
create table FDC_PAYMENT_ORDER_DEBIT
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_DEBIT
  is '��������� �/�';
comment on column FDC_PAYMENT_ORDER_DEBIT.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_DEBIT
  add constraint FDC#PK#PO_DEBIT primary key (ID);
alter table FDC_PAYMENT_ORDER_DEBIT
  add constraint FDC#FK#PODB_IS_PAYMENT_ORDER foreign key (ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_BUDGET
prompt =======================================
prompt
create table FDC_PAYMENT_ORDER_BUDGET
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_BUDGET
  is '��������� ��������� � ������';
comment on column FDC_PAYMENT_ORDER_BUDGET.id
  is '��� �������';
alter table FDC_PAYMENT_ORDER_BUDGET
  add constraint FDC#PK#PO_BUDGET primary key (ID);
alter table FDC_PAYMENT_ORDER_BUDGET
  add constraint FDC#FK#POB_IS_DEBIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_DEBIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CASHLESS
prompt =========================================
prompt
create table FDC_PAYMENT_ORDER_CASHLESS
(
  id    NUMBER(15) not null,
  tk_id VARCHAR2(25)
)
;
comment on table FDC_PAYMENT_ORDER_CASHLESS
  is '��������� ���������';
comment on column FDC_PAYMENT_ORDER_CASHLESS.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_CASHLESS.tk_id
  is '��� ���� �������������� ������ ��';
create index FDC#IND#PO_CASHLESS#TK_ID on FDC_PAYMENT_ORDER_CASHLESS (TK_ID);
alter table FDC_PAYMENT_ORDER_CASHLESS
  add constraint FDC#PK#PO_CASHLESS primary key (ID);
alter table FDC_PAYMENT_ORDER_CASHLESS
  add constraint FDC#FK#POCASHLESS_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CHEQUE
prompt =======================================
prompt
create table FDC_PAYMENT_ORDER_CHEQUE
(
  id         NUMBER(15) not null,
  cardnum    VARCHAR2(19) not null,
  tk_id      VARCHAR2(25) not null,
  paysysname VARCHAR2(70),
  flag_proc  NUMBER(1),
  viddoc     VARCHAR2(2),
  serpass    VARCHAR2(10),
  numpass    VARCHAR2(20),
  datpass    DATE,
  inn_s      VARCHAR2(12),
  kpp_s      VARCHAR2(9)
)
;
comment on table FDC_PAYMENT_ORDER_CHEQUE
  is '��� �� ���������� �����';
comment on column FDC_PAYMENT_ORDER_CHEQUE.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_CHEQUE.cardnum
  is '����� ���������� �����';
comment on column FDC_PAYMENT_ORDER_CHEQUE.tk_id
  is '������������� ���������� �����';
comment on column FDC_PAYMENT_ORDER_CHEQUE.paysysname
  is '������������ ��������� �������, ������������� ��';
comment on column FDC_PAYMENT_ORDER_CHEQUE.flag_proc
  is '������� ��������� ������ (1 -  ��������� ������; 0 - ������ ����� ���������)';
comment on column FDC_PAYMENT_ORDER_CHEQUE.viddoc
  is 'VIDDOC';
comment on column FDC_PAYMENT_ORDER_CHEQUE.serpass
  is 'SERPASS';
comment on column FDC_PAYMENT_ORDER_CHEQUE.numpass
  is 'NUMPASS';
comment on column FDC_PAYMENT_ORDER_CHEQUE.datpass
  is 'DATPASS';
comment on column FDC_PAYMENT_ORDER_CHEQUE.inn_s
  is 'INN_S';
comment on column FDC_PAYMENT_ORDER_CHEQUE.kpp_s
  is 'KPP_S';
create index ASBC_CARDMASK on FDC_PAYMENT_ORDER_CHEQUE (SUBSTR(CARDNUM,1,6));
create unique index FDC#AK#PO_CHEQUE#TK_ID on FDC_PAYMENT_ORDER_CHEQUE (TK_ID);
alter table FDC_PAYMENT_ORDER_CHEQUE
  add constraint FDC#PK#PO_CHEQUE primary key (ID);
alter table FDC_PAYMENT_ORDER_CHEQUE
  add constraint FDC#FK#POCHEQUE_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CNFRM
prompt ======================================
prompt
create table FDC_PAYMENT_ORDER_CNFRM
(
  id               NUMBER(15) not null,
  confirmed_pay_id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_CNFRM
  is '�������������� �������� ���������';
comment on column FDC_PAYMENT_ORDER_CNFRM.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_CNFRM.confirmed_pay_id
  is '������������� �������';
create unique index FDC#AK#PAYMENT_ORDER_CNFRM on FDC_PAYMENT_ORDER_CNFRM (CONFIRMED_PAY_ID);
alter table FDC_PAYMENT_ORDER_CNFRM
  add constraint FDC#PK#PAYMENT_ORDER_CONFIRM primary key (ID);
alter table FDC_PAYMENT_ORDER_CNFRM
  add constraint FDC#FK#PO_CNFRM#PO foreign key (CONFIRMED_PAY_ID)
  references FDC_PAYMENT_ORDER (ID);
alter table FDC_PAYMENT_ORDER_CNFRM
  add constraint FDC#FK#PO_CONFIRM_IS_POCR foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_CUSTORDER
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_CUSTORDER
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_CUSTORDER
  is '�������� ����� ����� �������';
comment on column FDC_PAYMENT_ORDER_CUSTORDER.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_CUSTORDER
  add constraint FDC#PK#PO_CUSTORDER primary key (ID);
alter table FDC_PAYMENT_ORDER_CUSTORDER
  add constraint FDC#FK#POCO_IS_CASHORD foreign key (ID)
  references FDC_PAYMENT_ORDER_CASHORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_DCO
prompt ====================================
prompt
create table FDC_PAYMENT_ORDER_DCO
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_DCO
  is '��������� �������� �����';
comment on column FDC_PAYMENT_ORDER_DCO.id
  is '��� �������';
alter table FDC_PAYMENT_ORDER_DCO
  add constraint FDC#PK#PO_DCO primary key (ID);
alter table FDC_PAYMENT_ORDER_DCO
  add constraint FDC#FK#PODCO_IS_DEBIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_DEBIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_GTK
prompt ====================================
prompt
create table FDC_PAYMENT_ORDER_GTK
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_GTK
  is '��������� ��������� �� ���� ���';
comment on column FDC_PAYMENT_ORDER_GTK.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_GTK
  add constraint FDC#PK#PO_GTK primary key (ID);
alter table FDC_PAYMENT_ORDER_GTK
  add constraint FDC#FK#POGTK_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_NON_ID
prompt =======================================
prompt
create table FDC_PAYMENT_ORDER_NON_ID
(
  id                    NUMBER(15) not null,
  payment_order_type_id NUMBER(15) not null,
  payment_order_id      NUMBER(15)
)
;
comment on table FDC_PAYMENT_ORDER_NON_ID
  is '�������������������� �����';
comment on column FDC_PAYMENT_ORDER_NON_ID.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_NON_ID.payment_order_type_id
  is '��� ��������� ��������� ����� �������������';
comment on column FDC_PAYMENT_ORDER_NON_ID.payment_order_id
  is '������������������ �������� ��������';
create unique index FDC#AK#PAYMENT_ORDER_NON_ID on FDC_PAYMENT_ORDER_NON_ID (PAYMENT_ORDER_ID);
create index FDC#FK#NON_ID_PO_TYPE on FDC_PAYMENT_ORDER_NON_ID (PAYMENT_ORDER_TYPE_ID);
alter table FDC_PAYMENT_ORDER_NON_ID
  add constraint FDC#PK#PAYMENT_ORDER_NON_ID primary key (ID);
alter table FDC_PAYMENT_ORDER_NON_ID
  add constraint FDC#FK#NON_ID_IS_POCR foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;
alter table FDC_PAYMENT_ORDER_NON_ID
  add constraint FDC#FK#NON_ID_PO foreign key (PAYMENT_ORDER_ID)
  references FDC_PAYMENT_ORDER (ID) on delete set null;
alter table FDC_PAYMENT_ORDER_NON_ID
  add constraint FDC#FK#NON_ID_PO_TYPE foreign key (PAYMENT_ORDER_TYPE_ID)
  references FDC_OBJECT_TYPE (ID);

prompt
prompt Creating table FDC_PAYMENT_ORDER_NONID_CHEQUE
prompt =============================================
prompt
create table FDC_PAYMENT_ORDER_NONID_CHEQUE
(
  id         NUMBER(15) not null,
  cardnum    VARCHAR2(19) not null,
  tk_id      VARCHAR2(25) not null,
  paysysname VARCHAR2(70),
  flag_proc  NUMBER(1),
  viddoc     VARCHAR2(2),
  serpass    VARCHAR2(10),
  numpass    VARCHAR2(20),
  datpass    DATE,
  inn_s      VARCHAR2(12),
  kpp_s      VARCHAR2(9)
)
;
comment on table FDC_PAYMENT_ORDER_NONID_CHEQUE
  is '�������������������� ��� �� ��';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.cardnum
  is '����� ���������� �����';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.tk_id
  is '������������� ���������� �����';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.paysysname
  is '������������ ��������� �������, ������������� ��';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.flag_proc
  is '������� ��������� ������ (1 -  ��������� ������; 0 - ������ ����� ���������)';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.viddoc
  is 'VIDDOC';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.serpass
  is 'SERPASS';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.numpass
  is 'NUMPASS';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.datpass
  is 'DATPASS';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.inn_s
  is 'INN_S';
comment on column FDC_PAYMENT_ORDER_NONID_CHEQUE.kpp_s
  is 'KPP_S';
create unique index FDC#AK#NONID_CHEQUE#TK_ID on FDC_PAYMENT_ORDER_NONID_CHEQUE (TK_ID);
alter table FDC_PAYMENT_ORDER_NONID_CHEQUE
  add constraint FDC#PK#PO_NONID_CHEQUE primary key (ID);
alter table FDC_PAYMENT_ORDER_NONID_CHEQUE
  add constraint FDC#FK#NONIDCHEQUE_IS_NON_ID foreign key (ID)
  references FDC_PAYMENT_ORDER_NON_ID (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_NONID_DEST
prompt ===========================================
prompt
create table FDC_PAYMENT_ORDER_NONID_DEST
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_NONID_DEST
  is '�������������������� �� ���� ������� ��';
comment on column FDC_PAYMENT_ORDER_NONID_DEST.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_NONID_DEST
  add constraint FDC#PK#PO_NONID_DEST primary key (ID);
alter table FDC_PAYMENT_ORDER_NONID_DEST
  add constraint FDC#FK#NONIDDEST_IS_NON_ID foreign key (ID)
  references FDC_PAYMENT_ORDER_NON_ID (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_NONID_KBK
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_NONID_KBK
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_NONID_KBK
  is '�������������������� �� ��� ��';
comment on column FDC_PAYMENT_ORDER_NONID_KBK.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_NONID_KBK
  add constraint FDC#PK#PO_NONID_KBK primary key (ID);
alter table FDC_PAYMENT_ORDER_NONID_KBK
  add constraint FDC#FK#NONIDKBK_IS_NON_ID foreign key (ID)
  references FDC_PAYMENT_ORDER_NON_ID (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_NONID_ORDER
prompt ============================================
prompt
create table FDC_PAYMENT_ORDER_NONID_ORDER
(
  id          NUMBER(15) not null,
  cashdesk_id NUMBER(15)
)
;
comment on table FDC_PAYMENT_ORDER_NONID_ORDER
  is '�������������������� �������� �����';
comment on column FDC_PAYMENT_ORDER_NONID_ORDER.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_NONID_ORDER.cashdesk_id
  is '�����';
create index FDC#FKIDX#PO_NONID_ORDER#DESK on FDC_PAYMENT_ORDER_NONID_ORDER (CASHDESK_ID);
alter table FDC_PAYMENT_ORDER_NONID_ORDER
  add constraint FDC#PK#PO_NONID_ORDER primary key (ID);
alter table FDC_PAYMENT_ORDER_NONID_ORDER
  add constraint FDC#FK#NONIDORDER#DESK foreign key (CASHDESK_ID)
  references FDC_OBJECT (ID) on delete set null;
alter table FDC_PAYMENT_ORDER_NONID_ORDER
  add constraint FDC#FK#NONIDORDER_IS_NON_ID foreign key (ID)
  references FDC_PAYMENT_ORDER_NON_ID (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_PAYBACK
prompt ========================================
prompt
create table FDC_PAYMENT_ORDER_PAYBACK
(
  dec_pay_id     NUMBER,
  id             NUMBER not null,
  seq_payment    VARCHAR2(1),
  kind_payment   VARCHAR2(1),
  doc_date_ufk   DATE,
  doc_number_ufk VARCHAR2(1500)
)
;
comment on table FDC_PAYMENT_ORDER_PAYBACK
  is '������� FDC_PAYMENT_ORDER_PAYBACK';
comment on column FDC_PAYMENT_ORDER_PAYBACK.dec_pay_id
  is 'DEC_PAY_ID';
comment on column FDC_PAYMENT_ORDER_PAYBACK.id
  is 'ID';
comment on column FDC_PAYMENT_ORDER_PAYBACK.seq_payment
  is 'SEQ_PAYMENT';
comment on column FDC_PAYMENT_ORDER_PAYBACK.kind_payment
  is 'KIND_PAYMENT';
comment on column FDC_PAYMENT_ORDER_PAYBACK.doc_date_ufk
  is 'DOC_DATE_UFK';
comment on column FDC_PAYMENT_ORDER_PAYBACK.doc_number_ufk
  is 'DOC_NUMBER_UFK';
create index FDC_PAYMENT_ORDER_PAYBACK_FK1 on FDC_PAYMENT_ORDER_PAYBACK (DEC_PAY_ID);
alter table FDC_PAYMENT_ORDER_PAYBACK
  add constraint FDC_PAYMENT_ORDER_PAYBACK_PK primary key (ID);
alter table FDC_PAYMENT_ORDER_PAYBACK
  add constraint FDC#FK#POPB_IS_DEBIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_DEBIT (ID) on delete cascade;
alter table FDC_PAYMENT_ORDER_PAYBACK
  add constraint FDC_DEC_PAY_ID foreign key (DEC_PAY_ID)
  references FDC_DECISION_PAYBACK (ID);

prompt
prompt Creating table FDC_PAYMENT_ORDER_PAYBACK_Y
prompt ==========================================
prompt
create table FDC_PAYMENT_ORDER_PAYBACK_Y
(
  id         NUMBER(15) not null,
  is_confirm VARCHAR2(1) not null,
  constraint FDC#PK#PAYMENT_ORDER_PAYBACK_Y primary key (ID)
)
organization index;
comment on table FDC_PAYMENT_ORDER_PAYBACK_Y
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_PAYBACK_Y.id
  is '������������� �������';
comment on column FDC_PAYMENT_ORDER_PAYBACK_Y.is_confirm
  is '������� �����������/������� (Y/N)';
alter table FDC_PAYMENT_ORDER_PAYBACK_Y
  add constraint FDC#FK#RETURN_Y_IS_DOC_CONFIRM foreign key (ID)
  references FDC_DOC_CONFIRM (ID) on delete cascade;
alter table FDC_PAYMENT_ORDER_PAYBACK_Y
  add constraint FDC#CHK#RETUTN_Y#IS_CONFIRM
  check (IS_CONFIRM IN ('Y', 'N'));

prompt
prompt Creating table FDC_PAYMENT_ORDER_PREPAYMENT
prompt ===========================================
prompt
create table FDC_PAYMENT_ORDER_PREPAYMENT
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_PREPAYMENT
  is '��������� ��������� ���������';
comment on column FDC_PAYMENT_ORDER_PREPAYMENT.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_PREPAYMENT
  add constraint FDC#PK#PO_PREPAYMENT primary key (ID);
alter table FDC_PAYMENT_ORDER_PREPAYMENT
  add constraint FDC#FK#POPP_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_REST_CUSTOMS
prompt =============================================
prompt
create table FDC_PAYMENT_ORDER_REST_CUSTOMS
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_REST_CUSTOMS
  is '�������� �������� �������� �������� �������';
comment on column FDC_PAYMENT_ORDER_REST_CUSTOMS.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_REST_CUSTOMS
  add constraint FDC#PK#PO_RESTCUST primary key (ID);
alter table FDC_PAYMENT_ORDER_REST_CUSTOMS
  add constraint FDC#FK#PORESTCUST_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_REST_UFK
prompt =========================================
prompt
create table FDC_PAYMENT_ORDER_REST_UFK
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_REST_UFK
  is '�������� �������� �������� �������� ���';
comment on column FDC_PAYMENT_ORDER_REST_UFK.id
  is '������������� �������';
alter table FDC_PAYMENT_ORDER_REST_UFK
  add constraint FDC#PK#PO_RESTUFK primary key (ID);
alter table FDC_PAYMENT_ORDER_REST_UFK
  add constraint FDC#FK#PORESTUFK_IS_CREDIT_PO foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAYMENT_ORDER_REUSE
prompt ======================================
prompt
create table FDC_PAYMENT_ORDER_REUSE
(
  id NUMBER(15) not null
)
;
comment on table FDC_PAYMENT_ORDER_REUSE
  is '��������� ��������� �� �����������';
comment on column FDC_PAYMENT_ORDER_REUSE.id
  is '��� �������';
alter table FDC_PAYMENT_ORDER_REUSE
  add constraint FDC#PK#PO_REUSE primary key (ID);
alter table FDC_PAYMENT_ORDER_REUSE
  add constraint FDC#FK#POR_IS_PAYMENT_ORDER foreign key (ID)
  references FDC_PAYMENT_ORDER_CREDIT (ID) on delete cascade;

prompt
prompt Creating table FDC_PAY_GROUPS
prompt =============================
prompt
create table FDC_PAY_GROUPS
(
  id               NUMBER(15) not null,
  is_deleted       NUMBER,
  code             VARCHAR2(2) not null,
  fine_pay_group   VARCHAR2(2),
  fine_budget_code VARCHAR2(20),
  begin_date       DATE,
  end_date         DATE
)
;
comment on table FDC_PAY_GROUPS
  is '������ ��������';
comment on column FDC_PAY_GROUPS.id
  is 'ID';
comment on column FDC_PAY_GROUPS.is_deleted
  is 'IS_DELETED';
comment on column FDC_PAY_GROUPS.code
  is 'CODE';
comment on column FDC_PAY_GROUPS.fine_pay_group
  is 'FINE_PAY_GROUP';
comment on column FDC_PAY_GROUPS.fine_budget_code
  is 'FINE_BUDGET_CODE';
comment on column FDC_PAY_GROUPS.begin_date
  is 'BEGIN_DATE';
comment on column FDC_PAY_GROUPS.end_date
  is 'END_DATE';
alter table FDC_PAY_GROUPS
  add constraint PAY_GROUPS#PK primary key (ID);
alter table FDC_PAY_GROUPS
  add constraint PAY_GROUPS#FK#ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_PERIODIC_CHARGE
prompt ==================================
prompt
create table FDC_PERIODIC_CHARGE
(
  id          NUMBER(15) not null,
  decl_id     NUMBER(15) not null,
  month_summa NUMBER(22,2),
  currency_id NUMBER(15) not null,
  pay_type_id NUMBER(15) not null,
  kbk_code_id NUMBER(15)
)
;
comment on table FDC_PERIODIC_CHARGE
  is '������� FDC_PERIODIC_CHARGE';
comment on column FDC_PERIODIC_CHARGE.id
  is 'ID';
comment on column FDC_PERIODIC_CHARGE.decl_id
  is 'DECL_ID';
comment on column FDC_PERIODIC_CHARGE.month_summa
  is 'MONTH_SUMMA';
comment on column FDC_PERIODIC_CHARGE.currency_id
  is 'CURRENCY_ID';
comment on column FDC_PERIODIC_CHARGE.pay_type_id
  is 'PAY_TYPE_ID';
comment on column FDC_PERIODIC_CHARGE.kbk_code_id
  is 'KBK_CODE_ID';
create index PERIODIC_CHARGES_CURRENCY__FDC on FDC_PERIODIC_CHARGE (CURRENCY_ID);
create index PERIODIC_CHARGES_DECL_ID_FDC on FDC_PERIODIC_CHARGE (DECL_ID);
create index PERIODIC_CHARGES_PAY_TYPE__FDC on FDC_PERIODIC_CHARGE (PAY_TYPE_ID);
alter table FDC_PERIODIC_CHARGE
  add constraint FDC_PERIODIC_CHARGES_PK primary key (ID);
alter table FDC_PERIODIC_CHARGE
  add constraint PERIODIC_CHARGES_CURRENCY_ID foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID);
alter table FDC_PERIODIC_CHARGE
  add constraint PERIODIC_CHARGES_DECL_ID foreign key (DECL_ID)
  references FDC_CUSTOM_DECL (ID);
alter table FDC_PERIODIC_CHARGE
  add constraint PERIODIC_CHARGES_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_PERIODIC_CHARGE
  add constraint PERIODIC_CHARGES_PAY_TYPE_ID foreign key (PAY_TYPE_ID)
  references FDC_DICT (ID);

prompt
prompt Creating table FDC_PERSON
prompt =========================
prompt
create table FDC_PERSON
(
  id            NUMBER(15) not null,
  last_name     VARCHAR2(100) not null,
  first_name    VARCHAR2(100),
  middle_name   VARCHAR2(100),
  country_code  VARCHAR2(3),
  doc_type      VARCHAR2(3),
  ser_no        VARCHAR2(30),
  doc_no        VARCHAR2(30),
  issued_by     VARCHAR2(100),
  issued_date   DATE,
  private_owner VARCHAR2(1) default 'N' not null
)
;
comment on table FDC_PERSON
  is '������� FDC_PERSON';
comment on column FDC_PERSON.id
  is 'ID';
comment on column FDC_PERSON.last_name
  is 'LAST_NAME';
comment on column FDC_PERSON.first_name
  is 'FIRST_NAME';
comment on column FDC_PERSON.middle_name
  is 'MIDDLE_NAME';
comment on column FDC_PERSON.country_code
  is 'COUNTRY_CODE';
comment on column FDC_PERSON.doc_type
  is 'DOC_TYPE';
comment on column FDC_PERSON.ser_no
  is 'SER_NO';
comment on column FDC_PERSON.doc_no
  is 'DOC_NO';
comment on column FDC_PERSON.issued_by
  is 'ISSUED_BY';
comment on column FDC_PERSON.issued_date
  is 'ISSUED_DATE';
comment on column FDC_PERSON.private_owner
  is 'Y-��,N-���. ����';
create index FDC_PERSON_FIRSTNAME on FDC_PERSON (UPPER(FIRST_NAME));
create index FDC_PERSON_LASTNAME on FDC_PERSON (UPPER(LAST_NAME));
create index FDC_PERSON_MIDDLENAME on FDC_PERSON (UPPER(MIDDLE_NAME));
alter table FDC_PERSON
  add constraint FDC_PERSON_PK primary key (ID);
alter table FDC_PERSON
  add constraint FDC_PERSON_AK1 unique (DOC_TYPE, SER_NO, DOC_NO);
alter table FDC_PERSON
  add constraint PERSON_ID foreign key (ID)
  references FDC_SUBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_PO_ERRORS
prompt ============================
prompt
create table FDC_PO_ERRORS
(
  id NUMBER(15) not null
)
;
comment on table FDC_PO_ERRORS
  is '������ � �������� ����������';
comment on column FDC_PO_ERRORS.id
  is 'ID';
alter table FDC_PO_ERRORS
  add constraint FDC#PK#PO_ERRORS primary key (ID);
alter table FDC_PO_ERRORS
  add constraint FDC#FK#PO_ERRORS#ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_PROVISION
prompt ============================
prompt
create table FDC_PROVISION
(
  ps_sysname       VARCHAR2(64) not null,
  ps_name          VARCHAR2(255),
  provision_summ   NUMBER(22,2),
  provision_update DATE,
  check_summ       NUMBER(22,2),
  check_update     DATE,
  ps_shortname     VARCHAR2(255),
  ps_inn           VARCHAR2(15),
  ps_kpp           VARCHAR2(9),
  ps_ogrn          VARCHAR2(15),
  color            NUMBER(22)
)
;
comment on table FDC_PROVISION
  is '����������� �������� ������';
comment on column FDC_PROVISION.ps_sysname
  is '��������� ��� �������� �������';
comment on column FDC_PROVISION.ps_name
  is '�������� �������� �������';
comment on column FDC_PROVISION.provision_summ
  is '����� �����������';
comment on column FDC_PROVISION.provision_update
  is '���� ���������� ���������� ����� �����������';
comment on column FDC_PROVISION.check_summ
  is '����� �� ������������� �����';
comment on column FDC_PROVISION.check_update
  is '���� ���������� ���������� ����� �� ������������� �����';
comment on column FDC_PROVISION.ps_shortname
  is '������� ������������ �������� �������';
comment on column FDC_PROVISION.ps_inn
  is '��� ��� �������� �������';
comment on column FDC_PROVISION.ps_kpp
  is '��� ��� �������� �������';
comment on column FDC_PROVISION.ps_ogrn
  is '��� ���� �������� �������';
comment on column FDC_PROVISION.color
  is '���� (��� ����������)';
create unique index FDC_PROVISION_AK on FDC_PROVISION (PS_INN);
alter table FDC_PROVISION
  add constraint FDC_PROVISION_PK primary key (PS_SYSNAME);

prompt
prompt Creating table FDC_PROVISION_STAT
prompt =================================
prompt
create table FDC_PROVISION_STAT
(
  diff_day       DATE not null,
  ps_sysname     VARCHAR2(64) not null,
  diff           NUMBER(22,2) not null,
  check_summ     NUMBER(22,2),
  provision_summ NUMBER(22,2)
)
;
comment on table FDC_PROVISION_STAT
  is '���������� ��������� ������� ����� ������������ �������� ������� � ������ �� ������������� �����';
comment on column FDC_PROVISION_STAT.diff_day
  is '���� ����������';
comment on column FDC_PROVISION_STAT.ps_sysname
  is '��������� ��� �������� �������';
comment on column FDC_PROVISION_STAT.diff
  is '������������ ������� ����� ������������ �������� ������� � ������ �� ������������� ����� �� ����';
comment on column FDC_PROVISION_STAT.check_summ
  is '����� �� ������������� ����� �� ������ ��������� �������� ���� DIFF';
comment on column FDC_PROVISION_STAT.provision_summ
  is '����� ����������� �� ������ ��������� �������� ���� DIFF';
create index FDC#FK#PROVISION_STAT#PS on FDC_PROVISION_STAT (PS_SYSNAME);
alter table FDC_PROVISION_STAT
  add constraint FDC#PK#PROVISION_STAT primary key (DIFF_DAY, PS_SYSNAME);
alter table FDC_PROVISION_STAT
  add constraint FDC#FK#PROVISION_STAT#PS foreign key (PS_SYSNAME)
  references FDC_PROVISION (PS_SYSNAME);

prompt
prompt Creating table FDC_QUERY_DEBTS_REST
prompt ===================================
prompt
create table FDC_QUERY_DEBTS_REST
(
  id           NUMBER(15) not null,
  asd_payer_id NUMBER(15),
  ls_payer_id  NUMBER(15),
  inn          VARCHAR2(12),
  kpp          VARCHAR2(10),
  full_name    VARCHAR2(1500),
  first_name   VARCHAR2(100),
  middle_name  VARCHAR2(100)
)
;
comment on table FDC_QUERY_DEBTS_REST
  is '������ �� �������� �������� ������� �� ��� ���������������';
comment on column FDC_QUERY_DEBTS_REST.id
  is '������������� �������';
comment on column FDC_QUERY_DEBTS_REST.asd_payer_id
  is '������������� ����������� � ��� �������������';
comment on column FDC_QUERY_DEBTS_REST.ls_payer_id
  is '������������� ����������� � ��';
comment on column FDC_QUERY_DEBTS_REST.inn
  is '���';
comment on column FDC_QUERY_DEBTS_REST.kpp
  is '���';
comment on column FDC_QUERY_DEBTS_REST.full_name
  is '������ ������������ �� ��� ������� ��';
comment on column FDC_QUERY_DEBTS_REST.first_name
  is '��� ��';
comment on column FDC_QUERY_DEBTS_REST.middle_name
  is '�������� ��';
alter table FDC_QUERY_DEBTS_REST
  add constraint FDC#PK#QUERY_DEBTS_ID primary key (ID);
alter table FDC_QUERY_DEBTS_REST
  add constraint FDC#FK#QUERY_DEBT_IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_QUERY_KTC
prompt ============================
prompt
create table FDC_QUERY_KTC
(
  id    NUMBER(15) not null,
  bdate DATE not null,
  edate DATE
)
;
comment on table FDC_QUERY_KTC
  is '������ �� ��� ����������-1�';
comment on column FDC_QUERY_KTC.id
  is '������������� �������';
comment on column FDC_QUERY_KTC.bdate
  is 'BDATE';
comment on column FDC_QUERY_KTC.edate
  is 'EDATE';
alter table FDC_QUERY_KTC
  add constraint FDC#PK#QUERY_KTC_ID primary key (ID);
alter table FDC_QUERY_KTC
  add constraint FDC#FK#QUERY_KTC_IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_QUERY_PRIVILEGE
prompt ==================================
prompt
create table FDC_QUERY_PRIVILEGE
(
  id       NUMBER(15) not null,
  decl_no  VARCHAR2(1500) not null,
  typeinfo NUMBER(1) not null
)
;
comment on table FDC_QUERY_PRIVILEGE
  is '������ �� ��� ����������� ����һ';
comment on column FDC_QUERY_PRIVILEGE.id
  is '������������� �������';
comment on column FDC_QUERY_PRIVILEGE.decl_no
  is 'DECL_NO';
comment on column FDC_QUERY_PRIVILEGE.typeinfo
  is 'TYPEINFO';
alter table FDC_QUERY_PRIVILEGE
  add constraint FDC#PK#QUERY_PRIVILEGE_ID primary key (ID);
alter table FDC_QUERY_PRIVILEGE
  add constraint FDC#FK#QUERY_PRIVILEGE_IS_OBJ foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_SPECIFY_KINDPAY
prompt =========================================
prompt
create table FDC_REESTR_SPECIFY_KINDPAY
(
  id           NUMBER(15) not null,
  date_input   DATE not null,
  date_send    DATE,
  currency_id  NUMBER(15) not null,
  date_confirm DATE
)
;
comment on table FDC_REESTR_SPECIFY_KINDPAY
  is '������ ��������� ���� �������';
comment on column FDC_REESTR_SPECIFY_KINDPAY.id
  is '������������� �������';
comment on column FDC_REESTR_SPECIFY_KINDPAY.date_input
  is '���� ������������ �������';
comment on column FDC_REESTR_SPECIFY_KINDPAY.date_send
  is '���� �������� �������';
comment on column FDC_REESTR_SPECIFY_KINDPAY.currency_id
  is '������������� ������ ���������� �����';
comment on column FDC_REESTR_SPECIFY_KINDPAY.date_confirm
  is '���� ������������� � ��������� ������� � ����������� ��';
alter table FDC_REESTR_SPECIFY_KINDPAY
  add constraint XPKFDC_REESTR_SPECIFY_KINDPAY primary key (ID);
alter table FDC_REESTR_SPECIFY_KINDPAY
  add foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_CNOTICE_KINDPAY
prompt =========================================
prompt
create table FDC_REESTR_CNOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_REESTR_CNOTICE_KINDPAY
  is '������ ����������� �� ��������� ���� ������� ��� �������� ������';
comment on column FDC_REESTR_CNOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_REESTR_CNOTICE_KINDPAY
  add constraint XPKFDC_REESTR_CNOTICE_KINDPAY primary key (ID);
alter table FDC_REESTR_CNOTICE_KINDPAY
  add foreign key (ID)
  references FDC_REESTR_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_CONFIRMATION
prompt ======================================
prompt
create table FDC_REESTR_CONFIRMATION
(
  id             NUMBER(15) not null,
  dest_custom_id NUMBER(15)
)
;
comment on table FDC_REESTR_CONFIRMATION
  is '������ ��������� � ��������� ���������';
comment on column FDC_REESTR_CONFIRMATION.id
  is '������������� �������';
comment on column FDC_REESTR_CONFIRMATION.dest_custom_id
  is '������������� �������-����������';
create index FDC#FK#FDC_REESTR_CNFRM#CSTM on FDC_REESTR_CONFIRMATION (DEST_CUSTOM_ID);
alter table FDC_REESTR_CONFIRMATION
  add constraint XPKFDC_REESTR_CONFIRMATION primary key (ID);
alter table FDC_REESTR_CONFIRMATION
  add constraint FDC#FK#FDC_REESTR_CNFRM#CSTM foreign key (DEST_CUSTOM_ID)
  references FDC_CUSTOMS (ID);
alter table FDC_REESTR_CONFIRMATION
  add foreign key (ID)
  references FDC_DOC_PACK (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_CONFIRM_KINDPAY
prompt =========================================
prompt
create table FDC_REESTR_CONFIRM_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_REESTR_CONFIRM_KINDPAY
  is '������ ������������� ������������� �������';
comment on column FDC_REESTR_CONFIRM_KINDPAY.id
  is '������������� �������';
alter table FDC_REESTR_CONFIRM_KINDPAY
  add constraint XPKFDC_REESTR_CONFIRM_KINDPAY primary key (ID);
alter table FDC_REESTR_CONFIRM_KINDPAY
  add foreign key (ID)
  references FDC_REESTR_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_GNOTICE_KINDPAY
prompt =========================================
prompt
create table FDC_REESTR_GNOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_REESTR_GNOTICE_KINDPAY
  is '������ ����������� �� ��������� ���� ������� �����������';
comment on column FDC_REESTR_GNOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_REESTR_GNOTICE_KINDPAY
  add constraint XPKFDC_REESTR_GNOTICE_KINDPAY primary key (ID);
alter table FDC_REESTR_GNOTICE_KINDPAY
  add foreign key (ID)
  references FDC_REESTR_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_REESTR_NOTICE_KINDPAY
prompt ========================================
prompt
create table FDC_REESTR_NOTICE_KINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_REESTR_NOTICE_KINDPAY
  is '������ ����������� �� ��������� ���� �������';
comment on column FDC_REESTR_NOTICE_KINDPAY.id
  is '������������� �������';
alter table FDC_REESTR_NOTICE_KINDPAY
  add constraint XPKFDC_REESTR_NOTICE_KINDPAY primary key (ID);
alter table FDC_REESTR_NOTICE_KINDPAY
  add foreign key (ID)
  references FDC_REESTR_SPECIFY_KINDPAY (ID) on delete cascade;

prompt
prompt Creating table FDC_REGISTRY
prompt ===========================
prompt
create table FDC_REGISTRY
(
  section_name VARCHAR2(80) not null,
  prop_name    VARCHAR2(80) not null,
  prop_value   VARCHAR2(4000) not null
)
;
comment on table FDC_REGISTRY
  is '������� FDC_REGISTRY';
comment on column FDC_REGISTRY.section_name
  is 'SECTION_NAME';
comment on column FDC_REGISTRY.prop_name
  is 'PROP_NAME';
comment on column FDC_REGISTRY.prop_value
  is 'PROP_VALUE';
create unique index FDC_REGISTRY_UQ on FDC_REGISTRY (UPPER(SECTION_NAME), UPPER(PROP_NAME));

prompt
prompt Creating table FDC_REL_ACT_DED_CHARGE
prompt =====================================
prompt
create table FDC_REL_ACT_DED_CHARGE
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_ACT_DED_CHARGE
  is '������� FDC_REL_ACT_DED_CHARGE';
comment on column FDC_REL_ACT_DED_CHARGE.id
  is '������������� �������';
alter table FDC_REL_ACT_DED_CHARGE
  add constraint FDC#PK#REL_ACT_DED_CHARGE primary key (ID);
alter table FDC_REL_ACT_DED_CHARGE
  add constraint FDC#FK#ACT_CHARGE_IS_RELATION foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_ACT_DED_DEDUCTION
prompt ========================================
prompt
create table FDC_REL_ACT_DED_DEDUCTION
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_ACT_DED_DEDUCTION
  is '������� FDC_REL_ACT_DED_DEDUCTION';
comment on column FDC_REL_ACT_DED_DEDUCTION.id
  is '������������� �������';
alter table FDC_REL_ACT_DED_DEDUCTION
  add constraint FDC#PK#REL_ACT_DED_DEDUCTION primary key (ID);
alter table FDC_REL_ACT_DED_DEDUCTION
  add constraint FDC#FK#ACT_DED_IS_RELATION foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_ADVICE_DEC
prompt =================================
prompt
create table FDC_REL_ADVICE_DEC
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_ADVICE_DEC
  is '�����: ����������� - �������';
comment on column FDC_REL_ADVICE_DEC.id
  is '������������� �������';
alter table FDC_REL_ADVICE_DEC
  add constraint FDC#PK#REL_ADVICE_DEC primary key (ID);
alter table FDC_REL_ADVICE_DEC
  add constraint FDC#FK#REL_ADV_DEC_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_OPER_ACC
prompt ===============================
prompt
create table FDC_REL_OPER_ACC
(
  id          NUMBER(15) not null,
  action_sign INTEGER not null,
  is_debit    CHAR(1) not null,
  enable_func VARCHAR2(30)
)
;
comment on table FDC_REL_OPER_ACC
  is '�����: �������� - ����';
comment on column FDC_REL_OPER_ACC.id
  is '��� �������';
comment on column FDC_REL_OPER_ACC.action_sign
  is '���� ����������� �������� �� ����:
-1 - �������� �� �����
0 - ��� ����������� �� ����
+1 - ���������� �� ����';
comment on column FDC_REL_OPER_ACC.is_debit
  is '������� �����
Y - ���������
N - ���������';
comment on column FDC_REL_OPER_ACC.enable_func
  is '��� �������� �������������� �������� ��� ����������� ���������
������ ���������� ''Y'' ��� ''N''';
alter table FDC_REL_OPER_ACC
  add constraint FDC#PK#REL_OPER_ACC primary key (ID);
alter table FDC_REL_OPER_ACC
  add constraint FDC#FK#OPER_ACC_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;
alter table FDC_REL_OPER_ACC
  add constraint FDC#CHK#ACTION_SIGN
  check (ACTION_SIGN IN (-1, 0, +1));
alter table FDC_REL_OPER_ACC
  add constraint FDC#CHK#BOOL8
  check (IS_DEBIT IN ('Y', 'N'));

prompt
prompt Creating table FDC_REL_OPER_DOC_CLASS
prompt =====================================
prompt
create table FDC_REL_OPER_DOC_CLASS
(
  id        NUMBER(15) not null,
  proc_name VARCHAR2(20)
)
;
comment on table FDC_REL_OPER_DOC_CLASS
  is '�����: �������� - ����� ���������';
comment on column FDC_REL_OPER_DOC_CLASS.id
  is '��� �������';
comment on column FDC_REL_OPER_DOC_CLASS.proc_name
  is '�������������� ����������� ��������� ��������� ��������';
alter table FDC_REL_OPER_DOC_CLASS
  add constraint FDC#PK#REL#OPER_DOC_CLASS primary key (ID);
alter table FDC_REL_OPER_DOC_CLASS
  add constraint FDC#FK#OPER_DOC_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_OVERRIDE_DOC
prompt ===================================
prompt
create table FDC_REL_OVERRIDE_DOC
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_OVERRIDE_DOC
  is '�����: �������� - �������������� ��������';
comment on column FDC_REL_OVERRIDE_DOC.id
  is '������������� �������';
alter table FDC_REL_OVERRIDE_DOC
  add constraint FDC#PK#REL_OVERRIDE_DOC primary key (ID);
alter table FDC_REL_OVERRIDE_DOC
  add constraint FDC#FK#REL_OVERRIDE_DOC_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_PACK_DOCS
prompt ================================
prompt
create table FDC_REL_PACK_DOCS
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_PACK_DOCS
  is '�����: ����� - ���������';
comment on column FDC_REL_PACK_DOCS.id
  is '������������� �������';
alter table FDC_REL_PACK_DOCS
  add constraint FDC#PK#REL_PACK_DOCS primary key (ID);
alter table FDC_REL_PACK_DOCS
  add constraint FDC#FK#PACK_DOCS_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_PO_DOC_CHARGE
prompt ====================================
prompt
create table FDC_REL_PO_DOC_CHARGE
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_PO_DOC_CHARGE
  is '�����: ��������� �������� - �������� ����������';
comment on column FDC_REL_PO_DOC_CHARGE.id
  is '������������� �������';
alter table FDC_REL_PO_DOC_CHARGE
  add constraint FDC#PK#REL_PO_DOC_CHARGE primary key (ID);
alter table FDC_REL_PO_DOC_CHARGE
  add constraint FDC#FK#REL_PO_DOCCHARGE_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_REESTR_REESTR
prompt ====================================
prompt
create table FDC_REL_REESTR_REESTR
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_REESTR_REESTR
  is '����� ������ �������� �� � �������� ��������� �� ����������� ��';
comment on column FDC_REL_REESTR_REESTR.id
  is '������������� �������';
alter table FDC_REL_REESTR_REESTR
  add constraint XPKFDC_REL_REESTR_REESTR primary key (ID);
alter table FDC_REL_REESTR_REESTR
  add foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_REESTR_SKINDPAY
prompt ======================================
prompt
create table FDC_REL_REESTR_SKINDPAY
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_REESTR_SKINDPAY
  is '����� ����� ��������� "������ ��������� ���� �������" - "��������"';
comment on column FDC_REL_REESTR_SKINDPAY.id
  is '������������� �������';
alter table FDC_REL_REESTR_SKINDPAY
  add constraint XPKFDC_REL_REESTR_SKINDPAY primary key (ID);
alter table FDC_REL_REESTR_SKINDPAY
  add foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_SKINDPAY_DEDUCT
prompt ======================================
prompt
create table FDC_REL_SKINDPAY_DEDUCT
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_SKINDPAY_DEDUCT
  is '����� ����� ��������� "������ ��������� ���� �������" - "��������� ���� �������"';
comment on column FDC_REL_SKINDPAY_DEDUCT.id
  is '������������� �������';
alter table FDC_REL_SKINDPAY_DEDUCT
  add constraint XPKFDC_REL_SKINDPAY_DEDUCT primary key (ID);
alter table FDC_REL_SKINDPAY_DEDUCT
  add foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REL_TR_DEC
prompt =============================
prompt
create table FDC_REL_TR_DEC
(
  id NUMBER(15) not null
)
;
comment on table FDC_REL_TR_DEC
  is '�����: �� - �������';
comment on column FDC_REL_TR_DEC.id
  is '������������� �������';
alter table FDC_REL_TR_DEC
  add constraint FDC#PK#REL_TR_DEC primary key (ID);
alter table FDC_REL_TR_DEC
  add constraint FDC#FK#REL_TR_DEC_IS_REL foreign key (ID)
  references FDC_OBJECT_RELATION (ID) on delete cascade;

prompt
prompt Creating table FDC_REPAYMENT
prompt ============================
prompt
create table FDC_REPAYMENT
(
  id                    NUMBER(15) not null,
  rate                  NUMBER(8,2),
  percentage            NUMBER(9,2),
  repayment_period      DATE,
  is_repayment_or_delay NUMBER(1) not null,
  dep_type_id           NUMBER(15),
  summa                 NUMBER(22,2) not null,
  currency_id           INTEGER not null,
  pay_type_id           INTEGER not null
)
;
comment on table FDC_REPAYMENT
  is '������� FDC_REPAYMENT';
comment on column FDC_REPAYMENT.id
  is 'ID';
comment on column FDC_REPAYMENT.rate
  is 'RATE';
comment on column FDC_REPAYMENT.percentage
  is 'PERCENTAGE';
comment on column FDC_REPAYMENT.repayment_period
  is 'REPAYMENT_PERIOD';
comment on column FDC_REPAYMENT.is_repayment_or_delay
  is 'IS_REPAYMENT_OR_DELAY';
comment on column FDC_REPAYMENT.dep_type_id
  is 'DEP_TYPE_ID';
comment on column FDC_REPAYMENT.summa
  is 'SUMMA';
comment on column FDC_REPAYMENT.currency_id
  is 'CURRENCY_ID';
comment on column FDC_REPAYMENT.pay_type_id
  is 'PAY_TYPE_ID';
create index REPAYMENT_DICT_ID_FDC on FDC_REPAYMENT (DEP_TYPE_ID);
alter table FDC_REPAYMENT
  add constraint FDC_REPAYMENT_PK primary key (ID);
alter table FDC_REPAYMENT
  add constraint REPAYMENT_DICT_ID foreign key (DEP_TYPE_ID)
  references FDC_DICT (ID);
alter table FDC_REPAYMENT
  add constraint REPAYMENT_OBJ_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_REPAYMENT
  add constraint YESORNO615
  check (IS_REPAYMENT_OR_DELAY IN (0, 1));

prompt
prompt Creating table FDC_REPORT
prompt =========================
prompt
create table FDC_REPORT
(
  id         NUMBER(15) not null,
  rep_number VARCHAR2(255) not null,
  rep_date   DATE not null,
  is_ts      VARCHAR2(1)
)
;
comment on table FDC_REPORT
  is '�����';
comment on column FDC_REPORT.id
  is '������������� �������';
comment on column FDC_REPORT.rep_number
  is '����� ������';
comment on column FDC_REPORT.rep_date
  is '���� ������';
comment on column FDC_REPORT.is_ts
  is '������� ����������� �����';
create index IDX#FDC_REPORT#REP_DATE on FDC_REPORT (REP_DATE);
create index IDX#FDC_REPORT#REP_NUMBER on FDC_REPORT (REP_NUMBER);
alter table FDC_REPORT
  add constraint FDC_REPORT_PK primary key (ID);
alter table FDC_REPORT
  add constraint FDC_REPORT_FK foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_REPORT_BUDGET
prompt ================================
prompt
create table FDC_REPORT_BUDGET
(
  id             NUMBER(15) not null,
  report_type_id NUMBER(15) not null,
  currency_id    INTEGER not null,
  itog_summa     NUMBER(36,4)
)
;
comment on table FDC_REPORT_BUDGET
  is '��������� �����';
comment on column FDC_REPORT_BUDGET.id
  is '������������� �������';
comment on column FDC_REPORT_BUDGET.report_type_id
  is '��� ������';
comment on column FDC_REPORT_BUDGET.currency_id
  is '������ ������';
comment on column FDC_REPORT_BUDGET.itog_summa
  is '�������� ����� ������';
create index IDX#FDC_REPORT_BUDGET#CURR_ID on FDC_REPORT_BUDGET (CURRENCY_ID);
create index IDX#FDC_REPORT_BUDGET#ITOG on FDC_REPORT_BUDGET (ITOG_SUMMA);
create index IDX#FDC_REPORT_BUDGET#TYPE_ID on FDC_REPORT_BUDGET (REPORT_TYPE_ID);
alter table FDC_REPORT_BUDGET
  add constraint FDC#PK#REPORT_BUDGET primary key (ID);
alter table FDC_REPORT_BUDGET
  add constraint FDC#FK#REPORT_BUDGET_CURR foreign key (CURRENCY_ID)
  references FDC_NSI_CURRENCY (ID) on delete set null;
alter table FDC_REPORT_BUDGET
  add constraint FDC#FK#REPORT_BUDGET_IS_REP foreign key (ID)
  references FDC_REPORT (ID) on delete cascade;

prompt
prompt Creating table FDC_RESERVED_PAYMENT
prompt ===================================
prompt
create table FDC_RESERVED_PAYMENT
(
  id           NUMBER(15) not null,
  payment_id   NUMBER(15) not null,
  summa        NUMBER(22,2) not null,
  payment_date DATE not null,
  reason_code  VARCHAR2(2) not null,
  doc_id       NUMBER(15),
  doc_key      VARCHAR2(64),
  bdate        DATE not null,
  edate        DATE,
  prev_id      NUMBER(15),
  kbkcode_id   NUMBER(15),
  summa_base   NUMBER(22,2)
)
;
comment on table FDC_RESERVED_PAYMENT
  is '���������� ������� �� �������� ����������';
comment on column FDC_RESERVED_PAYMENT.id
  is '������������� �������';
comment on column FDC_RESERVED_PAYMENT.payment_id
  is '������������� �������';
comment on column FDC_RESERVED_PAYMENT.summa
  is '����� �������';
comment on column FDC_RESERVED_PAYMENT.payment_date
  is '���� �������';
comment on column FDC_RESERVED_PAYMENT.reason_code
  is '��� �������';
comment on column FDC_RESERVED_PAYMENT.doc_id
  is '������������� �������';
comment on column FDC_RESERVED_PAYMENT.doc_key
  is '��� ���������';
comment on column FDC_RESERVED_PAYMENT.bdate
  is '���� ������ ����������';
comment on column FDC_RESERVED_PAYMENT.edate
  is '���� ��������� ����������';
comment on column FDC_RESERVED_PAYMENT.prev_id
  is '���������� ����������';
comment on column FDC_RESERVED_PAYMENT.kbkcode_id
  is 'KBKCODE_ID';
comment on column FDC_RESERVED_PAYMENT.summa_base
  is '����� ������� ������� � ��������';
create index FDC#FK#RESERVED_PAYMENT#DOC_ID on FDC_RESERVED_PAYMENT (DOC_ID);
create index FDC#FK#RESERVED_PREV on FDC_RESERVED_PAYMENT (PREV_ID);
create index FDC_RESERVED_PAYMENT_BDATE_I on FDC_RESERVED_PAYMENT (BDATE);
create index FDC_RESERVED_PAYMENT_EDATE_I on FDC_RESERVED_PAYMENT (EDATE);
create index RESERVED_PAYMENT_ID_FDC on FDC_RESERVED_PAYMENT (PAYMENT_ID);
alter table FDC_RESERVED_PAYMENT
  add constraint FDC#PK#RESERVED_PAYMENT primary key (ID);
alter table FDC_RESERVED_PAYMENT
  add constraint FDC#FK#RESERVED_DOC foreign key (DOC_ID)
  references FDC_DOCUMENT (ID) on delete set null;
alter table FDC_RESERVED_PAYMENT
  add constraint FDC#FK#RESERVED_IS_DOCUMENT foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;
alter table FDC_RESERVED_PAYMENT
  add constraint FDC#FK#RESERVED_PO foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);
alter table FDC_RESERVED_PAYMENT
  add constraint FDC#FK#RESERVED_PREV foreign key (PREV_ID)
  references FDC_RESERVED_PAYMENT (ID) on delete set null;

prompt
prompt Creating table FDC_RESERVED_3YEAR
prompt =================================
prompt
create table FDC_RESERVED_3YEAR
(
  id NUMBER not null
)
;
comment on table FDC_RESERVED_3YEAR
  is '������� FDC_RESERVED_3YEAR';
comment on column FDC_RESERVED_3YEAR.id
  is 'ID';
alter table FDC_RESERVED_3YEAR
  add constraint FDC#PK#RESERVED_3YEAR primary key (ID);
alter table FDC_RESERVED_3YEAR
  add constraint FDC#FK#3YEAR_IS_RESERVED foreign key (ID)
  references FDC_RESERVED_PAYMENT (ID);

prompt
prompt Creating table FDC_RESERVED_FOR_DECL
prompt ====================================
prompt
create table FDC_RESERVED_FOR_DECL
(
  id           NUMBER(15) not null,
  customs_code VARCHAR2(8),
  reg_date     DATE,
  decl_no      VARCHAR2(10),
  subject_id   NUMBER(15),
  note         VARCHAR2(1000)
)
;
comment on table FDC_RESERVED_FOR_DECL
  is '���������� ������� ��� ���';
comment on column FDC_RESERVED_FOR_DECL.id
  is '������������� �������';
comment on column FDC_RESERVED_FOR_DECL.customs_code
  is '��� �������';
comment on column FDC_RESERVED_FOR_DECL.reg_date
  is '���� �����������';
comment on column FDC_RESERVED_FOR_DECL.decl_no
  is '���������� ����� ���';
comment on column FDC_RESERVED_FOR_DECL.subject_id
  is '������������� �������';
comment on column FDC_RESERVED_FOR_DECL.note
  is '����������';
create index FDC_RESERVED_FOR_DECL_IFK1 on FDC_RESERVED_FOR_DECL (SUBJECT_ID);
alter table FDC_RESERVED_FOR_DECL
  add constraint FDC#PK#RESERVED_FOR_DECL primary key (ID);
alter table FDC_RESERVED_FOR_DECL
  add constraint FDC#FK#RES_DECL_IS_RESERVED_P foreign key (ID)
  references FDC_RESERVED_PAYMENT (ID) on delete cascade;
alter table FDC_RESERVED_FOR_DECL
  add constraint FDC#FK#RP_DECL#SUBJECT foreign key (SUBJECT_ID)
  references FDC_SUBJECT (ID) on delete set null;

prompt
prompt Creating table FDC_RESERVED_FOR_RETURN
prompt ======================================
prompt
create table FDC_RESERVED_FOR_RETURN
(
  id NUMBER not null
)
;
comment on table FDC_RESERVED_FOR_RETURN
  is '������� FDC_RESERVED_FOR_RETURN';
comment on column FDC_RESERVED_FOR_RETURN.id
  is 'ID';
alter table FDC_RESERVED_FOR_RETURN
  add constraint FDC#PK#RESERVED_RET primary key (ID);
alter table FDC_RESERVED_FOR_RETURN
  add constraint FDC#FK#RET_IS_RESERVED foreign key (ID)
  references FDC_RESERVED_PAYMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_TR
prompt =====================
prompt
create table FDC_TR
(
  id           NUMBER(15) not null,
  num_mpo      VARCHAR2(13),
  regim        VARCHAR2(2),
  meth_move    VARCHAR2(3),
  order_type   VARCHAR2(1),
  sum_rub      NUMBER,
  carrier_id   NUMBER(15),
  date_exec    DATE,
  trtype       NUMBER(1) default 0 not null,
  sign_genprov NUMBER(1) default 0 not null,
  sign_corr    NUMBER(1) default 0 not null
)
;
comment on table FDC_TR
  is '������� FDC_TR';
comment on column FDC_TR.id
  is 'ID';
comment on column FDC_TR.num_mpo
  is 'NUM_MPO';
comment on column FDC_TR.regim
  is 'REGIM';
comment on column FDC_TR.meth_move
  is 'METH_MOVE';
comment on column FDC_TR.order_type
  is 'ORDER_TYPE';
comment on column FDC_TR.sum_rub
  is 'SUM_RUB';
comment on column FDC_TR.carrier_id
  is '3-� ����, ��������� �������';
comment on column FDC_TR.date_exec
  is '���� ����������';
comment on column FDC_TR.trtype
  is '0 � �������, 1 - �����������';
comment on column FDC_TR.sign_genprov
  is '������� ������������ ����������� (0 � ���, 1 - ��)';
comment on column FDC_TR.sign_corr
  is '������� ������������� (0 � ���, 1 - ��)';
create index FDC#FK#IDX#TR#CARRIER on FDC_TR (CARRIER_ID);
alter table FDC_TR
  add constraint FDC_TR_PK primary key (ID);
alter table FDC_TR
  add constraint FDC#FK#TR_IS_DOC_CHARGE foreign key (ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;
alter table FDC_TR
  add constraint FK#FDC_TR#CARRIER_ID foreign key (CARRIER_ID)
  references FDC_SUBJECT (ID);

prompt
prompt Creating table FDC_RESERVED_FOR_RETURN_TR
prompt =========================================
prompt
create table FDC_RESERVED_FOR_RETURN_TR
(
  id    NUMBER not null,
  tr_id NUMBER
)
;
comment on table FDC_RESERVED_FOR_RETURN_TR
  is '������� FDC_RESERVED_FOR_RETURN_TR';
comment on column FDC_RESERVED_FOR_RETURN_TR.id
  is 'ID';
comment on column FDC_RESERVED_FOR_RETURN_TR.tr_id
  is 'TR_ID';
create index FDC#FK#RES_RET_TR#TR_ID on FDC_RESERVED_FOR_RETURN_TR (TR_ID);
alter table FDC_RESERVED_FOR_RETURN_TR
  add constraint FDC#PK#RES_RET_TR primary key (ID);
alter table FDC_RESERVED_FOR_RETURN_TR
  add constraint FDC#FK#RES_RET_TR_ID foreign key (TR_ID)
  references FDC_TR (ID) on delete cascade;
alter table FDC_RESERVED_FOR_RETURN_TR
  add constraint FDC#FK#TR_IS_RES_RET foreign key (ID)
  references FDC_RESERVED_FOR_RETURN (ID) on delete cascade;

prompt
prompt Creating table FDC_RESERVED_FOR_REUSE
prompt =====================================
prompt
create table FDC_RESERVED_FOR_REUSE
(
  id NUMBER(15) not null
)
;
comment on table FDC_RESERVED_FOR_REUSE
  is '���������� ������� ��� ������';
comment on column FDC_RESERVED_FOR_REUSE.id
  is '������������� �������';
alter table FDC_RESERVED_FOR_REUSE
  add constraint FDC#PK#RESERVED_FOR_REUSE primary key (ID);
alter table FDC_RESERVED_FOR_REUSE
  add constraint FDC#FK#RES_REUSE_IS_RESERVED_P foreign key (ID)
  references FDC_RESERVED_PAYMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_RESERVED_FOR_REUSE_TR
prompt ========================================
prompt
create table FDC_RESERVED_FOR_REUSE_TR
(
  id    NUMBER not null,
  tr_id NUMBER
)
;
comment on table FDC_RESERVED_FOR_REUSE_TR
  is '������� FDC_RESERVED_FOR_REUSE_TR';
comment on column FDC_RESERVED_FOR_REUSE_TR.id
  is 'ID';
comment on column FDC_RESERVED_FOR_REUSE_TR.tr_id
  is 'TR_ID';
create index FDC#FK#RES_REU_TR#TR_ID on FDC_RESERVED_FOR_REUSE_TR (TR_ID);
alter table FDC_RESERVED_FOR_REUSE_TR
  add constraint FDC#PK#RES_REU_TR primary key (ID);
alter table FDC_RESERVED_FOR_REUSE_TR
  add constraint FDC#FK#RES_REU_TR_ID foreign key (TR_ID)
  references FDC_TR (ID) on delete cascade;
alter table FDC_RESERVED_FOR_REUSE_TR
  add constraint FDC#FK#TR_IS_RES_REU foreign key (ID)
  references FDC_RESERVED_FOR_REUSE (ID) on delete cascade;

prompt
prompt Creating table FDC_RESOLUSION_FINES
prompt ===================================
prompt
create table FDC_RESOLUSION_FINES
(
  id       NUMBER(15) not null,
  reg_date DATE,
  code_doc VARCHAR2(5),
  ind_doc  INTEGER
)
;
comment on table FDC_RESOLUSION_FINES
  is '������������� � ��';
comment on column FDC_RESOLUSION_FINES.id
  is '������������� �������';
comment on column FDC_RESOLUSION_FINES.reg_date
  is '���� ���������� ������������� � �������� ����.';
comment on column FDC_RESOLUSION_FINES.code_doc
  is '��� ���� ��������� ������������� � ��� ��������������������� �� ��, ������������� ��� ��������� � �.�.';
comment on column FDC_RESOLUSION_FINES.ind_doc
  is '������� ������ � �����.';
alter table FDC_RESOLUSION_FINES
  add constraint FDC#PK#RESOLUSION_FINES_ID primary key (ID);
alter table FDC_RESOLUSION_FINES
  add constraint FDC#FK#RESOLUSION_FINES_IS_DOC foreign key (ID)
  references FDC_DOCUMENT (ID) on delete cascade;

prompt
prompt Creating table FDC_REST_DATE_REG
prompt ================================
prompt
create table FDC_REST_DATE_REG
(
  payment_id NUMBER(15) not null,
  kbk        VARCHAR2(20) not null,
  reg_date   DATE not null,
  reg_sum    NUMBER(36,4) not null,
  constraint FDC#PK#REST_DATE_REG primary key (PAYMENT_ID, KBK, REG_DATE)
)
organization index;
comment on table FDC_REST_DATE_REG
  is '������� �� �������� �� ���������. �� ������ ����';
comment on column FDC_REST_DATE_REG.payment_id
  is '�������� ���������';
comment on column FDC_REST_DATE_REG.kbk
  is '���';
comment on column FDC_REST_DATE_REG.reg_date
  is '���� (��� �������)';
comment on column FDC_REST_DATE_REG.reg_sum
  is '�����';
create index FDC#IDX#FK#REST_DATE#KBK on FDC_REST_DATE_REG (KBK);
create index FDC#IDX#FK#REST_DATE#PAYMENT on FDC_REST_DATE_REG (PAYMENT_ID);
alter table FDC_REST_DATE_REG
  add constraint FDC#FK#REST_DATE#PO foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);

prompt
prompt Creating table FDC_REST_DATE_REG_REUSE
prompt ======================================
prompt
create table FDC_REST_DATE_REG_REUSE
(
  payment_id NUMBER(15) not null,
  kbk        VARCHAR2(20) not null,
  reg_date   DATE not null,
  reg_sum    NUMBER(36,4) not null,
  constraint FDC#PK#REST_DATE_REG_REUSE primary key (PAYMENT_ID, KBK, REG_DATE)
)
organization index;
comment on table FDC_REST_DATE_REG_REUSE
  is '������� �� �������� �� ���������. �� �������� �������� � ������� � �������� ������';
comment on column FDC_REST_DATE_REG_REUSE.payment_id
  is '�������� ���������';
comment on column FDC_REST_DATE_REG_REUSE.kbk
  is '���';
comment on column FDC_REST_DATE_REG_REUSE.reg_date
  is '���� (��� �������)';
comment on column FDC_REST_DATE_REG_REUSE.reg_sum
  is '�����';
create index FDC#IDX#FK#REST_DATE_REUSE#KBK on FDC_REST_DATE_REG_REUSE (KBK);
alter table FDC_REST_DATE_REG_REUSE
  add constraint FDC#FK#REST_DATE_REUSE#PO foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID) on delete cascade;

prompt
prompt Creating table FDC_REST_REG
prompt ===========================
prompt
create table FDC_REST_REG
(
  payment_id NUMBER(15) not null,
  kbk        VARCHAR2(20) not null,
  reg_sum    NUMBER(36,4) not null,
  constraint FDC#PK#REST_REG primary key (PAYMENT_ID, KBK)
)
organization index;
comment on table FDC_REST_REG
  is '������� �� �������� �� ���������';
comment on column FDC_REST_REG.payment_id
  is '�������� ���������';
comment on column FDC_REST_REG.kbk
  is '���';
comment on column FDC_REST_REG.reg_sum
  is '�����';
create index FDC#IDX#FK#REST#KBK on FDC_REST_REG (KBK);
create index FDC#IDX#FK#REST#PAYMENT on FDC_REST_REG (PAYMENT_ID);
alter table FDC_REST_REG
  add constraint FDC#FK#REST#PO foreign key (PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);

prompt
prompt Creating table FDC_REUSE_PAYORDER
prompt =================================
prompt
create table FDC_REUSE_PAYORDER
(
  id             NUMBER(15) not null,
  send_date      DATE,
  new_payment_id NUMBER(15)
)
;
comment on table FDC_REUSE_PAYORDER
  is '������� FDC_REUSE_PAYORDER';
comment on column FDC_REUSE_PAYORDER.id
  is 'ID';
comment on column FDC_REUSE_PAYORDER.send_date
  is '���� ��������';
comment on column FDC_REUSE_PAYORDER.new_payment_id
  is '��������� ������ �� �������';
create index NEW_PAYMENT_ID_INDX on FDC_REUSE_PAYORDER (NEW_PAYMENT_ID);
alter table FDC_REUSE_PAYORDER
  add constraint FDC_REUSE_PAYORDER_PK primary key (ID);
alter table FDC_REUSE_PAYORDER
  add constraint REUSE_PAYORDER_ID foreign key (ID)
  references FDC_CUSTOM_DECL (ID) on delete cascade;
alter table FDC_REUSE_PAYORDER
  add constraint REUSE_PAYORDER_NEW_PAYMENT_ID foreign key (NEW_PAYMENT_ID)
  references FDC_PAYMENT_ORDER (ID);

prompt
prompt Creating table FDC_ROLE
prompt =======================
prompt
create table FDC_ROLE
(
  id        NUMBER(15) not null,
  role_name VARCHAR2(32) not null
)
;
comment on table FDC_ROLE
  is '���� �������';
comment on column FDC_ROLE.id
  is '�������������';
comment on column FDC_ROLE.role_name
  is '�������� ����';
alter table FDC_ROLE
  add constraint FDC_ROLE_PK primary key (ID);
alter table FDC_ROLE
  add constraint FDC_ROLE_AK1 unique (ROLE_NAME);
alter table FDC_ROLE
  add constraint FDC_ROLE_ID_FK foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_RTU_ACCOUNTS
prompt ===============================
prompt
create table FDC_RTU_ACCOUNTS
(
  id           NUMBER(15) not null,
  valuta       VARCHAR2(3) not null,
  account      VARCHAR2(21) not null,
  customs_code VARCHAR2(8),
  valid        NUMBER
)
;
comment on table FDC_RTU_ACCOUNTS
  is '����� ���';
comment on column FDC_RTU_ACCOUNTS.id
  is 'ID';
comment on column FDC_RTU_ACCOUNTS.valuta
  is 'VALUTA';
comment on column FDC_RTU_ACCOUNTS.account
  is 'ACCOUNT';
comment on column FDC_RTU_ACCOUNTS.customs_code
  is 'CUSTOMS_CODE';
comment on column FDC_RTU_ACCOUNTS.valid
  is 'VALID';
create unique index FDC_RTU_ACCOUNT#INDX#U on FDC_RTU_ACCOUNTS (ACCOUNT);
alter table FDC_RTU_ACCOUNTS
  add constraint RTU_ACCOUNTS#PK primary key (ID);
alter table FDC_RTU_ACCOUNTS
  add constraint RTU_ACCOUNTS#FK#ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_SESSION
prompt ==========================
prompt
create table FDC_SESSION
(
  id                 NUMBER(15) not null,
  initial_session_id NUMBER(15),
  end_session_id     NUMBER(15) default 0 not null,
  local_id           NUMBER(15),
  dt_start           DATE default SYSDATE not null,
  dt_end             DATE,
  message            VARCHAR2(1500),
  job_id             NUMBER
)
;
comment on table FDC_SESSION
  is '������� ��������� ������ � �������';
comment on column FDC_SESSION.id
  is '����������� � ������ �������� ������ �� ���';
comment on column FDC_SESSION.initial_session_id
  is '������������� ����������������� ��������, ������� ������ ������� �������. ��� �������� �����, ��� ��� ������ ��������� ����� ���������';
comment on column FDC_SESSION.end_session_id
  is '������������� ����������� ������';
comment on column FDC_SESSION.local_id
  is '������������� �������� � ������������������ ������� ��� ������� ���� ��������� (� ������, ���� ������� ����� ������������� ������ ��������� ��������� ������������� ����)';
comment on column FDC_SESSION.dt_start
  is '������ ������ ������';
comment on column FDC_SESSION.dt_end
  is '������ ��������� ������';
comment on column FDC_SESSION.message
  is '��������� �� ������ ������ (������� ����������� ����������)';
comment on column FDC_SESSION.job_id
  is '������������� JOB, ���� ������� ����������� ��� ������� ������� �� (job)';
alter table FDC_SESSION
  add constraint FDC_SESSION_PK primary key (ID);
alter table FDC_SESSION
  add constraint SESSION_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_STD_PAY_RECEIVERS
prompt ====================================
prompt
create table FDC_STD_PAY_RECEIVERS
(
  id            NUMBER(15) not null,
  account       VARCHAR2(21) not null,
  bic           VARCHAR2(9) not null,
  inn           VARCHAR2(12),
  receiver_name VARCHAR2(80) not null,
  bank_name     VARCHAR2(80) not null,
  swift         VARCHAR2(11),
  bank_address  VARCHAR2(80),
  begin_date    DATE,
  end_date      DATE
)
;
comment on table FDC_STD_PAY_RECEIVERS
  is '����������� ���������� ��������';
comment on column FDC_STD_PAY_RECEIVERS.id
  is 'ID';
comment on column FDC_STD_PAY_RECEIVERS.account
  is 'ACCOUNT';
comment on column FDC_STD_PAY_RECEIVERS.bic
  is 'BIC';
comment on column FDC_STD_PAY_RECEIVERS.inn
  is 'INN';
comment on column FDC_STD_PAY_RECEIVERS.receiver_name
  is 'RECEIVER_NAME';
comment on column FDC_STD_PAY_RECEIVERS.bank_name
  is 'BANK_NAME';
comment on column FDC_STD_PAY_RECEIVERS.swift
  is 'SWIFT';
comment on column FDC_STD_PAY_RECEIVERS.bank_address
  is 'BANK_ADDRESS';
comment on column FDC_STD_PAY_RECEIVERS.begin_date
  is 'BEGIN_DATE';
comment on column FDC_STD_PAY_RECEIVERS.end_date
  is 'END_DATE';
create index FDC_STD_PAY_REC_BEG_DATE_I on FDC_STD_PAY_RECEIVERS (BEGIN_DATE);
create index FDC_STD_PAY_REC_END_DATE_I on FDC_STD_PAY_RECEIVERS (END_DATE);
create index STD_PAY_RECEIVERS#CUR#ACCOUNT on FDC_STD_PAY_RECEIVERS (SUBSTR(ACCOUNT,6,3));
alter table FDC_STD_PAY_RECEIVERS
  add constraint STD_PAY_RECEIVERS#PK primary key (ID);
alter table FDC_STD_PAY_RECEIVERS
  add constraint STD_PAY_RECEIVERS#FK#ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_SUBJECT_FEE
prompt ==============================
prompt
create table FDC_SUBJECT_FEE
(
  id NUMBER(15) not null
)
;
comment on table FDC_SUBJECT_FEE
  is '������� FDC_SUBJECT_FEE';
comment on column FDC_SUBJECT_FEE.id
  is 'ID';
alter table FDC_SUBJECT_FEE
  add constraint XPKFDC_SUBJECT_FEE primary key (ID);
alter table FDC_SUBJECT_FEE
  add foreign key (ID)
  references FDC_OTHERS_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_SUBJECT_FEE_DEPT
prompt ===================================
prompt
create table FDC_SUBJECT_FEE_DEPT
(
  id NUMBER(15) not null
)
;
comment on table FDC_SUBJECT_FEE_DEPT
  is '������� FDC_SUBJECT_FEE_DEPT';
comment on column FDC_SUBJECT_FEE_DEPT.id
  is 'ID';
alter table FDC_SUBJECT_FEE_DEPT
  add constraint XPKFDC_SUBJECT_FEE_DEPT primary key (ID);
alter table FDC_SUBJECT_FEE_DEPT
  add foreign key (ID)
  references FDC_OTHERS_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_SUBJECT_FEE_FINE
prompt ===================================
prompt
create table FDC_SUBJECT_FEE_FINE
(
  id NUMBER(15) not null
)
;
comment on table FDC_SUBJECT_FEE_FINE
  is '������� FDC_SUBJECT_FEE_FINE';
comment on column FDC_SUBJECT_FEE_FINE.id
  is 'ID';
alter table FDC_SUBJECT_FEE_FINE
  add constraint XPKFDC_SUBJECT_FEE_FINE primary key (ID);
alter table FDC_SUBJECT_FEE_FINE
  add foreign key (ID)
  references FDC_OTHERS_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_SUBJECT_FEE_OTHERS
prompt =====================================
prompt
create table FDC_SUBJECT_FEE_OTHERS
(
  id NUMBER(15) not null
)
;
comment on table FDC_SUBJECT_FEE_OTHERS
  is '������� FDC_SUBJECT_FEE_OTHERS';
comment on column FDC_SUBJECT_FEE_OTHERS.id
  is 'ID';
alter table FDC_SUBJECT_FEE_OTHERS
  add constraint XPKFDC_SUBJECT_FEE_OTHERS primary key (ID);
alter table FDC_SUBJECT_FEE_OTHERS
  add foreign key (ID)
  references FDC_OTHERS_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_SUBSCRIPTION
prompt ===============================
prompt
create table FDC_SUBSCRIPTION
(
  id           NUMBER(15) not null,
  addressee_id NUMBER(15) not null,
  object_id    NUMBER(15),
  evidence_id  NUMBER(15) not null,
  active       NUMBER(1) not null,
  startdate    DATE not null,
  stopdate     DATE
)
;
comment on table FDC_SUBSCRIPTION
  is '������������ ����� � ��������� ������� ������� ��� ������� ���������� �� ���� (� ��� ��������) �� ��������� �� ������� (�.�. ���� ������ ������ � ��������� �������).';
comment on column FDC_SUBSCRIPTION.id
  is '������������� ��������';
comment on column FDC_SUBSCRIPTION.addressee_id
  is '������ �� ������-������� �������� - ������ User ��� UserGroup';
comment on column FDC_SUBSCRIPTION.object_id
  is '������ �� ������ ��������, �.�. ������ ����������� ������������ �� ���� �������. � ������, ���� ��� ������ �� ObjectType - �������� ���������������� �� ��� ������� ������� ����.';
comment on column FDC_SUBSCRIPTION.evidence_id
  is '������ �� ������-��������� ��������. ���������� ����� �������, � ������ �������, ��� ������������, ��������� ��������, ���, ��������, ����������� (������) �� ����������� ������������� �������';
comment on column FDC_SUBSCRIPTION.active
  is '������� ���������� ��������';
comment on column FDC_SUBSCRIPTION.startdate
  is '������ ������ ��������';
comment on column FDC_SUBSCRIPTION.stopdate
  is '������ ��������� ��������';
create index FDC_SUBSCRIPTION_IE1 on FDC_SUBSCRIPTION (ACTIVE, OBJECT_ID, ID);
create index FDC_SUBSCRIPTION_IF3 on FDC_SUBSCRIPTION (ADDRESSEE_ID);
create index FDC_SUBSCRIPTION_IF33 on FDC_SUBSCRIPTION (OBJECT_ID);
create index FDC_SUBSCRIPTION_IF34 on FDC_SUBSCRIPTION (EVIDENCE_ID);
alter table FDC_SUBSCRIPTION
  add constraint FDC_SUBSCRIPTION_PK primary key (ID);
alter table FDC_SUBSCRIPTION
  add constraint SUBSCRIPTION_ADDRESSEE_ID foreign key (ADDRESSEE_ID)
  references FDC_OBJECT (ID);
alter table FDC_SUBSCRIPTION
  add constraint SUBSCRIPTION_EVIDENCE_ID foreign key (EVIDENCE_ID)
  references FDC_OBJECT (ID);
alter table FDC_SUBSCRIPTION
  add constraint SUBSCRIPTION_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;
alter table FDC_SUBSCRIPTION
  add constraint SUBSCRIPTION_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_SUBSCRIPTION
  add constraint YESORNO595
  check (Active IN (0, 1));

prompt
prompt Creating table FDC_SUBSCR_EVENT_TYPE
prompt ====================================
prompt
create table FDC_SUBSCR_EVENT_TYPE
(
  subscription_id NUMBER(15) not null,
  event_type_id   NUMBER(15) not null
)
;
comment on table FDC_SUBSCR_EVENT_TYPE
  is '���������� ���������� ���� �������, �� ������� �� ��������� ������� �������� ��������';
comment on column FDC_SUBSCR_EVENT_TYPE.subscription_id
  is '������������� ��������';
comment on column FDC_SUBSCR_EVENT_TYPE.event_type_id
  is '������������� ���� �������';
create index SUBSCR_EVENT_TYPE_EVENT_TY_FDC on FDC_SUBSCR_EVENT_TYPE (EVENT_TYPE_ID);
create index SUBSCR_EVENT_TYPE_SUBSCRIP_FDC on FDC_SUBSCR_EVENT_TYPE (SUBSCRIPTION_ID);
alter table FDC_SUBSCR_EVENT_TYPE
  add constraint FDC_SUBSCR_EVENT_TYPE_PK primary key (SUBSCRIPTION_ID, EVENT_TYPE_ID);
alter table FDC_SUBSCR_EVENT_TYPE
  add constraint FDC_SUBSCR_EVENT_TYPE_AK1 unique (EVENT_TYPE_ID, SUBSCRIPTION_ID);
alter table FDC_SUBSCR_EVENT_TYPE
  add constraint SUBSCR_EVENT_TYPE_EVENT_TYPE_I foreign key (EVENT_TYPE_ID)
  references FDC_EVENT_TYPE (ID);
alter table FDC_SUBSCR_EVENT_TYPE
  add constraint SUBSCR_EVENT_TYPE_SUBSCRIPTION foreign key (SUBSCRIPTION_ID)
  references FDC_SUBSCRIPTION (ID);

prompt
prompt Creating table FDC_SUBSCR_NOTIFICATION
prompt ======================================
prompt
create table FDC_SUBSCR_NOTIFICATION
(
  subscription_id NUMBER(15) not null,
  notification_id NUMBER(15) not null
)
;
comment on table FDC_SUBSCR_NOTIFICATION
  is '����� ����������� � ���������. ����������� ����� ��������� ��� �� ��������, ���  � ��� ���';
comment on column FDC_SUBSCR_NOTIFICATION.subscription_id
  is '������ �� ��������';
comment on column FDC_SUBSCR_NOTIFICATION.notification_id
  is '������ �� �����������';
create index FDC_SUBSCR_NOTIFICATION_IF65 on FDC_SUBSCR_NOTIFICATION (NOTIFICATION_ID);
create index SUBSCR_ADDRESSEE_SUBSCRIPT_FDC on FDC_SUBSCR_NOTIFICATION (SUBSCRIPTION_ID);
alter table FDC_SUBSCR_NOTIFICATION
  add constraint FDC_SUBSCR_NOTIFICATION_PK primary key (SUBSCRIPTION_ID, NOTIFICATION_ID);
alter table FDC_SUBSCR_NOTIFICATION
  add constraint FDC_SUBSCR_NOTIFICATION_AK1 unique (NOTIFICATION_ID, SUBSCRIPTION_ID);
alter table FDC_SUBSCR_NOTIFICATION
  add constraint SUBSCR_ADDRESSEE_SUBSCRIPTION_ foreign key (SUBSCRIPTION_ID)
  references FDC_SUBSCRIPTION (ID);
alter table FDC_SUBSCR_NOTIFICATION
  add constraint SUBSCR_NOTIFICATION_NOTIFICATI foreign key (NOTIFICATION_ID)
  references FDC_EVENT_NOTIFICATION (ID);

prompt
prompt Creating table FDC_TASK
prompt =======================
prompt
create table FDC_TASK
(
  id NUMBER(15) not null
)
;
comment on table FDC_TASK
  is '���������� ������';
comment on column FDC_TASK.id
  is 'ID';
alter table FDC_TASK
  add constraint FDC_TASK_PK primary key (ID);
alter table FDC_TASK
  add constraint TASK_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_TASK_SYSCOMPONENT
prompt ====================================
prompt
create table FDC_TASK_SYSCOMPONENT
(
  task_id         NUMBER(15) not null,
  syscomponent_id NUMBER(15) not null
)
;
comment on table FDC_TASK_SYSCOMPONENT
  is '����� ��������� �����������, �������� � ������.';
comment on column FDC_TASK_SYSCOMPONENT.task_id
  is 'TASK_ID';
comment on column FDC_TASK_SYSCOMPONENT.syscomponent_id
  is 'SYSCOMPONENT_ID';
create index TASK_SYSCOMPONENT_SYSCOMPO_FDC on FDC_TASK_SYSCOMPONENT (SYSCOMPONENT_ID);
create index TASK_SYSCOMPONENT_TASK_ID_FDC on FDC_TASK_SYSCOMPONENT (TASK_ID);
alter table FDC_TASK_SYSCOMPONENT
  add constraint FDC_TASK_SYSCOMPONENT_PK primary key (TASK_ID, SYSCOMPONENT_ID);
alter table FDC_TASK_SYSCOMPONENT
  add constraint FDC_TASK_SYSCOMPONENT_AK1 unique (SYSCOMPONENT_ID, TASK_ID);
alter table FDC_TASK_SYSCOMPONENT
  add constraint TASK_SYSCOMPONENT_SYSCOMPONENT foreign key (SYSCOMPONENT_ID)
  references FDC_SYSCOMPONENT (ID);
alter table FDC_TASK_SYSCOMPONENT
  add constraint TASK_SYSCOMPONENT_TASK_ID foreign key (TASK_ID)
  references FDC_TASK (ID);

prompt
prompt Creating table FDC_TMP_ACC_TRANS
prompt ================================
prompt
create global temporary table FDC_TMP_ACC_TRANS
(
  account_code   VARCHAR2(20),
  currency_code  VARCHAR2(20),
  pay_type_code  VARCHAR2(20),
  kbk            VARCHAR2(20),
  is_debit       VARCHAR2(20),
  operation_date DATE,
  operation_sum  NUMBER(36,4),
  exch_rate      INTEGER,
  sum_rur        NUMBER(36,4),
  subject_inn    VARCHAR2(12),
  subject_kpp    VARCHAR2(10),
  subject_name   VARCHAR2(200),
  is_ts          VARCHAR2(1)
)
on commit delete rows;
comment on table FDC_TMP_ACC_TRANS
  is '��������� ������� ��� �������� ������������ ������� ����������� ������';
comment on column FDC_TMP_ACC_TRANS.account_code
  is '��� �����';
comment on column FDC_TMP_ACC_TRANS.currency_code
  is '��� ������';
comment on column FDC_TMP_ACC_TRANS.pay_type_code
  is '��� ���� �������';
comment on column FDC_TMP_ACC_TRANS.kbk
  is '���';
comment on column FDC_TMP_ACC_TRANS.is_debit
  is '������� ������:
Y - �����
N - ������';
comment on column FDC_TMP_ACC_TRANS.operation_date
  is '���� ��������';
comment on column FDC_TMP_ACC_TRANS.operation_sum
  is '����� �������� � ������ ���������';
comment on column FDC_TMP_ACC_TRANS.exch_rate
  is '���� ������ �� ���� ���������� ��������';
comment on column FDC_TMP_ACC_TRANS.sum_rur
  is '����� �������� � ������� �����������';
comment on column FDC_TMP_ACC_TRANS.subject_inn
  is '�������� ���. ���';
comment on column FDC_TMP_ACC_TRANS.subject_kpp
  is '�������� ���. ���';
comment on column FDC_TMP_ACC_TRANS.subject_name
  is '�������� ���. ��������';
comment on column FDC_TMP_ACC_TRANS.is_ts
  is '������� ����������� �����';

prompt
prompt Creating table FDC_TMP_GTD
prompt ==========================
prompt
create table FDC_TMP_GTD
(
  id               NUMBER(15) not null,
  name             VARCHAR2(1500),
  shortname        VARCHAR2(1500),
  descript         VARCHAR2(1500),
  ext_source       VARCHAR2(8),
  ext_typesysname  VARCHAR2(1500),
  ext_id           NUMBER(15),
  doc_date         DATE,
  doc_number       VARCHAR2(100),
  name_p           VARCHAR2(4000),
  inn_p            VARCHAR2(12),
  kpp_p            VARCHAR2(10),
  curr_code        VARCHAR2(3),
  custom_mode_code VARCHAR2(3),
  customs_code     VARCHAR2(8),
  reg_date         DATE,
  decl_no          VARCHAR2(10),
  modify_date      DATE,
  decision_code    VARCHAR2(2),
  g011             VARCHAR2(2),
  okpo             VARCHAR2(10),
  inn              VARCHAR2(12),
  g12              NUMBER(22,2),
  g444a            VARCHAR2(80),
  g444b            DATE,
  g447a            VARCHAR2(50),
  g447b            DATE,
  k115             VARCHAR2(100),
  g40              VARCHAR2(23),
  g221             VARCHAR2(3),
  act_no           VARCHAR2(30),
  gd1              DATE,
  export_date      DATE,
  g0131            VARCHAR2(10),
  charge_month     DATE,
  load_from_dk     NUMBER(1),
  agrmt_no         VARCHAR2(10),
  agrmt_date       DATE,
  pack_id          NUMBER(15),
  closed_date      DATE,
  pipeline         CHAR(1) default 'N' not null
)
;
comment on table FDC_TMP_GTD
  is '��������� �������. ������������ ��� �������� ������� ��� ���';
comment on column FDC_TMP_GTD.id
  is 'ID';
comment on column FDC_TMP_GTD.name
  is 'NAME';
comment on column FDC_TMP_GTD.shortname
  is 'SHORTNAME';
comment on column FDC_TMP_GTD.descript
  is 'DESCRIPT';
comment on column FDC_TMP_GTD.ext_source
  is 'EXT_SOURCE';
comment on column FDC_TMP_GTD.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column FDC_TMP_GTD.ext_id
  is 'EXT_ID';
comment on column FDC_TMP_GTD.doc_date
  is 'DOC_DATE';
comment on column FDC_TMP_GTD.doc_number
  is 'DOC_NUMBER';
comment on column FDC_TMP_GTD.name_p
  is 'NAME_P';
comment on column FDC_TMP_GTD.inn_p
  is 'INN_P';
comment on column FDC_TMP_GTD.kpp_p
  is 'KPP_P';
comment on column FDC_TMP_GTD.curr_code
  is 'CURR_CODE';
comment on column FDC_TMP_GTD.custom_mode_code
  is 'CUSTOM_MODE_CODE';
comment on column FDC_TMP_GTD.customs_code
  is 'CUSTOMS_CODE';
comment on column FDC_TMP_GTD.reg_date
  is 'REG_DATE';
comment on column FDC_TMP_GTD.decl_no
  is 'DECL_NO';
comment on column FDC_TMP_GTD.modify_date
  is 'MODIFY_DATE';
comment on column FDC_TMP_GTD.decision_code
  is 'DECISION_CODE';
comment on column FDC_TMP_GTD.g011
  is 'G011';
comment on column FDC_TMP_GTD.okpo
  is 'OKPO';
comment on column FDC_TMP_GTD.inn
  is 'INN';
comment on column FDC_TMP_GTD.g12
  is 'G12';
comment on column FDC_TMP_GTD.g444a
  is 'G444A';
comment on column FDC_TMP_GTD.g444b
  is 'G444B';
comment on column FDC_TMP_GTD.g447a
  is 'G447A';
comment on column FDC_TMP_GTD.g447b
  is 'G447B';
comment on column FDC_TMP_GTD.k115
  is 'K115';
comment on column FDC_TMP_GTD.g40
  is 'G40';
comment on column FDC_TMP_GTD.g221
  is 'G221';
comment on column FDC_TMP_GTD.act_no
  is 'ACT_NO';
comment on column FDC_TMP_GTD.gd1
  is 'GD1';
comment on column FDC_TMP_GTD.export_date
  is 'EXPORT_DATE';
comment on column FDC_TMP_GTD.g0131
  is 'G0131';
comment on column FDC_TMP_GTD.charge_month
  is 'CHARGE_MONTH';
comment on column FDC_TMP_GTD.load_from_dk
  is 'LOAD_FROM_DK';
comment on column FDC_TMP_GTD.agrmt_no
  is 'AGRMT_NO';
comment on column FDC_TMP_GTD.agrmt_date
  is 'AGRMT_DATE';
comment on column FDC_TMP_GTD.pack_id
  is '������ ��� ���';
comment on column FDC_TMP_GTD.closed_date
  is '���� ��������';
comment on column FDC_TMP_GTD.pipeline
  is '������� ������������ � ����� ���������� ��� ( Y|N )';
create index FDC#FK#TMP_GTD#PACK on FDC_TMP_GTD (PACK_ID);
alter table FDC_TMP_GTD
  add constraint FDC#PK#TMP_GTD primary key (ID);
alter table FDC_TMP_GTD
  add constraint FDC#AK#TMP_GTD unique (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);
alter table FDC_TMP_GTD
  add constraint FDC#FK#TMP_GTD#PACK foreign key (PACK_ID)
  references FDC_DOC_PACK_GTD_KNP (ID) on delete set null;
alter table FDC_TMP_GTD
  add constraint FDC#CHK#TMP_GTD#PIPELINE
  check (PipeLine IN ('Y', 'N'));

prompt
prompt Creating table FDC_TMP_CHARGE
prompt =============================
prompt
create table FDC_TMP_CHARGE
(
  id                 NUMBER(15) not null,
  decl_id            NUMBER(15) not null,
  pay_type_code      VARCHAR2(4),
  summa              NUMBER(22,2) not null,
  curr_code          VARCHAR2(3),
  change_desc        VARCHAR2(2000),
  change_date        DATE,
  kbk                VARCHAR2(20),
  charge_month       DATE,
  pack_id            NUMBER(15),
  ext_source         VARCHAR2(8),
  ext_typesysname    VARCHAR2(1500),
  ext_id             NUMBER(15),
  change_reason_code CHAR(1) default '0'
)
;
comment on table FDC_TMP_CHARGE
  is '������� FDC_TMP_CHARGE';
comment on column FDC_TMP_CHARGE.id
  is 'ID';
comment on column FDC_TMP_CHARGE.decl_id
  is 'DECL_ID';
comment on column FDC_TMP_CHARGE.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column FDC_TMP_CHARGE.summa
  is 'SUMMA';
comment on column FDC_TMP_CHARGE.curr_code
  is 'CURR_CODE';
comment on column FDC_TMP_CHARGE.change_desc
  is 'CHANGE_DESC';
comment on column FDC_TMP_CHARGE.change_date
  is 'CHANGE_DATE';
comment on column FDC_TMP_CHARGE.kbk
  is 'KBK';
comment on column FDC_TMP_CHARGE.charge_month
  is 'CHARGE_MONTH';
comment on column FDC_TMP_CHARGE.pack_id
  is '������ ��� ���';
comment on column FDC_TMP_CHARGE.ext_source
  is 'EXT_SOURCE';
comment on column FDC_TMP_CHARGE.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column FDC_TMP_CHARGE.ext_id
  is 'EXT_ID';
comment on column FDC_TMP_CHARGE.change_reason_code
  is '��� ������� ������������� ��� (0-�� ���������� ��� �����������, 2-���, 3-������ )';
create index FDC#FK#TMP_CHARGE#PACK on FDC_TMP_CHARGE (PACK_ID);
create index FDC#IDX#TMP_CHARGE#DECL on FDC_TMP_CHARGE (DECL_ID);
alter table FDC_TMP_CHARGE
  add constraint FDC#PK#TMP_CHARGE primary key (ID);
alter table FDC_TMP_CHARGE
  add constraint FDC#AK#TMP_CHARGE unique (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);
alter table FDC_TMP_CHARGE
  add constraint FDC#FK#TMP_CHARGE#DECL foreign key (DECL_ID)
  references FDC_TMP_GTD (ID) on delete cascade;
alter table FDC_TMP_CHARGE
  add constraint FDC#FK#TMP_CHARGE#PACK foreign key (PACK_ID)
  references FDC_DOC_PACK_GTD_KNP (ID) on delete set null;
alter table FDC_TMP_CHARGE
  add constraint FDC#CHK#TMP_CHARGE#REASON
  check (CHANGE_REASON_CODE IN ('0', '2', '3'));

prompt
prompt Creating table FDC_TMP_DEDUCTION
prompt ================================
prompt
create table FDC_TMP_DEDUCTION
(
  id               NUMBER(15) not null,
  decl_id          NUMBER(15) not null,
  pay_type_code    VARCHAR2(4),
  summa            NUMBER(24,4) not null,
  payment_date     DATE,
  payment_month    DATE,
  charge_curr_code VARCHAR2(3),
  charge_summa     NUMBER(24,4),
  kbk1             VARCHAR2(20),
  kbk              VARCHAR2(20),
  pack_id          NUMBER(15),
  ext_source       VARCHAR2(8),
  ext_typesysname  VARCHAR2(1500),
  ext_id           NUMBER(15),
  paid             VARCHAR2(1) default 'N' not null
)
;
comment on table FDC_TMP_DEDUCTION
  is '������� FDC_TMP_DEDUCTION';
comment on column FDC_TMP_DEDUCTION.id
  is 'ID';
comment on column FDC_TMP_DEDUCTION.decl_id
  is 'DECL_ID';
comment on column FDC_TMP_DEDUCTION.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column FDC_TMP_DEDUCTION.summa
  is 'SUMMA';
comment on column FDC_TMP_DEDUCTION.payment_date
  is 'PAYMENT_DATE';
comment on column FDC_TMP_DEDUCTION.payment_month
  is 'PAYMENT_MONTH';
comment on column FDC_TMP_DEDUCTION.charge_curr_code
  is 'CHARGE_CURR_CODE';
comment on column FDC_TMP_DEDUCTION.charge_summa
  is 'CHARGE_SUMMA';
comment on column FDC_TMP_DEDUCTION.kbk1
  is 'KBK1';
comment on column FDC_TMP_DEDUCTION.kbk
  is 'KBK';
comment on column FDC_TMP_DEDUCTION.pack_id
  is '������ ��� ���';
comment on column FDC_TMP_DEDUCTION.ext_source
  is 'EXT_SOURCE';
comment on column FDC_TMP_DEDUCTION.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column FDC_TMP_DEDUCTION.ext_id
  is 'EXT_ID';
comment on column FDC_TMP_DEDUCTION.paid
  is 'PAID';
create index FDC#FK#TMP_DED#PACK on FDC_TMP_DEDUCTION (PACK_ID);
create index FDC#IDX#TMP_DEDUCTION#DECL on FDC_TMP_DEDUCTION (DECL_ID);
alter table FDC_TMP_DEDUCTION
  add constraint FDC#PK#TMP_DEDUCTION primary key (ID);
alter table FDC_TMP_DEDUCTION
  add constraint FDC#AK#TMP_DED unique (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);
alter table FDC_TMP_DEDUCTION
  add constraint FDC#FK#TMP_DED#PACK foreign key (PACK_ID)
  references FDC_DOC_PACK_GTD_KNP (ID) on delete set null;
alter table FDC_TMP_DEDUCTION
  add constraint FDC#FK#TMP_DEDUCTION#DECL foreign key (DECL_ID)
  references FDC_TMP_GTD (ID) on delete cascade;

prompt
prompt Creating table FDC_TMP_GOODS
prompt ============================
prompt
create table FDC_TMP_GOODS
(
  id              NUMBER(15) not null,
  decl_id         NUMBER(15) not null,
  no              NUMBER(4),
  goods_code      VARCHAR2(10),
  g36             VARCHAR2(7),
  g37             VARCHAR2(7),
  goods_count     NUMBER(30,6),
  pack_id         NUMBER(15),
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15)
)
;
comment on table FDC_TMP_GOODS
  is '������� FDC_TMP_GOODS';
comment on column FDC_TMP_GOODS.id
  is 'ID';
comment on column FDC_TMP_GOODS.decl_id
  is 'DECL_ID';
comment on column FDC_TMP_GOODS.no
  is 'NO';
comment on column FDC_TMP_GOODS.goods_code
  is 'GOODS_CODE';
comment on column FDC_TMP_GOODS.g36
  is 'G36';
comment on column FDC_TMP_GOODS.g37
  is 'G37';
comment on column FDC_TMP_GOODS.goods_count
  is 'GOODS_COUNT';
comment on column FDC_TMP_GOODS.pack_id
  is '������ ��� ���';
comment on column FDC_TMP_GOODS.ext_source
  is 'EXT_SOURCE';
comment on column FDC_TMP_GOODS.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column FDC_TMP_GOODS.ext_id
  is 'EXT_ID';
create index FDC#FK#TMP_GOODS#PACK on FDC_TMP_GOODS (PACK_ID);
create index FDC#IDX#TMP_GOODS#DECL on FDC_TMP_GOODS (DECL_ID);
alter table FDC_TMP_GOODS
  add constraint FDC#PK#TMP_GOODS primary key (ID);
alter table FDC_TMP_GOODS
  add constraint FDC#AK#TMP_GOODS unique (DECL_ID, NO);
alter table FDC_TMP_GOODS
  add constraint FDC#AK#TMP_GOODS#EXT unique (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);
alter table FDC_TMP_GOODS
  add constraint FDC#FK#TMP_GOODS#DECL foreign key (DECL_ID)
  references FDC_TMP_GTD (ID) on delete cascade;
alter table FDC_TMP_GOODS
  add constraint FDC#FK#TMP_GOODS#PACK foreign key (PACK_ID)
  references FDC_DOC_PACK_GTD_KNP (ID) on delete set null;

prompt
prompt Creating table FDC_TMP_SUBJECT_FUNDS
prompt ====================================
prompt
create global temporary table FDC_TMP_SUBJECT_FUNDS
(
  pack_id     NUMBER(15),
  asd_part_id NUMBER,
  subject_id  NUMBER(15),
  subject_xml VARCHAR2(4000),
  answer_xml  CLOB
)
on commit delete rows;
comment on table FDC_TMP_SUBJECT_FUNDS
  is '������� FDC_TMP_SUBJECT_FUNDS';
comment on column FDC_TMP_SUBJECT_FUNDS.pack_id
  is 'PACK_ID';
comment on column FDC_TMP_SUBJECT_FUNDS.asd_part_id
  is 'ASD_PART_ID';
comment on column FDC_TMP_SUBJECT_FUNDS.subject_id
  is 'SUBJECT_ID';
comment on column FDC_TMP_SUBJECT_FUNDS.subject_xml
  is 'SUBJECT_XML';
comment on column FDC_TMP_SUBJECT_FUNDS.answer_xml
  is 'ANSWER_XML';

prompt
prompt Creating table FDC_TMP_TIME_GTD
prompt ===============================
prompt
create table FDC_TMP_TIME_GTD
(
  id              NUMBER(15) not null,
  decl_id         NUMBER(15) not null,
  ext_source      VARCHAR2(8),
  ext_typesysname VARCHAR2(1500),
  ext_id          NUMBER(15),
  customs_code    VARCHAR2(8),
  reg_date        DATE,
  decl_no         VARCHAR2(10),
  pack_id         NUMBER(15)
)
;
comment on table FDC_TMP_TIME_GTD
  is '������� FDC_TMP_TIME_GTD';
comment on column FDC_TMP_TIME_GTD.id
  is 'ID';
comment on column FDC_TMP_TIME_GTD.decl_id
  is '������ ���';
comment on column FDC_TMP_TIME_GTD.ext_source
  is '�������������� ���� ��������� ���';
comment on column FDC_TMP_TIME_GTD.ext_typesysname
  is '�������������� ���� ��������� ���';
comment on column FDC_TMP_TIME_GTD.ext_id
  is '�������������� ���� ��������� ���';
comment on column FDC_TMP_TIME_GTD.customs_code
  is '��� ������� ��������� ���';
comment on column FDC_TMP_TIME_GTD.reg_date
  is '���� ��������� ���';
comment on column FDC_TMP_TIME_GTD.decl_no
  is '� ��������� ���';
comment on column FDC_TMP_TIME_GTD.pack_id
  is '������ ��� ���';
create index FDC#FK#TMP_TIME_GTD#PACK on FDC_TMP_TIME_GTD (PACK_ID);
create index FDC#IDX#TMP_TIME_GTD#DECL on FDC_TMP_TIME_GTD (DECL_ID);
alter table FDC_TMP_TIME_GTD
  add constraint FDC#PK#TMP_TIME_GTD primary key (ID);
alter table FDC_TMP_TIME_GTD
  add constraint FDC#FK#TMP_TIME_GTD#DECL foreign key (DECL_ID)
  references FDC_TMP_GTD (ID) on delete cascade;
alter table FDC_TMP_TIME_GTD
  add constraint FDC#FK#TMP_TIME_GTD#PACK foreign key (PACK_ID)
  references FDC_DOC_PACK_GTD_KNP (ID) on delete set null;

prompt
prompt Creating table FDC_TPO
prompt ======================
prompt
create table FDC_TPO
(
  id            NUMBER(15) not null,
  num_mpo       VARCHAR2(13),
  regim         VARCHAR2(2),
  meth_move     VARCHAR2(2),
  order_type    VARCHAR2(1),
  sum_rub       NUMBER,
  carrier_id    NUMBER(15),
  vid_trans     VARCHAR2(2),
  blank_version VARCHAR2(1)
)
;
comment on table FDC_TPO
  is '������� FDC_TPO';
comment on column FDC_TPO.id
  is 'ID';
comment on column FDC_TPO.num_mpo
  is 'NUM_MPO';
comment on column FDC_TPO.regim
  is 'REGIM';
comment on column FDC_TPO.meth_move
  is 'METH_MOVE';
comment on column FDC_TPO.order_type
  is 'ORDER_TYPE';
comment on column FDC_TPO.sum_rub
  is 'SUM_RUB';
comment on column FDC_TPO.carrier_id
  is '3-� ����, ��������� �������';
comment on column FDC_TPO.vid_trans
  is '��� ���� ����������, ������������� ��� ����������� ������';
comment on column FDC_TPO.blank_version
  is '������ ������';
create index FDC#FK#IDX#TPO#CARRIER on FDC_TPO (CARRIER_ID);
alter table FDC_TPO
  add constraint FDC_TPO_PK primary key (ID);
alter table FDC_TPO
  add constraint FK#FDC_TPO#CARRIER_ID foreign key (CARRIER_ID)
  references FDC_SUBJECT (ID);
alter table FDC_TPO
  add foreign key (ID)
  references FDC_DOC_CHARGE (ID) on delete cascade;

prompt
prompt Creating table FDC_TRANSACTION_ERROR
prompt ====================================
prompt
create table FDC_TRANSACTION_ERROR
(
  id               NUMBER(15) not null,
  transaction_id   NUMBER(15) not null,
  exchange_site_id NUMBER(15) not null,
  errorstring      VARCHAR2(1500) not null
)
;
comment on table FDC_TRANSACTION_ERROR
  is '������� FDC_TRANSACTION_ERROR';
comment on column FDC_TRANSACTION_ERROR.id
  is 'ID';
comment on column FDC_TRANSACTION_ERROR.transaction_id
  is 'TRANSACTION_ID';
comment on column FDC_TRANSACTION_ERROR.exchange_site_id
  is 'EXCHANGE_SITE_ID';
comment on column FDC_TRANSACTION_ERROR.errorstring
  is '�� ������ ���� ���������� �� ������ �� ������� ����.';
create index FDC_TRANSACTION_ERROR_IF1 on FDC_TRANSACTION_ERROR (TRANSACTION_ID);
create index FDC_TRANSACTION_ERROR_IF2 on FDC_TRANSACTION_ERROR (EXCHANGE_SITE_ID);
alter table FDC_TRANSACTION_ERROR
  add constraint FDC_TRANSACTION_ERROR_PK primary key (ID);
alter table FDC_TRANSACTION_ERROR
  add constraint TRANSACTION_ERROR_EXCHANGE_SIT foreign key (EXCHANGE_SITE_ID)
  references FDC_EXCHANGE_SITE (ID);
alter table FDC_TRANSACTION_ERROR
  add constraint TRANSACTION_ERROR_TRANSACTION_ foreign key (TRANSACTION_ID)
  references FDC_TRANSACTION (ID);

prompt
prompt Creating table FDC_TRANS_NOT_IN_REG
prompt ===================================
prompt
create table FDC_TRANS_NOT_IN_REG
(
  id NUMBER(15) not null
)
;
comment on table FDC_TRANS_NOT_IN_REG
  is '�������� �� ������� � ���������';
comment on column FDC_TRANS_NOT_IN_REG.id
  is '������������� ��������';
alter table FDC_TRANS_NOT_IN_REG
  add constraint FDC_TRANS_NOT_IN_REG_ID_PK primary key (ID);
alter table FDC_TRANS_NOT_IN_REG
  add constraint FDC_TRANS_NOT_IN_REG_ID_FK foreign key (ID)
  references FDC_ACC_TRANSACTION (ID);

prompt
prompt Creating table FDC_TR_DUPLICATE
prompt ===============================
prompt
create table FDC_TR_DUPLICATE
(
  id             NUMBER(15) not null,
  original_tr_id NUMBER(15) not null
)
;
comment on table FDC_TR_DUPLICATE
  is '��� � �������� ��������� � ����������� ������';
comment on column FDC_TR_DUPLICATE.id
  is '������������� ���� � �������� ��������� � ����������� ������';
comment on column FDC_TR_DUPLICATE.original_tr_id
  is '������������� ��������� ��';
create index FDC#FK#TR_DUPLICATE#TRID_FDC on FDC_TR_DUPLICATE (ORIGINAL_TR_ID);
alter table FDC_TR_DUPLICATE
  add constraint FDC#PK#TR_DUPLICATE primary key (ID);
alter table FDC_TR_DUPLICATE
  add constraint FDC#FK#TR_DUPLICATE#ID foreign key (ID)
  references FDC_TR (ID);
alter table FDC_TR_DUPLICATE
  add constraint FDC#FK#TR_DUPLICATE#TRID foreign key (ORIGINAL_TR_ID)
  references FDC_TR (ID);

prompt
prompt Creating table FDC_UNLOAD_LOGS
prompt ==============================
prompt
create table FDC_UNLOAD_LOGS
(
  id        NUMBER(15) not null,
  user_id   NUMBER(15) not null,
  log_date  DATE not null,
  mnemocode VARCHAR2(50),
  value     VARCHAR2(4000)
)
;
comment on table FDC_UNLOAD_LOGS
  is '������� FDC_UNLOAD_LOGS';
comment on column FDC_UNLOAD_LOGS.id
  is '�������������';
comment on column FDC_UNLOAD_LOGS.user_id
  is 'ID - ������������';
comment on column FDC_UNLOAD_LOGS.log_date
  is '���� ������';
comment on column FDC_UNLOAD_LOGS.mnemocode
  is '��������';
comment on column FDC_UNLOAD_LOGS.value
  is '������';
alter table FDC_UNLOAD_LOGS
  add constraint FDC_UNLOAD_LOGS_PK primary key (ID);

prompt
prompt Creating table FDC_UNLOAD_VURP
prompt ==============================
prompt
create table FDC_UNLOAD_VURP
(
  id           NUMBER(15) not null,
  doccode      VARCHAR2(10) not null,
  bank_docdate DATE not null,
  intcode      VARCHAR2(10) not null,
  code         VARCHAR2(20) not null,
  bunit_mnemo  VARCHAR2(20) not null,
  pay_sum      NUMBER(19,2) not null,
  is_accepted  NUMBER(1) not null
)
;
comment on table FDC_UNLOAD_VURP
  is '������� FDC_UNLOAD_VURP';
comment on column FDC_UNLOAD_VURP.id
  is 'ID';
comment on column FDC_UNLOAD_VURP.doccode
  is 'DOCCODE';
comment on column FDC_UNLOAD_VURP.bank_docdate
  is 'BANK_DOCDATE';
comment on column FDC_UNLOAD_VURP.intcode
  is 'INTCODE';
comment on column FDC_UNLOAD_VURP.code
  is 'CODE';
comment on column FDC_UNLOAD_VURP.bunit_mnemo
  is 'BUNIT_MNEMO';
comment on column FDC_UNLOAD_VURP.pay_sum
  is 'PAY_SUM';
comment on column FDC_UNLOAD_VURP.is_accepted
  is '���� 1 �� �������������, �.�. ������ ������� ��� ��������, ����� ������ ����� ��������';
alter table FDC_UNLOAD_VURP
  add constraint FDC_UNLOAD_VURP_PK primary key (ID);
alter table FDC_UNLOAD_VURP
  add constraint FDC_UNLOAD_VURP_UNQ unique (DOCCODE, BANK_DOCDATE, INTCODE, CODE, BUNIT_MNEMO);
alter table FDC_UNLOAD_VURP
  add constraint FVN_DOCCODE_CHK
  check ((DOCCODE IN ('�����','�����')));
alter table FDC_UNLOAD_VURP
  add constraint FVN_IS_ACCEPTED
  check ((IS_ACCEPTED IN (0, 1)));

prompt
prompt Creating table FDC_UPDATE_TYPE
prompt ==============================
prompt
create table FDC_UPDATE_TYPE
(
  id        NUMBER(15) not null,
  type_name VARCHAR2(250) not null
)
;
comment on table FDC_UPDATE_TYPE
  is '��� ����������(���������) ��';
comment on column FDC_UPDATE_TYPE.id
  is '������������� ����';
comment on column FDC_UPDATE_TYPE.type_name
  is '������������ ����';
alter table FDC_UPDATE_TYPE
  add constraint FDC#PK#UPDATE_TYPE primary key (ID);

prompt
prompt Creating table FDC_UPDATE_LOG
prompt =============================
prompt
create table FDC_UPDATE_LOG
(
  id                   VARCHAR2(150) not null,
  start_time           DATE not null,
  finish_time          DATE,
  update_type          NUMBER(15),
  update_file          VARCHAR2(250),
  ver_before           VARCHAR2(150),
  ver_after            VARCHAR2(150),
  description          VARCHAR2(2000),
  invalid_list_before  CLOB,
  invalid_count_before INTEGER,
  invalid_list_after   CLOB,
  invalid_count_after  INTEGER,
  log_file             CLOB
)
;
comment on table FDC_UPDATE_LOG
  is '������ ����������(���������) ��';
comment on column FDC_UPDATE_LOG.id
  is '������������� �������';
comment on column FDC_UPDATE_LOG.start_time
  is '���� � ����� ������ ����������';
comment on column FDC_UPDATE_LOG.finish_time
  is '���� � ����� ��������� ����������';
comment on column FDC_UPDATE_LOG.update_type
  is '��� ����������';
comment on column FDC_UPDATE_LOG.update_file
  is '��� ����� ����������';
comment on column FDC_UPDATE_LOG.ver_before
  is '������ �� �� ����������';
comment on column FDC_UPDATE_LOG.ver_after
  is '������ �� ����� ����������';
comment on column FDC_UPDATE_LOG.description
  is '�������� ����������';
comment on column FDC_UPDATE_LOG.invalid_list_before
  is '������ ���������� �������� �� ����������';
comment on column FDC_UPDATE_LOG.invalid_count_before
  is '���������� ���������� �������� �� ����������';
comment on column FDC_UPDATE_LOG.invalid_list_after
  is '������ ���������� �������� ����� ����������';
comment on column FDC_UPDATE_LOG.invalid_count_after
  is '���������� ���������� �������� ����� ����������';
comment on column FDC_UPDATE_LOG.log_file
  is '������ ����������';
create index FDC#FK#UPDATE_TYPE on FDC_UPDATE_LOG (UPDATE_TYPE);
alter table FDC_UPDATE_LOG
  add constraint FDC#PK#UPDATE_LOG primary key (ID);
alter table FDC_UPDATE_LOG
  add constraint FDC#FK#UPDATE_TYPE foreign key (UPDATE_TYPE)
  references FDC_UPDATE_TYPE (ID) on delete set null;

prompt
prompt Creating table FDC_USER_GRANT
prompt =============================
prompt
create table FDC_USER_GRANT
(
  user_id     NUMBER(15) not null,
  object_id   NUMBER(15) not null,
  accesslevel NUMBER(1) default 1 not null
)
;
comment on table FDC_USER_GRANT
  is '���������� ������� ������� � ������� ��� ����������� ������������.';
comment on column FDC_USER_GRANT.user_id
  is 'USER_ID';
comment on column FDC_USER_GRANT.object_id
  is 'OBJECT_ID';
comment on column FDC_USER_GRANT.accesslevel
  is '1 - ������ ������
2 - ���������
3 - ��������� ���� �������';
create index USER_GRANT_OBJECT_ID_FDC on FDC_USER_GRANT (OBJECT_ID);
create index USER_GRANT_USER_ID_FDC on FDC_USER_GRANT (USER_ID);
alter table FDC_USER_GRANT
  add constraint FDC_USER_GRANT_PK primary key (USER_ID, OBJECT_ID);
alter table FDC_USER_GRANT
  add constraint FDC_USER_GRANT_AK1 unique (OBJECT_ID, USER_ID);
alter table FDC_USER_GRANT
  add constraint USER_GRANT_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_USER_GRANT
  add constraint USER_GRANT_USER_ID foreign key (USER_ID)
  references FDC_USER (ID);
alter table FDC_USER_GRANT
  add constraint ACCESSLEVELRWG5
  check ((AccessLevel > 0) AND (AccessLevel < 4));

prompt
prompt Creating table FDC_USER_GROUP
prompt =============================
prompt
create table FDC_USER_GROUP
(
  id NUMBER(15) not null
)
;
comment on table FDC_USER_GROUP
  is '������ �������������.';
comment on column FDC_USER_GROUP.id
  is 'ID';
alter table FDC_USER_GROUP
  add constraint FDC_USER_GROUP_PK primary key (ID);
alter table FDC_USER_GROUP
  add constraint USER_GROUP_ID foreign key (ID)
  references FDC_OBJECT (ID) on delete cascade;

prompt
prompt Creating table FDC_USER_GROUP_GRANT
prompt ===================================
prompt
create table FDC_USER_GROUP_GRANT
(
  user_group_id NUMBER(15) not null,
  object_id     NUMBER(15) not null,
  accesslevel   NUMBER(1) default 1 not null
)
;
comment on table FDC_USER_GROUP_GRANT
  is '���������� ������� ������� � ������� ��� ������ �������������';
comment on column FDC_USER_GROUP_GRANT.user_group_id
  is 'USER_GROUP_ID';
comment on column FDC_USER_GROUP_GRANT.object_id
  is 'OBJECT_ID';
comment on column FDC_USER_GROUP_GRANT.accesslevel
  is '1 - ������ ������
2 - ���������
3 - ��������� ���� �������';
create index USER_GROUP_GRANT_OBJECT_ID_FDC on FDC_USER_GROUP_GRANT (OBJECT_ID);
create index USER_GROUP_GRANT_USER_GROU_FDC on FDC_USER_GROUP_GRANT (USER_GROUP_ID);
alter table FDC_USER_GROUP_GRANT
  add constraint FDC_USER_GROUP_GRANT_PK primary key (USER_GROUP_ID, OBJECT_ID);
alter table FDC_USER_GROUP_GRANT
  add constraint FDC_USER_GROUP_GRANT_AK1 unique (OBJECT_ID, USER_GROUP_ID);
alter table FDC_USER_GROUP_GRANT
  add constraint USER_GROUP_GRANT_OBJECT_ID foreign key (OBJECT_ID)
  references FDC_OBJECT (ID);
alter table FDC_USER_GROUP_GRANT
  add constraint USER_GROUP_GRANT_USER_GROUP_ID foreign key (USER_GROUP_ID)
  references FDC_USER_GROUP (ID);
alter table FDC_USER_GROUP_GRANT
  add constraint ACCESSLEVELRWG6
  check ((AccessLevel > 0) AND (AccessLevel < 4));

prompt
prompt Creating table FDC_USER_GROUP_TASK
prompt ==================================
prompt
create table FDC_USER_GROUP_TASK
(
  user_group_id NUMBER(15) not null,
  task_id       NUMBER(15) not null
)
;
comment on table FDC_USER_GROUP_TASK
  is '����� �����, ������������ ��� ������ �������������.';
comment on column FDC_USER_GROUP_TASK.user_group_id
  is 'USER_GROUP_ID';
comment on column FDC_USER_GROUP_TASK.task_id
  is 'TASK_ID';
create index USER_GROUP_TASK_TASK_ID_FDC on FDC_USER_GROUP_TASK (TASK_ID);
create index USER_GROUP_TASK_USER_GROUP_FDC on FDC_USER_GROUP_TASK (USER_GROUP_ID);
alter table FDC_USER_GROUP_TASK
  add constraint FDC_USER_GROUP_TASK_PK primary key (USER_GROUP_ID, TASK_ID);
alter table FDC_USER_GROUP_TASK
  add constraint FDC_USER_GROUP_TASK_AK1 unique (TASK_ID, USER_GROUP_ID);
alter table FDC_USER_GROUP_TASK
  add constraint USER_GROUP_TASK_TASK_ID foreign key (TASK_ID)
  references FDC_TASK (ID);
alter table FDC_USER_GROUP_TASK
  add constraint USER_GROUP_TASK_USER_GROUP_ID foreign key (USER_GROUP_ID)
  references FDC_USER_GROUP (ID);

prompt
prompt Creating table FDC_USER_IN_GROUP
prompt ================================
prompt
create table FDC_USER_IN_GROUP
(
  user_id       NUMBER(15) not null,
  user_group_id NUMBER(15) not null
)
;
comment on table FDC_USER_IN_GROUP
  is '���������� ��������� ������������ � ������ �������������.';
comment on column FDC_USER_IN_GROUP.user_id
  is 'USER_ID';
comment on column FDC_USER_IN_GROUP.user_group_id
  is 'USER_GROUP_ID';
create index USER_IN_GROUP_USER_GROUP_I_FDC on FDC_USER_IN_GROUP (USER_GROUP_ID);
create index USER_IN_GROUP_USER_ID_FDC on FDC_USER_IN_GROUP (USER_ID);
alter table FDC_USER_IN_GROUP
  add constraint FDC_USER_IN_GROUP_PK primary key (USER_ID, USER_GROUP_ID);
alter table FDC_USER_IN_GROUP
  add constraint FDC_USER_IN_GROUP_AK1 unique (USER_GROUP_ID, USER_ID);
alter table FDC_USER_IN_GROUP
  add constraint USER_IN_GROUP_USER_GROUP_ID foreign key (USER_GROUP_ID)
  references FDC_USER_GROUP (ID);
alter table FDC_USER_IN_GROUP
  add constraint USER_IN_GROUP_USER_ID foreign key (USER_ID)
  references FDC_USER (ID);

prompt
prompt Creating table FDC_VIEW
prompt =======================
prompt
create table FDC_VIEW
(
  id NUMBER(15) not null
)
;
comment on table FDC_VIEW
  is '����� �������� ������������������ � ������� �������������, �� ������� ����� ��������� ����� � ������ VERO.';
comment on column FDC_VIEW.id
  is 'ID';
alter table FDC_VIEW
  add constraint FDC_VIEW_PK primary key (ID);
alter table FDC_VIEW
  add constraint VIEW_ID foreign key (ID)
  references FDC_SERVER_COMPONENT (ID);

prompt
prompt Creating table LEG_BROKER_CONTRACT
prompt ==================================
prompt
create table LEG_BROKER_CONTRACT
(
  new_id      NUMBER(15),
  broker_inn  VARCHAR2(12) not null,
  broker_kpp  VARCHAR2(9) not null,
  subject_inn VARCHAR2(12) not null,
  subject_kpp VARCHAR2(9) not null,
  err_msg     VARCHAR2(2000)
)
;
comment on table LEG_BROKER_CONTRACT
  is '������� LEG_BROKER_CONTRACT';
comment on column LEG_BROKER_CONTRACT.new_id
  is 'NEW_ID';
comment on column LEG_BROKER_CONTRACT.broker_inn
  is 'BROKER_INN';
comment on column LEG_BROKER_CONTRACT.broker_kpp
  is 'BROKER_KPP';
comment on column LEG_BROKER_CONTRACT.subject_inn
  is 'SUBJECT_INN';
comment on column LEG_BROKER_CONTRACT.subject_kpp
  is 'SUBJECT_KPP';
comment on column LEG_BROKER_CONTRACT.err_msg
  is 'ERR_MSG';
alter table LEG_BROKER_CONTRACT
  add constraint LEG#PK#BROKER_CONTRACT primary key (BROKER_INN, BROKER_KPP, SUBJECT_INN, SUBJECT_KPP);

prompt
prompt Creating table LEG_CDECL_GOODS
prompt ==============================
prompt
create table LEG_CDECL_GOODS
(
  gtd_nnn       VARCHAR2(64),
  pay_type_id   INTEGER,
  pay_mode_id   INTEGER,
  summa         NUMBER(22,2),
  curr_id       INTEGER,
  goods_id      INTEGER,
  goods_code    VARCHAR2(20),
  pay_type_code VARCHAR2(3),
  pay_mode_code VARCHAR2(2),
  curr_code     VARCHAR2(3),
  no            NUMBER(3),
  ext_id        INTEGER
)
;
comment on table LEG_CDECL_GOODS
  is '������� LEG_CDECL_GOODS';
comment on column LEG_CDECL_GOODS.gtd_nnn
  is 'GTD_NNN';
comment on column LEG_CDECL_GOODS.pay_type_id
  is 'PAY_TYPE_ID';
comment on column LEG_CDECL_GOODS.pay_mode_id
  is 'PAY_MODE_ID';
comment on column LEG_CDECL_GOODS.summa
  is 'SUMMA';
comment on column LEG_CDECL_GOODS.curr_id
  is 'CURR_ID';
comment on column LEG_CDECL_GOODS.goods_id
  is 'GOODS_ID';
comment on column LEG_CDECL_GOODS.goods_code
  is 'GOODS_CODE';
comment on column LEG_CDECL_GOODS.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column LEG_CDECL_GOODS.pay_mode_code
  is 'PAY_MODE_CODE';
comment on column LEG_CDECL_GOODS.curr_code
  is 'CURR_CODE';
comment on column LEG_CDECL_GOODS.no
  is 'NO';
comment on column LEG_CDECL_GOODS.ext_id
  is 'EXT_ID';

prompt
prompt Creating table LEG_CUSTOM_DECL
prompt ==============================
prompt
create table LEG_CUSTOM_DECL
(
  nnn         VARCHAR2(64) not null,
  decl_no     VARCHAR2(40),
  inn         VARCHAR2(12),
  subject_id  INTEGER,
  g011        VARCHAR2(20),
  g012        VARCHAR2(20),
  g12         NUMBER(22,2),
  g221        VARCHAR2(100),
  g444a       VARCHAR2(100),
  g444b       DATE,
  g447a       VARCHAR2(100),
  g447b       DATE,
  k115        VARCHAR2(100),
  g40         VARCHAR2(100),
  gd1         DATE,
  curr_id     INTEGER,
  cust_mode   INTEGER,
  err_text    VARCHAR2(2000),
  nclose      INTEGER,
  srok        DATE,
  doza_p      NUMBER(22,2),
  doza_a      NUMBER(22,2),
  doza_n      NUMBER(22,2),
  kodval      VARCHAR2(3),
  curr2_id    INTEGER,
  forplat     NUMBER(3),
  tosv        NUMBER(3),
  id          INTEGER,
  cur_code    VARCHAR2(3),
  cur_code31  VARCHAR2(3),
  kpp         VARCHAR2(10),
  decl_name   VARCHAR2(100),
  g0131       VARCHAR2(3),
  load_mode   NUMBER(1),
  typesysname VARCHAR2(20)
)
;
comment on table LEG_CUSTOM_DECL
  is '������� LEG_CUSTOM_DECL';
comment on column LEG_CUSTOM_DECL.nnn
  is 'NNN';
comment on column LEG_CUSTOM_DECL.decl_no
  is 'DECL_NO';
comment on column LEG_CUSTOM_DECL.inn
  is 'INN';
comment on column LEG_CUSTOM_DECL.subject_id
  is 'SUBJECT_ID';
comment on column LEG_CUSTOM_DECL.g011
  is 'G011';
comment on column LEG_CUSTOM_DECL.g012
  is 'G012';
comment on column LEG_CUSTOM_DECL.g12
  is 'G12';
comment on column LEG_CUSTOM_DECL.g221
  is 'G221';
comment on column LEG_CUSTOM_DECL.g444a
  is 'G444A';
comment on column LEG_CUSTOM_DECL.g444b
  is 'G444B';
comment on column LEG_CUSTOM_DECL.g447a
  is 'G447A';
comment on column LEG_CUSTOM_DECL.g447b
  is 'G447B';
comment on column LEG_CUSTOM_DECL.k115
  is 'K115';
comment on column LEG_CUSTOM_DECL.g40
  is 'G40';
comment on column LEG_CUSTOM_DECL.gd1
  is 'GD1';
comment on column LEG_CUSTOM_DECL.curr_id
  is 'CURR_ID';
comment on column LEG_CUSTOM_DECL.cust_mode
  is 'CUST_MODE';
comment on column LEG_CUSTOM_DECL.err_text
  is 'ERR_TEXT';
comment on column LEG_CUSTOM_DECL.nclose
  is 'NCLOSE';
comment on column LEG_CUSTOM_DECL.srok
  is 'SROK';
comment on column LEG_CUSTOM_DECL.doza_p
  is 'DOZA_P';
comment on column LEG_CUSTOM_DECL.doza_a
  is 'DOZA_A';
comment on column LEG_CUSTOM_DECL.doza_n
  is 'DOZA_N';
comment on column LEG_CUSTOM_DECL.kodval
  is 'KODVAL';
comment on column LEG_CUSTOM_DECL.curr2_id
  is 'CURR2_ID';
comment on column LEG_CUSTOM_DECL.forplat
  is 'FORPLAT';
comment on column LEG_CUSTOM_DECL.tosv
  is 'TOSV';
comment on column LEG_CUSTOM_DECL.id
  is 'ID';
comment on column LEG_CUSTOM_DECL.cur_code
  is 'CUR_CODE';
comment on column LEG_CUSTOM_DECL.cur_code31
  is 'CUR_CODE31';
comment on column LEG_CUSTOM_DECL.kpp
  is 'KPP';
comment on column LEG_CUSTOM_DECL.decl_name
  is 'DECL_NAME';
comment on column LEG_CUSTOM_DECL.g0131
  is 'G0131';
comment on column LEG_CUSTOM_DECL.load_mode
  is '������� ���� ��������';
comment on column LEG_CUSTOM_DECL.typesysname
  is 'TYPESYSNAME';
alter table LEG_CUSTOM_DECL
  add constraint LEG_CUSTOM_DECL_PK primary key (NNN);

prompt
prompt Creating table LEG_ERROR
prompt ========================
prompt
create table LEG_ERROR
(
  obj_type   VARCHAR2(3) not null,
  nnn        VARCHAR2(64) not null,
  error_text VARCHAR2(4000),
  err_type   VARCHAR2(5) not null
)
;
comment on table LEG_ERROR
  is '������� LEG_ERROR';
comment on column LEG_ERROR.obj_type
  is 'OBJ_TYPE';
comment on column LEG_ERROR.nnn
  is 'NNN';
comment on column LEG_ERROR.error_text
  is 'ERROR_TEXT';
comment on column LEG_ERROR.err_type
  is 'ERR_TYPE';
alter table LEG_ERROR
  add constraint LEG_ERR_PK primary key (OBJ_TYPE, NNN, ERR_TYPE);

prompt
prompt Creating table LEG_GTD2PLAT
prompt ===========================
prompt
create table LEG_GTD2PLAT
(
  gtd_nnn       VARCHAR2(64),
  pay_type_id   INTEGER,
  curr_id       INTEGER,
  summa         NUMBER(22,2),
  plat_nnn      VARCHAR2(64),
  curr_code     VARCHAR2(3),
  pay_type_code VARCHAR2(3),
  ext_id        INTEGER
)
;
comment on table LEG_GTD2PLAT
  is '������� LEG_GTD2PLAT';
comment on column LEG_GTD2PLAT.gtd_nnn
  is 'GTD_NNN';
comment on column LEG_GTD2PLAT.pay_type_id
  is 'PAY_TYPE_ID';
comment on column LEG_GTD2PLAT.curr_id
  is 'CURR_ID';
comment on column LEG_GTD2PLAT.summa
  is 'SUMMA';
comment on column LEG_GTD2PLAT.plat_nnn
  is 'PLAT_NNN';
comment on column LEG_GTD2PLAT.curr_code
  is 'CURR_CODE';
comment on column LEG_GTD2PLAT.pay_type_code
  is 'PAY_TYPE_CODE';
comment on column LEG_GTD2PLAT.ext_id
  is 'EXT_ID';

prompt
prompt Creating table LEG_PAYMENT
prompt ==========================
prompt
create table LEG_PAYMENT
(
  nnn         VARCHAR2(64) not null,
  inn         VARCHAR2(12),
  inn_name    VARCHAR2(200),
  doc_no      VARCHAR2(20),
  doc_date    DATE,
  doc_type    VARCHAR2(80),
  doc_summa   NUMBER(22,2),
  summa       NUMBER(22,2),
  payer_id    INTEGER,
  curr_id     INTEGER,
  info        VARCHAR2(1000),
  err_text    VARCHAR2(2000),
  id          INTEGER,
  kpp         VARCHAR2(10),
  curr_code   VARCHAR2(3),
  last_date   DATE,
  acc_date    DATE,
  bank_date   DATE,
  load_date   DATE,
  is_unknown  NUMBER(1) default 0,
  sogln       VARCHAR2(10),
  sogld       DATE,
  load_mode   NUMBER(1),
  assure_date DATE,
  doc_no2     VARCHAR2(50),
  z_tpl       VARCHAR2(1)
)
;
comment on table LEG_PAYMENT
  is '������� LEG_PAYMENT';
comment on column LEG_PAYMENT.nnn
  is '���������� ��';
comment on column LEG_PAYMENT.inn
  is '��� �����������';
comment on column LEG_PAYMENT.inn_name
  is '������������ �����������';
comment on column LEG_PAYMENT.doc_no
  is '����� ���������';
comment on column LEG_PAYMENT.doc_date
  is '���� ���������';
comment on column LEG_PAYMENT.doc_type
  is '��� ���������';
comment on column LEG_PAYMENT.doc_summa
  is '����� �� ���������';
comment on column LEG_PAYMENT.summa
  is '�������';
comment on column LEG_PAYMENT.payer_id
  is '�� �����������';
comment on column LEG_PAYMENT.curr_id
  is '�� ������';
comment on column LEG_PAYMENT.info
  is '���������� �������';
comment on column LEG_PAYMENT.err_text
  is '������ ���������';
comment on column LEG_PAYMENT.id
  is '�� ������� � �����';
comment on column LEG_PAYMENT.kpp
  is '��� �����������';
comment on column LEG_PAYMENT.curr_code
  is '��� ������';
comment on column LEG_PAYMENT.last_date
  is '���� ��������� ��������';
comment on column LEG_PAYMENT.acc_date
  is '���� ����������� �� ����';
comment on column LEG_PAYMENT.bank_date
  is '���� �����';
comment on column LEG_PAYMENT.load_date
  is '���� ��������/���������';
comment on column LEG_PAYMENT.is_unknown
  is '������������';
comment on column LEG_PAYMENT.sogln
  is '����� ����������';
comment on column LEG_PAYMENT.sogld
  is '���� ����������';
comment on column LEG_PAYMENT.load_mode
  is '������� ���� ��������';
comment on column LEG_PAYMENT.assure_date
  is '���� ���������';
comment on column LEG_PAYMENT.doc_no2
  is 'DOC_NO2';
comment on column LEG_PAYMENT.z_tpl
  is 'Z_TPL';
alter table LEG_PAYMENT
  add constraint LEG_PAYMENT_PK primary key (NNN);

prompt
prompt Creating table LEG_PAYMENT_UP
prompt =============================
prompt
create table LEG_PAYMENT_UP
(
  doc_number      VARCHAR2(20),
  doc_date        DATE,
  doc_summa       NUMBER(22,2),
  ext_source      VARCHAR2(8) not null,
  ext_id          VARCHAR2(17) not null,
  ext_typesysname VARCHAR2(30) not null,
  curr_code       VARCHAR2(5),
  kbk             VARCHAR2(30),
  payer_name      VARCHAR2(255),
  payer_inn       VARCHAR2(12),
  payer_kpp       VARCHAR2(10),
  rest_summa      NUMBER(22,2),
  assure_date     DATE,
  descript        VARCHAR2(255),
  destcustomscode VARCHAR2(8),
  doc_no2         VARCHAR2(20),
  doc_date2       DATE,
  nref            VARCHAR2(40),
  summa           NUMBER(22,2),
  new_id          NUMBER
)
;
comment on table LEG_PAYMENT_UP
  is '������� LEG_PAYMENT_UP';
comment on column LEG_PAYMENT_UP.doc_number
  is 'DOC_NUMBER';
comment on column LEG_PAYMENT_UP.doc_date
  is 'DOC_DATE';
comment on column LEG_PAYMENT_UP.doc_summa
  is 'DOC_SUMMA';
comment on column LEG_PAYMENT_UP.ext_source
  is 'EXT_SOURCE';
comment on column LEG_PAYMENT_UP.ext_id
  is 'EXT_ID';
comment on column LEG_PAYMENT_UP.ext_typesysname
  is 'EXT_TYPESYSNAME';
comment on column LEG_PAYMENT_UP.curr_code
  is 'CURR_CODE';
comment on column LEG_PAYMENT_UP.kbk
  is 'KBK';
comment on column LEG_PAYMENT_UP.payer_name
  is 'PAYER_NAME';
comment on column LEG_PAYMENT_UP.payer_inn
  is 'PAYER_INN';
comment on column LEG_PAYMENT_UP.payer_kpp
  is 'PAYER_KPP';
comment on column LEG_PAYMENT_UP.rest_summa
  is 'REST_SUMMA';
comment on column LEG_PAYMENT_UP.assure_date
  is 'ASSURE_DATE';
comment on column LEG_PAYMENT_UP.descript
  is 'DESCRIPT';
comment on column LEG_PAYMENT_UP.destcustomscode
  is 'DESTCUSTOMSCODE';
comment on column LEG_PAYMENT_UP.doc_no2
  is 'DOC_NO2';
comment on column LEG_PAYMENT_UP.doc_date2
  is 'DOC_DATE2';
comment on column LEG_PAYMENT_UP.nref
  is 'NREF';
comment on column LEG_PAYMENT_UP.summa
  is 'SUMMA';
comment on column LEG_PAYMENT_UP.new_id
  is 'NEW_ID';
alter table LEG_PAYMENT_UP
  add constraint LEG_PAYMENT_UP_PK primary key (EXT_SOURCE, EXT_ID, EXT_TYPESYSNAME);

prompt
prompt Creating table LEG_RESERVED
prompt ===========================
prompt
create table LEG_RESERVED
(
  payment_id   NUMBER,
  summa        NUMBER,
  payment_date DATE,
  reason_code  VARCHAR2(2),
  bdate        DATE,
  customs_code VARCHAR2(10),
  reg_date     DATE,
  decl_no      VARCHAR2(12),
  note         VARCHAR2(1000),
  po_no        VARCHAR2(20),
  po_date      DATE,
  payer_inn    VARCHAR2(12),
  payer_kpp    VARCHAR2(10),
  new_id       NUMBER,
  id           NUMBER not null
)
;
comment on table LEG_RESERVED
  is '������� LEG_RESERVED';
comment on column LEG_RESERVED.payment_id
  is 'PAYMENT_ID';
comment on column LEG_RESERVED.summa
  is 'SUMMA';
comment on column LEG_RESERVED.payment_date
  is 'PAYMENT_DATE';
comment on column LEG_RESERVED.reason_code
  is 'REASON_CODE';
comment on column LEG_RESERVED.bdate
  is 'BDATE';
comment on column LEG_RESERVED.customs_code
  is 'CUSTOMS_CODE';
comment on column LEG_RESERVED.reg_date
  is 'REG_DATE';
comment on column LEG_RESERVED.decl_no
  is 'DECL_NO';
comment on column LEG_RESERVED.note
  is 'NOTE';
comment on column LEG_RESERVED.po_no
  is 'PO_NO';
comment on column LEG_RESERVED.po_date
  is 'PO_DATE';
comment on column LEG_RESERVED.payer_inn
  is 'PAYER_INN';
comment on column LEG_RESERVED.payer_kpp
  is 'PAYER_KPP';
comment on column LEG_RESERVED.new_id
  is 'NEW_ID';
comment on column LEG_RESERVED.id
  is 'ID';
alter table LEG_RESERVED
  add constraint LEG#PK#LEG_RESERVED primary key (ID);

prompt
prompt Creating table OI_SUMMARY_REPORT_TMP
prompt ====================================
prompt
create global temporary table OI_SUMMARY_REPORT_TMP
  of OI_REPORT_SUMMARY_TYPE
on commit delete rows;
comment on table OI_SUMMARY_REPORT_TMP
  is '������� OI_SUMMARY_REPORT_TMP';
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

prompt
prompt Creating table TEMP_DCLSUMPP
prompt ============================
prompt
create table TEMP_DCLSUMPP
(
  id        INTEGER not null,
  g071      VARCHAR2(8),
  g072      DATE,
  g073      VARCHAR2(7),
  gb1       VARCHAR2(4),
  gb1_1     VARCHAR2(1),
  gb3       VARCHAR2(3),
  iret      NUMBER(2),
  numpdok   VARCHAR2(50),
  datpdok   DATE,
  sum_all   NUMBER(17,2),
  sumpdok   NUMBER(17,2),
  valpdok   VARCHAR2(3),
  datpostd  DATE,
  innplat   VARCHAR2(12),
  kppplat   VARCHAR2(9),
  okpoplat  VARCHAR2(10),
  lnpins    VARCHAR2(4),
  nzp       NUMBER(10),
  dmodify   DATE,
  tmodify   VARCHAR2(8),
  p_edoc_id NUMBER(19),
  fioins    VARCHAR2(40),
  datins    DATE,
  timins    VARCHAR2(8),
  datpaymt  DATE,
  gb5       VARCHAR2(2),
  load_id   INTEGER
)
;
comment on table TEMP_DCLSUMPP
  is '������� TEMP_DCLSUMPP';
comment on column TEMP_DCLSUMPP.id
  is 'ID';
comment on column TEMP_DCLSUMPP.g071
  is 'G071';
comment on column TEMP_DCLSUMPP.g072
  is 'G072';
comment on column TEMP_DCLSUMPP.g073
  is 'G073';
comment on column TEMP_DCLSUMPP.gb1
  is 'GB1';
comment on column TEMP_DCLSUMPP.gb1_1
  is 'GB1_1';
comment on column TEMP_DCLSUMPP.gb3
  is 'GB3';
comment on column TEMP_DCLSUMPP.iret
  is 'IRET';
comment on column TEMP_DCLSUMPP.numpdok
  is 'NUMPDOK';
comment on column TEMP_DCLSUMPP.datpdok
  is 'DATPDOK';
comment on column TEMP_DCLSUMPP.sum_all
  is 'SUM_ALL';
comment on column TEMP_DCLSUMPP.sumpdok
  is 'SUMPDOK';
comment on column TEMP_DCLSUMPP.valpdok
  is 'VALPDOK';
comment on column TEMP_DCLSUMPP.datpostd
  is 'DATPOSTD';
comment on column TEMP_DCLSUMPP.innplat
  is 'INNPLAT';
comment on column TEMP_DCLSUMPP.kppplat
  is 'KPPPLAT';
comment on column TEMP_DCLSUMPP.okpoplat
  is 'OKPOPLAT';
comment on column TEMP_DCLSUMPP.lnpins
  is 'LNPINS';
comment on column TEMP_DCLSUMPP.nzp
  is 'NZP';
comment on column TEMP_DCLSUMPP.dmodify
  is 'DMODIFY';
comment on column TEMP_DCLSUMPP.tmodify
  is 'TMODIFY';
comment on column TEMP_DCLSUMPP.p_edoc_id
  is 'P_EDOC_ID';
comment on column TEMP_DCLSUMPP.fioins
  is 'FIOINS';
comment on column TEMP_DCLSUMPP.datins
  is 'DATINS';
comment on column TEMP_DCLSUMPP.timins
  is 'TIMINS';
comment on column TEMP_DCLSUMPP.datpaymt
  is 'DATPAYMT';
comment on column TEMP_DCLSUMPP.gb5
  is 'GB5';
comment on column TEMP_DCLSUMPP.load_id
  is 'LOAD_ID';
