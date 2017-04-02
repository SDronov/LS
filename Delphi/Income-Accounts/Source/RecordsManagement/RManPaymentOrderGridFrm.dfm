inherited RManPaymentOrderGridForm: TRManPaymentOrderGridForm
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
          inherited grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          inherited grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          inherited grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 17
          end
          inherited grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          inherited grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 18
          end
          inherited grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            Position.ColIndex = 21
          end
          inherited grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 22
          end
          inherited grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 23
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.sysname                 AS state_sysname'
      '      ,s.name                    AS state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AS AVAIL_SUMMA'
      '      ,v.id                      AS relation_id'
      '      ,0                         AS ak'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '  from fdc_Payment_Order_Lst t,'
      '       fdc_value_lst v,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and v.owner_object_id = :ID'
      '   and t.id = v.ref_object_id'
      
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
    ParamData = <
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
        DataType = ftDate
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
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
    object dsDataRELATION_ID: TFloatField [43]
      FieldName = 'RELATION_ID'
    end
  end
  inherited qlPOG: TQueryList
    object sqlAddPaymentOrder: TsqlOp
      SQL.Strings = (
        'begin'
        '  :Result := fdc_rmanref_add(pId => :RMAN_ID, '
        '                             pRefObjectId => :PO_ID);'
        'end;')
    end
    object sqlDelPaymentOrder: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_rmanref_del(pId => :RELATION_ID);'
        'end;')
      DataSet = dsData
    end
  end
end
