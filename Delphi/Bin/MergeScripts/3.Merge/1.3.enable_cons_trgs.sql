--проверка и включение констрейнтов
declare
  vSQL varchar2(1000);
  vDDL varchar2(2000);
  vCount number;
begin
  --Уникальные констрайнты
  for c1 in (select a.* 
               from tmp_dbobj a,
                    user_constraints b
               where a.otype = 'constraint'
                 and b.constraint_name = a.name 
                 and b.constraint_type = 'U') loop
    for c_cols in (select constraint_name, table_name, fdc_str_agg(column_name) cols, fdc_str_agg(column_name||' is null') null_cols
                     from user_cons_columns 
                     where constraint_name = c1.name
                     group by constraint_name, table_name) loop
      c_cols.null_cols := replace(c_cols.null_cols,',',' and ');
      vSQL := 'select 1 from dual where not exists (select '||c_cols.cols||', count(*) cnt from '||
        c_cols.table_name||
        ' where not ('||c_cols.null_cols||') group by '||c_cols.cols||' having count(*)>1 )';
      begin
        execute immediate vSQL into vCount;
        vDDL := 'alter table '||c_cols.table_name||' enable constraint '||c1.name;
        execute immediate vDDL;
        delete from tmp_dbobj where name = c1.name;
        commit;
      exception
        when no_data_found then
          vSQL := 'begin '||
                  'for c1 in ( select '||replace(c_cols.cols,',','||'',''||')||' vals from ('||
                  'select '||c_cols.cols||', count(*) cnt from '||c_cols.table_name||
                  'where not ('||c_cols.null_cols||') group by '||c_cols.cols||' having count(*)>1 )) loop'||
                  'insert into tmp_cons_log (cname, ctype, tname, err_text, cols, vals)'||
                  'values ('''||c_cols.constraint_name||''', ''U'', '''||c_cols.table_name||''', ''Дублирующие значения'', '''||
                  c_cols.cols||''', c1.vals); '||
                  'end loop; commit; end;';
          execute immediate vSQL;
      end;
    end loop;
  end loop;
  --Все остальные (FK)
  for c1 in (select a.*, b.table_name
               from tmp_dbobj a,
                    user_constraints b
               where a.otype = 'constraint'
                 and b.constraint_name = a.name 
                 and b.constraint_type = 'R') loop
    begin
      vDDL := 'alter table '||c1.table_name||' enable constraint '||c1.name;
      execute immediate vDDL;
      delete from tmp_dbobj where name = c1.name;
      commit;
    exception
      when others then
        for c_cols in (select col.constraint_name, col.table_name, r_col.table_name r_table_name,
                              fdc_str_agg(col.column_name) cols, fdc_str_agg('r.'||r_col.column_name||' = a.'||col.column_name) w_cols
                         from user_constraints con,
                              user_cons_columns col,
                              user_cons_columns r_col
                         where con.constraint_name = c1.name
                           and col.constraint_name = con.constraint_name
                           and r_col.constraint_name = con.r_constraint_name
                           and col.position = r_col.position
                         group by col.constraint_name, col.table_name, r_col.table_name) loop
          vSQL := 'begin '||
                  'for c2 in ( select '||replace(c_cols.cols,',','||'',''||')||' vals from '||
                  c_cols.table_name||' a '||
                  'where not exists (select 1 from '||c_cols.r_table_name||' r '||
                  'where '||replace(c_cols.w_cols,',',' and ')||')'||
                  ') loop '||
                  'insert into tmp_cons_log (cname, ctype, tname, err_text, cols, vals)'||
                  'values ('''||c_cols.constraint_name||''', ''R'', '''||c_cols.table_name||''', ''Нет родительской записи'', '''||
                  c_cols.cols||''', c2.vals); '||
                  'end loop; commit; end;';
          dbms_output.put_line(vSQL);
          execute immediate vSQL;
        end loop;
    end;
  end loop;
  --триггера
  for c1 in (select * from tmp_dbobj where otype = 'trigger') loop
    vDDL := 'alter trigger '||c1.name||' enable';
    execute immediate vDDL;
    delete from tmp_dbobj where name = c1.name;
    commit;
  end loop;  
end;
/

--Производим очистку
declare
  vSQL varchar2(1000);
begin
  for c in (select * from tmp_cons_log where ctype='R') loop
    if instr(c.cols,',')=0 then
      vSQL := 'delete from '||c.tname||
       ' where '||c.cols||' = '||c.vals;
      execute immediate vSQL;
      delete from tmp_cons_log where
        Cname=c.cname and Cols=c.cols and Tname=c.tname and Vals=c.vals;
    elsif instr(c.tname,'DBF_')>0 then
      vSQL := 'delete from '||c.tname||' a '||
       ' where not exists (select 1 from dbf_dclhead b where b.g071=a.g071 and b.g072=a.g072 and b.g073=a.g073)';
      savepoint sp1;
      begin
        execute immediate vSQL;
        delete from tmp_cons_log where
          Cname=c.cname and Cols=c.cols and Tname=c.tname and Vals=c.vals;
      exception
        when others then
          rollback to savepoint sp1;
      end;
    end if;
  end loop;
end;
/
commit;

--Повторная проверка и включение констрейнтов
declare
  vSQL varchar2(1000);
  vDDL varchar2(2000);
  vCount number;
begin
  --Уникальные констрайнты
  for c1 in (select a.* 
               from tmp_dbobj a,
                    user_constraints b
               where a.otype = 'constraint'
                 and b.constraint_name = a.name 
                 and b.constraint_type = 'U') loop
    for c_cols in (select constraint_name, table_name, fdc_str_agg(column_name) cols, fdc_str_agg(column_name||' is null') null_cols
                     from user_cons_columns 
                     where constraint_name = c1.name
                     group by constraint_name, table_name) loop
      c_cols.null_cols := replace(c_cols.null_cols,',',' and ');
      vSQL := 'select 1 from dual where not exists (select '||c_cols.cols||', count(*) cnt from '||
        c_cols.table_name||
        ' where not ('||c_cols.null_cols||') group by '||c_cols.cols||' having count(*)>1 )';
      begin
        execute immediate vSQL into vCount;
        vDDL := 'alter table '||c_cols.table_name||' enable constraint '||c1.name;
        execute immediate vDDL;
        delete from tmp_dbobj where name = c1.name;
        commit;
      exception
        when no_data_found then
          vSQL := 'begin '||
                  'for c1 in ( select '||replace(c_cols.cols,',','||'',''||')||' vals from ('||
                  'select '||c_cols.cols||', count(*) cnt from '||c_cols.table_name||
                  'where not ('||c_cols.null_cols||') group by '||c_cols.cols||' having count(*)>1 )) loop'||
                  'insert into tmp_cons_log (cname, ctype, tname, err_text, cols, vals)'||
                  'values ('''||c_cols.constraint_name||''', ''U'', '''||c_cols.table_name||''', ''Дублирующие значения'', '''||
                  c_cols.cols||''', c1.vals); '||
                  'end loop; commit; end;';
          execute immediate vSQL;
      end;
    end loop;
  end loop;
  --Все остальные (FK)
  for c1 in (select a.*, b.table_name
               from tmp_dbobj a,
                    user_constraints b
               where a.otype = 'constraint'
                 and b.constraint_name = a.name 
                 and b.constraint_type = 'R') loop
    begin
      vDDL := 'alter table '||c1.table_name||' enable constraint '||c1.name;
      execute immediate vDDL;
      delete from tmp_dbobj where name = c1.name;
      commit;
    exception
      when others then
        for c_cols in (select col.constraint_name, col.table_name, r_col.table_name r_table_name,
                              fdc_str_agg(col.column_name) cols, fdc_str_agg('r.'||r_col.column_name||' = a.'||col.column_name) w_cols
                         from user_constraints con,
                              user_cons_columns col,
                              user_cons_columns r_col
                         where con.constraint_name = c1.name
                           and col.constraint_name = con.constraint_name
                           and r_col.constraint_name = con.r_constraint_name
                           and col.position = r_col.position
                         group by col.constraint_name, col.table_name, r_col.table_name) loop
          vSQL := 'begin '||
                  'for c2 in ( select '||replace(c_cols.cols,',','||'',''||')||' vals from '||
                  c_cols.table_name||' a '||
                  'where not exists (select 1 from '||c_cols.r_table_name||' r '||
                  'where '||replace(c_cols.w_cols,',',' and ')||')'||
                  ') loop '||
                  'insert into tmp_cons_log (cname, ctype, tname, err_text, cols, vals)'||
                  'values ('''||c_cols.constraint_name||''', ''R'', '''||c_cols.table_name||''', ''Нет родительской записи'', '''||
                  c_cols.cols||''', c2.vals); '||
                  'end loop; commit; end;';
          dbms_output.put_line(vSQL);
          execute immediate vSQL;
        end loop;
    end;
  end loop;
  --триггера
  for c1 in (select * from tmp_dbobj where otype = 'trigger') loop
    vDDL := 'alter trigger '||c1.name||' enable';
    execute immediate vDDL;
    delete from tmp_dbobj where name = c1.name;
    commit;
  end loop;  
end;
/

exit