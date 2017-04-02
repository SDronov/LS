inherited srPeriodPmntGridForm: TsrPeriodPmntGridForm
  Left = 455
  Top = 276
  Height = 356
  Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080' ('#1091#1087#1083#1072#1095#1077#1085#1085#1099#1077')'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 293
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 290
  end
  inherited pnlWorkspace: TPanel
    Height = 262
    inherited splSearchCriteria: TSplitter
      Height = 262
    end
    inherited pnlSearchCriteria: TPanel
      Height = 262
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 242
        inherited btnSearch: TcxButton
          Top = 191
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 262
      inherited grdData: TcxGrid
        Height = 262
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewrur_summa
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewrur_summa
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewusd_summa
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableVieweur_summa
            end>
          OptionsView.Footer = True
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewpd_doc_date: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'pd_doc_date'
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewdecl_name: TcxGridDBBandedColumn
            Caption = #1044#1058
            DataBinding.FieldName = 'decl_name'
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewmin_payment_month: TcxGridDBBandedColumn
            Caption = #1053#1072#1095#1072#1083#1086' ('#1076#1072#1090#1072')'
            DataBinding.FieldName = 'min_payment_month'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewmax_payment_month: TcxGridDBBandedColumn
            Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' ('#1076#1072#1090#1072')'
            DataBinding.FieldName = 'max_payment_month'
            Width = 121
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewrur_summa: TcxGridDBBandedColumn
            Caption = #1056#1091#1073#1083#1100
            DataBinding.FieldName = 'rur_summa'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 94
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewusd_summa: TcxGridDBBandedColumn
            Caption = #1044#1086#1083#1083#1072#1088
            DataBinding.FieldName = 'usd_summa'
            Width = 76
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableVieweur_summa: TcxGridDBBandedColumn
            Caption = #1045#1074#1088#1086
            DataBinding.FieldName = 'eur_summa'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewpd_payment_type: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'pd_payment_type'
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewdecl_inn: TcxGridDBBandedColumn
            Caption = #1048#1053#1053' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
            DataBinding.FieldName = 'decl_inn'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 8
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select id'
      '      ,pd_doc_date'
      '      ,decl_name'
      '      ,min(payment_month) min_payment_month'
      '      ,max(payment_month) max_payment_month'
      
        '      ,sum((case po_curr_code when '#39'643'#39' then pd_summa else 0 en' +
        'd)) rur_summa'
      
        '      ,sum((case po_curr_code when '#39'840'#39' then pd_summa else 0 en' +
        'd)) usd_summa'
      
        '      ,sum((case po_curr_code when '#39'978'#39' then pd_summa else 0 en' +
        'd)) eur_summa'
      '      ,pd_payment_type'
      '      ,decl_inn'
      'from ('
      'select  trunc(pd.doc_date) pd_doc_date'
      '       ,pd.payment_month'
      '       ,d.id'
      '       ,d.name decl_name'
      '       ,pd.summa pd_summa'
      '       ,po.curr_code po_curr_code'
      '       ,pay_dict.code pd_payment_type'
      '       ,d.decl_inn'
      'from fdc_payment_deduction_all_lst pd'
      '    ,fdc_Custom_Decl_Temp_Adm_Lst d'
      '    ,fdc_dict pay_dict'
      '    ,fdc_po_lst po'
      'where pd.typesysname in ('#39'PayPeriodic'#39')'
      
        '  and (pd.doc_date between trunc(:dat1) and trunc(:dat2)+1-1/24/' +
        '60/60)'
      '  and pd.decl_id = d.id'
      '  and pd.pay_type_id = pay_dict.id(+)'
      '  and pd.payment_id = po.id'
      ')'
      'group by pd_doc_date'
      '        ,id'
      '        ,decl_name'
      '        ,pd_payment_type'
      '        ,decl_inn'
      'order by decl_name,pd_doc_date,decl_inn,pd_payment_type')
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
  end
end
