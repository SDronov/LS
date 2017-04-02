inherited DictPathDocpackGridForm: TDictPathDocpackGridForm
  Caption = #1055#1091#1090#1080' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080'/'#1074#1099#1075#1088#1091#1079#1082#1080' '#1082#1086#1085#1074#1077#1088#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 2
        end
        object editcustoms_code: TcxTextEdit [3]
          Left = 9
          Top = 63
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 50
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1072':'
          end
          object lcicustoms_code: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1072':'
            CaptionOptions.Layout = clTop
            Control = editcustoms_code
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
            DataBinding.FieldName = 'CUSTOM_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSOFTNAME: TcxGridDBBandedColumn
            Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'SOFTNAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077
            DataBinding.FieldName = 'CODE'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn
            Caption = #1042#1093#1086#1076#1103#1097#1080#1077
            DataBinding.FieldName = 'CODE2'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 224
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 252
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 364
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 392
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 308
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 336
  end
  inherited imglAction: TImageList
    Left = 308
  end
  inherited imglLarge: TImageList
    Left = 336
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    Left = 280
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 224
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_dict_path_docpack_lst'
      'where (:name is null or upper(custom_name) like upper(:name))'
      
        '  and (:customs_code_8 is null or customs_code_8 like :customs_c' +
        'ode_8)'
      '  and (rownum <= :maxrecordcount)')
    Left = 252
    ParamData = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'maxrecordcount'
        ParamType = ptUnknown
      end>
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsDataCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
    object dsDataFULLCODE: TStringField
      FieldName = 'FULLCODE'
      Size = 4000
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataOWNERSYSNAME: TStringField
      FieldName = 'OWNERSYSNAME'
      Size = 1500
    end
    object dsDataOWNERTYPENAME: TStringField
      FieldName = 'OWNERTYPENAME'
      Size = 1500
    end
    object dsDataOWNERTYPESYSNAME: TStringField
      FieldName = 'OWNERTYPESYSNAME'
      Size = 1500
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataSOFT_ID: TFloatField
      FieldName = 'SOFT_ID'
    end
    object dsDataSOFTNAME: TStringField
      FieldName = 'SOFTNAME'
      Size = 1500
    end
    object dsDataSOFTCODE: TStringField
      FieldName = 'SOFTCODE'
      Size = 1500
    end
    object dsDataCUSTOM_NAME: TStringField
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
  end
  inherited srcData: TDataSource
    Left = 252
  end
  inherited dlgExportData: TSaveDialog
    Left = 280
  end
  inherited GridPopupMenu: TcxGridPopupMenu
    Left = 392
  end
  inherited pmnGridDataDBBandedTableView: TdxBarPopupMenu
    Left = 364
  end
end
