whenever sqlerror exit 101
connect &&1

begin
  for c in (select t.object_name
                  ,t.object_type
              from user_objects t
             where t.object_type in ('TABLE', 'VIEW', 'SEQUENCE', 'PACKAGE',
                    'PROCEDURE', 'FUNCTION', 'TYPE')) loop
     execute immediate  'drop ' || c.object_type || ' "' || c.object_name || '"' || 
        case when c.object_type = 'TABLE' then ' cascade constraints' 
             when c.object_type = 'TYPE'then ' force'
         else '' end;
  end loop;
end;
/
exit 100



