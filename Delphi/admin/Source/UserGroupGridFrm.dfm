inherited UserGroupGridForm: TUserGroupGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Top = 2
      Width = 81
      Height = 18
      inherited lblRecordCount: TcxLabel
        Height = 18
        Width = 81
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 85
      Top = 2
      Width = 82
      Height = 18
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 170
      Top = 2
      Width = 228
      Height = 18
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 228
        Height = 18
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 18
        end
      end
      inherited pnlProgress: TPanel
        Width = 228
        Height = 18
        inherited lblProgress: TcxLabel
          Height = 18
          Width = 228
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 401
      Top = 2
      Width = 61
      Height = 18
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 183
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        inherited lblSearchCriteriaCaption: TLabel
          Width = 71
          Caption = #1055#1086#1080#1089#1082' '#1075#1088#1091#1087#1087
        end
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
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_User_Group_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and rownum <= :MaxRecordCount')
    SourceServerObject = 'FDC_USER_GROUP_LST'
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
