inherited ActCorrectOperBalansTranForm: TActCorrectOperBalansTranForm
  Left = 581
  Top = 359
  Width = 512
  Height = 520
  Caption = 'ActCorrectOperBalansTranForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 496
    Height = 482
    ClientRectBottom = 458
    ClientRectRight = 496
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 490
        Height = 427
        inherited edtName: TcxDBTextEdit
          Enabled = False
          Width = 372
        end
        inherited edtDescript: TcxDBMemo
          Top = 394
          TabOrder = 11
          Height = 20
          Width = 372
        end
        object edtSubject: TfdcObjectLinkEdit [2]
          Left = 171
          Top = 246
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Subject;Bank;Customs'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 6
          Width = 783
        end
        object editAccount: TcxDBLookupComboBox [3]
          Left = 171
          Top = 192
          DataBinding.DataField = 'ACCOUNT_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1085#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
              MinWidth = 60
              Width = 80
              FieldName = 'CODE'
            end
            item
              Caption = #1055#1088#1080#1079#1085#1072#1082' '#1091#1088#1086#1074#1085#1103' '#1089#1095#1105#1090#1072
              MinWidth = 40
              Width = 80
              FieldName = 'TO_LEVEL_SIGN'
            end>
          Properties.ListSource = srcAccount
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 145
        end
        object editKBK: TcxDBLookupComboBox [4]
          Left = 171
          Top = 219
          DataBinding.DataField = 'KBK_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1050#1041#1050
              MinWidth = 60
              Width = 80
              FieldName = 'KBK'
            end
            item
              Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
              MinWidth = 40
              Width = 80
              FieldName = 'TYPEPAYMENT'
            end
            item
              Caption = #1053#1072#1095#1072#1083#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
              MinWidth = 40
              FieldName = 'SDATE'
            end
            item
              Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
              MinWidth = 40
              FieldName = 'EDATE'
            end>
          Properties.ListSource = srcKBK
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 376
        end
        object edtSumma: TcxDBCurrencyEdit [5]
          Left = 171
          Top = 273
          Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          DataBinding.DataField = 'OPERATION_SUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          ParentShowHint = False
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.EditFormat = ',0.00;-,0.00'
          Properties.ReadOnly = False
          Properties.UseThousandSeparator = True
          Properties.OnChange = Modify
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 316
        end
        object edtActivationDate: TcxDBDateEdit [6]
          Left = 171
          Top = 354
          DataBinding.DataField = 'ACTIVATION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 443
        end
        object editDoc_typename: TcxDBTextEdit [7]
          Left = 171
          Top = 94
          DataBinding.DataField = 'DOC_TYPENAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 401
        end
        object editDocNumber: TfdcObjectLinkEdit [8]
          Left = 171
          Top = 67
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DOC_ID'
          DataBinding.TypeSysName = 'Document'
          DataBinding.SearchFormClass = 'TDocumentGridFindForActForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          OnAfterAcceptObject = editDocNumberAfterAcceptObject
          Width = 348
        end
        object editDocDate: TcxDBTextEdit [9]
          Left = 171
          Top = 121
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 348
        end
        object editDocSubject: TcxDBTextEdit [10]
          Left = 10000
          Top = 10000
          DataBinding.DataField = 'DOC_SUBJECT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Visible = False
          Width = 348
        end
        object editDocSumma: TcxDBTextEdit [11]
          Left = 10000
          Top = 10000
          DataBinding.DataField = 'DOC_SUMM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 13
          Visible = False
          Width = 348
        end
        object editIsts: TcxDBCheckBox [12]
          Left = 171
          Top = 327
          DataBinding.DataField = 'IS_TS'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 121
        end
        object editIsdebit: TcxDBComboBox [13]
          Left = 171
          Top = 300
          DataBinding.DataField = 'IS_DEBIT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1041
            #1042)
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Enabled = False
            Visible = False
          end
          object lcgDocument: TdxLayoutGroup [1]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            object lcieditDocNumber: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088
              Control = editDocNumber
              ControlOptions.ShowBorder = False
            end
            object lciDoc_typename: TdxLayoutItem
              Tag = 33
              Caption = #1058#1080#1087
              Control = editDoc_typename
              ControlOptions.ShowBorder = False
            end
            object lcieditDocDate: TdxLayoutItem
              Tag = 33
              Caption = #1044#1072#1090#1072
              Control = editDocDate
              ControlOptions.ShowBorder = False
            end
          end
          object lcgTrans: TdxLayoutGroup [2]
            Caption = #1055#1088#1086#1074#1086#1076#1082#1072
            object lcieditAccount: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' *'
              Control = editAccount
              ControlOptions.ShowBorder = False
            end
            object lcieditKBK: TdxLayoutItem
              Caption = #1050#1041#1050
              Control = editKBK
              ControlOptions.ShowBorder = False
            end
            object lcieditSubject: TdxLayoutItem
              Caption = #1059#1095'. '#1042#1069#1044
              Control = edtSubject
              ControlOptions.ShowBorder = False
            end
            object lcieditSumma: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072' *'
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lcieditIsdebit: TdxLayoutItem
              Caption = #1050#1086#1076' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1087#1086' '#1089#1095#1077#1090#1091' *'
              Control = editIsdebit
              ControlOptions.ShowBorder = False
            end
            object lcieditIsts: TdxLayoutItem
              Tag = 33
              Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1057#1086#1102#1079#1072
              Control = editIsts
              ControlOptions.ShowBorder = False
            end
            object lciedtActivationDate: TdxLayoutItem
              Tag = 33
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080' *'
              Control = edtActivationDate
              ControlOptions.ShowBorder = False
            end
          end
        end
        object lcieditDocSumma: TdxLayoutItem
          Tag = 23
          Caption = #1057#1091#1084#1084#1072
          Control = editDocSumma
          ControlOptions.ShowBorder = False
        end
        object lcieditDocSubject: TdxLayoutItem
          Tag = 23
          Caption = #1059#1095'. '#1042#1069#1044
          Control = editDocSubject
          ControlOptions.ShowBorder = False
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 496
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 427
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 455
        Width = 496
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 493
        Height = 427
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 496
        Height = 458
        ClientRectBottom = 434
        ClientRectRight = 496
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 103
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_actcorrectob_tran_lst'
      'where ID = :ID')
    BeforeClose = dsDataBeforeClose
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataACT_ID: TFloatField
      FieldName = 'ACT_ID'
    end
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataKBK_ID: TFloatField
      FieldName = 'KBK_ID'
    end
    object dsDataPAYMENT_TYPE_ID: TFloatField
      FieldName = 'PAYMENT_TYPE_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
    end
    object dsDataIS_DEBIT: TStringField
      FieldName = 'IS_DEBIT'
      Size = 1
    end
    object dsDataOPERATION_SUM: TFloatField
      FieldName = 'OPERATION_SUM'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataACCOUNT_CODE: TStringField
      FieldName = 'ACCOUNT_CODE'
      Size = 1500
    end
    object dsDataKBK_CODE: TStringField
      FieldName = 'KBK_CODE'
      Size = 1500
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_TYPESYSNAME: TStringField
      FieldName = 'DOC_TYPESYSNAME'
      Size = 1500
    end
    object dsDataDOC_TYPENAME: TStringField
      FieldName = 'DOC_TYPENAME'
      Size = 1500
    end
    object dsDataDOC_SUBJECT: TStringField
      FieldName = 'DOC_SUBJECT'
      Size = 1500
    end
    object dsDataDOC_SUMM: TFloatField
      FieldName = 'DOC_SUMM'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_actcorrectoperbalans_tran.add'
      '    ('
      '       pdescript       => :descript'
      '      ,pactid            => :act_id'
      '      ,pdocid           => :doc_id'
      '      ,paccountid    => :account_id'
      '      ,psubjectid      => :subject_id'
      '      ,pkbk_id         => :kbk_id'
      
        '      ,pisdebit          => (case :is_debit when '#39#1041#39' then '#39'Y'#39' wh' +
        'en '#39#1042#39' then '#39'N'#39' else null end)'
      '      ,poperationsum   => :operation_sum'
      '      ,pists               => nvl(:is_ts,'#39'N'#39')'
      '    );'
      'end;')
    BeforeOpen = dsInsertBeforeOpen
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'act_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'doc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'account_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'kbk_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_debit'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'operation_sum'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_actcorrectoperbalans_tran.modify'
      '    ('
      '       pid             => :id'
      '      ,pdescript       => :descript'
      '      ,pdocid          => :doc_id'
      '      ,paccountid      => :account_id'
      '      ,psubjectid      => :subject_id'
      '      ,pkbk_id         => :kbk_id'
      
        '      ,pisdebit        => (case :is_debit when '#39#1041#39' then '#39'Y'#39' when' +
        ' '#39#1042#39' then '#39'N'#39' else null end)'
      '      ,poperationsum   => :operation_sum'
      '      ,pists           => nvl(:is_ts,'#39'N'#39')'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'doc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'account_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'kbk_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_debit'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'operation_sum'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end>
  end
  object dsAccount: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select id, code, to_level_sign'
      'from fdc_acc_light_lst'
      'where ('
      '       (nvl(edate,trunc(sysdate)) >= trunc(sysdate))'
      '       and'
      '       to_level_sign = (case '
      '                          when (:balanstype in (0,2)) then '#39#1058#39
      
        '                          when (:balanstype in (1)) then (case p' +
        '_params.customlevel '
      
        '                                                            when' +
        ' p_consts.customlevel_fts then '#39#1060#39
      
        '                                                            when' +
        ' p_consts.customlevel_rtu then '#39#1056#39
      
        '                                                            else' +
        ' '#39#39
      '                                                          end)'
      '                          else '#39#39' '
      '                        end) '
      '      )'
      '  or id = :accountid')
    SourceServerObject = 'FDC_OBJECT_LST'
    BeforeOpen = dsAccountBeforeOpen
    Left = 172
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'balanstype'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'balanstype'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'accountid'
        ParamType = ptUnknown
      end>
    object dsAccountID: TFloatField
      FieldName = 'ID'
    end
    object dsAccountCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsAccountTO_LEVEL_SIGN: TStringField
      FieldName = 'TO_LEVEL_SIGN'
      Size = 1
    end
  end
  object srcAccount: TDataSource
    DataSet = dsAccount
    Left = 116
    Top = 235
  end
  object dsKBK: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select id'
      '      ,code as kbk'
      '      ,code2 as typepayment'
      '      ,sdate'
      '      ,edate'
      'from fdc_kbk_dict_lst'
      'order by code, code2')
    SourceServerObject = 'FDC_OBJECT_LST'
    BeforeOpen = dsKBKBeforeOpen
    Left = 324
    Top = 223
    object dsKBKID: TFloatField
      FieldName = 'ID'
    end
    object dsKBKKBK: TStringField
      FieldName = 'KBK'
      Size = 1500
    end
    object dsKBKTYPEPAYMENT: TStringField
      FieldName = 'TYPEPAYMENT'
      Size = 1500
    end
    object dsKBKSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object dsKBKEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcKBK: TDataSource
    DataSet = dsKBK
    Left = 276
    Top = 227
  end
  object dsDocument: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select id'
      '         ,name'
      '         ,typesysname'
      '         ,typename'
      '         ,doc_number'
      '         ,doc_date'
      'from fdc_document_lst'
      'where id = :docid')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 52
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'docid'
        ParamType = ptUnknown
      end>
    object dsDocumentID: TFloatField
      FieldName = 'ID'
    end
    object dsDocumentNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDocumentTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDocumentTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDocumentDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDocumentDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
  end
end
