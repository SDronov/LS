inherited SelectAdviceReserveForDecForm: TSelectAdviceReserveForDecForm
  Left = 633
  Top = 416
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1091#1084#1084#1099' '#1074#1086#1079#1074#1088#1072#1090#1072
  ClientHeight = 309
  ClientWidth = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 567
    Height = 309
    inherited btnCancel: TcxButton
      Left = 483
      Top = 277
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 402
      Top = 277
      TabOrder = 1
    end
    object grdReserve: TcxGrid [2]
      Left = 9
      Top = 9
      Width = 414
      Height = 264
      Align = alClient
      TabOrder = 0
      object grdReserveDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = srcReserve
        DataController.KeyFieldNames = 'pk_col'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'AVAIL_SUMMA'
            Column = grdReserveDBTableView1AVAIL_SUMMA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = grdReserveDBTableView1SUMMA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object grdReserveDBTableView1PAYMENT_ID: TcxGridDBColumn
          DataBinding.FieldName = 'PAYMENT_ID'
          Visible = False
        end
        object grdReserveDBTableView1NAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087'/'#1087
          DataBinding.FieldName = 'NAME'
          Options.Editing = False
          Width = 171
        end
        object grdReserveDBTableView1KBK: TcxGridDBColumn
          DataBinding.FieldName = 'KBK'
          Options.Editing = False
          Width = 183
        end
        object grdReserveDBTableView1PO_SYSNAME: TcxGridDBColumn
          DataBinding.FieldName = 'PO_SYSNAME'
          Visible = False
        end
        object grdReserveDBTableView1AVAIL_SUMMA: TcxGridDBColumn
          Caption = #1044#1086#1089#1090#1091#1087#1085#1072#1103' '#1089#1091#1084#1084#1072
          DataBinding.FieldName = 'AVAIL_SUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Options.Editing = False
          Width = 95
        end
        object grdReserveDBTableView1SUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
          DataBinding.FieldName = 'SUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.Nullable = False
          Properties.OnValidate = grdReserveDBTableView1SUMMAPropertiesValidate
          Width = 98
        end
      end
      object grdReserveLevel1: TcxGridLevel
        GridView = grdReserveDBTableView1
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Control = grdReserve
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOk: TAction
      OnUpdate = actOkUpdate
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
  object dsReserve: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    Filtered = True
    ReadOnly = False
    SQL.Strings = (
      'SELECT to_char(t.payment_id) || n.code pk_col'
      '      ,t.payment_id'
      '      ,o.name'
      '      ,n.code kbk'
      '      ,o.typesysname AS po_sysname'
      '      ,SUM( t.summa ) AS avail_summa'
      '      ,SUM( t.summa ) AS summa'
      '  FROM fdc_advice_reserve_lst t'
      '      ,fdc_object_lst o'
      '      ,fdc_dict n'
      ' WHERE t.advice_id = :ADVICE_ID'
      '       AND t.edate IS NULL'
      '       AND t.is_ts = :IS_TS'
      '       AND o.id = t.payment_id'
      '       AND n.id = t.kbkcode_id'
      '       AND NOT EXISTS ( SELECT 1'
      '                          FROM fdc_value_lst v'
      
        '                         WHERE ( ( fdc_object_type_is_subtype( v' +
        '.OwnerTypeSysName, '#39'Decision'#39' ) = 1 ) '
      
        '                                  OR ( fdc_object_type_is_subtyp' +
        'e( v.OwnerTypeSysName, '#39'DecisionPayback'#39' ) = 1 ) '
      '                               )'
      '                               AND v.Ref_Object_ID = t.id )'
      ' GROUP BY t.payment_id'
      '         ,o.name'
      '         ,o.typesysname'
      '         ,n.code       '
      '                     '
      '                     '
      '/*select * from fdc_advice_lst  */                   ')
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ADVICE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IS_TS'
        ParamType = ptUnknown
      end>
    object dsReservePAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsReserveNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsReserveKBK: TStringField
      FieldName = 'KBK'
      Size = 1500
    end
    object dsReservePO_SYSNAME: TStringField
      FieldName = 'PO_SYSNAME'
      Size = 1500
    end
    object dsReserveAVAIL_SUMMA: TFloatField
      FieldName = 'AVAIL_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsReserveSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsReservepk_col: TStringField
      FieldName = 'pk_col'
      Size = 200
    end
  end
  object srcReserve: TDataSource
    DataSet = dsReserve
    Left = 88
    Top = 208
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 96
    Top = 140
    object sqlPrepareReserveList: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_advice.PrepareReserveList(pAdviceid => :ADVICE_ID);'
        'end;'
        '')
    end
    object sqlAddReserveRecord: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  -- Call the procedure'
        '  p_advice.AddReserveRecord( pPaymentId => :PAYMENT_ID'
        '                            ,pKBKCode => :KBK'
        '                            ,pSumma => :SUMMA);'
        'END;')
      DataSet = dsReserve
    end
  end
end
