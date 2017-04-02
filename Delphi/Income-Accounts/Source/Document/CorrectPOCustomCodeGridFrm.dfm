inherited CorrectPOCustomCodeGridForm: TCorrectPOCustomCodeGridForm
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1087#1086#1074#1090#1086#1088#1085#1086#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          Top = 786
          TabOrder = 17
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 757
          TabOrder = 16
        end
        inherited edtDocDateFrom: TcxDateEdit
          Left = 38
          Top = 121
          TabOrder = 2
          Width = 121
        end
        inherited edtDocDateTo: TcxDateEdit
          Left = 38
          Top = 148
          TabOrder = 3
          Width = 121
        end
        inherited edtDocNumber: TcxMaskEdit
          Top = 63
          TabOrder = 1
          Width = 121
        end
        inherited cbIsActive: TcxComboBox
          Top = 632
          TabOrder = 13
          Width = 121
        end
        inherited edtActDateFrom: TcxDateEdit
          Left = 38
          Top = 690
          TabOrder = 14
          Width = 121
        end
        inherited edtActDateTo: TcxDateEdit
          Left = 38
          Top = 717
          TabOrder = 15
          Width = 121
        end
        object edtPaymentNumber: TcxMaskEdit [9]
          Left = 9
          Top = 203
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 167
        end
        object edtPaymentDateFrom: TcxDateEdit [10]
          Left = 38
          Top = 261
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 129
        end
        object edtPaymentDateTo: TcxDateEdit [11]
          Left = 38
          Top = 288
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 129
        end
        object edtSumMin: TcxCurrencyEdit [12]
          Left = 38
          Top = 359
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 109
        end
        object edtSumMax: TcxCurrencyEdit [13]
          Left = 38
          Top = 383
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 109
        end
        object edtReasonCorrect: TcxMemo [14]
          Left = 9
          Top = 519
          ParentFont = False
          Properties.WantReturns = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Height = 50
          Width = 178
        end
        object editCustomcodeOld: TcxMaskEdit [15]
          Left = 9
          Top = 435
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 167
        end
        object editCustomcodeNew: TcxMaskEdit [16]
          Left = 9
          Top = 477
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 167
        end
        object editUserName: TcxMaskEdit [17]
          Left = 9
          Top = 590
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 12
          Width = 167
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaItem4: TdxLayoutItem [1]
            Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
          end
          inherited lcSearchCriteriaGroup1: TdxLayoutGroup [2]
            Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
          end
          object lciedtPaymentNumber: TdxLayoutItem [3]
            Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087
            CaptionOptions.Layout = clTop
            Control = edtPaymentNumber
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaGroup3: TdxLayoutGroup [4]
            Caption = #1044#1072#1090#1072' '#1087'/'#1087
            object lciedtPaymentDateFrom: TdxLayoutItem
              Caption = #1089
              Control = edtPaymentDateFrom
              ControlOptions.ShowBorder = False
            end
            object lciedtPaymentDateTo: TdxLayoutItem
              Caption = #1087#1086
              Control = edtPaymentDateTo
              ControlOptions.ShowBorder = False
            end
          end
          object lcSearchCriteriaGroup4: TdxLayoutGroup [5]
            Caption = #1057#1091#1084#1084#1072' '#1087'/'#1087
            object lciedtSumMin: TdxLayoutItem
              Caption = '>= '
              CaptionOptions.AlignHorz = taCenter
              Control = edtSumMin
              ControlOptions.ShowBorder = False
            end
            object lciedtSumMax: TdxLayoutItem
              Caption = '<= '
              CaptionOptions.AlignHorz = taCenter
              Control = edtSumMax
              ControlOptions.ShowBorder = False
            end
          end
          object lcieditCustomcodeOld: TdxLayoutItem [6]
            Caption = #1050#1086#1076' '#1058#1054' '#1074' '#1087'/'#1087
            CaptionOptions.Layout = clTop
            Control = editCustomcodeOld
            ControlOptions.ShowBorder = False
          end
          object lcieditCustomcodeNew: TdxLayoutItem [7]
            Caption = #1053#1086#1074#1099#1081' '#1082#1086#1076' '#1058#1054' '#1074' '#1087'/'#1087
            CaptionOptions.Layout = clTop
            Control = editCustomcodeNew
            ControlOptions.ShowBorder = False
          end
          object lciedtReasonCorrect: TdxLayoutItem [8]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
            CaptionOptions.Layout = clTop
            Control = edtReasonCorrect
            ControlOptions.ShowBorder = False
          end
          object lcieditUserName: TdxLayoutItem [9]
            Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1088#1080#1085#1103#1083'('#1072')'
            CaptionOptions.Layout = clTop
            Control = editUserName
            ControlOptions.ShowBorder = False
          end
          inherited lcSearchCriteriaItem6: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaGroup2: TdxLayoutGroup
            Visible = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn [5]
            Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
            Position.BandIndex = 0
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn [6]
            Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
            Position.BandIndex = 0
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 0
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 1
          end
          object grdDataDBBandedTableViewPAYMENT_NUMBER: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'PAYMENT_NUMBER'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'PAYMENT_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_DOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'PAYMENT_DOC_SUMMA'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMCODE_OLD: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'CUSTOMCODE_OLD'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMCODE_NEW: TcxGridDBBandedColumn
            Caption = #1053#1086#1074#1099#1081' '#1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'CUSTOMCODE_NEW'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_CORRECT: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
            DataBinding.FieldName = 'REASON_CORRECT'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewUSER_NAME: TcxGridDBBandedColumn
            Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1088#1080#1085#1103#1083'('#1072')'
            DataBinding.FieldName = 'USER_NAME'
            Width = 150
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
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      ' from fdc_correctpo_customcode_lst'
      
        ' where (:doc_number is null or upper( doc_number ) like upper( :' +
        'doc_number ))'
      '  and (:doc_date_from is null or doc_date >= :doc_date_from)'
      '  and (:doc_date_to is null or doc_date <= :doc_date_to)'
      
        '  and (:paymentnumber is null or upper(payment_number) like uppe' +
        'r( :paymentnumber ))'
      
        '  and (:payment_date_from is null or payment_date >= :payment_da' +
        'te_from)'
      
        '  and (:payment_date_to is null or payment_date <= :payment_date' +
        '_to  )'
      
        '  and (:payment_doc_summa_min  is null or payment_doc_summa >= :' +
        'payment_doc_summa_min )'
      
        '  and (:payment_doc_summa_max  is null or payment_doc_summa <= :' +
        'payment_doc_summa_max )'
      
        '  and (:customcodeold is null or customcode_old like :customcode' +
        'old )'
      
        '  and (:customcodenew is null or customcode_new like :customcode' +
        'new )'
      
        '  and (:reasoncorrect is null or upper(reason_correct) like uppe' +
        'r( :reasoncorrect ))'
      '--'
      '  and (:is_active is null or is_active = :is_active )'
      
        '  and (:act_date_from is null or activation_date >= :act_date_fr' +
        'om )'
      '  and (:act_date_to is null or activation_date <= :act_date_to )'
      '  and (:name is null or upper( name ) like upper( :name ))'
      '--')
    ParamData = <
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
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paymentnumber'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paymentnumber'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'payment_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'payment_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'payment_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'payment_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'payment_doc_summa_min'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'payment_doc_summa_min'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'payment_doc_summa_max'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'payment_doc_summa_max'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customcodeold'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customcodeold'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customcodenew'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'customcodenew'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'reasoncorrect'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'reasoncorrect'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end>
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
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
    object dsDataDOC_SOURCE_NAME: TStringField
      FieldName = 'DOC_SOURCE_NAME'
      Size = 1500
    end
    object dsDataREASON_CORRECT: TStringField
      FieldName = 'REASON_CORRECT'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataCUSTOMCODE_OLD_ID: TFloatField
      FieldName = 'CUSTOMCODE_OLD_ID'
    end
    object dsDataCUSTOMCODE_OLD: TStringField
      FieldName = 'CUSTOMCODE_OLD'
      Size = 8
    end
    object dsDataCUSTOMCODE_NEW_ID: TFloatField
      FieldName = 'CUSTOMCODE_NEW_ID'
    end
    object dsDataCUSTOMCODE_NEW: TStringField
      FieldName = 'CUSTOMCODE_NEW'
      Size = 8
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object dsDataUSER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 4000
    end
    object dsDataDOCUMENT_BASE: TStringField
      FieldName = 'DOCUMENT_BASE'
      Size = 111
    end
    object dsDataPAYMENT_NUMBER: TStringField
      FieldName = 'PAYMENT_NUMBER'
      Size = 100
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataPAYMENT_DOC_SUMMA: TFloatField
      FieldName = 'PAYMENT_DOC_SUMMA'
    end
  end
end
