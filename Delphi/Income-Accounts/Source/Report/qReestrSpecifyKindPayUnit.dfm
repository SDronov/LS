inherited qReestrSpecifyKindPayForm: TqReestrSpecifyKindPayForm
  Left = 264
  Top = 288
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 221
  ClientWidth = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 518
    Height = 221
    inherited btnCancel: TcxButton
      Left = 434
      Top = 189
      TabOrder = 7
    end
    inherited btnOk: TcxButton
      Left = 353
      Top = 189
      TabOrder = 6
    end
    object edtDate_From: TcxDBDateEdit [2]
      Left = 134
      Top = 63
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.PostPopupValueOnTab = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 319
    end
    object edtDate_To: TcxDBDateEdit [3]
      Left = 134
      Top = 90
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.PostPopupValueOnTab = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 319
    end
    object edtReestrType: TcxComboBox [4]
      Left = 134
      Top = 9
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1056#1077#1077#1089#1090#1088' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077
        #1056#1077#1077#1089#1090#1088' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072
        #1056#1077#1077#1089#1090#1088' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072)
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Text = #1056#1077#1077#1089#1090#1088' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077
      Width = 121
    end
    object editClassReestr: TcxComboBox [5]
      Left = 134
      Top = 36
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        #1042#1089#1077
        #1055#1088#1080#1085#1103#1090#1099#1077
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
        #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1077)
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Text = #1042#1089#1077
      Width = 365
    end
    object cmbxCurr: TfdcObjectLookupEdit [6]
      Left = 134
      Top = 117
      DataBinding.DataField = 'CurrId'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Code'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 4
      Width = 387
    end
    object chkIsTs: TcxDBCheckBox [7]
      Left = 134
      Top = 144
      Caption = #1087#1088#1080#1079#1085#1072#1082' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1089#1086#1102#1079#1072
      DataBinding.DataField = 'ISTS'
      DataBinding.DataSource = srcMemData
      ParentColor = False
      ParentFont = False
      Properties.DisplayChecked = #1044#1072
      Properties.DisplayUnchecked = #1053#1077#1090
      Properties.DisplayGrayed = #1042#1089#1077
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 5
      Width = 428
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLReestrType: TdxLayoutItem [0]
        Caption = #1058#1080#1087' '#1088#1077#1077#1089#1090#1088#1072':'
        Control = edtReestrType
        ControlOptions.ShowBorder = False
      end
      object dxLClassReestr: TdxLayoutItem [1]
        Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1103' '#1088#1077#1077#1089#1090#1088#1072
        Control = editClassReestr
        ControlOptions.ShowBorder = False
      end
      object dxLDate_From: TdxLayoutItem [2]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDate_From
        ControlOptions.ShowBorder = False
      end
      object dxLDate_To: TdxLayoutItem [3]
        Caption = #1055#1086
        Control = edtDate_To
        ControlOptions.ShowBorder = False
      end
      object dxLCurr: TdxLayoutItem [4]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurr
        ControlOptions.ShowBorder = False
      end
      object dxLIsTs: TdxLayoutItem [5]
        Caption = ' '
        Control = chkIsTs
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
      end
      item
        DataSet = dsItogo
        Alias = 'aItogo'
        Range = 'rngItogo'
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
    DataSource = srcMemData
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
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'custom_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'classreestr'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'reestr_type_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ISTS'
        ParamType = ptUnknown
      end>
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 30
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
    object dxMemDataCurrId: TFloatField
      FieldName = 'CurrId'
    end
    object dxMemDataists: TStringField
      FieldName = 'ists'
      Size = 1
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 86
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    DataSource = srcMemData
    ParamCheck = False
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
      
        'where (rskl.doc_date >= trunc(:begin_date) and rskl.doc_date < t' +
        'runc(:end_date + 1))'
      '  and (rskl.typesysname = (case :reestr_type'
      
        '                             when 1 then '#39'ReestrNoticeSpecifyKin' +
        'dPayCorr'#39
      
        '                             when 2 then '#39'ReestrNoticeSpecifyKin' +
        'dPay'#39
      '                             else '#39'ReestrConfirmSpecifyKindPay'#39
      '                           end))'
      '  and rskl.currency_id = :currid'
      '  and (rskl.is_ts = nvl(:ists,rskl.is_ts))'
      '  and ('
      '       (NVL(:show,0) = 0)'
      '       or'
      '       (t.state_id in ('
      '                      select id'
      '                      from fdc_state_lst'
      
        '                      where (:show = 1 and sysname = '#39'State.Pack' +
        'SpecifyKindPay.Accepted'#39')  -- ??????'
      
        '                         or (:show = 2 and sysname IN ( '#39'State.P' +
        'ackSpecifyKindPay.Send'#39', '#39'State.PackSpecifyKindPay.Conducted'#39' ))' +
        ' -- ?????????'
      
        '                         or (:show = 3 and sysname = '#39'State.Pack' +
        'SpecifyKindPay.Generated'#39') -- ???????????'
      '                     )'
      '       )'
      '      )'
      '  and rskl.id = rel.object_id'
      '  and rel.rel_object_id = bskl.id'
      'order by 2,1,3')
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currid'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptUnknown
        Size = 1
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end>
  end
  object srcMemData: TDataSource
    DataSet = dxMemData
    Left = 96
    Top = 120
  end
  object dsItogo: TfdcQuery
    Session = MainData.Session
    DataSource = srcMemData
    ParamCheck = False
    ReadOnly = False
    SQL.Strings = (
      'select bskl.kbk_code_s'
      '      ,sum(bskl.summa)      summa_s'
      '      ,bskl.kbk_code_t'
      '      ,sum(bskl.summa)      summa_t'
      'from fdc_reestr_specify_kindpay_lst rskl'
      '    ,fdc_rel_reestr_skindpay_lst    rel'
      '    ,fdc_bud_specify_kindpay_lst    bskl'
      
        'where (rskl.doc_date >= trunc(:begin_date) and rskl.doc_date < t' +
        'runc(:end_date + 1))'
      '  and (rskl.typesysname = (case :reestr_type'
      
        '                             when 1 then '#39'ReestrNoticeSpecifyKin' +
        'dPayCorr'#39
      
        '                             when 2 then '#39'ReestrNoticeSpecifyKin' +
        'dPay'#39
      '                             else '#39'ReestrConfirmSpecifyKindPay'#39
      '                           end))'
      '  and rskl.currency_id = :currid'
      '  and (rskl.is_ts = nvl(:ists,rskl.is_ts))'
      '  and ('
      '       (NVL(:show,0) = 0)'
      '       or'
      '       (rskl.state_id in ('
      '                      select id'
      '                      from fdc_state_lst'
      
        '                      where (:show = 1 and sysname = '#39'State.Pack' +
        'SpecifyKindPay.Accepted'#39')  -- ??????'
      
        '                         or (:show = 2 and sysname IN ( '#39'State.P' +
        'ackSpecifyKindPay.Send'#39', '#39'State.PackSpecifyKindPay.Conducted'#39' ))' +
        ' -- ?????????'
      
        '                         or (:show = 3 and sysname = '#39'State.Pack' +
        'SpecifyKindPay.Generated'#39') -- ???????????'
      '                     )'
      '       )'
      '      )'
      '  and rskl.id = rel.object_id'
      '  and rel.rel_object_id = bskl.id'
      'group by bskl.kbk_code_s'
      '        ,bskl.kbk_code_t')
    Left = 256
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currid'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptUnknown
        Size = 1
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'show'
        ParamType = ptUnknown
      end>
  end
end
