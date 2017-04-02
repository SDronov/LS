create or replace function fdc_Subscription_Add
-- �������� �������� �� �������
	(
	pObject_Type_SysName	varchar2,             -- ��������� ��� ���� �������� (������ ���� �������� 'Subscription') 
	pName			varchar2,                         -- ������������ �������� (���� ������, ������������ �������������)
  pShortName    varchar2,                     -- ������� ������������ �������� (���� ������, �������� ��� ������ � �������)
	pAddressee_ID    number,                    -- ������������� �������� �������� (������������ ��� ������)
	pObject_ID	number,                         -- ������������� ������� ��������
  pEvidence_ID number,                        -- ������������� ��������� ��������
	pStartDate	date := null,                   -- ������ ������ �������� ��������                          -- 
	pStopDate	date := null,                     -- ������ ��������� �������� ��������
	pDescript	varchar2 := null                  -- �����������
	)
return number
is
  pNewID number(15);
  ppUser_ID number(15);
  ppName varchar2(1500);
  ppStartDate date;
  ppActive number := 0;
begin

  -- �������� ���� ��������  
  fdc_Object_Type_Is(pObject_Type_SysName,'Subscription');
  
  -- ��������� �������������� �������� ������������
  ppUser_ID := fdc_User_Get;
  
  -- �������� ��������
  if not (Fdc_Object_Is(pAddressee_ID, 'User') = 1 or Fdc_Object_Is(pAddressee_ID, 'UserGroup') = 1) then
    Fdc_Util.Abort('��������� �������� ����� ���� ������ ������������ ��� ������ �������������');
  end if;
  
  -- ���������� ������� ������ ��������
  ppStartDate := nvl(pStartDate, sysdate);
  if sysdate >= ppStartDate and sysdate <= nvl(pStopDate, sysdate + 1) then    
    ppActive := 1;
  end if;  

  -- ���������� �������
  if pName is null then
    if pObject_ID is null then
      ppName := '�������� ������� �� '||Fdc_Object_Get_Name(pAddressee_ID);
    else
      ppName := '�������� �� '||Fdc_Object_Get_Name(pObject_ID, 1);
    end if;
  else
    ppName := pName;
  end if;  
  
  -- �������� ���������� ������� (����� ������ ������)
  pNewID := fdc_Object_Add(pObject_Type_SysName, ppName, 0, null, null, pShortName, pDescript);

  -- ���� ������������ ����� �� ��������� � ������� ���� �� ������
  fdc_Object_Grant_Upd(pNewID, ppUser_ID, 3, 1);
  
  -- ���� ����� ��������
  fdc_Object_Grant_Upd(pNewID, pAddressee_ID, 1, 1);
  
  -- ���������� ������ � fdc_Subscription
  insert into fdc_subscription
    (id, addressee_id, object_id, evidence_id, active, startdate, stopdate)
  values
    (pNewID, paddressee_id, pobject_id, pevidence_id, ppActive, ppStartDate, pstopdate);

  -- ������� ��������
  return pNewID;

end fdc_Subscription_Add;
/
