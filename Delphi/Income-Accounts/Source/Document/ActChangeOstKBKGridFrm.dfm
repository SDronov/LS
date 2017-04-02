inherited ActChangeOstKBKGridForm: TActChangeOstKBKGridForm
  Left = 255
  Top = 260
  Width = 892
  Height = 480
  Caption = #1040#1082#1090#1099' '#1086' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1089' '#1079#1072#1082#1088#1099#1090#1099#1093' '#1050#1041#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 417
    Width = 876
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 573
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 573
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 573
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 573
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 783
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 414
    Width = 876
  end
  inherited pnlWorkspace: TPanel
    Width = 876
    Height = 386
    inherited splSearchCriteria: TSplitter
      Height = 386
    end
    inherited pnlSearchCriteria: TPanel
      Height = 386
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 366
        inherited edtName: TcxTextEdit
          Width = 182
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
      Width = 671
      Height = 386
      inherited grdData: TcxGrid
        Width = 671
        Height = 386
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              FieldName = 'SUMMA'
              Column = grdDataDBBandedTableViewSUMMA
            end>
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 3
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          object grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
            DataBinding.FieldName = 'SIGN_DATE'
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCYCODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCYCODE'
            Width = 43
            Position.BandIndex = 1
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
      'SELECT a.*'
      '      ,c.code  AS CurrencyCode'
      '  FROM FDC_ACT_CHANGE_OST_KBK_LST a'
      '      ,fdc_nsi_currency_lst  c'
      
        ' WHERE (:Name          IS NULL OR UPPER( a.name       ) LIKE UPP' +
        'ER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( a.doc_number ) LIKE UPP' +
        'ER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR doc_date >= :doc_date_from    ' +
        '   )'
      
        '   AND (:doc_date_to   IS NULL OR doc_date <= :doc_date_to      ' +
        '   )'
      
        '   AND (:is_active     IS NULL OR is_active = :is_active        ' +
        '   )'
      
        '   AND (:act_date_from IS NULL OR activation_date >= :act_date_f' +
        'rom)'
      
        '   AND (:act_date_to   IS NULL OR activation_date <= :act_date_t' +
        'o  )'
      '   AND c.ID (+) = a.CURRENCY_ID'
      '')
    SourceServerObject = 'FDC_ACT_CHANGE_OST_KBK_LST'
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsDataSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCURRENCYCODE: TStringField
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
  end
  object dsCurrency: TOracleDataSet
    SQL.Strings = (
      'select distinct po.currency_id'
      '               ,po.curr_code'
      '  from fdc_po_change_kbk_lst po'
      ' where trunc( sysdate ) between po.date_begin'
      
        '                            and NVL( po.date_end, trunc( sysdate' +
        ' ) )'
      ''
      '/*select distinct po.currency_id'
      '              , n.code curr_code'
      '                from fdc_change_kbk_lst_acting c,'
      '                     fdc_po_lst po,'
      '                     fdc_nsi_currency_lst n,'
      '                     fdc_rest_reg rr'
      '                where rr.reg_sum > 0  -- '#1086#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1050#1041#1050
      
        '                  and trunc(sysdate) between c.date_begin and nv' +
        'l(c.date_end,trunc(sysdate)+1) -- '#1090#1077#1082#1091#1097#1072#1103' '#1076#1072#1090#1072' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077' '#1076#1072#1090' '#1087 +
        #1072#1088#1099' '#1050#1041#1050
      '                  and rr.payment_id = po.id'
      
        '                  and c.from_kbkcode = rr.KBK                 --' +
        ' '#1050#1041#1050' '#1087#1083#1072#1090#1077#1078#1082#1080' '#1089#1086#1086#1090#1074' <'#1050#1041#1050' '#1089'> '#1087#1072#1088#1099' '#1050#1041#1050
      
        '                  and (po.DestCustomsCode = p_params.CustomCode ' +
        '-- '#1090#1086#1083#1100#1082#1086' '#1089#1074#1086#1080' '#1087#1083#1072#1090#1077#1078#1082#1080
      
        '                       or po.TypeSYSNAME = '#39'PaymentOrderReuse'#39'  ' +
        '-- '#1080#1083#1080' '#1087#1077#1088#1077#1079#1072#1095#1077#1090#1085#1072#1103' '#1087#1083#1072#1090#1077#1078#1082#1072
      
        '                       or p_params.CustomLevel in (2,3,4)       ' +
        '-- '#1080#1083#1080' '#1091#1088#1086#1074#1077#1085#1100' '#1090#1072#1084#1086#1078#1085#1080' '#1080#1083#1080' '#1050#1053#1055
      '                       )'
      '                  AND n.id (+) = po.currency_id'
      
        '                  and (p_params.CustomLevel in (3,4) and po.VAL_' +
        'Payment_Reason = '#39#1050#1055#39
      
        '                       or p_params.CustomLevel in (0,1,2) and (p' +
        'o.VAL_Payment_Reason != '#39#1050#1055#39' or po.VAL_Payment_Reason is null)) ' +
        '-- '#1090#1080#1087' '#1050#1055
      
        '                  and po.TypeSYSNAME not in ('#39'PaymentOrderNonIDD' +
        'est'#39
      
        '                                            ,'#39'PaymentOrderNonIDK' +
        'BK'#39')  -- '#1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1087#1086' '#1050#1041#1050' '#1080' '#1087#1086' '#1058#1054' '#1080#1089#1082#1083#1102#1095#1072#1077#1084
      
        '                  and (select SUM(reg_sum) from fdc_rest_reg whe' +
        're payment_id = po.ID) = rr.reg_sum'
      
        '                  -- '#1085#1077#1090' '#1083#1080' '#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072' '#1087'/'#1087' '#1087#1086' '#1082#1072#1082#1086#1084#1091'-'#1083#1080#1073#1086 +
        ' '#1072#1082#1090#1091' '#1089' '#1090#1086#1081' '#1078#1077' '#1087#1072#1088#1086#1081' '#1050#1041#1050
      
        '                  and not exists (select 1 from fdc_reserved_pay' +
        'ment_lst r1'
      
        '                                              , fdc_act_change_o' +
        'st_kbk a1'
      
        '                                          where r1.doc_id = a1.i' +
        'd                       -- '#1082#1086#1076' '#1072#1082#1090#1072
      
        '                                                and r1.payment_i' +
        'd = rr.payment_id        -- '#1082#1086#1076' '#1087#1083#1072#1090#1077#1078#1082#1080
      
        '                                                and r1.kbkcode =' +
        ' c.from_kbkcode'
      
        '                                                and r1.edate is ' +
        'null'
      '                                 )*/'
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B00000043555252454E43595F4944010000000000090000
      00435552525F434F4445010000000000}
    Session = MainData.Session
    Left = 301
    Top = 147
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 229
    Top = 146
    object sqlGetActChangeKBK: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT a.Id, a.DOC_NUMBER, a.DOC_DATE, a.STATE_ID'
        '    INTO :result, :doc_number, :doc_date, :state_id'
        '    FROM fdc_act_change_ost_kbk_lst a'
        
          '   WHERE a.STATE_ID    = fdc_object_get_bysysname('#39'State'#39', '#39'Stat' +
          'e.ActChangeOstKBK.Created'#39')'
        '     AND a.CURRENCY_ID = :CURRENCY_ID'
        '--     AND a.DOC_DATE = TRUNC(SYSDATE)'
        '     AND rownum < 2;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :result := -1;'
        'END;  ')
      DataSet = dsCurrency
    end
    object sqlCreateNewActChangeKBK: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  :result := p_act_change_ost_kbk.Add('
        '     pCurrencyId => :CURRENCY_ID'
        '    );'
        'END;')
      DataSet = dsCurrency
    end
    object sqlGetRestrictChangeKBK: TsqlOp
      SQL.Strings = (
        'begin'
        '  select NVL(max(fdc_object_get_name(doc_id,0,0)),'#39'-'#39') '
        '  into :result'
        '  from'
        '  ( -- '#1074#1089#1077' '#1085#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1073#1083#1086#1082#1080#1088#1086#1082#1080' '#1090#1080#1087#1072' '#1061'   '
        '    select re.id, NVL(re.doc_id,-1) doc_id'
        '      from fdc_change_kbk_lst c,'
        '           fdc_reserved_payment_lst re '
        '     where c.from_kbkcode = re.KBKCODE'
        
          '           and trunc(sysdate) between c.date_begin and nvl(c.dat' +
          'e_end,trunc(sysdate)+1)'
        '           and re.CURRENCY_ID = :CURRENCY_ID'
        '           and re.reason_code = '#39'X'#39
        '           and re.edate is null'
        
          '--           and trunc(sysdate) between re.bdate and nvl(re.edat' +
          'e,trunc(sysdate)+1)'
        '    minus -- '#1074#1089#1077' '#1085#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080' > 3 '#1083#1077#1090
        '    select re.id, NVL(re.doc_id,-1) doc_id'
        '      from fdc_change_kbk_lst c,'
        '           fdc_reserved_payment_lst re '
        '     where c.from_kbkcode = RE.KBKCODE'
        
          '           and trunc(sysdate) between c.date_begin and nvl(c.dat' +
          'e_end,trunc(sysdate)+1)'
        '           and re.CURRENCY_ID = :CURRENCY_ID'
        '           and re.reason_code = '#39'X'#39
        '           and RE.TYPESYSNAME = '#39'ReservedPayment.3Year'#39
        '           and re.edate is null'
        
          '--           and trunc(sysdate) between re.bdate and nvl(re.edat' +
          'e,trunc(sysdate)+1)'
        '    minus -- '#1074#1089#1077' '#1073#1083#1086#1082#1080#1088#1086#1082#1080' '#1085#1072' '#1072#1082#1090#1072#1093' '#1085#1072#1096#1077#1075#1086' '#1090#1080#1087#1072
        '    select re.id, NVL(re.doc_id,-1) doc_id'
        '      from fdc_change_kbk_lst c,'
        '           fdc_reserved_payment_lst re, '
        '           fdc_act_change_ost_kbk ac'
        '     where c.from_kbkcode = RE.KBKCODE'
        
          '           and trunc(sysdate) between c.date_begin and nvl(c.dat' +
          'e_end,trunc(sysdate)+1)'
        '           and re.CURRENCY_ID = :CURRENCY_ID'
        '           and re.reason_code = '#39'X'#39
        '           and ac.id = re.doc_id'
        '  );  '
        'end;'
        ''
        '/*select NVL(max(fdc_object_get_name(re.doc_id)),'#39'-'#39')'
        '    into :result'
        '    from fdc_change_kbk_lst c,'
        '         fdc_reserved_payment_lst re -- '#1088#1077#1079#1077#1088#1074#1099
        '   where c.from_kbkcode = RE.KBKCODE'
        
          '         and trunc(sysdate) between c.date_begin and nvl(c.date_' +
          'end,trunc(sysdate)+1)'
        '         and re.CURRENCY_ID = :CURRENCY_ID'
        '         and re.reason_code = '#39'X'#39
        
          '         and not exists (select 1 from fdc_act_change_ost_kbk ac' +
          ' where id = re.doc_id);*/')
      DataSet = dsCurrency
    end
    object sqlAddInActPays: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  p_act_change_ost_kbk.AddPays(pId => :ActId);'
        'END;')
    end
  end
end
