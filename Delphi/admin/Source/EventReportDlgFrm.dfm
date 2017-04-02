inherited EventReportDlgForm: TEventReportDlgForm
  Left = 515
  Top = 229
  Caption = #1057#1086#1073#1099#1090#1080#1103
  ClientHeight = 181
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 181
    inherited Bevel1: TBevel
      Top = 152
      Width = 482
    end
    inherited btnCancel: TcxButton
      Left = 340
      Top = 160
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 259
      Top = 160
      TabOrder = 4
    end
    object rgReportType: TcxRadioGroup [3]
      Left = 9
      Top = 9
      ParentColor = False
      ParentFont = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1087#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084
          Value = '0'
        end
        item
          Caption = #1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1086#1088#1075#1072#1085#1072#1084
          Value = '1'
        end>
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = OfficeEditStyleController
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Height = 56
      Width = 422
    end
    object edtDateFrom: TcxDateEdit [4]
      Left = 45
      Top = 98
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 121
    end
    object edtDateTo: TcxDateEdit [5]
      Left = 45
      Top = 125
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 121
    end
    object cbUserStat: TcxCheckBox [6]
      Left = 9
      Top = 71
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ParentColor = False
      ParentFont = False
      State = cbsChecked
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        ShowCaption = False
        Control = rgReportType
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = 'cxCheckBox1'
        ShowCaption = False
        Control = cbUserStat
        ControlOptions.ShowBorder = False
      end
      object lciDateFrom: TdxLayoutItem [2]
        Caption = #1044#1072#1090#1072' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [3]
        Caption = #1055#1086
        Control = edtDateTo
        ControlOptions.ShowBorder = False
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
end
