create or replace procedure fdc_Dispatch_Job_Check_Start
-- �������� ��������� ���������� �������� (job) ����������
-- ���� �� ������� - ����������� job
is
  jn number;
begin
  -- � ����������� �� ��������� job ������������� ��������� ��������
  case fdc_Dispatch_Job_IsActive
    when 1 then 
      -- ��� ����� � ��� ������
      null; 
    when 0 then       
      -- ���� job, �� �� � ��������� broken
      begin
        select job
        into jn
        from user_jobs
        where upper(what) = 'FDC_DISPATCH.MAIN;';
      end;
      dbms_job.broken(job => jn, broken => false, next_date => sysdate + 1/2880);
      commit;
    when -1 then      
      -- ��� job-�, ������� ���
      dbms_job.submit(jn, 'FDC_DISPATCH.MAIN;', sysdate + 1/2880, 'sysdate + 1/1440');
      commit;
    else
      raise_application_error(-20201, '�������� �������� ������� ���������� �������� ����������: '||fdc_Dispatch_Job_IsActive);
  end case;
end;
/
