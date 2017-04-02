
prompt Создать задания...
prompt 


prompt 

BEGIN
  FOR r IN ( SELECT job
               FROM User_Jobs
              where lower(what) like '%dbms_stats.gather%') LOOP
    dbms_job.remove( r.job );
    dbms_output.put_line( ' Задание "Статистика #'||r.job||'" удалено' );
  END LOOP;
END;
/
COMMIT;


DECLARE
 l_day VARCHAR2(10);
 l_what varchar2(5000);
 l_cnt pls_integer;
 l_job_id user_jobs.JOB%type; 

 procedure alter_session_set(p_name_value in varchar2    -- строка вида <название параметра>=<значение>
                             )is
 begin
   execute immediate 'alter session set '||p_name_value;
 end; 

BEGIN
  
 begin  
  dbms_output.put_line( '-- Блокировка невостребованных... ------------------------' );

  l_what:= 'p_payment_order.AutoLock3Year;';

  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
  if( l_cnt = 0 ) then 
      SYS.DBMS_JOB.SUBMIT
      (
        job        => l_job_id
       ,what       => l_what
       ,next_date  => trunc( SYSDATE ) + 1 + 5 / 24
       ,interval   => 'TRUNC(SYSDATE+1) + 5*1/24'
       ,no_parse   => FALSE
      );
   commit;
   dbms_output.put_line( ' Задание "Блокировка невостребованных" создано' );
  else
   dbms_output.put_line( ' Задание "Блокировка невостребованных" уже существует' );
  end if;
    
  exception
    when others then begin
      rollback;
      dbms_output.put_line( 'Ошибка создания "Блокировка невостребованных"' );
    end;  
 end;

 begin
    dbms_output.put_line( '-- Статистика... ------------------------' );
    
    l_what:= 'BEGIN ' ||
          ' dbms_stats.gather_schema_stats(ownname => USER, cascade => true); ' ||
          /*' dbms_stats.gather_table_stats(ownname => user,tabname => ''FDC_OBJECT'',cascade => true,method_opt => ''FOR ALL COLUMNS SIZE AUTO'', estimate_percent => 100); ' ||
          ' dbms_stats.gather_table_stats(ownname => user,tabname => ''FDC_OBJECT_TYPE'',cascade => true,method_opt => ''FOR ALL COLUMNS SIZE AUTO'', estimate_percent => 100); ' ||
          ' dbms_stats.gather_table_stats(ownname => user,tabname => ''FDC_VALUE'',cascade => true,method_opt => ''FOR ALL COLUMNS SIZE AUTO'', estimate_percent => 100); ' ||
          ' dbms_stats.gather_table_stats(ownname => user,tabname => ''FDC_EVENT'',cascade => true,method_opt => ''FOR ALL COLUMNS SIZE AUTO'', estimate_percent => 100); ' ||*/
          ' END; ';
    
    SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
    if( l_cnt = 0 ) then 
      sys.dbms_job.submit(
        job => l_job_id,
        what => l_what,
        next_date => trunc(NEXT_DAY(sysdate, 'SUNDAY')) + 15 / 24 / 60,
        interval => 'TRUNC( SYSDATE ) + 7 + 5 / 24 / 60');
        commit;
        dbms_output.put_line( ' Задание "Статистика" создано' );
    else
       dbms_output.put_line( ' Задание "Статистика" уже существует' );
    end if;
 exception
    when others then begin
      rollback;
      dbms_output.put_line( 'Ошибка создания "Статистика"' );
    end;  
 end;


 begin
  dbms_output.put_line( '-- Очистка стека... ------------------------' );
  l_what:= 'BEGIN'||chr(10)||
          ' LOOP'||chr(10)||
          '    DELETE FROM fdc_eh_call c'||chr(10)||
          '    WHERE TRUNC(c.call_date) <= TRUNC(SYSDATE) - 7'||chr(10)||
          '      AND ROWNUM < 10001;'||chr(10)||
          '    EXIT'||chr(10)||
          '      WHEN SQL%ROWCOUNT = 0;'||chr(10)||
          '    COMMIT;'||chr(10)||
          '  END LOOP;'||chr(10)||
          '  COMMIT;'||chr(10)||
          ''||chr(10)||
          ''||chr(10)||
          '  LOOP'||chr(10)||
          '    DELETE FROM fdc_eh_call_stack s'||chr(10)||
          '    WHERE NOT EXISTS'||chr(10)||
          '        (SELECT 0 FROM fdc_eh_call c WHERE c.call_stack_id = s.call_stack_id)'||chr(10)||
          '        and rownum < 10001;'||chr(10)||
          '    exit'||chr(10)||
          '      when SQL%ROWCOUNT = 0;'||chr(10)||
          '    commit;'||chr(10)||
          '  end loop;'||chr(10)||
          '  COMMIT;'||chr(10)||
          'END;';

  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
  if( l_cnt = 0 )then
    sys.dbms_job.submit(
     job => l_job_id,
     what => l_what,
     next_date => TRUNC( SYSDATE ) + 1 + 22 / 24,
     interval => 'TRUNC( SYSDATE ) + 1 + 22 / 24' );
    commit;
    dbms_output.put_line( ' Задание "Очистка стека" создано' );
  else
    dbms_output.put_line( ' Задание "Очистка стека" уже существует' );
  end if;
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Очистка стека"' );
  end;  
 end;


 begin
  dbms_output.put_line( '-- Просмотр очереди от MQ... ------------------------' );
  l_what:= 'BEGIN fdc_envelope_job; END;';

  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
  if( l_cnt = 0 )then
     sys.dbms_job.submit(job => l_job_id,
                      what => l_what,
                      next_date => SYSDATE + 30/24/60,
                      interval => 'SYSDATE + 1/24/120');
    commit;
    dbms_output.put_line( ' Задание "Просмотр очереди от MQ" создано' );
  else
    dbms_output.put_line( ' Задание "Просмотр очереди от MQ" уже существует' );
  end if;
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Просмотр очереди от MQ"' );
  end;  
 end;



 begin
 dbms_output.put_line( '-- Взаимодействие с АС "Стоимость-1" по регламенту... ------------------------' );
 l_what:= 'BEGIN'||chr(10)||
          '  BEGIN'||chr(10)||
          '    p_DocPack_InterActKTC.CreatePeriodic;'||chr(10)||
          '  EXCEPTION'||chr(10)||
          '    WHEN OTHERS THEN'||chr(10)||
          '      NULL;'||chr(10)||
          '  END;'||chr(10)||
          '  COMMIT;'||chr(10)||
          'END;';

  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);

  if( l_cnt = 0 )then
    sys.dbms_job.submit(job => l_job_id,
                       what=> l_what,
                       next_date => trunc( SYSDATE ) + 1 + 19 / 24,
                       interval => 'TRUNC( SYSDATE ) + 1 + 19 / 24');
    commit;
    dbms_output.put_line( ' Задание "Взаимодействие с АС "Стоимость-1" по регламенту" создано' );
  else
    dbms_output.put_line( ' Задание "Взаимодействие с АС "Стоимость-1" по регламенту" уже существует' );
  end if;
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Взаимодействие с АС "Стоимость-1" по регламенту" ' );
  end;  
 end;

 begin
  dbms_output.put_line( '-- Cоздания задания Обновления регистров баланса ------------------------' );
  l_what:= 'fdc_acc_registr_upd;';
  
  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
  if (l_cnt = 0) then
     -- установка параметров сессии
     alter_session_set('NLS_DATE_FORMAT=''DD.MM.RRRR''');
     alter_session_set('NLS_NUMERIC_CHARACTERS=''. ''');
     --
     sys.dbms_job.submit(
                         job => l_job_id,
                         what => l_what,
                         next_date => sysdate,
                         interval => 'trunc(sysdate) + 1 + 5/24/60'
                        );
     commit;
    dbms_output.put_line('Задание "Обновления регистров баланса" cоздано( ID = ' || to_char(l_job_id) || ').');  
    
  else
    dbms_output.put_line('Задание "Обновления регистров баланса" уже существует.');
  end if;
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Обновления регистров баланса"' );
  end;  
 end;

 begin
  if p_Params.cCustomLevel = p_Consts.cCustomLevel_FTS THEN 

  dbms_output.put_line( '-- Обновление НСИ на уровне ФТС... ------------------------' );
  
  l_what:= 'BEGIN fdc_fts_load_nsi; COMMIT; END;';

  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);

  if( l_cnt = 0 )then
   sys.dbms_job.submit(job => l_job_id,
                        what => l_what,
                        next_date => trunc( SYSDATE ) + 1 + 06 / 24,
                        interval => 'TRUNC( SYSDATE ) + 1 + 06 / 24');

  commit;
    dbms_output.put_line( ' Задание "Обновление НСИ на уровне ФТС" создано' );
  else
    dbms_output.put_line( ' Задание "Обновление НСИ на уровне ФТС" уже существует' );
  end if;

  end if;  -- if p_Params.cCustomLevel = p_Consts.cCustomLevel_FTS  
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Обновление НСИ на уровне ФТС"' );
  end;  
 end;


 begin
  if (p_Params.cCustomLevel = p_Consts.cCustomLevel_FTS) THEN  
 
  dbms_output.put_line( '-- Cоздание задания для запроса информации об обеспечении платёжных систем ------------------' );
  l_what:= 'p_docpack_interact_provision.send_query_provision;';
 
  SELECT count(1) into l_cnt FROM User_Jobs uj where lower(l_what) = lower(uj.WHAT);
  if (l_cnt = 0) then
     alter_session_set('NLS_DATE_FORMAT=''DD.MM.RRRR''');
     alter_session_set('NLS_NUMERIC_CHARACTERS=''. ''');

     sys.dbms_job.submit(
                         job => l_job_id,
                         what => l_what,
                         next_date => sysdate,
                         interval => 'sysdate + 1/24'
                        );
     commit;
    dbms_output.put_line('Задание "Запрос информации об обеспечении платёжных систем" cоздано( ID = ' || to_char(l_job_id) || ').');  
   else
    dbms_output.put_line('Задание "Запрос информации об обеспечении платёжных систем" уже существует.');     
   end if;
  end if;  -- if (p_params.CustomLevel in (p_consts.customlevel_fts)) then   
 exception
  when others then begin
    rollback;
    dbms_output.put_line( 'Ошибка создания "Запрос информации об обеспечении платёжных систем" ' );
  end;     
 end;
   
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

END;
/

prompt Выполнено.
prompt 
