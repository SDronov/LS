object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 527
  Top = 244
  Height = 329
  Width = 347
  object OracleSession1: TOracleSession
    OnChange = OracleSession1Change
    BeforeLogOn = OracleSession1BeforeLogOn
    DesignConnection = True
    LogonUsername = 'doxod_ls_5'
    ThreadSafe = True
    NullValue = nvNull
    Left = 56
    Top = 16
  end
  object OracleQuery1: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      ' if  :pkey <> '#39'O'#39' then'
      ' fdc_armti_e(ploadid => :ploadid,'
      '              podata => :podata,'
      '              pkey   => :pkey,'
      '              pHasError => :pHasError);'
      ' else'
      ' fdc_armti_o(ploadid => :ploadid,'
      '              podata => :podata,'
      '              pkey   => :pkey,'
      '              pHasError => :pHasError);'
      ' end if;'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Variables.Data = {
      0300000004000000080000003A504C4F41444944040000000000000000000000
      070000003A504F44415441740000000000000000000000050000003A504B4559
      0500000000000000000000000A0000003A504841534552524F52030000000000
      000000000000}
    Left = 136
    Top = 16
  end
  object QueryList1: TQueryList
    Session = OracleSession1
    Left = 208
    Top = 16
    object sqlInsert: TsqlOp
    end
    object sqlBeginLoad: TsqlOp
      SQL.Strings = (
        'begin'
        '  delete from dbf_dclhead where load_id=1550178;'
        '  -- Call the function'
        '  :result := p_loader.beginload;'
        'end;')
    end
    object sqlDelRowCharge: TsqlOp
      SQL.Strings = (
        'begin'
        'delete dbf_dclplatv where id = '
        'end;')
    end
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldDatabase]
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
    Left = 72
    Top = 96
  end
  object dsOtvet: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = True
    LookupOptions = []
    BeforeOpen = dsOtvetBeforeOpen
    AfterClose = dsOtvetAfterClose
    TrimInLocate = False
    TrimCType = True
    StorageType = pstFile
    AccessMode.AccessMode = 18
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = True
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 144
    Top = 88
    DBFFieldDefs = <
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'G_NDOK'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 26
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KEY'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 3
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KODVAL'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 3
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'P_NDOK'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 19
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'N_NDOK'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 23
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'N_DDOK'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KBK'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 20
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ADVANCE'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 1
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'SUMMA'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 17
        dec = 2
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'SUMMA1'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 17
        dec = 2
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ID_NDOK'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 4
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KEY_OWNER'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 4
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'N_POST'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KINDVP'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 30
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KEY_EX'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 40
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'NTR'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 26
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'STATUS'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 40
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'PROCESS_ID'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 36
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'V_REASON'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 2
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'V_DOC_NUM'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 15
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'V_DOC_DATE'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end>
  end
  object qryR: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_armti_r('
      '      pLoadID => :pLoadID'
      '     ,podata  => :podata'
      '    );'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000008
      0000003A504C4F41444944040000000000000000000000}
    Left = 232
    Top = 96
  end
  object qryV: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_armti_v(pgtdlist => :pgtdlist,'
      '                     podata => :podata);'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000009
      0000003A504754444C495354050000000000000000000000}
    Left = 232
    Top = 144
  end
  object qryTest: TOracleQuery
    SQL.Strings = (
      'declare '
      '  i integer;'
      'begin'
      ' select 1 into i from dual;'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Left = 72
    Top = 152
  end
  object qryS: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_armti_s(pgtdlist => :pgtdlist,'
      '                     podata => :podata);'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000009
      0000003A504754444C495354050000000000000000000000}
    Left = 232
    Top = 200
  end
  object qryT: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_armti_t('
      '      pLoadID => :pLoadID'
      '     ,podata  => :podata'
      '    );'
      'end;')
    Session = OracleSession1
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000008
      0000003A504C4F41444944040000000000000000000000}
    Left = 288
    Top = 96
  end
end
