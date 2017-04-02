inherited MainData: TMainData
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Left = 243
  Top = 261
  Height = 443
  Width = 746
  inherited Session: TfdcOracleSession
    DesignConnection = True
    LogonUsername = 'doxod_ls_t'
    LogonPassword = 'w'
    LogonDatabase = 'FORS'
  end
  inherited StartScript: TOracleScript
    Left = 32
    Top = 64
  end
  object dsObjectTypeAll: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_Object_Type_Lst_All')
    SourceServerObject = 'FDC_OBJECT_TYPE_LST_ALL'
    Left = 119
    Top = 16
  end
  object dsObjectIs: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_Object_Is(:ID,:TYPESYSNAME);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_IS'
    Left = 206
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end>
  end
  object dsObject: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_Object_Lst'
      ' where ID = :ID'
      '')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 294
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsObjectFree: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Object_Free(:ID);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_FREE'
    Left = 119
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsCheckVersion: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_Check_Version('
      '    :CHKVERSION,'
      '    :CHKBUILDNUM,'
      '    :CURRENTVERSION,'
      '    :VERSIONMIGRATE);'
      'end;')
    SourceServerObject = 'FDC_CHECK_VERSION'
    Left = 206
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CHKVERSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CHKBUILDNUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURRENTVERSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VERSIONMIGRATE'
        ParamType = ptUnknown
      end>
  end
  object dsGetUser: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_User_Get(:LOGIN);'
      'end;')
    SourceServerObject = 'FDC_USER_GET'
    Left = 294
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptUnknown
      end>
  end
  object dsUserIsAdminData: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_User_Is_AdminData('
      '    :USER_ID,'
      '    :DORAISE);'
      'end;')
    SourceServerObject = 'FDC_USER_IS_ADMINDATA'
    Left = 575
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DORAISE'
        ParamType = ptUnknown
      end>
  end
  object dsUserIsAdminTask: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_User_Is_AdminTask('
      '    :USER_ID,'
      '    :DORAISE);'
      'end;')
    SourceServerObject = 'FDC_USER_IS_ADMINTASK'
    Left = 575
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DORAISE'
        ParamType = ptUnknown
      end>
  end
  object dsUserIsSchemaOwner: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :Result ::= fdc_User_Is_Schema_Owner;'
      'end;')
    SourceServerObject = 'FDC_USER_IS_SCHEMA_OWNER'
    Left = 575
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Result'
        ParamType = ptUnknown
      end>
  end
  object dsEvent: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_Event_Lst'
      ' where ID = :ID'
      '')
    SourceServerObject = 'FDC_EVENT_LST'
    Left = 382
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsObjectGrantUpdate: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Object_Grant_Upd('
      '    :ID,'
      '    :Grantee_ID,'
      '    :AccessLevel,'
      '    :DoNotCheck, '
      '    :AdminNotGrant, '
      '    :NoReduction);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_GRANT_UPD'
    Left = 118
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Grantee_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AccessLevel'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DoNotCheck'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AdminNotGrant'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NoReduction'
        ParamType = ptUnknown
      end>
  end
  object dsObjectAccessLevelUpdate: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Object_Upd_Access_Level('
      '    :ID,'
      '    :AccessLevel);'
      'end;'
      '')
    SourceServerObject = 'FDC_OBJECT_UPD_ACCESS_LEVEL'
    Left = 118
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AccessLevel'
        ParamType = ptUnknown
      end>
  end
  object dsUserInGroupAdd: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_User_In_Group_Add('
      '    :USER_ID,'
      '    :USER_GROUP_ID,'
      '    :DORAISEDUPVAL);'
      'end;')
    SourceServerObject = 'FDC_USER_IN_GROUP_ADD'
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'USER_GROUP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DORAISEDUPVAL'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object dsUserInGroupDel: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_User_In_Group_Del('
      '    :USER_ID,'
      '    :USER_GROUP_ID);'
      'end;')
    SourceServerObject = 'FDC_USER_IN_GROUP_DEL'
    Left = 272
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'USER_GROUP_ID'
        ParamType = ptUnknown
      end>
  end
  object dsTaskSysComponentAdd: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Task_SysComponent_Add('
      '    :TASK_ID,'
      '    :SYSCOMPONENT_ID);'
      'end;')
    SourceServerObject = 'FDC_TASK_SYSCOMPONENT_ADD'
    Left = 272
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TASK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SYSCOMPONENT_ID'
        ParamType = ptUnknown
      end>
  end
  object dsTaskSysComponentDel: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Task_SysComponent_Del('
      '    :TASK_ID,'
      '    :SYSCOMPONENT_ID);'
      'end;'
      '')
    SourceServerObject = 'FDC_TASK_SYSCOMPONENT_DEL'
    Left = 272
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TASK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SYSCOMPONENT_ID'
        ParamType = ptUnknown
      end>
  end
  object dsUserGroupTaskAdd: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_User_Group_Task_Add('
      '    :USER_GROUP_ID,'
      '    :TASK_ID,'
      '    :DORAISEDUPVAL);'
      'end;')
    SourceServerObject = 'FDC_USER_GROUP_TASK_ADD'
    Left = 120
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'USER_GROUP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TASK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DORAISEDUPVAL'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object dsUserGroupTaskDel: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_User_Group_Task_Del('
      '    :USER_GROUP_ID,'
      '    :TASK_ID);'
      'end;')
    SourceServerObject = 'FDC_USER_GROUP_TASK_DEL'
    Left = 120
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'USER_GROUP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TASK_ID'
        ParamType = ptUnknown
      end>
  end
  object dsUserGrantForExec: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_User_Grant_Lst_For_Exec'
      ' where LOGIN = upper(:Login)')
    SourceServerObject = 'FDC_USER_GRANT_LST_FOR_EXEC'
    Left = 384
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'Login'
        ParamType = ptUnknown
      end>
    object dsUserGrantForExecOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 30
    end
    object dsUserGrantForExecOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Size = 18
    end
    object dsUserGrantForExecLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 1500
    end
    object dsUserGrantForExecALLOWGRANTOPTION: TIntegerField
      FieldName = 'ALLOWGRANTOPTION'
    end
    object dsUserGrantForExecGRANTED: TFloatField
      FieldName = 'GRANTED'
    end
    object dsUserGrantForExecTOGRANT: TFloatField
      FieldName = 'TOGRANT'
    end
    object dsUserGrantForExecCMD: TStringField
      FieldName = 'CMD'
      Size = 4000
    end
  end
  object dsReGrant: TfdcQuery
    Session = Session
    ReadOnly = False
    Left = 384
    Top = 136
  end
  object qryLobQuery: TOracleQuery
    SQL.Strings = (
      'select Body'
      '  from fdc_File'
      'where ID = :ID'
      '  for update')
    Session = Session
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    Left = 34
    Top = 119
  end
  object dsCollectionObjectAdd: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Collection_Object_Add('
      '    :COLLECTION_ID,'
      '    :OBJECT_ID,'
      '    :ROLENAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_COLLECTION_OBJECT_ADD'
    Left = 416
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COLLECTION_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ROLENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object dsCollectionObjectDel: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Collection_Object_Del(:ID);  '
      'end;'
      '')
    SourceServerObject = 'FDC_COLLECTION_OBJECT_DEL'
    Left = 416
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsCollectionMerge: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  fdc_Collection_Merge('
      '    :ID,'
      '    :SRC_ID,'
      '    :RoleName);'
      'end;')
    SourceServerObject = 'FDC_COLLECTION_MERGE'
    Left = 416
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SRC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RoleName'
        ParamType = ptUnknown
      end>
  end
  object dsConnectionsCheck: TfdcQuery
    Session = Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select fdc_connections_check result from dual')
    Left = 568
    Top = 24
    object dsConnectionsCheckRESULT: TFloatField
      FieldName = 'RESULT'
    end
  end
  object dsUserGrantRole: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_role.grant_role('
      '                    puser_login => :LOGIN'
      '                   ,prole_name  => :ROLE_NAME'
      '                   );'
      'end;')
    SourceServerObject = 'p_role.grant_role'
    Left = 568
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ROLE_NAME'
        ParamType = ptUnknown
      end>
  end
  object dsUserRevokeRole: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_role.revoke_role('
      '                    puser_login => :LOGIN'
      '                   ,prole_name  => :ROLE_NAME'
      '                   );'
      'end;')
    SourceServerObject = 'p_role.revoke_role'
    Left = 576
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ROLE_NAME'
        ParamType = ptUnknown
      end>
  end
  object pkgEVT: TOraclePackage
    Session = Session
    PackageName = 'p_evt'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Left = 40
    Top = 192
  end
  object QueryList1: TQueryList
    Session = Session
    Left = 472
    Top = 16
    object sqlGetIPAddress: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := SYS_CONTEXT('#39'USERENV'#39', '#39'IP_ADDRESS'#39');'
        'end;')
    end
    object sqlSetMacAddress: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_params.SetMACAddress(pMACAddress => :pMACAddress);'
        'end;')
    end
    object sqlGetUserLogin: TsqlOp
      SQL.Strings = (
        'begin'
        '  select login'
        '   into :Result'
        '  from fdc_user_current_lst;'
        'end;')
    end
    object sqlUserChangePassword: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  execute immediate '#39'alter user '#39' ||:pUser || '#39' identified by '#39' ' +
          '||:pPass;'
        'end;')
    end
    object sqlSetExpDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  OI_User_Exp_Date(pLogin => :pLogin);'
        'end;')
    end
    object sqlGetUserExpDate: TsqlOp
    end
  end
  object dsReport: TfdcQuery
    Session = Session
    ReadOnly = False
    Left = 48
    Top = 360
  end
end
