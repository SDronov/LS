inherited EventsGridForm: TEventsGridForm
  Left = 302
  Top = 223
  Width = 772
  Height = 456
  Caption = #1046#1091#1088#1085#1072#1083' '#1076#1077#1081#1089#1090#1074#1080#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 393
    Width = 756
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 453
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 453
      end
      inherited pnlProgress: TPanel
        Width = 453
        inherited lblProgress: TcxLabel
          Width = 453
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 663
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 390
    Width = 756
  end
  inherited pnlWorkspace: TPanel
    Width = 756
    Height = 362
    inherited splSearchCriteria: TSplitter
      Height = 362
    end
    inherited pnlSearchCriteria: TPanel
      Height = 362
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 342
        object lblSearchMoment: TLabel [0]
          Left = 9
          Top = 219
          Width = 169
          Height = 13
          Caption = #1048#1089#1082#1072#1090#1100' '#1089#1086#1073#1099#1090#1080#1103', '#1087#1088#1086#1080#1079#1086#1096#1077#1076#1096#1080#1077':'
          Color = 16311512
          ParentColor = False
          Transparent = False
        end
        inherited btnSearch: TcxButton
          Left = 99
          Top = 384
          TabOrder = 11
        end
        object edtSrchEvtName: TcxTextEdit [2]
          Left = 9
          Top = 66
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 121
        end
        object edtSrchLogin: TcxTextEdit [3]
          Left = 9
          Top = 150
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          OnKeyDown = edtSearchKeyDown
          Width = 121
        end
        object edtSrchOSUser: TcxTextEdit [4]
          Left = 9
          Top = 192
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          OnKeyDown = edtSearchKeyDown
          Width = 121
        end
        object btnAllTime: TcxRadioButton [5]
          Left = 19
          Top = 238
          Width = 182
          Height = 17
          Caption = #1042' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103
          Checked = True
          Color = 16311512
          ParentColor = False
          TabOrder = 5
          TabStop = True
        end
        object btnLastDay: TcxRadioButton [6]
          Left = 19
          Top = 261
          Width = 140
          Height = 17
          Caption = #1047#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1089#1091#1090#1082#1080
          Color = 16311512
          ParentColor = False
          TabOrder = 6
        end
        object btnLastWeek: TcxRadioButton [7]
          Left = 19
          Top = 284
          Width = 140
          Height = 17
          Caption = #1047#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1085#1077#1076#1077#1083#1102
          Color = 16311512
          ParentColor = False
          TabOrder = 7
        end
        object btnPeriod: TcxRadioButton [8]
          Left = 19
          Top = 307
          Width = 140
          Height = 17
          Caption = #1042' '#1087#1077#1088#1080#1086#1076':'
          Color = 16311512
          ParentColor = False
          TabOrder = 8
        end
        object edtSrchDateFrom: TcxDateEdit [9]
          Left = 45
          Top = 330
          ParentFont = False
          Properties.Kind = ckDateTime
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          OnEnter = edtSrchDateFromEnter
          OnKeyDown = edtSearchKeyDown
          Width = 141
        end
        object edtSrchDateTo: TcxDateEdit [10]
          Left = 45
          Top = 357
          ParentFont = False
          Properties.Kind = ckDateTime
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          OnEnter = edtSrchDateFromEnter
          OnKeyDown = edtSearchKeyDown
          Width = 141
        end
        object edtSrchEvtCode: TcxMaskEdit [11]
          Left = 9
          Top = 24
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.EditMask = 'AAA-00000;1;_'
          Properties.MaxLength = 0
          Properties.ValidateOnEnter = False
          Properties.OnValidate = edtSrchEvtCodePropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          Text = '   -     '
          Width = 121
        end
        object edtSrchIP: TcxTextEdit [12]
          Left = 9
          Top = 108
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [0]
            Caption = #1050#1086#1076' '#1089#1086#1073#1099#1090#1080#1103
            CaptionOptions.Layout = clTop
            Control = edtSrchEvtCode
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [1]
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            CaptionOptions.Layout = clTop
            Control = edtSrchEvtName
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [2]
            Caption = 'IP '#1072#1076#1088#1077#1089
            CaptionOptions.Layout = clTop
            Control = edtSrchIP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [3]
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' Oracle'
            CaptionOptions.Layout = clTop
            Control = edtSrchLogin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem5: TdxLayoutItem [4]
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1054#1057
            CaptionOptions.Layout = clTop
            Control = edtSrchOSUser
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem6: TdxLayoutItem [5]
            ShowCaption = False
            Control = lblSearchMoment
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem7: TdxLayoutItem [6]
            Offsets.Left = 10
            ShowCaption = False
            Control = btnAllTime
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [7]
            Offsets.Left = 10
            ShowCaption = False
            Control = btnLastDay
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem9: TdxLayoutItem [8]
            Offsets.Left = 10
            ShowCaption = False
            Control = btnLastWeek
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem10: TdxLayoutItem [9]
            Offsets.Left = 10
            ShowCaption = False
            Control = btnPeriod
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciSrchDateFrom: TdxLayoutItem [10]
            Caption = #1089
            CaptionOptions.Width = 15
            Offsets.Left = 20
            Control = edtSrchDateFrom
            ControlOptions.AutoAlignment = False
            ControlOptions.ShowBorder = False
          end
          object lciSrchDateTo: TdxLayoutItem [11]
            Caption = #1087#1086
            CaptionOptions.Width = 15
            Offsets.Left = 20
            Control = edtSrchDateTo
            ControlOptions.AutoAlignment = False
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 551
      Height = 362
      inherited grdData: TcxGrid
        Width = 551
        Height = 362
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsView.BandHeaders = True
          Bands = <
            item
              Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
              Options.HoldOwnColumnsOnly = True
            end
            item
              Caption = #1057#1086#1073#1099#1090#1080#1077
            end
            item
              Caption = #1061#1086#1089#1090
            end>
          object grdDataDBBandedTableViewUSER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'USER_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLASTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LASTNAME'
            Visible = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFIRSTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FIRSTNAME'
            Visible = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMIDDLENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MIDDLENAME'
            Visible = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOGIN'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOS_USER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OS_USER'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEVT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EVT_CODE'
            Width = 100
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Width = 150
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPE_CODE'
            Visible = False
            Width = 120
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODE'
            Visible = False
            Width = 50
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEVT_MOMENT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EVT_MOMENT'
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEVT_DESCRIPTION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EVT_DESCRIPTION'
            Width = 250
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewHOST_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HOST_NAME'
            Width = 180
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIP_ADDRESS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IP_ADDRESS'
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMODULE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODULE'
            Width = 200
            Position.BandIndex = 2
            Position.ColIndex = 2
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
      'SELECT user_id'
      '      ,evt_code'
      '      ,type_code'
      '      ,code'
      '      ,evt_moment'
      '      ,evt_description'
      '      ,name'
      '      ,login'
      '      ,LastName'
      '      ,FirstName'
      '      ,MiddleName'
      '      ,host_name'
      '      ,ip_address'
      '      ,os_user'
      '      ,module'
      
        '      ,LastName || '#39' '#39' || FirstName || '#39' '#39' || MiddleName AS user' +
        '_name'
      '  FROM fdc_evt_lst'
      '  WHERE ( :type_code  IS NULL OR type_code = :type_code )'
      '    AND ( :code       IS NULL OR code      = :code      )'
      
        '    AND ( :name       IS NULL OR UPPER( name )       LIKE UPPER(' +
        ' :name )       )'
      
        '    AND ( :ip_address IS NULL OR UPPER( ip_address ) LIKE UPPER(' +
        ' :ip_address ) )'
      
        '    AND ( :login      IS NULL OR UPPER( login )      LIKE UPPER(' +
        ' :login )      )'
      
        '    AND ( :os_user    IS NULL OR UPPER( os_user )    LIKE UPPER(' +
        ' :os_user )    )'
      '    AND ( :date_from  IS NULL OR evt_moment >= :date_from )'
      '    AND ( :date_to    IS NULL OR evt_moment <= :date_to   )'
      '    AND ( :id         IS NULL OR user_id    = :id )'
      '    AND rownum <= :MaxRecordCount'
      '  ORDER BY evt_moment DESC')
    ParamData = <
      item
        DataType = ftString
        Name = 'type_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'type_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end
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
        Name = 'ip_address'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ip_address'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'os_user'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'os_user'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataUSER_ID: TFloatField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      FieldName = 'USER_ID'
    end
    object dsDataEVT_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1086#1073#1099#1090#1080#1103
      FieldName = 'EVT_CODE'
      Size = 9
    end
    object dsDataTYPE_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1080#1087#1072
      FieldName = 'TYPE_CODE'
      Size = 3
    end
    object dsDataCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Size = 5
    end
    object dsDataEVT_MOMENT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103
      FieldName = 'EVT_MOMENT'
    end
    object dsDataEVT_DESCRIPTION: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'EVT_DESCRIPTION'
      Size = 2000
    end
    object dsDataNAME: TStringField
      DisplayLabel = #1057#1086#1073#1099#1090#1080#1077
      FieldName = 'NAME'
      Size = 250
    end
    object dsDataLOGIN: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' Oracle'
      FieldName = 'LOGIN'
      Size = 1500
    end
    object dsDataLASTNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LASTNAME'
      Size = 1500
    end
    object dsDataFIRSTNAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRSTNAME'
      Size = 1500
    end
    object dsDataMIDDLENAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLENAME'
      Size = 1500
    end
    object dsDataHOST_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1093#1086#1089#1090#1072
      FieldName = 'HOST_NAME'
      Size = 150
    end
    object dsDataIP_ADDRESS: TStringField
      DisplayLabel = 'IP-'#1072#1076#1088#1077#1089' '#1093#1086#1089#1090#1072
      DisplayWidth = 35
      FieldName = 'IP_ADDRESS'
      Size = 35
    end
    object dsDataOS_USER: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1054#1057
      FieldName = 'OS_USER'
      Size = 150
    end
    object dsDataMODULE: TStringField
      DisplayLabel = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1099#1081' '#1084#1086#1076#1091#1083#1100
      FieldName = 'MODULE'
      Size = 150
    end
    object dsDataUSER_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'USER_NAME'
      Size = 300
    end
  end
end
