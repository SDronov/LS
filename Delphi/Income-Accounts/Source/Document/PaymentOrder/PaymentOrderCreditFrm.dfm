inherited PaymentOrderCreditForm: TPaymentOrderCreditForm
  Left = 652
  Top = 222
  Width = 789
  Height = 747
  Caption = 'PaymentOrderCreditForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 773
    Height = 709
    ClientRectBottom = 685
    ClientRectRight = 773
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 767
        Height = 654
        inherited edtDescript: TcxDBMemo
          Top = 627
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 376
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 520
        end
        inherited btnSaveNew: TcxButton
          Left = 579
          Top = 653
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 501
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 653
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Left = 660
        end
        inherited edtDescript2: TcxDBMemo
          Top = 594
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 647
        end
        inherited edtNote: TcxDBMemo
          Height = 20
        end
        inherited gbxPaymentFor: TcxGroupBox
          inherited dxLayoutControl1: TdxLayoutControl
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 316
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 558
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 434
            end
          end
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          DataBinding.TypeSysName = 'Customs'
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Width = 121
        end
        inherited edtCustomsName: TcxDBTextEdit
          Left = 373
        end
        inherited edtUIN: TcxDBTextEdit
          Top = 567
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 773
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 654
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 682
        Width = 773
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 770
        Height = 654
      end
    end
    inherited tabConfirmation: TcxTabSheet
      inherited lcConfirm: TdxLayoutControl
        Width = 773
        Height = 685
        inherited edtCnfrmDocDate: TcxDBDateEdit
          Left = 579
        end
        inherited edtCnfrmPayerKPP: TcxDBTextEdit
          Left = 565
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 773
        Height = 685
        ClientRectBottom = 661
        ClientRectRight = 773
      end
    end
    inherited tabBankInfo: TcxTabSheet
      inherited lcBankInfo: TdxLayoutControl
        Width = 773
        Height = 685
        inherited edtBankInfoDocNumber: TcxDBTextEdit
          Left = 160
        end
        inherited edtBankInfoDocDate: TcxDBDateEdit
          Left = 315
        end
        inherited edtBankInfoExecDate: TcxDBDateEdit
          Left = 605
        end
        inherited edtBankInfoPayerName: TcxDBTextEdit
          Left = 160
        end
        inherited edtBankInfoPayerINN: TcxDBTextEdit
          Left = 160
        end
        inherited edtBankInfoPayerKPP: TcxDBTextEdit
          Left = 382
        end
        inherited edtBankInfoPayerBIK: TcxDBTextEdit
          Left = 160
        end
        inherited edtBankInfoPayerAccount: TcxDBTextEdit
          Left = 346
        end
        inherited edtBankInfoRecepientName: TcxDBTextEdit
          Left = 160
          Top = 263
          TabOrder = 9
        end
        inherited edtBankInfoRecepientINN: TcxDBTextEdit
          Left = 160
          Top = 290
          TabOrder = 10
        end
        inherited edtBankInfoRecepientKPP: TcxDBTextEdit
          Left = 382
          Top = 290
          TabOrder = 11
        end
        inherited edtBankInfoRecepientBIK: TcxDBTextEdit
          Left = 160
          Top = 317
          TabOrder = 12
        end
        inherited edtBankInfoRecepientAccount: TcxDBTextEdit
          Left = 346
          Top = 317
          TabOrder = 13
        end
        inherited edtBankInfoPaymentInfo: TcxDBMemo
          Top = 399
          TabOrder = 15
        end
        object edtDestOld: TcxDBTextEdit [14]
          Left = 160
          Top = 236
          DataBinding.DataField = 'DESTCUSTOMSCODE_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        object edtKBKOld: TcxDBTextEdit [15]
          Left = 37
          Top = 357
          DataBinding.DataField = 'KBK_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 350
        end
        inherited adtBankInfoPaymentReason: TcxDBTextEdit
          Left = 160
          Top = 552
          TabOrder = 17
        end
        inherited edtBankInfoValPaymentType: TcxDBTextEdit
          Left = 296
          Top = 552
          TabOrder = 18
        end
        inherited edtBankInfoValDocNumber: TcxDBTextEdit
          Left = 160
          Top = 579
          TabOrder = 19
        end
        inherited edtBankInfoValDocDate: TcxDBDateEdit
          Left = 539
          Top = 579
          TabOrder = 20
        end
        inherited edtUIN2: TcxDBTextEdit
          Left = 37
          Top = 494
          TabOrder = 16
        end
        inherited lcBankInfoGroup_Root: TdxLayoutGroup
          inherited lcgBankInfoRecipient: TdxLayoutGroup
            object lciDestOld: TdxLayoutItem [0]
              Tag = 23
              Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1072'   '
              Control = edtDestOld
              ControlOptions.ShowBorder = False
            end
          end
          object lciKBKOld: TdxLayoutItem [3]
            Tag = 23
            Caption = #1050#1041#1050'  '
            Control = edtKBKOld
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    object tabPaymentOrderNonId: TcxTabSheet
      Caption = #1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1087'.'#1087'.'
      ImageIndex = 11
      OnShow = tabPaymentOrderNonIdShow
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
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 103
        FloatClientHeight = 119
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
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton1
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = btnCancelReserve3Year
            Visible = True
          end
          item
            Item = btnCorrect
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
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
      'select t.*'
      
        '      ,decode(sign(t.rest_summa - t.locked_summa),1,t.rest_summa' +
        ' - t.locked_summa,0) as rest_summa2'
      '      ,nn.id payment_order_non_id'
      '  from fdc_Payment_Order_Agg_Lst t'
      '      ,fdc_payment_order_non_id_lst nn'
      ' where t.ID = :ID'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      'order by t.is_payment_for desc')
    object dsDataKBK_OLD: TStringField
      FieldName = 'KBK_OLD'
    end
    object dsDataDESTCUSTOMSCODE_OLD: TStringField
      FieldName = 'DESTCUSTOMSCODE_OLD'
      Size = 10
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Size = 0
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
    end
    object dsDataPAYMENT_ORDER_NON_ID: TFloatField
      FieldName = 'PAYMENT_ORDER_NON_ID'
    end
  end
  inherited QueryList1: TQueryList
    inherited sqlCheckPO: TsqlOp
      SQL.Strings = (
        'declare'
        'lv_Count number;'
        'begin'
        '  -- '#1055#1088#1086#1074#1077#1088#1080#1084' '#1077#1089#1090#1100' '#1083#1080' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1089' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
        '  select count(*) '
        '  into lv_Count '
        '  from (  select sum(p.summa)'
        '          from fdc_payment_deduction_lst p '
        '          where p.payment_id = :pID'
        '            and (:TypeSysName not in ('#39'PaymentOrderReuse'#39')'
        
          '                 or p.TypeSysName not in ('#39'DocDeductionReuse'#39','#39'P' +
          'aymentDeductionReuseCancel'#39','#39'PaymentDeduction.ActChangeOstKBK'#39') ' +
          ')'
        '          group by'
        '               payment_id'
        '              ,pay_type_id'
        
          '              ,case when p.typesysname = '#39'PaymentBack'#39' then null' +
          ' else p.decl_id end'
        '              ,charge_curr_id'
        '              ,kbkcode_id'
        '          Having sum(p.summa)<>0)    '
        '  ;'
        '  if lv_Count > 0 then'
        '       fdc_util.Abort('
        
          '            pMessage => '#39'<<'#1055#1086' '#1076#1072#1085#1085#1086#1084#1091' '#1087#1083#1072#1090#1077#1078#1085#1086#1084#1091' '#1087#1086#1088#1091#1095#1077#1085#1080#1102' '#1089#1091#1097#1077#1089 +
          #1090#1074#1091#1102#1090' '#1089#1087#1080#1089#1072#1085#1080#1103'!>>'#39' || chr(10) ||'
        
          '            '#39'<<'#1044#1083#1103' '#1087#1086#1074#1090#1086#1088#1085#1086#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1086#1090#1084#1077#1085#1080#1090#1100' '#1089 +
          #1087#1080#1089#1072#1085#1080#1103'!>>'#39
        '          );'
        '  end if;'
        ''
        '  -- '#1055#1088#1086#1074#1077#1088#1080#1084' '#1077#1089#1090#1100' '#1083#1080' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1085#1072' '#1087#1083#1072#1090#1077#1078#1085#1086#1084' '#1087#1086#1088#1091#1095#1077#1085#1080#1080
        '  select count(*) '
        '  into lv_Count '
        '  from fdc_reserved_payment_lst p '
        '  where p.payment_id = :pID'
        '    and p.edate is null;'
        '  if lv_Count > 0 then'
        '       fdc_util.Abort('
        
          '            pMessage => '#39'<<'#1055#1086' '#1076#1072#1085#1085#1086#1084#1091' '#1087#1083#1072#1090#1077#1078#1085#1086#1084#1091' '#1087#1086#1088#1091#1095#1077#1085#1080#1102' '#1089#1091#1097#1077#1089 +
          #1090#1074#1091#1102#1090' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080'!>>'#39' || chr(10) ||'
        
          '            '#39'<<'#1044#1083#1103' '#1087#1086#1074#1090#1086#1088#1085#1086#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1086#1090#1084#1077#1085#1080#1090#1100' '#1073 +
          #1083#1086#1082#1080#1088#1086#1074#1082#1080'!>>'#39
        '          );'
        '  end if;'
        'end;')
    end
  end
end
