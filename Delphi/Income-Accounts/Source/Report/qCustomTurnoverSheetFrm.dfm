object CustomTurnoverSheetForm: TCustomTurnoverSheetForm
  Left = 236
  Top = 267
  Width = 625
  Height = 346
  Caption = 'CustomTurnoverSheetForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grdTurnoverSheet: TcxGrid
    Left = 0
    Top = 26
    Width = 617
    Height = 293
    Align = alClient
    TabOrder = 0
    object grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsData
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Bands = <
        item
        end>
    end
    object grdTurnoverSheetLevel: TcxGridLevel
      GridView = grdTurnoverSheetDBBandedTableView
    end
  end
  object PanelHeading: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 26
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object dsetData: TOracleDataSet
    Variables.Data = {
      0300000008000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000070000003A43555252494403
      00000000000000000000000B0000003A4143434F554E545F4944030000000000
      000000000000040000003A5255520100000000000000000000000C0000003A43
      5552525F4649454C4453010000000000000000000000070000003A425F4D4F44
      45050000000000000000000000080000003A4E53495F43555201000000000000
      0000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetDataBeforeQuery
    Session = MainData.Session
    AfterOpen = dsetDataAfterOpen
    AfterRefresh = dsetDataAfterOpen
    Left = 80
    Top = 96
  end
  object dsData: TDataSource
    AutoEdit = False
    DataSet = dsetData
    Left = 72
    Top = 144
  end
  object dsetAccount: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   ID'
      '  ,NAME'
      'FROM'
      '  fdc_acc_lst'
      'WHERE'
      '  code = :acc_code'
      '  and :DateFrom between sdate and nvl(edate, :DateFrom)'
      '')
    Variables.Data = {
      0300000002000000090000003A4143435F434F44450500000000000000000000
      00090000003A4441544546524F4D0C0000000000000000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetAccountBeforeQuery
    Left = 136
    Top = 96
  end
  object GridPopupMenu: TcxGridPopupMenu
    Grid = grdTurnoverSheet
    PopupMenus = <
      item
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
      end>
    AlwaysFireOnPopup = True
    Left = 128
    Top = 147
  end
end
