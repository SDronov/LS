set feedback off

PROMPT ����������� �����... 
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
      ,pdescript          => '������������� ���'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_ADM_ACCESS'
      ,pdescript          => '������������� ���� �������������'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_OTP'
      ,pdescript          => '��������� ���'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_BUDGET'
      ,pdescript          => '��������� �������'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR'
      ,pdescript          => '���������'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_ZADOLG'
      ,pdescript          => '��������� �������������'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_KNP'
      ,pdescript          => '��������� ���'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_INSPECTOR_OU'
      ,pdescript          => '��������� ������������ �����'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SERVICE_GTD'
      ,pdescript          => '������ �������� �� ���'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SERVICE_TPO'
      ,pdescript          => '������ �������� �� ���'
 	 );
  --
  l_result := addrole
     (
       prole_name         => 'FDC_ROLE_LS_SELECT_DATA'
      ,pdescript          => '�������� � �������� ������'
 	 );
  --
  commit;
exception
  when others then
    rollback;
	raise;
end;
/

prompt ���������. 
prompt 

prompt ��������� ������� �����... 
prompt 

@@grant_all_role.sql

prompt ���������. 
prompt 

prompt ���������� �������� ��... 
execute fdc_service.Recompile
begin
   dbms_output.disable;
   RegisterComponentAll ;
--   dbms_output.enable;
end;
/

/*
prompt ���������� ����������...
BEGIN
  dbms_stats.gather_schema_stats( ownname => USER, cascade => TRUE );
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_OBJECT',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_OBJECT_TYPE',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
  dbms_stats.gather_table_stats(ownname => user,tabname => 'FDC_VALUE',cascade => true,method_opt => 'FOR ALL COLUMNS SIZE AUTO');
END;
/
prompt ���������.
prompt
*/

prompt ���������� ������ ������...
begin
  fdc_value_sys_set(pSysName => 'Version', pStringValue => '&&1.',pNumValue => null, pDateTimeValue => null, pRef_Object_ID => null);
end;
/
commit;
select substr(t.name, 1, 30) name, substr(t.stringvalue,1,20) value from fdc_value_lst_sys t where t.sysname in ('Version', 'VersionUpdate')
/
prompt ���������.
prompt

set feedback on
