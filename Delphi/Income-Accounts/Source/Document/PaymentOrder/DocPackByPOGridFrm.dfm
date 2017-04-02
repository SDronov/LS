inherited DocPackByPOGridForm: TDocPackByPOGridForm
  Width = 772
  Height = 367
  Caption = 'DocPackByPOGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 315
    Width = 764
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 459
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 459
      end
      inherited pnlProgress: TPanel
        Width = 459
        inherited lblProgress: TcxLabel
          Width = 459
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 672
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 312
    Width = 764
  end
  inherited pnlWorkspace: TPanel
    Width = 764
    Height = 286
    inherited splSearchCriteria: TSplitter
      Height = 286
    end
    inherited pnlSearchCriteria: TPanel
      Height = 286
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 266
        inherited btnSearch: TcxButton
          Top = 235
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 206
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 559
      Height = 286
      inherited grdData: TcxGrid
        Width = 559
        Height = 286
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewDirection: TcxGridDBBandedColumn [3]
            DataBinding.FieldName = 'DIRECTION'
            Width = 124
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Width = 277
            Position.ColIndex = 5
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 137
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_NAME'
            Width = 123
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = False
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
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
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
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT dp.*, s.NAME AS State_Name, '
      
        '       CASE WHEN dp.Receiver_Soft_Code = p_params.ApplicationCod' +
        'e THEN '#39#1042#1093#1086#1076#1103#1097#1080#1081#39' ELSE '#39#1048#1089#1093#1086#1076#1103#1097#1080#1081#39' END AS Direction'
      
        'FROM fdc_doc_pack_payments_lst dp, fdc_rel_pack_docs_lst r, fdc_' +
        'state_lst s'
      'WHERE r.Object_ID = dp.ID'
      '  AND r.Rel_Object_ID = :ID'
      #9'AND s.id (+) = dp.STATE_ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Visible = False
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
      Visible = False
    end
    object dsDataSTATE_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 120
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataDIRECTION: TStringField
      DisplayLabel = #1058#1080#1087' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DIRECTION'
      Size = 9
    end
  end
end
