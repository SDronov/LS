create or replace procedure fdc_Subscription_Check_All
-- ������ �� ���� ��������� � ��������� ����� ����������
-- ��� ��������� ����������� � �������� ��� ����������� ����������
  (
  pSession_ID number                 -- ������������� �������� ��������� ������
  )
is
begin
  -- ����� �������� ��������� ����������� �� ���������
  fdc_Dispatch.Session_Start(pSession_ID);
  begin
    -- ���� �� ���� ���������
    for rec in (select ID from fdc_Subscription) loop
      FDC_SUBSCRIPTION_SET_ACTIVE (rec.ID);
    end loop;
    -- ���������� ��������
    fdc_Dispatch.Session_Finalize(pSession_ID);
  exception
    when others then
      rollback;
      fdc_Dispatch.Session_Finalize(pSession_ID, fdc_Dispatch.Session_State_Error, sqlerrm);  
  end;

end FDC_SUBSCRIPTION_CHECK_ALL;
/
