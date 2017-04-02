object RemDM: TRemDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 1453
  Top = 205
  Height = 519
  Width = 308
  object DataSetProvider: TDataSetProvider
    ResolveToDataSet = True
    Left = 144
    Top = 16
  end
  object OraDataSet: TOracleDataSet
    CommitOnPost = False
    Session = OracleSession
    Left = 40
    Top = 16
  end
  object mdOtvet: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 192
    object mdOtvetG_NDOK: TStringField
      DisplayWidth = 26
      FieldName = 'G_NDOK'
      Size = 26
    end
    object mdOtvetKEY: TStringField
      DisplayWidth = 3
      FieldName = 'KEY'
      Size = 3
    end
    object mdOtvetKODVAL: TStringField
      FieldName = 'KODVAL'
      Size = 3
    end
    object mdOtvetP_NDOK: TStringField
      FieldName = 'P_NDOK'
      Size = 19
    end
    object mdOtvetN_NDOK: TStringField
      FieldName = 'N_NDOK'
      Size = 23
    end
    object mdOtvetN_DDOK: TDateTimeField
      FieldName = 'N_DDOK'
    end
    object mdOtvetKBK: TStringField
      FieldName = 'KBK'
    end
    object mdOtvetADVANCE: TStringField
      FieldName = 'ADVANCE'
      Size = 1
    end
    object mdOtvetSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object mdOtvetSUMMA1: TFloatField
      FieldName = 'SUMMA1'
    end
    object mdOtvetID_NDOK: TStringField
      FieldName = 'ID_NDOK'
      Size = 4
    end
    object mdOtvetKEY_OWNER: TStringField
      FieldName = 'KEY_OWNER'
      Size = 4
    end
    object mdOtvetN_POST: TStringField
      FieldName = 'N_POST'
      Size = 8
    end
    object mdOtvetKINDVP: TStringField
      FieldName = 'KINDVP'
      Size = 30
    end
    object mdOtvetKEY_EX: TStringField
      FieldName = 'KEY_EX'
      Size = 40
    end
    object mdOtvetNTR: TStringField
      FieldName = 'NTR'
      Size = 26
    end
    object mdOtvetSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 40
    end
    object mdOtvetPROCESS_ID: TStringField
      FieldName = 'PROCESS_ID'
      Size = 36
    end
    object mdOtvetV_REASON: TStringField
      FieldName = 'V_REASON'
      Size = 2
    end
    object mdOtvetV_DOC_NUM: TStringField
      FieldName = 'V_DOC_NUM'
      Size = 15
    end
    object mdOtvetV_DOC_DATE: TDateTimeField
      FieldName = 'V_DOC_DATE'
    end
  end
  object OracleSession: TOracleSession
    DesignConnection = True
    LogonUsername = 'doxod_ls_5'
    ThreadSafe = True
    Preferences.MaxStringFieldSize = 255
    NullValue = nvNull
    Left = 40
    Top = 88
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
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000004000000080000003A504C4F41444944040000000000000000000000
      070000003A504F44415441740000000000000000000000050000003A504B4559
      0500000000000000000000000A0000003A504841534552524F52030000000000
      000000000000}
    Left = 152
    Top = 208
  end
  object QueryList1: TQueryList
    Session = OracleSession
    Left = 152
    Top = 144
    object sqlInsert: TsqlOp
    end
    object sqlBeginLoad: TsqlOp
      SQL.Strings = (
        'begin'
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
    object sqlNeedDK: TsqlOp
      SQL.Strings = (
        'begin'
        '  select count(*)'
        '    into :result'
        '    from dbf_otvet'
        '   where key in ('#39'A'#39','#39'X'#39') '
        '         and rownum <= 1;'
        'end; ')
    end
  end
  object qryR: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_armti_r('
      '      pLoadID => :pLoadID'
      '     ,podata  => :podata'
      '    );'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000008
      0000003A504C4F41444944040000000000000000000000}
    Left = 152
    Top = 256
  end
  object qryV: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_armti_v(pgtdlist => :pgtdlist,'
      '                     podata => :podata);'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000009
      0000003A504754444C495354050000000000000000000000}
    Left = 152
    Top = 304
  end
  object qryS: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_armti_s(pgtdlist => :pgtdlist,'
      '                     podata => :podata);'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000009
      0000003A504754444C495354050000000000000000000000}
    Left = 152
    Top = 360
  end
  object qryT: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_armti_t('
      '      pLoadID => :pLoadID'
      '     ,podata  => :podata'
      '    );'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000008
      0000003A504C4F41444944040000000000000000000000}
    Left = 216
    Top = 256
  end
  object mdDK_PP: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 248
    object mdDK_PPG071: TStringField
      FieldName = 'G071'
      Size = 8
    end
    object mdDK_PPG072: TDateTimeField
      FieldName = 'G072'
    end
    object mdDK_PPG073: TStringField
      FieldName = 'G073'
      Size = 7
    end
    object mdDK_PPOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object mdDK_PPINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object mdDK_PPKPP: TStringField
      FieldName = 'KPP'
      Size = 9
    end
    object mdDK_PPK92: TStringField
      FieldName = 'K92'
      Size = 50
    end
    object mdDK_PPK93: TDateTimeField
      FieldName = 'K93'
    end
    object mdDK_PPK94: TFloatField
      FieldName = 'K94'
    end
    object mdDK_PPK95: TFloatField
      FieldName = 'K95'
    end
    object mdDK_PPK96: TDateField
      FieldName = 'K96'
    end
    object mdDK_PPK_VAL: TStringField
      FieldName = 'K_VAL'
      Size = 3
    end
    object mdDK_PPPRIZ: TStringField
      FieldName = 'PRIZ'
      Size = 3
    end
    object mdDK_PPWHO: TStringField
      FieldName = 'WHO'
      Size = 1
    end
    object mdDK_PPSP: TStringField
      FieldName = 'SP'
      Size = 2
    end
    object mdDK_PPCRYPT: TStringField
      FieldName = 'CRYPT'
      Size = 10
    end
    object mdDK_PPCODE: TStringField
      FieldName = 'CODE'
    end
    object mdDK_PPBANK_ID: TStringField
      FieldName = 'BANK_ID'
    end
    object mdDK_PPVP: TStringField
      FieldName = 'VP'
      Size = 4
    end
    object mdDK_PPIRET: TIntegerField
      FieldName = 'IRET'
    end
    object mdDK_PPNBLKTC1: TStringField
      FieldName = 'NBLKTC1'
      Size = 8
    end
    object mdDK_PPTSP: TStringField
      FieldName = 'TSP'
      Size = 8
    end
    object mdDK_PPDSP: TDateTimeField
      FieldName = 'DSP'
    end
    object mdDK_PPN_SV: TStringField
      FieldName = 'N_SV'
      Size = 14
    end
    object mdDK_PPD_SV: TDateTimeField
      FieldName = 'D_SV'
    end
    object mdDK_PPN_CNTR: TStringField
      FieldName = 'N_CNTR'
      Size = 50
    end
    object mdDK_PPD_CNTR: TDateTimeField
      FieldName = 'D_CNTR'
    end
    object mdDK_PPNTR: TStringField
      FieldName = 'NTR'
      Size = 26
    end
    object mdDK_PPPROCESS_ID: TStringField
      FieldName = 'PROCESS_ID'
      Size = 36
    end
    object mdDK_PPLNPINSP: TStringField
      FieldName = 'LNPINSP'
      Size = 4
    end
  end
  object DataSetProviderDK: TDataSetProvider
    DataSet = mdDK_PP
    ResolveToDataSet = True
    Left = 144
    Top = 72
  end
  object qryDK: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_armti_dk('
      '      pGtdName => :pGtdName'
      '     ,podata  => :podata'
      '    );'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000002000000070000003A504F4441544174000000000000000000000009
      0000003A504754444E414D45050000000000000000000000}
    Left = 216
    Top = 144
  end
end
