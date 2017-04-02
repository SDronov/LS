inherited MeasuresByNoticeGridForm: TMeasuresByNoticeGridForm
  Width = 880
  Height = 436
  Caption = 'MeasuresByNoticeGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 373
    Width = 864
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 561
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 561
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 561
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 561
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 771
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 370
    Width = 864
  end
  inherited pnlWorkspace: TPanel
    Width = 864
    Height = 342
    inherited splSearchCriteria: TSplitter
      Height = 342
    end
    inherited pnlSearchCriteria: TPanel
      Height = 342
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 322
        inherited btnSearch: TcxButton
          Top = 291
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Top = 262
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 659
      Height = 342
      inherited grdData: TcxGrid
        Width = 659
        Height = 342
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 160
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 146
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMEASURES_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MEASURES_TYPE'
            Width = 73
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCONCLUSIONDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103' '#1086#1073' '#1086#1090#1082#1072#1079#1077
            DataBinding.FieldName = 'CONCLUSIONDATE'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMeasuaresInfo: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MEASURES_INFO'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '     , CASE t.measures_type'
      
        '         WHEN '#39'B09'#39' THEN '#39#1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080' '#1085#1072' '#1087#1088#1080#1079#1085#1072#1085#1080#1077' '#1079#1072 +
        #1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39
      
        '         WHEN '#39'B10'#39' THEN '#39#1056#1077#1096#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080' '#1086' '#1087#1088#1080#1079#1085#1072#1085#1080#1080' '#1079#1072#1076#1086#1083#1078#1077#1085#1085 +
        #1086#1089#1090#1080' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39
      
        '         WHEN '#39#1042'44'#39' THEN '#39#1042#1099#1085#1077#1089#1077#1085#1086' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1074#1086#1076#1077' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086 +
        #1089#1090#1080' '#1085#1072' '#1079#1072#1073#1072#1083#1072#1085#1089#1086#1074#1099#1081' '#1091#1095#1077#1090#39
      
        '         WHEN '#39'B45'#39' THEN '#39#1042#1099#1085#1077#1089#1077#1085#1086' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1079#1099#1089#1082#1072#1085#1080#1080' '#1079#1072' '#1089#1095#1077#1090' '#1080 +
        #1084#1091#1097#1077#1089#1090#1074#1072' '#39
      
        '         ELSE fdc_object_get_name(fdc_dict_get_bycode('#39'DebtsDicM' +
        'easuresOnCollecting'#39',t.measures_type,0))'
      '       END measures_info'
      '  from fdc_debts_measures_lst t'
      ' where Owner_Object_ID = :ID'
      'order BY t.doc_date')
    inherited dsDataID: TFloatField
      Visible = False
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      Visible = False
    end
    inherited dsDataSTATE_ID: TFloatField
      Visible = False
    end
    inherited dsDataACCESSLEVEL: TFloatField
      Visible = False
    end
    inherited dsDataSYSNAME: TStringField
      Visible = False
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Visible = False
    end
    inherited dsDataTYPESYSNAME: TStringField
      Visible = False
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Visible = False
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
      Visible = False
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
    object dsDataMEASURES_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1084#1077#1088#1099
      FieldName = 'MEASURES_TYPE'
      Visible = False
      Size = 3
    end
    object dsDataPAYMENTS_DETAILS: TStringField
      FieldName = 'PAYMENTS_DETAILS'
      Visible = False
      Size = 200
    end
    object dsDataCUSTOMSDOC: TStringField
      FieldName = 'CUSTOMSDOC'
      Visible = False
      Size = 4000
    end
    object dsDataCHIEFCUSTOMS: TStringField
      FieldName = 'CHIEFCUSTOMS'
      Visible = False
      Size = 200
    end
    object dsDataCHIEFOTP: TStringField
      FieldName = 'CHIEFOTP'
      Visible = False
      Size = 200
    end
    object dsDataEXECUTOR: TStringField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldName = 'EXECUTOR'
      Visible = False
      Size = 200
    end
    object dsDataCONCLUSIONDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
      FieldName = 'CONCLUSIONDATE'
    end
    object dsDataOK: TIntegerField
      DisplayLabel = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
      FieldName = 'OK'
    end
    object dsDataMEASURES_INFO: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1084#1077#1088#1099
      DisplayWidth = 60
      FieldName = 'MEASURES_INFO'
      Size = 100
    end
  end
end
