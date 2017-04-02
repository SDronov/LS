inherited NoteTRDlgForm: TNoteTRDlgForm
  Left = 355
  Top = 251
  Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1088#1072#1089#1087#1080#1089#1082#1080
  ClientHeight = 216
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 216
    inherited Bevel1: TBevel
      Top = 176
      Width = 482
    end
    inherited btnCancel: TcxButton
      Top = 184
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Top = 184
      TabOrder = 2
    end
    object cxMemo1: TcxMemo [3]
      Left = 72
      Top = 38
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 1
      Height = 128
      Width = 359
    end
    object chbxReserveSum: TcxCheckBox [4]
      Left = 9
      Top = 9
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1089#1091#1084#1084#1091
      ParentColor = False
      ParentFont = False
      State = cbsChecked
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 422
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciReserveSum: TdxLayoutItem [0]
        Caption = 'ReserveSum'
        ShowCaption = False
        Visible = False
        Control = chbxReserveSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Control = cxMemo1
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOk: TAction
      OnUpdate = actOkUpdate
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
