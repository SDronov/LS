inherited DocPackPaymentsGridForm: TDocPackPaymentsGridForm
  Left = 420
  Top = 197
  Width = 661
  Height = 511
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1087#1083#1072#1090#1077#1078#1077#1081' ( '#1074#1099#1087#1080#1089#1082#1080' '#1080#1079' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072')'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 459
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
    Top = 456
    Width = 653
  end
  inherited pnlWorkspace: TPanel
    Width = 653
    Height = 430
    inherited splSearchCriteria: TSplitter
      Height = 430
    end
    inherited pnlSearchCriteria: TPanel
      Height = 430
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 410
        inherited Label1: TLabel
          Width = 29
        end
        object Label2: TLabel [1]
          Left = 9
          Top = 139
          Width = 81
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 379
          TabOrder = 7
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 350
          TabOrder = 6
        end
        inherited edtFromDate: TcxDateEdit
          Width = 109
        end
        inherited edtToDate: TcxDateEdit
          Width = 109
        end
        inherited edtNomer: TcxTextEdit
          Width = 109
        end
        object edtReceiveDateFrom: TcxDateEdit [8]
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
          Width = 123
        end
        object edtReceiveDateTo: TcxDateEdit [9]
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
          Width = 123
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
            Control = edtReceiveDateFrom
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [7]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtReceiveDateTo
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 448
      Height = 430
      inherited grdData: TcxGrid
        Width = 448
        Height = 430
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSumma
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSumma
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewIS_RECIEVED: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewRECIEVE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Visible = True
            Position.ColIndex = 17
          end
          object grdDataDBBandedTableViewDest: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDateOut: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_OUT'
            FooterAlignmentHorz = taRightJustify
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCurrency: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCYCODE'
            Width = 52
            Position.BandIndex = 0
            Position.ColIndex = 14
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
          object grdDataDBBandedTableViewSumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 16
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
    object actCreatePacks: TAction
      Category = 'Object'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
      OnExecute = actCreatePacksExecute
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
            Item = btnCreatePacks
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
          end
          item
            Item = cbxFilter
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
    object cbxFilter: TdxBarCombo
      Align = iaRight
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = cbxFilterChange
      Width = 100
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077
        #1042#1093#1086#1076#1103#1097#1080#1077
        #1048#1089#1093#1086#1076#1103#1097#1080#1077
        #1053#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077)
      ItemIndex = 0
    end
    object btnCreatePacks: TdxBarButton
      Action = actCreatePacks
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      
        '      ,(SELECT s.NAME FROM fdc_state_lst s WHERE s.id = t.state_' +
        'id) AS state_name'
      '      ,c.code AS CurrencyCode'
      '      ,c.Name AS CurrencyName'
      
        '      ,( SELECT fdc_Doc_Pack_Payments_Summa (t.id) FROM dual) AS' +
        ' SUMMA'
      '  from fdc_doc_pack_payments_lst t'
      '  LEFT OUTER JOIN fdc_nsi_currency_lst c ON c.id = t.CURRENCY_ID'
      '  WHERE  rownum <= :MaxRecordCount AND'
      '         t.STATE_ID IS NOT NULL AND'
      '        (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.DestCustomsCode = :custo' +
        'ms_code)'
      '   AND ( NVL(:FILTER, 0) = 0'
      
        '         OR (:FILTER = 1 AND t.Receiver_Soft_Code = p_params.App' +
        'licationCode )'
      
        '         OR (:FILTER = 2 AND t.Sender_Soft_Code = p_params.Appli' +
        'cationCode  )'
      '         OR EXISTS (SELECT 1 FROM fdc_state_lst s'
      '                    WHERE'
      '                        s.id = t.STATE_ID'
      
        '                    AND (   (:FILTER = 3 AND s.SYSNAME IN ('#39'Stat' +
        'e.PackPayments.Created'#39', '#39'State.PackPayments.Formed'#39') )'
      
        '                         OR (:FILTER = 4 AND s.SYSNAME = '#39'State.' +
        'PackPayments.Sended'#39' )'
      
        '                         OR (:FILTER = 5 AND s.SYSNAME = '#39'State.' +
        'PackPayments.Confirmed'#39' )'
      '                         )'
      '                    )'
      '       )'
      '/*select t.*'
      '      ,s.name AS state_name'
      '      ,c.code AS CurrencyCode'
      '      ,c.Name AS CurrencyName'
      
        '      ,( SELECT fdc_Doc_Pack_Payments_Summa (t.id) FROM dual) AS' +
        ' SUMMA'
      '  from fdc_doc_pack_payments_lst t'
      '  INNER JOIN fdc_state_lst s ON s.id = t.state_id'
      '  LEFT OUTER JOIN fdc_nsi_currency_lst c ON c.id = t.CURRENCY_ID'
      ' WHERE (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.DestCustomsCode = :custo' +
        'ms_code)'
      '   AND ( NVL(:FILTER, 0) = 0'
      
        '         OR (:FILTER = 1 AND t.Receiver_Soft_Code = p_params.App' +
        'licationCode )'
      
        '         OR (:FILTER = 2 AND t.Sender_Soft_Code = p_params.Appli' +
        'cationCode  )'
      
        '         OR (:FILTER = 3 AND s.SYSNAME IN ('#39'State.PackPayments.C' +
        'reated'#39', '#39'State.PackPayments.Formed'#39') )'
      
        '         OR (:FILTER = 4 AND s.SYSNAME = '#39'State.PackPayments.Sen' +
        'ded'#39' )'
      
        '         OR (:FILTER = 5 AND s.SYSNAME = '#39'State.PackPayments.Con' +
        'firmed'#39' )'
      '       )*/'
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)'
      
        '/*$p#receive_date_from#*/ and (t.recieve_date >= :RECEIVE_DATE_F' +
        'ROM)'
      '/*$p#receive_date_to#*/ and (t.recieve_date <= :RECEIVE_DATE_TO)'
      '')
    SourceServerObject = 'FDC_DOC_PACK_PAYMENTS_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECEIVE_DATE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECEIVE_DATE_TO'
        ParamType = ptUnknown
      end>
    inherited dsDataID: TFloatField
      Visible = False
    end
    inherited dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
    end
    inherited dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataDATE_OUT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'DATE_OUT'
    end
    object dsDataCURRENCYCODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'SUMMA'
    end
  end
end
