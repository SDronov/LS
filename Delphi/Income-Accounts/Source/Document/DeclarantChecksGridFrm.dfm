inherited DeclarantChecksGridForm: TDeclarantChecksGridForm
  Left = 309
  Top = 368
  Width = 908
  Height = 548
  Caption = #1055#1088#1086#1074#1077#1088#1082#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 485
    Width = 892
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 589
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 589
      end
      inherited pnlProgress: TPanel
        Width = 589
        inherited lblProgress: TcxLabel
          Width = 589
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 799
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 482
    Width = 892
  end
  inherited pnlWorkspace: TPanel
    Width = 892
    Height = 454
    inherited splSearchCriteria: TSplitter
      Height = 454
    end
    inherited pnlSearchCriteria: TPanel
      Height = 454
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 434
        inherited btnSearch: TcxButton
          Top = 403
          TabOrder = 5
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 374
          TabOrder = 4
        end
        object edtChecktype: TcxTextEdit [3]
          Left = 9
          Top = 63
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Width = 183
        end
        object edtDateBegin: TcxDateEdit [4]
          Left = 52
          Top = 90
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 140
        end
        object edtDateEnd: TcxDateEdit [5]
          Left = 52
          Top = 114
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 140
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Visible = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1058#1080#1087':'
            CaptionOptions.Layout = clTop
            Control = edtChecktype
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1044#1072#1090#1072' '#1089
            Control = edtDateBegin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [3]
            Caption = #1044#1072#1090#1072' '#1087#1086
            Control = edtDateEnd
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 687
      Height = 454
      inherited grdData: TcxGrid
        Width = 687
        Height = 454
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 151
          end
          object colgrdDataDBBandedTableViewsCHECKTYPE: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'sCHECKTYPE'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewchecknumb: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'checknumb'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewcheckdate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1072#1087#1088#1086#1089#1072
            DataBinding.FieldName = 'checkdate'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewsSTATUS: TcxGridDBBandedColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'sSTATUS'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewreqcont: TcxGridDBBandedColumn
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1072
            DataBinding.FieldName = 'reqcont'
            MinWidth = 100
            Width = 240
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewansdate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1090#1074#1077#1090#1072
            DataBinding.FieldName = 'ansdate'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewanscont: TcxGridDBBandedColumn
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
            DataBinding.FieldName = 'anscont'
            MinWidth = 240
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
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
            Item = ctxViewMode
            UserDefine = [udWidth]
            UserWidth = 162
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
    object ctxViewMode: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = ctxViewModeChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        #1042#1089#1077
        #1053#1072#1087#1088#1072#1074#1083#1077#1085' '#1079#1072#1087#1088#1086#1089
        #1055#1086#1083#1091#1095#1077#1085' '#1086#1090#1074#1077#1090
        #1042#1086#1079#1074#1088#1072#1097#1077#1085#1072' '#1086#1096#1080#1073#1082#1072)
      ItemIndex = 0
    end
    object dxBarButton1: TdxBarButton
      Caption = #1050#1072#1082' '#1073#1099#1083#1086
      Category = 0
      Hint = #1050#1072#1082' '#1073#1099#1083#1086
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = #1089' Recent'
      Category = 0
      Hint = #1089' Recent'
      Visible = ivAlways
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftInteger
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Account'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select v.*'
      '  from v_asbc_checks_lst v'
      ' where (:Name is null or upper(v.NAME) like upper(:Name))'
      '   and v.subject_id = :SUBJECT_ID'
      
        '   and (UPPER(v.schecktype) like UPPER(trim(:SCHECKTYPE)) or tri' +
        'm(:SCHECKTYPE) is null)'
      '--$s#viewmode#1*/ and v.nstatus = 0'
      '--$s#viewmode#2*/ and v.nstatus = 1'
      '--$s#viewmode#3*/ and v.nstatus = 2'
      ''
      
        '/*$p#from_date#*/ AND ((v.checkdate  >= :FROM_DATE) or :FROM_DAT' +
        'E is null)'
      
        '/*$p#to_date#*/   AND ( (v.checkdate  <= :TO_DATE) or :TO_DATE i' +
        's null)'
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
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SCHECKTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SCHECKTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end>
    object dsDatasubject_id: TIntegerField
      FieldName = 'subject_id'
    end
    object dsDatadocument_id: TIntegerField
      FieldName = 'document_id'
    end
    object dsDatacheckdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object dsDatareqcont: TStringField
      DisplayWidth = 200
      FieldName = 'reqcont'
      Size = 240
    end
    object dsDatasCHECKTYPE: TStringField
      FieldName = 'sCHECKTYPE'
    end
    object dsDatasSTATUS: TStringField
      FieldName = 'sSTATUS'
    end
    object dsDataansdate: TDateTimeField
      FieldName = 'ansdate'
    end
    object dsDataanscont: TStringField
      DisplayWidth = 200
      FieldName = 'anscont'
      Size = 240
    end
    object dsDatachecknumb: TStringField
      FieldName = 'checknumb'
    end
    object dsDatanstatus: TIntegerField
      FieldName = 'nstatus'
    end
  end
  object dsChecksRecent: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      '   and (v.checkdate = (select max(cd.checkdate) '
      '                       from asbc_checks cd'
      '                       where cd.subject_id = v.subject_id'
      '                         and cd.checktype = v.nchecktype'
      '                     ) and SCHECKTYPE <> '#39#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090#39
      '       or v.SCHECKTYPE = '#39#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090#39
      '       and v.checkdate = (select max(cd.checkdate) '
      '                       from asbc_checks cd'
      '                       where cd.subject_id = v.subject_id'
      '                         and cd.checktype = v.nchecktype'
      
        '                         and (instr(cd.reqcont,'#39#1057#1095#1077#1090'='#39'||'#39'ACC|'#39')>' +
        '0)                         '
      '                     )'
      ''
      '       )')
    Left = 96
    Top = 232
  end
  object dsputSubject: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      'PKG_ASBC_CHECKS.setSubject(:nID);'
      'END;')
    Left = 88
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nID'
        ParamType = ptUnknown
      end>
  end
end
