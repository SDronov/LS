inherited ValueGridForm: TValueGridForm
  Left = 208
  Top = 226
  Width = 948
  Height = 646
  HelpContext = 33
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1080#1089#1090#1077#1084#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 583
    Width = 932
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 629
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 629
      end
      inherited pnlProgress: TPanel
        Width = 629
        inherited lblProgress: TcxLabel
          Width = 629
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 839
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 580
    Width = 932
  end
  inherited pnlWorkspace: TPanel
    Width = 932
    Height = 552
    inherited splSearchCriteria: TSplitter
      Height = 552
    end
    inherited pnlSearchCriteria: TPanel
      Height = 552
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 532
        inherited btnSearch: TcxButton
          Top = 501
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 472
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 727
      Height = 552
      inherited grdData: TcxGrid
        Width = 727
        Height = 552
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 191
          end
          object grdDataDBBandedTableViewStringValue: TcxGridDBBandedColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'STRINGVALUE'
            Width = 185
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSysName: TcxGridDBBandedColumn
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
      OnExecute = nil
      OnUpdate = nil
    end
    inherited actDelete: TAction
      Visible = False
      OnExecute = nil
      OnUpdate = nil
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
      'select t.id,'
      '       t.locality,'
      '       t.name,'
      '       t.shortname,'
      '       t.object_type_id,'
      '       t.state_id,'
      '       t.accesslevel,'
      '       t.sysname,'
      '       t.descript,'
      '       t.owner_object_id,'
      '       t.typename,'
      '       t.typesysname,'
      '       t.objectkindlist,'
      '       case t.locality'
      '         when 0 then'
      '          t.stringvalue'
      '         when 1 then'
      
        '          asbc_Locvalues.GetValueStr(t.SYSNAME, null, '#39'Cust'#39', as' +
        'bc_Locvalues.GetUserCust(user))'
      '         when 2 then'
      
        '          asbc_Locvalues.GetValueStr(t.SYSNAME, null, '#39'User'#39', us' +
        'er)'
      '       end stringvalue,'
      '       t.numvalue,'
      '       t.datetimevalue,'
      '       t.ref_object_id,'
      '       t.issystem,'
      '       t.ownername,'
      '       t.ownertypename,'
      '       t.ownertypesysname,'
      '       t.refname,'
      '       t.reftypename,'
      '       t.reftypesysname,'
      '       t.filesourcename'
      '  from fdc_value_lst_sys t'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      '   and t.owner_object_id is not null')
    SourceServerObject = 'FDC_VALUE_LST_SYS'
    object dsDataSTRINGVALUE: TStringField
      FieldName = 'STRINGVALUE'
      Size = 1500
    end
    object dsDataNUMVALUE: TFloatField
      FieldName = 'NUMVALUE'
    end
    object dsDataDATETIMEVALUE: TDateTimeField
      FieldName = 'DATETIMEVALUE'
    end
    object dsDataREF_OBJECT_ID: TFloatField
      FieldName = 'REF_OBJECT_ID'
    end
    object dsDataISSYSTEM: TIntegerField
      FieldName = 'ISSYSTEM'
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataOWNERTYPENAME: TStringField
      FieldName = 'OWNERTYPENAME'
      Size = 1500
    end
    object dsDataOWNERTYPESYSNAME: TStringField
      FieldName = 'OWNERTYPESYSNAME'
      Size = 1500
    end
    object dsDataREFNAME: TStringField
      FieldName = 'REFNAME'
      Size = 1500
    end
    object dsDataREFTYPENAME: TStringField
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
    object dsDataFILESOURCENAME: TStringField
      FieldName = 'FILESOURCENAME'
      Size = 1500
    end
    object dsDataLOCALITY: TIntegerField
      FieldName = 'LOCALITY'
    end
  end
end
