inherited AccountForm: TAccountForm
  Left = 340
  Top = 274
  Width = 511
  Height = 333
  ActiveControl = cxTabSheet1
  Caption = 'AccountForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    Width = 503
    Height = 293
    ActivePage = cxTabSheet1
    ClientRectBottom = 265
    ClientRectRight = 503
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 497
        Height = 234
        inherited edtName: TcxDBTextEdit
          Left = 135
          Width = 370
          Style.Color = clSilver
        end
        inherited edtDescript: TcxDBMemo
          Left = 0
          Top = -24
          Width = 462
          Height = 28
          TabOrder = 9
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 135
          Top = 47
          Width = 370
          Height = 21
          DataBinding.DataField = 'OWNER_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object fdcObjectLinkEdit2: TfdcObjectLinkEdit [3]
          Left = 135
          Top = 75
          Width = 370
          Height = 21
          DataBinding.DataField = 'CUR_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CURRENCY_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        object cxDBTextEdit1: TcxDBTextEdit [4]
          Left = 135
          Top = 103
          Width = 370
          Height = 21
          DataBinding.DataField = 'SALDO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object cxDBTextEdit2: TcxDBTextEdit [5]
          Left = 135
          Top = 131
          Width = 161
          Height = 21
          DataBinding.DataField = 'DEBET_TURNOVER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 4
        end
        object cxDBTextEdit3: TcxDBTextEdit [6]
          Left = 383
          Top = 131
          Width = 152
          Height = 21
          DataBinding.DataField = 'CREDIT_TURNOVER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 5
        end
        object cxDBDateEdit1: TcxDBDateEdit [7]
          Left = 135
          Top = 159
          Width = 132
          Height = 21
          DataBinding.DataField = 'OPEN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 6
        end
        object cxDBDateEdit2: TcxDBDateEdit [8]
          Left = 364
          Top = 159
          Width = 131
          Height = 21
          DataBinding.DataField = 'CLOSE_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 7
        end
        object cxDBDateEdit3: TcxDBDateEdit [9]
          Left = 364
          Top = 187
          Width = 121
          Height = 21
          DataBinding.DataField = 'LAST_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 8
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            LookAndFeel = LayoutWebLookAndFeel
          end
          inherited lciDescriptEdit: TdxLayoutItem
            ShowCaption = False
            Visible = False
            Control = nil
          end
          object lcGeneralItem1: TdxLayoutItem
            Caption = 'C'#1091#1073#1098#1077#1082#1090
            CaptionOptions.AlignHorz = taRightJustify
            LookAndFeel = LayoutWebLookAndFeel
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem
            Caption = #1042#1072#1083#1102#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            LookAndFeel = LayoutWebLookAndFeel
            Control = fdcObjectLinkEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem
            Caption = #1057#1072#1083#1100#1076#1086
            CaptionOptions.AlignHorz = taRightJustify
            LookAndFeel = LayoutWebLookAndFeel
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem4: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1076#1077#1073#1077#1090#1091
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = cxDBTextEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = cxDBTextEdit3
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem6: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = cxDBDateEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem7: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = cxDBDateEdit2
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem8: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080
            CaptionOptions.AlignHorz = taRightJustify
            LookAndFeel = LayoutWebLookAndFeel
            Control = cxDBDateEdit3
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 503
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 234
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 262
        Width = 503
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 500
        Height = 234
      end
    end
    object cxTabSheet1: TcxTabSheet [1]
      Caption = #1055#1088#1086#1074#1086#1076#1082#1080
      ImageIndex = 2
      OnShow = cxTabSheet1Show
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 503
        Height = 265
        ClientRectBottom = 237
        ClientRectRight = 503
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSave: TAction
      Visible = False
    end
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
        FloatClientWidth = 127
        FloatClientHeight = 55
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
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select t.id'
      '      ,t.hier_name as name'
      '      ,t.open_date'
      '      ,(select max(x.item_date)'
      '          from fdc_account_entry x'
      '         where x.debet_id = t.id'
      '            or x.credit_id = t.id) last_date'
      '      ,t.close_date'
      '      ,t.currency_id '
      '    ,s.id as subject_id        '
      '      ,c.name cur_name'
      '      ,sl.saldo'
      '      ,sl.debet_turnover'
      '      ,sl.credit_turnover'
      '      ,s.name owner_name'
      ' ,'#39'Account'#39' as typesysname'
      '  from fdc_account       t'
      '      ,fdc_account_saldo sl'
      '      ,fdc_subject_lst   s'
      '      ,fdc_nsi_currency_lst c'
      'where'
      '     t.id = :ID'
      ' and sl.account_id = t.id'
      ' and s.ID(+) = t.subject_id'
      ' and c.ID = t.currency_id')
    inherited dsDataNAME: TStringField
      ReadOnly = True
      Size = 100
    end
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      Size = 7
    end
    object dsDataOPEN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
      FieldName = 'OPEN_DATE'
      ReadOnly = True
    end
    object dsDataLAST_DATE: TDateTimeField
      FieldName = 'LAST_DATE'
      ReadOnly = True
    end
    object dsDataCLOSE_DATE: TDateTimeField
      FieldName = 'CLOSE_DATE'
      ReadOnly = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
    end
    object dsDataCUR_NAME: TStringField
      FieldName = 'CUR_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataSALDO: TFloatField
      FieldName = 'SALDO'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object dsDataDEBET_TURNOVER: TFloatField
      FieldName = 'DEBET_TURNOVER'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object dsDataCREDIT_TURNOVER: TFloatField
      FieldName = 'CREDIT_TURNOVER'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object dsDataOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
  end
end
