inherited ExportWizardForm: TExportWizardForm
  Left = 426
  Top = 273
  Width = 574
  Height = 403
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 472
    Height = 376
    inherited btnCancel: TcxButton
      Left = 388
      Top = 344
    end
    inherited btnOk: TcxButton
      Left = 307
      Top = 344
    end
    inherited btnPrev: TcxButton
      Left = 145
      Top = 344
    end
    inherited btnNext: TcxButton
      Left = 226
      Top = 344
    end
    inherited PageControl: TcxPageControl
      Width = 454
      ActivePage = tabProcess
      ClientRectRight = 453
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 452
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 550
            Height = 26
            Align = alClient
            Caption = 
              #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075', '#1082#1091#1076#1072' '#1073#1091#1076#1077#1090' '#1089#1086#1093#1088#1072#1085#1077#1085' '#1092#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080'. ' +
              #1050#1072#1090#1072#1083#1086#1075' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1076#1086#1089#1090#1091#1087#1077#1085' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1080' '#1086#1073#1098#1077#1084' '#1089#1074#1086#1073#1086#1076#1085#1086#1075#1086' '#1076#1080#1089#1082#1086 +
              #1074#1086#1075#1086' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1072' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1076#1086#1089#1090#1072#1090#1086#1095#1085#1099#1084' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093'.' +
              '  '
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1080' '#1091#1090#1080#1083#1080#1090#1099' '#1101#1082#1089#1087#1086#1088#1090#1072
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 67
            Caption = ''
          end
          object cmbxPath: TcxButtonEdit [3]
            Left = 103
            Top = 87
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = False
            Properties.OnButtonClick = cmbxPathButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 2
            Width = 520
          end
          object edtFileName: TcxButtonEdit [4]
            Left = 103
            Top = 111
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = edtFileNamePropertiesButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 3
            Width = 434
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item3: TdxLayoutItem [1]
              ShowCaption = False
              Control = Label1
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            inherited dxLayoutControl2Item2: TdxLayoutItem
              Visible = False
            end
            object dxLayoutControl2Item1: TdxLayoutItem
              Caption = #1050#1072#1090#1072#1083#1086#1075
              Control = cmbxPath
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item4: TdxLayoutItem
              Caption = #1059#1090#1080#1083#1080#1090#1072' '#1101#1082#1089#1087#1086#1088#1090#1072
              Control = edtFileName
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabProcess: TcxTabSheet
        Caption = 'tabProcess'
        ImageIndex = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 452
          Height = 252
          Align = alClient
          BevelInner = bvNone
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barPos: TcxProgressBar
            Left = 9
            Top = 250
            Align = alClient
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.BarStyle = cxbsGradient
            Properties.OverloadValue = 8.000000000000000000
            Properties.ShowTextStyle = cxtsPosition
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 2
            Height = 19
            Width = 293
          end
          object btnStop: TcxButton
            Left = 368
            Top = 275
            Width = 75
            Height = 23
            Hint = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1079#1072#1075#1088#1091#1079#1082#1091' '#1076#1072#1085#1085#1099#1093
            Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
            TabOrder = 3
            OnClick = btnStopClick
          end
          object cxLabel5: TcxLabel
            Left = 9
            Top = 9
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093'...'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLogMemo: TcxMemo
            Left = 9
            Top = 35
            ParentFont = False
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 208
            Width = 403
          end
          object dxLayoutGroup3: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl3Item5: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel5
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item6: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Control = cxLogMemo
              ControlOptions.ShowBorder = False
            end
            object dxLayoutItem2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avBottom
              Visible = False
              Control = barPos
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item4: TdxLayoutItem
              AutoAligns = []
              AlignHorz = ahRight
              AlignVert = avBottom
              ShowCaption = False
              Visible = False
              Control = btnStop
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabResult: TcxTabSheet
        Caption = 'tabResult'
        ImageIndex = 2
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 452
          Height = 252
          Align = alClient
          BevelInner = bvNone
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel6: TcxLabel
            Left = 9
            Top = 9
            Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1079#1072#1075#1088#1091#1079#1082#1080
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxMemo: TcxMemo
            Left = 9
            Top = 35
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 68
            Width = 142
          end
          object dxLayoutControl4Group_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl4Item1: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel6
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl4Item2: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Control = cxMemo
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        inherited dxLayoutControl1Item2: TdxLayoutItem
          Visible = False
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 376
    ParentBackground = False
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object UnRar1: TUnRar
    CpuType = cptAuto
    Left = 369
    Top = 191
  end
  object odsExpTables: TOracleDataSet
    SQL.Strings = (
      'SELECT t.table_name'
      'FROM all_tables t'
      'WHERE t.owner = USER'
      '  AND t.table_name LIKE '#39'EXP_%'#39)
    Session = MainData.Session
    Left = 64
    Top = 240
  end
  object ExpStart: TJvCreateProcess
    StartupInfo.ShowWindow = swHide
    StartupInfo.ForceOnFeedback = True
    ConsoleOptions = [coRedirect]
    OnTerminate = ExpStartTerminate
    OnRawRead = ExpStartRawRead
    Left = 192
    Top = 88
  end
  object dlgOpen: TOpenDialog
    Filter = #1059#1090#1080#1083#1080#1090#1072' '#1101#1082#1089#1087#1086#1088#1090#1072' exp.exe|exp.exe'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1091#1090#1080#1083#1080#1090#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1076#1072#1085#1085#1099#1093
    Left = 24
    Top = 168
  end
end
