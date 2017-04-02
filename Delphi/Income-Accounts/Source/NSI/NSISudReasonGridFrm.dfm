inherited NSISudReasonGridForm: TNSISudReasonGridForm
  Caption = 
    #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1080#1079#1085#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1081' ('#1088#1077#1096#1077#1085#1080#1081') '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1085#1077#1087#1088#1072#1074#1086#1084 +
    #1077#1088#1085#1099#1084#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
            DataBinding.FieldName = 'SDATE'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
            DataBinding.FieldName = 'EDATE'
            Position.BandIndex = 0
            Position.ColIndex = 8
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
      '  from fdc_dict_sud_reason_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_DICT_SUD_REASON_LST'
    object dsDataSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object dsDataEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
end
