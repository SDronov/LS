inherited DecOffsetObligationReserveWizardForm: TDecOffsetObligationReserveWizardForm
  Left = 312
  Top = 253
  Width = 689
  Height = 439
  Caption = #1052#1072#1089#1090#1077#1088' '#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1103' '#1089#1088#1077#1076#1089#1090#1074' '#1087#1086' '#1088#1077#1096#1077#1085#1080#1102
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 579
    Height = 401
    inherited btnCancel: TcxButton
      Left = 495
      Top = 369
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 414
      Top = 369
      TabOrder = 5
    end
    inherited btnPrev: TcxButton
      Left = 252
      Top = 369
      TabOrder = 3
    end
    inherited btnNext: TcxButton
      Left = 333
      Top = 369
      TabOrder = 4
    end
    inherited PageControl: TcxPageControl
      Top = 101
      Width = 330
      Height = 249
      TabOrder = 2
      ClientRectBottom = 245
      ClientRectRight = 326
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 322
          Height = 221
          inherited cxLabel1: TcxLabel
            Caption = #1042#1099#1073#1086#1088' '#1044#1058'/'#1058#1055#1054
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Align = alClient
            AutoSize = False
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1044#1058'/'#1058#1055#1054
            Height = 22
            Width = 308
          end
          object grdNotice: TcxGrid [2]
            Left = 9
            Top = 63
            Width = 250
            Height = 200
            TabOrder = 2
            object grdNoticeDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcDeclTpo
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object grdNoticeDBTableViewID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object grdNoticeDBTableViewDOC_NUMBER: TcxGridDBColumn
                Caption = #8470' '#1044#1058'/'#1058#1055#1054
                DataBinding.FieldName = 'DOC_NUMBER'
                Width = 110
              end
              object grdNoticeDBTableViewDOC_DATE: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1044#1058'/'#1058#1055#1054
                DataBinding.FieldName = 'DOC_DATE'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.SaveTime = False
                Properties.ShowTime = False
              end
              object grdNoticeDBTableViewIS_ACTIVE: TcxGridDBColumn
                DataBinding.FieldName = 'IS_ACTIVE'
                Visible = False
                Hidden = True
              end
              object grdNoticeDBTableViewACTIVATION_DATE: TcxGridDBColumn
                DataBinding.FieldName = 'ACTIVATION_DATE'
                Visible = False
                Hidden = True
              end
              object grdNoticeDBTableViewSUBJECT_ID: TcxGridDBColumn
                DataBinding.FieldName = 'SUBJECT_ID'
                Visible = False
                Hidden = True
              end
              object grdNoticeDBTableViewSUMMA: TcxGridDBColumn
                Caption = #1057#1091#1084#1084#1072
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 95
              end
              object grdNoticeDBTableViewSUMMA_PAYED: TcxGridDBColumn
                Caption = #1054#1087#1083#1072#1095#1077#1085#1086
                DataBinding.FieldName = 'SUMMA_PAYED'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 120
              end
              object grdNoticeDBTableViewDECL_NAME: TcxGridDBColumn
                Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
                DataBinding.FieldName = 'DECL_NAME'
                Width = 150
              end
              object grdNoticeDBTableViewDECL_INN: TcxGridDBColumn
                Caption = #1048#1053#1053
                DataBinding.FieldName = 'DECL_INN'
                Width = 100
              end
              object grdNoticeDBTableViewDECL_KPP: TcxGridDBColumn
                Caption = #1050#1055#1055
                DataBinding.FieldName = 'DECL_KPP'
                Width = 100
              end
            end
            object grdDeclTpoLevel: TcxGridLevel
              GridView = grdNoticeDBTableView
            end
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Item1: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = 'cxGrid1'
              ShowCaption = False
              Control = grdNotice
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabCharges: TcxTabSheet
        Caption = 'tabCharges'
        ImageIndex = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 322
          Height = 221
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel3: TcxLabel
            Left = 9
            Top = 9
            Caption = #1042#1099#1073#1086#1088' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 9
            Top = 35
            Align = alClient
            AutoSize = False
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072' '#1076#1083#1103' '#1087#1086#1075#1072#1096#1077#1085#1080#1103
            ParentColor = False
            ParentFont = False
            Properties.WordWrap = True
            Style.BorderStyle = ebsNone
            Style.HotTrack = False
            Transparent = True
            Height = 22
            Width = 308
          end
          object grdCharges: TcxGrid
            Left = 9
            Top = 63
            Width = 308
            Height = 180
            TabOrder = 2
            object grdChargesDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcCharges
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object grdChargesDBTableViewID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewDECL_ID: TcxGridDBColumn
                DataBinding.FieldName = 'DECL_ID'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewPAY_TYPE_ID: TcxGridDBColumn
                DataBinding.FieldName = 'PAY_TYPE_ID'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewPAY_TYPE_CODE: TcxGridDBColumn
                Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
                DataBinding.FieldName = 'PAY_TYPE_CODE'
                Width = 105
              end
              object grdChargesDBTableViewSUMMA_TO_PAY: TcxGridDBColumn
                Caption = #1050' '#1086#1087#1083#1072#1090#1077
                DataBinding.FieldName = 'SUMMA_TO_PAY'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 123
              end
              object grdChargesDBTableViewKBKCODE: TcxGridDBColumn
                Caption = #1050#1041#1050
                DataBinding.FieldName = 'KBKCODE'
                Width = 191
              end
              object grdChargesDBTableViewCURRENCY_CODE: TcxGridDBColumn
                Caption = #1042#1072#1083#1102#1090#1072
                DataBinding.FieldName = 'CURRENCY_CODE'
                Width = 90
              end
              object grdChargesDBTableViewSUMMA: TcxGridDBColumn
                Caption = #1057#1091#1084#1084#1072
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 123
              end
              object grdChargesDBTableViewPAYED: TcxGridDBColumn
                Caption = #1054#1087#1083#1072#1095#1077#1085#1086
                DataBinding.FieldName = 'PAYED'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 124
              end
              object grdChargesDBTableViewRESERVED_PAY: TcxGridDBColumn
                Caption = #1056#1077#1079#1077#1088#1074
                DataBinding.FieldName = 'RESERVED_PAY'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 119
              end
              object grdChargesDBTableViewCURRENCY_ID: TcxGridDBColumn
                DataBinding.FieldName = 'CURRENCY_ID'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewKBKCODE_ID: TcxGridDBColumn
                DataBinding.FieldName = 'KBKCODE_ID'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewCHARGE_MONTH: TcxGridDBColumn
                DataBinding.FieldName = 'CHARGE_MONTH'
                Visible = False
                Hidden = True
              end
              object grdChargesDBTableViewIS_TS: TcxGridDBColumn
                Caption = #1058#1057
                DataBinding.FieldName = 'IS_TS'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.DisplayChecked = #1044#1072
                Properties.DisplayUnchecked = #1053#1077#1090
                Properties.ValueChecked = 'Y'
                Properties.ValueUnchecked = 'N'
                Width = 50
              end
            end
            object grdChargesLevel: TcxGridLevel
              GridView = grdChargesDBTableView
            end
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            AutoAligns = []
            AlignHorz = ahClient
            AlignVert = avClient
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl3Item1: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel3
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item2: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel4
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item3: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Control = grdCharges
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object tabReserv: TcxTabSheet
        Caption = 'tabReserv'
        ImageIndex = 2
        object dxLayoutControl4: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 322
          Height = 221
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel5: TcxLabel
            Left = 9
            Top = 9
            Caption = #1056#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.IsFontAssigned = True
            Transparent = True
          end
          object edtReservPayTypeCode: TcxDBTextEdit
            Left = 112
            Top = 35
            DataBinding.DataField = 'PAY_TYPE_CODE'
            DataBinding.DataSource = srcReserveParams
            Enabled = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 1
            Width = 430
          end
          object edtReservMaxSumm: TcxDBCurrencyEdit
            Left = 112
            Top = 59
            DataBinding.DataField = 'SUMMA_TO_PAY'
            DataBinding.DataSource = srcReserveParams
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 2
            Width = 430
          end
          object grdReserve: TcxGrid
            Left = 9
            Top = 83
            Width = 250
            Height = 200
            TabOrder = 3
            object grdReserveDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcReserve
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0.00;-,0.00'
                  Kind = skSum
                  Column = grdReserveDBTableViewSUMMA
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.CellEndEllipsis = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.HeaderEndEllipsis = True
              OptionsView.Indicator = True
              object grdReserveDBTableViewPO_NAME: TcxGridDBColumn
                Caption = #1055#1083#1072#1090#1105#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                DataBinding.FieldName = 'PO_NAME'
                Width = 274
              end
              object grdReserveDBTableViewKBKCODE1: TcxGridDBColumn
                Caption = #1050#1041#1050' '#1086#1089#1090#1072#1090#1082#1072
                DataBinding.FieldName = 'KBKCODE1'
              end
              object grdReserveDBTableViewSUMMA: TcxGridDBColumn
                Caption = #1057#1091#1084#1084#1072
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                Width = 164
              end
            end
            object grdReserveLevel: TcxGridLevel
              GridView = grdReserveDBTableView
            end
          end
          object btnReservePOAdd: TcxButton
            Left = 469
            Top = 83
            Width = 75
            Height = 19
            Action = actReservePOAdd
            TabOrder = 4
          end
          object btnReservePOModify: TcxButton
            Left = 469
            Top = 108
            Width = 75
            Height = 19
            Action = actReservePOModify
            TabOrder = 5
          end
          object btnReservePORemove: TcxButton
            Left = 469
            Top = 133
            Width = 75
            Height = 19
            Action = actReservePORemove
            TabOrder = 6
          end
          object dxLayoutControl4Group_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutControl4Item1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              ShowCaption = False
              Control = cxLabel5
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl4Item2: TdxLayoutItem
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              Enabled = False
              Control = edtReservPayTypeCode
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl4Item3: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072' '#1082' '#1087#1086#1075#1072#1096#1077#1085#1080#1102
              Enabled = False
              Control = edtReservMaxSumm
              ControlOptions.ShowBorder = False
            end
            object lcgReserveMain: TdxLayoutGroup
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              Caption = 'lcgReserveMain'
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object dxLayoutControl4Item4: TdxLayoutItem
                AutoAligns = []
                AlignHorz = ahClient
                AlignVert = avClient
                Caption = 'cxGrid1'
                ShowCaption = False
                Control = grdReserve
                ControlOptions.ShowBorder = False
              end
              object lcgReserveMainButtons: TdxLayoutGroup
                AutoAligns = []
                AlignHorz = ahRight
                AlignVert = avClient
                Caption = 'lcgReserveMainButtons'
                ShowCaption = False
                ShowBorder = False
                object dxLayoutControl4Item5: TdxLayoutItem
                  Caption = 'cxButton1'
                  ShowCaption = False
                  Control = btnReservePOAdd
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl4Item6: TdxLayoutItem
                  Caption = 'cxButton1'
                  ShowCaption = False
                  Control = btnReservePOModify
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl4Item7: TdxLayoutItem
                  Caption = 'cxButton1'
                  ShowCaption = False
                  Control = btnReservePORemove
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
        end
      end
    end
    object edtDecidionSum: TcxCurrencyEdit [5]
      Left = 146
      Top = 40
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      TabOrder = 0
      Width = 404
    end
    object edtDecisionRest: TcxCurrencyEdit [6]
      Left = 146
      Top = 64
      EditValue = '0'
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      TabOrder = 1
      Width = 404
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lcgDecision: TdxLayoutGroup [0]
        Caption = #1056#1077#1096#1077#1085#1080#1077
        object dxLayoutControl1Item4: TdxLayoutItem
          Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
          Enabled = False
          Control = edtDecidionSum
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item5: TdxLayoutItem
          Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100
          Enabled = False
          Control = edtDecisionRest
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 401
  end
  inherited ActionList: TActionList
    object actReservePOAdd: TAction
      Category = 'Reserve'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actReservePOAddExecute
      OnUpdate = actReservePOAddUpdate
    end
    object actReservePOModify: TAction
      Category = 'Reserve'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actReservePOModifyExecute
      OnUpdate = actReservePOModifyUpdate
    end
    object actReservePORemove: TAction
      Category = 'Reserve'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actReservePORemoveExecute
      OnUpdate = actReservePORemoveUpdate
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
  object dsDeclTpo: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select dt_tpo.*'
      '      ,p_doc_charge.getdocchargesum( dt_tpo.id ) summa'
      '      ,p_doc_charge.getdocdeductionsum( dt_tpo.id ) summa_payed'
      'from ('
      '      select n.*,'
      
        '             (select sum( c.charge_rest - (select nvl(sum(summa)' +
        ',0) from fdc_decision_tmp_reserv_lst res where res.charge_id = c' +
        '.id))'
      '                    from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                         and c.is_ts   = :is_ts'
      '                         and c.is_active = '#39'Y'#39
      '             ) summ_rest'
      '      from fdc_doc_charge_lst n'
      '      where n.subject_id = :subject_id'
      
        '            and not exists(select 1 from fdc_tr tr where tr.id =' +
        ' n.id)'
      
        '            and not exists(select 1 from fdc_noticepay_charge_ls' +
        't nc where nc.decl_id = n.id)'
      '     ) dt_tpo'
      'where summ_rest > 0'
      'union /* '#1073#1099#1074#1072#1102#1090' '#1076#1091#1073#1083#1080' */'
      'select dt_tpo.*'
      '      ,p_doc_charge.getdocchargesum( dt_tpo.id ) summa'
      '      ,p_doc_charge.getdocdeductionsum( dt_tpo.id ) summa_payed'
      'from ('
      '      select n.*,'
      
        '             (select sum( c.charge_rest - (select nvl(sum(summa)' +
        ',0) from fdc_decision_tmp_reserv_lst res where res.charge_id = c' +
        '.id))'
      '                    from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                         and c.is_ts = :is_ts'
      '                         and c.is_active = '#39'Y'#39
      '            ) summ_rest'
      
        '      from fdc_doc_charge_lst n, fdc_object_lst s, fdc_nsi_subje' +
        'ct_pays_lst t'
      '      where n.subject_id = s.id'
      '            and t.subject_id = :subject_id'
      '            and s.typesysname = '#39'Person'#39
      
        '            and not exists(select 1 from fdc_tr tr where tr.id =' +
        ' n.id)'
      
        '            and not exists(select 1 from fdc_noticepay_charge_ls' +
        't nc where nc.decl_id = n.id)'
      '     ) dt_tpo'
      'where summ_rest > 0'
      'union'
      'select dt_tpo.*'
      '      ,p_doc_charge.getdocchargesum( dt_tpo.id ) summa'
      '      ,p_doc_charge.getdocdeductionsum( dt_tpo.id ) summa_payed'
      'from ('
      '      select n.*,'
      
        '             (select sum( c.charge_rest - (select nvl(sum(summa)' +
        ',0) from fdc_decision_tmp_reserv_lst res where res.charge_id = c' +
        '.id))'
      '                    from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                         and c.is_ts   = :is_ts'
      '                         and c.is_active = '#39'Y'#39
      '             ) summ_rest'
      '      from fdc_doc_charge_lst n, fdc_subjectbyls_lst ls'
      '      where n.subject_id = ls.id'
      '            and ls.parent_id = :subject_id'
      
        '            and not exists(select 1 from fdc_tr tr where tr.id =' +
        ' n.id)'
      
        '            and not exists(select 1 from fdc_noticepay_charge_ls' +
        't nc where nc.decl_id = n.id)'
      '     ) dt_tpo'
      'where summ_rest > 0'
      'union'
      'select dt_tpo.*'
      '      ,p_doc_charge.getdocchargesum( dt_tpo.id ) summa'
      '      ,p_doc_charge.getdocdeductionsum( dt_tpo.id ) summa_payed'
      'from ('
      '      select n.*,'
      
        '             (select sum( c.charge_rest - (select nvl(sum(summa)' +
        ',0) from fdc_decision_tmp_reserv_lst res where res.charge_id = c' +
        '.id))'
      '                    from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                         and c.is_ts = :is_ts'
      '                         and c.is_active = '#39'Y'#39
      '             ) summ_rest'
      '      from fdc_doc_charge_lst n, fdc_broker_contract_lst bc'
      '      where n.subject_id = bc.subject_id'
      '            and bc.broker_id = :subject_id'
      '            and bc.is_authorize = '#39'Y'#39
      
        '            and not exists(select 1 from fdc_tr tr where tr.id =' +
        ' n.id)'
      
        '            and not exists(select 1 from fdc_noticepay_charge_ls' +
        't nc where nc.decl_id = n.id)'
      '     ) dt_tpo'
      'where summ_rest > 0'
      ''
      '/*'
      'select dt_tpo.*'
      '      ,p_doc_charge.getdocchargesum( dt_tpo.id ) summa'
      '      ,p_doc_charge.getdocdeductionsum( dt_tpo.id ) summa_payed'
      'from ('
      '      select n.*'
      '      from fdc_subjectbyls_lst ls'
      '           ,fdc_doc_charge_lst n'
      '      where ls.parent_id  = :subject_id'
      '        and n.subject_id   = ls.id'
      '        and exists( '
      '                   select 0'
      '                   from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                     and c.is_ts   = :is_ts'
      '                     and c.is_active = '#39'Y'#39
      
        '                     and ( c.charge_rest - (select nvl(sum(summa' +
        '),0) from fdc_decision_tmp_reserv_lst res where res.charge_id = ' +
        'c.id)) > 0'
      
        '        and not exists(select 1 from fdc_tr tr where tr.id = n.i' +
        'd)'
      '                  )'
      '      union all'
      '      select n.*'
      '      from fdc_doc_charge_lst      n'
      '          ,fdc_broker_contract_lst bc'
      '      where bc.broker_id    = :subject_id'
      '        and n.subject_id    = bc.subject_id'
      '        and bc.is_authorize = '#39'Y'#39
      '        and exists( '
      '                   select 0'
      '                   from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                     and c.is_ts   = :is_ts'
      '                     and c.is_active = '#39'Y'#39
      
        '                     and ( c.charge_rest - (select nvl(sum(summa' +
        '),0) from fdc_decision_tmp_reserv_lst res where res.charge_id = ' +
        'c.id)) > 0'
      
        '        and not exists(select 1 from fdc_tr tr where tr.id = n.i' +
        'd)'
      '                  )'
      '      union all'
      '      select n.*'
      '      from fdc_doc_charge_lst      n'
      '          ,('
      '            select id'
      
        '            from  (select count(1) cnt  from fdc_nsi_subject_pay' +
        's_lst t where subject_id = :subject_id and rownum = 1) l'
      '                 ,fdc_subject_lst s'
      
        '            where s.typesysname = (case l.cnt when 0 then null e' +
        'lse '#39'Person'#39' end)'
      '           ) sp'
      '      where sp.id = n.subject_id'
      '        and exists( '
      '                   select 0'
      '                   from fdc_decl_charge_lst c'
      '                   where c.decl_id = n.id'
      '                     and c.is_ts   = :is_ts'
      '                     and c.is_active = '#39'Y'#39
      
        '                     and ( c.charge_rest - (select nvl(sum(summa' +
        '),0) from fdc_decision_tmp_reserv_lst res where res.charge_id = ' +
        'c.id)) > 0'
      '                  )'
      
        '        and not exists(select 1 from fdc_tr tr where tr.id = n.i' +
        'd)'
      '     ) dt_tpo'
      
        'where not exists(select 1 from fdc_noticepay_charge_lst nc where' +
        ' nc.decl_id = dt_tpo.id and rownum = 1)'
      
        '--  and not exists(select 1 from fdc_advice_charge_lst ac where ' +
        'ac.decl_id = dt_tpo.id and rownum = 1)'
      '*/')
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end>
    object dsDeclTpoNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDeclTpoSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsDeclTpoOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsDeclTpoSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsDeclTpoACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsDeclTpoSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsDeclTpoDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsDeclTpoOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsDeclTpoTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDeclTpoTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDeclTpoOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object dsDeclTpoID: TFloatField
      FieldName = 'ID'
    end
    object dsDeclTpoSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDeclTpoCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDeclTpoCUSTOM_MODE_ID: TFloatField
      FieldName = 'CUSTOM_MODE_ID'
    end
    object dsDeclTpoCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDeclTpoREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsDeclTpoDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsDeclTpoMODIFY_DATE: TDateTimeField
      FieldName = 'MODIFY_DATE'
    end
    object dsDeclTpoDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDeclTpoDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDeclTpoIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDeclTpoACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDeclTpoDECL_TYPESYSNAME: TStringField
      FieldName = 'DECL_TYPESYSNAME'
      Size = 1500
    end
    object dsDeclTpoDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDeclTpoDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDeclTpoDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDeclTpoCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDeclTpoCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDeclTpoCUSTOM_MODE_CODE: TStringField
      FieldName = 'CUSTOM_MODE_CODE'
      Size = 1500
    end
    object dsDeclTpoCUSTOM_MODE_NAME: TStringField
      FieldName = 'CUSTOM_MODE_NAME'
      Size = 1500
    end
    object dsDeclTpoDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
    end
    object dsDeclTpoAGGREMENT_ID: TFloatField
      FieldName = 'AGGREMENT_ID'
    end
    object dsDeclTpoEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDeclTpoEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDeclTpoEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDeclTpoSUMMA: TFloatField
      FieldName = 'SUMMA'
      currency = True
    end
    object dsDeclTpoSUMMA_PAYED: TFloatField
      FieldName = 'SUMMA_PAYED'
      currency = True
    end
  end
  object srcDeclTpo: TDataSource
    AutoEdit = False
    DataSet = dsDeclTpo
    Left = 40
    Top = 232
  end
  object dsCharges: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select *'
      'from ('
      '      select c.*'
      
        '            ,(c.charge_rest - (select nvl(sum(summa),0) from fdc' +
        '_decision_tmp_reserv_lst res where res.charge_id = c.id)) as sum' +
        'ma_to_pay'
      '            ,c.payment_code pay_type_code'
      '            ,c.curr_code currency_code'
      '            ,c.kbkcode_code kbkcode'
      '        from fdc_decl_charge_lst  c'
      '        where c.decl_id = :decl_id'
      '          and c.is_ts   = :is_ts'
      '          and c.is_active = '#39'Y'#39
      '     )'
      'where summa_to_pay > 0')
    Left = 104
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end>
    object dsChargesID: TFloatField
      FieldName = 'ID'
    end
    object dsChargesNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsChargesSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsChargesOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsChargesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsChargesACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsChargesSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsChargesDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsChargesOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsChargesTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsChargesTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsChargesOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object dsChargesDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsChargesDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsChargesIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsChargesACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsChargesPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsChargesSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsChargesCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsChargesDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsChargesPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsChargesPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsChargesKBKCODE_CODE: TStringField
      FieldName = 'KBKCODE_CODE'
      Size = 1500
    end
    object dsChargesKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsChargesCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsChargesCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsChargesDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 1500
    end
    object dsChargesCHARGE_MONTH: TDateTimeField
      FieldName = 'CHARGE_MONTH'
    end
    object dsChargesCHARGE_REST: TFloatField
      FieldName = 'CHARGE_REST'
    end
    object dsChargesIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsChargesPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsChargesSUMMA_TO_PAY: TFloatField
      FieldName = 'SUMMA_TO_PAY'
    end
    object dsChargesPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsChargesCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsChargesKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
  end
  object srcCharges: TDataSource
    AutoEdit = False
    DataSet = dsCharges
    Left = 102
    Top = 232
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 336
    Top = 38
    object qryGetDecisionAttrs: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT d.subject_id, d.is_ts, d.name, d.summa'
        '    INTO :subject_id, :is_ts, :dec_name, :dec_summa'
        '    FROM fdc_dec_offset_obligation_lst d'
        '    WHERE d.id = :id;'
        ''
        '  SELECT :dec_summa - nvl( SUM( n.summa ), 0 )'
        '    INTO :dec_rest'
        '    FROM fdc_decision_tmp_reserv_lst n'
        '    WHERE n.decision_id = :ID;'
        'END;')
    end
    object qryAddReserve: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  -- Call the procedure'
        '  p_dec_offset_obligation.addpayreserve'
        '    ('
        '      pdecisionid   => :decision_id'
        '     ,pdeclid       => :decl_id'
        '     ,ppayorderid   => :payment_id'
        '     ,ppaytypeid    => :pay_type_id'
        '     ,pchargecurrid => :charge_curr_id'
        '     ,pkbkcode_id   => :kbkcode_id'
        '     ,pkbkcode1_id  => :kbkcode1_id'
        '     ,pchargeid     => :charge_id'
        '     ,pchargesumma  => :charge_summa'
        '     ,psumma        => :summa'
        '    );'
        'END;')
      DataSet = dsReserve
    end
  end
  object dsReserveParams: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 136
    Top = 70
    object dsReserveParamsPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 15
    end
    object dsReserveParamsSUMMA_TO_PAY: TFloatField
      FieldName = 'SUMMA_TO_PAY'
    end
  end
  object srcReserveParams: TDataSource
    DataSet = dsReserveParams
    Left = 136
    Top = 118
  end
  object dsReserve: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = dsReserveAfterInsert
    Left = 184
    Top = 182
    object dsReserveDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsReservePAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsReservePAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsReserveCHARGE_CURR_ID: TFloatField
      FieldName = 'CHARGE_CURR_ID'
    end
    object dsReserveCHARGE_SUMMA: TFloatField
      FieldName = 'CHARGE_SUMMA'
    end
    object dsReserveCHARGE_ID: TFloatField
      FieldName = 'CHARGE_ID'
    end
    object dsReserveKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsReserveKBKCODE1_ID: TFloatField
      FieldName = 'KBKCODE1_ID'
    end
    object dsReserveSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsReserveDECISION_ID: TFloatField
      FieldName = 'DECISION_ID'
    end
    object dsReservePO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 250
    end
    object dsReserveKBKCODE1: TStringField
      FieldName = 'KBKCODE1'
      Size = 50
    end
  end
  object srcReserve: TDataSource
    DataSet = dsReserve
    Left = 184
    Top = 230
  end
  object dsPayments: TOracleDataSet
    SQL.Strings = (
      
        'SELECT to_char( id ) || '#39'&'#39' || to_char( kbkcode_id ) AS id, id A' +
        'S id_po, name, kbkcode_id, p_nsi_kbk.GetCodeById(kbkcode_id) AS ' +
        'kbkcode, SUM( summa ) AS summa'
      '  FROM ( -- '#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      
        '        SELECT r.po_name AS NAME, r.kbkcode_id, r.payment_id AS ' +
        'id, SUM( r.summa ) AS summa'
      '          FROM fdc_value_lst            v'
      '              ,fdc_reserved_payment_lst r'
      '          WHERE v.owner_object_id = :decision_id'
      '            AND v.Ref_Object_ID   = r.id'
      
        '            AND r.is_ts           = decode( :is_ts, '#39'Y'#39', r.is_ts' +
        ', :is_ts )'
      '            AND r.edate IS NULL'
      
        '            AND to_char( r.payment_id ) || '#39'&'#39' || to_char( r.kbk' +
        'code_id ) NOT IN ( :po_list )'
      '          GROUP BY r.payment_id, r.kbkcode_id, r.po_name'
      '        UNION ALL'
      '        -- '#1047#1072#1083#1086#1075#1080
      
        '        SELECT r.po_name AS NAME, r.kbkcode_id, r.payment_id AS ' +
        'id, SUM( r.summa ) AS summa'
      '          FROM fdc_reserved_payment_lst r'
      '          WHERE r.doc_id = :decision_id'
      
        '            AND r.is_ts  = decode( :is_ts, '#39'Y'#39', r.is_ts, :is_ts ' +
        ')'
      '            AND r.edate IS NULL'
      
        '            AND to_char( r.payment_id ) || '#39'&'#39' || to_char( r.kbk' +
        'code_id ) NOT IN ( :po_list )'
      '          GROUP BY r.payment_id, r.kbkcode_id, r.po_name'
      '        UNION ALL'
      '        -- '#1040#1074#1072#1085#1089#1099
      '        SELECT po.name'
      
        '              ,p_nsi_kbk.GetIdByCode( r.kbk, d.doc_date ) AS kbk' +
        'code_id'
      '              ,po.id AS payment_id'
      '              ,r.reg_sum - ( SELECT nvl( sum( rr.summa ), 0 )'
      '                               FROM fdc_reserved_payment_lst rr'
      '                               WHERE rr.payment_id = po.id'
      '                                 AND rr.kbkcode    = r.kbk'
      
        '                                 AND rr.edate      IS NULL ) AS ' +
        'summa'
      '          FROM fdc_decision_debts_lst d'
      '              ,fdc_SubjectByLs_lst    s'
      '              ,fdc_payment_order_lst  po'
      '              ,fdc_rest_reg           r'
      '          WHERE d.id          = :decision_id'
      '            AND d.typesysname = '#39'DecisionDebtsPays'#39
      '            AND r.payment_id  = po.id'
      
        '            AND (   p_nsi_kbk.IsKbkTS( r.kbk ) = decode( :is_ts,' +
        ' '#39'Y'#39', p_nsi_kbk.IsKbkTS( r.kbk ), :is_ts )'
      
        '                 OR     p_nsi_kbk.GetPrePaymentKbkIs( p_nsi_kbk.' +
        'GetIdByCode( r.kbk ) ) = '#39'Y'#39
      
        '                    AND SYSDATE < to_date( '#39'01.01.2011'#39', '#39'dd.mm.' +
        'yyyy'#39' ) )'
      '       --     AND  d.subject_id  =  po.payer_id'
      '            AND s.parent_id  =  d.subject_id'
      '            AND po.payer_id  =  s.id'
      '            AND po.rest_summa - po.locked_summa > 0'
      
        '            AND to_char( po.id ) || '#39'&'#39' || to_char( p_nsi_kbk.Ge' +
        'tIdByCode( r.kbk, d.doc_date ) ) NOT IN ( :po_list )'
      
        '            AND NOT EXISTS ( SELECT 0 FROM fdc_po_confirm_lst_al' +
        'l c WHERE c.id = po.id )'
      '        UNION ALL'
      '        -- '#1040#1074#1072#1085#1089#1099' '#1073#1088#1086#1082#1077#1088#1086#1074' '#1085#1072' '#1076#1072#1085#1085#1099#1081' '#1084#1086#1084#1077#1085#1090
      '        SELECT po.name'
      
        '              ,p_nsi_kbk.GetIdByCode( r.kbk, d.doc_date ) AS kbk' +
        'code_id'
      '              ,po.id AS payment_id'
      '              ,r.reg_sum - ( SELECT nvl( sum( rr.summa ), 0 )'
      '                               FROM fdc_reserved_payment_lst rr'
      '                               WHERE rr.payment_id = po.id'
      '                                 AND rr.kbkcode    = r.kbk'
      
        '                                 AND rr.edate      IS NULL ) AS ' +
        'summa'
      '          FROM fdc_decision_debts_lst d'
      '              ,fdc_broker_contract_lst bc'
      '              ,fdc_payment_order_lst  po'
      '              ,fdc_SubjectByLs_lst    s'
      '              ,fdc_rest_reg           r'
      '          WHERE d.id = :decision_id'
      '            AND d.typesysname = '#39'DecisionDebtsPays'#39
      '            AND r.payment_id = po.id'
      
        '            AND (   p_nsi_kbk.IsKbkTS( r.kbk ) = decode( :is_ts,' +
        ' '#39'Y'#39', p_nsi_kbk.IsKbkTS( r.kbk ), :is_ts )'
      
        '                 OR     p_nsi_kbk.GetPrePaymentKbkIs( p_nsi_kbk.' +
        'GetIdByCode( r.kbk ) ) = '#39'Y'#39
      
        '                    AND SYSDATE < to_date( '#39'01.01.2011'#39', '#39'dd.mm.' +
        'yyyy'#39' ) )'
      '            AND bc.subject_id = d.subject_id'
      
        '            AND s.parent_id = (select parent_id from fdc_subject' +
        'byls_lst where id = bc.broker_id)'
      '            AND po.payer_id = s.id'
      '            and bc.is_authorize = '#39'Y'#39
      
        '            and TRUNC(SYSDATE) between bc.begin_date and bc.end_' +
        'date'
      '            AND po.rest_summa - po.locked_summa > 0'
      
        '            AND to_char( po.id ) || '#39'&'#39' || to_char( p_nsi_kbk.Ge' +
        'tIdByCode( r.kbk, d.doc_date ) ) NOT IN ( :po_list )'
      
        '            AND NOT EXISTS ( SELECT 0 FROM fdc_po_confirm_lst_al' +
        'l c WHERE c.id = po.id )'
      '        UNION ALL'
      '        -- '#1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1086
      
        '        SELECT po.name, n.kbkcode1_id, n.payment_id, SUM( - n.su' +
        'mma ) AS summa'
      '          FROM fdc_noticepay_ded_reserv_lst n'
      '              ,fdc_po_credit_lst            po'
      '          WHERE n.decision_id = :decision_id'
      '            AND n.payment_id  = po.id'
      '          GROUP BY po.name, n.kbkcode1_id, n.payment_id'
      '       )'
      '  GROUP BY id, name, kbkcode_id'
      '  HAVING SUM( summa ) > 0')
    Variables.Data = {
      03000000030000000C0000003A4445434953494F4E5F49440400000000000000
      00000000080000003A504F5F4C49535401000000020000003000000000000600
      00003A49535F5453050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D450100000000000A0000004B424B434F44
      455F49440100000000000200000049440100000000000500000053554D4D4101
      0000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 256
    Top = 182
    object dsPaymentsNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsPaymentsKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsPaymentsSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsPaymentsKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsPaymentsID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsPaymentsID_PO: TFloatField
      FieldName = 'ID_PO'
    end
  end
end
