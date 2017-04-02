inherited CustomsForm: TCustomsForm
  Left = 329
  Top = 206
  Width = 806
  Height = 608
  Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 798
    Height = 581
    ClientRectBottom = 557
    ClientRectRight = 798
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 45
          Height = 17
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 798
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 528
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 554
        Width = 798
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 795
        Height = 528
      end
      inherited lcMain: TdxLayoutControl
        Width = 792
        Height = 528
        TabOrder = 4
        object Label1: TLabel [0]
          Left = 21
          Top = 340
          Width = 125
          Height = 13
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1072#1090#1091#1089#1072
          Color = clWindow
          ParentColor = False
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 99
          Width = 449
        end
        inherited edtOKPO: TcxDBMaskEdit
          Width = 200
        end
        inherited edtINN: TcxDBMaskEdit
          Top = 39
          Width = 141
        end
        inherited edtOGRN: TcxDBMaskEdit
          Width = 63
        end
        inherited edtAddress: TcxDBTextEdit
          Top = 129
          Width = 340
        end
        inherited edtPhone: TcxDBTextEdit
          Top = 159
        end
        inherited edtFax: TcxDBTextEdit
          Top = 159
          Width = 203
        end
        inherited edtTelex: TcxDBTextEdit
          Top = 189
        end
        inherited edtSOATO: TcxDBMaskEdit
          Top = 39
          Width = 104
        end
        inherited edtTeletype: TcxDBTextEdit
          Top = 189
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 69
        end
        inherited edtTeleGraph: TcxDBTextEdit
          Top = 189
        end
        object edCustomsCode: TcxDBMaskEdit [13]
          Left = 157
          Top = 250
          DataBinding.DataField = 'CUSTOMS_CODE_8'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,8}'
          Properties.MaxLength = 0
          Properties.OnChange = cxDBEditPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 122
        end
        object cxDBTextEdit3: TcxDBTextEdit [14]
          Left = 321
          Top = 250
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = cxDBEditPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 16
          Width = 400
        end
        object edtTTT: TcxDBTextEdit [15]
          Left = 157
          Top = 280
          DataBinding.DataField = 'TTT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 17
          Width = 120
        end
        object cxDBTextEdit2: TcxDBTextEdit [16]
          Left = 21
          Top = 449
          Hint = #1057#1080#1089#1090#1077#1084#1072' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103' ('#1050#1088#1080#1087#1090#1086#1055#1088#1086'/'#1042#1077#1088#1073#1072')'
          DataBinding.DataField = 'SYSCRYPTO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 18
          Width = 742
        end
        object cxDBTextEdit4: TcxDBTextEdit [17]
          Left = 21
          Top = 404
          Hint = 
            #1048#1084#1103' '#1089#1091#1073#1098#1077#1082#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103' (e-mail) ('#1076#1083#1103' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103' '#1089#1086#1086 +
            #1073#1097#1077#1085#1080#1081' '#1087#1088#1080' '#1087#1077#1088#1077#1076#1072#1095#1077')'
          DataBinding.DataField = 'CERT_SUBJECT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 742
        end
        object cxDBDateEdit1: TcxDBDateEdit [18]
          Left = 157
          Top = 310
          DataBinding.DataField = 'DT_START'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 121
        end
        object cxDBDateEdit2: TcxDBDateEdit [19]
          Left = 364
          Top = 310
          DataBinding.DataField = 'DT_END'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 21
          Width = 121
        end
        object edtTzone: TcxDBTextEdit [20]
          Left = 157
          Top = 359
          DataBinding.DataField = 'TZONE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 22
          Width = 193
        end
        inherited dxLayoutGroup3s: TdxLayoutGroup
          inherited dxLayoutGroup2s: TdxLayoutGroup
            inherited lcMainGroup1s: TdxLayoutGroup
              inherited lciNames: TdxLayoutItem
                AutoAligns = []
              end
              inherited lcGeneralItem4: TdxLayoutItem
                AutoAligns = []
              end
              object lcMainGroup1: TdxLayoutGroup
                Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
                object lcMainGroup2: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainItem1: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
                    Control = edCustomsCode
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem2: TdxLayoutItem
                    Caption = #1050#1086#1076'(5)'
                    Control = cxDBTextEdit3
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainItem3: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = 'TTT'
                  Control = edtTTT
                  ControlOptions.ShowBorder = False
                end
                object lcMainGroup3: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainItem7: TdxLayoutItem
                    Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
                    Control = cxDBDateEdit1
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem8: TdxLayoutItem
                    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
                    Control = cxDBDateEdit2
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainItem4: TdxLayoutItem
                  Caption = 'Label1'
                  ShowCaption = False
                  Control = Label1
                  ControlOptions.AutoColor = True
                  ControlOptions.ShowBorder = False
                end
                object lciedtTzone: TdxLayoutItem
                  Caption = #1056#1072#1079#1085#1080#1094#1072' '#1074#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1089' '#1052#1057#1050
                  Control = edtTzone
                  ControlOptions.ShowBorder = False
                end
                object lcMainItem6: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = 
                    #1048#1084#1103' '#1089#1091#1073#1098#1077#1082#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103' (e-mail) ('#1076#1083#1103' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103' '#1089#1086#1086 +
                    #1073#1097#1077#1085#1080#1081' '#1087#1088#1080' '#1087#1077#1088#1077#1076#1072#1095#1077')'
                  CaptionOptions.Layout = clTop
                  Control = cxDBTextEdit4
                  ControlOptions.ShowBorder = False
                end
                object lcMainItem5: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1057#1080#1089#1090#1077#1084#1072' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103' ('#1050#1088#1080#1087#1090#1086#1055#1088#1086'/'#1042#1077#1088#1073#1072')'
                  CaptionOptions.Layout = clTop
                  Control = cxDBTextEdit2
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
        end
      end
    end
    inherited tabDocList: TcxTabSheet
      inherited pcDocList: TcxPageControl
        Width = 760
        Height = 507
        ClientRectBottom = 505
        ClientRectRight = 758
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 798
        Height = 557
        ClientRectBottom = 533
        ClientRectRight = 798
      end
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 332
    Top = 27
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -13
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited imglLarge: TImageList
    Left = 192
    Top = 43
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
      '  from fdc_customs_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_CUSTOMS_LST'
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076'(5)'
      FieldName = 'CUSTOMS_CODE'
      Required = True
      Size = 5
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'CUSTOMS_CODE_8'
      Required = True
      Size = 8
    end
    object dsDataDT_START: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1072#1090#1091#1089#1072
      FieldName = 'DT_START'
      ReadOnly = True
    end
    object dsDataTTT: TStringField
      FieldName = 'TTT'
      Size = 3
    end
    object dsDataCERT_SUBJECT: TStringField
      DisplayLabel = #1048#1084#1103' '#1089#1091#1073#1098#1077#1082#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
      FieldName = 'CERT_SUBJECT'
      Size = 250
    end
    object dsDataSYSCRYPTO: TStringField
      FieldName = 'SYSCRYPTO'
      Size = 250
    end
    object dsDataDT_END: TDateTimeField
      FieldName = 'DT_END'
      ReadOnly = True
    end
    object dsDataTZONE: TIntegerField
      FieldName = 'TZONE'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_customs_Add('
      '  :Name,'
      '  :Address,'
      '  :FullName,'
      '  :OKPO,'
      '  :INN,'
      '  :OGRN,'
      '  :SOATO,'
      '  :KPP,'
      '  :Phone,'
      '  :Fax,'
      '  :Telex,'
      '  :Teletype,'
      '  :Customs_Code,'
      '  :Customs_Code_8,'
      '  :DT_START,'
      '  :TTT,'
      '  :CERT_SUBJECT,'
      '  :SYSCRYPTO);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FullName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_START'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TTT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CERT_SUBJECT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SYSCRYPTO'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_customs_upd(:ID,'
      '  :Name,'
      '  :Address,'
      '  :FullName,'
      '  :OKPO,'
      '  :INN,'
      '  :OGRN,'
      '  :SOATO,'
      '  :KPP,'
      '  :Phone,'
      '  :Fax,'
      '  :Telex,'
      '  :Teletype,'
      '  :Customs_Code,'
      '  :Customs_Code_8,'
      '  :DT_START,'
      '  :TTT,'
      '  :CERT_SUBJECT,'
      '  :SYSCRYPTO);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FullName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_START'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TTT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CERT_SUBJECT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SYSCRYPTO'
        ParamType = ptUnknown
      end>
  end
end
