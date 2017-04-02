inherited qAdvanceRestForm: TqAdvanceRestForm
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 129
  ClientWidth = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 449
    Height = 129
    inherited btnCancel: TcxButton
      Left = 365
      Top = 97
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 284
      Top = 97
      TabOrder = 3
    end
    object cxDBButtonEdit1: TcxDBButtonEdit [2]
      Left = 55
      Top = 9
      DataBinding.DataField = 'SUBJECT_NAME'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 385
    end
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [3]
      Left = 55
      Top = 36
      DataBinding.DataField = 'CURRENCY_ID'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 385
    end
    object cxDBCheckBox1: TcxDBCheckBox [4]
      Left = 9
      Top = 63
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044' '#1089' '#1088#1072#1089#1093#1086#1078#1076#1077#1085#1080#1077#1084' '#1086#1089#1090#1072#1090#1082#1086#1074
      DataBinding.DataField = 'ONLY_DIFF'
      DataBinding.DataSource = srcMemData
      ParentColor = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090
        Control = cxDBButtonEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = fdcObjectLookupEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = 'cxDBCheckBox1'
        ShowCaption = False
        Control = cxDBCheckBox1
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 144
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 172
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 256
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 284
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 200
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 228
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\SVN\IACC\trunk\Delphi\Bin\report\'#1054#1089#1090#1072#1090#1082#1080#1040#1074#1072#1085#1089#1086#1074#1099#1093#1057#1088#1077#1076#1089#1090#1074'.xls'
    DataSources = <
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'report'
        Options = [xrgoAutoOpen]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 16
    Top = 88
  end
  object dsMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 48
    Top = 88
    object dsMemDataONLY_DIFF: TIntegerField
      FieldName = 'ONLY_DIFF'
    end
    object dsMemDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 400
    end
    object dsMemDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsMemDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
  end
  object dsReport: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    SQL.Strings = (
      'select s.name'
      '      ,s.inn          '
      '      ,c.code                                as curr'
      '      ,nvl(doc.sum, 0)                       as dsum'
      '      ,nvl(a_entry.sum, 0)                   as esum'
      '      ,nvl(doc.sum, 0) - nvl(a_entry.sum, 0) as diff'
      '  from fdc_subject_lst      s'
      '      ,fdc_nsi_currency_lst c'
      '      ,(select na.payer_id    as subj_id'
      '              ,na.currency_id as curr_id '
      '              ,sum(rest_summa) as sum'
      '          from fdc_po_credit_lst na'
      
        '         where (na.currency_id = :CURRENCY_ID or :CURRENCY_ID is' +
        ' null)'
      
        '           and (na.payer_id    = :SUBJECT_ID  or :SUBJECT_ID  is' +
        ' null)'
      '         group by na.payer_id, na.currency_id'
      '       ) doc'
      '      ,(select na.subj_id'
      '              ,na.curr_id '
      '              ,sum(na.sum) as sum'
      '          from (select ae.d_subj_id as subj_id'
      '                      ,ae.d_curr_id as curr_id'
      '                      ,-ae.summa    as sum'
      '                  from fdc_account_entry_lst ae'
      '                 where ae.d_name = '#39'100'#39
      '                 union all'
      '                select ae.c_curr_id as subj_id'
      '                      ,ae.c_subj_id as curr_id'
      '                      ,ae.summa     as sum'
      '                  from fdc_account_entry_lst ae'
      '                 where ae.c_name = '#39'100'#39
      '               ) na'
      
        '         where (na.curr_id = :CURRENCY_ID or :CURRENCY_ID is nul' +
        'l)'
      
        '           and (na.subj_id = :SUBJECT_ID  or :SUBJECT_ID  is nul' +
        'l)'
      '         group by na.subj_id, na.curr_id'
      '       ) a_entry'
      ' where doc.subj_id = a_entry.subj_id(+)'
      '   and doc.curr_id = a_entry.curr_id(+)'
      '   and doc.subj_id = s.id'
      '   and doc.curr_id = c.id'
      
        '   and (nvl(doc.sum, 0) - nvl(a_entry.sum, 0) <> 0 or :ONLY_DIFF' +
        ' = 0)'
      ' order by s.name, c.code')
    Left = 112
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ONLY_DIFF'
        ParamType = ptUnknown
      end>
  end
  object srcMemData: TDataSource
    DataSet = dsMemData
    Left = 80
    Top = 88
  end
end
