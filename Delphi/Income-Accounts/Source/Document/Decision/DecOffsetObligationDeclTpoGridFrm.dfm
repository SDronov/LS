inherited DecOffsetObligationDeclTpoGridForm: TDecOffsetObligationDeclTpoGridForm
  Caption = 'DecOffsetObligationDeclTpoGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
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
      Width = 275
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 275
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 275
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 275
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 485
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.KeyFieldNames = 'ID'
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #8470' '#1044#1058'/'#1058#1055#1054
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn [5]
            Visible = False
            Hidden = True
            Position.ColIndex = 0
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn [6]
            Caption = #1044#1072#1090#1072' '#1044#1058'/'#1058#1055#1054
            Position.ColIndex = 1
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
            DataBinding.FieldName = 'DECL_NAME'
            Width = 200
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object grdDataDBTableViewPay: TcxGridDBTableView [2]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcPays
          DataController.DetailKeyFieldNames = 'DECL_ID'
          DataController.KeyFieldNames = 'PAY_TYPE_CODE;PAY_SUMMA'
          DataController.MasterKeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBTableViewPayPAYABLE_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBTableViewPayPAY_SUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object grdDataDBTableViewPayDECL_ID: TcxGridDBColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Hidden = True
          end
          object grdDataDBTableViewPayPAY_TYPE_CODE: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 100
          end
          object grdDataDBTableViewPayPAYABLE_SUMMA: TcxGridDBColumn
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'PAYABLE_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 120
          end
          object grdDataDBTableViewPayPAY_SUMMA: TcxGridDBColumn
            Caption = #1047#1072#1095#1090#1077#1085#1086
            DataBinding.FieldName = 'PAY_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 120
          end
        end
        inherited grdDataLevel: TcxGridLevel
          object grdDataLevelPay: TcxGridLevel
            GridView = grdDataDBTableViewPay
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchOk: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchCancel: TAction
      Enabled = False
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
      'select decl.*'
      'from fdc_doc_charge_lst decl'
      'where decl.id in ('
      '                  select dtr.decl_id'
      '                  from fdc_decision_tmp_reserv_lst dtr'
      '                  where dtr.decision_id = :id'
      '                  union all'
      '                  select pd.decl_id'
      '                  from fdc_dec_offset_obligation_lst deco'
      '                      ,fdc_value_lst v'
      '                      ,fdc_payment_deduction_all_lst pd'
      '                  where deco.id = :id'
      '                    and v.owner_object_id = :id'
      '                    and deco.id = v.owner_object_id'
      '                    and v.ref_object_id = pd.id'
      '                 )')
    BeforeClose = dsDataBeforeClose
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCUSTOM_MODE_ID: TFloatField
      FieldName = 'CUSTOM_MODE_ID'
    end
    object dsDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsDataMODIFY_DATE: TDateTimeField
      FieldName = 'MODIFY_DATE'
    end
    object dsDataDECL_TYPESYSNAME: TStringField
      FieldName = 'DECL_TYPESYSNAME'
      Size = 1500
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCUSTOM_MODE_CODE: TStringField
      FieldName = 'CUSTOM_MODE_CODE'
      Size = 1500
    end
    object dsDataCUSTOM_MODE_NAME: TStringField
      FieldName = 'CUSTOM_MODE_NAME'
      Size = 1500
    end
    object dsDataDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
    end
    object dsDataAGGREMENT_ID: TFloatField
      FieldName = 'AGGREMENT_ID'
    end
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
  end
  object dsPays: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select dtr.decl_id'
      '      ,decl_doc.name decl_name'
      '      ,decl_doc.doc_date decl_date'
      '      ,dtr.pay_type_code'
      '      ,ch.summa payable_summa'
      '      ,dtr.summa pay_summa'
      'from fdc_decision_tmp_reserv_lst dtr'
      '    ,fdc_decl_charge_lst ch'
      '    ,fdc_document_lst decl_doc'
      'where dtr.decision_id = :id'
      '  and dtr.charge_id = ch.id'
      '  and dtr.decl_id = decl_doc.id'
      'union all'
      'select pd.decl_id'
      '      ,decl_doc.name decl_name'
      '      ,decl_doc.doc_date decl_date'
      '      ,pt.code  pay_type_code'
      '      ,ch.summa payable_summa'
      '      ,pd.summa pay_summa'
      'from fdc_dec_offset_obligation_lst deco'
      '    ,fdc_value_lst v'
      '    ,fdc_payment_deduction_lst pd'
      '    ,fdc_decl_charge_lst ch'
      '    ,fdc_payment_type_lst pt'
      '    ,fdc_document_lst decl_doc'
      'where deco.id = :id'
      '  and v.owner_object_id = :id'
      '  and deco.id = v.owner_object_id'
      '  and v.ref_object_id = pd.id'
      '  and pd.charge_id = ch.id'
      '  and pd.pay_type_id = pt.id'
      '  and pd.decl_id = decl_doc.id')
    BeforeOpen = dsPaysBeforeOpen
    Left = 104
    Top = 190
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsPaysDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsPaysPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsPaysPAYABLE_SUMMA: TFloatField
      FieldName = 'PAYABLE_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsPaysPAY_SUMMA: TFloatField
      FieldName = 'PAY_SUMMA'
      DisplayFormat = ',0.00'
      currency = True
    end
    object dsPaysDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsPaysDECL_DATE: TDateTimeField
      FieldName = 'DECL_DATE'
    end
  end
  object srcPays: TDataSource
    DataSet = dsPays
    Left = 104
    Top = 238
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 408
    Top = 62
    object qryDelReserve: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  -- Call the procedure'
        '  p_dec_offset_obligation.delpayreserve'
        '    ('
        '      pdecisionid   => :decision_id'
        '     ,pdeclid       => :decl_id'
        '    );'
        'END;')
    end
  end
end
