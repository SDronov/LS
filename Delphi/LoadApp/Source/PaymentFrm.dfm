inherited PaymentForm: TPaymentForm
  Left = 429
  Top = 221
  Width = 499
  Height = 442
  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 491
    Height = 408
    ClientRectBottom = 384
    ClientRectRight = 491
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 485
        Height = 353
        object cxDBMaskEdit1: TcxDBMaskEdit [0]
          Left = 94
          Top = 57
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 104
        end
        object cxDBMaskEdit3: TcxDBMaskEdit [1]
          Left = 324
          Top = 57
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 93
        end
        object cxDBTextEdit1: TcxDBButtonEdit [2]
          Left = 94
          Top = 81
          DataBinding.DataField = 'INN_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxDBTextEdit1PropertiesButtonClick
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 5
          Width = 289
        end
        object cxDBMemo1: TcxDBMemo [3]
          Left = 94
          Top = 252
          DataBinding.DataField = 'INFO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 16
          Height = 68
          Width = 141
        end
        object cxDBTextEdit2: TcxDBTextEdit [4]
          Left = 94
          Top = 33
          DataBinding.DataField = 'DOC_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 110
        end
        object cxDBDateEdit1: TcxDBDateEdit [5]
          Left = 327
          Top = 33
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 93
        end
        object cxDBCurrencyEdit1: TcxDBCurrencyEdit [6]
          Left = 94
          Top = 129
          DataBinding.DataField = 'DOC_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 92
        end
        object cxDBCurrencyEdit2: TcxDBCurrencyEdit [7]
          Left = 94
          Top = 153
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Properties.OnValidate = cxDBCurrencyEdit2PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 92
        end
        object cxDBMaskEdit4: TcxDBMaskEdit [8]
          Left = 258
          Top = 129
          DataBinding.DataField = 'CURR_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 93
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox [9]
          Left = 94
          Top = 9
          DataBinding.DataField = 'DOC_TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'SYSNAME'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataSource1
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 0
          Width = 289
        end
        object cxDBDateEdit2: TcxDBDateEdit [10]
          Left = 269
          Top = 105
          DataBinding.DataField = 'ACC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 81
        end
        object cxDBDateEdit3: TcxDBDateEdit [11]
          Left = 252
          Top = 177
          DataBinding.DataField = 'LAST_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 12
          Width = 90
        end
        object cxDBDateEdit4: TcxDBDateEdit [12]
          Left = 94
          Top = 105
          DataBinding.DataField = 'BANK_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 93
        end
        object cxDBDateEdit5: TcxDBDateEdit [13]
          Left = 94
          Top = 177
          DataBinding.DataField = 'LOAD_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 91
        end
        object cxDBCheckBox1: TcxDBCheckBox [14]
          Left = 9
          Top = 225
          Caption = #1053#1077#1074#1099#1103#1089#1085#1077#1085#1085#1099#1081'?'
          DataBinding.DataField = 'IS_UNKNOWN'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueGrayed = '0'
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 126
        end
        object cxDBDateEdit6: TcxDBDateEdit [15]
          Left = 252
          Top = 201
          DataBinding.DataField = 'SOGLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 14
          Width = 94
        end
        object cxDBTextEdit3: TcxDBTextEdit [16]
          Left = 94
          Top = 201
          DataBinding.DataField = 'SOGLN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 13
          Width = 91
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralItem12: TdxLayoutItem
              Caption = #1058#1080#1087' '#1076#1086#1082'-'#1090#1072
              Control = cxDBLookupComboBox1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup5: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem6: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1053#1086#1084#1077#1088
                Control = cxDBTextEdit2
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem7: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072
                Control = cxDBDateEdit1
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralGroup3: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1053#1053
              Control = cxDBMaskEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem3: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1055#1055
              Control = cxDBMaskEdit3
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem4: TdxLayoutItem
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup4: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem13: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1044#1072#1090#1072' '#1073#1072#1085#1082#1072
              Control = cxDBDateEdit4
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083'.'
              Control = cxDBDateEdit2
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem8: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072
              Control = cxDBCurrencyEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem10: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
              Control = cxDBMaskEdit4
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup6: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralItem9: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1054#1089#1090#1072#1090#1086#1082
              Control = cxDBCurrencyEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup7: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem14: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
                Control = cxDBDateEdit5
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem11: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1055#1086#1089#1083'. '#1086#1087#1077#1088'.'
                Control = cxDBDateEdit3
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralGroup8: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem17: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088' '#1089#1086#1075#1083'.'
              Control = cxDBTextEdit3
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem16: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1089#1086#1075#1083'.'
              Control = cxDBDateEdit6
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem15: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = 'cxDBCheckBox1'
            ShowCaption = False
            Control = cxDBCheckBox1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem5: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
            CaptionOptions.AlignVert = tavTop
            Control = cxDBMemo1
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 491
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 353
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 381
        Width = 491
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 488
        Height = 353
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 63
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 55
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 71
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
        FloatLeft = 293
        FloatTop = 389
        FloatClientWidth = 24
        FloatClientHeight = 48
        ItemLinks = <
          item
            Item = btnSave
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end>
        Name = 'barTools'
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
    Session = MainData.Session
    SQL.Strings = (
      'select * from leg_payment'
      'where NNN = :NNN')
    Left = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'NNN'
        ParamType = ptUnknown
      end>
    inherited dsDataID: TFloatField
      FieldKind = fkInternalCalc
    end
  end
  inherited srcData: TDataSource
    DataSet = dsMain
  end
  object dsMain: TOracleDataSet
    SQL.Strings = (
      'select t.*, t.rowid from leg_payment t'
      'where t.NNN = :NNN')
    Variables.Data = {0300000001000000040000003A4E4E4E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000016000000030000004E4E4E01000000000003000000494E4E01000000
      000008000000494E4E5F4E414D4501000000000006000000444F435F4E4F0100
      0000000008000000444F435F4441544501000000000008000000444F435F5459
      504501000000000009000000444F435F53554D4D410100000000000500000053
      554D4D410100000000000800000050415945525F494401000000000007000000
      435552525F494401000000000004000000494E464F0100000000000800000045
      52525F54455854010000000000020000004944010000000000030000004B5050
      01000000000009000000435552525F434F4445010000000000090000004C4153
      545F444154450100000000000900000042414E4B5F4441544501000000000008
      0000004143435F44415445010000000000090000004C4F41445F444154450100
      000000000A00000049535F554E4B4E4F574E01000000000005000000534F474C
      4E01000000000005000000534F474C44010000000000}
    RefreshOptions = [roAfterInsert]
    Session = MainData.Session
    DesignActivation = True
    BeforeOpen = dsMainBeforeOpen
    AfterOpen = dsMainAfterOpen
    BeforeInsert = dsMainBeforeEdit
    BeforeEdit = dsMainBeforeEdit
    Left = 363
    Top = 44
    object dsMainNNN: TStringField
      DisplayLabel = #1042#1085#1091#1090#1088'. ID'
      FieldName = 'NNN'
      Size = 64
    end
    object dsMainINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsMainINN_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'INN_NAME'
      Size = 200
    end
    object dsMainDOC_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NO'
      Required = True
    end
    object dsMainDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object dsMainDOC_TYPE: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_TYPE'
      Required = True
      Size = 80
    end
    object dsMainDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'DOC_SUMMA'
      Required = True
    end
    object dsMainSUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'SUMMA'
    end
    object dsMainPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsMainCURR_ID: TFloatField
      FieldName = 'CURR_ID'
    end
    object dsMainINFO: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'INFO'
      Size = 1000
    end
    object dsMainERR_TEXT: TStringField
      FieldName = 'ERR_TEXT'
      Size = 2000
    end
    object dsMainID: TFloatField
      FieldName = 'ID'
    end
    object dsMainKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsMainCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURR_CODE'
      Required = True
      Size = 3
    end
    object dsMainLAST_DATE: TDateTimeField
      FieldName = 'LAST_DATE'
    end
    object dsMainREG_DATE: TDateTimeField
      FieldName = 'ACC_DATE'
    end
    object dsMainBANK_DATE: TDateTimeField
      FieldName = 'BANK_DATE'
    end
    object dsMainLOAD_DATE: TDateTimeField
      FieldName = 'LOAD_DATE'
    end
    object dsMainIS_UNKNOWN: TIntegerField
      DisplayLabel = #1053#1077#1074#1099#1103#1089#1085#1077#1085#1085#1099#1081
      FieldName = 'IS_UNKNOWN'
    end
    object dsMainSOGLN: TStringField
      DisplayLabel = #1053#1084#1077#1088' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
      FieldName = 'SOGLN'
      Size = 10
    end
    object dsMainSOGLD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
      FieldName = 'SOGLD'
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select t.sysname, t.name from fdc_object_type t'
      
        'where t.parent_object_type_id = (select id from fdc_object_type ' +
        't where t.sysname = '#39'PaymentOrder'#39')'
      'and t.objecttableinstance = '#39'1'#39)
    QBEDefinition.QBEFieldDefs = {
      0400000002000000070000005359534E414D45010000000000040000004E414D
      45010000000000}
    ReadOnly = True
    Session = MainData.Session
    Left = 419
    Top = 44
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 403
    Top = 36
  end
  object dsCurr: TOracleDataSet
    SQL.Strings = (
      'select t.code, t.name from fdc_nsi_currency_lst t'
      'order by t.code')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000070000005359534E414D45010000000000040000004E414D
      45010000000000}
    ReadOnly = True
    Session = MainData.Session
    Left = 123
    Top = 116
  end
end
