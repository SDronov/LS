inherited RegDocumentGridByObjectForm: TRegDocumentGridByObjectForm
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 48
            Width = 48
          end
          inherited grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewDOCSERIAL: TcxGridDBBandedColumn
            Width = 50
          end
          inherited grdDataDBBandedTableViewDOCNUMBER: TcxGridDBBandedColumn
            Width = 80
          end
          inherited grdDataDBBandedTableViewDOCDATE: TcxGridDBBandedColumn
            Width = 110
          end
          inherited grdDataDBBandedTableViewGRANTEE: TcxGridDBBandedColumn
            Width = 160
          end
          inherited grdDataDBBandedTableViewSTOPDATE: TcxGridDBBandedColumn
            Width = 110
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Reg_Document_Lst'
      ' where  (Owner_Object_ID = :ID) and'
      '       (:Name is null or upper(NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftUnknown
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
