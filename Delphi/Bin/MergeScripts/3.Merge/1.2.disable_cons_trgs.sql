--Выключение констрейнтов
declare
  vDDL varchar2(2000);
begin
  --triggers
  for c_trg in (select * from user_triggers where status = 'ENABLED') loop
    vDDL := 'alter trigger '||c_trg.trigger_name||' disable';
    execute immediate vDDL;
    insert into tmp_dbobj (name, otype)
      values (c_trg.trigger_name, 'trigger');
    commit;
  end loop;
  --FK
  for c_cons in (select * from user_constraints 
                 where constraint_type in ('R') and status = 'ENABLED'
                   --and constraint_name not like 'SYS%'
                 ) loop
    vDDL := 'alter table '||c_cons.table_name||' disable constraint '||c_cons.constraint_name;
    execute immediate vDDL;
    insert into tmp_dbobj (name, otype)
      values (c_cons.constraint_name, 'constraint');
    commit;
  end loop;
  --UK
  for c_cons in (select * from user_constraints 
                 where constraint_type in ('U') and status = 'ENABLED' 
                 --and constraint_name not like 'SYS%'
                 ) loop
    vDDL := 'alter table '||c_cons.table_name||' disable constraint '||c_cons.constraint_name;
    execute immediate vDDL;
    insert into tmp_dbobj (name, otype)
      values (c_cons.constraint_name, 'constraint');
    commit;
  end loop;
end;
/  

exit