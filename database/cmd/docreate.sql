whenever sqlerror exit 100
spool Log\createdb.log
connect &&1

show define

select * from V$VERSION
/

set feedback off
SET VERIFY OFF

prompt �������� �����... 
prompt 
@@create_types.sql

whenever sqlerror continue

prompt �������� ������... 
prompt 
@@create_tables.sql

whenever sqlerror exit 100

prompt ���������� �����������... 
prompt 
@@constr_dis.sql

prompt ������ �����... 
prompt 
@@init_data.sql
-- host imp "&&1" file=dmp\doxod_ls.dmp fromuser=DOXOD_LS touser=&&3 DATA_ONLY=Y log=log\doxod_ls_imp.log grants=n

prompt ��������� �����������... 
prompt 
@@constr_en.sql

prompt 
@@create_mv.sql

prompt ���������� ����������� ��������... 
prompt 
@@all_obj.sql

prompt ���������� �������� ��... 
execute fdc_service.Recompile

prompt ����������� ���������... 
prompt 
VARIABLE lv_UpdateLogID VARCHAR2(150)
BEGIN
  :lv_UpdateLogID := '������ ' || '&&2';
  p_update_log.start_update(
      pid             => :lv_UpdateLogID
     ,pupdatetype     => p_update_log.GetIdTypeByName( '��������� �� ��', 0 )
     ,pupdatefilename => '&&4'
     ,pdescription    => '��������� ��������� �� ��'
    );
END;
/

prompt �������� �������... 
prompt 
@@create_jobs.sql

prompt ���������� ������ ��������� �����...
begin
  fdc_Service.New_Location;
end;
/

@@add_options.sql

@@post_tasks.sql &&2

prompt ����������� ��������� ���������... 
prompt 
BEGIN
  p_update_log.FINISH_UPDATE(
      pid      => :lv_UpdateLogID
     ,pLogFile => NULL
    );
END;
/

prompt ����� �������.
prompt 

spool off

exit 0
