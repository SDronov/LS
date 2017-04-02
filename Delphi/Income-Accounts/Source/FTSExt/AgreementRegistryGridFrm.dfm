inherited AgreementRegistryGridForm: TAgreementRegistryGridForm
  Width = 709
  Height = 500
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1087#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103#1084' '#1089' '#1050#1053#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 448
    Width = 701
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 396
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 396
      end
      inherited pnlProgress: TPanel
        Width = 396
        inherited lblProgress: TcxLabel
          Width = 396
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 609
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 445
    Width = 701
  end
  inherited pnlWorkspace: TPanel
    Width = 701
    Height = 419
    inherited splSearchCriteria: TSplitter
      Height = 419
    end
    inherited pnlSearchCriteria: TPanel
      Height = 419
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 399
        inherited btnSearch: TcxButton
          Top = 368
          TabOrder = 9
        end
        inherited edtName: TcxTextEdit
          Left = 73
          Top = 9
          Width = 184
        end
        object edtCustCode: TcxTextEdit [2]
          Left = 90
          Top = 88
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 96
        end
        object edtFromDate: TcxDateEdit [3]
          Left = 90
          Top = 112
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 96
        end
        object edtToDate: TcxDateEdit [4]
          Left = 90
          Top = 136
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 96
        end
        object edtNumRee: TcxTextEdit [5]
          Left = 90
          Top = 160
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 96
        end
        object edtKNPName: TcxTextEdit [6]
          Left = 90
          Top = 228
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 69
        end
        object edtKNPINN: TcxTextEdit [7]
          Left = 90
          Top = 252
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 69
        end
        object cmbxAgrmtId: TfdcObjectLookupEdit [8]
          Left = 73
          Top = 33
          DataBinding.DataField = 'ID'
          DataBinding.DataSource = srcAgrmData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DictData.srcAgreements
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 55
        end
        inherited btnSearchClear: TcxButton
          Top = 339
          TabOrder = 8
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            CaptionOptions.Layout = clLeft
            Visible = False
          end
          object lciAgrmtId: TdxLayoutItem [1]
            Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
            Control = cmbxAgrmtId
            ControlOptions.ShowBorder = False
          end
          object lcgRegistry: TdxLayoutGroup [2]
            Caption = #1056#1077#1077#1089#1090#1088
            object lciCustCode: TdxLayoutItem
              Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
              Control = edtCustCode
              ControlOptions.ShowBorder = False
            end
            object lciFromDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1089
              Control = edtFromDate
              ControlOptions.ShowBorder = False
            end
            object lciToDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1087#1086
              Control = edtToDate
              ControlOptions.ShowBorder = False
            end
            object lciNumRee: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088
              Control = edtNumRee
              ControlOptions.ShowBorder = False
            end
          end
          object lcgKNP: TdxLayoutGroup [3]
            Caption = #1050#1053#1055
            object lciKNPName: TdxLayoutItem
              Caption = #1053#1072#1080#1084'.'
              Control = edtKNPName
              ControlOptions.ShowBorder = False
            end
            object lciKNPINN: TdxLayoutItem
              Caption = #1048#1053#1053
              Control = edtKNPINN
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 496
      Height = 419
      inherited grdData: TcxGrid
        Width = 496
        Height = 419
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REG_DATE'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_REE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME'
            Width = 333
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAGREEMENT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AGREEMENT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAGREEMENT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AGREEMENT_NAME'
            Width = 162
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_KNP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_KNP'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERR_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 15
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
    inherited btnAdd: TdxBarButton
      Enabled = False
      Visible = ivNever
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select /*+ FIRST_ROWS INDEX_DESC(fdc_custom_decl, FDC_CUSTOM_DEC' +
        'L_AK) */ '
      ' a.*'
      ',fdc_decl_has_error(a.id) ERR_COUNT'
      '  from fdc_doc_pack_gtd_knp_lst a'
      ' where rownum <= :MaxRecordCount'
      '    and a.Customs_Code > '#39' '#39
      '/*$p#name#*/    and upper(a.decl_name) like upper(:Name)'
      
        '/*$p#decl_name#*/    and upper(a.decl_name) like upper(:decl_nam' +
        'e)'
      '/*$p#from_date#*/  and a.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and a.Reg_Date <= :to_date'
      '/*$p#AGRMT_ID#*/   and a.agreement_id = :AGRMT_ID'
      '/*$p#CUST_CODE#*/  and a.Customs_Code like :CUST_CODE'
      '/*$p#NUM_REE#*/  and a.num_ree like :NUM_REE'
      '/*$p#INN_KNP#*/  and a.inn_knp like :INN_KNP'
      '--order by a.Reg_Date desc, a.Customs_Code')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'decl_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AGRMT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUST_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUM_REE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN_KNP'
        ParamType = ptUnknown
      end>
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'REG_DATE'
    end
    object dsDataDECL_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
      Visible = False
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 200
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataAGREEMENT_ID: TFloatField
      FieldName = 'AGREEMENT_ID'
      Visible = False
    end
    object dsDataAGREEMENT_NAME: TStringField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'AGREEMENT_NAME'
      Size = 1500
    end
    object dsDataINN_KNP: TStringField
      DisplayLabel = #1048#1053#1053' '#1050#1053#1055
      FieldName = 'INN_KNP'
      Size = 24
    end
    object dsDataNUM_REE: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM_REE'
      Size = 24
    end
    object dsDataERR_COUNT: TFloatField
      FieldName = 'ERR_COUNT'
      Visible = False
    end
  end
  object dsAgrmData: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 268
    Top = 132
    object dsAgrmDataID: TIntegerField
      FieldName = 'ID'
    end
  end
  object srcAgrmData: TDataSource
    DataSet = dsAgrmData
    Left = 316
    Top = 132
  end
end
