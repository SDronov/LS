set define off

prompt Сборка 02353 ... 
prompt 
begin
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00022', 'Добавление участника ВЭД с ЕЛС',
   'Добавлен участник ВЭД с ЕЛС ":1", ИНН = :2, период с :3 по :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00023', 'Обновление участника ВЭД с ЕЛС',
   'Обновлен участник ВЭД с ЕЛС ":1", ИНН = :2, новый период с :3 по :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EVT_CODE
  (TYPE_CODE, CODE, NAME, DSCR_TEMPLATE)
values
  ('NSI', '00024', 'Удаление участника ВЭД с ЕЛС',
   'Удален участник ВЭД с ЕЛС ":1", ИНН = :2 , период с :3 по :4');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00106', 'Участник ВЭД с ЕЛС уже существует ( ИНН = :1 )', 'p_nsi_declarant_els');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00107', 'Ошибка при добавлении участника ВЭД с ЕЛС', 'p_nsi_declarant_els');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE
  (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values
  ('NSI', '00108', 'Ошибка при обновлении участника ВЭД с ЕЛС', 'p_nsi_declarant_els');
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
                          pname                => 'Участники ВЭД с ЕЛС',
                          pshortname           => 'Участники ВЭД с ЕЛС',
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
                                 pName                  => 'Участники ВЭД с ЕЛС',
                                 pSysName               => 'NSIDeclarantELS',
                                 pShortName             => 'Участники ВЭД с ЕЛС',
                                 pTableName             => 'FDC_NSI_DECLARANT_ELS',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => 1);
    
      declare
        nproc_id number(15);
      begin
        nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                      pName                => 'Удалить Участника ВЭД с ЕЛС',
                                      pBase_Type_ID        => 1,
                                      pSysName             => 'fdc_NSIDeclarantELS_Del');
      
        update FDC_OBJECT_TYPE t
           set t.del_procedure_id = nproc_id
         where t.sysname = 'NSIDeclarantELS';
      
      end;
  end;
end;
/
prompt Сборка 02353 ... выполнено 
prompt 
prompt

prompt Сборка 03353 ... 
prompt 

prompt Сборка 03353 ... выполнено 
prompt 
prompt

prompt Сборка 04353 ... 
prompt 

prompt Сборка 04353 ... выполнено 
prompt 
prompt

prompt Сборка 05353 ... 
prompt 
-- Добавление настройки для кода ТО ЕЛС
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
                                pName                => 'Код таможенного органа для Единого Лицевого Счета',
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
prompt Сборка 05353 ... выполнено 
prompt 
prompt

prompt Версия 4.6.0.0
@@MOD_script.sql
prompt Версия 4.6.0.0 ... выполнено
set define on