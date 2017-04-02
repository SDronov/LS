create or replace procedure fdc_Person_Human_Upd
-- ��������� ��������� �������� - ����������� ����
	(
	pID			number,
	pSurName		varchar2,                     -- ������� 
	pFirstName		varchar2,                   -- ��� 
	pMiddleName		varchar2,                   -- ��������
	pINN			varchar2,                       -- �������������� ����� �����������������
	pBirthDate		date,                       -- ���� �������� 
	pBirthYear		number,                     -- ��� �������� 
	pBirthLocation		varchar2,               -- ����� ��������
	pName			varchar2,                       -- ������ ��� �������� (��������, �������-���-��������)
	pShortName		varchar2,                   -- ������� ��� �������� (��������, �������-��������)
	pDescript		varchar2                      -- �����������              
	)
is
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Human') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������� �����');
  end if;

  -- ����� fdc_Person_Upd � ���������������� �����������
  fdc_person_upd(pid => pID,
                 pname => pname,
                 pshortname => pshortname,
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
end fdc_Person_Human_Upd;
/
