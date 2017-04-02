inherited DocPackReturnsGridForm: TDocPackReturnsGridForm
  Left = 409
  Top = 378
  Width = 773
  Height = 538
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1079#1072#1103#1074#1086#1082' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 475
    Width = 757
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 454
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 454
      end
      inherited pnlProgress: TPanel
        Width = 454
        inherited lblProgress: TcxLabel
          Width = 454
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 664
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 472
    Width = 757
  end
  inherited pnlWorkspace: TPanel
    Width = 757
    Height = 444
    inherited splSearchCriteria: TSplitter
      Height = 444
    end
    inherited pnlSearchCriteria: TPanel
      Height = 444
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 424
        object Label2: TLabel [1]
          Left = 9
          Top = 139
          Width = 76
          Height = 13
          Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
          Color = 16311512
          ParentColor = False
        end
        object Label3: TLabel [2]
          Left = 9
          Top = 206
          Width = 34
          Height = 13
          Caption = #1057#1091#1084#1084#1072
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 393
          TabOrder = 9
        end
        inherited btnSearchClear: TcxButton
          Top = 364
          TabOrder = 8
        end
        object edtFromDateSend: TcxDateEdit [9]
          Left = 60
          Top = 158
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 132
        end
        object edtToDateSend: TcxDateEdit [10]
          Left = 60
          Top = 182
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 132
        end
        object edtSumMin: TcxCurrencyEdit [11]
          Left = 60
          Top = 225
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 109
        end
        object edtSumMax: TcxCurrencyEdit [12]
          Left = 60
          Top = 249
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 109
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem6: TdxLayoutItem [5]
            ShowCaption = False
            Control = Label2
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem7: TdxLayoutItem [6]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDateSend
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [7]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDateSend
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem9: TdxLayoutItem [8]
            ShowCaption = False
            Control = Label3
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem10: TdxLayoutItem [9]
            Caption = '>='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem11: TdxLayoutItem [10]
            Caption = '=<'
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMax
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 552
      Height = 444
      inherited grdData: TcxGrid
        Width = 552
        Height = 444
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewCLAIMED_SPENDING
            end>
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end
            item
              Caption = #1052#1072#1088#1096#1088#1091#1090#1080#1079#1072#1094#1080#1103
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 150
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Visible = True
          end
          object grdDataDBBandedTableViewREGIONAL_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1057#1095#1105#1090' '#1056#1058#1059
            DataBinding.FieldName = 'REGIONAL_ACCOUNT'
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_IN: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
            DataBinding.FieldName = 'DATE_IN'
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
            DataBinding.FieldName = 'DATE_SEND'
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CLAIMED_DOC_COUNT'
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCLAIMED_SPENDING: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CLAIMED_SPENDING'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054'-'#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCCUSTOMS_NAME: TcxGridDBBandedColumn
            Caption = #1058#1054'-'#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
            DataBinding.FieldName = 'CUSTOMS_NAME'
            Width = 200
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
            DataBinding.FieldName = 'DESTINATION'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTINATION_NAME: TcxGridDBBandedColumn
            Caption = #1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'DESTINATION_NAME'
            Width = 200
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = True
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
      'select dpr.*, s.name AS state_name'
      '  from fdc_doc_pack_returns_lst dpr'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = dpr.state_id'
      ' where (:Name is null or upper(dpr.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR dpr.ext_source = :customs_' +
        'code)'
      '/*$p#from_date#*/ and (dpr.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (dpr.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (dpr.DOC_NUMBER like :DOC_NO)'
      '/*$p#from_date_send#*/ and (dpr.DATE_SEND >= :FROM_DATE_SEND)'
      '/*$p#to_date_send#*/   and (dpr.DATE_SEND <= :TO_DATE_SEND)'
      '/*$p#sum_min#*/   AND (dpr.CLAIMED_SPENDING>= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (dpr.CLAIMED_SPENDING<= :SUM_MAX)'
      '')
    SourceServerObject = 'FDC_DOC_PACK_RETURNS_LST'
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
        DataType = ftUnknown
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_SEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_SEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end>
    object dsDataREGIONAL_ACCOUNT: TStringField [17]
      FieldName = 'REGIONAL_ACCOUNT'
    end
    object dsDataCUSTOMS_CODE: TStringField [18]
      FieldName = 'CUSTOMS_CODE'
    end
    object dsDataCLAIMED_DOC_COUNT: TFloatField [19]
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1076#1086#1082'-'#1090#1086#1074
      FieldName = 'CLAIMED_DOC_COUNT'
    end
    object dsDataCLAIMED_SPENDING: TFloatField [20]
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082'-'#1090#1086#1074
      FieldName = 'CLAIMED_SPENDING'
    end
    object dsDataCURRENCY_ID: TFloatField [21]
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDATE_IN: TDateTimeField [22]
      FieldName = 'DATE_IN'
    end
    object dsDataDATE_SEND: TDateTimeField [23]
      FieldName = 'DATE_SEND'
    end
    object dsDataCUSTOMS_NAME: TStringField
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
    object dsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 8
    end
    object dsDataDESTINATION_NAME: TStringField
      FieldName = 'DESTINATION_NAME'
      Size = 1500
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
  end
end
