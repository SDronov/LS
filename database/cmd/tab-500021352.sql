prompt -- ������ 01352
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

COMMENT ON COLUMN DBF_DCLHEAD.G5411ADID IS '������������� �������� ����������� �������������  � ����������� ������ ����������';
COMMENT ON COLUMN DBF_DCLHEAD.G5411AID IS '������������� ������������ ������ ����������, ��� �������� ������� ����������� �������������';
COMMENT ON COLUMN DBF_DCLHEAD.G5411DOC IS '��� ���� ��������� - ������� ����������� �������������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
COMMENT ON COLUMN DBF_DCLHEAD.G5411MODID IS '��� ��������� - ������� ����������� �������������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
COMMENT ON COLUMN DBF_DCLHEAD.G544ADID IS '������������� ���������, ��������������� ����������  � ����������� ������ ����������';
COMMENT ON COLUMN DBF_DCLHEAD.G544AID IS '������������� ������������ ������ ����������, ��� �������� ��������, �������������� ����������';
COMMENT ON COLUMN DBF_DCLHEAD.G544DOC IS '��� ���� ���������, ��������������� ����������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
COMMENT ON COLUMN DBF_DCLHEAD.G544MODID IS '��� ��������� ��������������� ����������,  � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
COMMENT ON COLUMN DBF_DCLHEAD.PS_CONTR IS '��������� ������ �������� �� �� � �������� ������: 0 � �� �� ������� � �� ��� �� �������, 1 � �� �� �������� � ��, 2 � �� �������� � ��, ����������� ���, 3 � ���������� ����������� �� � ��, ���������� (��� F_DECL= 3 � 4) ���������� �� �������������';
COMMENT ON COLUMN DBF_DCLHEAD.VAL_CONTR IS '������� ������� ���������� � ��������� ����� ����� �� ����� � ���� ������ � ����� ������������ �������� �������� ������� � ������ ����������� (0 � ������� �����������, 1 - ������� ������������)';

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

COMMENT ON COLUMN DBF_KTDHEAD.D5411ADID IS '������������� �������� ����������� �������������  � ����������� ������ ����������';
COMMENT ON COLUMN DBF_KTDHEAD.D5411AID IS '������������� ������������ ������ ����������, ��� ���������� ������� ����������� �������������';
COMMENT ON COLUMN DBF_KTDHEAD.D5411DOC IS '��� ���� �������� ����������� ������������� � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
COMMENT ON COLUMN DBF_KTDHEAD.D5411MODID IS '��� ���� �������� ����������� �������������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
COMMENT ON COLUMN DBF_KTDHEAD.D544ADID IS '������������� ���������, ��������������� ����������  � ����������� ������ ����������';
COMMENT ON COLUMN DBF_KTDHEAD.D544AID IS '������������� ������������ ������ ����������, ��� ���������� ��������, �������������� ����������';
COMMENT ON COLUMN DBF_KTDHEAD.D544DOC IS '��� ���������, ��������������� ����������, � ������������ � ��������������� ����� ���������� � ��������, ������������ ��� ���������� ��������������';
COMMENT ON COLUMN DBF_KTDHEAD.D544MODID IS '��� ���� ���������, ��������������� ����������,  ��������������� � ������������ � �������� �������� ����������� ���� ����������';
COMMENT ON COLUMN DBF_KTDHEAD.G089 IS '����������� ��������� ��������:
1-����������, 2 � ������ �� ������
';
COMMENT ON COLUMN DBF_KTDHEAD.G143ASTREE IS '�������� �����, ����� ����, ����� ����� /��������
(�������.�������.)
';
COMMENT ON COLUMN DBF_KTDHEAD.G19 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G3010 IS '��� ���������:
1-��������
2-�������������
';
COMMENT ON COLUMN DBF_KTDHEAD.G45A1 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A2 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A3 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A4 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A5 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G45A6 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.G5410 IS '';
COMMENT ON COLUMN DBF_KTDHEAD.K032 IS '����� ���������� ���� ���1 � ���2
(������� ���������� ���������� ������� ���������� ��.3 ��)
';

ALTER TABLE DBF_DCLTECHD
  ADD RECORDID VARCHAR2(36);

ALTER TABLE DBF_DCLTECHD
  ADD EXECUTBODY VARCHAR2(10);

ALTER TABLE DBF_DCLTECHD
  ADD DOCMODEID VARCHAR2(10);

COMMENT ON COLUMN DBF_DCLTECHD.DOCMODEID IS '��� ��������������� ��������� � ������������ � �������� �������� ����������� ���� ���������� (���������� 6.1)';
COMMENT ON COLUMN DBF_DCLTECHD.EXECUTBODY IS '������������� ��������������� ������, ��������� �������������� �������� / ������������� ������� ����';
COMMENT ON COLUMN DBF_DCLTECHD.RECORDID IS '���������� ������������� ������ � XML-���������';

ALTER TABLE EXP_TR
  MODIFY(DECL_NO VARCHAR2(11));



prompt -- ������ 01352 (End) 
prompt 
prompt 
