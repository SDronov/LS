inherited ReestrSpecifyKindPayGridByReestrForm: TReestrSpecifyKindPayGridByReestrForm
  Left = 289
  Top = 251
  Width = 879
  Height = 422
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081'/'#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 370
    Width = 871
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 566
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 566
      end
      inherited pnlProgress: TPanel
        Width = 566
        inherited lblProgress: TcxLabel
          Width = 566
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 779
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 367
    Width = 871
  end
  inherited pnlWorkspace: TPanel
    Width = 871
    Height = 341
    inherited splSearchCriteria: TSplitter
      Height = 341
    end
    inherited pnlSearchCriteria: TPanel
      Height = 341
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 321
        inherited btnSearch: TcxButton
          Top = 290
          TabOrder = 6
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 261
          TabOrder = 5
        end
        object edtNO: TcxTextEdit [3]
          Left = 52
          Top = 48
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 139
        end
        object edtFrom: TcxDateEdit [4]
          Left = 52
          Top = 72
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 139
        end
        object edtTO: TcxDateEdit [5]
          Left = 52
          Top = 96
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 139
        end
        object edtCODE: TcxTextEdit [6]
          Left = 52
          Top = 120
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 139
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1053#1086#1084#1077#1088
            Control = edtNO
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1044#1072#1090#1072' '#1089
            Control = edtFrom
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [3]
            Caption = #1044#1072#1090#1072' '#1087#1086
            Control = edtTO
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [4]
            Caption = #1042#1072#1083#1102#1090#1072
            Control = edtCODE
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 666
      Height = 341
      inherited grdData: TcxGrid
        Width = 666
        Height = 341
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewTOTAL_SUMM
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn [3]
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 157
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn [4]
            Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
            DataBinding.FieldName = 'DOC_DATE'
            Width = 101
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 300
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn [6]
            Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
            DataBinding.FieldName = 'DATE_SEND'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY: TcxGridDBBandedColumn [7]
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCY'
            Visible = False
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTOTAL_SUMM: TcxGridDBBandedColumn [8]
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'TOTAL_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_CONFIRM: TcxGridDBBandedColumn [9]
            Caption = #1044#1072#1090#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'DATE_CONFIRM'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn [10]
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn [11]
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn [12]
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_LOAD: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
            DataBinding.FieldName = 'DATE_LOAD'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1057#1086#1102#1079#1072
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'/'#1076#1086#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1077#1089#1090#1088
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'/'#1076#1086#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1077#1089#1090#1088
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
    object CustomdxBarCombo1: TCustomdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Width = 100
    end
    object dxBarComboShow: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Description = #1055#1086#1082#1072#1079#1072#1090#1100
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Text = #1042#1089#1077
      ShowCaption = True
      Width = 140
      Items.Strings = (
        #1042#1089#1077
        #1055#1088#1080#1085#1103#1090#1099#1077
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
        #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1077)
      ItemIndex = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarEdit1: TdxBarEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object BarBtnPrint: TdxBarButton
      Align = iaRight
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1086#1074
      Category = 0
      Enabled = False
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1086#1074
      Visible = ivAlways
      PaintStyle = psCaption
    end
    object dxbcTO: TdxBarCombo
      Caption = #1058#1054
      Category = 2
      Hint = #1058#1054
      Visible = ivAlways
      ShowCaption = True
      Width = 150
      ItemIndex = -1
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select a.*'
      '      ,fdc_skindpay_get_total_summa(a.id) total_summa'
      
        '      ,(case when (a.ext_source != p_params.softcustomscode) the' +
        'n trunc(a.recieve_date) else null end) date_load'
      'from ('
      'select t.*'
      'from fdc_rel_reestr_reestr_lst rel'
      '    ,fdc_reestr_specify_kindpay_lst t'
      'where rel.object_id = :reestr_id'
      '  and rel.rel_object_id = t.id'
      '  and (fdc_gr_select_budget = 1)'
      '  and (:Name is null or upper(t.NAME) like upper(:Name))'
      '  and (:DOC_NO is null or t.doc_number like :DOC_NO)'
      '  and (:CURR is null or t.currency like :CURR)'
      '  and (:FROM_DATE is null or t.doc_date >= :FROM_DATE)'
      '  and (:TO_DATE is null or t.doc_date <= :TO_DATE)'
      '  and (rownum <= :MaxRecordCount)'
      ') a')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'reestr_id'
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
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
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
    object dsDataDATE_INPUT: TDateTimeField
      FieldName = 'DATE_INPUT'
    end
    object dsDataDATE_SEND: TDateTimeField
      FieldName = 'DATE_SEND'
    end
    object dsDataTOTAL_SUMMA: TFloatField
      FieldName = 'TOTAL_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Size = 3
    end
    object dsDataDATE_CONFIRM: TDateTimeField
      FieldName = 'DATE_CONFIRM'
    end
    object dsDataSENDER_SOFT_CODE_ID: TFloatField
      FieldName = 'SENDER_SOFT_CODE_ID'
    end
    object dsDataSENDER_SOFT_NAME: TStringField
      FieldName = 'SENDER_SOFT_NAME'
      Size = 1500
    end
    object dsDataSENDER_SOFT_CODE: TStringField
      FieldName = 'SENDER_SOFT_CODE'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE_ID: TFloatField
      FieldName = 'RECEIVER_SOFT_CODE_ID'
    end
    object dsDataRECEIVER_SOFT_NAME: TStringField
      FieldName = 'RECEIVER_SOFT_NAME'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE: TStringField
      FieldName = 'RECEIVER_SOFT_CODE'
      Size = 1500
    end
    object dsDataIS_RECIEVED: TStringField
      FieldName = 'IS_RECIEVED'
      Size = 1
    end
    object dsDataRECIEVE_DATE: TDateTimeField
      FieldName = 'RECIEVE_DATE'
    end
    object dsDataDATE_LOAD: TDateTimeField
      FieldName = 'DATE_LOAD'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 2
    end
  end
  inherited srcData: TDataSource
    Top = 135
  end
  object qlSQLCursor: TQueryList
    Session = MainData.Session
    Left = 256
    Top = 176
    object sqlGetNoticeCurrency: TsqlOp
      SQL.Strings = (
        'select column_value currency_id'
        'from table(p_reestr_noticespecifykindpay.get_currency_list)')
    end
    object sqlGetConfirmCurrency: TsqlOp
      SQL.Strings = (
        'select column_value currency_id'
        'from table(p_reestr_confirmspecifykindpay.get_currency_list)')
    end
    object sqlGetCNoticeCurrency: TsqlOp
      SQL.Strings = (
        'select column_value currency_id'
        'from table(p_reestr_cnoticespecifykindpay.get_currency_list)')
    end
  end
  object qlSQLResult: TQueryList
    Session = MainData.Session
    Left = 320
    Top = 176
    object sqlGetReestrNotice: TsqlOp
      SQL.Strings = (
        'begin'
        '  :ispresent := p_reestr_noticespecifykindpay.ispresent'
        '    ('
        '      pcurrency_id    => :pcurrency_id'
        '     ,pstatus_sysname => :pstatus_sysname'
        '    );'
        'end;')
    end
    object sqlGetReestrConfirm: TsqlOp
      SQL.Strings = (
        'begin'
        '  :ispresent := p_reestr_confirmspecifykindpay.ispresent'
        '    ('
        '      pcurrency_id    => :pcurrency_id'
        '     ,pstatus_sysname => :pstatus_sysname'
        '    );'
        'end;')
    end
    object sqlGetReestrNoticeBuild: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  p_reestr_noticespecifykindpay.build_reestr(pcurrency_id => :pc' +
          'urrency_id);'
        'end;')
    end
    object sqlGetReestrConfirmBuild: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  p_reestr_confirmspecifykindpay.build_reestr(pcurrency_id => :p' +
          'currency_id);'
        'end;')
    end
    object sqlGetReestrCNotice: TsqlOp
      SQL.Strings = (
        'begin'
        '  :ispresent := p_reestr_cnoticespecifykindpay.ispresent'
        '    ('
        '      pcurrency_id    => :pcurrency_id'
        '     ,pstatus_sysname => :pstatus_sysname'
        '    );'
        'end;')
    end
    object sqlGetReestrCNoticeBuild: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  p_reestr_cnoticespecifykindpay.build_reestr(pcurrency_id => :p' +
          'currency_id);'
        'end;')
    end
    object sqlGet_is_present_deduct_not_active: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  :pis_present_deduct_not_active := p_reestr_noticespecifykindpa' +
          'y.is_present_deduct_not_active;'
        '  if (:pis_present_deduct_not_active = 0) then'
        
          '    :pis_present_deduct_not_active := p_reestr_confirmspecifykin' +
          'dpay.is_present_deduct_not_active;'
        '    if (:pis_present_deduct_not_active = 0) then'
        
          '      :pis_present_deduct_not_active := p_reestr_cnoticespecifyk' +
          'indpay.is_present_deduct_not_active;'
        '    end if;'
        '  end if;'
        'end;')
    end
  end
end
