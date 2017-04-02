inherited SubjDoublesGridForm: TSubjDoublesGridForm
  Width = 729
  Caption = #1042#1086#1079#1084#1086#1078#1085#1099#1077' '#1076#1091#1073#1083#1080' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1089#1091#1073#1098#1077#1082#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 721
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited lblRecordCount: TcxLabel
        Height = 17
        Width = 100
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 20
        Width = 81
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 416
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 416
      end
      inherited pnlProgress: TPanel
        Width = 416
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 416
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 629
      inherited ProgressBar: TcxProgressBar
        Height = 19
        Width = 77
      end
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
          Width = 183
        end
        object edtINN: TcxTextEdit [2]
          Left = 9
          Top = 66
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 183
        end
        object edtOKPO: TcxTextEdit [3]
          Left = 9
          Top = 108
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 183
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
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
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
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
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
            Item = btnDelete
            Visible = True
          end
          item
            Item = dxBarButton1
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
      Caption = #1055#1088#1080#1079#1085#1072#1090#1100' '#1076#1091#1073#1083#1077#1084
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = #1055#1088#1080#1079#1085#1072#1090#1100' '#1076#1091#1073#1083#1077#1084
      Category = 0
      Hint = #1055#1088#1080#1079#1085#1072#1090#1100' '#1076#1091#1073#1083#1077#1084
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select s2.*'
      'from fdc_subject s, fdc_subject_lst s2'
      '       where s2.id != s.id and '
      '       s.inn = s2.inn and '
      '       ('
      '       (substr(s.KPP,5,2) in ('#39'02'#39','#39'03'#39','#39'04'#39','#39'05'#39','#39'31'#39','#39'32'#39') and'
      '       substr(s2.KPP,5,2) in ('#39'02'#39','#39'03'#39','#39'04'#39','#39'05'#39','#39'31'#39','#39'32'#39')) or'
      
        '       (substr(s.KPP,5,2) not in ('#39'02'#39','#39'03'#39','#39'04'#39','#39'05'#39','#39'31'#39','#39'32'#39')' +
        ' and'
      
        '       substr(s2.KPP,5,2) not in ('#39'02'#39','#39'03'#39','#39'04'#39','#39'05'#39','#39'31'#39','#39'32'#39')' +
        ') '
      '       )'
      ' and (:Name is null or upper(s2.NAME) like upper(:Name))'
      'and (:INN is null or s2.INN like :INN)'
      'and (:OKPO is null or s2.KPP like :OKPO)'
      'and s.id = :SUBJ_ID and s2.dupl_subj_id is null'
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
        Name = 'SUBJ_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
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
    object dsDataDUPL_SUBJ_ID: TFloatField
      FieldName = 'DUPL_SUBJ_ID'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 72
    Top = 166
    object sqlMarkAsDouble: TsqlOp
      SQL.Strings = (
        'begin'
        ' fdc_subject_set_duplicate(:ID,:SUBJ_ID); '
        'end;')
    end
  end
end
