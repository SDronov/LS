inherited AdviceByDecisionGridForm: TAdviceByDecisionGridForm
  Caption = 'AdviceByDecisionGridForm'
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
          object grdDataDBBandedTableViewADVICE_STATE: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1091#1089
            DataBinding.FieldName = 'ADVICE_STATE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_AVAIL: TcxGridDBBandedColumn
            Caption = #1044#1086#1089#1090#1091#1087#1085#1072#1103' '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA_AVAIL'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_REST: TcxGridDBBandedColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082
            DataBinding.FieldName = 'SUMMA_REST'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
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
    inherited actSearch: TAction
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select res.*'
      
        '      ,case when summa_rest = 0 then '#39#1047#1072#1082#1088#1099#1090#1086#39' else to_char(null' +
        ') end as advice_state'
      'from ('
      '      select ad.*'
      '            ,p_advice.getadvicesum( ad.id )      as summa'
      '            ,p_advice.getadviceavailsum( ad.id ) as summa_avail'
      '            ,p_advice.getadvicerestsum( ad.id )  as summa_rest'
      
        '            ,p_advice.getadvicesum( ad.id, '#39'Y'#39' )      as summa_t' +
        's'
      
        '            ,p_advice.getadviceavailsum( ad.id, '#39'Y'#39' ) as summa_t' +
        's_avail'
      
        '            ,p_advice.getadvicerestsum( ad.id, '#39'Y'#39' )  as summa_t' +
        's_rest'
      '      from ('
      '            select a.*'
      '            from fdc_advice_lst  a'
      '            where a.id in ('
      '                           select rt.object_id'
      '                           from fdc_rel_advice_dec_lst rt'
      '                           where rt.rel_object_id = :ID'
      '                          )'
      
        '              and (:Name          IS NULL OR UPPER( a.name ) LIK' +
        'E UPPER( :Name       ))'
      
        '              and (:doc_number    IS NULL OR UPPER( a.doc_number' +
        ' ) LIKE UPPER( :doc_number ))'
      
        '              and (:doc_date_from IS NULL OR a.doc_date >= :doc_' +
        'date_from       )'
      
        '              and (:doc_date_to   IS NULL OR a.doc_date <= :doc_' +
        'date_to         )'
      
        '              and (:is_active     IS NULL OR a.is_active = :is_a' +
        'ctive           )'
      
        '              and (:act_date_from IS NULL OR a.activation_date >' +
        '= :act_date_from)'
      
        '              and (:act_date_to   IS NULL OR a.activation_date <' +
        '= :act_date_to  )'
      '              and rownum <= :MaxRecordCount'
      '           ) ad'
      '     ) res')
    ParamData = <
      item
        DataType = ftFloat
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
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
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
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataCUSTOM_NAME: TStringField
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataSUMMA_AVAIL: TFloatField
      FieldName = 'SUMMA_AVAIL'
      DisplayFormat = ',0.00'
    end
    object dsDataSUMMA_REST: TFloatField
      FieldName = 'SUMMA_REST'
      DisplayFormat = ',0.00'
    end
    object dsDataSUMMA_TS: TFloatField
      FieldName = 'SUMMA_TS'
      DisplayFormat = ',0.00'
    end
    object dsDataSUMMA_TS_AVAIL: TFloatField
      FieldName = 'SUMMA_TS_AVAIL'
      DisplayFormat = ',0.00'
    end
    object dsDataSUMMA_TS_REST: TFloatField
      FieldName = 'SUMMA_TS_REST'
      DisplayFormat = ',0.00'
    end
    object dsDataADVICE_STATE: TStringField
      FieldName = 'ADVICE_STATE'
      Size = 7
    end
  end
end
