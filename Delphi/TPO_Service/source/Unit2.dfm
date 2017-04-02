object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 507
  Top = 223
  Height = 321
  Width = 384
  object Session: TOracleSession
    LogonUsername = 'doxod_ls_20142t'
    LogonPassword = 'w'
    LogonDatabase = 'LS'
    ThreadSafe = True
    Left = 48
    Top = 8
  end
  object dsPO: TOracleDataSet
    SQL.Strings = (
      'select'
      '  po.id'
      '  ,nvl(po.Summa, po.doc_summa) summa'
      '  ,po.doc_summa'
      '  ,po.Curr_Code'
      '  ,po.Payer_Inn'
      '  ,po.Payer_Kpp'
      '  ,po.doc_number AS Doc_No'
      '  ,po.Doc_Date'
      '  ,s.sysname state_Sysname'
      '  ,r.kbk '
      '  ,r.reg_sum Rest_Summa'
      
        '  ,nvl((select sum(re.summa) from fdc_reserved_payment_lst re wh' +
        'ere re.payment_id = po.ID and re.KBKCode = r.kbk AND re.edate IS' +
        ' NULL),0) Locked_Summa'
      '  ,po.TYPESYSNAME'
      
        '  ,p_nsi_kbk.GetPrePaymentKbkIs(p_nsi_kbk.GetIdByCode(r.kbk)) as' +
        ' advance'
      'from'
      '  fdc_po_credit_lst  po'
      '  ,fdc_state_lst s'
      '  ,fdc_rest_reg r'
      'where'
      '      po.payer_inn = :INN'
      '  and s.id = po.state_id'
      '  and r.payment_id = po.ID'
      '  and po.TYPESYSNAME <> '#39'PaymentOrderNonID'#39
      '  AND r.reg_sum  > 0')
    Variables.Data = {0300000001000000040000003A494E4E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000002000000494401000000000006000000444F435F4E4F0100
      0000000008000000444F435F444154450100000000000500000053554D4D4101
      00000000000900000050415945525F494E4E0100000000000900000050415945
      525F4B505001000000000009000000435552525F434F44450100000000000A00
      0000524553545F53554D4D410100000000000C0000004C4F434B45445F53554D
      4D410100000000000D00000053544154455F5359534E414D4501000000000009
      000000444F435F53554D4D41010000000000030000004B424B0100000000000B
      000000545950455359534E414D4501000000000007000000414456414E434501
      0000000000}
    Session = Session
    Left = 104
    Top = 8
    object dsPOID: TFloatField
      FieldName = 'ID'
    end
    object dsPOREST_SUMMA: TFloatField
      FieldName = 'REST_SUMMA'
    end
    object dsPOLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
    end
    object dsPOSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsPOCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsPOPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsPOPAYER_KPP: TStringField
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsPODOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 50
    end
    object dsPODOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsPOSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
    object dsPODOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
    end
    object dsPOKBK: TStringField
      FieldName = 'KBK'
      Required = True
    end
    object dsPOTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Required = True
      Size = 1500
    end
    object dsPOADVANCE: TStringField
      FieldName = 'ADVANCE'
      Size = 4000
    end
  end
  object dsTPO_PLT: TVKDBFNTX
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
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
    Left = 176
    Top = 72
    object dsTPO_PLTNUM_TPO: TStringField
      Tag = 127768464
      FieldName = 'NUM_TPO'
      Size = 10
    end
    object dsTPO_PLTSP: TStringField
      Tag = 127672504
      FieldName = 'SP'
      Size = 2
    end
    object dsTPO_PLTINN: TStringField
      Tag = 127645036
      FieldName = 'INN'
      Size = 12
    end
    object dsTPO_PLTKPP: TStringField
      Tag = 127645280
      FieldName = 'KPP'
      Size = 9
    end
    object dsTPO_PLTNUM_DOC: TStringField
      Tag = 127645532
      FieldName = 'NUM_DOC'
      Size = 8
    end
    object dsTPO_PLTDATE_DOC: TDateField
      Tag = 127645756
      FieldName = 'DATE_DOC'
    end
    object dsTPO_PLTSUMMA: TFloatField
      Tag = 127646048
      FieldName = 'SUMMA'
    end
    object dsTPO_PLTKODVAL: TStringField
      Tag = 127646316
      FieldName = 'KODVAL'
      Size = 3
    end
    object dsTPO_PLTSUM_TPO: TFloatField
      Tag = 127646700
      FieldName = 'SUM_TPO'
    end
    object dsTPO_PLTVIDNAC: TStringField
      Tag = 127647056
      FieldName = 'VIDNAC'
      Size = 2
    end
    object dsTPO_PLTSCHR: TStringField
      Tag = 127647452
      FieldName = 'SCHR'
    end
    object dsTPO_PLTBIC: TStringField
      Tag = 127655104
      FieldName = 'BIC'
      Size = 9
    end
  end
  object srcTPO_PLT: TDataSource
    DataSet = dsTPO_PLT
    Left = 240
    Top = 16
  end
  object dsNewDecl: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'select tpo_number id, tpo_number as tpo_name from'
      'dbf_tpo t where t.LOAD_ID = :LOAD_ID'
      '')
    Left = 104
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'LOAD_ID'
        ParamType = ptUnknown
      end>
  end
  object QueryList: TQueryList
    Session = Session
    Left = 32
    Top = 152
    object sqlLoadDecl: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_tpo_loader.loadTPO(TPONum => :id);'
        '     :ErrText := '#39#39';'
        'exception'
        '   when others then'
        '     :ErrText := sqlerrm;'
        'end;')
      DataSet = dsNewDecl
    end
    object sqlBeginLoad: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_loader.beginload;'
        'end;')
    end
    object sqlEndLoad: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_loader.endload(ploadlog => :ploadlog);'
        'end;')
    end
    object sqlGetErrors: TsqlOp
      SQL.Strings = (
        'select name'
        '  from fdc_custom_decl_error_lst t'
        '  where t.owner_object_id =  :ID')
    end
    object sqlGetDBFErrors: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_loader.GetError(:nError);'
        'end;')
    end
    object sqlGetDBFErrorCount: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_loader.GetErrorArrayCount();'
        'end;')
    end
    object sqlSetMethod: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_tpo_loader.SetLoadMethod(aMethod => 0);'
        'end;')
    end
    object sqlGetSubject: TsqlOp
      SQL.Strings = (
        'begin'
        '  :SubjId := p_nsi_subject.FindSubject(pINN => :Inn'
        '                                      ,pKPP => :Kpp);'
        '  if :SubjId is null'
        '  then'
        '    :SubjId := 0;'
        '  end if;'
        ''
        'end;')
    end
    object sqlAlterSession: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  execute immediate '#39'ALTER SESSION SET current_schema = '#39' || :sc' +
          'hema_name;'
        'end;')
    end
    object sqlClearBuffer: TsqlOp
      SQL.Strings = (
        'begin'
        'delete from dbf_tpo dh'
        'where not exists (select 1 from fdc_tpo_lst cd '
        '                  where cd.decl_no = dh.tpo_number'
        '                  union all'
        '                  select 1 from fdc_tr_lst cd '
        '                  where cd.decl_no = dh.tpo_number'
        '                  )'
        'and dh.tpo_number = :tpo_number;'
        'end;')
    end
  end
  object QueryListTR: TQueryList
    Left = 32
    Top = 224
    object sqlLoadDeclTR: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        
          '     :result := p_tpo_loader.loadTPO(TPONum => :id, pObjectType ' +
          '=> '#39'TR'#39');'
        '     :errtext := '#39#39';'
        'exception'
        '   when others then'
        '     :errtext := sqlerrm;'
        'end;')
    end
  end
  object QueryListTPO: TQueryList
    Left = 104
    Top = 224
    object sqlLoadDeclTPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_tpo_loader.loadTPO(TPONum => :id);'
        '     :ErrText := '#39#39';'
        'exception'
        '   when others then'
        '     :ErrText := sqlerrm;'
        'end;')
    end
  end
  object dsOtvetErrors: TOracleDataSet
    SQL.Strings = (
      'select * from fdc_tpo_otvet_error_lst')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A00000054504F5F4E554D42455201000000000008000000
      49534C4F41444544010000000000090000004552524F52434F44450100000000
      00090000004552524F5254455854010000000000}
    Session = Session
    Left = 248
    Top = 152
  end
  object qryR: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_armti_r_tpo(psubjlist => :psubjlist,'
      '                podata => :podata);'
      'end;')
    Session = Session
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F444154417400000000000000000000000A
      0000003A505355424A4C495354050000000000000000000000}
    Left = 176
    Top = 224
  end
  object qryLoadFile: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :result := fdc_load_dbf(pfile => :file,'
      '               ptablename => :tablename,'
      '               pcolmap  => :colmap);'
      '  :v1 := p_loader.GetTotal;'
      '  :v2 := p_loader.GetProgress;'
      '  :v3 := p_loader.GetErrorCount;'
      '  :v4 := p_loader.GetNewCount;'
      '  :v5 := p_loader.GetModifyCount;'
      '  :v6 := p_loader.GetSkipCount;'
      'end;')
    Session = Session
    Variables.Data = {
      030000000A000000050000003A46494C457100000000000000000000000A0000
      003A5441424C454E414D45050000000000000000000000070000003A52455355
      4C54040000000000000000000000070000003A434F4C4D415005000000000000
      0000000000030000003A5631030000000000000000000000030000003A563203
      0000000000000000000000030000003A56330300000000000000000000000300
      00003A5634030000000000000000000000030000003A56350300000000000000
      00000000030000003A5636030000000000000000000000}
    Left = 176
    Top = 152
  end
  object OracleLogon1: TOracleLogon
    Session = Session
    Options = [ldDatabase]
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
    Left = 312
    Top = 16
  end
  object dsOtvet: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = True
    LookupOptions = []
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
    Left = 112
    Top = 72
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
        Name = 'KEY'
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
      end>
  end
  object dsOtvetE: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = True
    LookupOptions = []
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
    Left = 48
    Top = 72
    DBFFieldDefs = <
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'TPO_NUMBER'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 10
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ISLOADED'
        field_type = 'N'
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
        Name = 'ERRORCODE'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 10
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT1'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT2'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT3'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT4'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end>
    object dsOtvetETPO_NUMBER: TStringField
      Tag = 160810792
      FieldName = 'TPO_NUMBER'
      Size = 10
    end
    object dsOtvetEISLOADED: TIntegerField
      Tag = 24526792
      FieldName = 'ISLOADED'
    end
    object dsOtvetEERRORCODE: TLargeintField
      Tag = 60870612
      FieldName = 'ERRORCODE'
    end
    object dsOtvetEERRORTEXT1: TStringField
      Tag = 164334736
      FieldName = 'ERRORTEXT1'
      Size = 250
    end
    object dsOtvetEERRORTEXT2: TStringField
      Tag = 164334864
      FieldName = 'ERRORTEXT2'
      Size = 250
    end
    object dsOtvetEERRORTEXT3: TStringField
      Tag = 61140640
      FieldName = 'ERRORTEXT3'
      Size = 250
    end
    object dsOtvetEERRORTEXT4: TStringField
      Tag = 61141016
      FieldName = 'ERRORTEXT4'
      Size = 250
    end
  end
  object dsTpo: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = True
    LookupOptions = []
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
    Left = 232
    Top = 72
    DBFFieldDefs = <
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'TPO_NUMBER'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 10
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ISLOADED'
        field_type = 'N'
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
        Name = 'ERRORCODE'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 10
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT1'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT2'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT3'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ERRORTEXT4'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 250
        dec = 0
        Tag = 0
      end>
  end
end
