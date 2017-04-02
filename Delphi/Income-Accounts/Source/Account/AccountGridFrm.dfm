inherited AccountGridForm: TAccountGridForm
  Left = 383
  Top = 299
  Width = 693
  Caption = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    Width = 685
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 379
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 379
      end
      inherited pnlProgress: TPanel
        Width = 379
        inherited lblProgress: TcxLabel
          Width = 379
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 592
      Width = 77
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 685
  end
  inherited pnlWorkspace: TPanel
    Width = 685
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 5
        end
        inherited edtName: TcxTextEdit
          Left = 69
          Top = 12
          Width = 165
        end
        object edtAccName: TcxTextEdit [2]
          Left = 69
          Top = 96
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 165
        end
        object edtCurCode: TcxTextEdit [3]
          Left = 69
          Top = 124
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 165
        end
        object edtKPP: TcxTextEdit [4]
          Left = 69
          Top = 68
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        object edtINN: TcxTextEdit [5]
          Left = 69
          Top = 40
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
          Width = 167
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1072#1080#1084#1077#1085':'
            CaptionOptions.Layout = clLeft
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [1]
            Caption = #1048#1053#1053':'
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [2]
            Caption = #1050#1055#1055':'
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [3]
            Caption = #1057#1095#1077#1090':'
            Control = edtAccName
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [4]
            Caption = #1042#1072#1083#1102#1090#1072':'
            Control = edtCurCode
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 433
      inherited grdData: TcxGrid
        Width = 433
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              OnGetText = grdDataDBBandedTableViewTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
              FieldName = 'SALDO'
              Column = grdDataDBBandedTableViewACC_NAME
            end
            item
              Kind = skSum
              OnGetText = grdDataDBBandedTableViewTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
              FieldName = 'DEBET_TURNOVER'
              Column = grdDataDBBandedTableViewACC_NAME
            end
            item
              Kind = skSum
              OnGetText = grdDataDBBandedTableViewTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
              FieldName = 'CREDIT_TURNOVER'
              Column = grdDataDBBandedTableViewACC_NAME
            end>
          OptionsView.GroupByBox = True
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 154
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewACC_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACC_NAME'
            SortIndex = 0
            SortOrder = soAscending
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_TYPE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSALDO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SALDO'
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBET_TURNOVER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBET_TURNOVER'
            Width = 137
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCREDIT_TURNOVER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CREDIT_TURNOVER'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 10
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
      28
      0)
    object dxBarButton1: TdxBarButton
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1042#1069#1044
      Category = 0
      Hint = #1050#1072#1088#1090#1086#1095#1082#1072' '#1042#1069#1044
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
  end
  inherited dsData: TfdcQuery
    ParamCheck = False
    SQL.Strings = (
      'select '
      
        'to_number(null) id, a.hier_name, a.hier_name||'#39'-'#39'||c.CODE acc_na' +
        'me, a.currency_id, a.subject_id, a.payment_type '
      ',s.INN||'#39'/'#39'||s.KPP INN , s.name, c.CODE,'
      
        'case when a.hier_name in ('#39'100'#39', '#39'112'#1055#39', '#39'173'#39', '#39'134'#39') then -1 e' +
        'lse 1 end * sum(a.saldo) saldo'
      ',sum(a.debet_turnover) debet_turnover'
      ',sum(a.credit_turnover) credit_turnover'
      '  from '
      'fdc_account_saldo_lst a'
      ',fdc_subject_lst s'
      ',fdc_nsi_currency_lst c'
      'where          '
      ' (a.debet_turnover <> 0 or a.credit_turnover <> 0)'
      
        'and a.to_date = (select max(to_date) from fdc_account_saldo_lst ' +
        'aa where aa.account_id = a.account_id) '
      'and s.id = a.subject_id'
      'and c.id = a.currency_id'
      'and (:name is null or s.name like :name)'
      'and ((:inn is null and :kpp is null) or '
      
        '           s.inn||'#39'/'#39'||s.KPP like nvl(:inn,'#39'%'#39')||'#39'/'#39' ||nvl(:kpp,' +
        #39'%'#39'))'
      '   and ((:AccName is null  and :CurCode is null) or '
      
        '           (a.hier_name||'#39'-'#39'||c.CODE like nvl(:AccName, '#39'%'#39')||'#39'-' +
        #39'||nvl(:CurCode,'#39'%'#39')))'
      'group by           '
      
        'a.hier_name, a.hier_name||'#39'-'#39'||c.CODE, a.currency_id, a.subject_' +
        'id, a.payment_type '
      ',s.INN||'#39'/'#39'||s.KPP, s.name, c.CODE'
      ' order by 2'
      '         ,1 desc')
    ParamData = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AccName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CurCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AccName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CurCode'
        ParamType = ptUnknown
      end>
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053'/'#1050#1055#1055
      FieldName = 'INN'
      Size = 80
    end
    object dsDataACC_NAME: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'ACC_NAME'
      Size = 100
    end
    object dsDataSALDO: TFloatField
      DisplayLabel = #1057#1072#1083#1100#1076#1086
      FieldName = 'SALDO'
      DisplayFormat = ',0.00'
    end
    object dsDataDEBET_TURNOVER: TFloatField
      DisplayLabel = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1076#1077#1073#1077#1090#1091
      FieldName = 'DEBET_TURNOVER'
      DisplayFormat = ',0.00'
    end
    object dsDataCREDIT_TURNOVER: TFloatField
      DisplayLabel = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
      FieldName = 'CREDIT_TURNOVER'
      DisplayFormat = ',0.00'
    end
    object dsDataCODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CODE'
      Size = 3
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPAYMENT_TYPE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_TYPE'
      Size = 3
    end
  end
  object fdcQuery1: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      ' delete from fdc_account;'
      'end;')
    Left = 88
    Top = 132
  end
end
