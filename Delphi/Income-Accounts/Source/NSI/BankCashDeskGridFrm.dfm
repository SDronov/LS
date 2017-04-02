inherited BankCashDeskGridForm: TBankCashDeskGridForm
  Left = 262
  Top = 377
  Width = 661
  Height = 353
  Caption = #1050#1072#1089#1089#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 301
    Width = 653
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 348
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 348
      end
      inherited pnlProgress: TPanel
        Width = 348
        inherited lblProgress: TcxLabel
          Width = 348
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 561
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 298
    Width = 653
  end
  inherited pnlWorkspace: TPanel
    Width = 653
    Height = 272
    inherited splSearchCriteria: TSplitter
      Height = 272
    end
    inherited pnlSearchCriteria: TPanel
      Height = 272
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 252
        inherited btnSearch: TcxButton
          Top = 221
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 192
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 448
      Height = 272
      inherited grdData: TcxGrid
        Width = 448
        Height = 272
      end
    end
  end
  inherited ActionList: TActionList
    object actCreateBankCashDesk: TAction
      Category = 'Object'
      Caption = #1082#1072#1089#1089#1091' '#1073#1072#1085#1082#1072
      OnExecute = actAddExecute
    end
    object actLinkCustomCashDesk: TAction
      Category = 'Object'
      Caption = #1082#1072#1089#1089#1091' '#1090#1072#1084#1086#1078#1085#1080
      OnExecute = actLinkCustomCashDeskExecute
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
    inherited btnAdd: TdxBarButton
      ButtonStyle = bsDropDown
      DropDownMenu = ppmAddButton
      OnClick = nil
    end
    object btnAddBankCashDesk: TdxBarButton
      Action = actCreateBankCashDesk
      Category = 0
    end
    object btnLinkCustomCashDesk: TdxBarButton
      Action = actLinkCustomCashDesk
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_cashdesk_Lst --fdc_bankcashdesk_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and (:bankcash_id is null or owner_object_id = :bankcash_id)')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'bankcash_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'bankcash_id'
        ParamType = ptUnknown
      end>
  end
  object ppmAddButton: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = btnAddBankCashDesk
        Visible = True
      end
      item
        Item = btnLinkCustomCashDesk
        Visible = True
      end>
    UseOwnFont = False
    Left = 245
    Top = 170
  end
  object dsetCashDesk: TOracleDataSet
    SQL.Strings = (
      
        'SELECT c.id, c.NAME, c.OWNER_OBJECT_ID AS BankForCash_id, b.bank' +
        '_id, b.bank_name'
      'FROM fdc_customcashdesk_lst c, fdc_bankforcash_lst b'
      'WHERE c.OWNER_OBJECT_ID = b.ID (+)')
    Session = MainData.Session
    Left = 317
    Top = 186
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 389
    Top = 98
    object sqlUpdOwner: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  FDC_OBJECT_UPD_OWNER(:pID, :pOwnerID);'
        'END;')
    end
  end
end
