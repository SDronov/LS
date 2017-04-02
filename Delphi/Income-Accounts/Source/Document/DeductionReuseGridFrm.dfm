inherited DeductionReuseGridForm: TDeductionReuseGridForm
  Left = 256
  Top = 249
  Width = 912
  Height = 506
  Caption = #1057#1087#1080#1089#1072#1085#1080#1103' '#1087#1086' '#1087#1077#1088#1077#1079#1072#1095#1105#1090#1091
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 454
    Width = 904
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 599
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 599
      end
      inherited pnlProgress: TPanel
        Width = 599
        inherited lblProgress: TcxLabel
          Width = 599
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 812
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 451
    Width = 904
  end
  inherited pnlWorkspace: TPanel
    Width = 904
    Height = 425
    inherited splSearchCriteria: TSplitter
      Height = 425
    end
    inherited pnlSearchCriteria: TPanel
      Height = 425
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 405
        inherited btnSearch: TcxButton
          Top = 374
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 345
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 699
      Height = 425
      inherited grdData: TcxGrid
        Width = 699
        Height = 425
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Styles.Content = MainData.stlSumByDoc
            Styles.Footer = MainData.stlSumByDoc
            Styles.Header = MainData.stlSumByDoc
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_TYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_TYPENAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_DOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_DOC_NUMBER'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_DOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_NAME: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBK_CODE'
            Width = 283
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actOpenPaymentOrder: TAction
      Category = 'Object'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1072#1090#1105#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actOpenPaymentOrderExecute
      OnUpdate = actOpenPaymentOrderUpdate
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
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
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
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
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
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = barBtnOpenPaymentOrder
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
    object barBtnOpenPaymentOrder: TdxBarButton
      Action = actOpenPaymentOrder
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'SELECT dr."ID",dr."NAME",dr."SHORTNAME",dr."OBJECT_TYPE_ID",dr."' +
        'STATE_ID",dr."ACCESSLEVEL",dr."SYSNAME",dr."DESCRIPT",'
      
        'dr."OWNER_OBJECT_ID",dr."TYPENAME",dr."TYPESYSNAME",dr."OBJECTKI' +
        'NDLIST",dr."DOC_DATE",'
      
        'dr."DOC_NUMBER",dr."IS_ACTIVE",dr."ACTIVATION_DATE",dr."DECL_ID"' +
        ',dr."PAYMENT_ID",dr."PAY_TYPE_ID",'
      
        'dr."SUMMA"*decode( rc.customs_code_new, p_params.CustomCode, -1,' +
        ' 1) AS SUMMA,'
      
        'dr."PAYMENT_DATE",dr."PAYMENT_MONTH",dr."CHARGE_CURR_ID",dr."CHA' +
        'RGE_SUMMA",dr."CHARGE_ID",dr."KBKCODE_ID"'
      ',po.doc_number AS payment_doc_number'
      ',po.doc_date   AS payment_doc_date'
      ',po.typename   AS payment_typename'
      ',kbk.code      AS kbk_code'
      ',kbk.name      AS kbk_name'
      '  FROM fdc_deduction_reuse_lst dr'
      
        '  LEFT OUTER JOIN fdc_po_credit_lst_all po ON po.id = dr.payment' +
        '_id'
      '  LEFT OUTER JOIN fdc_doc_reuse_customs_lst rc ON rc.ID = :ID'
      '  LEFT OUTER JOIN fdc_kbk_dict_lst kbk on kbk.id = dr.KBKCODE_ID'
      ' where (:Name is null or upper(dr.NAME) like upper(:Name))'
      '   AND dr.decl_id = :ID'
      
        '   AND (decode(p_params.CustomLevel, 2, 1, dr.SUMMA) > 0 OR rc.c' +
        'ustoms_code_new = p_params.CustomCode)'
      '   AND kbk.id = dr.KBKCODE_ID')
    SourceServerObject = 'FDC_DEDUCTION_REUSE_LST'
    ParamData = <
      item
        DataType = ftInteger
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
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataPAYMENT_DOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'PAYMENT_DOC_NUMBER'
      Size = 100
    end
    object dsDataPAYMENT_DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'PAYMENT_DOC_DATE'
    end
    object dsDataPAYMENT_TYPENAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'PAYMENT_TYPENAME'
      Size = 1500
    end
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataKBK_CODE: TStringField
      FieldName = 'KBK_CODE'
      Size = 1500
    end
    object dsDataKBK_NAME: TStringField
      FieldName = 'KBK_NAME'
      Size = 1500
    end
  end
  object qryAdd: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  :res := p_Reuse_Customs.AddDeduction('
      '      pDocID        => :doc_id'
      '     ,pPaymentDocID => :payment_id'
      '     ,pKbkID => :kbk_code_id'
      '     ,pAmount       => :amount'
      '    );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000005000000040000003A52455304000000000000000000000007000000
      3A444F435F49440400000000000000000000000B0000003A5041594D454E545F
      4944040000000000000000000000070000003A414D4F554E5404000000000000
      00000000000C0000003A4B424B5F434F44455F49440500000000000000000000
      00}
    Cursor = crSQLWait
    Left = 64
    Top = 182
  end
  object qryDel: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  p_Reuse_Customs.RemoveDeduction('
      '      pDocID       => :doc_id'
      '     ,pDeductionID => :id'
      '    );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000002000000070000003A444F435F494403000000000000000000000003
      0000003A4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 128
    Top = 182
  end
  object qryUpd: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  :res := p_Reuse_Customs.ModifyDeduction('
      '      pDocID       => :doc_id'
      '     ,pDeductionID => :id'
      '     ,pAmount      => :amount'
      '    );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000004000000070000003A444F435F494403000000000000000000000003
      0000003A4944030000000000000000000000070000003A414D4F554E54040000
      000000000000000000040000003A524553030000000000000000000000}
    Cursor = crSQLWait
    Left = 192
    Top = 182
  end
  object qryGetAvailableAmount: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      
        '  :res := p_payment_order.GetAvailSumma( pId => :payment_id ,pKb' +
        'kId => :KbkCode_Id);'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000003000000040000003A5245530400000000000000000000000B000000
      3A5041594D454E545F49440300000000000000000000000B0000003A4B424B43
      4F44455F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 389
    Top = 178
  end
end
