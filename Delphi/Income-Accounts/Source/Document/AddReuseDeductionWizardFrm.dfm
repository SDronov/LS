inherited AddReuseDeductionWizardForm: TAddReuseDeductionWizardForm
  Left = 261
  Top = 136
  Width = 578
  Height = 452
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1074' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1084#1077#1078#1076#1091' '#1058#1054
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 476
    Height = 418
    inherited btnCancel: TcxButton
      Left = 392
      Top = 386
    end
    inherited btnOk: TcxButton
      Left = 311
      Top = 386
    end
    inherited btnPrev: TcxButton
      Left = 149
      Top = 386
    end
    inherited btnNext: TcxButton
      Left = 230
      Top = 386
    end
    inherited PageControl: TcxPageControl
      Width = 330
      Height = 249
      ClientRectBottom = 245
      ClientRectRight = 326
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 324
          Height = 223
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            AutoSize = False
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1083#1072#1090#1105#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1073#1091#1076#1077#1090' '#1089#1087#1080#1089#1072#1085#1072' '#1089#1091#1084#1084#1072
            Style.IsFontAssigned = True
            Height = 37
            Width = 308
          end
          object cxGrid1: TcxGrid [2]
            Left = 9
            Top = 78
            Width = 250
            Height = 200
            TabOrder = 2
            object cxGrid1DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid1DBTableView1DblClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsPayments
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object cxGrid1DBTableView1DOC_TYPE_NAME: TcxGridDBColumn
                DataBinding.FieldName = 'DOC_TYPE_NAME'
                Width = 150
              end
              object cxGrid1DBTableView1DOC_NUMBER: TcxGridDBColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Width = 150
              end
              object cxGrid1DBTableView1DOC_DATE: TcxGridDBColumn
                DataBinding.FieldName = 'DOC_DATE'
              end
              object cxGrid1DBTableView1DOC_SUMMA: TcxGridDBColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Options.Grouping = False
                Width = 90
              end
              object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Options.Grouping = False
                Width = 90
              end
              object cxGrid1DBTableView1AVAILABLE_AMOUNT: TcxGridDBColumn
                Caption = #1054#1073#1097#1080#1081' '#1076#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
                DataBinding.FieldName = 'AVAILABLE_AMOUNT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Options.Grouping = False
                Width = 90
              end
              object cxGrid1DBTableView1IS_TS: TcxGridDBColumn
                DataBinding.FieldName = 'IS_TS'
                Visible = False
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            inherited dxLayoutControl2Item2: TdxLayoutItem
              ControlOptions.AutoColor = True
            end
            object dxLayoutControl2Item1: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = 'cxGrid1'
              ShowCaption = False
              Control = cxGrid1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabKBKs: TcxTabSheet
        Caption = 'tabKBKs'
        ImageIndex = 2
        DesignSize = (
          324
          223)
        object cxLabel4: TcxLabel
          Left = 9
          Top = 9
          Caption = #1042#1099#1073#1086#1088' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1050#1041#1050
          ParentColor = False
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 9
          Top = 35
          AutoSize = False
          Caption = 
            #1042#1099#1073#1077#1088#1080#1090#1077' '#1074' '#1089#1087#1080#1089#1082#1077' '#1050#1041#1050', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1073#1091#1076#1077#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1086' '#1089#1087#1080#1089#1072#1085#1080#1077'. '#1044#1083#1103' ' +
            #1074#1099#1073#1086#1088#1072' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1089#1090#1088#1086#1082' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1082#1083#1072#1074#1080#1096#1091' Ctrl'
          ParentColor = False
          ParentFont = False
          Properties.WordWrap = True
          Style.BorderStyle = ebsNone
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
          Height = 46
          Width = 308
        end
        object cxGrid2: TcxGrid
          Left = 9
          Top = 88
          Width = 303
          Height = 183
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          object cxGrid2DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid1DBTableView1DblClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsKbks
            DataController.KeyFieldNames = 'KBK_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.GroupByBox = False
            object cxGrid2DBTableView1PAYMENT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'PAYMENT_ID'
              Visible = False
            end
            object cxGrid2DBTableView1KBK_ID: TcxGridDBColumn
              DataBinding.FieldName = 'KBK_ID'
              Visible = False
            end
            object cxGrid2DBTableView1KBK_NAME: TcxGridDBColumn
              Caption = #1050#1041#1050
              DataBinding.FieldName = 'KBK_NAME'
              Width = 223
            end
            object cxGrid2DBTableView1REST_MONEY: TcxGridDBColumn
              Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1089#1088#1077#1076#1089#1090#1074
              DataBinding.FieldName = 'REST_MONEY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Width = 110
            end
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBTableView1
          end
        end
      end
      object tabAmount: TcxTabSheet
        Caption = 'tabAmount'
        ImageIndex = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 324
          Height = 223
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object Label1: TLabel
            Left = 9
            Top = 35
            Width = 351
            Height = 13
            Caption = #1059#1082#1072#1078#1080#1090#1077' '#1089#1091#1084#1084#1091', '#1079#1072#1095#1080#1090#1099#1074#1072#1077#1084#1091#1102' '#1089' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            WordWrap = True
          end
          object cxLabel3: TcxLabel
            Left = 9
            Top = 9
            Caption = #1042#1074#1086#1076' '#1089#1091#1084#1084#1099' '#1076#1083#1103' '#1079#1072#1095#1105#1090#1072' '#1084#1077#1078#1076#1091' '#1058#1054
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 124
            Top = 85
            DataBinding.DataField = 'KBK_NAME'
            DataBinding.DataSource = dsKbks
            Enabled = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 1
            Width = 223
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 124
            Top = 112
            DataBinding.DataField = 'DOC_NUMBER'
            DataBinding.DataSource = dsPayments
            Enabled = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 2
            Width = 181
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 124
            Top = 139
            DataBinding.DataField = 'DOC_DATE'
            DataBinding.DataSource = dsPayments
            Enabled = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 3
            Width = 311
          end
          object cxRestAmountEdit: TcxDBCurrencyEdit
            Left = 124
            Top = 166
            DataBinding.DataField = 'REST_MONEY'
            DataBinding.DataSource = dsKbks
            ParentFont = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 4
            Width = 121
          end
          object edtReuseAmount: TcxCurrencyEdit
            Left = 102
            Top = 206
            EditValue = 0c
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.UseThousandSeparator = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.Shadow = False
            Style.IsFontAssigned = True
            TabOrder = 5
            Width = 321
          end
          object dxLayoutGroup3: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl3Group3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object dxLayoutItem2: TdxLayoutItem
                Caption = 'cxLabel1'
                ShowCaption = False
                Control = cxLabel3
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl3Item1: TdxLayoutItem
                ShowCaption = False
                Control = Label1
                ControlOptions.AutoColor = True
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl3Group1: TdxLayoutGroup
                Caption = #1044#1086#1082#1091#1084#1077#1085#1090
                object dxLayoutControl3Item6: TdxLayoutItem
                  Caption = #1050#1041#1050
                  Enabled = False
                  Control = cxDBTextEdit3
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl3Item2: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088
                  Enabled = False
                  Control = cxDBTextEdit1
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl3Item3: TdxLayoutItem
                  Caption = #1044#1072#1090#1072
                  Enabled = False
                  Control = cxDBDateEdit1
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl3Item7: TdxLayoutItem
                  Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
                  Control = cxRestAmountEdit
                  ControlOptions.ShowBorder = False
                end
              end
            end
            object dxLayoutControl3Item8: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072' '#1076#1083#1103' '#1079#1072#1095#1105#1090#1072
              Control = edtReuseAmount
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 418
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
  object dsetPayments: TOracleDataSet
    SQL.Strings = (
      'SELECT po.ID'
      '      ,po.TypeName AS doc_type_name'
      '      ,po.doc_number'
      '      ,po.doc_date'
      '      ,po.doc_summa'
      '      ,po.summa'
      '--      ,rest_summa - locked_summa AS available_amount'
      '--      ,rest_summa - locked_summa AS reuse_amount'
      '      ,(( SELECT nvl(SUM(r.reg_sum), 0)'
      '           FROM fdc_rest_reg r'
      '           WHERE r.payment_id = po.id '
      
        '             AND p_nsi_kbk.IsKbkTS(r.kbk) = p_document.IsTS(:Doc' +
        '_Id)'
      '           )'
      '           -               '
      '       (SELECT nvl(SUM(t.summa), 0)'
      '          FROM fdc_reserved_payment t'
      '         WHERE t.payment_id = po.id'
      '           AND t.edate IS NULL'
      
        '           AND p_nsi_kbk.IsKbkTS(t.kbkcode_id) = p_document.IsTS' +
        '(:Doc_Id)'
      '           )) as available_amount      '
      '      ,(( SELECT nvl(SUM(r.reg_sum), 0)'
      '           FROM fdc_rest_reg r'
      '           WHERE r.payment_id = po.id '
      
        '             AND p_nsi_kbk.IsKbkTS(r.kbk) = p_document.IsTS(:Doc' +
        '_Id)'
      '           )'
      '           -               '
      '       (SELECT nvl(SUM(t.summa), 0)'
      '          FROM fdc_reserved_payment t'
      '         WHERE t.payment_id = po.id'
      '           AND t.edate IS NULL'
      
        '           AND p_nsi_kbk.IsKbkTS(t.kbkcode_id) = p_document.IsTS' +
        '(:Doc_Id)'
      '           )) as reuse_amount      '
      '       ,po.is_ts'
      '  FROM'
      '      fdc_doc_reuse_customs_lst dr,'
      '      fdc_SubjectByLs_lst sl,'
      '      fdc_po_credit_lst po'
      '  WHERE    -- '#1080#1089#1082#1083#1102#1095#1080#1090#1100' '#1087#1083#1072#1090#1077#1078#1080' '#1074' '#1073#1102#1076#1078#1077#1090
      '      NOT EXISTS ( SELECT 0'
      '                    FROM fdc_payment_order_payback pop'
      '                    WHERE po.ID = pop.ID)'
      '  AND dr.id = :Doc_Id'
      '  AND sl.parent_id = dr.subject_id'
      '  AND po.payer_id = sl.id'
      
        '  AND po.CURRENCY_ID = ( SELECT currency_id FROM fdc_doc_reuse_c' +
        'ustoms_lst WHERE id = :doc_id )'
      ' -- AND rest_summa - locked_summa > 0'
      '  AND (( SELECT nvl(SUM(r.reg_sum), 0)'
      '           FROM fdc_rest_reg r'
      '           WHERE r.payment_id = po.id '
      
        '             AND p_nsi_kbk.IsKbkTS(r.kbk) = p_document.IsTS(:Doc' +
        '_Id)'
      '           )'
      '           -               '
      '       (SELECT nvl(SUM(t.summa), 0)'
      '          FROM fdc_reserved_payment t'
      '         WHERE t.payment_id = po.id'
      '           AND t.edate IS NULL'
      
        '           AND p_nsi_kbk.IsKbkTS(t.kbkcode_id) = p_document.IsTS' +
        '(:Doc_Id)'
      '           ))>0  '
      
        '  AND (doc_no2 is not null and doc_date2 is not null) -- '#1090#1086#1083#1100#1082#1086' ' +
        #1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1077' '#1087#1076
      
        '  and po.typesysname not in ('#39'PaymentOrderConfirm'#39') -- '#1080#1089#1082#1083#1102#1095#1080#1090#1100 +
        ' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1083#1072#1090#1105#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090)
    Variables.Data = {0300000001000000070000003A444F435F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000200000049440100000000000D000000444F435F54595045
      5F4E414D450100000000000A000000444F435F4E554D42455201000000000008
      000000444F435F4441544501000000000009000000444F435F53554D4D410100
      000000000500000053554D4D4101000000000010000000415641494C41424C45
      5F414D4F554E540100000000000C00000052455553455F414D4F554E54010000
      000000}
    Cursor = crSQLWait
    OnApplyRecord = dsetPaymentsApplyRecord
    Session = MainData.Session
    Left = 40
    Top = 200
    object dsetPaymentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetPaymentsDOC_TYPE_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_TYPE_NAME'
      Required = True
      Size = 1500
    end
    object dsetPaymentsDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetPaymentsDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
      Required = True
    end
    object dsetPaymentsDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'DOC_SUMMA'
      Required = True
    end
    object dsetPaymentsSUMMA: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1091#1087#1080#1074#1096#1072#1103' '#1089#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsetPaymentsAVAILABLE_AMOUNT: TFloatField
      DisplayLabel = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'AVAILABLE_AMOUNT'
    end
    object dsetPaymentsREUSE_AMOUNT: TFloatField
      FieldName = 'REUSE_AMOUNT'
    end
    object dsetPaymentsIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  object dsPayments: TDataSource
    AutoEdit = False
    DataSet = dsetPayments
    Left = 40
    Top = 256
  end
  object dsetKbks: TOracleDataSet
    SQL.Strings = (
      'select'
      '  r.payment_id'
      ' ,MIN( k.id ) as kbk_id'
      ' ,k.code as kbk_name'
      ' ,p_Payment_Order.GetRestMoneyByKBK(r.payment_id, r.kbk)'
      
        ' -p_Payment_Order.getlockedsummabykbk(r.payment_id, r.kbk) as re' +
        'st_money'
      'from'
      '  fdc_rest_reg r,'
      '  fdc_kbk_dict_lst k'
      'where r.payment_id = :payment_id'
      '  and k.code = r.kbk'
      '  and p_nsi_kbk.IsKbkTS(r.kbk) = p_document.IsTS(:doc_id)'
      '  and sysdate between k.sdate and nvl(k.edate, sysdate + 1)'
      'GROUP BY r.payment_id, k.code, r.kbk'
      '/*select'
      '  r.payment_id'
      ' ,MIN( k.id ) as kbk_id'
      ' ,k.code as kbk_name'
      ' ,p_Payment_Order.GetRestMoneyByKBK(r.payment_id, r.kbk)'
      
        ' -p_Payment_Order.getlockedsummabykbk(r.payment_id, r.kbk) as re' +
        'st_money'
      'from'
      '  fdc_rest_reg r,'
      '  fdc_kbk_dict_lst k'
      'where r.payment_id = :payment_id'
      '  and k.code = r.kbk'
      '  and p_nsi_kbk.'
      '  and sysdate between k.sdate and nvl(k.edate, sysdate + 1)'
      'GROUP BY r.payment_id, k.code, r.kbk  */')
    Variables.Data = {
      03000000020000000B0000003A5041594D454E545F4944030000000000000000
      000000070000003A444F435F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A0000005041594D454E545F494401000000000006000000
      4B424B5F4944010000000000080000004B424B5F4E414D450100000000000A00
      0000524553545F4D4F4E4559010000000000}
    Cursor = crSQLWait
    OnApplyRecord = dsetPaymentsApplyRecord
    Session = MainData.Session
    Left = 368
    Top = 176
    object dsetKbksPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
      Required = True
    end
    object dsetKbksKBK_ID: TFloatField
      FieldName = 'KBK_ID'
      Required = True
    end
    object dsetKbksKBK_NAME: TStringField
      FieldName = 'KBK_NAME'
      Size = 1500
    end
    object dsetKbksREST_MONEY: TFloatField
      FieldName = 'REST_MONEY'
    end
  end
  object dsKbks: TDataSource
    AutoEdit = False
    DataSet = dsetKbks
    Left = 368
    Top = 232
  end
end
