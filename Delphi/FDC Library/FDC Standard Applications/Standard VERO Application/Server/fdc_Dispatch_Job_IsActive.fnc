create or replace function fdc_Dispatch_Job_IsActive
-- �������� ��������� ���������� �������� (job) ����������
-- (����� - �����������, ����������� ��������� fdc_Dispatch.Main)
-- ���� �������, ���������� 1,
-- ���� ��� (broken) - 0
-- ���� job ����������� - -1
return number 
is
  lJob user_jobs%rowtype;
  lRetVal number;
begin
  -- ������ � ������������� user_jobs
  begin
    select *
    into lJob
    from user_jobs
    where upper(what) = 'FDC_DISPATCH.MAIN;';
    if lJob.Broken = 'Y' then
      lRetVal := 0;
    else
      lRetVal := 1;
    end if;
  exception
	  when NO_DATA_FOUND then 
      lRetVal := -1;
  	when others then 
      fdc_util.Abort('������ ��������� ���������� � �������� (job) ����������', 1);
  end;
  return lRetVal;
end;
/
