inherited EventGridByObjectForm: TEventGridByObjectForm
  Caption = #1057#1086#1073#1099#1090#1080#1103' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtDateFrom: TcxDateEdit
          Width = 105
        end
        inherited edtDateTo: TcxDateEdit
          Width = 105
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
      '  from fdc_Event_Lst'
      ' where OBJECT_ID in ('
      '   select ID'
      '     from fdc_Object_Lst_ID'
      '     start with ID = :ID'
      '     connect by prior ID = OWNER_OBJECT_ID'
      ' ) and'
      ' (:Name     is null or upper(NAME) like upper(:Name)) and'
      ' (:DateFrom is null or MOMENT >= :DateFrom) and'
      ' (:DateTo   is null or MOMENT <= :DateTo)'
      'order by MOMENT desc')
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
        DataType = ftDateTime
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateTo'
        ParamType = ptUnknown
      end>
  end
end
