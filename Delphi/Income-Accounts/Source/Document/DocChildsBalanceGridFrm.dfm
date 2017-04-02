inherited DocChildsBalanceGridForm: TDocChildsBalanceGridForm
  Caption = #1041#1072#1083#1072#1085#1089#1099' '#1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1093' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1086#1088#1075#1072#1085#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 183
        end
        inherited edtDocDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtDocDateTo: TcxDateEdit
          Width = 121
        end
        inherited edtDocNumber: TcxMaskEdit
          Width = 121
        end
        inherited cbIsActive: TcxComboBox
          Width = 121
        end
        inherited edtActDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtActDateTo: TcxDateEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end
            item
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            end
            item
              Caption = #1041#1072#1083#1072#1085#1089
            end>
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 90
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_NAME'
            Width = 170
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 90
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_NAME'
            Width = 170
            Position.BandIndex = 2
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_FROM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_FROM'
            PropertiesClassName = 'TcxDateEditProperties'
            Options.IncSearch = False
            Position.BandIndex = 2
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_TO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_TO'
            PropertiesClassName = 'TcxDateEditProperties'
            Options.IncSearch = False
            Position.BandIndex = 2
            Position.ColIndex = 5
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
      'SELECT cb.*'
      '      ,c.code AS currency_code'
      '      ,c.name AS currency_name'
      '      ,cs.customs_code_8 AS customs_code'
      '      ,cs.name           AS customs_name'
      '  FROM fdc_doc_childs_balance_lst cb'
      
        '  LEFT OUTER JOIN fdc_nsi_currency_lst c  ON c.id  = cb.currency' +
        '_id'
      
        '  LEFT OUTER JOIN fdc_customs_lst      cs ON cs.id = cb.customs_' +
        'id'
      
        ' WHERE (:Name          IS NULL OR UPPER( cb.name       ) LIKE UP' +
        'PER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( cb.doc_number ) LIKE UP' +
        'PER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR cb.doc_date >= :doc_date_from ' +
        '      )'
      
        '   AND (:doc_date_to   IS NULL OR cb.doc_date <= :doc_date_to   ' +
        '      )'
      
        '   AND (:is_active     IS NULL OR cb.is_active = :is_active     ' +
        '      )'
      
        '   AND (:act_date_from IS NULL OR cb.activation_date >= :act_dat' +
        'e_from)'
      
        '   AND (:act_date_to   IS NULL OR cb.activation_date <= :act_dat' +
        'e_to  )')
    SourceServerObject = 'FDC_DOC_CHILDS_BALANCE_LST'
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDATE_FROM: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATE_FROM'
    end
    object dsDataDATE_TO: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATE_TO'
    end
    object dsDataCURRENCY_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataCURRENCY_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataCUSTOMS_NAME: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
  end
  object xmlBalance: TJvSimpleXML
    IndentString = '  '
    Options = [sxoAutoIndent]
    Left = 221
    Top = 178
  end
  object openDlgBalance: TJvOpenDialog
    DefaultExt = 'xml'
    Filter = 'XML-'#1092#1072#1081#1083#1099' (*.xml)|*.xml|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    FilterIndex = 0
    Title = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1086#1087#1077#1088#1072#1090#1080#1074#1085#1086#1075#1086' '#1073#1072#1083#1072#1085#1089#1072
    Height = 0
    Width = 0
    Left = 293
    Top = 178
  end
  object qryAddChildBalance: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  :id := p_Doc_Childs_Balance.ADD('
      '      pCustomsCode  => :customs_code'
      '     ,pCurrencyCode => :currency_code'
      '     ,pDateFrom     => to_date( :date_from, '#39'YYYY-MM-DD'#39' )'
      '     ,pDateTo       => to_date( :date_to,   '#39'YYYY-MM-DD'#39' )'
      '     ,pBalanceType  => :balance_type'
      '    );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000006000000030000003A49440400000000000000000000000D0000003A
      435553544F4D535F434F44450500000000000000000000000E0000003A435552
      52454E43595F434F44450500000000000000000000000A0000003A444154455F
      46524F4D050000000000000000000000080000003A444154455F544F05000000
      00000000000000000D0000003A42414C414E43455F5459504503000000000000
      0000000000}
    Cursor = crSQLWait
    Left = 229
    Top = 250
  end
  object qryAddTmpTransaction: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  FORALL i IN :idx_first .. :idx_last'
      
        '    INSERT INTO fdc_tmp_acc_trans ( account_code, currency_code,' +
        ' pay_type_code, kbk, is_debit, operation_date, operation_sum, ex' +
        'ch_rate, sum_rur, is_ts )'
      
        '      VALUES ( :account_code (i), :currency_code (i), :pay_type_' +
        'code (i), :kbk (i), :is_debit (i), :operation_date (i), :operati' +
        'on_sum (i), :exch_rate (i), :sum_rur (i), :is_ts (i));'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      030000000C0000000D0000003A4143434F554E545F434F444505000000000000
      0001000000F4010000100000000E0000003A43555252454E43595F434F444505
      0000000000000001000000F4010000030000000E0000003A5041595F54595045
      5F434F4445050000000000000001000000F401000004000000040000003A4B42
      4B050000000000000001000000F401000014000000090000003A49535F444542
      4954050000000000000001000000F4010000010000000F0000003A4F50455241
      54494F4E5F444154450C0000000000000001000000F4010000000000000E0000
      003A4F5045524154494F4E5F53554D040000000000000001000000F401000000
      0000000A0000003A455843485F52415445040000000000000001000000F40100
      0000000000080000003A53554D5F525552040000000000000001000000F40100
      00000000000A0000003A4944585F464952535403000000000000000000000009
      0000003A4944585F4C415354030000000000000000000000060000003A49535F
      5453050000000000000001000000F401000001000000}
    Cursor = crSQLWait
    Left = 229
    Top = 306
  end
  object qryDoLoad: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  p_Doc_Childs_Balance.DoLoad('
      '      pChildBalanceID => :child_balance_id'
      '     ,pErrReport      => :err_report'
      '    );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000002000000110000003A4348494C445F42414C414E43455F4944040000
      0000000000000000000B0000003A4552525F5245504F52547000000000000000
      00000000}
    Cursor = crSQLWait
    Left = 341
    Top = 250
  end
end
