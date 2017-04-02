inherited RepayGroupBySubjGridForm: TRepayGroupBySubjGridForm
  Caption = #1056#1072#1089#1089#1088#1086#1095#1082#1080'/'#1054#1090#1089#1088#1086#1095#1082#1080' '
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      Height = 24
      inherited lblRecordCount: TcxLabel
        Height = 24
        Width = 102
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 24
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
      Height = 24
      inherited lblQueryTime: TcxLabel
        Height = 24
        Width = 102
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 280
      Height = 24
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 280
        Height = 24
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 24
        end
      end
      inherited pnlProgress: TPanel
        Width = 280
        Height = 24
        inherited lblProgress: TcxLabel
          Height = 24
          Width = 280
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 493
      Width = 77
      Height = 24
      inherited ProgressBar: TcxProgressBar
        Height = 23
        Width = 95
      end
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 226
        end
        object edtKPP: TcxTextEdit [2]
          Left = 12
          Top = 125
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          OnKeyDown = edtSearchKeyDown
          Width = 223
        end
        object edtINN: TcxTextEdit [3]
          Left = 12
          Top = 78
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 223
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem2: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            CaptionOptions.Layout = clTop
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            CaptionOptions.Layout = clTop
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewADDRESS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ADDRESS'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FULL_NAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OKPO'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OGRN'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SOATO'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PHONE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FAX'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEX'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEGRAPH'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELETYPE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 22
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
    inherited actDelete: TAction
      Visible = False
    end
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
      'select '
      'distinct s.*'
      'from '
      'fdc_repayment_lst t'
      ',fdc_custom_decl_lst cd'
      ',fdc_subject_lst s'
      
        'where cd.id = t.decl_id and s.id = cd.subject_id and t.rest_summ' +
        'a > 0'
      'and (:Name is null or upper(s.NAME) like upper(:Name))'
      'and (:INN is null or s.INN like :INN)'
      'and (:KPP is null or s.KPP like :KPP)'
      'and rownum < :MaxRecordCount')
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
        Name = 'KPP'
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
    object dsDataADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataOGRN: TStringField
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      FieldName = 'SOATO'
      Size = 8
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataPHONE: TStringField
      FieldName = 'PHONE'
      Size = 40
    end
    object dsDataFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      FieldName = 'TELETYPE'
      Size = 100
    end
  end
end
