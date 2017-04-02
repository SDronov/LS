set define off

prompt ������ 02353 ... 
prompt 
begin
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00022', '���������� ��������� ��� � ���',
   '�������� �������� ��� � ��� ":1", ��� = :2, ������ � :3 �� :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00023', '���������� ��������� ��� � ���',
   '�������� �������� ��� � ��� ":1", ��� = :2, ����� ������ � :3 �� :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00024', '�������� ��������� ��� � ���',
   '������ �������� ��� � ��� ":1", ��� = :2 , ������ � :3 �� :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00106', '�������� ��� � ��� ��� ���������� ( ��� = :1 )', 'p_nsi_declarant_els');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00107', '������ ��� ���������� ��������� ��� � ���', 'p_nsi_declarant_els');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00108', '������ ��� ���������� ��������� ��� � ���', 'p_nsi_declarant_els');
exception when dup_val_on_index then null;
end;
end;
/
declare
  nID      number(15);
  l_exists number;
begin
  select t.id
    into nID
    from fdc_task_group_lst t
   where t.code2 is not null
     and t.CODE = 'NSI';
  begin
    select 1
      into l_exists
      from fdc_dict_lst t
     where t.typesysname = 'TaskGroup'
       and t.code = 'NSIDeclarantELS';
  exception
    when no_data_found then
    
      nID := fdc_dict_add(pobject_type_sysname => 'TaskGroup',
                          powner_object_id     => nID,
                          pname                => '��������� ��� � ���',
                          pshortname           => '��������� ��� � ���',
                          pcode                => 'NSIDeclarantELS',
                          pcode2               => '48');
  end;
  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'NSIDeclarantELS';
  exception
    when no_data_found then
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => '��������� ��� � ���',
                                 pSysName               => 'NSIDeclarantELS',
                                 pShortName             => '��������� ��� � ���',
                                 pTableName             => 'FDC_NSI_DECLARANT_ELS',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => 1);
    
      declare
        nproc_id number(15);
      begin
        nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                      pName                => '������� ��������� ��� � ���',
                                      pBase_Type_ID        => 1,
                                      pSysName             => 'fdc_NSIDeclarantELS_Del');
      
        update FDC_OBJECT_TYPE t
           set t.del_procedure_id = nproc_id
         where t.sysname = 'NSIDeclarantELS';
      
      end;
  end;
end;
/
prompt ������ 02353 ... ��������� 
prompt 
prompt

prompt ������ 03353 ... 
prompt 

prompt ������ 03353 ... ��������� 
prompt 
prompt

prompt ������ 04353 ... 
prompt 

prompt ������ 04353 ... ��������� 
prompt 
prompt

prompt ������ 05353 ... 
prompt 
-- ���������� ��������� ��� ���� �� ���
declare
  nOPTION_ID NUMBER(15);
  nOWNER_ID  number(15);
begin
  select oo.id
    into nOWNER_ID
    from fdc_object oo
   where oo.sysname = 'public.params';

  begin
    select t.id
      into nOPTION_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'ELSCustomCode';
  exception
    when no_data_found then
      null;
  end;

  if nOPTION_ID is null then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueString',
                                pName                => '��� ����������� ������ ��� ������� �������� �����',
                                pSysName             => 'ELSCustomCode',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => nOWNER_ID,
                                pStringValue         => '10000010');
  else
    fdc_value_sys_set(pSysName       => 'ELSCustomCode',
                      pStringValue   => '10000010',
                      pNumValue      => null,
                      pDateTimeValue => null,
                      pRef_Object_ID => null);
  end if;
end;
/
prompt ������ 05353 ... ��������� 
prompt 
prompt

prompt ������ 4.6.0.0
@@MOD_script.sql
prompt ������ 4.6.0.0 ... ���������
set define on