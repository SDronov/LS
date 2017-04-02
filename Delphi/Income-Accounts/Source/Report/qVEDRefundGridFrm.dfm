inherited qVEDRefundGridForm: TqVEDRefundGridForm
  Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdData: TcxGrid
    inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
      OptionsCustomize.DataRowSizing = True
      OptionsView.HeaderHeight = 48
      object ColumnOPER_DATE: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080' ('#1089#1086#1079#1076#1072#1085#1080#1103')'
        DataBinding.FieldName = 'OPER_DATE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 113
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object ColumnCUSTOMS_CODE: TcxGridDBBandedColumn
        Caption = #1050#1086#1076' '#1058#1054
        DataBinding.FieldName = 'CUSTOMS_CODE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 77
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object ColumnCUSTOMS_FULL_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
        DataBinding.FieldName = 'CUSTOMS_FULL_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 188
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object ColumnDEC_TYPE: TcxGridDBBandedColumn
        Caption = #1058#1080#1087' '#1088#1077#1096#1077#1085#1080#1103
        DataBinding.FieldName = 'DEC_TYPE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object ColumnDEC_DATE: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
        DataBinding.FieldName = 'DEC_DATE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object ColumnDEC_NUMBER: TcxGridDBBandedColumn
        Caption = #8470' '#1088#1077#1096#1077#1085#1080#1103
        DataBinding.FieldName = 'DEC_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object ColumnDOC_NUMBER: TcxGridDBBandedColumn
        Caption = #8470' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'DOC_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 95
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object ColumnDOC_DATE: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'DOC_DATE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 96
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object ColumnSUMMA: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' ('#1088#1091#1073'.)'
        DataBinding.FieldName = 'SUMMA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 112
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object ColumnINN: TcxGridDBBandedColumn
        Caption = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'INN'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = False
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 113
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object ColumnKPP: TcxGridDBBandedColumn
        Caption = #1050#1055#1055' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'KPP'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 115
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object ColumnNAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 189
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object ColumnACCOUNT_K: TcxGridDBBandedColumn
        Caption = #1056'/'#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'ACCOUNT_K'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Hidden = True
        Width = 171
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object ColumnBIK_K: TcxGridDBBandedColumn
        Caption = #1041#1048#1050' '#1073#1072#1085#1082#1072
        DataBinding.FieldName = 'BIK_K'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 113
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object ColumnBANK_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
        DataBinding.FieldName = 'BANK_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 232
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object ColumnLIST_ACCOUNTS: TcxGridDBBandedColumn
        Caption = #8470' '#1088'/'#1089', '#1089' '#1082#1086#1090#1086#1088#1099#1093' '#1087#1086#1089#1090#1091#1087#1072#1083#1080' '#1076#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072
        DataBinding.FieldName = 'LIST_ACCOUNTS'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
    end
  end
  object cxDateEdit1: TcxDateEdit [2]
    Left = 92
    Top = 77
    EditValue = 41655d
    ParentFont = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnValidate = cxDateEdit1PropertiesValidate
    Style.Shadow = False
    TabOrder = 9
    Width = 105
  end
  object cxDateEdit2: TcxDateEdit [3]
    Left = 204
    Top = 77
    EditValue = 41655d
    ParentFont = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnValidate = cxDateEdit2PropertiesValidate
    Style.Shadow = False
    TabOrder = 7
    Width = 105
  end
  object cxCheckBox1: TcxCheckBox [4]
    Left = 329
    Top = 77
    Hint = 
      #1042#1099#1073#1086#1088#1082#1072' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1093' '#1079#1072#1103#1074#1086#1082' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1088'/'#1089', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081 +
      ' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1074#1086#1079#1074#1088#1072#1090','#13#10#1085#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1085#1080' '#1086#1076#1085#1086#1084#1091' '#1088'/'#1089', '#1089' '#1082#1086#1090#1086#1088#1086 +
      #1075#1086' '#1087#1086#1089#1090#1091#1087#1072#1083#1080' '#1076#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072'.'
    Caption = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1089#1095#1105#1090
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Properties.OnChange = cxCheckBox1PropertiesChange
    ShowHint = True
    TabOrder = 8
    Transparent = True
    Width = 185
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
          end
          item
            Item = dxBarStatic2
            Visible = True
          end
          item
            Item = dxBarControlContainerItem2
            Visible = True
          end
          item
            Item = dxBarStatic3
            Visible = True
          end
          item
            Item = dxBarControlContainerItem3
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
      26
      0)
    object dxBarStatic1: TdxBarStatic
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
      Category = 0
      Hint = #1055#1077#1088#1080#1086#1076' '#1089
      Visible = ivAlways
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxDateEdit1
    end
    object dxBarStatic2: TdxBarStatic
      Caption = #1087#1086
      Category = 0
      Hint = #1087#1086
      Visible = ivAlways
    end
    object dxBarControlContainerItem2: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxDateEdit2
    end
    object dxBarStatic3: TdxBarStatic
      Category = 0
      Visible = ivAlways
      Width = 12
    end
    object dxBarControlContainerItem3: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxCheckBox1
    end
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      
        'select * from Table(OI_report_VED_Refunds_Out1(:DATE_FROM,:DATE_' +
        'TO))'
      'order by OPER_DATE')
    Variables.Data = {
      03000000020000000A0000003A444154455F46524F4D0C000000000000000000
      0000080000003A444154455F544F0C0000000000000000000000}
    object dsetDataOPER_DATE: TDateTimeField
      FieldName = 'OPER_DATE'
    end
    object dsetDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsetDataCUSTOMS_FULL_NAME: TStringField
      FieldName = 'CUSTOMS_FULL_NAME'
      Size = 1500
    end
    object dsetDataDEC_TYPE: TStringField
      FieldName = 'DEC_TYPE'
      Size = 10
    end
    object dsetDataDEC_DATE: TDateTimeField
      FieldName = 'DEC_DATE'
    end
    object dsetDataDEC_NUMBER: TStringField
      FieldName = 'DEC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsetDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsetDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetDataACCOUNT_K: TStringField
      FieldName = 'ACCOUNT_K'
    end
    object dsetDataBIK_K: TStringField
      FieldName = 'BIK_K'
      Size = 9
    end
    object dsetDataBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 1500
    end
    object dsetDataLIST_ACC: TStringField
      FieldName = 'LIST_ACCOUNTS'
      Size = 1000
    end
    object dsetDataIS_PRESENT: TStringField
      FieldName = 'IS_PRESENT'
      Visible = False
      Size = 1
    end
  end
  inherited excelExport: TxlReport
    DataSources = <
      item
        DataSet = dsetData
        Alias = 'aBody'
        Range = 'rangeData'
        Options = [xrgoAutoOpen]
        Tag = 0
      end>
    Params = <
      item
        Name = 'ReportDate'
        Value = 0d
      end
      item
        Name = 'DateFrom'
        Value = 0d
      end
      item
        Name = 'DateTo'
        Value = 0d
      end>
    Left = 146
  end
end
