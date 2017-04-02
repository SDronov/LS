set verify off
WHENEVER SQLERROR EXIT 100
connect &&1

spool Log\GrantSessions.log

WHENEVER SQLERROR EXIT 102
GRANT SELECT on sys.v_$session to &&2;

WHENEVER SQLERROR EXIT 103

spool off

exit 0
