inherited srAvansGridForm: TsrAvansGridForm
  Left = 240
  Top = 236
  Width = 924
  Height = 557
  Caption = #1040#1074#1072#1085#1089#1086#1074#1099#1077' '#1087#1083#1072#1090#1077#1078#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 494
    Width = 916
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 610
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 610
      end
      inherited pnlProgress: TPanel
        Width = 610
        inherited lblProgress: TcxLabel
          Width = 610
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 823
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 491
    Width = 916
  end
  inherited pnlWorkspace: TPanel
    Width = 916
    Height = 463
    inherited splSearchCriteria: TSplitter
      Height = 463
    end
    inherited pnlSearchCriteria: TPanel
      Height = 463
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 443
        inherited btnSearch: TcxButton
          Top = 392
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 874
      Height = 463
      inherited grdData: TcxGrid
        Width = 874
        Height = 463
        inherited grdDataDBTableView: TcxGridDBTableView
          OptionsSelection.CellMultiSelect = True
        end
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCellDblClick = grdDataDBBandedTableViewCellDblClick
          OptionsSelection.CellSelect = False
          object colSubj_Inn: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJ_INN'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colSubj_Kpp: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJ_KPP'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object colSubj_Name: TcxGridDBBandedColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'SUBJ_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object colCurr_Code: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object colSumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
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
    inherited edtFrom: TdxBarDateCombo
      Caption = #1044#1072#1090#1072':'
    end
    inherited edtTo: TdxBarDateCombo
      Enabled = False
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select'
      '   s.id'
      '  ,s.id as Subj_Id'
      '  ,s.inn as Subj_Inn'
      '  ,s.kpp as Subj_Kpp'
      '  ,s.name as Subj_Name'
      '  ,c.code as Curr_Code'
      '  ,c.name as Curr_name'
      '  ,sum(AT.OPERATION_SUM) summa'
      'from'
      '   fdc_acc_lst          a'
      '  ,fdc_acc_transaction  at'
      '  ,fdc_subject_lst      s'
      '  ,fdc_nsi_currency_lst c'
      'where'
      '  A.CODE like '#39'06.%'#39
      '  and SubStr(a.code,7,2) in ('#39'01'#39','#39'02'#39','#39'03'#39','#39'04'#39')'
      '  and at.operation_date <= :Make_Date'
      '  and AT.ACCOUNT_ID = a.id'
      '  and AT.CURRENCY_ID = c.id'
      '  and AT.SUBJECT_ID = s.id'
      'group by'
      '   s.id'
      '  ,s.inn'
      '  ,s.kpp'
      '  ,s.name'
      '  ,c.code'
      '  ,c.name'
      '')
    ParamData = <
      item
        DataType = ftDate
        Name = 'Make_Date'
        ParamType = ptUnknown
      end>
    object dsDataSUBJ_ID: TFloatField
      FieldName = 'SUBJ_ID'
    end
    object dsDataSUBJ_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJ_INN'
      Size = 12
    end
    object dsDataSUBJ_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJ_KPP'
      Size = 10
    end
    object dsDataSUBJ_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SUBJ_NAME'
      Size = 100
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURR_CODE'
      Size = 50
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_NAME'
      Size = 200
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
  end
end
