inherited EventGridByUserForm: TEventGridByUserForm
  Caption = #1057#1086#1073#1099#1090#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
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
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 127
          end
          inherited grdDataDBBandedTableViewMOMENT: TcxGridDBBandedColumn
            Width = 76
          end
          inherited grdDataDBBandedTableViewUSERNAME: TcxGridDBBandedColumn
            Visible = False
          end
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
      ' where (LOGIN = upper(:Login)) and'
      '       (:Name     is null or upper(NAME) like upper(:Name)) and'
      '       (:DateFrom is null or MOMENT >= :DateFrom) and'
      '       (:DateTo   is null or MOMENT <= :DateTo)'
      ' order by MOMENT desc')
    ParamData = <
      item
        DataType = ftString
        Name = 'Login'
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
