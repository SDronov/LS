declare
  nParentType number(15);
  nDOC_CHARGE number(15);
  nID         number(15);
  l_exists    number;
  nproc_id    number(15);
begin
  select t.id
    into nID
    from fdc_task_group_lst t
   where t.code2 is not null
     and t.CODE = 'DOC';

  begin
    select 1
      into l_exists
      from fdc_dict_lst t
     where t.typesysname = 'TaskGroup'
       and t.code = 'ASBCElRulings';
  exception
    when no_data_found then
      nID := fdc_dict_add(pobject_type_sysname => 'TaskGroup',
                          powner_object_id     => nID,
                          pname                => '������ ��������� ����������',
                          pshortname           => '������ ��������� ����������',
                          pcode                => 'ASBCElRulings',
                          pcode2               => '28');
  end;

  select t.id
    into nDOC_CHARGE
    from fdc_object_type t
   where t.sysname = 'DocCharge';
  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'ASBCElRulings';
  exception
    when no_data_found then
    
      nParentType := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                         pName                  => '������ ��������� ����������',
                                         pSysName               => 'ASBCElRulings',
                                         pShortName             => '������ ��������� ����������',
                                         pTableName             => 'ASBC_ELRULINGS',
                                         pIcon                  => null,
                                         pState_Scheme_ID       => null,
                                         pParent_Object_Type_ID => nDOC_CHARGE);
      nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',pName => '������� ������ �������� ����������',
      pBase_Type_ID => 1, pSysName => 'P_ASBC_ELRULINGS_Del');

      update FDC_OBJECT_TYPE t 
      set t.del_procedure_id = nproc_id
      where t.sysname = 'ASBCElRulings';
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => '������������� �� ��',
                                 pSysName               => 'ASBCElRulingsResolution',
                                 pShortName             => '������������� �� ��',
                                 pTableName             => 'ASBC_ELRULINGS_RESOLUTION',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => '��������� ����',
                                 pSysName               => 'ASBCElRulingsCriminalCase',
                                 pShortName             => '���������',
                                 pTableName             => 'ASBC_ELRULINGS_CRIMINAL_CASE',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => '���������',
                                 pSysName               => 'ASBCElRulingsProperty',
                                 pShortName             => '���������',
                                 pTableName             => 'ASBC_ELRULINGS_PROPERTY',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
  end;

end;
/
begin
begin
insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00141','������ ��� ���������� ������� ��������� ����������','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00142','�������� ���������� ��� ��������� �� ������ �������������� �������� ����������!','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00143','������ ��� ���������� ������� ��������� ���������� (ID=:1)','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00144','������ ����� ������� ��������� ����������: �������� � ������� :1 �� :2 ��� ����������','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
update FDC_EH_ERROR_CODE t set t.location='p_cdecl_loader_ex, p_tr, p_tpo, p_asbc_elrulings'
where t.type_code = 'GCD' and t.err_num = '00121';
end;
/
declare
nproc_id number(15);
nID number(15);
  l_exists    number;
begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'DeclarantChecks';
  exception
    when no_data_found then
  nID := fdc_object_type_add(pObject_Type_SysName => 'ObjectType',
                             pName => '�������� ���������� ���',
                             pSysName => 'DeclarantChecks',
                             pShortName => '�������� ���������� ���',
                             pTableName => 'ASBC_CHECKS',
                             pIcon => null,
                             pState_Scheme_ID => null,
                             pParent_Object_Type_ID => 1);

