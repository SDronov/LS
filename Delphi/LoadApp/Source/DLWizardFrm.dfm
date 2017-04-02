inherited DLLoaderForm: TDLLoaderForm
  Left = 302
  Top = 275
  Width = 543
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 441
    inherited btnCancel: TcxButton
      Left = 357
    end
    inherited btnOk: TcxButton
      Left = 276
    end
    inherited btnPrev: TcxButton
      Left = 114
    end
    inherited btnNext: TcxButton
      Left = 195
    end
    inherited PageControl: TcxPageControl
      Width = 423
      Height = 249
      ClientRectBottom = 248
      ClientRectRight = 422
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 421
          Height = 227
          object Label1: TLabel [0]
            Left = 9
            Top = 35
            Width = 194
            Height = 13
            Align = alClient
            Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080
            WordWrap = True
          end
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1072#1088#1093#1080#1074#1072' '#1089' '#1092#1072#1081#1083#1072#1084#1080
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 54
            Caption = ''
          end
          object edtFileName: TcxButtonEdit [3]
            Left = 42
            Top = 77
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
            TabOrder = 2
            Width = 330
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
            object dxLayoutControl2Item4: TdxLayoutItem
              Caption = #1040#1088#1093#1080#1074
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
          Width = 421
          Height = 227
          Align = alClient
          BevelInner = bvNone
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object barPos: TcxProgressBar
            Left = 9
            Top = 81
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
            Top = 35
            Caption = '0'
            ParentColor = False
            ParentFont = False
            Properties.WordWrap = True
            Style.BorderStyle = ebsNone
          end
          object lblPostion: TcxLabel
            Left = 97
            Top = 58
            Caption = '0'
            ParentColor = False
            ParentFont = False
            Properties.WordWrap = True
            Style.BorderStyle = ebsNone
          end
          object btnStop: TcxButton
            Left = 337
            Top = 106
            Width = 75
            Height = 23
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
            Style.Font.Height = -13
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
        OnShow = tabResultShow
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 421
          Height = 227
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
          object cxMemo1: TcxMemo
            Left = 9
            Top = 35
            ParentFont = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssBoth
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
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
              Control = cxMemo1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
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
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 64
    Top = 160
  end
  object dlgOpenFile: TOpenDialog
    Filter = 
      #1060#1072#1081#1083#1099' RAR (*.rar)|*.rar|'#1060#1072#1081#1083#1099' ZIP (*.zip)|*.zip|'#1060#1072#1081#1083#1099' LZH (*.lzh' +
      ')|*.lzh'
    FilterIndex = 2
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableIncludeNotify, ofEnableSizing]
    Left = 284
    Top = 246
  end
  object UnRar1: TUnRar
    CpuType = cptAuto
    Left = 369
    Top = 191
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 136
    Top = 208
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
    Left = 224
    Top = 198
  end
end
