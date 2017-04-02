inherited TaskGridByUserForm: TTaskGridByUserForm
  Caption = #1047#1072#1076#1072#1095#1080' '#1076#1083#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 222
          end
          object grdDataDBBandedTableViewUSERGROUPNAME: TcxGridDBBandedColumn
            Caption = #1042#1099#1076#1072#1085#1072' '#1075#1088#1091#1087#1087#1077
            DataBinding.FieldName = 'USERGROUPNAME'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
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
      '  from fdc_Task_Lst_By_User'
      ' where (USER_ID = :ID) and'
      '       (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_TASK_LST_BY_USER'
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
    object dsDataUSER_GROUP_ID: TFloatField
      FieldName = 'USER_GROUP_ID'
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object dsDataUSERGROUPNAME: TStringField
      FieldName = 'USERGROUPNAME'
      Size = 1500
    end
  end
end
