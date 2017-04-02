inherited fdcEventDelGtd_ChangeNPPForm: TfdcEventDelGtd_ChangeNPPForm
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 86
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 422
    Height = 86
    inherited btnCancel: TcxButton
      Left = 338
      Top = 54
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 257
      Top = 54
      TabOrder = 1
    end
    object edtDate_From: TcxDBDateEdit [2]
      Left = 76
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
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1086#1090#1095#1105#1090#1072
        Control = edtDate_From
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
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select'
      '           :begin_date as Date_From'
      '          ,name           as fio'
      '          ,login            as login'
      
        '          ,'#39#1055#1088#1086#1090#1086#1082#1086#1083' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1074' '#1041#1044' '#1050#1055#1057' "'#1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' ' +
        '- '#39'||'
      
        '           (case when (p_params.customlevel in (p_consts.customl' +
        'evel_fts))  then '#39#1060#1058#1057#39' '
      
        '                     when (p_params.customlevel in (p_consts.cus' +
        'tomlevel_rtu))  then '#39#1056#1058#1059#39
      
        '                     when (p_params.customlevel in (p_consts.cus' +
        'tomlevel_t))  then '#39#1058#39
      
        '                     when (p_params.customlevel in (p_consts.cus' +
        'tomlevel_knp_fts))  then '#39#1050#1053#1055' '#1060#1058#1057#39
      
        '                     when (p_params.customlevel in (p_consts.cus' +
        'tomlevel_knp_rtu))  then '#39#1050#1053#1055' '#1056#1058#1059#39
      '                     else '#39#39' end) as report_name'
      'from fdc_user_current_lst'
      ''
      '')
    Left = 32
    Top = 38
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end>
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 38
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object dxMemDataLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 255
    end
    object dxMemDatareport_name: TStringField
      FieldName = 'report_name'
      Size = 255
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 32
    Top = 118
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select evt_moment, evt_description'
      'from fdc_evt_lst '
      'where evt_moment >= trunc(:event_date)'
      '  and evt_moment < trunc(:event_date)+1'
      '  and login = :login'
      '  and ( '
      '          (type_code = '#39'PAY'#39' and code = '#39'00019'#39')'
      '    or'
      '    (type_code = '#39'GCD'#39' and code = '#39'00003'#39')'
      '    )'
      'order by evt_moment')
    Left = 152
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'event_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'event_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptInput
      end>
  end
  object xlrEvent: TxlReportG2
    Options = [roOptimizeLaunch, roDisplayAlerts, roAutoSafe, roAutoOpen]
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Tag = 0
      end
      item
        DataSet = dsBody
        Alias = 'aBody'
        Range = 'rngBody'
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 200
    Top = 40
  end
end