end;
/
begin
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '00.00000.00', '��������� ������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00010.01', '���� ��������� �������� � ������ ���� � ��� ��� ���������� �������� ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.01', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.02', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.03', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.04', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.05', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.06', '��� ������ ������� ����������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00021.01', '� ��������� �������� ��������� �� �������� ������������� ��������� ���.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00022.01', '�������������������� �������� ���.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00023.01', '� ��������� �������� ������ �������������� �������� ����� ��������� ���, ���� ��������� ������������ ����� ��������� ���������� �� ������������������� � ���� ��� ���������� �������������� ����������./���������� �� ��������� ��� � ��������� �������� ���� ��������� ����������� /���������� �� ��������� ��� �� ���� �������� � ��.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00025.01', '��������� ����� �������� ��� ��������� �� �� ������./���������� � ��������� �� �� ���� �������� � ��.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00024.01', '��� ������� ��������� ��� ������������� ����� �� �������������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00031.01', '�� �������� ��� �� � ����������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00032.01', '��� ����������� ������ � ����������� ��������� �� ��������������� ��� �������������� ����� ����������� ���������� .', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00033.01', '������������ ����� ����������� ������ �� ��������������� � ���� ������������ ����������  �������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00034.01', '�� ��������� ������������ ���� SoftVersion.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00035.01', '� ��������� �������� �� �������� ��� ��������������� ������ ��� ����������� ������ -  ����������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00036.01', '��������� � ��������� ��� ��������������� ������ �� ������ ����� ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00037.01', '� ��������� �� �������� ���  ����������� ������ � ���������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.01', '��� ����������� ������ � ���������� ��������� �� ��������������� ��� �������������� ����� ����������� ���������� .', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.02', '��� �����������  ����������� ������  ����������� �  ������ ��, �����������  �  ���������� ���������� ����������  �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.03', '��� ��������  ����������� ������  ����������� �  ������ ��, �����������  �  ���������� ���������� ����������  �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.04', '��������� ���������� ���������� �� - ������� �� ����������� ������ ��, �����������  �  ���������� ���������� ����������  �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.05', '�� � ������ ������� ���������� �������� ������ ���� ������ � �������������� ���������� ���������� �������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00039.01', '� ��������� ��������� �� ������ ��� ��������������� ������  ��� ����������� ������ � ���������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00040.01', '��������� � ��������� ��� ��������������� ������ �� ������ ����� ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00041.01', '��������� ��������������  ��  ������� �� ��������� ���������� ����������: /������������� ����� �����������, ��� ����������� ������, ������ ��������������� ������, ������������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.01', '����������, ������������ �� �� ������������� ���� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.02', '��� ��������  �� ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.03', '���������, ���������� � 44 (54) �����, ����� ������������ ������� ��������������. �������� ������ ����� ������ � ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00047.01', '��� ������ ����� ����������� ����������� ���� ��������� ����� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00048.01', '��� ������� ����������� ������ ����������� ���� ��������� ����� �������� � �������  ������������ ������������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00049.01', '� ��������� ��������� �� ������ ������������� ���������  ��������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.01', '��� ������ ������� �������� ��� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.02', '��� ������ ������� �������� ��� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.03', '��� ������ ������� �������� ��� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.04', '��� ������ ������� �������� ��� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.05', '��� ������ ������� �������� ��� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00051.01', '������������ ��������� �������� ������������ ���.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.01', '��� �������� ����������� ���������  ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.01', '��� �������� ����������� ���������  ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.02', '��� �������� ����������� ���������  ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.02', '������ �������� �����������. ���� �������� �������������� ����������� �����.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.04', '������ �������� �����������. ������������� ���������� �����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.05', '������ �������� �����������. ������������� ���������� ����� �������� �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.06', '������ �������� �����������. ������������� ���������� �� �������� ��� �������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.10', '������ �������� �����������. ������������� ���������� ����� �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.11', '������ �������� �����������. ������������� ���������� ����� �������� ����������� �������� ������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.25', '������ �������� �����������. ���������� �������� ������� ������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.03', '������ �������� �����������.  ��������� ��� �������������� �������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.04', '������ �������� �����������.  ��������� ��� �������������� �� ������-������� �������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.05', '������ �������� �����������.  ��������� ����� ��� �������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.06', '������ �������� �����������.  ������������ ����������(AcceptableTypes ��� Nonce) ��������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.07', '������ �������� �����������.  ����������� ������� �� ��� ��������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.08', '������ �������� �����������.  ������������� ������� �� ��� ��������� ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.09', '������ �������� �����������.  �������� ���������� �������� ������� � ������� �� ��� � ������ �� �����.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.10', '������ �������� �����������.  �� ������ ����� ���.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.11', '������ �������� �����������.  ����� ��� �� �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.12', '������ �������� �����������.  �������� ���� ThisUpdate �� �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.13', '������ �������� �����������. �������� ���� NextUpdate ������, ��� ���� ThisUpdate.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.14', '�� ����� ������� ������� ����������� �������� ����������� ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.01', '���������� �������. ������� ������ �� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.02', '���������� ����������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.03', '����� ������������ ����������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.04', '� ����������� ���������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.05', '���������� �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.06', '���������� ������ �� ����� ��� ��� �����, ��� ������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.07', '�������� ����������� ��������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.08', '������ ���������� �� CRL (������������ ������ � ���������� CRL).', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.09', '����������, �������������� ������ ������������, ���� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.10', '���������������� �����, ����������� ���������� �����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.11', '������ ����������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.12', '����������� �������� �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.01', '��� ������ ������� �������� ��������� ��������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.02', '��� ������ ������� �������� ��������� ��������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.03', '��� ������ ������� �������� ��������� ��������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.04', '��� ������ ������� �������� ��������� ��������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.05', '��� ������ ������� �������� ��������� ��������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.01', '�������� �� ������������� �����.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.02', '� ���������  ����������� ������������ ���� ��� ��������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.03', '�� ���������� ������ ������� �������� ��� ������� ��������� ��� �������� ���������� ������ ������ �� ��������������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.04', '�������� ����������� � ������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.05', '��� �������� ���������� �� ����� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.06', '��� �������� ���������� �� ����� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00072.01', '�������������� ���� ��������� � ���� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00072.02', '� ������ ���� ��������� ��������� ���������� �������� ReasonPaper.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.06', '������ ���������� ����������� ��������� �� ���', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.07', '������ ����������  ���������  �� ����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.05', '������ ���������� ����  ��������� �� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00090.01', '��� ����������� ������, ��������� � ��������� ��������, �� ������������� ��������� �� ��������� ��������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.01', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.02', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.03', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.04', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.06', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.07', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.08', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00002.01', '��� ������ � ����� ������  ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.05', '������ �������������� ���������, ������������� �  ���������. �������� � ������ ��������������� ��� ���������� �  ���� ������.  ������� ������� ������������ ���������������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.99', '������ �������������� ���������. ��������� � ������ ��������������� ��� ���������� �  ���� ������.  ������� ������� ������������ ���������������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00001.01', '��������, ��������� � ��������� �������������� �� ������ � ���� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00081.01', '���������� ��������� ���������� ���������� � ������ ��������� ��������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00082.01', '������������� ���������, �� ������� ������� ������, ����������� � ���� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00010.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00018.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00019.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00022.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00023.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00026.01', '��� ��������� ���������� ��� ��  ������ �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00011.01', '��������-��������� �� �������� ������������� ������ ����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00012.01', '��������-��������� �� �������� ������������� ������ ����������, ���� �� ���������� ���� FullSetIndicator', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00013.01', '������ ��������� ������ ���������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00014.01', '��������� �� �������� ������������ ����� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00014.02', '�������� GuaranteeCustomsReceipt ������ ������������ � ��������� CMN.11126 � ������, ����� � ��������� GuaranteeKind �������� ����������� �������� ��������, ����������� ��� ������������ ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00015.01', '�� ������� ����� ��������-��������� � �� �� ���������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00015.02', '� �� �� ������ �������� �� �������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00016.01', '��� ������ ��������� ��������� ������������� ��������� �� �������� ������� ����', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00017.01', '��� ������ ��������� ��������� ������������� ��������� �� ��������, �� ���������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00021.01', '� ���������� ������ ��� ���� ������ �� �������� ��������� � ��������� � ������� �� ����� ������� �� �������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00021.03', '�� ������  ���������  ���������� ������  ��  ��������  ��������� ��� ����� ��,  �� ��������  ��  ���� ������� ������� � ��', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00024.01', '��� ������ ������� ������������ ������ ���������� �������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.01', '�� ��������� ������������ ��� ���������� �������� ���� RefDocumentID � ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.02', '�� ��������� ������������ ��� ���������� �������� ���� RefDocumentID � ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.03', '�� ������ ��������� �� �� ���������. �������� � ��� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.01', '�� ��������� ������������ ��� ���������� �������� ���� InitialEnvelopeID � ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.02', '��������� ������������� InitialEnvelopeID �������� �����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.03', '���������, ��������� � InitialEnvelopeID, ����������� � ��', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00029.01', '���������� ������������� �������������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00030.01', '������ ������������� ��������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00030.02', '������ ������������� ��������� ���������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.00', '������ ��� ������ ������� �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.01', '������ ��� ������ ������� �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.03', '��� ������ � ������� :1 ��� ��������� � ����� ���� :2 ����������� �������� �����', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00101.01', '������ ������� ��������, ��������� � ��������� ��������� �� �������� � ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00102.01', '����� ���� ��������  ������ ������� ��������, ��������� � ��������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00103.01', '�������� ��������� ������������� ���������. ��������� ������������� ��������� ������ �������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00104.01', '���  ������������� ����������� ������������ �������� ����������� ����������� �� ��������  ������� ���� ����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00105.01', '��������������� ��,  ����������� ������� ���������� �������, �� ������� � ���� ������ ��� �����������  ����������� ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00105.02', '��� �� ��������� �� ��������� � ������ �������� �� ��� ������� �������� � ����', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.01', '���������, ������� ������ �� ����������� ����� ����������, �� ������� � ����������� ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.02', '� ������� �� �������������� ���������� ��  �������� ��������  ������������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.04', '������������� ��������� ��� �� ������������� �������������� ��������� ������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00107.01', '�������� � �������������� ���������� ��  ������� � ��', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00108.01', '���� �������� �������� �� ��������� ������������� ��� �� �����', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.01', '��� ����������� ������, ��������� � ��������� �������������� ����������� � ����������� ����������� �������,� � �������� ����� ����������� ���������� �������� ��� ������� ���', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.02', '���������� ��� ���������� �� �������� ���� ������� ��������������� �������������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.04', '�� �������� ��� ������������ ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.05', '�����������/��������� �� ������ � ������ ������������-�������������� �������� � ����� ���������� ��������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.06', '��� ����������� ������, ��������� � ��������� �������������� ����������� � ����������� ���������� �������, � ������� ����� ����������� ���������� �������� � �������� ��� ������� �����������, ������������� �������������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.31', '����������� ����������� ��������. �� �������� ��� ���������(DocCode).', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.32', '�������������� ���� �������������� ���������(DocCode) � ��� DocumentModeID.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.33', 'DocCode ���������, ����������� �� ����������, �� ������ � ��.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.58', '�� ��������� ������������ ���� ��� ������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.59', '������ ��������  ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00001.01', '���������  ������. ������� ��������� ��� ������������ ��������� ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00002.01', '������ ��������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00003.01', '������ �� ����� ���������� �������� ��������� � ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00004.01', '������ �� ����� ���������� �������� ���������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00005.01', '������� ���������������� ��� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00005.05', '���������  ������. ������� ��������� ��� ������������ ��������� ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00051.99', '������ ��������������  � ����������� ������� ����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00052.99', '��������� ����� �� ������������ ������ ����������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00053.99', '�������� ������������ ������ ���������� �����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.01', '������������ ������ ���������. ����������� �������� ������������� ���������/��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.02', '������������ ������ ���������. ������� ������������ ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.03', '������������ ������ ���������. ����������� ���� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.04', '������������ ������ ���������. ������ ��� ���������� ������������ ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.05', '������������ ������ ���������. ����������� ��� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.06', '������������ ������ ���������. �������� �� ������������� �����.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00002.01', '����� �� ������. �� ������ ����� � ��������� ���������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00002.02', '����� �� ������. �� ������� ����� ����������� � ��������� ���������������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00003.01', '���������� ������� �����. ����� �������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00004.01', '�������� �� ������. ����������� ��� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00004.02', '�������� �� ������. �������� �� ������ � ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.01', '���������� ������� ��������. �������� ������������ � �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.02', '���������� �������� ��������. �������� ������������ � �������� ����������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.03', '���������� �������� ��������. ������ ��������� �� �������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.04', '���������� ������� ��������. ������ ��������� �� �������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.05', '''���������� �������� ��������. ��� ����������� ��������� �� ������������� ���� ���� ����������� ���������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.06', '���������� �������� ��������. ��� ����������� ��������� �� ������������� ���� ����������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00006.01', '������������ ������ ���������. ������ ���������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.01', '������ ��� ��������� � ��. ������ ������ ������ � ��.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.02', '������ ��� ��������� � ��. �������� ����������� ������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.03', '������ ��� ��������� � ��. ������ �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.05', '������ ��� ���������� ���������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00008.01', '���������� ���������� ��������. ��� ������������ ��������� �� ������������� ���� ���� ���������, ���������� � �������', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00010.01', '������ ��� ������� �������� ��������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00010.02', '������ ��� ������� �������� ��������� ��������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '12.00001.00', '��������� ��������������  �� ������� � ��', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '99.99999.99', '����� ������ ��� ������ �������.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.03', '��� ����������� / ��� ���������� �� �������� � ������� �������������� ������������� ����������', '');

exception when dup_val_on_index then null;
end;
end;
/
begin
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (1, '��������� ����', '�������� � ��������� ��� ������������� ��������� ��� �����-���� ��������������� ���������� �����', 'PKG_ASBC_CHECKS.execRequestAcc');

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (2, '��������� �� ����', '�������� ���������������� ������������ ���� �� ���� �������', 'PKG_ASBC_CHECKS.execRequestStatCRV');

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (3, '���������� ����', '������ ����������� ���, ������� ����� ����������� �� ����� ��������� ��� ��� ������������ (����������� �������� � �.�.)', 'PKG_ASBC_CHECKS.execRequestAuthCRV');

exception when dup_val_on_index then null;
end;
end;
/
begin
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'INN', 0, 1, '���', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'KPP', 0, 2, '���', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'OGRN', 0, 3, '����', 9);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'AccountNum', 0, 21, '����� �����', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'BIK', 0, 22, '��� �����', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'INN', 0, 1, '���', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'KPP', 0, 2, '���', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'OGRN', 0, 3, '����', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'INN', 0, 1, '���', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'KPP', 0, 2, '���', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'OGRN', 0, 3, '����', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Name', 0, 7, '���', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Surname', 0, 6, '�������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'BirthDate', 0, 9, '���� ��������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportSeria', 0, 10, '����� ��������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportNumber', 0, 11, '����� ��������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportDate', 0, 12, '���� ������ ��������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportOrganizationName', 0, 13, '������������ �����������, �������� �������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportOrganizationCode', 0, 14, '��� �������������, ��������� ������� ', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Middlename', 0, 8, '��������', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'OGRN', 0, 17, '������', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Surname', 0, 18, '�������', 2);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Name', 0, 19, '���', 2);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Middlename', 0, 20, '��������', 2);
exception when dup_val_on_index then null;
end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'ReestrSpecifyKindPay';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'ReestrNoticeSpecifyKindPayGuaranteeing';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '������ ����������� �� ��������� ���� ������� �����������',
                              pSysName               => 'ReestrNoticeSpecifyKindPayGuaranteeing',
                              pShortName             => '������ ����������� �� ��������� ���� ������� �����������',
                              pTableName             => 'FDC_REESTR_GNOTICE_KINDPAY',
                              pIcon                  => null,
                              pState_Scheme_ID       => l_state_scheme_id,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  update FDC_OBJECT_TYPE t
     set t.serialization_function = 'FDC_XML.Srlz_RNoticeSKPayGuar',
         t.deserialization_function = 'FDC_XML.Dsrlz_RNoticeSKPayGuar'
   where t.id = l_id;

  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => '������� ������ ����������� �� ��������� ���� ������� �����������',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_REESTR_GNOTICESPECIFYKINDPAY.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_oper_id number;
  l_acc_id  number;
  l_id      number;
begin
  select t.id
    into l_oper_id
    from fdc_custom_operation_lst t
   where t.code = 'OP.0053'
     and t.SDATE <= sysdate
     and t.EDATE is null;
     
  select t.id
    into l_acc_id
    from fdc_acc_light_lst t
   where t.code = '02.01.03'
     and t.SDATE <= sysdate
     and t.EDATE is null;

  l_id := fdc_rel_oper_acc_add(pName        => null,
                               pOperationID => l_oper_id, --���������� ������������� ���������� �� ��, �� ��� � ������� �������
                               pAccountID   => l_acc_id, --02.01.03
                               pShortName   => null,
                               pDescript    => null,
                               pActionSign  => 1,
                               pIsDebit     => 'Y',
                               pEnableFunc  => 'IS_EN_DOC_OPER_CHARGE');
exception when dup_val_on_index then 
  null;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettings';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '�������� ��������������',
                              pSysName               => 'InteractSettings',
                              pShortName             => '�������� ��������������',
                              pTableName             => 'ASBC_INTERACT',
                              pIcon                  => null,
                              pState_Scheme_ID       => l_state_scheme_id,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => '������� �������� ��������������',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACT.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettingsMsgTypes';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '���� ��������������',
                              pSysName               => 'InteractSettingsMsgTypes',
                              pShortName             => '���� ��������������',
                              pTableName             => 'ASBC_INTERACTMSGTYPES',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => '���� ��������������',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACTMSGTYPES.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettingsQueues';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '������� ��������������',
                              pSysName               => 'InteractSettingsQueues',
                              pShortName             => '������� ��������������',
                              pTableName             => 'ASBC_INTERACTQUEUES',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => '���� ��������������',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACTQUEUES.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractLog';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '������ ��������������',
                              pSysName               => 'InteractLog',
                              pShortName             => '������ ��������������',
                              pTableName             => 'ASBC_INTERACT_LOG',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';
  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractLogDocuments';
  exception
    when no_data_found then

  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => '������ �������������� (���������)',
                              pSysName               => 'InteractLogDocuments',
                              pShortName             => '������ �������������� (���������)',
                              pTableName             => 'ASBC_INTERACT_LOG_DOCS',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  end;
end;
/
begin
null;
--insert into FDC_UPDATE_TYPE(ID, TYPE_NAME) values (1938248,'����������� ������ � ��');
exception when dup_val_on_index then null;
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'LSRTU';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '��� "�����" �������� ����� � ��ӻ',
                         pShortName           => '��-���',
                         pCode                => 'LSRTU');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'ASFINES';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '��� ��������',
                         pShortName           => '',
                         pCode                => 'ASFINES',
                         pCode2               => 'ASFINES');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'ASG';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '�� ������������',
                         pShortName           => '',
                         pCode                => 'ASG',pCode2 => 'ASG');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'CIA';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '������������������ ������� ����������� ���������� � ����������� ��������',
                         pShortName           => '',
                         pCode                => 'CIA',
                         pCode2               => 'CIA');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'PROP';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '��� ���������',
                         pShortName           => '',
                         pCode                => 'PROP');
  
end;
/
declare
 l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'CRV';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '��� ������Ļ',
                         pShortName           => '',
                         pCode                => 'CRV',
                         pDocum               => '��� ������Ļ');
  
end;
/
declare
 l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'LAW';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => '��� "����������"',
                         pShortName           => '',
                         pCode                => 'LAW',
                         pDocum               => '��� "����������"');
  
end;
/
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='INTERNAL';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '������������ ��������������', 
                        pCode           =>'INTERNAL' , 
                        pType           => 0, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','LSRTU'), 
                        pDescript       => '������������ �������� ����� ��������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='INTERNAL' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'INTIN', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'INTERNAL', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'p_asbc_interact_log_insert', 
                                              pDescript        => '��������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='INTERNAL' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'INTOUT', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'INTERNAL', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'p_asbc_interact_log_insert', 
                                              pDescript        => '���������'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='FINES';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '�������������� � ��� "������"', 
                        pCode           =>'FINES' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','ASFINES'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10001' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10001', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => '������������� �� ���� �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => '����������� �������� � ����������� ���������� ������������� �� ���� �� �� / ��� � �������� �������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => '���������� � ������������ ��������� ���������� � ������������� �� ����� �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.form_10004', 
                                              pDescript        => '���������� � �������������������� �������� ����������� �� ����� �� ���������������� ��������������� � � ������������ ����������� �������������� �� ���� �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10005' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10005', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10005', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.form_10005', 
                                              pDescript        => '���������� � ������������ ��������� ���������� � ������������� �� ����� �� ��'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='ASG';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '�������������� � �� "�����������"', 
                        pCode           =>'ASG' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','ASG'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '����������� �� ��������� ������� ��������� ������ �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '��������� ��������� ��������� �� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.005' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.005', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.005', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '�������� � ��������� ��������� ������ �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => '��������� ��������� ��������� ��� �������� �����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ ���������� � ������� ������� ��������� ������ �� ��.'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.006' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.006', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.006', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => '����������� � �������������� �������� ������� �� ��'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.007' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.007', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.007', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => '����������� �� ��������� ������������� �����������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.008' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.008', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.008', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '����������� �� ������ � ���������� ��������� ��������� �� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.009' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.009', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.009', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '����������� �� �������� ��������� ��������� �� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.010' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.010', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.010', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => '������ ���������� � �����������/��������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.011' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.011', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.011', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => '�������� � �����������/ ��������'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='��� ��';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '��� "����������� ��������������"', 
                        pCode           =>'��� ��' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','CIA'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11213' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11213', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11213', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.carry', 
                                              pDescript        => '������� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11214' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11214', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11214', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.CARRY', 
                                              pDescript        => '������� ������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11215' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11215', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11215', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.CARRY', 
                                              pDescript        => '������� �� ������'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='LAW';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '�������������� � ��� "�����������"', 
                        pCode           =>'LAW' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','LAW'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACL.10000' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACL.10000', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACL.10000', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_LAW.carry', 
                                              pDescript        => '���������� ������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACL.10001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACL.10001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACL.10001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '����������� � �������� (������ ��������)'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='PROPERTY';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '�������������� � ��� "���������"', 
                        pCode           =>'PROPERTY' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','PROP'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20001', 
                                              pDescript        => '�������� � ������������ �� ������� ���� �������������� ������� � ����� ���������� � ����������� ������������� �������� �������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20002' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20002', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20002', 
                                              pDescript        => '�������� � ��������� � �������� ����� �������������� ������� � ����� ���������� � ����������� ������������� �������� �������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20002', 
                                              pDescript        => '����������� �������� ���������� �� ���������� � ����������� ������������� �������� ���������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.carry', 
                                              pDescript        => '����������� �������� ���������� �� ���������� � ����������� ������������� �������� ���������'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='CRVED';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => '�������������� � ��� ������Ļ', 
                        pCode           =>'CRVED' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','CRV'), 
                        pDescript       => '�������������� � ��� ������Ļ'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.21002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.21002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.21002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '�������� � �������������� ����������� ����� ������������ ����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.10003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.10003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.10003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '��������� �� ������ (������ �� �������)'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.00001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.00001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.00001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '��������� �� ������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.25002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.25002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.25002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '�������� � ������� ���� ���������� ����������� ����� � ��������������� ���������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.22002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.22002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.22002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '�������� � ������� ���� ���������� ����������� ����� � ����������� ����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.00004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.00004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.00004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '��������������� ���������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.23002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.23002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.23002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '�������� � ������� ������������ ����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.24002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.24002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.24002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => '�������� � ����������� ����� ��������� ���, ������� ����� ����������� �� ����� ��������� ��� ��� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.23001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.23001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.23001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ � ������� ������������ ���� �� ���� �������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.24001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.24001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.24001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ ���������� � ����������� ����� ��������� ���, ������� ����� ����������� �� ����� ��������� ��� ��� ������������'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.22001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.22001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.22001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ ���������� � ������� ���� ���������� ����������� ����� ����������� ����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.21001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.21001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.21001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ ���������� � ������� ���� ���������� ����������� ����� ������������ ����'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.25001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.25001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.25001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => '������ ���������� � ������� ���� ���������� ����������� ����� ��'); 
  end; 
end; 
/ 
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'DecisionQualifier'
     and t.code = '20';
exception
  when no_data_found then
    l_id := fdc_decision_qualifier_add(pObject_Type_SysName => 'DecisionQualifier',
                                       pOwner_Object_ID     => null,
                                       pName                => '�������� ������',
                                       pShortName           => '',
                                       pCode                => '20');
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2015';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => '������� ������� ��������� ������� �� 2015 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pShortName           => '������� ������� ��������� ������� �� 2015 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pDescript            => '������� ������� ��������� ������� �� 2015 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2015',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pShortName           => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pDescript            => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543013_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pShortName           => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pDescript            => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543013_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543009_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pShortName           => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pDescript            => '������� ������� ��������� ������� �� 2016 ��� (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543009_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ROOT_ID NUMBER(15);
  nOPTION_ID      NUMBER(15);
begin
  begin
    select t.id
      into nOPTION_ROOT_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'NotifyRoot';
  exception
    when no_data_found then
      nOPTION_ROOT_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                       pName                => 'Notify',
                                       pShortName           => 'Notify',
                                       pDescript            => '������ �������� ���������� ������������/�������',
                                       pSysName             => 'NotifyRoot',
                                       pIsSystem            => 1,
                                       pOwner_Object_ID     => '',
                                       pStringValue         => 'Notify');
  end;
  begin
    select t.id
      into nOPTION_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'Notify.LoadFKtoOK';
  exception
    when no_data_found then
      nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueBool',
                                  pName                => '���������� � �������� ���������� �� � "�����-������������"',
                                  pShortName           => 'LoadFKtoOK',
                                  pDescript            => '',
                                  pSysName             => 'Notify.LoadFKtoOK',
                                  pIsSystem            => 1,
                                  pOwner_Object_ID     => nOPTION_ROOT_ID,
                                  pStringValue         => '���',
                                  pNumValue            => 0);
  end;
  begin
    select t.id
      into nOPTION_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'Notify.LoadOKtoLS';
  exception
    when no_data_found then
      nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueBool',
                                  pName                => '���������� � �������� ���������� �� "�����-������������" � "������� ����� - ���"',
                                  pShortName           => 'LoadOKtoLS',
                                  pDescript            => '',
                                  pSysName             => 'Notify.LoadOKtoLS',
                                  pIsSystem            => 1,
                                  pOwner_Object_ID     => nOPTION_ROOT_ID,
                                  pStringValue         => '���',
                                  pNumValue            => 0);
  end;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActChangeOstKBK','��� � �������� �������� � �������� ���');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionDeposit','��� �� �������� ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionOverPay','��� �� �������� �������� ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionPays','��� �� �������� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdviceLevy','����������� �� �������� ���������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePay','����������� �� �������� ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePayPeriodic','����������� �� �������� ������ ��� ������������� ��������������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePayTPO','����������� �� �������� ������ �� ���');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AnnulTPO','�������� ������������� ���');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AnnulTR','�������� ������������� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CancelDecisionPayback','������ ������� �� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CashlessPaymentOrder','��������� ���������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CashOrderBank','����� ����� �����');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ConfirmSpecifyKindPay','������������� ������������� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionGTDCCharge','������ �������� (��)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionGTDSubject','��������� ������������� ���������� (��)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPOBack','������������� ���������� ��������� (�������)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPoSubject','������������� �/� (�������� ���)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPOSum','������������� ���� � ��������� ���������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionTPOCCharge','������ �������� (���)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionTPOSubject','��������� ������������� ���������� (���)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CrossPay','�������� ������� �� �� �� ��� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CustomCheque','��� �� ���������� �����');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPaybackOutback','������� � �������� �������� ������� ����������� �� ����');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPayment','������� � ������ � ���� ���������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPaymentDeposit','������� � ������ ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge','���������� �� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge.Cancel','������ ���������� (��)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge.Correct','�������������� ����������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclPayment','������ �� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecOffsetObligation','������� � ������ �� ��.145');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackAdvance','������� � �������� ��������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackDeposit','������� � �������� ��������� ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackLevy','������� � �������� ������� ���������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackPay','������� � �������� ������� ���������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackPeriodic','������� � �������� �������� ������ ��� ������������� ��������� ��������������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackTimeOut','������� � �������� ��������� �� ��������� ������ ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Detail.CancelPay','����������� ������ ������ (������������� ��������� ����������)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocReuse','����� ����� ����������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Document','��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.DPReturns','������������� ��������� ������� ������ �� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.Reuse','"�������������-���������" ��������� ������ ����� �� � ����������� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.SpecifyKindPay','"�������������-���������" ��������� �����������/������������� �� ��������� ���� ������� � ����������� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('GroundsRemoveDebts','��������-��������� ��� ���������� �������������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NonIDCashOrder','�������������������� �������� �����');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NonIDCustomCheque','�������������������� ��� �� ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticePay','��������������� �������� ����� �������������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticeSpecifyKindPay','����������� �� ��������� ���� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticeSpecifyKindPayCorr','����������� �� ��������� ���� ������� ��� �������� ������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PayDebt','��������� �����');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.ActChangeOstKBK','�������� �� ���� � �������� �������� � �������� ���');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.Correct','�������������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.NotDemanded','�������� ���������������� �/�');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentFor','������� �� ������ ��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderConfirm','�������������� �������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderNonID','�������������������� �������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderRestCustoms','�������� �������� �������� �������� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderRestUFK','�������� �������� �������� �������� ���');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Payment_Order_PayBack','������ �� ������� �������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Payment_Order_PayBackY','������������ ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PayPeriodic','������ �������� ��������');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('TR','��');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('TrDuplicate','�������� ���������� ��������');
exception when dup_val_on_index then null;
end;
/
