create or replace procedure fdc_Subscription_Upd
-- ��������� ��������� ��������
	(
	pID		number,                               -- ������������� ��������  
	pName			varchar2,                         -- ������������ �������� (���� ������, ������������ �������������)
  pShortName    varchar2,                     -- ������� ������������ �������� (���� ������, �������� ��� ������ � �������)
	pStopDate	date := null,                     -- ������ ��������� �������� ��������
	pDescript	varchar2 := null                  -- �����������
	)
is
  pSubscription fdc_Subscription%rowtype;
  ppActive number := 0;
begin
  -- �������� ���� 
  if (fdc_Object_Is(pID, 'Subscription') = 0) then
    Fdc_Util.Abort('������ (ID='||pID||') �� �������� ���������');
  end if;

  -- ������� ��������� ��������� ������� �� ���������� ����������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);
  
  -- ��������� ������� ��������
  begin
    select *
    into pSubscription
    from fdc_Subscription
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ������� ��������� �� ������� �������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� �������� ID='||pID, 1);
  end;

  -- ��������� ��������� ������ fdc_Subscription
  if nvl(pSubscription.Stopdate, sysdate - 3650) <> nvl(pStopdate, sysdate - 3650) then
    if sysdate >= pSubscription.StartDate and sysdate <= nvl(pStopDate, sysdate + 1) then    
      ppActive := 1;
    end if;  
    update fdc_Subscription
    set Stopdate = pStopdate,
        Active = Ppactive
    where ID = pID;
  end if;

end fdc_Subscription_Upd;
/
