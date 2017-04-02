inherited TaskAddComponentsForm: TTaskAddComponentsForm
  Left = 395
  Top = 291
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btnCancel: TcxButton
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      TabOrder = 1
    end
    object edtText: TcxMemo [2]
      Left = 9
      Top = 9
      Align = alClient
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Height = 248
      Width = 422
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Control = edtText
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
  object dsComponents: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select'
      '  *'
      'from '
      '  fdc_syscomponent_lst'
      'where sysname in (%s)')
    Left = 24
    Top = 56
  end
end
