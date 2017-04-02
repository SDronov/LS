inherited AdvicePaymentOrderGridForm: TAdvicePaymentOrderGridForm
  Caption = 'AdvicePaymentOrderGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 80
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 105
        end
        inherited edtNomer: TcxTextEdit
          Width = 105
        end
        inherited edtCurrency: TcxTextEdit
          Width = 105
        end
        inherited edtFromDate: TcxDateEdit
          Width = 105
        end
        inherited edtToDate: TcxDateEdit
          Width = 105
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 105
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 105
        end
        inherited edtKPP: TcxTextEdit
          Width = 105
        end
        inherited edtDescript: TcxMemo
          Width = 83
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
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
            end>
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
            end>
          inherited grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          inherited grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 31
          end
          inherited columnIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 30
          end
          object colPaymentSumma: TcxGridDBBandedColumn [31]
            DataBinding.FieldName = 'PAYMENT_SUMMA'
            Styles.Content = cxStyle1
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          inherited columnACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 33
          end
          inherited columnIS_ARCHIVE: TcxGridDBBandedColumn
            Position.ColIndex = 29
          end
          inherited grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Position.ColIndex = 34
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 35
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
    inherited actSwitchSearchCriteria: TAction
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
      'select'
      't.id'
      ',t.name'
      ',t.shortname'
      ',t.object_Type_id'
      ',t.state_id'
      ',t.accesslevel'
      ',t.sysname'
      ',t.descript'
      ',t.note'
      ',t.owner_object_id'
      ',t.typename'
      ',t.typesysname'
      ',t.objectkindlist'
      ',t.doc_no'
      ',t.doc_date'
      ',t.exec_date'
      ',t.payer_id'
      ',t.summa'
      ',t.kbk'
      ',t.currency_id'
      ',t.payer_name'
      ',t.payer_inn'
      ',t.curr_name'
      ',t.curr_code'
      ',t.doc_summa'
      ',t.rest_summa'
      ',t.doc_no2'
      ',t.doc_date2'
      ',t.DestCustomsCode'
      ',t.payer_kpp'
      ',t.coming_date'
      ',t.assure_date'
      ',t.pay_type_code'
      ',t.locked_summa'
      ',t.income_date'
      ',t.subject_id'
      ',t.activation_date'
      ',decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      ',CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archive'
      '      ,s.sysname                     AS state_sysname'
      '      ,s.name                        AS state_name'
      '      ,t.rest_summa - t.locked_summa AS avail_summa'
      '      ,v.summa                       AS payment_summa'
      '      ,0                             AS ak'
      '      ,t.is_ts'
      '  from fdc_Payment_Order_Lst t,'
      '       (/*select -sum(pd.summa) summa,'
      '               pd.payment_id'
      '          FROM fdc_advice_deduction_lst pd'
      '         where pd.advice_id = :ID'
      '         group by pd.payment_id*/'
      '         select sum(pd.summa) summa,'
      '               pd.payment_id'
      '          FROM fdc_advice_reserve_lst pd'
      '         where pd.advice_id = :ID'
      '         group by pd.payment_id) v,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and t.id = v.payment_id'
      
        '   and (:NA is null or (:NA = 1 and t.PAYER_ID is null) or (:NA ' +
        '=  2 and t.SUMMA is null))'
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
      '/*$p#PAY_CODE#*/ and  ((t.PAY_TYPE_CODE like  :PAY_CODE))'
      'and rownum <=:MaxRecordCount')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataPAYMENT_SUMMA: TFloatField [43]
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'PAYMENT_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end
