create or replace function fdc_Person_Human_Add
-- �������� ������ �������� - ����������� ����
	(
	pObject_Type_SysName	varchar2,           -- ��������� ��� ���� ������� (������ 'Human')
	pSurName		varchar2,                     -- ������� 
	pFirstName		varchar2,                   -- ���          
	pMiddleName		varchar2,                   -- ��������
	pINN			varchar2,                       -- �������������� ����� �����������������
	pBirthDate		date:=null,                 -- ���� ��������
	pBirthYear		number:=null,               -- ��� ��������
	pBirthLocation		varchar2 := null,       -- ����� ��������
	pName			varchar2 := null,               -- ������ ��� �������� (���� NULL, ����������� ��� ���)
	pShortName		varchar2 := null,           -- ������� ��� ��������  (���� NULL, ����������� ��� ������� � ��������)
	pDescript		varchar2:=null                -- �����������              
	)
return number
is
  ppName varchar2(1500);
  ppShortName varchar2(1500);
begin
  -- �������� ����
  Fdc_Object_Type_Is(pObject_Type_SysName, 'Human');

  -- ��������� ���� ��� ����������� ����
  -- ������� �� �������������, ��� ����������� ���� ������� (���-�������� �����������)
  -- � �� ��� ����������� Name, ShortName
  -- � ����������� ����� �������� ���������� ��� (��� �� ����������) �� Name
  if pSurName is null then
    fdc_Util.Abort('��� �������� ����������� ���� ������ ���� ������� ��� �������');
  end if;
  ppName := pName;
  ppShortName := pShortName;
  if ppName is null then
    ppName := trim(trim(pSurName)||' '||trim(pFirstName)||' '||trim(pMiddleName));
  end if;
  if ppShortName is null then
    ppShortName := trim(pSurName);
    if pFirstName is not null then
      ppShortName := ppShortName || ' ' || substr(pFirstName, 1, 1) || '.';
      if pMiddleName is null then
        ppShortName := ppShortName || ' ' || substr(pMiddleName, 1, 1) || '.';
      end if;
    end if;
  end if;
  
  
  -- ����� fdc_Person_Add � ���������������� �����������
  return fdc_person_add(pobject_type_sysname => pObject_Type_SysName,
                        pname => ppname,
                        pshortname => ppshortname,
                        psurname => pSurName,
                        pfirstname => pFirstName,
                        pmiddlename => pMiddleName,
                        pogrn => null,
                        pinn => pinn,
                        pkpp => null,
                        pokpo => null,
                        pbic => null,
                        pbirthdate => pbirthdate,
                        pbirthyear => pbirthyear,
                        pbirthlocation => pbirthlocation,
                        popf_dict_id => null,
                        pdescript => pdescript);
end fdc_Person_Human_Add;
/
