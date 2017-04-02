inherited SubjectGridForm: TSubjectGridForm
  Width = 729
  HelpContext = 32
  Caption = #1057#1091#1073#1098#1077#1082#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 721
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 416
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 416
      end
      inherited pnlProgress: TPanel
        Width = 416
        inherited lblProgress: TcxLabel
          Width = 416
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 629
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 721
  end
  inherited pnlWorkspace: TPanel
    Width = 721
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        object edtINN: TcxTextEdit [2]
          Left = 9
          Top = 63
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 122
        end
        object edtOKPO: TcxTextEdit [3]
          Left = 9
          Top = 102
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 122
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            CaptionOptions.Layout = clTop
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            CaptionOptions.Layout = clTop
            Control = edtOKPO
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 516
      inherited grdData: TcxGrid
        Width = 516
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 414
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ADDRESS'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Visible = False
            Hidden = True
            Width = 122
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Visible = False
            Hidden = True
            Width = 114
            Position.BandIndex = 0
            Position.ColIndex = 5
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
    Left = 288
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Subject_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and (:INN is null or INN like :INN)'
      'and (:OKPO is null or KPP like :OKPO)'
      'and rownum <= :MaxRecordCount')
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
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataFULL_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
    end
    object dsDataOGRN: TStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      DisplayLabel = #1057#1054#1040#1058#1054
      FieldName = 'SOATO'
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Size = 30
    end
    object dsDataFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      DisplayLabel = #1058#1077#1083#1077#1082#1089
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      DisplayLabel = #1058#1077#1083#1077#1075#1088#1072#1092
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1090#1072#1081#1087
      FieldName = 'TELETYPE'
      Size = 100
    end
  end
end
