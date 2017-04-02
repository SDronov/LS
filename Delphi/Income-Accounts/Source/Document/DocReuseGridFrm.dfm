inherited DocReuseGridForm: TDocReuseGridForm
  Left = 343
  Top = 206
  Width = 590
  Height = 346
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1105#1090#1077' '#1084#1077#1078#1076#1091' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084#1080' '#1086#1088#1075#1072#1085#1072#1084#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 287
    Width = 582
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
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Top = 2
      Width = 276
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 276
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 276
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 276
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 489
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 284
    Width = 582
  end
  inherited pnlWorkspace: TPanel
    Width = 582
    Height = 256
    inherited splSearchCriteria: TSplitter
      Height = 256
    end
    inherited pnlSearchCriteria: TPanel
      Height = 256
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 236
        object Label3: TLabel [0]
          Left = 9
          Top = 48
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
          Color = 16311512
          ParentColor = False
        end
        object Label_Doc: TLabel [1]
          Left = 9
          Top = 241
          Width = 83
          Height = 13
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Left = 100
          Top = 409
          TabOrder = 13
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 100
          Top = 380
          TabOrder = 12
        end
        object edtFromDateActiveted: TcxDateEdit [5]
          Left = 76
          Top = 67
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 116
        end
        object edtToDateActiveted: TcxDateEdit [6]
          Left = 76
          Top = 91
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          OnKeyDown = edtSearchKeyDown
          Width = 116
        end
        object editINN: TcxTextEdit [7]
          Left = 76
          Top = 115
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          OnKeyDown = edtSearchKeyDown
          Width = 183
        end
        object editKPP: TcxTextEdit [8]
          Left = 76
          Top = 139
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          OnKeyDown = edtSearchKeyDown
          Width = 157
        end
        object editNameSubject: TcxTextEdit [9]
          Left = 9
          Top = 178
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          OnKeyDown = edtSearchKeyDown
          Width = 157
        end
        object editDoc_Number: TcxTextEdit [10]
          Left = 9
          Top = 217
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          OnKeyDown = edtSearchKeyDown
          Width = 167
        end
        object editfrom_Doc_date: TcxDateEdit [11]
          Left = 76
          Top = 260
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          OnKeyDown = edtSearchKeyDown
          Width = 141
        end
        object editto_doc_date: TcxDateEdit [12]
          Left = 76
          Top = 284
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          OnKeyDown = edtSearchKeyDown
          Width = 141
        end
        object editFrom_Custom: TcxTextEdit [13]
          Left = 76
          Top = 308
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          OnKeyDown = edtSearchKeyDown
          Width = 141
        end
        object editto_custom: TcxTextEdit [14]
          Left = 76
          Top = 332
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          OnKeyDown = edtSearchKeyDown
          Width = 108
        end
        object editStateName: TcxTextEdit [15]
          Left = 76
          Top = 356
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          OnKeyDown = edtSearchKeyDown
          Width = 100
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaLabel3: TdxLayoutItem [1]
            ShowCaption = False
            Control = Label3
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtFromDateActiveted: TdxLayoutItem [2]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDateActiveted
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtToDateActiveted: TdxLayoutItem [3]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDateActiveted
            ControlOptions.ShowBorder = False
          end
          object lciSearchINN: TdxLayoutItem [4]
            Caption = #1048#1053#1053
            Control = editINN
            ControlOptions.ShowBorder = False
          end
          object lciSearchKPP: TdxLayoutItem [5]
            Caption = #1050#1055#1055
            Control = editKPP
            ControlOptions.ShowBorder = False
          end
          object lciSearchNameSubject: TdxLayoutItem [6]
            AutoAligns = [aaHorizontal]
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
            CaptionOptions.Layout = clTop
            Control = editNameSubject
            ControlOptions.ShowBorder = False
          end
          object lciSearchDoc_Number: TdxLayoutItem [7]
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
            CaptionOptions.Layout = clTop
            Control = editDoc_Number
            ControlOptions.ShowBorder = False
          end
          object lciLableDoc: TdxLayoutItem [8]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            ShowCaption = False
            Control = Label_Doc
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciSearchFrom_Doc_date: TdxLayoutItem [9]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = editfrom_Doc_date
            ControlOptions.ShowBorder = False
          end
          object lciSearchto_doc_date: TdxLayoutItem [10]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = editto_doc_date
            ControlOptions.ShowBorder = False
          end
          object lciSearchFrom_Custom: TdxLayoutItem [11]
            Caption = #1089' '#1090#1072#1084#1086#1078#1085#1080' '
            Control = editFrom_Custom
            ControlOptions.ShowBorder = False
          end
          object lciSearchto_custom: TdxLayoutItem [12]
            Caption = #1085#1072' '#1090#1072#1084#1086#1078#1085#1102' '
            Control = editto_custom
            ControlOptions.ShowBorder = False
          end
          object lciSearchStateName: TdxLayoutItem [13]
            Caption = #1089#1090#1072#1090#1091#1089
            Control = editStateName
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 377
      Height = 256
      inherited grdData: TcxGrid
        Width = 377
        Height = 256
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn [1]
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE_OLD: TcxGridDBBandedColumn
            Caption = #1057' '#1090#1072#1084#1086#1078#1085#1080
            DataBinding.FieldName = 'CUSTOMS_CODE_OLD'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE_NEW: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE_NEW'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AMOUNT'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_NAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSIGNED_BY: TcxGridDBBandedColumn
            Caption = #1055#1086#1076#1087#1080#1089#1072#1074#1096#1077#1077' '#1083#1080#1094#1086
            DataBinding.FieldName = 'SIGNED_BY'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SIGN_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 77
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1091#1089
            DataBinding.FieldName = 'STATE_NAME'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_SYSNAME'
            Visible = False
            Hidden = True
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_SOURCE'
            Width = 250
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_TARGET: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_TARGET'
            Width = 250
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actDoForm: TAction
      Category = 'Data'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      Visible = False
      OnExecute = actDoFormExecute
    end
    object actRemoveFromPack: TAction
      Category = 'Object'
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      ImageIndex = 7
      Visible = False
      OnExecute = actRemoveFromPackExecute
      OnUpdate = actRemoveFromPackUpdate
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
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            Item = btnRemoveFromPack
            Visible = True
          end
          item
            BeginGroup = True
            Item = barBtnDoForm
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
      28
      0)
    object barBtnDoForm: TdxBarButton
      Action = actDoForm
      Category = 0
    end
    object btnRemoveFromPack: TdxBarButton
      Action = actRemoveFromPack
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select rc.*'
      '      ,c.code as currency_code'
      '      ,c.name as currency_name'
      '      ,s.name as subject_name'
      '      ,s.inn'
      '      ,s.kpp'
      '      ,st.name state_name'
      '      ,st.sysname state_sysname'
      '      ,co.name AS customs_source'
      '      ,ci.name AS customs_target'
      '  from fdc_doc_reuse_customs_lst rc'
      
        '  left outer join fdc_subject_lst      s  on s.id = rc.subject_i' +
        'd'
      
        '  left outer join fdc_nsi_currency_lst c  on c.id = rc.currency_' +
        'id'
      '  left outer join fdc_state_lst        st on st.id = rc.state_id'
      
        '  LEFT OUTER JOIN fdc_customs_lst      co ON co.customs_code_8 =' +
        ' rc.customs_code_old'
      
        '  LEFT OUTER JOIN fdc_customs_lst      ci ON ci.customs_code_8 =' +
        ' rc.customs_code_new'
      ' where (:name is null or upper(rc.name) like upper(:name))'
      
        '/*$p#from_date_activeted#*/ and (:from_date_activeted is null or' +
        ' rc.activation_date >= :from_date_activeted)'
      
        '/*$p#to_date_activeted#*/   and (:to_date_activeted is null or r' +
        'c.activation_date  <= :to_date_activeted)'
      
        '/*$p#inn#*/   and (:inn is null or upper(s.inn) like upper(:inn)' +
        ')'
      
        '/*$p#kpp#*/   and (:kpp is null or upper(s.kpp) like upper(:kpp)' +
        ')'
      
        '/*$p#subject_name#*/   and (:subject_name is null or upper(s.nam' +
        'e) like upper(:subject_name))'
      
        '/*$p#doc_number#*/   and (:doc_number is null or upper(rc.doc_nu' +
        'mber) like upper(:doc_number))'
      
        '/*$p#from_doc_date#*/ and (:from_doc_date is null or rc.doc_date' +
        ' >= :from_doc_date)'
      
        '/*$p#to_doc_date#*/ and (:to_doc_date is null or rc.doc_date <= ' +
        ':to_doc_date)'
      
        '/*$p#customs_code_old#*/   and (:customs_code_old is null or rc.' +
        'customs_code_old like :customs_code_old)'
      
        '/*$p#customs_code_new#*/   and (:customs_code_new is null or rc.' +
        'customs_code_new like :customs_code_new)'
      
        '/*$p#state_name#*/   and (:state_name is null or upper(st.name) ' +
        'like upper(:state_name))'
      '   /*pack_section*/')
    SourceServerObject = 'FDC_DOC_REUSE_CUSTOMS_LST'
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date_activeted'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date_activeted'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'subject_name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'subject_name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'from_doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'from_doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'to_doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'to_doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customs_code_old'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customs_code_old'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customs_code_new'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customs_code_new'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'state_name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'state_name'
        ParamType = ptInput
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataCUSTOMS_NEW_ID: TFloatField
      FieldName = 'CUSTOMS_NEW_ID'
    end
    object dsDataCUSTOMS_CODE_OLD: TStringField
      FieldName = 'CUSTOMS_CODE_OLD'
      Size = 8
    end
    object dsDataCUSTOMS_CODE_NEW: TStringField
      DisplayLabel = #1053#1072' '#1090#1072#1084#1086#1078#1085#1102
      FieldName = 'CUSTOMS_CODE_NEW'
      Size = 8
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataAMOUNT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'AMOUNT'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCURRENCY_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataCURRENCY_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_NAME'
      Size = 1500
    end
    object dsDataSIGN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
      FieldName = 'SIGN_DATE'
    end
    object dsDataSIGNED_BY: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1072#1074#1096#1077#1077' '#1083#1080#1094#1086' '
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF_OTP: TStringField
      FieldName = 'SIGNED_BY_CHIEF_OTP'
      Size = 50
    end
    object dsDataREASON: TStringField
      FieldName = 'REASON'
      Size = 150
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
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
    object dsDataCUSTOMS_SOURCE: TStringField
      DisplayLabel = #1057' '#1090#1072#1084#1086#1078#1085#1080' ('#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077')'
      FieldName = 'CUSTOMS_SOURCE'
      Size = 1500
    end
    object dsDataCUSTOMS_TARGET: TStringField
      DisplayLabel = #1053#1072' '#1090#1072#1084#1086#1078#1085#1102' ('#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077')'
      FieldName = 'CUSTOMS_TARGET'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  object pkgCommon: TOraclePackage
    Session = MainData.Session
    Cursor = crSQLWait
    Left = 232
    Top = 174
  end
end
