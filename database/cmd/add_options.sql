begin
declare
  nOPTION_ID NUMBER(15);
begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'ListKBKFines';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueString',
                                pName                => 'Список КБК штрафов',
                                pShortName           => 'Список КБК штрафов',
                                pDescript            => 'Список КБК штрафов',
                                pSysName             => 'ListKBKFines',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => ';',
                                pNumValue            => null);
end;

declare
  nOPTION_ID NUMBER(15);
begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'ListKBKProperty';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueString',
                                pName                => 'Список имущественных КБК',
                                pShortName           => 'Список имущественных КБК',
                                pDescript            => 'Список имущественных КБК',
                                pSysName             => 'ListKBKProperty',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => ';',
                                pNumValue            => null);
end;

declare
  nOPTION_ID NUMBER(15);
begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'ListKBKLaw';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueString',
                                pName                => 'Список КБК возмещений по уголовным делам',
                                pShortName           => 'Список КБК возмещений по уголовным делам',
                                pDescript            => 'Список КБК возмещений по уголовным делам',
                                pSysName             => 'ListKBKLaw',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => ';',
                                pNumValue            => null);
end;

declare
  nOPTION_ID NUMBER(15);
  l_owner_id number;
begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'Notify.Interact';
exception
  when no_data_found then
    select t.id
      into l_owner_id
      from fdc_value_lst_sys t
     where t.SYSNAME = 'NotifyRoot';
     
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueBool',
                                pName                => 'Уведомлять о получении конвертов',
                                pShortName           => 'Уведомлять о получении конвертов',
                                pDescript            => 'Уведомлять о получении конвертов',
                                pSysName             => 'Notify.Interact',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => l_owner_id,
                                pStringValue         => 'Нет',
                                pNumValue            => 0);
end;
update fdc_value v
   set v.locality = 2
 where v.id in
       (select t.id
          from fdc_object_lst t
         where t.sysname in
               ('NotifyRoot', 'Notify.LoadFKtoOK', 'Notify.LoadOKtoLS', 'Notify.Interact'));
update fdc_object t
  set t.owner_object_id = (select pp.id from fdc_object_lst pp where pp.sysname = 'public.params')
 where t.id in
       (select v.id
          from fdc_value_lst_sys v
         where v.SYSNAME in
               ('ListKBKLaw', 'ListKBKProperty', 'ListKBKFines'));
end;
/