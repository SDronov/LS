create or replace function fdc_Person_Add
-- �������� ������ �������� - ������������ ��� ����������� ����
	(
	pObject_Type_SysName	varchar2,           -- ��������� ��� ���� ������� (��������, 'Legal', 'Human')
	pName			varchar2,                       -- ������ ��� �������� 
	pShortName		varchar2,                   -- ������� ��� �������� 
	pSurName		varchar2,                     -- ������� ��� ��� ���, ��� �� ��� �� �����������
	pFirstName		varchar2,                   -- ��� ��� ������, ��� ����� �� �����������             
	pMiddleName		varchar2,                   -- �������� ��� ������, ��� ����� �� �����������
  pOGRN     varchar2,                       -- �������� ��������������� ��������������� �����
	pINN			varchar2,                       -- �������������� ����� �����������������
	pKPP			varchar2:=null,                 -- ��� ������� ���������� �� ��������� ���� (�������������� ��� � ���)
	pOKPO			varchar2:=null,                 -- ��� �� ��������������� �������������� ����������� � �����������
	pBIC			varchar2:=null,                 -- ���������� ����������������� ���
	pBirthDate		date:=null,                 -- ���� �������� (����������� �����������) 
	pBirthYear		number:=null,               -- ��� �������� (����������� �����������)
	pBirthLocation		varchar2 := null,       -- ����� �������� (����������� �����������)
  pOPF_Dict_ID number := null,              -- ��������������-�������� ����� �����������. ������ �� ���������� �����
	pDescript		varchar2:=null                -- �����������              
	)
return number
is
  pNewID number(15);
  ppBirthYear number;
begin
  -- �������� ���� �������: �� ������ ���� �������� Person
  fdc_Object_Type_Is(pObject_Type_SysName,'Person');
  
  -- �������� ���������� ��� ����������� ���
  if Fdc_Object_Type_Is_Subtype(pObject_Type_SysName, 'Legal') = 1 then
    if trim(pName) is null or
       trim(pSurName) is not null or
       trim(pFirstName) is not null or
       trim(pMiddleName) is not null then
      fdc_Util.Abort('�������� ��������� ��� �������� ������������ ����'); 
    end if;   
    if (pOPF_Dict_ID is not null) and (Fdc_Object_Is(pOPF_Dict_ID, 'Dict.OKOPF')<>1) then
      fdc_Util.Abort('�������� ��� ����������� ��� ��� �������� ������������ ����'); 
    end if; 
  end if;
  
  -- �������� ���������� ��� ���������� ���
  if Fdc_Object_Type_Is_Subtype(pObject_Type_SysName, 'Human') = 1 then
    if trim(pOGRN) is not null or
       trim(pKPP) is not null or
       trim(pOKPO) is not null or
       trim(pBIC) is not null or
       trim(pOPF_Dict_ID) is not null then
      fdc_Util.Abort('�������� ��������� ��� �������� ����������� ����'); 
    end if;   
  end if;
  
  -- ��������� ����
  ppBirthYear := nvl(pBirthYear, To_Number(To_Char(pBirthDate,'YYYY')));
  
  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, null, pShortName, pDescript);

  -- ���������� ������ � ������� fdc_Person  
  insert into fdc_person
    (id, surname, firstname, middlename, ogrn, inn, kpp, okpo, bic, birthdate, birthyear, birthlocation, opf_dict_id)
  values
    (pNewID, pSurName, pFirstName, pMiddleName, 
     trim(pOGRN), trim(pINN), trim(pKPP), trim(pOKPO), trim(pBIC),
     pBirthDate, ppBirthYear, trim(pBirthLocation), pOPF_Dict_ID);
  
  return pNewID;
end fdc_Person_Add;
/
