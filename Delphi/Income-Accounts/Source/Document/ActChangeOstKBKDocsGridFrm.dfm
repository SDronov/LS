inherited ActChangeOstKBKDocsGridForm: TActChangeOstKBKDocsGridForm
  Left = 395
  Top = 289
  Caption = 'ActChangeOstKBKDocsGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 275
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 275
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 275
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 275
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 485
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtDocDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtDocDateTo: TcxDateEdit
          Width = 121
        end
        inherited edtDocNumber: TcxMaskEdit
          Width = 121
        end
        inherited cbIsActive: TcxComboBox
          Width = 121
        end
        inherited edtActDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtActDateTo: TcxDateEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              FieldName = 'SUMMA_ALL'
              Column = grdDataDBBandedTableViewSUMMA_ALL
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              FieldName = 'SUMMA_DED'
              Column = grdDataDBBandedTableViewSUMMA_DED
            end>
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end
            item
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            end
            item
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 124
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSUMMA_ALL: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA_ALL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 1
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'NAME_P'
            Width = 375
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'INN_P'
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'KPP_P'
            Position.BandIndex = 1
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 65
            Position.BandIndex = 1
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_DED: TcxGridDBBandedColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082
            DataBinding.FieldName = 'SUMMA_DED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 1
            Position.ColIndex = 8
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
    inherited actSwitchSearchCriteria: TAction
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select po.ID'
      '     , po.NAME'
      '     , po.SHORTNAME'
      '     , po.OBJECT_TYPE_ID'
      '     , po.STATE_ID'
      '     , po.ACCESSLEVEL'
      '     , po.SYSNAME'
      '     , po.DESCRIPT'
      '     , po.OWNER_OBJECT_ID'
      '     , po.TYPENAME'
      '     , po.TYPESYSNAME'
      '     , po.OBJECTKINDLIST'
      '     , po.DOC_NUMBER'
      '     , po.DOC_DATE'
      '     , po.IS_ACTIVE'
      '     , po.ACTIVATION_DATE'
      '     , po.summa summa_all'
      '     , po.name_p'
      '     , po.inn_p'
      '     , PO.kpp_p'
      '     , po.is_ts'
      '     , r.summa summa_ded'
      ' from fdc_po_lst po,'
      '      fdc_act_change_ost_kbk_lst a,'
      '      fdc_reserved_payment_lst r'
      'where a.id = :ID'
      '      and r.doc_id = A.ID'
      '      and po.id = r.payment_id'
      '      and (:Name is null or upper(po.NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataSUMMA_ALL: TFloatField
      FieldName = 'SUMMA_ALL'
    end
    object dsDataNAME_P: TStringField
      FieldName = 'NAME_P'
      Size = 160
    end
    object dsDataINN_P: TStringField
      FieldName = 'INN_P'
      Size = 12
    end
    object dsDataKPP_P: TStringField
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataSUMMA_DED: TFloatField
      FieldName = 'SUMMA_DED'
    end
  end
end
