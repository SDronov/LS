inherited DocPackPaymentsForm: TDocPackPaymentsForm
  Left = 323
  Top = 140
  Width = 710
  Height = 598
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1083#1072#1090#1077#1078#1077#1081' ('#1074#1099#1087#1080#1089#1082#1072' '#1080#1079' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072')'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 702
    Height = 571
    ClientRectBottom = 547
    ClientRectRight = 702
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 696
        Height = 518
        inherited edtName: TcxDBTextEdit
          Top = 445
          TabOrder = 14
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 472
          TabOrder = 15
          Height = 37
          Width = 185
        end
        object edtValCode: TcxDBTextEdit [2]
          Left = 108
          Top = 209
          DataBinding.DataField = 'CURRENCY_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 121
        end
        object edtValName: TcxDBTextEdit [3]
          Left = 281
          Top = 209
          DataBinding.DataField = 'CURRENCY_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 412
        end
        object edtCustomsCode: TcxDBTextEdit [4]
          Left = 108
          Top = 307
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 121
        end
        object edtCustomsName: TcxDBTextEdit [5]
          Left = 281
          Top = 307
          DataBinding.DataField = 'CUSTOMS_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 412
        end
        object edtSum: TcxDBCurrencyEdit [6]
          Left = 108
          Top = 236
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 121
        end
        inherited fdcSrcAppName: TfdcObjectLinkEdit
          Top = 378
          Enabled = False
          TabOrder = 12
          Width = 586
        end
        inherited fdcDstAppName: TfdcObjectLinkEdit
          Top = 405
          Enabled = False
          Style.Color = clBtnFace
          TabOrder = 13
          Width = 573
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGrpPackage: TdxLayoutGroup
            inherited lciGrpDocAttr: TdxLayoutGroup
              inherited itemDocNumber: TdxLayoutItem
                Tag = 33
              end
              inherited itemDocDate: TdxLayoutItem
                Tag = 33
              end
            end
          end
          inherited lcGrpActivation: TdxLayoutGroup
            inherited lciIsTS: TdxLayoutItem
              Visible = True
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup [2]
            Caption = #1042#1072#1083#1102#1090#1072
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object itemValCode: TdxLayoutItem
                Tag = 33
                Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
                Control = edtValCode
                ControlOptions.ShowBorder = False
              end
              object itemValName: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1042#1072#1083#1102#1090#1072
                Control = edtValName
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem1: TdxLayoutItem
              Tag = 33
              Caption = #1057#1091#1084#1084#1072
              Control = edtSum
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup1: TdxLayoutGroup [3]
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1088#1077#1077#1089#1090#1088#1072
            LayoutDirection = ldHorizontal
            object itemCustomsCode: TdxLayoutItem
              Tag = 33
              Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
              Control = edtCustomsCode
              ControlOptions.ShowBorder = False
            end
            object itemCustomsName: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1058#1072#1084#1086#1078#1085#1103
              Control = edtCustomsName
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 702
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 518
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 544
        Width = 702
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 699
        Height = 518
      end
    end
    inherited tabDocs: TcxTabSheet
      Caption = #1055#1083#1072#1090#1077#1078#1080
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 702
        Height = 547
        ClientRectBottom = 523
        ClientRectRight = 702
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 450
        FloatTop = 245
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftInterface
        Name = 'NA'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'DOCPACK_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'PackEnableEdit'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    ReadOnly = True
    SQL.Strings = (
      'SELECT dp.*'
      '      ,c.code AS currency_code'
      '      ,c.name AS currency_name'
      '      ,s.customs_code_8 AS Customs_code'
      '      ,s.NAME AS Customs_Name'
      
        '      ,(SELECT fdc_Doc_Pack_Payments_Summa (dp.id) FROM dual)  A' +
        'S Summa'
      '      ,os.Name AS State_Name'
      '  FROM FDC_DOC_PACK_PAYMENTS_LST dp'
      '  INNER JOIN fdc_nsi_currency_lst c ON c.id = dp.CURRENCY_ID'
      '  INNER JOIN fdc_customs_lst s ON s.ID = dp.DestCustomsId'
      '  LEFT OUTER JOIN fdc_object_lst os ON os.id = dp.state_id'
      ' WHERE  dp.ID = :ID'
      '')
    SourceServerObject = 'FDC_DOC_PACK_PAYMENTS_LST'
    inherited dsDataSYSNAME: TStringField
      Visible = False
    end
    inherited dsDataDESCRIPT: TStringField
      Visible = False
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Visible = False
    end
    inherited dsDataTYPESYSNAME: TStringField
      Visible = False
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      Visible = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
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
    object dsDataDESTCUSTOMSID: TFloatField
      FieldName = 'DESTCUSTOMSID'
      Visible = False
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataCUSTOMS_NAME: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
    object dsDataDATE_IN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      FieldName = 'DATE_IN'
    end
    object dsDataDATE_OUT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'DATE_OUT'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 1500
    end
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 1500
    end
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where 1 = 0 and'
      '     State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )')
  end
end
