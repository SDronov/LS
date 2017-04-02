inherited UserGroupGridByTaskForm: TUserGroupGridByTaskForm
  Caption = #1043#1088#1091#1087#1087#1099' '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077' '#1079#1072#1076#1072#1095#1091
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnDragDrop = grdDataDBBandedTableViewDragDrop
          OnDragOver = grdDataDBBandedTableViewDragOver
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1099'|'#1042#1099#1073#1088#1072#1090#1100' '#1075#1088#1091#1087#1087#1099' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1085#1080#1093' '#1079#1072#1076#1072#1095#1091
    end
    inherited actDelete: TAction
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1099'|'#1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1079#1072#1076#1072#1095#1091' '#1080#1079' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1075#1088#1091#1087#1087
    end
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_User_Group_Lst_By_Task'
      ' where (TASK_ID = :ID) and'
      '       (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_USER_GROUP_LST_BY_TASK'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataTASK_ID: TFloatField
      FieldName = 'TASK_ID'
    end
  end
end
