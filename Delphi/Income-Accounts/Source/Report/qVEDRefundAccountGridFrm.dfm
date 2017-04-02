inherited qVEDRefundAccountGridForm: TqVEDRefundAccountGridForm
  Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084' '#1042#1069#1044' '#1085#1072' '#1088#1072#1089#1095#1105#1090#1085#1099#1081' '#1089#1095#1105#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdData: TcxGrid
    Top = 28
    Height = 204
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
      object ColumnCUSTOMSFULLNAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
        DataBinding.FieldName = 'CUSTOMSFULLNAME'
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
        Width = 109
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
        Options.Filtering = False
        Width = 169
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
    end
  end
  object cxMaskEditAccount: TcxMaskEdit [2]
    Left = 142
    Top = 79
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
      'select -- '#1074#1086#1079#1074#1088#1072#1090#1099' ('#1042#1040#1074', '#1042#1048#1079', '#1042#1044#1079', '#1042#1055#1088') '
      '       doc.doc_date as oper_date,'
      '       dpb.customs_code,'
      '       dpb.CustomsFullName,'
      '       CASE dpb.TypeSysName '
      
        '         when '#39'DecPaybackDeposit'#39'  then '#39#1042#1044#1079#39'    -- '#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077 +
        #1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
      
        '         when '#39'DecPaybackPay'#39'      then '#39#1042#1048#1079#1059#1087#1083#39' -- '#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080 +
        #1096#1085#1077' '#1091#1087#1083#1072#1095#1077#1085#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
      
        '         when '#39'DecPaybackLevy'#39'     then '#39#1042#1048#1079#1042#1079#39'  -- '#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080 +
        #1096#1085#1077' '#1074#1079#1099#1089#1082#1072#1085#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
      
        '         when '#39'DecPaybackTimeOut'#39'  then '#39#1042#1055#1088#39'    -- '#1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1094 +
        #1077#1085#1090#1086#1074' '#1079#1072' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072' '
      
        '         when '#39'DecPaybackAdvance'#39'  then '#39#1042#1040#1074#39'    -- '#1042#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085 +
        #1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      
        '         when '#39'DecPaybackPeriodic'#39' then '#39#1042#1048#1079#1055#1077#1088#39' -- '#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080 +
        #1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099' '#1087#1088#1080' '#1087#1077#1088#1080#1086#1076'. '#1074#1088#1077#1084#1077#1085#1085#1086#1084' '#1076#1077#1082#1083#1072#1088#1080#1088#1086#1074#1072#1085#1080#1080'      '
      '       ELSE '#39#39' END as dec_type,'
      '       dpb.doc_date as dec_date,'
      '       dpb.doc_number as dec_number,'
      '       pb.DOC_NUMBER,'
      '       pb.DOC_DATE,'
      '       pb.SUMMA,  '
      '       s.INN,'
      '       s.KPP,'
      '       s.Name,'
      '       s.TypeName,'
      '       pb.ACCOUNT_K,'
      '       pb.BIC_K as BIK_K,'
      '       dpb.bank_name,'
      '       CASE st.SYSNAME '
      '         when '#39'State.PayBack.Confirm'#39'  then '#39'Y'#39'    '
      '       ELSE '#39'N'#39' END as is_confirmed -- '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1086
      ''
      'from fdc_po_payback_lst pb -- '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1054#1088#1060#1050
      '    ,fdc_decision_payback_lst dpb --'#1088#1077#1096#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
      '    ,fdc_document_lst doc -- '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      '    ,fdc_subject_lst s -- '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1080
      '    ,fdc_state_lst st -- '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      ' '
      'where pb.STATE_ID = st.ID -- '#1089#1074#1103#1079#1100' '#1089#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1084' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
      '  and pb.ID=doc.ext_id   -- '#1089#1074#1103#1079#1100' '#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
      '  and pb.recipient_id = s.id -- '#1089#1074#1103#1079#1100' '#1089' '#1076#1072#1085#1085#1099#1084#1080' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      '  and pb.dec_pay_id = dpb.id -- '#1089#1074#1103#1079#1100' '#1088#1077#1096#1077#1085#1080#1103' '#1089' '#1079#1072#1103#1074#1082#1086#1081
      '  and pb.ACCOUNT_K = :ACCOUNT'
      ''
      'order by doc.doc_date')
    Variables.Data = {
      0300000001000000080000003A4143434F554E54050000000000000000000000}
    object dsetDataOPER_DATE: TDateTimeField
      FieldName = 'OPER_DATE'
    end
    object dsetDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsetDataCUSTOMSFULLNAME: TStringField
      FieldName = 'CUSTOMSFULLNAME'
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
    object dsetDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
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
