inherited repStatOutInfoGridForm: TrepStatOutInfoGridForm
  Left = 712
  Top = 396
  Width = 837
  Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1088#1077#1077#1089#1090#1088#1099' '#1074' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1077' '#1058#1054
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridData: TcxGrid [0]
    Left = 0
    Top = 26
    Width = 829
    Height = 295
    Align = alClient
    TabOrder = 4
    object cxGridDataDBBandedTableView: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = srcData
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
          FixedKind = fkLeft
        end
        item
          Caption = #1056#1077#1077#1089#1090#1088#1099
        end>
      object cxGridDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'CUSTOMS_CODE_8'
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridDataDBBandedTableViewNAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridDataDBBandedTableViewDocPackPayments: TcxGridDBBandedColumn
        Caption = #1042#1099#1087#1080#1089#1082#1072
        DataBinding.FieldName = 'DocPackPayments'
        OnGetDisplayText = cxGridDataDBBandedTableViewDocPackPaymentsGetDisplayText
        Width = 89
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridDataDBBandedTableViewDocPackReturnsY: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1077' '#1074#1086#1079#1074#1088#1072#1090#1099
        DataBinding.FieldName = 'DocPackReturnsY'
        OnGetDisplayText = cxGridDataDBBandedTableViewDocPackPaymentsGetDisplayText
        Width = 175
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridDataDBBandedTableViewDocPackReuse: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1077#1079#1072#1095#1105#1090#1099
        DataBinding.FieldName = 'DocPackReuse'
        OnGetDisplayText = cxGridDataDBBandedTableViewDocPackPaymentsGetDisplayText
        Width = 110
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGridDataDBBandedTableViewDocPackReuseY: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1077' '#1087#1077#1088#1077#1079#1072#1095#1105#1090#1099
        DataBinding.FieldName = 'DocPackReuseY'
        OnGetDisplayText = cxGridDataDBBandedTableViewDocPackPaymentsGetDisplayText
        Width = 179
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object cxGridDataLevel1: TcxGridLevel
      GridView = cxGridDataDBBandedTableView
    end
  end
  inherited ActionList: TActionList
    Left = 96
    Top = 103
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 124
    Top = 103
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 236
    Top = 103
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 264
    Top = 103
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 180
    Top = 103
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 208
    Top = 103
  end
  inherited imglAction: TImageList
    Left = 292
    Top = 103
  end
  inherited imglLarge: TImageList
    Left = 320
    Top = 103
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1044#1072#1085#1085#1099#1077
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 24
        FloatClientHeight = 24
        ItemLinks = <
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = barDateCB
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
      2)
    Categories.Visibles = (
      True)
    Left = 152
    Top = 103
    DockControlHeights = (
      0
      0
      26
      0)
    inherited btnRefresh: TdxBarButton
      ButtonStyle = bsChecked
    end
    object barDateCB: TdxBarDateCombo
      Caption = #1044#1072#1090#1072
      Category = 0
      Hint = #1044#1072#1090#1072
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 96
    Top = 131
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select cust.customs_code_8'
      '      ,cust.name'
      
        '      ,sum((case pk.typesysname when '#39'DocPackPayments'#39' then 1 el' +
        'se 0 end)) DocPackPayments'
      
        '      ,sum((case pk.typesysname when '#39'DocPackReturnsY'#39' then 1 el' +
        'se 0 end)) DocPackReturnsY'
      
        '      ,sum((case pk.typesysname when '#39'DocPackReuse'#39'    then 1 el' +
        'se 0 end)) DocPackReuse'
      
        '      ,sum((case pk.typesysname when '#39'DocPackReuseY'#39'   then 1 el' +
        'se 0 end)) DocPackReuseY'
      'from ('
      '      select id'
      '            ,customs_code_8'
      '            ,name'
      '      from fdc_customs_lst'
      '      where ('
      
        '             (p_params.customlevel in (p_consts.customlevel_fts,' +
        ' p_consts.customlevel_rtu) and customs_code_8 like substr(p_para' +
        'ms.customcode, 1, 3) || '#39'__000'#39')'
      '             or'
      
        '             (p_params.customlevel in (p_consts.customlevel_fts)' +
        ' and customs_code_8 like substr(p_params.customcode, 1, 1) || '#39'_' +
        '_00000'#39')'
      '             or'
      '             customs_code_8 = p_params.customcode'
      '               or'
      
        '    (p_params.customlevel in (p_consts.customlevel_fts) and cust' +
        'oms_code_8 = p_params.ELSCustomCode)'
      '            )'
      
        '        and (inn is not null or customs_code_8 = p_params.ELSCus' +
        'tomCode)'
      '        AND ( dt_end IS NULL OR dt_end >= trunc( :adate ) )'
      '     ) cust'
      '    ,('
      '      select distinct'
      '             dptl.customs_in_id custom_id'
      '            ,dl.typesysname'
      '      from fdc_doc_pack_transfer_lst dptl'
      '          ,fdc_rel_pack_docs_lst rel'
      '          ,fdc_document_lst dl'
      
        '      where dptl.state_id in (select id from fdc_state_lst where' +
        ' sysname in ('#39'State.DocPackTransferOUT.Sended'#39'))'
      
        '        AND dptl.send_date between trunc(:adate) and trunc(:adat' +
        'e)+1-1/24/3600'
      '        and dptl.id = rel.object_id'
      '        and rel.rel_object_id = dl.id'
      '     ) pk'
      'where cust.id = pk.custom_id(+)      '
      'group by cust.customs_code_8'
      '        ,cust.name'
      'order by cust.customs_code_8')
    Left = 124
    Top = 131
    ParamData = <
      item
        DataType = ftDate
        Name = 'adate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adate'
        ParamType = ptInput
      end>
  end
  inherited srcData: TDataSource
    Left = 152
    Top = 131
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrRefreshTimer
    Left = 432
    Top = 120
  end
end
