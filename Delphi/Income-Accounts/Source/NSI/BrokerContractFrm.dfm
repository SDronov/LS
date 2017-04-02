inherited BrokerContractForm: TBrokerContractForm
  Left = 403
  Top = 255
  Width = 781
  Height = 604
  Caption = #1044#1086#1075#1086#1074#1086#1088' '#1084#1077#1078#1076#1091' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1077#1084' '#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1084' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 765
    Height = 566
    ClientRectBottom = 542
    ClientRectRight = 765
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 759
        Height = 511
        inherited edtName: TcxDBTextEdit
          Top = 384
          TabOrder = 13
        end
        inherited edtDescript: TcxDBMemo
          Top = 411
          TabOrder = 14
          Height = 91
        end
        object edtBrokerINN: TcxDBMaskEdit [2]
          Left = 96
          Top = 40
          DataBinding.DataField = 'BROKER_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.EditMask = '999999999999;0; '
          Properties.MaxLength = 0
          Properties.OnEditValueChanged = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          OnKeyPress = edtBrokerINNKeyPress
          Width = 197
        end
        object edtBrokerKPP: TcxDBMaskEdit [3]
          Left = 522
          Top = 40
          DataBinding.DataField = 'BROKER_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.EditMask = '999999999;0; '
          Properties.MaxLength = 0
          Properties.OnEditValueChanged = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          OnKeyPress = edtBrokerINNKeyPress
          Width = 216
        end
        object edtBrokerName: TfdcObjectLinkEdit [4]
          Left = 96
          Top = 67
          DataBinding.DataField = 'BROKER_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BROKER_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Subject'
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
          TabOrder = 2
          OnBeforeAcceptObject = edtBrokerNameBeforeAcceptObject
          Width = 121
        end
        object edtSubjectINN: TcxDBMaskEdit [5]
          Left = 96
          Top = 138
          DataBinding.DataField = 'SUBJECT_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.EditMask = '999999999999;0; '
          Properties.MaxLength = 0
          Properties.OnEditValueChanged = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          OnKeyPress = edtBrokerINNKeyPress
          Width = 375
        end
        object edtSubjectKPP: TcxDBMaskEdit [6]
          Left = 522
          Top = 138
          DataBinding.DataField = 'SUBJECT_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.EditMask = '999999999;0; '
          Properties.MaxLength = 0
          Properties.OnEditValueChanged = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          OnKeyPress = edtBrokerINNKeyPress
          Width = 216
        end
        object edtSubjectName: TfdcObjectLinkEdit [7]
          Left = 96
          Top = 165
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person'
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
          TabOrder = 5
          OnBeforeAcceptObject = edtSubjectNameBeforeAcceptObject
          Width = 620
        end
        object edtSubjectType: TcxDBTextEdit [8]
          Left = 96
          Top = 192
          DataBinding.DataField = 'SUBJECT_TYPENAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clInactiveCaption
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 121
        end
        object edtContractNo: TcxDBTextEdit [9]
          Left = 96
          Top = 290
          DataBinding.DataField = 'CONTRACT_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        object edtContractDate: TcxDBDateEdit [10]
          Left = 575
          Top = 290
          DataBinding.DataField = 'CONTRACT_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 163
        end
        object edtBeginDate: TcxDBDateEdit [11]
          Left = 96
          Top = 317
          DataBinding.DataField = 'BEGIN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 145
        end
        object edtEndDate: TcxDBDateEdit [12]
          Left = 332
          Top = 317
          DataBinding.DataField = 'END_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 141
        end
        object edtIsAuthorize: TcxDBCheckBox [13]
          Left = 21
          Top = 344
          Caption = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1086#1087#1083#1072#1090#1099
          DataBinding.DataField = 'IS_AUTHORIZE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 12
          Width = 121
        end
        object edtSubjectDoc: TcxDBTextEdit [14]
          Left = 96
          Top = 219
          DataBinding.DataField = 'SUBJECT_DOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clInactiveCaption
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcgBroker: TdxLayoutGroup [0]
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciBrokerINN: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtBrokerINN
                ControlOptions.ShowBorder = False
              end
              object lciBrokerKPP: TdxLayoutItem
                Caption = #1050#1055#1055
                Control = edtBrokerKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciBrokerName: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtBrokerName
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSubject: TdxLayoutGroup [1]
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciSubjectINN: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtSubjectINN
                ControlOptions.ShowBorder = False
              end
              object lciSubjectKPP: TdxLayoutItem
                Caption = #1050#1055#1055
                Control = edtSubjectKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciSubjectName: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSubjectName
              ControlOptions.ShowBorder = False
            end
            object lciSybjectType: TdxLayoutItem
              Caption = #1058#1080#1087
              Control = edtSubjectType
              ControlOptions.ShowBorder = False
            end
            object lciSubjectDoc: TdxLayoutItem
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              Control = edtSubjectDoc
              ControlOptions.ShowBorder = False
            end
          end
          object lcgContract: TdxLayoutGroup [2]
            Caption = #1044#1086#1075#1086#1074#1086#1088
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciContractNo: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
                Control = edtContractNo
                ControlOptions.ShowBorder = False
              end
              object lciContractDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
                Control = edtContractDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup4: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciBeginDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
                Control = edtBeginDate
                ControlOptions.ShowBorder = False
              end
              object lciEndDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
                Control = edtEndDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem1: TdxLayoutItem
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = edtIsAuthorize
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 765
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 511
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 539
        Width = 765
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 762
        Height = 511
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 765
        Height = 542
        ClientRectBottom = 518
        ClientRectRight = 765
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
      'SELECT *'
      '  FROM fdc_Broker_Contract_Lst'
      ' WHERE ID = :ID')
    SourceServerObject = 'FDC_BROKER_CONTRACT_LST'
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
    object dsDataBROKER_ID: TFloatField
      DisplayLabel = #1041#1088#1086#1082#1077#1088
      FieldName = 'BROKER_ID'
      Required = True
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataCONTRACT_NO: TStringField
      DisplayLabel = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'CONTRACT_NO'
      Required = True
      Size = 150
    end
    object dsDataCONTRACT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'CONTRACT_DATE'
      Required = True
    end
    object dsDataBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object dsDataEND_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'END_DATE'
      Required = True
    end
    object dsDataIS_AUTHORIZE: TStringField
      DefaultExpression = 'Y'
      DisplayLabel = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1086#1087#1083#1072#1090#1099
      FieldName = 'IS_AUTHORIZE'
      Size = 1
    end
    object dsDataBROKER_NAME: TStringField
      DisplayLabel = #1041#1088#1086#1082#1077#1088
      FieldName = 'BROKER_NAME'
      Required = True
      Size = 4000
    end
    object dsDataBROKER_INN: TStringField
      FieldName = 'BROKER_INN'
      Size = 12
    end
    object dsDataBROKER_KPP: TStringField
      FieldName = 'BROKER_KPP'
      Size = 10
    end
    object dsDataSUBJECT_TYPENAME: TStringField
      FieldName = 'SUBJECT_TYPENAME'
      Size = 1500
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'SUBJECT_NAME'
      Required = True
      Size = 4000
    end
    object dsDataSUBJECT_INN: TStringField
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object dsDataSUBJECT_DOC: TStringField
      FieldName = 'SUBJECT_DOC'
      Size = 61
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= p_broker_contract.add('
      '      pBrokerID     => :broker_id'
      '     ,pSubjectID    => :subject_id'
      '     ,pContractNo   => :contract_no'
      '     ,pContractDate => :contract_date'
      '     ,pBeginDate    => :begin_date'
      '     ,pEndDate      => :end_date'
      '     ,pIsAuthorize  => :is_authorize'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'broker_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contract_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contract_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_authorize'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  p_broker_contract.modify('
      '      pID           => :id'
      '     ,pBrokerID     => :broker_id'
      '     ,pSubjectID    => :subject_id'
      '     ,pContractNo   => :contract_no'
      '     ,pContractDate => :contract_date'
      '     ,pBeginDate    => :begin_date'
      '     ,pEndDate      => :end_date'
      '     ,pIsAuthorize  => :is_authorize'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'broker_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contract_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contract_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_authorize'
        ParamType = ptUnknown
      end>
  end
  object qryGetSubjectDoc: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  SELECT p.ser_no || '#39' '#39' || p.doc_no'
      '    INTO :res'
      '    FROM fdc_person_lst p'
      '    WHERE p.id = :id;'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000002000000040000003A52455305000000000000000000000003000000
      3A4944040000000000000000000000}
    Cursor = crSQLWait
    Left = 67
    Top = 242
  end
end
