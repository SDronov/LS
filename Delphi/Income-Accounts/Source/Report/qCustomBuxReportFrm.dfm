inherited qCustomBuxReportForm: TqCustomBuxReportForm
  Left = 532
  Top = 399
  Caption = 'qCustomBuxReportForm'
  ClientHeight = 153
  ClientWidth = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 446
    Height = 153
    inherited btnCancel: TcxButton
      Left = 362
      Top = 121
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 281
      Top = 121
      TabOrder = 5
    end
    inherited chbxXML: TcxCheckBox
      Top = 121
      TabOrder = 4
    end
    object chkIsTs: TcxDBCheckBox [6]
      Left = 9
      Top = 90
      Caption = #1087#1088#1080#1079#1085#1072#1082' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1089#1086#1102#1079#1072
      DataBinding.DataField = 'ISTS'
      DataBinding.DataSource = srcMemData
      ParentColor = False
      ParentFont = False
      Properties.DisplayChecked = #1044#1072
      Properties.DisplayUnchecked = #1053#1077#1090
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Properties.OnEditValueChanged = chkIsTsPropertiesEditValueChanged
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciIsTs: TdxLayoutItem [3]
        Caption = 'cxDBCheckBox1'
        ShowCaption = False
        Control = chkIsTs
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
  inherited dsMemData: TdxMemData
    AfterInsert = dsMemDataAfterInsert
    object dsMemDataDepartmen: TStringField [0]
      FieldName = 'Department'
      Size = 30
    end
    object dsMemDataCustomsLevel: TIntegerField
      FieldName = 'CustomsLevel'
    end
    object dsMemDataISTS: TStringField
      FieldName = 'ISTS'
      Size = 1
    end
    object dsMemDataReportId: TFloatField
      FieldName = 'ReportId'
    end
  end
  inherited xlrReport: TxlReport
    DataSources = <
      item
        DataSet = dsMemData
        Alias = 'aValue'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'rngDetail'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsFooter
        Alias = 'aFooter'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
  end
  inherited dsHeader: TfdcQuery
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CurrId'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'reportid'
        ParamType = ptInput
      end>
  end
  inherited dsReport: TfdcQuery
    BeforeOpen = dsReportBeforeOpen
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CurrId'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptInput
      end>
  end
  inherited dsXML: TfdcQuery
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_buh_report_lst_xml'
      'where'
      '  nvl(currency_id, :CurrId) = :CurrID'
      '  and nvl(balance_date, :DateFrom) = :DateFrom'
      '  and  :DateFrom = :DateTo'
      'order by'
      '  sort_order')
    Left = 360
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CurrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CurrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptUnknown
      end>
  end
  object dsFooter: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    BeforeOpen = dsFooterBeforeOpen
    Left = 240
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CurrId'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptInput
      end>
  end
  object qlSQL: TQueryList
    Session = MainData.Session
    Left = 200
    Top = 88
    object sqlAddReport: TsqlOp
      SQL.Strings = (
        'declare'
        '  l_rep_number fdc_report.rep_number%type := null;'
        'begin'
        '  if (nvl(:pid,0) > 0) then'
        '    select rep_number||'#39'-'#1058#1057#39' into l_rep_number'
        '    from fdc_report'
        '    where id = :pid;'
        '  end if;'
        '  :id := p_report_budget.add'
        '   ('
        '      prepdate     => :prepdate'
        '     ,preport_type => :preport_type'
        '     ,pcurrency    => :pcurrency'
        '     ,pitog_summa  => :pitog_summa'
        '     ,pists        => :pists'
        '     ,prepnumber   => l_rep_number'
        '   );'
        'end;')
    end
    object sqlUpdReport: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  if (upper(:template_name) in ('#39'BUXREPORT0543007'#39','#39'BUXREPORT054' +
          '3008'#39','#39'BUXREPORT0543009'#39','#39'BUXREPORT0543010'#39') and :report_id is n' +
          'ot null) then'
        '    p_report_budget.modify'
        '     ('
        '      prepid      => :report_id'
        '     ,pitog_summa => :itogo'
        '     );'
        '  end if;'
        'end;')
    end
  end
end
