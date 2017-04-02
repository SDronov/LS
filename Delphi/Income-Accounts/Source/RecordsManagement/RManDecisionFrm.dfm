inherited RManDecisionForm: TRManDecisionForm
  Top = 236
  Width = 781
  Height = 512
  Caption = 'RManDecisionForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 773
    Height = 478
    ClientRectBottom = 454
    ClientRectRight = 773
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 767
        Height = 423
        inherited edtName: TcxDBTextEdit
          Left = 60
          Top = 303
          TabOrder = 11
        end
        inherited edtDescript: TcxDBMemo
          Left = 60
          Top = 428
          TabOrder = 15
          Height = 214
          Width = 640
        end
        object edtAppNumber: TcxDBMaskEdit [2]
          Left = 173
          Top = 138
          DataBinding.DataField = 'APP_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 312
        end
        object edtAppDate: TcxDBDateEdit [3]
          Left = 490
          Top = 138
          DataBinding.DataField = 'APP_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 312
        end
        object edtAppDateIncome: TcxDBDateEdit [4]
          Left = 554
          Top = 165
          DataBinding.DataField = 'APP_DATE_INCOME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 312
        end
        object edtSumma: TcxDBCurrencyEdit [5]
          Left = 60
          Top = 276
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 312
        end
        object cmbxReason: TfdcObjectLookupEdit [6]
          Left = 173
          Top = 236
          DataBinding.DataField = 'REASON_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DictData.srcAssetsReason
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 312
        end
        object edtAppNumberIncome: TcxDBMaskEdit [7]
          Left = 173
          Top = 165
          DataBinding.DataField = 'APP_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 228
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 478
          Top = 40
          TabOrder = 1
          Width = 132
        end
        inherited edtDeclarant: TfdcObjectLinkEdit
          Left = 173
          Top = 388
          TabOrder = 14
          Width = 536
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 173
          Top = 361
          TabOrder = 12
          Width = 0
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 453
          Top = 361
          TabOrder = 13
          Width = 90
        end
        inherited edtDocNUmber: TcxDBTextEdit
          Left = 173
          Top = 40
          TabOrder = 0
          Width = 213
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Left = 619
          Top = 40
          Style.IsFontAssigned = True
          TabOrder = 2
        end
        inherited edtIsActive: TcxDBCheckBox
          Left = 21
          Top = 67
          Style.IsFontAssigned = True
          TabOrder = 3
        end
        inherited edtActivationDate: TcxDBDateEdit
          Left = 207
          Top = 67
          TabOrder = 4
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcDoc: TdxLayoutGroup [0]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' - '#1056#1077#1096#1077#1085#1080#1077
            ShowCaption = True
            Hidden = False
            ShowBorder = True
          end
          object lcgAppNumberDate: TdxLayoutGroup [1]
            Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077
            object lcgAppDoc: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciAppNUmber: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
                Control = edtAppNumber
                ControlOptions.ShowBorder = False
              end
              object lciAppDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtAppDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcgAppDocIncome: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciAppNumberIncome: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1080#1081')'
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtAppNumberIncome
                ControlOptions.ShowBorder = False
              end
              object lciAppDateIncome: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1072#1103')'
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtAppDateIncome
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcReason: TdxLayoutGroup [2]
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            object lciReason: TdxLayoutItem
              Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
              Control = cmbxReason
              ControlOptions.ShowBorder = False
            end
          end
          object lciSumma: TdxLayoutItem [3]
            Caption = #1057#1091#1084#1084#1072
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem [4]
            CaptionOptions.AlignHorz = taLeftJustify
          end
          inherited lcgDeclarant: TdxLayoutGroup
            ShowCaption = True
            Hidden = False
            ShowBorder = True
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 773
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 423
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 451
        Width = 773
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 770
        Height = 423
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 773
        Height = 454
        ClientRectBottom = 430
        ClientRectRight = 773
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
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 104
        FloatClientHeight = 79
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
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = btnPrint
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataSUBJECT_ID
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        SourceField = dsDataSUMMA
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_rman_decision_lst'
      'where id = :id')
    inherited dsDataDOC_DATE: TDateTimeField
      Required = True
    end
    inherited dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
    end
    object dsDataAPP_NUMBER: TStringField [21]
      DisplayWidth = 100
      FieldName = 'APP_NUMBER'
    end
    object dsDataAPP_DATE: TDateTimeField [22]
      FieldName = 'APP_DATE'
    end
    object dsDataAPP_DATE_INCOME: TDateTimeField [23]
      FieldName = 'APP_DATE_INCOME'
    end
    object dsDataREASON_ID: TFloatField [24]
      FieldName = 'REASON_ID'
    end
    object dsDataSUMMA: TFloatField [25]
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object dsDataREASON_NAME: TStringField [26]
      FieldName = 'REASON_NAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_decision_add(pDocType        => :TYPESYSNAME,'
      '                           pDecisionNumber => :DOC_NUMBER,'
      '                           pDecisionDate   => :DOC_DATE,'
      '                           pCustomsId      => :CUSTOMS_ID,'
      '                           pDeclarantId    => :DECLARANT_ID,'
      '                           pAppNumber      => :APP_NUMBER,'
      '                           pAppDate        => :APP_DATE,'
      '                           pAppDateIncome  => :APP_DATE_INCOME,'
      '                           pCashAssetsId   => :CASH_ASSETS_ID,'
      '                           pReasonId       => :REASON_ID,'
      '                           pDebtsId        => :DEBTS_ID,'
      '                           pSumma          => :SUMMA);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECLARANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CASH_ASSETS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_upd(pId             => :ID,'
      '                   pDecisionNumber => :DOC_NUMBER,'
      '                   pDecisionDate   => :DOC_DATE,'
      '                   pCustomsId      => :CUSTOMS_ID,'
      '                   pDeclarantId    => :DECLARANT_ID,'
      '                   pAppNumber      => :APP_NUMBER,'
      '                   pAppDate        => :APP_DATE,'
      '                   pAppDateIncome  => :APP_DATE_INCOME,'
      '                   pCashAssetsId   => :CASH_ASSETS_ID,'
      '                   pReasonId       => :REASON_ID,'
      '                   pDebtsId        => :DEBTS_ID,'
      '                   pSumma          => :SUMMA);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECLARANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CASH_ASSETS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited QueryList1: TQueryList
    Left = 552
    Top = 224
  end
  inherited dsPaymentOrderList: TfdcQuery
    Left = 552
    Top = 256
  end
  inherited dsDeclList: TfdcQuery
    Left = 584
    Top = 256
  end
  inherited dsReport: TfdcQuery
    SQL.Strings = (
      'select doc_date,'
      '       doc_number,'
      
        '       decode(decl_name, null, null, decl_name || '#39', '#39') as decl_' +
        'name,'
      
        '       decode(decl_okpo, null, null, '#39#1054#1050#1055#1054' '#39' || decl_okpo || '#39', ' +
        #39') as decl_okpo,'
      
        '       decode(decl_inn, null, null, '#39#1048#1053#1053' '#39' || decl_inn || '#39', '#39') ' +
        'as decl_inn,'
      
        '       decode(decl_kpp, null, null, '#39#1050#1055#1055' '#39' || decl_kpp || '#39', '#39') ' +
        'as decl_kpp,'
      
        '       decode(decl_address, null, null, decl_address || '#39', '#39') as' +
        ' decl_address,'
      '       cash_assets_name,'
      '       reason_name,'
      '       debts_name,'
      '       summa'
      '  from fdc_rman_decision_lst'
      ' where id = :id')
    Left = 552
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsReportDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsReportDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsReportDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1502
    end
    object dsReportDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 17
    end
    object dsReportDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 18
    end
    object dsReportDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 16
    end
    object dsReportDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 202
    end
    object dsReportCASH_ASSETS_NAME: TStringField
      FieldName = 'CASH_ASSETS_NAME'
      Size = 1500
    end
    object dsReportREASON_NAME: TStringField
      FieldName = 'REASON_NAME'
      Size = 1500
    end
    object dsReportSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsArticleList: TfdcQuery
    Left = 616
    Top = 256
  end
end
