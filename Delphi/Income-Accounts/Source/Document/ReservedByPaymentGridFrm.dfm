inherited ReservedByPaymentGridForm: TReservedByPaymentGridForm
  Left = 316
  Top = 181
  Width = 881
  Height = 450
  Caption = 'ReservedByPaymentGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 387
    Width = 873
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 567
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 567
      end
      inherited pnlProgress: TPanel
        Width = 567
        inherited lblProgress: TcxLabel
          Width = 567
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 780
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 384
    Width = 873
  end
  inherited pnlWorkspace: TPanel
    Width = 873
    Height = 356
    inherited splSearchCriteria: TSplitter
      Height = 356
    end
    inherited pnlSearchCriteria: TPanel
      Height = 356
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 336
        inherited btnSearch: TcxButton
          Top = 304
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 668
      Height = 356
      inherited grdData: TcxGrid
        Width = 668
        Height = 356
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCellDblClick = grdDataDBBandedTableViewCellDblClick
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Visible = False
            Hidden = True
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'BDATE'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'EDATE'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Hidden = True
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn
            Caption = #1048#1085#1085
            DataBinding.FieldName = 'SUBJECT_INN'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'SUBJECT_KPP'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBKCODE'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn
            Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'DOC_NAME'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'TYPENAME'
            Visible = False
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'NOTE'
            Visible = False
            OnGetDisplayText = grdDataDBBandedTableViewNOTEGetDisplayText
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actUnLock: TAction
      Category = 'Data'
      Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actUnLockExecute
      OnUpdate = actUnLockUpdate
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
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = bcomboFiltr
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
      28
      0)
    object dxBarButton2: TdxBarButton
      Action = actUnLock
      Category = 0
    end
    object bcomboFiltr: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Description = #1055#1086#1082#1072#1079#1072#1090#1100
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Text = #1054#1090#1082#1088#1099#1090#1099#1077
      OnChange = bcomboFiltrChange
      Width = 100
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077
        #1054#1090#1082#1088#1099#1090#1099#1077
        #1047#1072#1082#1088#1099#1090#1099#1077)
      ItemIndex = 1
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select rp.id'
      '      ,rp.name'
      '      ,rp.shortname'
      '      ,rp.object_type_id'
      '      ,rp.state_id'
      '      ,rp.accesslevel'
      '      ,rp.sysname'
      '      ,rp.descript'
      '      ,rp.owner_object_id'
      '      ,rp.typename'
      '      ,rp.typesysname'
      '      ,rp.objectkindlist'
      '      ,rfd.reg_date as doc_date'
      '      ,rfd.decl_no  as doc_number'
      '      ,rp.is_active'
      '      ,rp.activation_date'
      '      ,rp.ext_source'
      '      ,rp.ext_typesysname'
      '      ,rp.ext_id'
      '      ,rp.payment_id'
      '      ,rp.summa'
      '      ,rp.payment_date'
      '      ,rp.reason_code'
      '      ,rp.doc_id'
      '      ,rp.doc_key'
      '      ,rp.bdate'
      '      ,rp.edate'
      '      ,rp.doc_name'
      '      ,rp.po_name'
      '      ,rp.po_no'
      '      ,rp.po_date'
      '      ,rp.currency_id'
      '      ,rp.curr_code'
      '      ,rp.payer_id'
      '      ,rp.po_typename'
      '      ,rp.kbkcode_id'
      '      ,rp.kbkcode'
      '      ,rp.is_ts'
      '      ,rfd.customs_code'
      '      ,rfd.reg_date'
      '      ,rfd.decl_no'
      '      ,rfd.subject_id'
      '      ,rfd.note'
      
        '      ,(case when (rfd.id is not null) then rfd.subject_name els' +
        'e s.name end) subject_name'
      
        '      ,(case when (rfd.id is not null) then rfd.subject_inn else' +
        ' s.inn end) subject_inn'
      
        '      ,(case when (rfd.id is not null) then rfd.subject_kpp else' +
        ' s.kpp end) subject_kpp'
      'from fdc_reserved_payment_lst rp'
      '    ,fdc_reserved_for_decl_lst rfd'
      '    ,fdc_subject_lst s'
      'where rp.payment_id=:ID'
      '  and rp.id = rfd.id(+)'
      '  and rp.payer_id = s.id(+)'
      '  and ('
      '          (:sign in (0,-1))'
      '          or'
      '          (:sign in (1) and rp.edate is null)'
      '          or'
      '          (:sign in (2) and rp.edate is not null)'
      '         )'
      '  and (rownum <= :MaxRecordCount)')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDataSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsDataOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsDataSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsDataACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsDataSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsDataDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsDataOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDataOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
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
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataREASON_CODE: TStringField
      FieldName = 'REASON_CODE'
      Size = 2
    end
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataDOC_KEY: TStringField
      FieldName = 'DOC_KEY'
      Size = 64
    end
    object dsDataBDATE: TDateTimeField
      FieldName = 'BDATE'
    end
    object dsDataEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
    object dsDataDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 1500
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 1500
    end
    object dsDataPO_NO: TStringField
      FieldName = 'PO_NO'
      Size = 100
    end
    object dsDataPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDataPO_TYPENAME: TStringField
      FieldName = 'PO_TYPENAME'
      Size = 1500
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
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
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 1000
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataSUBJECT_INN: TStringField
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 19
    Top = 108
    object sqlUnlock: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_payment_order.CancelReserve('
        '    :ID'
        '    );'
        'end;')
    end
  end
end
