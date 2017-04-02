inherited NSILoaderForm: TNSILoaderForm
  Left = 302
  Top = 275
  Width = 543
  HelpContext = 352
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1053#1057#1048
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 433
    inherited btnCancel: TcxButton
      Left = 349
    end
    inherited btnOk: TcxButton
      Left = 268
    end
    inherited btnPrev: TcxButton
      Left = 106
    end
    inherited btnNext: TcxButton
      Left = 187
    end
    inherited PageControl: TcxPageControl
      Width = 423
      Height = 249
      ClientRectBottom = 245
      ClientRectRight = 419
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 415
          Height = 221
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 209
            Height = 26
            Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083', '#1080#1079' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1073#1091#1076#1091#1090' '#1079#1072#1075#1088#1091#1078#1072#1090#1100#1089#1103' '#1076#1072#1085#1085#1099#1077
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1053#1057#1048
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 67
            Caption = ''
          end
          object edtFileName: TcxButtonEdit [3]
            Left = 69
            Top = 87
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
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 2
            Width = 251
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item3: TdxLayoutItem [1]
              ShowCaption = False
              Control = Label1
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item1: TdxLayoutItem
              Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072':'
              Control = edtFileName
              ControlOptions.ShowBorder = False
            end
          end
          object TdxLayoutItem
          end
        end
      end
      object tabProcess: TcxTabSheet
        Caption = 'tabProcess'
        ImageIndex = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 415
          Height = 221
          Align = alClient
          BevelInner = bvNone
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barPos: TcxProgressBar
            Left = 9
            Top = 77
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
            Width = 293
          end
          object lblTotal: TcxLabel
            Left = 97
            Top = 37
            Caption = '0'
            ParentColor = False
            ParentFont = False
            Properties.WordWrap = True
            Style.BorderStyle = ebsNone
          end
          object lblPostion: TcxLabel
            Left = 97
            Top = 57
            Caption = '0'
            ParentColor = False
            ParentFont = False
            Properties.WordWrap = True
            Style.BorderStyle = ebsNone
          end
          object btnStop: TcxButton
            Left = 322
            Top = 102
            Width = 76
            Height = 24
            Hint = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1079#1072#1075#1088#1091#1079#1082#1091' '#1076#1072#1085#1085#1099#1093
            Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
            TabOrder = 4
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
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl3Item5: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel5
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Group1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object dxLayoutControl3Item2: TdxLayoutItem
                AutoAligns = []
                AlignVert = avClient
                Caption = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081':'
                Control = lblTotal
                ControlOptions.MinHeight = 0
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl3Item3: TdxLayoutItem
                Caption = #1058#1077#1082#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100':'
                Control = lblPostion
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl3Item1: TdxLayoutItem
                Control = barPos
                ControlOptions.ShowBorder = False
              end
            end
            object dxLayoutControl3Item4: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              ShowCaption = False
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
          Width = 415
          Height = 221
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
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxMemo1: TcxMemo
            Left = 9
            Top = 37
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            TabOrder = 1
            Height = 68
            Width = 141
          end
          object cxButton2: TcxButton
            Left = 241
            Top = 203
            Width = 75
            Height = 23
            Action = actPrint
            TabOrder = 2
          end
          object cxButton1: TcxButton
            Left = 322
            Top = 203
            Width = 76
            Height = 23
            Action = actSave
            TabOrder = 3
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
              Control = cxMemo1
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl4Group1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object dxLayoutControl4Item3: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                ShowCaption = False
                Control = cxButton2
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl4Item4: TdxLayoutItem
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
    ParentBackground = False
  end
  inherited ActionList: TActionList
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
  object dlgOpen: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' DBF (*.dbf) |*.dbf'
    Left = 24
    Top = 168
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 64
    Top = 160
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = plReportLink
    Version = 0
    Left = 16
    Top = 256
    object plReportLink: TcxMemoReportLink
      Component = cxMemo1
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
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Top = 168
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 48
    Top = 216
    object sqlStat: TsqlOp
      SQL.Strings = (
        'select * from fdc_load_stat_lst')
    end
    object sqlStart: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_loader.settotal(-1);'
        'end;')
    end
    object sqlGetErrors: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_loader.GetErrors;'
        'end;')
    end
  end
  object qryGetErrors: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :result := p_loader.GetErrorsCLOB;'
      'end;')
    Session = MainData.Session
    Variables.Data = {0300000001000000070000003A524553554C54700000000000000000000000}
    Cursor = crSQLWait
    Left = 192
    Top = 206
  end
end
