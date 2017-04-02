inherited TaskGridBySysComponentForm: TTaskGridBySysComponentForm
  Caption = #1047#1072#1076#1072#1095#1080' '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnDragDrop = grdDataDBBandedTableViewDragDrop
          OnDragOver = grdDataDBBandedTableViewDragOver
          OptionsSelection.MultiSelect = True
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1080'|'#1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1076#1072#1095#1080' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1085#1080#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
    end
    inherited actDelete: TAction
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1079#1072#1076#1072#1095#1080'|'#1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090' '#1080#1079' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1076#1072#1095
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
      '  from fdc_Task_Lst_By_SysComponent'
      ' where (SYSCOMPONENT_ID = :ID) and'
      '       (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_TASK_LST_BY_SYSCOMPONENT'
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
    object dsDataSYSCOMPONENT_ID: TFloatField
      FieldName = 'SYSCOMPONENT_ID'
    end
  end
end
