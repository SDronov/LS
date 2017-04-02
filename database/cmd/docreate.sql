whenever sqlerror exit 100
spool Log\createdb.log
connect &&1

show define

select * from V$VERSION
/

set feedback off
SET VERIFY OFF

prompt Создание типов... 
prompt 
@@create_types.sql

whenever sqlerror continue

prompt Создание таблиц... 
prompt 
@@create_tables.sql

whenever sqlerror exit 100

prompt Отключение ограничений... 
prompt 
@@constr_dis.sql

prompt Импорт схемы... 
prompt 
@@init_data.sql
-- host imp "&&1" file=dmp\doxod_ls.dmp fromuser=DOXOD_LS touser=&&3 DATA_ONLY=Y log=log\doxod_ls_imp.log grants=n

prompt Включение ограничений... 
prompt 
@@constr_en.sql

prompt 
@@create_mv.sql

prompt Обновление исполняемых объектов... 
prompt 
@@all_obj.sql

prompt Компиляция объектов БД... 
execute fdc_service.Recompile

prompt Регистрация установки... 
prompt 
VARIABLE lv_UpdateLogID VARCHAR2(150)
BEGIN
  :lv_UpdateLogID := 'Сборка ' || '&&2';
  p_update_log.start_update(
      pid             => :lv_UpdateLogID
     ,pupdatetype     => p_update_log.GetIdTypeByName( 'Установка БД ЛС', 0 )
     ,pupdatefilename => '&&4'
     ,pdescription    => 'Начальная установка БД ЛС'
    );
END;
/

prompt Создание заданий... 
prompt 
@@create_jobs.sql

prompt Установить нового владельца схемы...
begin
  fdc_Service.New_Location;
end;
/

@@add_options.sql

@@post_tasks.sql &&2

prompt Регистрация окончания установки... 
prompt 
BEGIN
  p_update_log.FINISH_UPDATE(
      pid      => :lv_UpdateLogID
     ,pLogFile => NULL
    );
END;
/

prompt Схема создана.
prompt 

spool off

exit 0
