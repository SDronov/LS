inherited DeclCorrectForm: TDeclCorrectForm
  Left = 570
  Top = 385
  Width = 626
  Height = 433
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 524
    Height = 406
    inherited btnCancel: TcxButton
      Left = 440
      Top = 374
    end
    inherited btnOk: TcxButton
      Left = 359
      Top = 374
      ModalResult = 0
    end
    inherited btnPrev: TcxButton
      Left = 197
      Top = 374
    end
    inherited btnNext: TcxButton
      Left = 278
      Top = 374
    end
    inherited PageControl: TcxPageControl
      Width = 382
      Height = 250
      ClientRectBottom = 249
      ClientRectRight = 381
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 380
          Height = 228
          inherited cxLabel1: TcxLabel
            Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1088#1080#1095#1080#1085#1091' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '
            Style.IsFontAssigned = True
          end
          object cmbxCause: TcxLookupComboBox [2]
            Left = 91
            Top = 96
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = srcCauseList
            Properties.MaxLength = 0
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 3
            Width = 261
          end
          object edtDescrp: TcxMemo [3]
            Left = 91
            Top = 121
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            TabOrder = 4
            Height = 215
            Width = 400
          end
          object edtDate: TcxDateEdit [4]
            Left = 91
            Top = 71
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 2
            Width = 236
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            inherited dxLayoutItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
            end
            inherited dxLayoutControl2Item2: TdxLayoutItem
              Visible = False
            end
            object dxLayoutControl2Item4: TdxLayoutItem
              Caption = #1044#1072#1090#1072
              Control = edtDate
              ControlOptions.ShowBorder = False
            end
            object lciCause: TdxLayoutItem
              Caption = #1055#1088#1080#1095#1080#1085#1072
              Control = cmbxCause
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Item3: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
              CaptionOptions.AlignVert = tavTop
              Control = edtDescrp
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabCommon: TcxTabSheet
        Caption = 'tabCommon'
        ImageIndex = 1
        object lcGeneral: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 380
          Height = 228
          Align = alClient
          DragMode = dmAutomatic
          ParentBackground = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object edtSumma: TcxDBCurrencyEdit
            Left = 90
            Top = 121
            DataBinding.DataField = 'SUMMA'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.UseThousandSeparator = True
            Properties.OnChange = edtSummaPropertiesChange
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            TabOrder = 4
            Width = 214
          end
          object cmbxedtCurrID: TfdcObjectLookupEdit
            Left = 90
            Top = 90
            DataBinding.DataField = 'CURRENCY_ID'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'CODE'
              end
              item
                FieldName = 'NAME'
              end>
            Properties.ListSource = DictData.srcCurrency
            Properties.MaxLength = 0
            Properties.ReadOnly = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 3
            Width = 175
          end
          object edtDeclNo: TfdcObjectLinkEdit
            Left = 90
            Top = 15
            DataBinding.DataField = 'DECL_NO'
            DataBinding.DataSource = srcData
            DataBinding.DataKeyField = 'DECL_ID'
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
                Visible = False
              end>
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 0
            Width = 214
          end
          object edtDelta: TcxDBCurrencyEdit
            Left = 90
            Top = 146
            DataBinding.DataField = 'DELTA'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.MinValue = -920000000000000.000000000000000000
            Properties.ReadOnly = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.UseThousandSeparator = True
            Properties.OnChange = edtDeltaPropertiesChange
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clWindow
            Style.StyleController = WebEditStyleController
            TabOrder = 5
            Width = 214
          end
          object cmbxPayType: TfdcObjectLookupEdit
            Left = 90
            Top = 40
            DataBinding.DataField = 'PAY_TYPE_ID'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'CODE'
              end
              item
                FieldName = 'NAME'
              end>
            Properties.ListSource = DictData.srcPayTypes
            Properties.MaxLength = 0
            Properties.ReadOnly = False
            Properties.OnEditValueChanged = cmbxPayTypePropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 1
            Width = 175
          end
          object cmbxKBK: TfdcObjectLookupEdit
            Left = 90
            Top = 65
            DataBinding.DataField = 'KBKCODE_ID'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                Caption = #1050#1086#1076
                Width = 160
                FieldName = 'CODE'
              end
              item
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 350
                FieldName = 'NAME'
              end>
            Properties.ListSource = srcKBK
            Properties.MaxLength = 0
            Properties.ReadOnly = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 2
            Width = 175
          end
          object dxLayoutGroup3: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lciNameEdit: TdxLayoutItem
              CaptionOptions.AlignHorz = taRightJustify
              Visible = False
              ControlOptions.ShowBorder = False
            end
            object lciDeclNo: TdxLayoutItem
              Caption = #1043#1058#1044
              CaptionOptions.AlignHorz = taRightJustify
              Visible = False
              Control = edtDeclNo
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem1: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxPayType
              ControlOptions.ShowBorder = False
            end
            object lciKBK: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              Caption = #1050#1041#1050
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxKBK
              ControlOptions.ShowBorder = False
            end
            object lciCurrency: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxedtCurrID
              ControlOptions.ShowBorder = False
            end
            object lciDescriptEdit: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Visible = False
              ControlOptions.ShowBorder = False
            end
            object lciSumma: TdxLayoutItem
              Tag = 11
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lciDelta: TdxLayoutItem
              Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDelta
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabPayments: TcxTabSheet
        Caption = 'tabPayments'
        ImageIndex = 5
        object dxLayoutControl5: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 380
          Height = 228
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel5: TcxLabel
            Left = 9
            Top = 9
            Caption = #1056#1072#1079#1073#1080#1074#1082#1072' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1085#1099#1084' '#1087#1086#1088#1091#1095#1077#1085#1080#1103#1084' :'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Transparent = True
          end
          object cxButton1: TcxButton
            Left = 424
            Top = 30
            Width = 71
            Height = 19
            Action = actAdd
            TabOrder = 2
          end
          object grdPO: TcxGrid
            Left = 9
            Top = 30
            Width = 279
            Height = 169
            Align = alClient
            TabOrder = 1
            object grdPODBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcPayments
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CopyCaptionsToClipboard = False
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object grdPODBTableView1NAME: TcxGridDBColumn
                DataBinding.FieldName = 'NAME'
                Width = 171
              end
              object grdPODBTableView1SUMMA: TcxGridDBColumn
                DataBinding.FieldName = 'SUMMA'
                Width = 84
              end
              object grdPODBTableView1SUMMA_BACK: TcxGridDBColumn
                DataBinding.FieldName = 'SUMMA_BACK'
                Width = 84
              end
              object grdPODBTableView1ID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
            end
            object grdPOLevel1: TcxGridLevel
              GridView = grdPODBTableView1
            end
          end
          object cxButton2: TcxButton
            Left = 424
            Top = 55
            Width = 57
            Height = 20
            Action = actDelete
            TabOrder = 3
          end
          object dxLayoutGroup5: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutItem2: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel5
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl5Group2: TdxLayoutGroup
              AutoAligns = []
              AlignHorz = ahClient
              AlignVert = avClient
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object dxLayoutControl5Item3: TdxLayoutItem
                AutoAligns = []
                AlignHorz = ahClient
                AlignVert = avClient
                Caption = 'cxGrid1'
                ShowCaption = False
                Control = grdPO
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl5Group1: TdxLayoutGroup
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                ShowCaption = False
                Hidden = True
                ShowBorder = False
                object dxLayoutControl5Item2: TdxLayoutItem
                  Caption = 'cxButton1'
                  ShowCaption = False
                  Control = cxButton1
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl5Item1: TdxLayoutItem
                  ShowCaption = False
                  Control = cxButton2
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
        end
      end
      object tabAdMode: TcxTabSheet
        Caption = 'tabAdMode'
        ImageIndex = 3
        OnShow = tabAdModeShow
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 380
          Height = 228
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object btnFindPayorders: TcxRadioButton
            Left = 29
            Top = 30
            Width = 189
            Height = 13
            Caption = #1048#1089#1082#1072#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
            Checked = True
            ParentColor = False
            TabOrder = 1
            TabStop = True
          end
          object btnMakeDebt: TcxRadioButton
            Left = 29
            Top = 49
            Width = 189
            Height = 13
            Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
            ParentColor = False
            TabOrder = 2
          end
          object cxLabel4: TcxLabel
            Left = 9
            Top = 9
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077', '#1095#1090#1086' '#1076#1077#1083#1072#1090#1100' '#1089' '#1085#1077#1076#1086#1087#1083#1072#1095#1077#1085#1085#1086#1081' '#1089#1091#1084#1084#1086#1081' :'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Transparent = True
          end
          object dxLayoutGroup4: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl4Item1: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel4
              ControlOptions.ShowBorder = False
            end
            object dxLayoutItem4: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'cxRadioButton1'
              Offsets.Left = 20
              ShowCaption = False
              Control = btnFindPayorders
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object dxLayoutItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Offsets.Left = 20
              ShowCaption = False
              Control = btnMakeDebt
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabDoc: TcxTabSheet
        Caption = 'tabDoc'
        ImageIndex = 5
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 380
          Height = 228
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object rgDocType: TcxRadioGroup
            Left = 9
            Top = 32
            Caption = ' '#1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '
            ParentColor = False
            ParentFont = False
            Properties.Items = <
              item
                Caption = #1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077
                Value = 0
              end
              item
                Caption = #1080#1079#1083#1080#1096#1085#1077#1084' '#1074#1079#1099#1089#1082#1072#1085#1080#1080
                Value = 1
              end>
            Properties.OnChange = rgDocTypePropertiesChange
            ItemIndex = 0
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = OfficeEditStyleController
            TabOrder = 1
            Height = 64
            Width = 486
          end
          object chBDocShow: TcxCheckBox
            Left = 9
            Top = 177
            Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
            ParentColor = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = OfficeEditStyleController
            TabOrder = 5
            Width = 121
          end
          object cxLabel6: TcxLabel
            Left = 9
            Top = 9
            Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091#1095#1077#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
            ParentColor = False
            ParentFont = False
            Style.Edges = []
            Style.HotTrack = False
          end
          object edtDocNumber: TcxDBTextEdit
            Left = 100
            Top = 127
            DataBinding.DataField = 'DOC_NUMBER'
            DataBinding.DataSource = dsAdviceOrNotice
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            TabOrder = 3
            Width = 381
          end
          object edtDocDate: TcxDBDateEdit
            Left = 100
            Top = 152
            DataBinding.DataField = 'DOC_DATE'
            DataBinding.DataSource = dsAdviceOrNotice
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 4
            Width = 381
          end
          object edtDeclarant: TfdcObjectLinkEdit
            Left = 100
            Top = 102
            DataBinding.DataField = 'DECL_NAME'
            DataBinding.DataSource = dsAdviceOrNotice
            DataBinding.DataKeyField = 'SUBJECT_ID'
            DataBinding.TypeSysName = 'Declarant;Person;Broker;Bank'
            DataBinding.SearchFormClass = 'TSubjectFindGridForm'
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Enabled = False
                Kind = bkEllipsis
                Visible = False
              end>
            Properties.ReadOnly = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            TabOrder = 2
            Width = 381
          end
          object lcgDoc: TdxLayoutGroup
            ShowCaption = False
            ShowBorder = False
            object lciDocTypeNotice: TdxLayoutItem
              Caption = 'cxLabel6'
              ShowCaption = False
              Control = cxLabel6
              ControlOptions.ShowBorder = False
            end
            object lciDocTypeAdvice: TdxLayoutItem
              Caption = 'cxRadioGroup1'
              ShowCaption = False
              Control = rgDocType
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item4: TdxLayoutItem
              Tag = 33
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtDeclarant
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item1: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Control = edtDocNumber
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item2: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item3: TdxLayoutItem
              Caption = 'cxCheckBox1'
              ShowCaption = False
              Control = chBDocShow
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 406
  end
  inherited ActionList: TActionList
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actAddPO: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object actDelPO: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object dsData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select t.*,'
      '       0.0 as DELTA,'
      '       SUMMA as OLD_SUMMA,'
      '       fdc_decl_get_rate_date(decl_id) as rate_date'
      '  from fdc_decl_charge_lst t'
      ' where decl_id = :decl_id'
      'AND ID = :ID'
      '')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 4
    Top = 151
    ParamData = <
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDataNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAME'
      Size = 1500
      Calculated = True
    end
    object dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHORTNAME'
      Size = 1500
      Calculated = True
    end
    object dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OBJECT_TYPE_ID'
      Calculated = True
    end
    object dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ACCESSLEVEL'
      Calculated = True
    end
    object dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STATE_ID'
      Calculated = True
    end
    object dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'SYSNAME'
      Size = 1500
      Calculated = True
    end
    object dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRIPT'
      Size = 1500
      Calculated = True
    end
    object dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OWNER_OBJECT_ID'
      Calculated = True
    end
    object dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'TYPENAME'
      Size = 1500
      Calculated = True
    end
    object dsDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 14
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 1500
    end
    object dsDataDELTA: TFloatField
      FieldName = 'DELTA'
    end
    object dsDataOLD_SUMMA: TFloatField
      FieldName = 'OLD_SUMMA'
    end
    object dsDataRATE_DATE: TDateTimeField
      FieldName = 'RATE_DATE'
    end
    object dsDataCHARGE_MONTH: TDateTimeField
      FieldName = 'CHARGE_MONTH'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 4
    Top = 179
  end
  object Params: TfdcParamsHolder
    Params = <>
    Left = 40
    Top = 152
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 40
    Top = 184
    object sqlBackPayment: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  :result := p_doc_charge.BackPaymentWithReserve('
        '      pDeductionID => :id'
        '     ,pSumma       => :summa'
        '     ,pDate        => :Date'
        '     ,pChargeID    => :charge_id'
        '     ,pReserveID   => :reserve_id'
        '    );'
        'end;')
    end
    object sqlModifyCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := fdc_modify_charge2('
        '      pDocID       => :decl_id'
        '     ,pPayTypeID   => :pay_type_id'
        '     ,pKBK_ID      => :kbkcode_id'
        '     ,pCurrID      => :currency_id'
        '     ,pSumma       => :delta'
        '     ,pCauseID     => :cause_id'
        '     ,pDesc        => :descrip'
        '     ,pDate        => :pdate'
        '     ,pChargeMonth => :Charge_Month'
        '     ,pDebt        => :debt'
        '     ,pIsTS        => :Is_TS'
        '    );'
        'end;')
      DataSet = dsData
    end
    object sqlCreateError: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_tpo_loader.AddTPOError('
        '    :DECL_ID'
        '    ,:ID);'
        'end;')
    end
    object sqlGetSubject: TsqlOp
      SQL.Strings = (
        'begin'
        '  select subject_id into :result'
        '    from fdc_obligation_doc_lst'
        '   where id = :DECL_ID;'
        'end;')
    end
    object sqlIsKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  select 1 into :result '
        '    from fdc_kind_lst kd         '
        '   where owner_object_id = :DECL_ID'
        '     and sysname = '#39'BigPayer'#39
        '     and rownum = 1;'
        'exception'
        '  when no_data_found then'
        '    :result:= 0;'
        'end;')
    end
    object sqlPayKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_pay_knp(:ID);'
        'end;')
    end
    object sqlModifyCharge1: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_modify_charge('
        '      poDebtSumma  => :debt_summa'
        '     ,pDocID       => :decl_id'
        '     ,pPayTypeID   => :pay_type_id'
        '     ,pKBKCodeId   => :kbkcode_id'
        '     ,pCurrID      => :currency_id'
        '     ,pSumma       => :delta'
        '     ,pCauseID     => :cause_id'
        '     ,pDesc        => :descrip'
        '     ,pDate        => :pdate'
        '     ,pChargeMonth => :Charge_Month'
        '     ,pDebt        => :debt'
        '     ,pIsTS        => :Is_TS'
        '     ,pPayObjectType => :PayObjectType'
        '    );'
        'end;')
      DataSet = dsData
    end
    object sqlGetKBK: TsqlOp
      SQL.Strings = (
        'begin'
        'select t.kbkcode_id '
        'into :result'
        ' from fdc_decl_charge t '
        'where id = :Id;'
        'end;')
    end
    object sqlGetCurrencyID: TsqlOp
      SQL.Strings = (
        'begin'
        '  SELECT c.id'
        '    INTO :RESULT'
        '    FROM fdc_nsi_currency_lst c'
        '    WHERE c.code = '#39'643'#39';'
        'end;'
        '')
    end
    object sqlActivateBuffer: TsqlOp
      SQL.Strings = (
        'begin'
        
          '    -- '#1059#1073#1077#1088#1077#1084' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1087#1088#1086#1095#1077#1077' ' +
          #1089#1087#1080#1089#1072#1085#1080#1077
        '    delete fdc_document_for_activate d'
        '    where '
        '     exists (select 1 '
        '             from fdc_decl_charge de,'
        '                  fdc_doc_charge_lst s'
        '             where d.id = de.id'
        '               and de.decl_id = s.id'
        
          '               and s.TypeSysName in ('#39'SubjectFeeDebt'#39','#39'SubjectFe' +
          'eFine'#39'));'
        ''
        '   p_document.doactivatebuffer;'
        'end;')
    end
    object sqlGetSubjectName: TsqlOp
      SQL.Strings = (
        'begin'
        '  select name'
        '    into :result'
        '    from fdc_subject_lst'
        '   where id = :ID;'
        'end;')
    end
    object sqlGetIsTS: TsqlOp
      SQL.Strings = (
        'begin'
        '   :result := p_document.IsTS(:pChargeId);'
        'end;')
    end
    object sqlActivateBuffer1: TsqlOp
      SQL.Strings = (
        'begin'
        
          '    -- '#1059#1073#1077#1088#1077#1084' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090 +
          #1077' ('#1082#1088#1086#1084#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086#1073' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077' '#1087#1086' '#1050#1053#1055')'
        '    delete fdc_document_for_activate d'
        '    where id = :pDocId'
        
          '      and not exists(select 1 from fdc_object_lst where id = :pD' +
          'ocId and typesysname = '#39'AdviceKNP'#39');'
        ''
        '   p_document.doactivatebuffer;'
        'end;')
    end
    object sqlDelDocBufferActivate: TsqlOp
      SQL.Strings = (
        'begin'
        '    -- '#1059#1073#1077#1088#1077#1084' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
        '    delete fdc_document_for_activate d'
        '    where id = :pDocId;'
        ''
        'end;')
    end
    object sqlGetOthersCauseId: TsqlOp
      SQL.Strings = (
        'begin'
        '  SELECT ID'
        '  INTO :result'
        '  FROM fdc_type_correction_lst'
        '  WHERE code = '#39'90'#39';'
        'end;')
    end
    object sqlActivateBufferFull: TsqlOp
      SQL.Strings = (
        'begin'
        '   p_document.doactivatebuffer;'
        'end;')
    end
    object sqlGetSubjectParams: TsqlOp
      SQL.Strings = (
        'begin'
        '  select name, inn, kpp'
        '    into :name, :inn, :kpp'
        '    from fdc_subject_lst'
        '   where id = :ID;'
        'end;')
    end
    object sqlLinkWithAdvice: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  fdc_create_payback_periodic(pid => :id,pdecisionid => :pdecisi' +
          'onid);'
        'END;')
    end
    object sqlCreateDecisionPay: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_SubjectId fdc_subject.id%type := :SubjectId; '
        'begin'
        '  :result := fdc_dec_payback_pay_add('
        '      pdoctype         => '#39'DecPaybackPay'#39
        '     ,pdecisionnumber  => NULL'
        '     ,pdecisiondate    => NULL'
        '     ,psubjectid       => lv_SubjectId'
        '     ,pappnumber       => NULL'
        '     ,preasonid        => NULL'
        '     ,psumma           => :Summa'
        '     ,pdestsubid       => lv_SubjectId'
        '    );'
        'end;  ')
    end
  end
  object dsPayments: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    DataSource = srcData
    Filtered = True
    ReadOnly = False
    SQL.Strings = (
      'select min(p.id) id'
      '      ,sum(p.summa) summa'
      '      ,po.currency_id'
      '      ,0.0 as summa_back'
      '      ,po.name'
      '      ,po.id  payment_id'
      '      ,po.payer_id'
      '      ,po.payer_name'
      '      ,p.charge_curr_id       '
      '      ,c1.CODE summa_curr'
      '      ,c2.CODE charge_curr   '
      '      ,fdc_get_cross_rate(c1.ID, c2.ID)'
      '  from fdc_payment_deduction_lst     p'
      '      ,fdc_po_lst po  '
      '      ,fdc_nsi_currency_lst c1'
      '      ,fdc_nsi_currency_lst c2'
      '      ,fdc_dict             dp'
      '      ,fdc_dict             dk'
      ' where p.decl_id = :decl_id'
      ' and p.pay_type_id = dp.id '
      
        ' and dp.code       =  (select code from fdc_dict where id =  :pa' +
        'y_type_id)'
      ' and p.kbkcode_id  = dk.id '
      
        ' and dk.code       = (select code from fdc_dict where id = :kbkc' +
        'ode_id)         '
      ' and po.id = p.payment_id'
      ' and p.charge_curr_id = :currency_id '
      ' and c1.ID = po.currency_id'
      ' and c2.ID = p.charge_curr_id'
      
        'group by po.id, po.name, po.currency_id, p.charge_curr_id, c1.CO' +
        'DE, c2.code,fdc_get_cross_rate(c1.ID, c2.ID),po.id,po.payer_id,p' +
        'o.payer_name'
      'having sum(p.summa)>0'
      '/*select min(p.id) id'
      '      ,sum(p.summa) summa'
      '      ,po.currency_id'
      '      ,0.0 as summa_back'
      '      ,po.name'
      '      ,po.id  payment_id'
      '      ,po.payer_id'
      '      ,po.payer_name'
      '      ,p.charge_curr_id       '
      '      ,c1.CODE summa_curr'
      '      ,c2.CODE charge_curr   '
      '      ,fdc_get_cross_rate(c1.ID, c2.ID)'
      '  from fdc_payment_deduction_lst     p'
      '      ,fdc_po_lst po  '
      '      ,fdc_nsi_currency_lst c1'
      '      ,fdc_nsi_currency_lst c2'
      ' where p.decl_id = :decl_id'
      ' and p.pay_type_id = :pay_type_id'
      ' and nvl(p.kbkcode_id,0) = nvl(:kbkcode_id,0)'
      ' and po.id = p.payment_id'
      ' and p.charge_curr_id = :currency_id '
      ' and c1.ID = po.currency_id'
      ' and c2.ID = p.charge_curr_id'
      
        'group by po.id, po.name, po.currency_id, p.charge_curr_id, c1.CO' +
        'DE, c2.code,fdc_get_cross_rate(c1.ID, c2.ID),po.id,po.payer_id,p' +
        'o.payer_name'
      'having sum(p.summa)>0 */')
    OnFilterRecord = dsPaymentsFilterRecord
    Left = 8
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'kbkcode_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'kbkcode_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end>
    object dsPaymentsID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsPaymentsNAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1087#1086#1088#1091#1095'.'
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 1500
    end
    object dsPaymentsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsPaymentsSUMMA_BACK: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090
      FieldName = 'SUMMA_BACK'
    end
    object dsPaymentsPAYMENT_ID: TIntegerField
      FieldName = 'PAYMENT_ID'
    end
    object dsPaymentsPAYER_ID: TIntegerField
      FieldName = 'PAYER_ID'
    end
    object dsPaymentsPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 300
    end
  end
  object srcPayments: TDataSource
    DataSet = dsSelected
    Left = 48
    Top = 224
  end
  object dsSelected: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 264
    object dsSelectedID: TFloatField
      FieldName = 'ID'
    end
    object dsSelectedNAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object dsSelectedSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsSelectedSUMMA_BACK: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090
      FieldName = 'SUMMA_BACK'
      DisplayFormat = ',0.00'
    end
    object dsSelectedRESERVE_ID: TFloatField
      FieldName = 'RESERVE_ID'
    end
    object dsSelectedNEW_ID: TFloatField
      FieldName = 'NEW_ID'
    end
    object dsSelectedSubject_ID: TIntegerField
      FieldName = 'Subject_ID'
    end
    object dsSelectedsubject_name: TStringField
      FieldName = 'subject_name'
      Size = 1500
    end
  end
  object dsCauseList: TdxMemData
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F020000000800000006000300494400510000000100
      05004E616D650001000000000000F03F24000000CAEEF0F0E5EAF2E8F0EEE2EA
      E020F2E0ECEEE6E5EDEDEEE920F1F2EEE8ECEEF1F2E820000100000000000000
      401A000000CAEEF0F0E5EAF2E8F0EEE2EAE020EAEEE4E020F2EEE2E0F0E00001
      000000000000084018000000CFF0EEF2EEEAEEEB20EDE5F1EEEEF2E2E5F2F1E2
      E8FF200001000000000000104013000000C8F1EFF0E0E2EBE5EDE8E520EEF8E8
      E1EAE80001000000000000144007000000CFF0EEF7E5E500}
    SortOptions = []
    Left = 48
    Top = 264
    object dsCauseListID: TFloatField
      FieldName = 'ID'
    end
    object dsCauseListName: TStringField
      FieldName = 'Name'
      Size = 1500
    end
  end
  object srcCauseList: TDataSource
    DataSet = fdcCauseList
    Left = 48
    Top = 312
  end
  object fdcCauseList: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'SELECT ID, CODE'
      '      ,CODE || '#39' '#39' || NAME AS name'
      '  FROM fdc_type_correction_lst'
      '--  WHERE code <> '#39'49'#39
      '  ORDER BY code'
      '')
    Left = 304
    Top = 304
    object fdcCauseListID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object fdcCauseListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object fdcCauseListCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
  end
  object dsKBK: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'SELECT min(id)   AS id'
      '      ,code'
      '      ,min(name) AS name'
      '  FROM fdc_kbk_dict_lst'
      '  WHERE 0 = 1'
      '     OR (    :ALL_KBK = 0'
      '         AND code IN ( SELECT t1.code'
      '                         FROM fdc_kbk_dict_lst t1'
      '                             ,fdc_nsi_dict_lst t2'
      '                        WHERE t2.id = :PAY_TYPE_ID'
      '                          AND t1.code2 = t2.code '
      
        '                          AND trunc( :doc_date ) BETWEEN t1.sdat' +
        'e AND nvl( t1.edate, trunc( :doc_date) + 1 ))'
      
        '         AND trunc( :doc_date ) BETWEEN sdate AND nvl( edate, tr' +
        'unc( :doc_date) + 1 ) )'
      '     OR (    0 = 2'
      '         AND id = :kbk_id )'
      'GROUP BY code'
      '')
    BeforeOpen = dsKBKBeforeOpen
    BeforeRefresh = dsKBKBeforeOpen
    Left = 8
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ALL_KBK'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PAY_TYPE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'kbk_id'
        ParamType = ptUnknown
      end>
  end
  object srcKBK: TDataSource
    DataSet = dsKBK
    Left = 48
    Top = 352
  end
  object dsSubject: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select'
      'subject_id'
      ',decl_name'
      ',decl_inn'
      ',decl_kpp'
      'from fdc_obligation_doc_lst '
      'where id = :Id'
      ''
      '')
    Left = 364
    Top = 302
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end>
  end
  object QueryList2: TQueryList
    Session = MainData.Session
    Left = 444
    Top = 310
    object sqlAdvice_AddChargeForDecl: TsqlOp
    end
    object sqlAdvice_AddCharge: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  fdc_advice_AddCharge('
        '    pId => :ID'
        '    ,pChargeId => :pChargeId);'
        'EXCEPTION '
        '  WHEN OTHERS THEN'
        
          '   -- '#1087#1088#1086#1087#1091#1089#1090#1080#1090#1100' '#1086#1096#1080#1073#1082#1091' '#1087#1086#1074#1090#1086#1088#1085#1086#1075#1086' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1074' '#1091#1074#1077#1076#1086#1084 +
          #1083#1077#1085#1080#1077
        '   IF (SQLERRM NOT LIKE '#39'%RET-00008%'#39') THEN '
        '     RAISE;'
        '   END IF;'
        'END;')
    end
    object sqlNoticePay_AddChargeForDecl: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_NoticePay_AddChargeForDecl(pDeclId => :pDeclId'
        '                              ,pChargeId => :pChargeId);'
        'end;')
    end
    object sqlNoticePay_AddCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_NoticePay_AddCharge('
        '    pId => :pID'
        '    ,pChargeId => :pChargeId);'
        'end;')
    end
    object sqlAdvicePayAdd: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_advice_pay_add ('
        '      pDocType   => '#39'AdvicePay'#39
        '     ,pDocNumber => :doc_number'
        '     ,pDocDate   => :doc_date'
        '     ,pSubjectID => :subject_id'
        '     ,pIsTS      => :Is_TS'
        '    );'
        'end;')
    end
    object sqlAdviceLevyAdd: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_advice_levy_add ('
        '      pDocType   => '#39'AdviceLevy'#39
        '     ,pDocNumber => :doc_number'
        '     ,pDocDate   => :doc_date'
        '     ,pSubjectID => :subject_id'
        '     ,pIsTS      => :Is_TS'
        '    );'
        'end;')
    end
    object sqlAdviceUpd: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_advice_upd('
        '      pID        => :id'
        '     ,pDocNumber => :doc_number'
        '     ,pDocDate   => :doc_date'
        '    );'
        'end;')
    end
    object sqlNoticePayAdd: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_noticepay_add('
        '      pDocNumber      => :doc_number'
        '     ,pDocDate        => :doc_date'
        '     ,pSubjectID      => :subject_id'
        '     ,pDebtsReasonId  => NULL'
        '     ,pPaymentDate    => NULL'
        '     ,pPenaltySDate   => NULL'
        '     ,pPenaltyEDate   => NULL'
        '     ,pPenaltySumma   => NULL'
        '     ,pExecutionDate  => NULL'
        '     ,pIsTS           => :Is_TS'
        '    );'
        'end;')
    end
    object sqlNoticePayUpd: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_document.Modify('
        '      pDocID     => :id'
        '     ,pDocNumber => :doc_number'
        '     ,pDocDate   => :doc_date'
        '    );'
        'end;')
    end
    object sqlAdvice_AddReserve: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_advice.addreserve('
        '      pAdviceID  => :pAdviceID'
        '     ,pReserveID => :pReserveID'
        '    );'
        'end;')
    end
    object sqlAdvice_AddDeduction: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_advice.adddeduction('
        '      pAdviceID    => :pAdviceID'
        '     ,pDeductionID => :pDeductionID'
        '    );'
        'end;')
    end
    object sqlGetDeclTypeSysName: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT TypeSysName'
        '    INTO :result'
        '    FROM fdc_object_lst'
        '    WHERE id = :decl_id;'
        'EXCEPTION'
        '  WHEN no_data_found THEN'
        '    :result := '#39'<Not found>'#39';'
        'END;')
    end
    object sqlAdviceKNPAdd: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_advice_knp_add('
        '      pdoctype   => '#39'AdviceKNP'#39
        '     ,pDocNumber => :doc_number'
        '     ,pDocDate   => :doc_date'
        '     ,pSubjectID => :subject_id'
        '     ,pIsTS      => :Is_TS'
        '    );'
        'end;')
    end
    object sqlGetKNPDeduction: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT ID'
        '    INTO :result'
        '    FROM fdc_payment_deduction_all_lst'
        '    WHERE charge_id = :charge_id;'
        'END;')
    end
    object sqlAdviceDecisionAuto: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_asbc_advice_decision_auto(padviceid => :padviceid,'
        
          '                                                    pFromClient ' +
          '=> :pFromClient);'
        'end;')
    end
  end
  object dsetAdvice: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*'
      '  FROM fdc_advice_lst a'
      '  WHERE   a.subject_id = :subject_id'
      '     and  a.TYPESYSNAME = :TypeSysName'
      '     and  exists (SELECT 1'
      '                  FROM fdc_advice_charge_lst ac'
      '                  WHERE ac.decl_id = :decl_id'
      '                    AND ac.advice_id = a.id'
      '                    AND ac.advice_is_active = '#39'N'#39
      '                   /*AND rownum = 1*/ )'
      
        '    AND (   state_id    = fdc_object_get_bysysname( '#39'State'#39', '#39'Ad' +
        'vice.NoDecision'#39' )'
      '         OR TypeSysName = '#39'AdviceKNP'#39' )')
    Variables.Data = {
      0300000003000000080000003A4445434C5F4944040000000000000000000000
      0B0000003A5355424A4543545F49440300000000000000000000000C0000003A
      545950455359534E414D45050000000A00000041647669636550617900000000
      00}
    Cursor = crSQLWait
    OnApplyRecord = dsetAdviceApplyRecord
    CommitOnPost = False
    Session = MainData.Session
    AfterOpen = dsetAdviceAfterOpen
    Left = 144
    Top = 310
  end
  object dsAdviceOrNotice: TDataSource
    DataSet = dsetAdvice
    Left = 232
    Top = 310
  end
  object dsetNotice: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM fdc_noticepay_lst'
      '  WHERE   id = ( SELECT noticepay_id'
      '                 FROM fdc_noticepay_charge_lst'
      '                 WHERE decl_id = :decl_id'
      '                   AND noticepay_is_active = '#39'N'#39
      '                   AND rownum = 1 )')
    Variables.Data = {
      0300000001000000080000003A4445434C5F4944040000000000000000000000}
    Cursor = crSQLWait
    OnApplyRecord = dsetAdviceApplyRecord
    CommitOnPost = False
    Session = MainData.Session
    AfterOpen = dsetAdviceAfterOpen
    Left = 144
    Top = 358
  end
end
