inherited ARegistryLoaderWzdForm: TARegistryLoaderWzdForm
  Left = 391
  Top = 246
  Width = 551
  Height = 377
  HelpContext = 4101
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1088#1077#1077#1089#1090#1088#1086#1074' '#1050#1053#1055
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 449
    Height = 337
    inherited btnCancel: TcxButton
      Left = 339
      Top = 295
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    inherited btnOk: TcxButton
      Left = 234
      Top = 295
      ModalResult = 0
    end
    inherited btnPrev: TcxButton
      Left = 24
      Top = 295
    end
    inherited btnNext: TcxButton
      Left = 129
      Top = 295
    end
    inherited PageControl: TcxPageControl
      Height = 276
      ClientRectBottom = 272
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Height = 246
          object Label1: TLabel [0]
            Left = 12
            Top = 44
            Width = 387
            Height = 34
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1088#1093#1080#1074#1085#1099#1077' '#1092#1072#1081#1083#1099', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077' '#1088#1077#1077#1089#1090#1088#1099' '#1050#1053#1055' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1086#1074' '#1079#1072#1075#1088#1091#1079#1082#1080
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 114
            Caption = ''
            Properties.WordWrap = False
            Style.StyleController = OfficeEditStyleController
          end
          object edtFileName: TcxButtonEdit [3]
            Left = 58
            Top = 85
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 1
            Width = 292
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item3: TdxLayoutItem [1]
              ShowCaption = False
              Control = Label1
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lciFile: TdxLayoutItem [2]
              Caption = #1060#1072#1081#1083#1099
              Control = edtFileName
              ControlOptions.ShowBorder = False
            end
            inherited dxLayoutControl2Item2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = ''
              CaptionOptions.Layout = clTop
              ShowCaption = True
              Visible = False
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
          Width = 407
          Height = 246
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barLoad: TcxProgressBar
            Left = 12
            Top = 202
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 3
            Height = 25
            Width = 192
          end
          object cxLabel11: TcxLabel
            Left = 12
            Top = 12
            Caption = #1055#1088#1086#1094#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -18
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object edtLoadReport: TcxMemo
            Left = 12
            Top = 45
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            TabOrder = 1
            Height = 89
            Width = 185
          end
          object barDetail: TcxProgressBar
            Left = 12
            Top = 170
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.OverloadValue = 8.000000000000000000
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 2
            Height = 25
            Width = 383
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
          Width = 407
          Height = 246
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barCustomDecl: TcxProgressBar
            Left = 12
            Top = 242
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 8
            Height = 25
            Width = 192
          end
          object lblTotal: TcxLabel
            Left = 153
            Top = 45
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 21
            Width = 59
          end
          object lblDone: TcxLabel
            Left = 153
            Top = 73
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 22
            Width = 59
          end
          object lblDubl: TcxLabel
            Left = 153
            Top = 102
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 21
            Width = 59
          end
          object lblGood: TcxLabel
            Left = 153
            Top = 130
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 21
            Width = 59
          end
          object lblBadINN: TcxLabel
            Left = 153
            Top = 158
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 22
            Width = 59
          end
          object lblErrors: TcxLabel
            Left = 153
            Top = 215
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 20
            Width = 59
          end
          object cxLabel3: TcxLabel
            Left = 12
            Top = 12
            Caption = #1055#1088#1086#1094#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -18
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object lblNoPayOrder: TcxLabel
            Left = 153
            Top = 187
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Height = 21
            Width = 9
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
          Width = 407
          Height = 246
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel4: TcxLabel
            Left = 12
            Top = 12
            Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -18
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object edtReport: TcxMemo
            Left = 12
            Top = 45
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
            Height = 89
            Width = 185
          end
          object cxButton2: TcxButton
            Left = 204
            Top = 204
            Width = 98
            Height = 30
            Action = actPrint
            TabOrder = 2
          end
          object cxButton1: TcxButton
            Left = 309
            Top = 204
            Width = 98
            Height = 30
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
    Height = 337
  end
  inherited ActionList: TActionList
    inherited actCancel: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1086#1082#1085#1072
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100'...'
      OnExecute = actPrintExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
      OnExecute = actSaveExecute
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -12
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -12
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
      
        'select id, t.g071 || '#39'/'#39' || to_char(t.g072, '#39'ddmmyy'#39') || '#39'/'#39' || ' +
        't.g073 as gtd_name from'
      'dbf_dclhead t where t.LOAD_ID = :LOAD_ID')
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
    Top = 240
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
    object sqlLoadPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_argmt_loader.parse(pid => :loadid);'
        '  :report := '#39#39';'
        'end;')
    end
    object sqlErrList: TsqlOp
      SQL.Strings = (
        
          'select Name from fdc_custom_decl_error_lst where owner_object_id' +
          '= :id')
    end
  end
  object dlgOpenFile: TOpenDialog
    Filter = #1040#1088#1093#1080#1074#1085#1099#1077' '#1092#1072#1081#1083#1099'  (*.lzh, *.zip)|*.lzh;*.zip'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
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
end
