inherited TPOAnnulAdviceDlgForm: TTPOAnnulAdviceDlgForm
  Left = 362
  Top = 307
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1079#1076#1072#1085#1085#1099#1093' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 315
  ClientWidth = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 589
    Height = 315
    inherited btnCancel: TcxButton
      Left = 505
      Top = 283
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 424
      Top = 283
      TabOrder = 1
    end
    object grdAdvice: TcxGrid [2]
      Left = 9
      Top = 9
      Width = 414
      Height = 264
      Align = alClient
      TabOrder = 0
      object grdAdviceDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = srcAdvice
        DataController.KeyFieldNames = 'ADVICE_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object grdAdviceDBTableView1ADVICE_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ADVICE_ID'
          Visible = False
        end
        object grdAdviceDBTableView1DECL_NAME: TcxGridDBColumn
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          DataBinding.FieldName = 'DECL_NAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 296
        end
        object grdAdviceDBTableView1DOC_NUMBER: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          DataBinding.FieldName = 'DOC_NUMBER'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 66
        end
        object grdAdviceDBTableView1DOC_DATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          DataBinding.FieldName = 'DOC_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Width = 135
        end
        object grdAdviceDBTableView1TO_OPEN: TcxGridDBColumn
          Caption = #1054#1090#1082#1088#1099#1090#1100
          DataBinding.FieldName = 'TO_OPEN'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 72
        end
      end
      object grdAdviceLevel1: TcxGridLevel
        GridView = grdAdviceDBTableView1
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Control = grdAdvice
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
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 96
    Top = 140
    object sqlModifyAdvice: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  p_advice.modify(:ADVICE_ID, :DOC_NUMBER, :DOC_DATE);'
        'end;')
      DataSet = dsAdvice
    end
  end
  object dsAdvice: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    Filtered = True
    ReadOnly = False
    SQL.Strings = (
      
        'select distinct x.id advice_id, x.doc_number, x.doc_date, x.decl' +
        '_name, 0 to_open'
      '  from fdc_advice_charge_lst ac'
      '     , fdc_advice_lst x '
      'where ac.decl_id = :decl_id '
      '      and ac.advice_is_active = '#39'N'#39
      '      and ac.advice_id = x.id')
    Left = 56
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptInput
      end>
    object dsAdviceADVICE_ID: TFloatField
      FieldName = 'ADVICE_ID'
    end
    object dsAdviceDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsAdviceDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsAdviceDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsAdviceTO_OPEN: TFloatField
      FieldName = 'TO_OPEN'
    end
  end
  object srcAdvice: TDataSource
    DataSet = dsAdvice
    Left = 96
    Top = 208
  end
end
