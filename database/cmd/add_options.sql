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
                                pName                => '������ ��� �������',
                                pShortName           => '������ ��� �������',
                                pDescript            => '������ ��� �������',
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
                                pName                => '������ ������������� ���',
                                pShortName           => '������ ������������� ���',
                                pDescript            => '������ ������������� ���',
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
                                pName                => '������ ��� ���������� �� ��������� �����',
                                pShortName           => '������ ��� ���������� �� ��������� �����',
                                pDescript            => '������ ��� ���������� �� ��������� �����',
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
                                pName                => '���������� � ��������� ���������',
                                pShortName           => '���������� � ��������� ���������',
                                pDescript            => '���������� � ��������� ���������',
                                pSysName             => 'Notify.Interact',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => l_owner_id,
                                pStringValue         => '���',
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