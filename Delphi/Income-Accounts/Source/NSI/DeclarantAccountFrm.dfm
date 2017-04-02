inherited DeclarantAccountForm: TDeclarantAccountForm
  Left = 346
  Top = 233
  Width = 523
  Height = 318
  Caption = 'DeclarantAccountForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    Width = 515
    Height = 278
    ClientRectBottom = 250
    ClientRectRight = 515
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 509
        Height = 219
        inherited edtName: TcxDBTextEdit
          Top = 181
          TabOrder = 1
          Width = 554
        end
        inherited edtDescript: TcxDBMemo
          Top = 12
          TabOrder = 0
          Height = 229
          Width = 418
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciDescriptEdit: TdxLayoutItem [0]
          end
          inherited lciNameEdit: TdxLayoutItem [1]
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 515
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 219
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 247
        Width = 515
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 512
        Height = 219
      end
      object dxLayoutControl1: TdxLayoutControl
        Left = 3
        Top = 28
        Width = 509
        Height = 219
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 5
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebLookAndFeel
        object edtPayAccount: TcxDBMaskEdit
          Left = 180
          Top = 100
          DataBinding.DataField = 'PAY_ACCOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,20}'
          Properties.MaxLength = 0
          Properties.OnChange = DataChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 388
        end
        object edtCorrAccount: TcxDBMaskEdit
          Left = 180
          Top = 133
          DataBinding.DataField = 'CORR_ACCOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,20}'
          Properties.MaxLength = 0
          Properties.OnChange = DataChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 157
        end
        object rgAccountType: TcxDBRadioGroup
          Left = 180
          Top = 12
          DataBinding.DataField = 'ACCOUNT_CURR_TYPE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1056#1091#1073#1083#1080
              Value = 1
              Tag = 1
            end
            item
              Caption = #1042#1072#1083#1102#1090#1072
              Value = 2
              Tag = 2
            end>
          Properties.OnChange = DataChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Height = 48
          Width = 360
        end
        object edtBankOKPO: TcxDBButtonEdit
          Left = 180
          Top = 67
          DataBinding.DataField = 'BANK_OKPO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,8}'
          Properties.MaxLength = 0
          Properties.OnChange = DataChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 219
        end
        object dxLayoutControl1Group3: TdxLayoutGroup
          ShowCaption = False
          ShowBorder = False
          object dxLayoutControl1Item5: TdxLayoutItem
            Caption = #1042#1072#1083#1102#1090#1072' '#1089#1095#1077#1090#1072
            CaptionOptions.AlignVert = tavBottom
            Control = rgAccountType
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item1: TdxLayoutItem
            Caption = #1054#1050#1055#1054' '#1073#1072#1085#1082#1072
            Control = edtBankOKPO
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item2: TdxLayoutItem
            Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
            LookAndFeel = LayoutWebLookAndFeel
            Control = edtPayAccount
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item3: TdxLayoutItem
            Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1089#1082#1080#1081' '#1089#1095#1077#1090
            LookAndFeel = LayoutWebLookAndFeel
            Control = edtCorrAccount
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 515
        Height = 250
        ClientRectBottom = 222
        ClientRectRight = 515
        ClientRectTop = 0
      end
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 92
    Top = 43
  end
  inherited imglLarge: TImageList
    Left = 88
    Top = 75
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
        FloatClientHeight = 50
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
    Left = 72
    Top = 107
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from FDC_DECLARANT_ACCOUNT_LST'
      ' where ID = :ID')
    SourceServerObject = 'FDC_DECLARANT_ACCOUNT_LST'
    BeforePost = dsDataBeforePost
    object dsDataDECLARANT_ID: TFloatField
      FieldName = 'DECLARANT_ID'
    end
    object dsDataACCOUNT_CURR_TYPE: TIntegerField
      FieldName = 'ACCOUNT_CURR_TYPE'
      Required = True
    end
    object dsDataBANK_OKPO: TStringField
      Tag = 1
      DisplayLabel = #1054#1050#1055#1054' '#1073#1072#1085#1082#1072
      FieldName = 'BANK_OKPO'
      OnValidate = dsDataValidate
      Size = 10
    end
    object dsDataPAY_ACCOUNT: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      FieldName = 'PAY_ACCOUNT'
      OnValidate = dsDataValidate
    end
    object dsDataCORR_ACCOUNT: TStringField
      DisplayLabel = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1089#1082#1080#1081' '#1089#1095#1077#1090
      FieldName = 'CORR_ACCOUNT'
      OnValidate = dsDataValidate
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_declarant_Account_add(pDeclarantID => :Decl_ID,'
      '      pBANKOKPO=>:BANK_OKPO,'
      '      pACCOUNTCURRTYPE=>:ACCOUNT_CURR_TYPE,'
      '      pPAYACCOUNT=>:PAY_ACCOUNT,'
      '      pCORRACCOUNT=>:CORR_ACCOUNT);'
      'end;')
    SourceServerObject = 'FDC_DECLARANT_ACCOUNT_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'Decl_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BANK_OKPO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftInteger
        Name = 'ACCOUNT_CURR_TYPE'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'PAY_ACCOUNT'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'CORR_ACCOUNT'
        ParamType = ptUnknown
        Size = 21
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_declarant_Account_upd('
      '      pID => :ID,'
      '      pBANKOKPO=>:BANK_OKPO,'
      '      pACCOUNTCURRTYPE=>:ACCOUNT_CURR_TYPE,'
      '      pPAYACCOUNT=>:PAY_ACCOUNT,'
      '      pCORRACCOUNT=>:CORR_ACCOUNT);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'BANK_OKPO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftInteger
        Name = 'ACCOUNT_CURR_TYPE'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'PAY_ACCOUNT'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'CORR_ACCOUNT'
        ParamType = ptUnknown
        Size = 21
      end>
  end
  object dsCheckAcc: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT * FROM fdc_bank_lst WHERE okpo = :okpo')
    Left = 104
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end>
  end
  object dsCheckAcc2: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT * FROM fdc_nsi_currency_lst'
      'WHERE code = replace(SUBSTR(:acc, 6, 3), '#39'810'#39', '#39'643'#39')'
      '        --AND (sdate < SYSDATE OR sdate IS NULL)'
      '        --AND (edate > SYSDATE OR edate IS NULL)')
    Left = 136
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'acc'
        ParamType = ptUnknown
      end>
  end
end
