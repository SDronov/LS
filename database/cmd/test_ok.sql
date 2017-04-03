WHENEVER SQLERROR EXIT 100
set echo off
set heading off
set headsep off
set feedback off
set termout off
set pagesize 1000
set newpage none
set serveroutput on
connect &&1
spool log\test_ok.log
declare 
begin
  dbms_output.enable(buffer_size => 100000000);
  fdc_service.Recompile;
end;
/
exit 0
