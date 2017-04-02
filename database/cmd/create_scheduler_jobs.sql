set define off
declare
  l_exists number;
begin
  begin
    select 1
      into l_exists
      from user_scheduler_jobs t
     where t.job_name = 'SMEV_WORK';
    dbms_output.put_line('Периодическое задание SMEV_WORK уже существует.');
  exception
    when no_data_found then
      l_exists := 0;
  end;
  if l_exists = 0 then
    dbms_scheduler.create_job(job_name        => user || '.SMEV_WORK',
                              job_type        => 'PLSQL_BLOCK',
                              job_action      => 'begin  pkg_asbc_smev.carry_messages; end;',
                              start_date      => to_date('19-01-2015 18:00:00',
                                                         'dd-mm-yyyy hh24:mi:ss'),
                              repeat_interval => 'Freq=SECONDLY;Interval=20',
                              end_date        => to_date(null),
                              job_class       => 'DEFAULT_JOB_CLASS',
                              enabled         => true,
                              auto_drop       => false,
                              comments        => 'work smev');
    dbms_output.put_line('Периодическое задание SMEV_WORK успешно создано.');
  end if;

  begin
    select 1
      into l_exists
      from user_scheduler_jobs t
     where t.job_name = 'FORM_SEND_DOC_PACK_PAYMENTS';
    dbms_output.put_line('Периодическое задание FORM_SEND_DOC_PACK_PAYMENTS уже существует.');
  exception
    when no_data_found then
      l_exists := 0;
  end;
  if l_exists = 0 then
    dbms_scheduler.create_job(job_name        => user || '.FORM_SEND_DOC_PACK_PAYMENTS',
                              job_type        => 'PLSQL_BLOCK',
                              job_action      => 'begin 
    p_Doc_Pack_Transfer.job_send_payments;
  end;',
                              start_date      => to_date(null),
                              repeat_interval => 'Freq=Secondly;Interval=60',
                              end_date        => to_date(null),
                              job_class       => 'DEFAULT_JOB_CLASS',
                              enabled         => false,
                              auto_drop       => false,
                              comments        => '');
    dbms_output.put_line('Периодическое задание FORM_SEND_DOC_PACK_PAYMENTS успешно создано.');
  end if;
  

  begin
    select 1
      into l_exists
      from user_scheduler_jobs t
     where t.job_name = 'TR_CLOSE_REST';
    dbms_output.put_line('Периодическое задание TR_CLOSE_REST уже существует.');
  exception
    when no_data_found then
      l_exists := 0;
  end;
  if l_exists = 0 then
    dbms_scheduler.create_job(job_name        => user || '.TR_CLOSE_REST',
                              job_type        => 'PLSQL_BLOCK',
                              job_action      => 'begin P_ASBC_TR_CLOSE_REST; end;',
                              start_date      => trunc(sysdate)+1+5/60/24,
                              repeat_interval => 'Freq=daily;Interval=1',
                              end_date        => to_date(null),
                              job_class       => 'DEFAULT_JOB_CLASS',
                              enabled         => true,
                              auto_drop       => false,
                              comments        => '');
    dbms_output.put_line('Периодическое задание TR_CLOSE_REST успешно создано.');
  end if;
end;
/
