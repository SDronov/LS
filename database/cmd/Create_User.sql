set verify off
WHENEVER SQLERROR EXIT 100
connect &&1

spool Log\Log_CreateUser.log

WHENEVER SQLERROR CONTINUE
DROP USER &&2 CASCADE;

WHENEVER SQLERROR EXIT 101
CREATE USER &&2
    IDENTIFIED BY "&&3" DEFAULT TABLESPACE &&4 TEMPORARY TABLESPACE &&5
    ACCOUNT UNLOCK
    QUOTA unlimited ON &&4;

WHENEVER SQLERROR CONTINUE

create role fdc_role_ls_adm_nsi;
create role fdc_role_ls_adm_access;
create role fdc_role_ls_otp;
create role fdc_role_ls_inspector_budget;
create role fdc_role_ls_inspector;
create role fdc_role_ls_inspector_zadolg;
create role fdc_role_ls_inspector_knp;
create role fdc_role_ls_inspector_ou;
create role fdc_role_ls_service_gtd;
create role fdc_role_ls_service_tpo;
create role fdc_role_ls_select_data;
grant SELECT_CATALOG_ROLE to fdc_role_ls_adm_access;

grant create sequence to fdc_role_ls_otp;
grant create sequence to fdc_role_ls_inspector_budget;
grant create sequence to fdc_role_ls_inspector;
grant create sequence to fdc_role_ls_inspector_zadolg;
grant create sequence to fdc_role_ls_inspector_knp;
grant create sequence to fdc_role_ls_inspector_ou;
grant create sequence to fdc_role_ls_service_gtd;
grant create sequence to fdc_role_ls_select_data;

rem
rem  !!! ВАЖНО
rem  Нужны привелегии на предоставление грантов на SYS.DBMS_ALERT, SYS.DBMS_LOCK, SYS.DBA_ROLE_PRIVS, SYS.DBMS_PIPE и SYS.DBMS_ALERT_INFO, SYS.DBMS_SCHEDULER
rem

WHENEVER SQLERROR EXIT 102

GRANT EXECUTE ON SYS.DBMS_ALERT TO &&2;
GRANT SELECT ON SYS.DBMS_ALERT_INFO TO &&2;
GRANT EXECUTE ON SYS.DBMS_LOCK TO &&2;
GRANT EXECUTE ON SYS.DBMS_SCHEDULER TO &&2;
GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO PUBLIC;
GRANT execute ON SYS.DBMS_PIPE TO PUBLIC;

spool off

exit

