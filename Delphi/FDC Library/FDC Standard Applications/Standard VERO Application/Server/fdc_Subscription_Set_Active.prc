create or replace procedure fdc_Subscription_Set_Active
-- ��������� ����� ���������� ��������
	(
	pID		number                               -- ������������� ��������  
	)
is
  pSubscription fdc_Subscription%rowtype;
  ppActive number := 0;
begin
  
  -- ��������� ������ ��������
  begin
    select *
    into pSubscription
    from fdc_Subscription
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ��������� ����� ���������� �� ������� �������� ID='||pID);
  	when others then fdc_util.Abort('������ ��������� �������� �������� ID='||pID, 1);
  end;

  -- ����������� �������� ppActive
  if sysdate >= pSubscription.StartDate and sysdate <= nvl(pSubscription.StopDate, sysdate + 1) then    
    ppActive := 1;
  end if;  
  
  -- ���� ����� - update ������ fdc_Subscription
  if ppActive <> pSubscription.Active then
    update fdc_Subscription
    set Active = Ppactive
    where ID = pID;
  end if;

end fdc_Subscription_Set_Active;
/
