inherited DecisionPaymentForm: TDecisionPaymentForm
  Left = 311
  Top = 261
  Width = 1280
  Height = 830
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1074' '#1089#1095#1105#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1264
    Height = 792
    ClientRectBottom = 768
    ClientRectRight = 1264
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1258
        Height = 737
        inherited edtName: TcxDBTextEdit
          Top = -157
          Width = 1347
        end
        inherited edtDescript: TcxDBMemo
          Top = 819
          TabOrder = 36
          Height = 223
          Width = 1172
        end
        object edtDecisionCourt: TcxDBCheckBox [2]
          Left = 21
          Top = 249
          Caption = #1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
          Enabled = False
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ImmediatePost = True
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 22
        end
        object edtExcisePay: TcxDBCheckBox [3]
          Left = 21
          Top = 357
          Caption = #1085#1072' '#1087#1086#1082#1091#1087#1082#1091' '#1072#1082#1094#1080#1079#1085#1099#1093' '#1084#1072#1088#1086#1082
          DataBinding.DataField = 'EXCISE_PAY'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ImmediatePost = True
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 25
          Width = 121
        end
        object edtCourtActAttrs: TcxDBTextEdit [4]
          Left = 161
          Top = 303
          DataBinding.DataField = 'COURT_ACT_ATTRS'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 23
          Width = 767
        end
        object edtCustomsDecAttrs: TcxDBTextEdit [5]
          Left = 161
          Top = 330
          DataBinding.DataField = 'CUSTOMS_DEC_ATTRS'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 24
          Width = 767
        end
        object edtReasonAticle: TcxTextEdit [6]
          Left = 1148
          Top = 222
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 18
          Width = 72
        end
        object edtSumma: TcxDBCurrencyEdit [7]
          Left = 60
          Top = 417
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 880
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 161
          Top = 26
          Width = 978
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 993
          Top = 26
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Left = 161
          Top = 53
          Width = 1234
        end
        inherited edtAppDate: TcxDBDateEdit
          Left = 161
          Top = 124
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Left = 410
          Top = 124
        end
        inherited edtAppNumber: TcxDBTextEdit
          Left = 161
          Top = 151
        end
        object cbBeforeAfter: TcxComboBox [14]
          Left = 1099
          Top = 249
          Enabled = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1076#1086' '#1074#1099#1087#1091#1089#1082#1072
            #1087#1086#1089#1083#1077' '#1074#1099#1087#1091#1089#1082#1072)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 21
          OnClick = cbBeforeAfterClick
          Width = 121
        end
        object cbDocBasement: TcxComboBox [15]
          Left = 167
          Top = 249
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
            #1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
            #1087#1086' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1084#1091' '#1083#1080#1089#1090#1091
            #1074' '#1087#1086#1088#1103#1076#1082#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1074#1077#1076#1086#1084#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1103
            #1074' '#1089#1074#1103#1079#1080' '#1089' '#1091#1076#1086#1074#1083#1077#1090#1074#1086#1088#1077#1085#1080#1077#1084' '#1078#1072#1083#1086#1073
            
              #1079#1072#1095#1077#1090' '#1076#1077#1085#1077#1078#1085#1077#1075#1086' '#1079#1072#1083#1086#1075#1072' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1095#1072#1089#1090#1100#1102' 16 '#1089#1090#1072#1090#1100#1080' 149 '#1060#1077#1076 +
              #1077#1088#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1086#1085#1072' 27 '#1085#1086#1103#1073#1088#1103' 2010 '#1075'. '#8470' 311-'#1060#1047)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 121
        end
        inherited edtSignBy: TcxDBTextEdit
          Left = 161
          Top = 752
          TabOrder = 34
          Width = 767
        end
        inherited edtSignDate: TcxDBDateEdit
          Left = 161
          Top = 779
          TabOrder = 35
          Width = 767
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Left = 161
          Top = 698
          TabOrder = 32
          Width = 767
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Left = 161
          Top = 725
          TabOrder = 33
          Width = 767
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Left = 161
          Top = 222
          Enabled = False
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ListOptions.ColumnSorting = False
          Properties.OnCloseUp = cmbxReasonPropertiesCloseUp
          Width = 739
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Left = 161
          Top = -99
          Width = 1234
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Left = 161
          Top = -72
        end
        inherited edtDocCode: TcxDBTextEdit
          Left = 410
          Top = -72
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Top = -45
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 410
          Top = 151
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Left = 161
          Top = 276
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 22
          Width = 1111
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Left = 161
          Top = 475
          TabOrder = 27
          Width = 767
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 560
          TabOrder = 29
          Width = 811
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 587
          TabOrder = 30
          Width = 811
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 614
          TabOrder = 31
          Width = 811
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Left = 161
          Top = 502
          TabOrder = 28
          Width = 767
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 565
          Top = -72
          Width = 617
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1099
          Top = -72
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = -45
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = -45
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = -45
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgApp: TdxLayoutGroup
            inherited lcgAppNumber: TdxLayoutGroup
              inherited lciAppNumberIncome: TdxLayoutItem
                Tag = 22
              end
            end
          end
          inherited lcgReason: TdxLayoutGroup
            object lcgReasonAticle: TdxLayoutGroup [0]
              Caption = 'New Group'
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciReasonPayment: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
                Control = cmbxReason
                ControlOptions.ShowBorder = False
              end
              object lciReasonAticle: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1057#1090#1072#1090#1100#1103
                Control = edtReasonAticle
                ControlOptions.ShowBorder = False
              end
            end
            object lcgCourt: TdxLayoutGroup [1]
              Caption = 'New Group'
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDecisionCourt: TdxLayoutItem
                Caption = 'cxDBCheckBox1'
                Enabled = False
                ShowCaption = False
                Visible = False
                Control = edtDecisionCourt
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem1: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1086#1082#1091#1084#1077#1085#1090'-'#1086#1089#1085#1086#1074#1072#1085#1080#1077' *'
                Control = cbDocBasement
                ControlOptions.ShowBorder = False
              end
              object lcBeforeAfter: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1087#1086' '#1088#1077#1096#1077#1085#1080#1103#1084', '#1087#1088#1080#1085#1103#1090#1099#1084
                Control = cbBeforeAfter
                ControlOptions.ShowBorder = False
              end
            end
            inherited lciSudReason: TdxLayoutItem [2]
            end
            object lciCourtActAttrs: TdxLayoutItem [3]
              Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1089#1091#1076#1077#1073#1085#1086#1075#1086' '#1072#1082#1090#1072
              Enabled = False
              Control = edtCourtActAttrs
              ControlOptions.ShowBorder = False
            end
            object lciCustomsDecAttrs: TdxLayoutItem [4]
              Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1088#1077#1096#1077#1085#1080#1103' '#1058#1054
              Enabled = False
              Control = edtCustomsDecAttrs
              ControlOptions.ShowBorder = False
            end
            object lciExcisePay: TdxLayoutItem [5]
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = edtExcisePay
              ControlOptions.ShowBorder = False
            end
            inherited lciReason: TdxLayoutItem [6]
              Enabled = False
              Visible = False
              Control = nil
            end
          end
          object lciSumma: TdxLayoutItem [5]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1264
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 737
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 765
        Width = 1264
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1261
        Height = 737
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1044#1058', '#1058#1055#1054
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1264
        Height = 768
        ClientRectBottom = 744
        ClientRectRight = 1264
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 809
        FloatTop = 164
        FloatClientWidth = 162
        FloatClientHeight = 94
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = btGetDebts
            Visible = True
          end
          item
            Item = btnCreateActCorrOB
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '  ,CASE '
      '     WHEN d.decl_inn IS NOT NULL THEN '
      '       '#39#1048#1053#1053' '#39' || d.decl_inn'
      '     ELSE '#39#39
      '   END AS INN'
      '  ,CASE'
      
        '     WHEN (s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subje' +
        'ct'#39') AND d.decl_kpp IS NOT NULL THEN'
      '       '#39'/'#1050#1055#1055' '#39' || d.decl_kpp'
      '     ELSE '#39#39
      '   END AS KPP'
      
        '  ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa AS d' +
        'ebts_summa_s'
      '  ,Trunc(d.summa) AS rub'
      
        '  ,TRIM(TO_CHAR(TRUNC ((d.summa - Trunc(d.summa))*100), '#39'00'#39')) A' +
        'S kopp'
      '  , i.kbkcode_id'
      '  , k.code as kbkcode'
      
        '  ,UPPER(fdc_valuestring_sys_get( '#39'CustomsName'#39' )) AS CustomsNam' +
        'e'
      '  ,fdc_valuestring_sys_get( '#39'BossName'#39' )    AS BossName'
      ' ,fdc_valuestring_sys_get( '#39'BossRank'#39' )    AS BossRank'
      '  ,CASE '
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN d.decl_address '
      '   END AS address'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN '
      '        (SELECT '#39#1087#1072#1089#1087#1086#1088#1090' '#39' || p.ser_no || '#39' '#39' || p.doc_no'
      '           FROM fdc_person_lst p'
      '           WHERE p.id = s.ID '
      '             AND p.ser_no IS NOT NULL'
      '             AND p.doc_no IS NOT NULL)'
      '   END AS passport'
      '  ,0 as SUMMA_BASE'
      'FROM fdc_decision_payment_Lst d'
      '       , ( SELECT p.kbkcode_id'
      '           FROM fdc_value_lst v'
      '               ,fdc_reserved_payment p'
      '           WHERE v.owner_object_id = :ID'
      '             AND v.ref_object_id   = p.id ) i'
      '        , fdc_kbk_dict_lst k'
      '        ,fdc_subject_lst s'
      'WHERE d.ID = :ID'
      '  AND i.kbkcode_id = k.id'
      '  AND d.subject_id = s.ID'
      '')
    AfterScroll = dsDataAfterScroll
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    inherited dsDataREASON_ID: TFloatField
      Required = True
    end
    inherited dsDataSUD_REASON_ID: TFloatField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
    end
    object dsDataSUMMA: TFloatField [42]
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataEXCISE_PAY: TStringField
      FieldName = 'EXCISE_PAY'
      Size = 1
    end
    object dsDataDECISION_COURT: TStringField
      FieldName = 'DECISION_COURT'
      Required = True
      Size = 1
    end
    object dsDataDATE_COURT: TDateTimeField
      FieldName = 'DATE_COURT'
    end
    object dsDataCOURT_ACT_ATTRS: TStringField
      FieldName = 'COURT_ACT_ATTRS'
      Size = 50
    end
    object dsDataCUSTOMS_DEC_ATTRS: TStringField
      FieldName = 'CUSTOMS_DEC_ATTRS'
      Size = 50
    end
    object dsDataKBKCODE: TStringField
      FieldName = 'KBKCODE'
    end
    object dsDataCUSTOMSNAME: TStringField
      FieldName = 'CUSTOMSNAME'
      Size = 300
    end
    object dsDataBOSSNAME: TStringField
      FieldName = 'BOSSNAME'
      Size = 200
    end
    object dsDataRUB: TIntegerField
      FieldName = 'RUB'
    end
    object dsDataKOPP: TStringField
      FieldName = 'KOPP'
      Size = 2
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
    end
    object dsDataADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 200
    end
    object dsDataPASSPORT: TStringField
      FieldName = 'PASSPORT'
      Size = 69
    end
    object dsDataBOSSRANK: TStringField
      FieldName = 'BOSSRANK'
      Size = 150
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :result ::= fdc_decision_payment_add('
      '      pdoctype         => '#39'DecisionPayment'#39
      '     ,pdecisionnumber  => :doc_number'
      '     ,pdecisiondate    => :doc_date'
      '     ,psubjectid       => :subject_id'
      '     ,pappnumber       => :app_number'
      '     ,pappdate         => :app_date'
      '     ,pappdateincome   => :app_date_income'
      '     ,preasonid        => :reason_id'
      '     ,pdoccode         => :doc_code'
      '     ,pdocosncode      => :doc_osn_code'
      '     ,psudreasonid     => :sud_reason_id'
      '     ,pdebtssumma      => :debts_summa'
      '     ,pexcisepay       => :excise_pay'
      '     ,pdecisioncourt   => :decision_court'
      '     ,pdatecourt       => :date_court'
      '     ,pcourtactattrs   => :court_act_attrs'
      '     ,pcustomsdecattrs => :customs_dec_attrs'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'result'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_date_income'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_osn_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sud_reason_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'debts_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'excise_pay'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decision_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'court_act_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'customs_dec_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_payment_upd('
      '      pid               => :id'
      '     ,pdecisionnumber   => :doc_number'
      '     ,pdecisiondate     => :doc_date'
      '     ,pappnumber        => :app_number'
      '     ,pappdate          => :app_date'
      '     ,pappdateincome    => :app_date_income'
      '     ,preasonid         => :reason_id'
      '     ,psignedby         => :signed_by'
      '     ,psignedbychief    => :signed_by_chief'
      '     ,psignedbychiefudf => :signed_by_chief_udf'
      '     ,psigndate         => :sign_date'
      '     ,pdoccode          => :doc_code'
      '     ,pdocosncode       => :doc_osn_code'
      '     ,psudreasonid      => :sud_reason_id'
      '     ,pdebtssumma       => :debts_summa'
      '     ,pexcisepay        => :excise_pay'
      '     ,pdecisioncourt    => :decision_court'
      '     ,pdatecourt        => :date_court'
      '     ,pcourtactattrs    => :court_act_attrs'
      '     ,pcustomsdecattrs  => :customs_dec_attrs'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app_date_income'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by_chief'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by_chief_udf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sign_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_osn_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sud_reason_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'debts_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'excise_pay'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decision_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'court_act_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'customs_dec_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited odsGetBoss: TOracleDataSet
    Left = 851
    Top = 266
  end
  inherited dsAssetsReason: TOracleDataSet
    Left = 635
    Top = 282
  end
  object qryPT_SUMS: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = True
    SQL.Strings = (
      'SELECT pt.code, SUM( - ad.summa ) AS summa'
      '  FROM fdc_rel_advice_dec_lst   r'
      '      ,fdc_advice_reserve_lst   ar'
      '      ,fdc_advice_deduction_lst ad'
      '      ,fdc_dict_lst             pt'
      '  WHERE r.rel_object_id = :ID'
      '    AND r.object_id     = ar.advice_id'
      '    AND EXISTS ( SELECT 0'
      '                   FROM fdc_value_lst v'
      '                   WHERE v.owner_object_id = :ID'
      '                     AND v.ref_object_id   = ar.id )'
      '    AND ad.advice_id   = ar.advice_id'
      '    AND - ad.summa     = ar.summa'
      '    AND ad.pay_type_id = pt.id(+)'
      '  GROUP BY pt.code')
    Left = 355
    Top = 418
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryPT_SUMSCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object qryPT_SUMSSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object qryDetail: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY dc.doc_date, po.doc_date, po.' +
        'doc_number) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END           AS po_type'
      '      ,po.doc_number AS po_num'
      '      ,po.doc_date   AS po_date'
      '      ,po.doc_summa  AS po_sum'
      '      ,dc.name       AS od_num'
      '      ,pt.code       AS od_pt'
      
        '      ,SUM( - ad.summa ) over (PARTITION BY dc.name, pt.code) AS' +
        ' od_cor'
      '      ,- ad.summa    AS reuse_sum'
      '  FROM fdc_rel_advice_dec_lst   r'
      '      ,fdc_advice_reserve_lst   ar'
      '      ,fdc_advice_deduction_lst ad'
      '      ,fdc_dict_lst             pt'
      '      ,fdc_po_credit_lst        po'
      '      ,fdc_doc_charge_lst       dc'
      '  WHERE r.rel_object_id = :ID'
      '    AND r.object_id     = ar.advice_id'
      '    AND EXISTS ( SELECT 0'
      '                   FROM fdc_value_lst v'
      '                   WHERE v.owner_object_id = :ID'
      '                     AND v.ref_object_id   = ar.id )'
      '    AND ad.advice_id   = ar.advice_id'
      '    AND - ad.summa     = ar.summa'
      '    AND ad.payment_id  = ar.payment_id'
      '    AND ad.decl_id     = ar.doc_id'
      '    AND ad.pay_type_id = pt.id(+)'
      '    AND ad.payment_id  = po.id'
      '    AND ad.decl_id     = dc.id'
      '  ORDER BY dc.doc_date, po.doc_date, po.doc_number')
    Left = 435
    Top = 418
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryDetailPP: TFloatField
      FieldName = 'PP'
    end
    object qryDetailPO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      Size = 1500
    end
    object qryDetailPO_NUM: TStringField
      FieldName = 'PO_NUM'
      Size = 100
    end
    object qryDetailPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object qryDetailPO_SUM: TFloatField
      FieldName = 'PO_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDetailOD_NUM: TStringField
      FieldName = 'OD_NUM'
      Size = 1500
    end
    object qryDetailOD_PT: TStringField
      FieldName = 'OD_PT'
      Size = 1500
    end
    object qryDetailOD_COR: TFloatField
      FieldName = 'OD_COR'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDetailREUSE_SUM: TFloatField
      FieldName = 'REUSE_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object qryPOList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT r.po_name'
      '  FROM fdc_reserved_payment_lst r'
      '      ,fdc_value_lst            v'
      '  WHERE v.owner_object_id = :ID'
      '    AND r.id = v.ref_object_id')
    Left = 443
    Top = 346
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qryDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT d.name AS decl_name'
      '  FROM fdc_rel_advice_dec_lst l'
      '      ,fdc_advice_charge_lst  c'
      '      ,fdc_object_lst         d'
      '  WHERE l.rel_object_id = :id'
      '    AND c.advice_id     = l.object_id'
      '    AND d.id            = c.decl_id')
    Left = 491
    Top = 346
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsArticleList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select ar.code2'
      '  from fdc_assets_reason_lst ar'
      ' where ar.id = :REASON_ID')
    Left = 552
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end>
    object dsArticleListCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
  end
  object dsASSETS: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select a.name as AssetsName'
      '  from fdc_assets_dict_lst a'
      '      ,fdc_value_lst v'
      '      ,fdc_rel_advice_dec_lst r'
      ' where v.owner_object_id = r.Obj_Type_ID'
      '   AND r.REL_OBJECT_ID = :ID    '
      '   and v.sysname = '#39'AssetsDictCode'#39
      '   and v.stringvalue = a.code')
    Left = 616
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsASSETSASSETSNAME: TStringField
      FieldName = 'ASSETSNAME'
      Size = 1500
    end
  end
  object dsBasements: TOracleDataSet
    SQL.Strings = (
      'select doc_code, code_name, ord from '
      '('
      
        ' select '#39'Y'#39' as doc_code, '#39#1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072#39' as code_name, 1 as or' +
        'd from dual'
      '  union'
      
        ' select '#39'E'#39' as doc_code, '#39#1087#1086' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1084#1091' '#1083#1080#1089#1090#1091#39' as code_name' +
        ', 2 as ord from dual'
      '  union'
      
        ' select '#39'F'#39' as doc_code, '#39#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1074#1077#1076#1086#1084#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1082#1086 +
        #1085#1090#1088#1086#1083#1103#39' as code_name, 3 as ord from dual'
      '  union'
      
        ' select '#39'G'#39' as doc_code, '#39#1074' '#1089#1074#1103#1079#1080' '#1089' '#1091#1076#1086#1074#1083#1077#1090#1074#1086#1088#1077#1085#1080#1077#1084' '#1078#1072#1083#1086#1073#39' as co' +
        'de_name, 4 as ord from dual'
      '  union'
      
        ' select '#39'H'#39' as doc_code, '#39#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#39' as code_name, ' +
        '0 as ord from dual'
      ') '
      'order by ord')
    QBEDefinition.QBEFieldDefs = {
      040000000300000008000000444F435F434F444501000000000009000000434F
      44455F4E414D45010000000000030000004F5244010000000000}
    Session = MainData.Session
    Left = 131
    Top = 362
    object dsBasementsDOC_CODE: TStringField
      FieldName = 'DOC_CODE'
      Size = 1
    end
    object dsBasementsCODE_NAME: TStringField
      FieldName = 'CODE_NAME'
      Size = 44
    end
  end
  object srcBasements: TDataSource
    AutoEdit = False
    DataSet = dsBasements
    Left = 67
    Top = 362
  end
end
