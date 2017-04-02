set feedback off

PROMPT Регистрация ролей... 
prompt 
declare
  l_result number;
  function addrole
     (
       prole_name in varchar2
      ,pdescript  in varchar2
 	 ) return fdc_object.id%type is
     l_id fdc_object.id%type;
   begin
     --
     select max(id) into l_id
     from fdc_role
     where role_name = upper(prole_name);
     --
     if (l_id is null) then
      l_id := p_role.add
       (
         prole_name         => prole_name
        ,pdescript          => pdescript
 	   );
     end if;
     --
     return l_id;
   end;
begin
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_ADM_NSI'
      ,pdescript          => 'Администратор НСИ'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_ADM_ACCESS'
      ,pdescript          => 'Администратор прав пользователей'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_OTP'
      ,pdescript          => 'Начальник ОТП'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_BUDGET'
      ,pdescript          => 'Инспектор бюджета'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR'
      ,pdescript          => 'Инспектор'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_ZADOLG'
      ,pdescript          => 'Инспектор задолженности'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_KNP'
      ,pdescript          => 'Инспектор КНП'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_OU'
      ,pdescript          => 'Инспектор оперативного учёта'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SERVICE_GTD'
      ,pdescript          => 'Сервис списания по ГТД'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SERVICE_TPO'
      ,pdescript          => 'Сервис списания по ТПО'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SELECT_DATA'
      ,pdescript          => 'Просмотр и контроль данных'
 	 );
  --
  commit;
exception
  when others then
    rollback;
	raise;
end;
/

prompt Выполнено. 
prompt 

prompt Наделение правами ролей... 
prompt 

@@grant_all_role.sql

prompt Выполнено. 
prompt 

prompt Компиляция объектов БД... 
execute fdc_service.Recompile
begin
   dbms_output.disable;
   RegisterComponentAll ;
--   dbms_output.enable;
end;
/

/*
prompt Обновление статистики...
BEGIN
  dbms_stats.gather_schema_stats( ownname => USER, cascade => TRUE );
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_OBJECT',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_OBJECT_TYPE',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_VALUE',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
END;
/
prompt завершено.
prompt
*/

prompt Обновление номера версии...
begin
  fdc_value_sys_set(pSysName => 'Version', pStringValue => '&&1.',pNumValue => null, pDateTimeValue => null, pRef_Object_ID => null);
end;
/
commit;
select substr(t.name, 1, 30) name, substr(t.stringvalue,1,20) value from fdc_value_lst_sys t where t.sysname in ('Version', 'VersionUpdate')
/
prompt завершено.
prompt

set feedback on
