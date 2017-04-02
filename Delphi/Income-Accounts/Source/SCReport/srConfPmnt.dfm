inherited srConfPmntGridForm: TsrConfPmntGridForm
  Left = 311
  Top = 265
  Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1077' ('#1091#1087#1083#1072#1095#1077#1085#1085#1099#1077') '#1087#1083#1072#1090#1077#1078#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 19
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited splSearchCriteria: TSplitter
      Left = 62
    end
    inherited pnlSearchCriteria: TPanel
      Width = 62
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 62
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 62
      end
    end
    inherited pnlGrid: TPanel
      Left = 67
      Width = 519
      inherited grdData: TcxGrid
        Width = 519
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'ITEM_DATE'
            Width = 88
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'NAME'
            Width = 153
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'TYPENAME'
            Width = 67
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082'-'#1090#1091
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_TEXT_ID: TcxGridDBBandedColumn
            Caption = #1048#1053#1053'/'#1050#1055#1055
            DataBinding.FieldName = 'PAYER_TEXT_ID'
            Width = 136
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
            DataBinding.FieldName = 'COMING_DATE'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED_SUMMA: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1090#1072'/'#1057#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'PAYED_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 6
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
    Bars = <
      item
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = edtFrom
            Visible = True
          end
          item
            Item = edtTo
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
      'WITH acnt AS ('
      '    SELECT a.id'
      '      FROM fdc_acc_light_lst a'
      '      where :dat1 between sdate and nvl(edate, :dat2)      '
      '      START WITH a.code = '#39'01.03.00'#39
      '      CONNECT BY PRIOR a.id = a.parent_id'
      '  )'
      'SELECT atr.operation_date AS item_date'
      '      ,p.NAME'
      '      ,p.typename'
      '      ,p.doc_summa'
      '      ,p.payer_inn || '#39'/'#39' || p.payer_kpp payer_text_id'
      '      ,p.curr_code'
      '      ,NVL(p.summa, 0) summa'
      
        '      ,p.doc_summa * FDC_NSI_CURRENCY_GET_RATE(p.currency_id, at' +
        'r.operation_date, 1) s643'
      '      ,p.id'
      '      ,trunc(p.COMING_DATE) COMING_DATE'
      '      ,p.summa - p.rest_summa payed_summa'
      '  FROM fdc_acc_transaction         atr'
      '      ,fdc_payment_order_lst       p'
      '      ,fdc_payment_order_cnfrm_lst d'
      
        ' WHERE atr.operation_date BETWEEN trunc( :dat1 ) AND trunc( :dat' +
        '2 )'
      '   AND atr.account_id IN ( SELECT id FROM acnt )'
      '   AND atr.is_debit = '#39'N'#39
      '   AND d.id = atr.doc_id'
      '   AND p.id = d.confirmed_pay_id'
      'UNION ALL'
      'SELECT atr.operation_date AS item_date'
      '      ,p.NAME'
      '      ,p.typename'
      '      ,p.doc_summa'
      '      ,p.payer_inn || '#39'/'#39' || p.payer_kpp payer_text_id'
      '      ,p.curr_code'
      '      ,NVL(p.summa, 0) summa'
      
        '      ,p.doc_summa * FDC_NSI_CURRENCY_GET_RATE(p.currency_id, at' +
        'r.operation_date, 1) s643'
      '      ,p.id'
      '      ,trunc(p.COMING_DATE) COMING_DATE'
      '      ,p.summa - p.rest_summa payed_summa'
      '  FROM fdc_acc_transaction         atr'
      '      ,fdc_payment_order_lst       p'
      
        ' WHERE atr.operation_date BETWEEN trunc( :dat1 ) AND trunc( :dat' +
        '2 )'
      
        '   AND atr.account_id = ( SELECT id FROM fdc_acc_light_lst WHERE' +
        ' code = '#39'01.01.01'#39' and :dat1 between sdate and nvl(edate, :dat2)' +
        ')'
      '   AND atr.is_debit = '#39'Y'#39
      '   AND p.id = atr.doc_id'
      ' ')
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
      end
      item
        DataType = ftDate
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dat2'
        ParamType = ptUnknown
      end
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
