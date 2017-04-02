inherited SysComponentGridByObjectTypeForm: TSysComponentGridByObjectTypeForm
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099' '#1076#1083#1103' '#1090#1080#1087#1072
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
      '  from fdc_SysComponent_Lst'
      ' where (BASE_TYPE_ID = :ID) and '
      
        '       (:Name    is null or upper(NAME)    like upper(:Name)) an' +
        'd'
      '       (:SysName is null or upper(SYSNAME) like upper(:SysName))'
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
  end
end
