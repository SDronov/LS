inherited UserGridByUserGroupForm: TUserGridByUserGroupForm
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1074' '#1075#1088#1091#1087#1087#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtLogin: TcxTextEdit
          Width = 121
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
      Hint = 
        #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081'|'#1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1080#1093' '#1074' '#1075 +
        #1088#1091#1087#1087#1091
    end
    inherited actDelete: TAction
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
      Hint = 
        #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081'|'#1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1080#1079' '#1075#1088 +
        #1091#1087#1087#1099
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
      '  from fdc_User_Lst'
      ' where ID in ('
      '   select USER_ID'
      '     from fdc_User_In_Group_lst'
      '    where USER_GROUP_ID = :ID'
      ' ) and'
      ' (:Name is null or upper(NAME) like upper(:Name))'
      ' order by Name')
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
  end
end
