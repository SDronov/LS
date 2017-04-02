create or replace procedure fdc_Session_Upd_Job
-- ���������� ���������� ������ Job �������� ��������� ������
	(
  pID                  number,           -- ������������� �������� ��������� ������
  pJob_ID              number            -- ��������� ����� job-�, ������������ ������� (� ������������ � all_jobs)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- �������� ���� � ��������� ��������
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('�� ������ �������, ID='||pID);
  	when others then fdc_util.Abort('������ ��������� ��������, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateCreated' then
    fdc_Util.Abort('�������� ��������� �������� ��� ���������� JOB! (ID='|| pID ||')');
  end if;
  
  -- ��������� ���������� ������ job-�, ������������ �������
  update fdc_Session
  set job_ID = pJob_ID
  where ID = pID;    

end;
/
