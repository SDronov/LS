inherited ReestrSKPNoticeGridForm: TReestrSKPNoticeGridForm
  Left = 340
  Top = 543
  Width = 603
  Height = 385
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 333
    Width = 595
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 290
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 290
      end
      inherited pnlProgress: TPanel
        Width = 290
        inherited lblProgress: TcxLabel
          Width = 290
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 503
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 330
    Width = 595
  end
  inherited pnlWorkspace: TPanel
    Width = 595
    Height = 304
    inherited splSearchCriteria: TSplitter
      Height = 304
    end
    inherited pnlSearchCriteria: TPanel
      Height = 304
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 284
        inherited btnSearch: TcxButton
          Top = 253
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 224
          TabOrder = 2
        end
        object cbDirection: TcxComboBox [3]
          Left = 9
          Top = 63
          ParentFont = False
          Properties.Items.Strings = (
            #1041#1077#1079' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
            #1048#1084#1087#1086#1088#1090
            #1069#1082#1089#1087#1086#1088#1090)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Text = #1041#1077#1079' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
          Width = 183
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciDirection: TdxLayoutItem [1]
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            CaptionOptions.Layout = clTop
            Control = cbDirection
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 390
      Height = 304
      inherited grdData: TcxGrid
        Width = 390
        Height = 304
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          inherited grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            OnCustomDrawCell = grdDataDBBandedTableViewTYPESYSNAMECustomDrawCell
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 60
            Width = 60
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECTKINDLIST'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_CODE_S: TcxGridDBBandedColumn
            Caption = #1050#1041#1050', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBK_CODE_S'
            Width = 163
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_CODE_T: TcxGridDBBandedColumn
            Caption = #1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBK_CODE_T'
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'DIRECTION'
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
        end
      end
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
      'select nkl.*'
      'from fdc_rel_reestr_skindpay_lst rnl'
      '    ,fdc_bud_specify_kindpay_lst   nkl'
      'where rnl.object_id = :ID'
      '  and rnl.rel_object_id = nkl.id'
      '  and nvl(nkl.direction,'#39' '#39')=nvl(:pdirection,'#39' '#39')'
      '  and (:Name is null or upper(nkl.NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pdirection'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataKBK_CODE_S: TStringField
      FieldName = 'KBK_CODE_S'
      Size = 1500
    end
    object dsDataKBK_CODE_T: TStringField
      FieldName = 'KBK_CODE_T'
      Size = 1500
    end
    object dsDataCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataDIRECTION: TStringField
      FieldName = 'DIRECTION'
      Size = 2
    end
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
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataKBK_SOURCE_ID: TFloatField
      FieldName = 'KBK_SOURCE_ID'
    end
    object dsDataKBK_TARGET_ID: TFloatField
      FieldName = 'KBK_TARGET_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
  end
end
