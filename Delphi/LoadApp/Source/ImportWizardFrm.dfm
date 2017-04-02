inherited ImportWizardForm: TImportWizardForm
  Left = 426
  Top = 273
  Width = 574
  Height = 403
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 472
    Height = 374
    inherited btnCancel: TcxButton
      Left = 388
      Top = 342
    end
    inherited btnOk: TcxButton
      Left = 307
      Top = 342
    end
    inherited btnPrev: TcxButton
      Left = 145
      Top = 342
    end
    inherited btnNext: TcxButton
      Left = 226
      Top = 342
    end
    inherited PageControl: TcxPageControl
      Width = 454
      ClientRectRight = 450
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 448
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 191
            Height = 13
            Align = alClient
            Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1101#1082#1089#1087#1086#1088#1090#1072'.'
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1080' '#1091#1090#1080#1083#1080#1090#1099' '#1080#1084#1087#1086#1088#1090#1072
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 54
            Caption = ''
          end
          object edtDumpFileName: TcxButtonEdit [3]
            Left = 99
            Top = 74
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = False
            Properties.OnButtonClick = edtDumpFileNameButtonClick
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 2
            Width = 520
          end
          object edtImpFileName: TcxButtonEdit [4]
            Left = 99
            Top = 98
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = edtImpFileNameButtonClick
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
              Caption = #1060#1072#1081#1083' '#1101#1082#1089#1087#1086#1088#1090#1072
              Control = edtDumpFileName
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item4: TdxLayoutItem
              Caption = #1059#1090#1080#1083#1080#1090#1072' '#1080#1084#1087#1086#1088#1090#1072
              Control = edtImpFileName
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
          Width = 448
          Height = 246
          Align = alClient
          BevelInner = bvNone
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barPos: TcxProgressBar
            Left = 9
            Top = 244
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
            Left = 364
            Top = 269
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
          Width = 448
          Height = 246
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
    Height = 374
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
  object ExpStart: TJvCreateProcess
    StartupInfo.ShowWindow = swHide
    StartupInfo.ForceOnFeedback = True
    ConsoleOptions = [coRedirect]
    OnTerminate = ExpStartTerminate
    OnRawRead = ExpStartRawRead
    Left = 192
    Top = 88
  end
  object dlgImpSelect: TOpenDialog
    Filter = #1059#1090#1080#1083#1080#1090#1072' '#1080#1084#1087#1086#1088#1090#1072' imp.exe|imp.exe'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1091#1090#1080#1083#1080#1090#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1076#1072#1085#1085#1099#1093
    Left = 24
    Top = 168
  end
  object dlgDumpSelect: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1101#1082#1089#1087#1086#1088#1090#1072' *.dmp|*.dmp'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1091#1090#1080#1083#1080#1090#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1076#1072#1085#1085#1099#1093
    Left = 120
    Top = 168
  end
end
