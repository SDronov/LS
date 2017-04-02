create or replace function fdc_FollowUp_Add
-- �������� �����������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� ����������� (������ ���� �������� 'FollowUp') 
	pName			varchar2,                         -- ������������ 
	pObject_ID		number,                       -- ������ ����������� (������, �� �������� ���������� �����������)
	pMomentPlan		date,                         -- ��������������� ����
	pResp_User_ID		number,                     -- ������������� �� ����������� (ID ������������)
	pDoer_User_ID		number := null,             -- ����������� (ID ������������)
	pShortName			varchar2 := null,           -- ������� ������������
	pDescript		varchar2 := null                -- �����������
	)
return number
is
  pNewID number(15);
  pCurrUser number(15);
begin
  -- �������� ���� ���. ���������  
  fdc_Object_Type_Is(pObject_Type_SysName,'FollowUp');
  
  -- �������� ���������� �������
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 0, null, null, nvl(pShortName, pName), pDescript);

  -- ���� ������������, ���������� ����������� ����� �� ��������� � ������� ���� �� ������
  fdc_Object_Grant_Upd(pNewID, Fdc_User_Get, 3, 1);
  
  -- ����� �������������� �� ���������
  if pResp_User_ID is not null then
    fdc_Object_Grant_Upd(pNewID, pResp_User_ID, 2, 1);
  end if;

  -- ����� ����������� �� ���������
  if pDoer_User_ID is not null then
    fdc_Object_Grant_Upd(pNewID, pDoer_User_ID, 2, 1);
  end if;

  -- �������� ������ � fdc_Followup
  insert into fdc_FollowUp(ID,Object_ID, MomentPlan, MomentFact, Resp_User_ID, Doer_User_ID, Result)
  values(pNewID,pObject_ID, pMomentPlan, null, nvl(pResp_User_ID,pCurrUser), pDoer_User_ID, null);
  
  return pNewID;

end fdc_FollowUp_Add;
/
