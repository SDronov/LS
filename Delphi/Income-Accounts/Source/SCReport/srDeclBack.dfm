inherited srDeclBackGridForm: TsrDeclBackGridForm
  Width = 774
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 766
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 19
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 461
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 461
      end
      inherited pnlProgress: TPanel
        Width = 461
        inherited lblProgress: TcxLabel
          Width = 461
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 674
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 766
  end
  inherited pnlWorkspace: TPanel
    Width = 766
    inherited pnlGrid: TPanel
      Width = 724
      inherited grdData: TcxGrid
        Width = 724
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
            DataBinding.FieldName = 'ITEM_DATE'
            Width = 104
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn
            Caption = #1043#1058#1044
            DataBinding.FieldName = 'DECL_NO'
            Width = 192
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'BDATE'
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1095#1080#1085#1072
            DataBinding.FieldName = 'REASON_NAME'
            Width = 121
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 66
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHANGE_DESC: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'CHANGE_DESC'
            Width = 132
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CUR_CODE'
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
        end
      end
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
      'select '
      'ae.item_date'
      ',a.decl_no'
      
        ',(select min(ae1.item_date) from fdc_account_entry_lst ae1, fdc_' +
        'decl_charge_hist_lst h2'
      
        '   where h2.decl_id = a.decl_id and h2.pay_type_id = a.pay_type_' +
        'id and h2.currency_id = a.currency_id'
      '   and ae1.OPERATION_ID = h2.id) bdate'
      ',a.reason_name'
      ',a.pay_type_code'
      ',a.change_desc'
      ',a.cur_code'
      ',a.summa '
      ',a.decl_id id'
      '  from fdc_account_entry_lst ae'
      '      ,fdc_decl_charge_hist_lst a'
      
        ' where ae.item_date between trunc(:dat1) and trunc(:dat2) and ae' +
        '.operation_id = a.ID '
      '       and a.summa < 0'
      'order by ae.ITEM_DATE, a.decl_no       ')
    ParamData = <
      item
        DataType = ftDate
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dat2'
        ParamType = ptUnknown
      end>
    object dsDataITEM_DATE: TDateTimeField
      FieldName = 'ITEM_DATE'
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 1500
    end
    object dsDataBDATE: TDateTimeField
      FieldName = 'BDATE'
    end
    object dsDataREASON_NAME: TStringField
      FieldName = 'REASON_NAME'
      Size = 1500
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataCHANGE_DESC: TStringField
      FieldName = 'CHANGE_DESC'
      Size = 2000
    end
    object dsDataCUR_CODE: TStringField
      FieldName = 'CUR_CODE'
      Size = 3
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
  end
end
