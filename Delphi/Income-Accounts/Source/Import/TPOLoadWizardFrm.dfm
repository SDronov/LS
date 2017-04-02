inherited TPOLoaderForm: TTPOLoaderForm
  Left = 289
  Top = 282
  Width = 508
  Height = 398
  HelpContext = 431
  Caption = #1042#1074#1086#1076' '#1058#1055#1054
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 398
    Height = 360
    inherited btnCancel: TcxButton
      Left = 314
      Top = 328
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    inherited btnOk: TcxButton
      Left = 233
      Top = 328
      ModalResult = 0
    end
    inherited btnPrev: TcxButton
      Left = 71
      Top = 328
    end
    inherited btnNext: TcxButton
      Left = 152
      Top = 328
    end
    inherited PageControl: TcxPageControl
      Height = 313
      ClientRectBottom = 309
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Height = 285
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 232
            Height = 39
            Caption = 
              #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1072#1090#1072#1083#1086#1075', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1081' dbf '#1092#1072#1081#1083#1099' '#1058#1055#1054' , '#1080#1083#1080' '#1092#1072#1081#1083#1086#1074#1099#1081' '#1072#1088#1093#1080#1074',' +
              ' '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1081' '#1101#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 80
            Caption = ''
            Style.StyleController = OfficeEditStyleController
          end
          object cmbxPath: TcxButtonEdit [3]
            Left = 53
            Top = 213
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
            TabOrder = 4
            Width = 253
          end
          object btnDirectory: TcxRadioButton [4]
            Left = 9
            Top = 194
            Width = 87
            Height = 13
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1082#1072#1090#1072#1083#1086#1075#1072
            Checked = True
            TabOrder = 3
            TabStop = True
            OnClick = btnDirectoryClick
          end
          object btnArchive: TcxRadioButton [5]
            Left = 9
            Top = 238
            Width = 87
            Height = 13
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1092#1072#1081#1083#1086#1074#1086#1075#1086' '#1072#1088#1093#1080#1074#1072
            TabOrder = 5
            TabStop = True
            OnClick = btnArchiveClick
          end
          object edtFileName: TcxButtonEdit [6]
            Left = 53
            Top = 257
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
            TabOrder = 6
            Width = 224
          end
          object gbxFormat: TcxRadioGroup [7]
            Left = 9
            Top = 101
            Caption = #1060#1086#1088#1084#1072#1090' '#1092#1072#1081#1083#1086#1074' '#1058#1055#1054
            ParentColor = False
            ParentFont = False
            Properties.Columns = 2
            Properties.DefaultValue = '1'
            Properties.Items = <
              item
                Caption = #1042#1085#1077#1096#1085#1080#1081
                Value = '1'
              end
              item
                Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081
                Value = '0'
              end>
            ItemIndex = 0
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            TabOrder = 2
            Height = 44
            Width = 293
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item3: TdxLayoutItem [1]
              ShowCaption = False
              Control = Label1
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            inherited dxLayoutControl2Item2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              Caption = ''
              CaptionOptions.Layout = clTop
              ShowCaption = True
              Visible = False
            end
            object dxLayoutControl2Item5: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = 'cxRadioGroup1'
              ShowCaption = False
              Control = gbxFormat
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item1: TdxLayoutItem
              Caption = 'cxRadioButton1'
              ShowCaption = False
              Control = btnDirectory
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lciDirectory: TdxLayoutItem
              Caption = #1050#1072#1090#1072#1083#1086#1075
              Control = cmbxPath
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item4: TdxLayoutItem
              Caption = 'cxRadioButton1'
              ShowCaption = False
              Control = btnArchive
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lciFile: TdxLayoutItem
              Caption = #1040#1088#1093#1080#1074
              Enabled = False
              Control = edtFileName
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabLoad: TcxTabSheet
        Caption = 'tabLoad'
        ImageIndex = 2
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 312
          Height = 285
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barLoad: TcxProgressBar
            Left = 9
            Top = 250
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 3
            Height = 20
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
            Style.StyleController = WebEditStyleController
            TabOrder = 1
            Height = 68
            Width = 142
          end
          object barDetail: TcxProgressBar
            Left = 9
            Top = 225
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 2
            Height = 19
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
          Width = 312
          Height = 285
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
          Width = 312
          Height = 285
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
            Height = 68
            Width = 142
          end
          object cxButton2: TcxButton
            Left = 207
            Top = 253
            Width = 75
            Height = 23
            Action = actPrint
            TabOrder = 2
          end
          object cxButton1: TcxButton
            Left = 288
            Top = 253
            Width = 75
            Height = 23
            Action = actSave
            TabOrder = 3
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
              object lcReportItem3: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                ShowCaption = False
                Control = cxButton2
                ControlOptions.ShowBorder = False
              end
              object lcReportItem4: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
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
    Height = 360
  end
  inherited ActionList: TActionList
    inherited actCancel: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1086#1082#1085#1072
      OnUpdate = actCancelUpdate
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
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object dsNewDecl: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select tpo_number id, tpo_number as tpo_name from'
      'dbf_tpo_lst t where t.LOAD_ID = :LOAD_ID')
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
    Left = 48
    Top = 248
    object sqlLoadDecl: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '     :result := p_tpo_loader.loadTPO(TPONum => :id);'
        '     :errtext := '#39#39';'
        'exception'
        '   when others then'
        '     :errtext := sqlerrm;'
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
  end
  object dlgOpenFile: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' LZH (*.lzh)|*.lzh'
    Options = [ofHideReadOnly, ofEnableIncludeNotify, ofEnableSizing]
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
    Top = 256
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
  object UnARJ1: TUnARJ
    TranslateOemChar = False
    CpuType = cptAuto
    Left = 72
    Top = 176
  end
end
