inherited AgrRegistryContextForm: TAgrRegistryContextForm
  Left = 385
  Top = 395
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          DataController.OnDataChanged = grdDataDBBandedTableViewDataControllerDataChanged
          OptionsView.Footer = True
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1044#1058
            DataBinding.FieldName = 'NAME'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REG_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            Width = 132
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actDoFormPack: TAction
      Category = 'Data'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actDoFormPackExecute
      OnUpdate = actDoFormPackUpdate
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
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = btnDoFormPack
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
      26
      0)
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarInPlaceSubItem1: TdxBarInPlaceSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      KeepBeginGroupWhileExpanded = False
    end
    object btnDoFormPack: TdxBarButton
      Action = actDoFormPack
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Caption = '0'
      Category = 0
      Hint = '0'
      Visible = ivAlways
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      
        'SELECT  cd.Name, cd.TypeSysName, cd.doc_date, cd.doc_number, cd.' +
        'customs_code, cd.reg_date, cd.curr_code, '
      '      (SELECT nvl(SUM(pd.summa), 0)'
      '        FROM fdc_payment_deduction_lst pd'
      '        WHERE pd.decl_id = cd.ID'
      '          AND EXISTS (SELECT 1'
      '                      FROM fdc_rel_pack_docs_lst rr '
      '                      WHERE rr.Rel_Object_ID = pd.id'
      '                        AND rr.Object_ID = :id)'
      '      ) AS Summa'
      '    FROM fdc_rel_pack_docs_lst r, fdc_doc_charge_lst  cd'
      '   WHERE r.Object_ID = :id'
      '     AND r.Rel_Object_ID = cd.id'
      ''
      ''
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataNAME: TStringField
      DisplayLabel = #1043#1058#1044
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDataTYPESYSNAME: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
  end
  object pkgDocPackGtdKnp: TOraclePackage
    Session = MainData.Session
    PackageName = 'p_doc_pack_gtd_knp'
    Cursor = crSQLWait
    Left = 104
    Top = 174
  end
  object dsData_LevelKNP: TOracleQuery
    SQL.Strings = (
      
        'SELECT g.name, g.ext_typesysname AS TypeSysName, g.doc_date, g.d' +
        'oc_number, g.customs_code,'
      '       g.reg_date, g.curr_code, s.Summa'
      'FROM fdc_tmp_gtd g, ( SELECT d.decl_id, SUM(d.summa) AS summa'
      '                        FROM fdc_tmp_deduction d'
      '                        WHERE d.pack_id = :id'
      '                        GROUP BY d.decl_id  ) s'
      'WHERE s.decl_id = g.id')
    Left = 429
    Top = 146
  end
end
