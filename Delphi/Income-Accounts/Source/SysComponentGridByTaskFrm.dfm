inherited SysComponentGridByTaskForm: TSysComponentGridByTaskForm
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099' '#1076#1083#1103' '#1079#1072#1076#1072#1095#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtSysName: TcxTextEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnDragDrop = grdDataDBBandedTableViewDragDrop
          OnDragOver = grdDataDBBandedTableViewDragOver
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 134
          end
          inherited grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            Width = 91
          end
          object grdDataDBBandedTableViewBASETYPENAME: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090' '#1090#1080#1087#1091
            DataBinding.FieldName = 'BASETYPENAME'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099'|'#1042#1099#1073#1088#1072#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1080#1093' '#1074' '#1079#1072#1076#1072#1095#1091
      Visible = True
    end
    inherited actDelete: TAction
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099'|'#1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099' '#1080#1079' '#1079#1072#1076#1072#1095#1080
      Visible = True
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
      '  from fdc_Task_Syscomponent_Lst'
      ' where (TASK_ID = :ID) and'
      
        '       (:Name    is null or upper(NAME)    like upper(:Name)) an' +
        'd'
      '       (:SysName is null or upper(SYSNAME) like upper(:SysName))'
      ' order by Name')
    SourceServerObject = 'FDC_TASK_SYSCOMPONENT_LST'
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
      end
      item
        DataType = ftString
        Name = 'SysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SysName'
        ParamType = ptUnknown
      end>
    object dsDataBASE_TYPE_ID: TFloatField
      FieldName = 'BASE_TYPE_ID'
    end
    object dsDataBASETYPENAME: TStringField
      FieldName = 'BASETYPENAME'
      Size = 1500
    end
    object dsDataTASK_ID: TFloatField
      FieldName = 'TASK_ID'
    end
  end
end
