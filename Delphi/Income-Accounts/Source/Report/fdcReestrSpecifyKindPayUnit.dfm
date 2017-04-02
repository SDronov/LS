inherited fdcReestrSpecifyKindPayForm: TfdcReestrSpecifyKindPayForm
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 125
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 520
    Height = 125
    inherited btnCancel: TcxButton
      Left = 436
      Top = 93
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 355
      Top = 93
      TabOrder = 3
    end
    object edtDate_From: TcxDBDateEdit [2]
      Left = 144
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
      Width = 319
    end
    object edtDate_To: TcxDBDateEdit [3]
      Left = 144
      Top = 36
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      Enabled = False
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 319
    end
    object edtReestrType: TcxComboBox [4]
      Left = 144
      Top = 63
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072
        
          #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1080' '#1080#1079#1083#1080#1096 +
          #1085#1077#1081' '#1091#1087#1083#1072#1090#1077
        #1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072)
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLDate_From: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1077#1089#1090#1088#1086#1074
        Control = edtDate_From
        ControlOptions.ShowBorder = False
      end
      object dxLDate_To: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Enabled = False
        Visible = False
        Control = edtDate_To
        ControlOptions.ShowBorder = False
      end
      object dxLReestrType: TdxLayoutItem [2]
        Caption = #1058#1080#1087' '#1088#1077#1077#1089#1090#1088#1072':'
        Control = edtReestrType
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 167
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 167
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 167
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  object xlrNoticeKindPay: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroRefreshParams]
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsBody
        Alias = 'aBody'
        Range = 'rngBody'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 200
    Top = 54
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  '#39#1056#1045#1045#1057#1058#1056#1067' '#39' ||'
      '  (case :reestr_type'
      '    when 2 then '#39#1055#1054#1044#1058#1042#1045#1056#1046#1044#1045#1053#1048#1049#39
      '    else '#39#1059#1042#1045#1044#1054#1052#1051#1045#1053#1048#1049#39
      '  end) reestr_type'
      ' ,(case :reestr_type'
      
        '    when 1 then '#39#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1080' ' +
        #1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077#39
      '    when 2 then '#39#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072#39
      '    else '#39#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072#39
      '  end) reestr_name'
      
        ' ,'#39'"'#39' || to_char(:begin_date,'#39'dd'#39') || '#39'" '#39' || to_char(:begin_dat' +
        'e,'#39'monthyyyy'#39') || '#39' '#1075'.'#39' as date_from'
      
        ' ,(select name from fdc_customs_lst where customs_code_8 = :cust' +
        'om_code and rownum = 1) as custom_name'
      'from dual')
    Left = 48
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'custom_code'
        ParamType = ptUnknown
      end>
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 30
    object dxMemDataCustomsName: TStringField
      DisplayWidth = 400
      FieldName = 'CustomsName'
      Size = 1500
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
      OnChange = dxMemDataDate_FromChange
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataPeriod: TStringField
      DisplayWidth = 300
      FieldName = 'Period'
      Size = 1500
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 86
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select rskl.doc_number reestr_number'
      '      ,rskl.doc_date   reestr_date'
      '      ,bskl.doc_number'
      '      ,bskl.doc_date'
      '      ,bskl.kbk_code_s'
      '      ,bskl.summa      summa_s'
      '      ,bskl.kbk_code_t'
      '      ,bskl.summa      summa_t'
      'from fdc_reestr_specify_kindpay_lst rskl'
      '    ,fdc_rel_reestr_skindpay_lst    rel'
      '    ,fdc_bud_specify_kindpay_lst    bskl'
      
        'where (rskl.recieve_date >= trunc(:begin_date) and rskl.recieve_' +
        'date < trunc(:begin_date + 1))'
      '  and (rskl.ext_source != p_params.softcustomscode)'
      '  and (rskl.typesysname = (case :reestr_type'
      
        '                             when 1 then '#39'ReestrNoticeSpecifyKin' +
        'dPayCorr'#39
      
        '                             when 2 then '#39'ReestrConfirmSpecifyKi' +
        'ndPay'#39
      '                             else '#39'ReestrNoticeSpecifyKindPay'#39
      '                           end))'
      '  and (exists('
      '              select 1'
      '              from fdc_rel_pack_docs_lst rpdl'
      '                  ,fdc_doc_pack_transfer_lst dptl'
      '              where rpdl.rel_object_id = rskl.id'
      '               and rpdl.object_id = dptl.id'
      '               and dptl.customs_out_code = :custom_code'
      '             )'
      '      )'
      '  and rskl.id = rel.object_id'
      '  and rel.rel_object_id = bskl.id'
      'order by 2,1,3')
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'custom_code'
        ParamType = ptUnknown
      end>
  end
end
