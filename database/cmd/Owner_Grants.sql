set verify off
WHENEVER SQLERROR EXIT 100
connect &&1

spool Log\Owner_Grants.log

WHENEVER SQLERROR EXIT 102
GRANT "CONNECT" TO &&2;
--GRANT "RESOURCE" TO &&2;
grant create procedure to &&2;
grant create sequence to &&2;
grant create table to &&2;
grant create trigger to &&2;
grant create type to &&2;
GRANT CREATE VIEW TO &&2;
GRANT CREATE JOB TO &&2;
GRANT CREATE MATERIALIZED VIEW TO &&2;
GRANT QUERY REWRITE TO &&2;
--GRANT SELECT_CATALOG_ROLE TO &&2;
grant create sequence to &&2;
--grant create any directory to &&2;
grant create trigger to &&2;
-- вынесено в отдельный скрипт т.к. запуск инсталятора может идти не из под sys'a
--GRANT SELECT on sys.v_$session to &&2;
GRANT EXECUTE ON sys.dbms_alert TO &&2;
GRANT SELECT ON sys.dbms_alert_info TO &&2;
GRANT EXECUTE ON sys.dbms_lock TO &&2;

GRANT fdc_role_ls_adm_access TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_adm_nsi TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_otp TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_budget TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_zadolg TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_knp TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_ou TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_service_gtd TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_service_tpo TO &&2 WITH ADMIN OPTION;
GRANT fdc_role_ls_select_data TO &&2 WITH ADMIN OPTION;

GRANT fdc_role_ls_adm_nsi TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_otp TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_budget TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_zadolg TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_knp TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_inspector_ou TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_service_gtd TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_service_tpo TO fdc_role_ls_adm_access  WITH ADMIN OPTION;
GRANT fdc_role_ls_select_data TO fdc_role_ls_adm_access  WITH ADMIN OPTION;


WHENEVER SQLERROR EXIT 103

spool off

exit 0
