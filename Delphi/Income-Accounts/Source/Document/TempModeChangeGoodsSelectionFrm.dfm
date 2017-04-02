inherited TempModeChangeGoodsSelectionForm: TTempModeChangeGoodsSelectionForm
  Left = 387
  Top = 244
  Caption = #1042#1099#1073#1086#1088' '#1090#1086#1074#1072#1088#1086#1074' '#1080' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
  ClientHeight = 327
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 327
    inherited btnCancel: TcxButton
      Top = 295
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Top = 295
      ModalResult = 0
      TabOrder = 1
    end
    object grdGoods: TcxGrid [2]
      Left = 9
      Top = 9
      Width = 421
      Height = 264
      Align = alClient
      TabOrder = 0
      object grdGoodsDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = srcGoods
        DataController.DetailKeyFieldNames = 'ID'
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object grdGoodsDBTableView1NO: TcxGridDBColumn
          Caption = #1085'/'#1087
          DataBinding.FieldName = 'NO'
          Width = 41
        end
        object grdGoodsDBTableView1GOODS_NAME: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
          DataBinding.FieldName = 'GOODS_NAME'
          Width = 221
        end
        object grdGoodsDBTableView1GOODS_COUNT: TcxGridDBColumn
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          DataBinding.FieldName = 'GOODS_COUNT'
          Width = 165
        end
        object grdGoodsDBTableView1GOODS_COUNT_SELECTED: TcxGridDBColumn
          Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1086' '#1074#1074#1086#1079#1080#1084#1086#1077' '#1082#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'GOODS_COUNT_SELECTED'
          Options.ShowEditButtons = isebAlways
          Width = 255
        end
      end
      object grdGoodsLevel1: TcxGridLevel
        GridView = grdGoodsDBTableView1
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Control = grdGoods
        ControlOptions.ShowBorder = False
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
  object srcGoods: TDataSource
    DataSet = dsGoods
    Left = 88
    Top = 288
  end
  object dsGoods: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    Filtered = True
    ReadOnly = False
    SQL.Strings = (
      'select t.*, t.goods_count as goods_count_selected'
      'from fdc_decl_goods_lst t'
      'where DECL_ID = :DECL_ID'
      'and t.goods_count > 0')
    Left = 56
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    object dsGoodsID: TFloatField
      FieldName = 'ID'
    end
    object dsGoodsGOODS_NAME: TStringField
      FieldName = 'GOODS_NAME'
      Size = 1500
    end
    object dsGoodsGOODS_COUNT: TFloatField
      FieldName = 'GOODS_COUNT'
    end
    object dsGoodsGOODS_COUNT_SELECTED: TFloatField
      FieldName = 'GOODS_COUNT_SELECTED'
    end
    object dsGoodsNO: TIntegerField
      FieldName = 'NO'
    end
    object dsGoodsGOODS_ID: TFloatField
      FieldName = 'GOODS_ID'
    end
    object dsGoodsG36: TStringField
      FieldName = 'G36'
      Size = 5
    end
    object dsGoodsG37: TStringField
      FieldName = 'G37'
      Size = 6
    end
    object dsGoodsDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 96
    Top = 140
    object sqlPrepareModeChange: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_mode_change.prepare(pdeclid => :DECL_ID);'
        'end;'
        '')
      DataSet = dsGoods
    end
    object sqlAddGoodsModeChange: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_mode_change.addgoodsmodechange(pdeclgoodsid => :ID,'
        
          '                                   pgoodscount => :GOODS_COUNT_S' +
          'ELECTED);'
        'end;')
      DataSet = dsGoods
    end
    object sqlChangeMode: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_mode_change.changemode;'
        'end;')
      DataSet = dsGoods
    end
    object sqlChangeModeCurrencyId: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_mode_change.getchangemodecurrency;'
        'end;')
      DataSet = dsGoods
    end
    object sqlExportGoods: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_mode_change.exportgoods;'
        'end;')
    end
    object sqlGetSubject: TsqlOp
      SQL.Strings = (
        'begin'
        '  select subject_id into :result'
        '    from fdc_obligation_doc_lst'
        '   where id=:DECL_ID;'
        'end;')
    end
  end
end
