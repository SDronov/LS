inherited qReportPaybackForm: TqReportPaybackForm
  Left = 578
  Top = 264
  Caption = #1057#1074#1086#1076#1082#1072' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084
  ClientHeight = 254
  ClientWidth = 591
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 591
    Height = 254
    inherited btnCancel: TcxButton
      Left = 507
      Top = 222
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 426
      Top = 222
      TabOrder = 4
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 113
      Top = 9
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 574
    end
    object edtDateTo: TcxDBDateEdit [3]
      Left = 113
      Top = 36
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 456
    end
    object edtTypeReport: TcxDBRadioGroup [4]
      Left = 9
      Top = 174
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      DataBinding.DataField = 'Type_Report'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.Columns = 2
      Properties.DefaultValue = 0
      Properties.Items = <
        item
          Caption = #1055#1086' '#1076#1072#1090#1077' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
          Value = 0
        end
        item
          Caption = #1055#1086' '#1076#1072#1090#1077' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1079#1072#1103#1074#1086#1082' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '
          Value = 1
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Height = 39
      Width = 573
    end
    object edtTypePayback: TcxDBRadioGroup [5]
      Left = 9
      Top = 63
      Caption = #1058#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
      DataBinding.DataField = 'Type_Payback'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.DefaultValue = 4
      Properties.Items = <
        item
          Caption = 
            #1053#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1084' '#1079#1072#1103#1074#1082#1072#1084' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090', '#1087#1086#1087#1072#1076#1072#1102#1097#1080#1084' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1077#1088#1080 +
            #1086#1076
          Value = 2
        end
        item
          Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1084' '#1079#1072#1103#1074#1082#1072#1084' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090', '#1087#1086#1087#1072#1076#1072#1102#1097#1080#1084' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
          Value = 3
        end
        item
          Caption = #1042#1089#1077#1084' '#1079#1072#1103#1074#1082#1072#1084' '#1074#1086#1079#1074#1088#1072#1090', '#1087#1086#1087#1072#1076#1072#1102#1097#1080#1084' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
          Value = 4
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      TabOrder = 2
      Height = 105
      Width = 185
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [2]
        Caption = 'cxDBRadioGroup1'
        ShowCaption = False
        Control = edtTypePayback
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = 'cxDBRadioGroup1'
        ShowCaption = False
        Control = edtTypeReport
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 248
    Top = 15
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 276
    Top = 15
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 360
    Top = 15
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 388
    Top = 15
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 304
    Top = 15
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 332
    Top = 15
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = dxMemDataAfterInsert
    Left = 192
    Top = 84
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataType_Report: TIntegerField
      FieldName = 'Type_Report'
    end
    object dxMemDataType_Payback: TStringField
      FieldName = 'Type_Payback'
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 256
    Top = 84
  end
  object xlrReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\LSSVN\iacc\Delphi\Bin\report\'#1057#1074#1086#1076#1082#1072' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'dsHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'dsReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 312
    Top = 80
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ParamCheck = False
    ReadOnly = False
    SQL.Strings = (
      'select'
      '      case when :ptypereport = 0 then'
      
        '      '#39#1055#1077#1088#1080#1086#1076' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1044#1072#1090#1077' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' c '#39'||to_cha' +
        'r(:pDateBegin,'#39'dd.mm.yyyy'#39')||'#39' '#1087#1086' '#39'||to_char(:pDateEnd,'#39'dd.mm.yy' +
        'yy'#39') '
      '      else'
      
        '      '#39#1055#1077#1088#1080#1086#1076' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103': '#1087#1086' '#1044#1072#1090#1077' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1074 +
        ' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093' '#1089' '#39'||to_char(:pDateBegin,'#39'dd.mm.yyyy'#39')||'#39' '#1087#1086' '#39'||to_' +
        'char(:pDateEnd,'#39'dd.mm.yyyy'#39')'
      '      end as period,'
      '      case when :ptypepayback = 2 then '
      '           '#39#1053#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1077#39
      '      else case when :ptypepayback = 3 then'
      '                '#39#1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1077#39
      '           else'
      '                '#39#1042#1089#1077#39
      '           end'
      '      end'
      '      as typepayback'
      'from dual')
    Left = 496
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ptypereport'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ptypepayback'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ptypepayback'
        ParamType = ptUnknown
      end>
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ParamCheck = False
    ReadOnly = False
    SQL.Strings = (
      'select p.KBKCode,'
      '       p.ext_source,'
      '       p.doc_number,'
      '       p.doc_date,'
      '       p.summa,'
      '       c.doc_date date_confirm,'
      '       e.Moment as date_add'
      'from fdc_event_lst e,'
      '     fdc_payment_order_payback_lst p'
      
        'left outer join fdc_doc_confirm_lst c on c.confirmed_doc_id = p.' +
        'id'
      'where e.Object_ID = p.ID'
      '  and e.typesysname = '#39'EventAdd'#39
      
        '--_for_replace_0*/   and trunc(p.doc_date) between :pDateBegin a' +
        'nd :pDateEnd'
      
        '--_for_replace_1*/   and trunc(e.Moment)   between :pdatebegin a' +
        'nd :pdateend'
      '--_for_replace_2*/   and c.id is null'
      '--_for_replace_3*/   and c.id is not null'
      'order by p.ext_source,e.Moment')
    Left = 496
    Top = 128
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pdatebegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pdateend'
        ParamType = ptInput
      end>
  end
end
