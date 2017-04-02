inherited DeclTempAdmGoodsGridForm: TDeclTempAdmGoodsGridForm
  Left = 293
  Top = 229
  Caption = #1058#1086#1074#1072#1088#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA_PR
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'SUMMA'
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'SUMMA_PR'
              Column = grdDataDBBandedTableViewSUMMA_PR
            end>
          OptionsSelection.CellSelect = False
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1059#1089#1083#1086#1074#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086
          end
          object grdDataDBBandedTableViewSUMMA_PR: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_PR'
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_BEGIN'
            GroupIndex = 1
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_END'
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Caption = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1090#1086#1074#1072#1088#1086#1074
    end
    object actHistory: TAction
      Category = 'Object'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnExecute = actHistoryExecute
      OnUpdate = actHistoryUpdate
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
  inherited BarManager: TdxBarManager
    Bars = <
      item
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 474
        FloatTop = 327
        FloatClientWidth = 58
        FloatClientHeight = 206
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnExpand
            Visible = True
          end
          item
            Item = btnCollapse
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end>
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      28
      0)
    inherited btnOpen: TdxBarButton
      Visible = ivInCustomizing
    end
    object dxBarButton2: TdxBarButton
      Action = actHistory
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        SourceField = dsDataCURRENCY_ID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT g.*'
      '      ,g.no || '#39':'#39' || g.goods_name gpname'
      '      ,c.decl_goods_id'
      '      ,c.id AS charge_id'
      '      ,c.pay_type_id'
      '      ,c.pay_type_name'
      '      ,c.pay_type_code'
      '      ,c.pay_mode_id'
      '      ,c.pay_mode_name'
      '      ,c.pay_mode_code'
      '      ,c.summa'
      '      ,c.currency_code'
      '      ,c.currency_id'
      '      ,CASE'
      '         WHEN pay_type_code IN ('#39'10'#39
      '                               ,'#39'100'#39
      
        '                               ,'#39'1010'#39') or c.pay_mode_code = '#39#1042#1042 +
        #39' THEN'
      '          0'
      '         ELSE'
      '          round((summa / 100 * 3) * 100) / 100'
      '       END summa_pr'
      '      ,c.date_begin'
      '      ,c.date_end'
      '  FROM fdc_decl_goods_lst g'
      '      ,fdc_goods_charge_lst c'
      ' WHERE g.decl_id = :id'
      '       AND c.decl_goods_id = g.ID'
      'UNION ALL'
      'SELECT g.*'
      '      ,g.no || '#39':'#39' || g.goods_name gpname'
      '      ,TO_NUMBER( NULL ) AS decl_goods_id'
      '      ,TO_NUMBER( NULL ) AS charge_id'
      '      ,TO_NUMBER( NULL ) AS pay_type_id'
      '      ,TO_CHAR( NULL ) AS pay_type_name'
      '      ,TO_CHAR( NULL ) AS pay_type_code'
      '      ,TO_NUMBER( NULL ) AS pay_mode_id'
      '      ,TO_CHAR( NULL ) AS pay_mode_name'
      '      ,TO_CHAR( NULL ) AS pay_mode_code'
      '      ,TO_NUMBER( NULL ) AS summa'
      '      ,TO_CHAR( NULL ) AS currency_code'
      '      ,TO_NUMBER( NULL ) AS currency_id'
      '      ,TO_NUMBER( NULL ) AS summa_pr'
      '      ,TO_DATE( NULL ) AS date_begin'
      '      ,TO_DATE( NULL ) AS date_end'
      '  FROM fdc_decl_goods_lst g'
      ' WHERE g.decl_id = :id'
      '       AND NOT EXISTS ( SELECT 1 FROM fdc_goods_charge_lst c'
      '                         WHERE c.decl_goods_id = g.id )'
      ''
      '/*select g.*,'
      '       g.no||'#39':'#39'||g.goods_name gpname,'
      '       c.id as charge_id,'
      '       c.pay_type_id,'
      '       c.pay_type_name,'
      '       c.pay_type_code,'
      '       c.pay_mode_id,'
      '       c.pay_mode_name,'
      '       c.pay_mode_code,'
      '       c.summa,'
      '       c.currency_code,'
      '       g.id decl_goods_id,'
      '       c.currency_id,'
      '       case when pay_type_code in ('#39'10'#39','#39'100'#39','#39'1010'#39')then'
      '            0'
      '            else'
      '            round((summa /100 * 3)*100)/100'
      '       end summa_pr,'
      '       c.date_begin,'
      '       c.date_end'
      '  from fdc_decl_goods_lst g, fdc_goods_charge_lst c'
      ' where g.owner_object_id = :id'
      '   and c.owner_object_id(+) = g.ID'
      '*/')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataCHARGE_ID: TFloatField
      FieldName = 'CHARGE_ID'
    end
    object dsDataDECL_GOODS_ID: TFloatField
      FieldName = 'DECL_GOODS_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataSUMMA_PR: TFloatField
      DisplayLabel = #1045#1078#1077#1084#1077#1089#1103#1095#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
      DisplayWidth = 40
      FieldName = 'SUMMA_PR'
    end
    object dsDataDATE_BEGIN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATE_BEGIN'
    end
    object dsDataDATE_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATE_END'
    end
  end
end
