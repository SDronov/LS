create or replace function fdc_Person_Legal_Add
-- �������� ������ �������� - ������������ ����
	(
	pObject_Type_SysName	varchar2,           -- ��������� ��� ���� ������� (������ 'Legal')
	pName			varchar2,                       -- ������ ��� �������� 
	pShortName		varchar2,                   -- ������� ��� �������� 
  pOGRN     varchar2,                       -- �������� ��������������� ��������������� �����
	pINN			varchar2,                       -- �������������� ����� �����������������
	pKPP			varchar2:=null,                 -- ��� ������� ���������� �� ��������� ���� (�������������� ��� � ���)
	pOKPO			varchar2:=null,                 -- ��� �� ��������������� �������������� ����������� � �����������
	pBIC			varchar2:=null,                 -- ���������� ����������������� ���
	pBirthDate		date:=null,                 -- ���� ����������� �����������
	pBirthYear		number:=null,               -- ��� ����������� �����������
	pBirthLocation		varchar2 := null,       -- ����� ����������� �����������
  pOPF_Dict_ID number := null,              -- ��������������-�������� ����� �����������. ������ �� ���������� �����
	pDescript		varchar2:=null                -- �����������              
	)
return number
is
  ppName varchar2(1500);
  ppShortName varchar2(1500);
begin
  -- �������� ����
  Fdc_Object_Type_Is(pObject_Type_SysName, 'Legal');

  -- ��������� ���� ��� ������������ ����
  if pName is null and pShortName is null then
    fdc_Util.Abort('��� �������� ������������ ���� ������ ���� ������� ��� ������������');
  elsif pName is null then
    ppName := fdc_person_legal_name_to_acro(pShortName);
    ppShortName := fdc_person_legal_name_to_acro(pShortName);
  elsif pShortName is null then
    ppName := fdc_person_legal_name_to_acro(pName);
    ppShortName := fdc_person_legal_get_shortname(pName);
  else
    ppName := fdc_person_legal_name_to_acro(pName);
    ppShortName := fdc_person_legal_name_to_acro(pShortName);
  end if;  

  -- ����� fdc_Person_Add � ���������������� �����������
  return fdc_person_add(pobject_type_sysname => pObject_Type_SysName,
                        pname => ppname,
                        pshortname => ppshortname,
                        psurname => null,
                        pfirstname => null,
                        pmiddlename => null,
                        pogrn => pogrn,
                        pinn => pinn,
                        pkpp => pkpp,
                        pokpo => pokpo,
                        pbic => pbic,
                        pbirthdate => pbirthdate,
                        pbirthyear => pbirthyear,
                        pbirthlocation => pbirthlocation,
                        popf_dict_id => popf_dict_id,
                        pdescript => pdescript);
end fdc_Person_Legal_Add;
/
