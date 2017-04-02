connect &&1

show define

select * from V$VERSION
/

set feedback off
SET VERIFY OFF
SET SERVEROUTPUT ON SIZE 1000000

spool cmd\tab_upd.sql

DECLARE
  lv_FromVersion VARCHAR2(150);
  lv_ToVersion   VARCHAR2(150) := '&&2';
  lFromNum       number;
  
  FUNCTION GetBuild(pVersion VARCHAR2) RETURN NUMBER IS
  BEGIN
    --RETURN to_number( substr( pVersion, instr( pVersion , '.', -1 ) + 1 ) );
    return to_number(regexp_replace(regexp_replace(substr(pVersion, 3), '(^|\.)', '\10000'),
                                    '(^|\.)0*(\d{4})',
                                    '\2'));
  END;
  
  procedure put_file_name(pVersion number) as
  begin
    dbms_output.put_line('@@tab-' || to_char(pVersion) || '.sql');
  end;

  
BEGIN
  SELECT substr(t.stringvalue,1,20) 
   INTO lv_FromVersion
   FROM fdc_value_lst_sys t
   WHERE t.sysname = 'Version';
   
  lFromNum := GetBuild(lv_FromVersion);

  if lFromNum < 500020351 then
    put_file_name(500020351);
  end if;
  if lFromNum < 500021352 then
    put_file_name(500021352);
  end if;
  if lFromNum < 500022353 then
    put_file_name(500022353);
  end if;
  if lFromNum < 500030000 then
    put_file_name(500030000);
  end if;
  if lFromNum < 600000000 then
    put_file_name(600000000);
  end if;
  if lFromNum < 600010000 then
    put_file_name(600010000);
  end if;
END;
/

SET SERVEROUTPUT OFF
spool off

spool Log\updatedb-&&2..log

show define

select * from V$VERSION
/

prompt Регистрация обновления... 
prompt 
VARIABLE lv_UpdateLogID VARCHAR2(150)
BEGIN
  :lv_UpdateLogID := 'Сборка ' || '&&2';
  p_update_log.start_update(
      pid             => :lv_UpdateLogID
     ,pupdatetype     => p_update_log.GetIdTypeByName( 'Обновление БД ЛС', 0 )
     ,pupdatefilename => '&&4'
     ,pdescription    => 'Обновление БД ЛС'
    );
END;
/

prompt Обновление таблиц... 
prompt 
@@tab_upd.sql


prompt Обновление исполняемых объектов... 
prompt 
@@all_obj.sql

prompt Компиляция объектов БД... 
execute fdc_service.Recompile

prompt Обновление метаданных и данных... 
prompt 
@@upd-&&2..sql

@@add_options.sql

prompt Создание заданий... 
prompt 
@@create_jobs.sql


prompt Выполнение завершающих операций... 
prompt 
@@post_tasks.sql &&2

prompt Регистрация окончания обновления... 
prompt 
BEGIN
  p_update_log.FINISH_UPDATE(
      pid      => :lv_UpdateLogID
     ,pLogFile => NULL
    );
END;
/

prompt Схема обновлена.
prompt 

spool off

exit 0
