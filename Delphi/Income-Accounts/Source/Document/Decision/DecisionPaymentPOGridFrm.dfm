inherited DecisionPaymentPOGridForm: TDecisionPaymentPOGridForm
  Left = 580
  Top = 301
  Height = 570
  Caption = 'DecisionPaymentPOGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 507
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 504
  end
  inherited pnlWorkspace: TPanel
    Height = 476
    inherited splSearchCriteria: TSplitter
      Height = 476
    end
    inherited pnlSearchCriteria: TPanel
      Height = 476
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 456
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 80
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited btnSearch: TcxButton
          Left = 95
          Top = 454
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 92
        end
        inherited edtNomer: TcxTextEdit
          Width = 92
        end
        inherited edtCurrency: TcxTextEdit
          Width = 92
        end
        inherited edtFromDate: TcxDateEdit
          Width = 92
        end
        inherited edtToDate: TcxDateEdit
          Width = 92
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 92
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 92
        end
        inherited edtKPP: TcxTextEdit
          Width = 92
        end
        inherited edtPayCode: TcxTextEdit
          Width = 92
        end
        inherited edtDescript: TcxMemo
          Width = 161
        end
        inherited btnSearchClear: TcxButton
          Left = 95
          Top = 425
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 476
      inherited grdData: TcxGrid
        Height = 476
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_REUSED
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          object grdDataDBBandedTableViewSUMMA_REUSED: TcxGridDBBandedColumn [5]
            DataBinding.FieldName = 'SUMMA_REUSED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Styles.Content = MainData.stlSumByDoc
            Styles.Footer = MainData.stlSumByDoc
            Styles.Header = MainData.stlSumByDoc
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          inherited grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            Position.ColIndex = 21
          end
          inherited grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn
            Position.ColIndex = 33
          end
          inherited grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          inherited grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 18
          end
          inherited grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 17
          end
          inherited grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 27
          end
          inherited grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            Position.ColIndex = 22
          end
          inherited grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 23
          end
          inherited grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 24
          end
          inherited grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 25
          end
          inherited grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 26
          end
          inherited grdDataDBBandedTableViewAIL_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 28
          end
          inherited grdDataDBBandedTableViewINCOMDE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 29
          end
          inherited columnIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 30
          end
          inherited columnACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 31
          end
          inherited columnIS_ARCHIVE: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          inherited grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Position.ColIndex = 34
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 35
          end
          inherited grdDataDBBandedTableViewUIN: TcxGridDBBandedColumn
            Position.ColIndex = 36
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actIdentify: TAction
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.sysname                 AS state_sysname'
      '      ,s.name                    AS state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AS AVAIL_SUMMA'
      '      ,rp.payment_id              AS relation_id'
      '      ,0                         AS ak'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,rp.summa_reused'
      '  from fdc_Payment_Order_Lst t,'
      '       (SELECT r.payment_id, SUM( r.summa ) AS summa_reused'
      '          FROM fdc_value_lst            v,'
      '               fdc_reserved_payment_lst r'
      '         WHERE v.owner_object_id = :ID'
      '           AND v.ref_object_id   = r.id'
      '         GROUP BY r.payment_id ) rp,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and t.id = rp.payment_id'
      
        '   and (:NA is null or (:NA = 1 and PAYER_ID is null) or (:NA = ' +
        ' 2 and SUMMA is null))'
      '/*$p#name#*/   and upper(t.name) like upper(:name)'
      '/*$p#INN#*/   and (t.payer_inn like :INN)'
      '/*$p#KPP#*/   and (t.payer_kpp like :KPP)'
      
        '/*$p#DOC_NO#*/   and (t.doc_no like :DOC_NO or t.doc_no2 like :D' +
        'OC_NO)'
      '/*$p#CURR#*/   and (t.curr_code like :CURR)'
      '/*$p#FROM_DATE#*/   and (t.doc_date >= :FROM_DATE)'
      '/*$p#TO_DATE#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#SUM_MIN#*/   and (t.doc_summa >= :SUM_MIN)'
      '/*$p#SUM_MAX#*/   and (t.doc_summa <= :SUM_MAX)'
      '/*$p#DESCRIPT#*/   and t.DESCRIPT like :DESCRIPT'
      '/*$p#PAY_CODE#*/ and  ((PAY_TYPE_CODE like  :PAY_CODE))'
      'and rownum <=:MaxRecordCount')
    object dsDataSUMMA_REUSED: TFloatField
      DisplayLabel = #1047#1072#1095#1090#1105#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
      FieldName = 'SUMMA_REUSED'
    end
  end
end
