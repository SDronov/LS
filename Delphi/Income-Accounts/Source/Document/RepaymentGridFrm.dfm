inherited RepaymentGridForm: TRepaymentGridForm
  Left = 153
  Top = 278
  Width = 851
  Caption = 'RepaymentGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 843
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 538
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 538
      end
      inherited pnlProgress: TPanel
        Width = 538
        inherited lblProgress: TcxLabel
          Width = 538
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 751
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 843
  end
  inherited pnlWorkspace: TPanel
    Width = 843
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 638
      inherited grdData: TcxGrid
        Width = 638
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            SortIndex = 0
            SortOrder = soAscending
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewDECL_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewGTD_NAME: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1044#1058
            DataBinding.FieldName = 'GTD_NAME'
            Width = 148
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
            DataBinding.FieldName = 'CURR_CODE'
            Width = 48
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1072#1083#1102#1090#1099
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Hidden = True
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAYMENT_CODE'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAYMENT_NAME'
            Visible = False
            Hidden = True
            Width = 159
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRATE: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1074#1082#1072' '#1082#1088#1077#1076#1080#1090#1072
            DataBinding.FieldName = 'RATE'
            Visible = False
            Hidden = True
            Width = 47
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPERCENTAGE: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1094#1077#1085#1090#1086#1074
            DataBinding.FieldName = 'PERCENTAGE'
            Visible = False
            Hidden = True
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREPAYMENT_PERIOD: TcxGridDBBandedColumn
            Caption = #1057#1088#1086#1082' '#1091#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'REPAYMENT_PERIOD'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_REPAYMENT_OR_DELAY: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_REPAYMENT_OR_DELAY'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_REPAYMENT_OR_DELAY_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_REPAYMENT_OR_DELAY_NAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEP_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEP_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEP_TYPE_NAME: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'DEP_TYPE_NAME'
            Width = 245
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
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
    object actMakePayment: TAction
      Category = 'Object'
      Caption = 'actMakePayment'
      OnExecute = actMakePaymentExecute
      OnUpdate = actMakePaymentUpdate
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
            Item = dxBarButton1
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
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Action = actMakePayment
      Caption = #1054#1087#1083#1072#1090#1080#1090#1100
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Filtered = True
    SQL.Strings = (
      'select *'
      '  from fdc_repayment_Lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and ((:DECL_ID is null  and SUBJECT_ID = :ID)  or (t.DECL_ID = :' +
        'DECL_ID))'
      '')
    OnFilterRecord = dsDataFilterRecord
    ParamData = <
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
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataGTD_NAME: TStringField
      FieldName = 'GTD_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataRATE: TFloatField
      FieldName = 'RATE'
    end
    object dsDataPERCENTAGE: TFloatField
      FieldName = 'PERCENTAGE'
    end
    object dsDataREPAYMENT_PERIOD: TDateTimeField
      FieldName = 'REPAYMENT_PERIOD'
    end
    object dsDataIS_REPAYMENT_OR_DELAY: TIntegerField
      FieldName = 'IS_REPAYMENT_OR_DELAY'
    end
    object dsDataIS_REPAYMENT_OR_DELAY_NAME: TStringField
      FieldName = 'IS_REPAYMENT_OR_DELAY_NAME'
      Size = 9
    end
    object dsDataDEP_TYPE_ID: TFloatField
      FieldName = 'DEP_TYPE_ID'
    end
    object dsDataDEP_TYPE_NAME: TStringField
      FieldName = 'DEP_TYPE_NAME'
      Size = 1500
    end
    object dsDataREST_SUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1086#1089#1085#1086#1074#1085#1086#1075#1086' '#1076#1086#1083#1075#1072
      FieldName = 'REST_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
      Visible = False
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Visible = False
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Visible = False
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Visible = False
      Size = 10
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 88
    Top = 182
    object sqlPreparePayments: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_payment_helper.prepare;'
        'end;')
    end
    object sqlAddCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_repayment_helper.addcharges(pdocid => :declid,'
        '                             ppaytypeid => :paytypeid,'
        '                             pcurrid => :currencyid,'
        '                             psumma => :TOTALSUMMA,'
        '                             todate => :TODATE,'
        '                             pRepayId => :REPAYID);'
        ''
        'end;'
        '')
      DataSet = dsData
    end
    object sqlFromDate: TsqlOp
      SQL.Strings = (
        'begin'
        ' :FROMDATE := p_repayment_helper.GetFromDate(:DECLID,:REPAYID);'
        'end;')
    end
  end
end
