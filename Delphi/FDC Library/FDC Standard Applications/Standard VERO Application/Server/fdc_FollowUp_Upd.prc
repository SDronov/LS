create or replace procedure fdc_FollowUp_Upd
-- ��������� ��������� �����������
	(
	pID		number,                               -- ������������� �����������
	pName		varchar2,                           -- ������������ �����������
	pObject_ID		number,                       -- ������ ����������� (������, �� �������� ���������� �����������)
	pMomentPlan		date,                         -- ��������������� ����
	pMomentFact		date,                         -- ��������������� ����
	pResp_User_ID		number,                     -- ������������� �� ����������� (ID ������������)
	pDoer_User_ID		number,                     -- ����������� (ID ������������)
  pResult varchar2,                           -- ������ �� ����������� ����������
	pShortName			varchar2,                   -- ������� ������������
	pDescript		varchar2                        -- �����������
	)
is
  pFollowup   fdc_Followup%rowtype;
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'FollowUp') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ��������������� ������������');
  end if;

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- ��������� ������� ��������
  begin
    select *
    into pFollowup
    from fdc_Followup
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� ��������� �� ������� ����������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� ����������� ID='||pID, 1);
  end;

  -- ��������� ��������� ������ fdc_Followup
  if nvl(pFollowup.Object_Id, 0) <> nvl(pObject_ID, 0) or
     nvl(pFollowup.Momentplan, to_date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pMomentplan, to_date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(pFollowup.Momentfact, to_date('01.01.1800', 'DD.MM.YYYY')) <> nvl(pMomentfact, to_date('01.01.1800', 'DD.MM.YYYY')) or
     nvl(pFollowup.Resp_User_ID, 0) <> nvl(pResp_User_ID, 0) or
     nvl(pFollowup.Doer_User_ID, 0) <> nvl(pDoer_User_ID, 0) or
     nvl(pFollowup.Result, 'No name') <> nvl(pResult, 'No name') then
    update Fdc_Followup
    set Object_ID=pObject_ID,
        MomentPlan=pMomentPlan,
        Resp_User_ID=pResp_User_ID,
        Doer_User_ID=pDoer_User_ID
    where ID = pID;
  end if;   
  
  -- �������� ���� ��� ��������� ����������� � ����������� �������������
  -- ����� ����������� �� ���������
  if pResp_User_ID is not null then
    fdc_Object_Grant_Upd(pID, pDoer_User_ID, 2, 1, 1);
  end if;

  if pDoer_User_ID is not null then
    fdc_Object_Grant_Upd(pID, pDoer_User_ID, 2, 1, 1);
  end if;

end fdc_FollowUp_Upd;
/
