inherited PersonalAccountGridForm: TPersonalAccountGridForm
  Left = 201
  Top = 189
  Width = 1079
  Height = 547
  Caption = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 495
    Width = 1071
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 766
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 766
      end
      inherited pnlProgress: TPanel
        Width = 766
        inherited lblProgress: TcxLabel
          Width = 766
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 979
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 492
    Width = 1071
  end
  inherited pnlWorkspace: TPanel
    Width = 1071
    Height = 466
    inherited splSearchCriteria: TSplitter
      Height = 466
    end
    inherited pnlSearchCriteria: TPanel
      Height = 466
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 446
        inherited btnSearch: TcxButton
          Top = 415
          TabOrder = 4
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 386
          TabOrder = 3
        end
        object edtINN: TcxTextEdit [3]
          Left = 35
          Top = 48
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 115
        end
        object edtKPP: TcxTextEdit [4]
          Left = 35
          Top = 72
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 115
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchInn: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchKpp: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 866
      Height = 466
      inherited grdData: TcxGrid
        Width = 866
        Height = 466
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 231
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 316
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Width = 228
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SDATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EDATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
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
      26
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_personal_account_lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        '   and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_da' +
        'te('#39'31123000'#39', '#39'ddmmyyyy'#39'))'
      '--$s#viewmode#1*/ and t.parent_id is null'
      '   and (:id is null or t.id <> :id)'
      '/*$p#inn#*/ and (t.inn        LIKE :INN)'
      '/*$p#kpp#*/ and (t.kpp        LIKE :KPP)'
      'AND rownum <= :MaxRecordCount'
      '')
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
        DataType = ftDateTime
        Name = 'dat'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1089#1095#1077#1090#1072
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataSDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1051#1057
      FieldName = 'SDATE'
    end
    object dsDataEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1051#1057
      FieldName = 'EDATE'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
      Visible = False
    end
    object dsDataPARENT_ID: TFloatField
      FieldName = 'PARENT_ID'
      Visible = False
    end
  end
end
