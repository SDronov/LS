inherited qVEDIncomingGridForm: TqVEDIncomingGridForm
  Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074' '#1085#1072' '#1088'/'#1089' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdData: TcxGrid
    Top = 28
    Height = 204
    inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
      object ColumnINN: TcxGridDBBandedColumn
        Caption = #1048#1053#1053' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
        DataBinding.FieldName = 'INN'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 151
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object ColumnNAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 317
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object ColumnACCOUNT: TcxGridDBBandedColumn
        Caption = #8470' '#1088#1072#1089#1095#1105#1090#1085#1086#1075#1086' '#1089#1095#1105#1090#1072
        DataBinding.FieldName = 'ACCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 172
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object ColumnBIK: TcxGridDBBandedColumn
        Caption = #1041#1048#1050' '#1073#1072#1085#1082#1072
        DataBinding.FieldName = 'BIK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 113
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object ColumnBANK: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
        DataBinding.FieldName = 'BANK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 264
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
  end
  object cxMaskEditAccount: TcxMaskEdit [2]
    Left = 160
    Top = 64
    ParentFont = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[0-9]{20}'
    Properties.MaxLength = 0
    Properties.OnChange = cxMaskEditAccountPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 6
    OnKeyDown = cxMaskEditAccountKeyDown
    Width = 175
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
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 405
        FloatTop = 282
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = bButExcel
            Visible = True
          end
          item
            Item = bButRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      28
      0)
    object dxBarStatic1: TdxBarStatic
      Caption = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1089#1095#1105#1090
      Category = 0
      Hint = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1089#1095#1105#1090
      Visible = ivAlways
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxMaskEditAccount
    end
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select DISTINCT po.account, '
      
        '  MAX(po.bik) OVER(PARTITION BY s.INN, s.KPP, s.Name, po.account' +
        ', b.full_name) bik,'
      '  s.name,'
      '  s.inn,'
      '  b.full_name as bank'
      'from '
      ' (select distinct p.payer_id,'
      
        '    case when SUBSTR(p.account_p, 1, 2) = '#39'30'#39' then REGEXP_SUBST' +
        'R(p.name_p,'#39'[0-9]{20}'#39')'
      '    else p.account_p'
      '    end as account,'
      
        '    case when SUBSTR(p.account_p, 1, 2) = '#39'30'#39' then REGEXP_SUBST' +
        'R(REGEXP_SUBSTR(p.name_p,'#39'['#1041#1048#1050']{1}[ ]{1}[0-9]{9}'#39'),'#39'[0-9]{9}'#39')'
      '    else p.bik_p'
      '    end as bik'
      '  from FDC_PAYMENT_ORDER p'
      '      ,fdc_object o'
      '      ,fdc_object_type t'
      '  where o.id = p.id'
      '    and t.id = o.object_type_id'
      '    and t.sysname='#39'CashlessPaymentOrder'#39
      '    and p.account_p is not null'
      '    and p.account_p = :Account'
      ' ) po,'
      ' fdc_subject_lst s,'
      ' fdc_bank_lst b'
      'where s.id = po.payer_id'
      '  and b.bic = po.bik'
      'order by name')
    Variables.Data = {
      0300000001000000080000003A4143434F554E54050000000000000000000000}
    object dsetDataINN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INN'
      ReadOnly = True
    end
    object dsetDataNAME: TStringField
      DisplayWidth = 300
      FieldName = 'NAME'
      ReadOnly = True
      Size = 300
    end
    object dsetDataACCOUNT: TStringField
      FieldName = 'ACCOUNT'
      ReadOnly = True
    end
    object dsetDataBIK: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BIK'
      ReadOnly = True
    end
    object dsetDataBANK: TStringField
      FieldName = 'BANK'
      ReadOnly = True
      Size = 200
    end
  end
  inherited excelExport: TxlReport
    DataSources = <
      item
        DataSet = dsetData
        Alias = 'aBody'
        Range = 'rangeData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Params = <
      item
        Name = 'ReportDate'
        Value = 0d
      end
      item
        Name = 'Account'
        Value = ''
      end>
  end
end
