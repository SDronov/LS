inherited DeclLoaderForm: TDeclLoaderForm
  Left = 253
  Top = 258
  Width = 539
  Height = 362
  HelpContext = 4201
  Caption = #1042#1074#1086#1076' '#1044#1058' '#1080' '#1044#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 437
    Height = 333
    inherited btnCancel: TcxButton
      Left = 353
      Top = 301
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    inherited btnOk: TcxButton
      Left = 272
      Top = 301
      ModalResult = 0
    end
    inherited btnPrev: TcxButton
      Left = 110
      Top = 301
    end
    inherited btnNext: TcxButton
      Left = 191
      Top = 301
    end
    inherited PageControl: TcxPageControl
      Width = 330
      Height = 277
      ClientRectBottom = 273
      ClientRectRight = 326
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 324
          Height = 251
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 384
            Height = 26
            Caption = 
              #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1072#1090#1072#1083#1086#1075', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1081' dbf '#1092#1072#1081#1083#1099' '#1089' '#1044#1058' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080' '#1082#1086#1085#1090#1088#1086 +
              #1083#1103', '#1080#1083#1080' '#1092#1072#1081#1083#1086#1074#1099#1081' '#1072#1088#1093#1080#1074', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1081' '#1101#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 169
            Caption = ''
            Properties.WordWrap = False
            Style.StyleController = OfficeEditStyleController
          end
          object cmbxPath: TcxButtonEdit [3]
            Left = 53
            Top = 86
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = cmbxPathPropertiesButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 2
            Width = 253
          end
          object btnDirectory: TcxRadioButton [4]
            Left = 9
            Top = 67
            Width = 87
            Height = 13
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1082#1072#1090#1072#1083#1086#1075#1072
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = btnDirectoryClick
          end
          object btnArchive: TcxRadioButton [5]
            Left = 9
            Top = 118
            Width = 87
            Height = 13
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1092#1072#1081#1083#1086#1074#1086#1075#1086' '#1072#1088#1093#1080#1074#1072
            TabOrder = 3
            TabStop = True
            OnClick = btnArchiveClick
          end
          object edtFileName: TcxButtonEdit [6]
            Left = 53
            Top = 137
            Enabled = False
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 4
            Width = 224
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item3: TdxLayoutItem [1]
              ShowCaption = False
              Control = Label1
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item1: TdxLayoutItem [2]
              Caption = 'cxRadioButton1'
              ShowCaption = False
              Control = btnDirectory
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lciDirectory: TdxLayoutItem [3]
              Caption = #1050#1072#1090#1072#1083#1086#1075
              Control = cmbxPath
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item4: TdxLayoutItem [4]
              Caption = 'cxRadioButton1'
              ShowCaption = False
              Control = btnArchive
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lciFile: TdxLayoutItem [5]
              Caption = #1040#1088#1093#1080#1074
              Enabled = False
              Control = edtFileName
              ControlOptions.ShowBorder = False
            end
            inherited dxLayoutControl2Item2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = ''
              CaptionOptions.Layout = clTop
              LookAndFeel = LayoutWebLookAndFeel
              ShowCaption = True
              Visible = False
            end
          end
          object TdxLayoutItem
          end
        end
      end
      object tabLoad: TcxTabSheet
        Caption = 'tabLoad'
        ImageIndex = 2
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 324
          Height = 251
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barLoad: TcxProgressBar
            Left = 9
            Top = 226
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 3
            Height = 19
            Width = 147
          end
          object cxLabel11: TcxLabel
            Left = 9
            Top = 9
            Caption = #1055#1088#1086#1094#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object edtLoadReport: TcxMemo
            Left = 9
            Top = 37
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Courier New'
            Style.Font.Style = []
            Style.StyleController = WebEditStyleController
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 68
            Width = 142
          end
          object barDetail: TcxProgressBar
            Left = 9
            Top = 202
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 2
            Height = 18
            Width = 293
          end
          object dxLayoutGroup3: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutItem2: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel11
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl4Item1: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Control = edtLoadReport
              ControlOptions.ShowBorder = False
            end
            object lciDetail: TdxLayoutItem
              Caption = ' '
              CaptionOptions.Layout = clTop
              Control = barDetail
              ControlOptions.ShowBorder = False
            end
            object dxLayoutItem10: TdxLayoutItem
              Caption = #1047#1072#1075#1088#1091#1079#1082#1072
              LookAndFeel = LayoutWebLookAndFeel
              ShowCaption = False
              Control = barLoad
              ControlOptions.ShowBorder = False
            end
            object dxLayoutGroup4: TdxLayoutGroup
              ShowCaption = False
              ShowBorder = False
            end
          end
        end
      end
      object tabInfo: TcxTabSheet
        Caption = 'tabInfo'
        ImageIndex = 1
        TabVisible = False
        OnShow = tabInfoShow
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 324
          Height = 251
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barCustomDecl: TcxProgressBar
            Left = 9
            Top = 195
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 8
            Height = 18
            Width = 147
          end
          object lblTotal: TcxLabel
            Left = 118
            Top = 37
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 16
            Width = 45
          end
          object lblDone: TcxLabel
            Left = 118
            Top = 59
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 16
            Width = 45
          end
          object lblDubl: TcxLabel
            Left = 118
            Top = 81
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 17
            Width = 45
          end
          object lblGood: TcxLabel
            Left = 118
            Top = 104
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 16
            Width = 45
          end
          object lblBadINN: TcxLabel
            Left = 118
            Top = 126
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 16
            Width = 45
          end
          object lblErrors: TcxLabel
            Left = 118
            Top = 172
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 17
            Width = 45
          end
          object cxLabel3: TcxLabel
            Left = 9
            Top = 9
            Caption = #1055#1088#1086#1094#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object lblNoPayOrder: TcxLabel
            Left = 118
            Top = 148
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 18
            Width = 7
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl3Item2: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel3
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item3: TdxLayoutItem
              Caption = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081
              Control = lblTotal
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item4: TdxLayoutItem
              Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1086
              Control = lblDone
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item5: TdxLayoutItem
              Caption = #1055#1086#1074#1090#1086#1088#1103#1102#1097#1080#1093#1089#1103
              Control = lblDubl
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item6: TdxLayoutItem
              Caption = #1061#1086#1088#1086#1096#1080#1093
              Control = lblGood
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item7: TdxLayoutItem
              Caption = #1053#1077#1074#1077#1088#1077#1085' '#1082#1086#1076' '#1048#1053#1053
              Control = lblBadINN
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item9: TdxLayoutItem
              Caption = #1053#1077#1090' '#1087#1083#1072#1090'. '#1087#1086#1088#1091#1095#1077#1085#1080#1081
              Control = lblNoPayOrder
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item8: TdxLayoutItem
              Caption = #1055#1088#1086#1095#1080#1077' '#1086#1096#1080#1073#1082#1080
              Control = lblErrors
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item1: TdxLayoutItem
              Caption = #1047#1072#1075#1088#1091#1079#1082#1072
              LookAndFeel = LayoutWebLookAndFeel
              ShowCaption = False
              Control = barCustomDecl
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Group1: TdxLayoutGroup
              ShowCaption = False
              ShowBorder = False
            end
          end
        end
      end
      object tabReport: TcxTabSheet
        Caption = 'tabReport'
        ImageIndex = 2
        OnShow = tabReportShow
        object lcReport: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 324
          Height = 251
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel4: TcxLabel
            Left = 9
            Top = 9
            Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object edtReport: TcxMemo
            Left = 9
            Top = 37
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Courier New'
            Style.Font.Style = []
            Style.StyleController = WebEditStyleController
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 69
            Width = 142
          end
          object cxButton1: TcxButton
            Left = 328
            Top = 229
            Width = 76
            Height = 22
            Action = actSave
            TabOrder = 3
          end
          object cxButton2: TcxButton
            Left = 247
            Top = 229
            Width = 75
            Height = 22
            Action = actPrint
            TabOrder = 2
          end
          object lcReportGroup_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcReportItem1: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel4
              ControlOptions.ShowBorder = False
            end
            object lcReportItem2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = 'cxMemo2'
              CaptionOptions.Layout = clTop
              ShowCaption = False
              Control = edtReport
              ControlOptions.ShowBorder = False
            end
            object lcReportGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcReportItem4: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                ShowCaption = False
                Control = cxButton2
                ControlOptions.ShowBorder = False
              end
              object lcReportItem3: TdxLayoutItem
                AutoAligns = []
                AlignHorz = ahRight
                AlignVert = avBottom
                ShowCaption = False
                Control = cxButton1
                ControlOptions.ShowBorder = False
              end
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 333
  end
  inherited ActionList: TActionList
    inherited actCancel: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1086#1082#1085#1072
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
      OnExecute = actSaveExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100'...'
      OnExecute = actPrintExecute
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -15
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -15
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object dsNewDecl: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      
        'select id, t.g071 || '#39'/'#39' || to_char(t.g072, '#39'ddmmyy'#39') || '#39'/'#39' || ' +
        't.g073 as gtd_name from'
      'dbf_dclhead_lst t where t.LOAD_ID = :LOAD_ID')
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'LOAD_ID'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 88
    Top = 224
    object sqlLoadDecl: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_cdecl_loader_ex.loadcdecl(pid => :id);'
        '     :errtext := '#39#39';'
        'exception'
        '   when others then'
        '     :errtext := sqlerrm;'
        'end;')
      DataSet = dsNewDecl
    end
    object sqlNewDecl: TsqlOp
      SQL.Strings = (
        
          'select id, t.g071 || '#39'/'#39' || to_char(t.g072, '#39'ddmmyy'#39') || '#39'/'#39' || ' +
          't.g073 as gtd_name from'
        'dbf_dclhead_lst t')
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
    object sqlLoadKts: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_cdecl_loader_ex.loadkts(pid => :id);'
        '     :errtext := '#39#39';'
        'exception'
        '   when others then'
        '     :errtext := sqlerrm;'
        'end;')
      DataSet = dsNewKts
    end
    object sqlEndLoadKts: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_cdecl_loader_ex.RemoveUnloadKTS;'
        '--  DELETE FROM dbf_ktcpltiz_lst WHERE dateload is null; '
        'end;')
    end
    object sqlLoadKtd: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_cdecl_loader_ex.loadktd(pid => :id);'
        '     :errtext := '#39#39';'
        'exception'
        '   when others then'
        '     :errtext := sqlerrm;'
        'end;')
      DataSet = dsNewKtd
    end
  end
  object dlgOpenFile: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' LZH (*.lzh)|*.lzh'
    Left = 284
    Top = 246
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 16
    Top = 168
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = plReportLink
    Version = 0
    Left = 16
    Top = 272
    object plReportLink: TcxMemoReportLink
      Component = edtReport
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object dsNewKts: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      
        'select t.id,t.g071 || '#39'/'#39' || to_char(t.g072, '#39'ddmmyy'#39') || '#39'/'#39' ||' +
        ' t.g073 as gtd_name'
      'from dbf_ktcpltiz_lst t'
      'where t.dateload is null'
      '  and t.LOAD_ID = :LOAD_ID')
    Left = 128
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'LOAD_ID'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object dsNewKtd: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      
        'select t.id,t.g071 || '#39'/'#39' || to_char(t.g072, '#39'ddmmyy'#39') || '#39'/'#39' ||' +
        ' t.g073 as gtd_name'
      'from dbf_ktdplbiz t'
      'where t.dateload is null'
      '  and t.LOAD_ID = :LOAD_ID'
      '  and t.kb7 <> 0')
    Left = 136
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'LOAD_ID'
        ParamType = ptUnknown
        Value = 0
      end>
  end
end
