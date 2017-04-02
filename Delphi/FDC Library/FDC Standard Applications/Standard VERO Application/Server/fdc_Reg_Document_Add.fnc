create or replace function fdc_Reg_Document_Add
-- �������� ���������������� ���������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� ���. ��������� (������ ���� �������� 'IdentityCard') 
	pName			varchar2,                         -- ������������ 
  pOwner_ID  number,                          -- �������� - ������, � �������� ��������� �������� (������ �����������, ��� ��� ������ ��������)                                  
	pDocDate	date,                             -- ���� ���������
	pDocNumber	varchar2,                       -- ����� ���������
	pDocSerial	varchar2,                       -- ����� ���������
	pGrantee	varchar2,                         -- ��� ����� ��������
  pStopDate date := null,                     -- ���� ��������� ��������
  pDescript varchar2 := null                  -- ��������  
	)
return number
is
  pNewID number(15);
begin
  -- �������� ���� ���. ���������  
  fdc_Object_Type_Is(pObject_Type_SysName,'RegDocument');

  -- �������� ���������
  if pOwner_ID is not null and Fdc_Object_Is(pOwner_ID, 'Person') = 0 then
    fdc_Util.Abort('��� �������� ���������������� ��������� ������� �������� ������������� ���������');
  end if;

  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pOwner_ID, null, null, pDescript);

  -- ���� ������������ ����� �� ��������� � ������� ���� �� ������
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);

  -- �������� ������ � fdc_Reg_Document
  insert into fdc_reg_document
    (id, docdate, docnumber, docserial, grantee, stopdate)
  values
    (pNewID, pdocdate, pdocnumber, pdocserial, pgrantee, pstopdate);
  
  return pNewID;
  
end fdc_Reg_Document_Add;
/
