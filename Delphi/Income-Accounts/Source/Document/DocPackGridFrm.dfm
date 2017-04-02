inherited DocPackGridForm: TDocPackGridForm
  Width = 820
  Height = 384
  Caption = #1055#1072#1082#1077#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 325
    Width = 812
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Top = 2
      Width = 506
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 506
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 506
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 506
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 719
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 322
    Width = 812
  end
  inherited pnlWorkspace: TPanel
    Width = 812
    Height = 294
    inherited splSearchCriteria: TSplitter
      Height = 294
    end
    inherited pnlSearchCriteria: TPanel
      Height = 294
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 274
        object Label1: TLabel [0]
          Left = 9
          Top = 72
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072' '
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 243
          TabOrder = 5
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 214
          TabOrder = 4
        end
        object edtFromDate: TcxDateEdit [4]
          Left = 60
          Top = 91
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 109
        end
        object edtToDate: TcxDateEdit [5]
          Left = 60
          Top = 115
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 109
        end
        object edtNomer: TcxTextEdit [6]
          Left = 60
          Top = 48
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 109
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem5: TdxLayoutItem [1]
            Caption = #1053#1086#1084#1077#1088'     '
            Control = edtNomer
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [2]
            ShowCaption = False
            Control = Label1
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [3]
            Caption = #1057'   '
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [4]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 607
      Height = 294
      inherited grdData: TcxGrid
        Width = 607
        Height = 294
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_NAME'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_RECIEVED: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_RECIEVED'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRECIEVE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RECIEVE_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 12
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
            BeginGroup = True
            Item = dxbcTO
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
    object dxbcTO: TdxBarCombo
      Caption = #1058#1054
      Category = 2
      Hint = #1058#1054
      Visible = ivAlways
      OnChange = dxbcTOChange
      ShowCaption = True
      Width = 150
      ItemIndex = -1
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.name AS state_name'
      '  from fdc_doc_pack_lst t'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = t.state_id'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.ext_source = :customs_co' +
        'de) '
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)'
      '')
    SourceServerObject = 'FDC_DOC_PACK_LST'
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
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code'
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
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1082#1077#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1087#1072#1082#1077#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataSTATE_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataSENDER_SOFT_CODE_ID: TFloatField
      FieldName = 'SENDER_SOFT_CODE_ID'
    end
    object dsDataSENDER_SOFT_NAME: TStringField
      FieldName = 'SENDER_SOFT_NAME'
      Size = 1500
    end
    object dsDataSENDER_SOFT_CODE: TStringField
      FieldName = 'SENDER_SOFT_CODE'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE_ID: TFloatField
      FieldName = 'RECEIVER_SOFT_CODE_ID'
    end
    object dsDataRECEIVER_SOFT_NAME: TStringField
      FieldName = 'RECEIVER_SOFT_NAME'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE: TStringField
      FieldName = 'RECEIVER_SOFT_CODE'
      Size = 1500
    end
    object dsDataIS_RECIEVED: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085
      FieldName = 'IS_RECIEVED'
      Size = 1
    end
    object dsDataRECIEVE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      FieldName = 'RECIEVE_DATE'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
end
