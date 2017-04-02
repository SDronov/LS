create or replace procedure fdc_Person_Legal_Upd
-- ��������� ��������� �������� - ������������ ����
	(
	pID			number,
	pName			varchar2,                       -- ������ ��� ��������
	pShortName		varchar2,                   -- ������� ��� ��������
  pOGRN     varchar2,                       -- �������� ��������������� ��������������� �����
	pINN			varchar2,                       -- �������������� ����� �����������������
	pKPP			varchar2,                       -- ��� ������� ���������� �� ��������� ���� (�������������� ��� � ���)
	pOKPO			varchar2,                       -- ��� �� ��������������� �������������� ����������� � �����������
	pBIC			varchar2,                       -- ���������� ����������������� ���
	pBirthDate		date,                       -- ���� ����������� �����������
	pBirthYear		number,                     -- ��� ����������� �����������
	pBirthLocation		varchar2,               -- ����� ����������� �����������
  pOPF_Dict_ID number,                      -- ��������������-�������� ����� �����������. ������ �� ���������� �����
	pDescript		varchar2                      -- �����������              
	)
is
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Legal') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ����������� �����');
  end if;

  -- ����� fdc_Person_Upd � ���������������� �����������
  fdc_person_upd(pid => pID,
                 pname => pname,
                 pshortname => pshortname,
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
end fdc_Person_Legal_Upd;
/
