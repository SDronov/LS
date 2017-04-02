inherited EventGridForm: TEventGridForm
  Left = 315
  Top = 259
  Height = 368
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 314
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 311
  end
  inherited pnlWorkspace: TPanel
    Height = 283
    inherited splSearchCriteria: TSplitter
      Left = 193
      Height = 283
    end
    inherited pnlSearchCriteria: TPanel
      Width = 193
      Height = 283
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 193
        Height = 263
        object lblSearchMoment: TLabel [0]
          Left = 9
          Top = 51
          Width = 168
          Height = 13
          Caption = #1048#1089#1082#1072#1090#1100' '#1089#1086#1073#1099#1090#1080#1103', '#1087#1088#1086#1080#1079#1086#1096#1077#1076#1096#1080#1077':'
          Color = 16311512
          ParentColor = False
          Transparent = False
        end
        inherited btnSearch: TcxButton
          Left = 109
          Top = 231
          TabOrder = 7
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        object edtDateFrom: TcxDateEdit [3]
          Left = 43
          Top = 162
          Width = 105
          Height = 21
          ParentFont = False
          Properties.Kind = ckDateTime
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          OnEnter = edtDateFromEnter
          OnKeyDown = edtSearchKeyDown
        end
        object edtDateTo: TcxDateEdit [4]
          Left = 43
          Top = 189
          Width = 105
          Height = 21
          ParentFont = False
          Properties.Kind = ckDateTime
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          OnEnter = edtDateFromEnter
          OnKeyDown = edtSearchKeyDown
        end
        object btnLastDay: TcxRadioButton [5]
          Left = 19
          Top = 93
          Width = 140
          Height = 17
          Caption = #1047#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1089#1091#1090#1082#1080
          Color = 16311512
          ParentColor = False
          TabOrder = 2
          OnKeyDown = edtSearchKeyDown
        end
        object btnLastWeek: TcxRadioButton [6]
          Left = 19
          Top = 116
          Width = 140
          Height = 17
          Caption = #1047#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1085#1077#1076#1077#1083#1102
          Color = 16311512
          ParentColor = False
          TabOrder = 3
          OnKeyDown = edtSearchKeyDown
        end
        object btnPeriod: TcxRadioButton [7]
          Left = 19
          Top = 139
          Width = 140
          Height = 17
          Caption = #1042' '#1087#1077#1088#1080#1086#1076':'
          Color = 16311512
          ParentColor = False
          TabOrder = 4
          OnKeyDown = edtSearchKeyDown
        end
        object btnAllTime: TcxRadioButton [8]
          Left = 19
          Top = 70
          Width = 140
          Height = 17
          Caption = #1042' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103
          Checked = True
          Color = 16311512
          ParentColor = False
          TabOrder = 1
          TabStop = True
          OnKeyDown = edtSearchKeyDown
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1086#1073#1099#1090#1080#1103':'
          end
          object lciSearchMoment: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            ShowCaption = False
            Control = lblSearchMoment
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciAllTime: TdxLayoutItem [2]
            AutoAligns = [aaVertical]
            Offsets.Left = 10
            ShowCaption = False
            Control = btnAllTime
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciLastDay: TdxLayoutItem [3]
            AutoAligns = [aaVertical]
            Caption = 'cxRadioButton1'
            Offsets.Left = 10
            ShowCaption = False
            Control = btnLastDay
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciLastWeek: TdxLayoutItem [4]
            AutoAligns = [aaVertical]
            Caption = 'cxRadioButton2'
            Offsets.Left = 10
            ShowCaption = False
            Control = btnLastWeek
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciPeriod: TdxLayoutItem [5]
            AutoAligns = [aaVertical]
            Caption = 'cxRadioButton3'
            Offsets.Left = 10
            ShowCaption = False
            Control = btnPeriod
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciDateFrom: TdxLayoutItem [6]
            Caption = #1089
            Offsets.Left = 20
            Control = edtDateFrom
            ControlOptions.ShowBorder = False
          end
          object lciDateTo: TdxLayoutItem [7]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1087#1086
            Offsets.Left = 20
            Control = edtDateTo
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 193
        inherited lblSearchCriteriaCaption: TLabel
          Width = 86
          Caption = #1055#1086#1080#1089#1082' '#1089#1086#1073#1099#1090#1080#1081
        end
      end
    end
    inherited pnlGrid: TPanel
      Left = 198
      Width = 388
      Height = 283
      inherited grdData: TcxGrid
        Width = 388
        Height = 283
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsView.BandHeaders = True
          Bands = <
            item
              Caption = #1057#1086#1073#1099#1090#1080#1077
              Options.HoldOwnColumnsOnly = True
              Width = 388
            end
            item
              Caption = #1054#1073#1098#1077#1082#1090'-'#1080#1089#1090#1086#1095#1085#1080#1082
              Options.HoldOwnColumnsOnly = True
              Width = 192
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            HeaderGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3E2E1C49B82B0653CA9
              4F1CA74D1DAD6541C59E8BE4E5E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFDABDA9B15414BE5800C55F00BF5700B95100B34C00A94300A44A1CD9C2
              B7FF00FFFF00FFFF00FFFF00FFFF00FFDBBBA5B85303D46E00D06A00D26700ED
              9729F8B04FDF7500B85100B04A00A34009D8C2B7FF00FFFF00FFFF00FFE2DEDA
              BA5E14D97301D77100D56C00DA9850F4FFFFFFFFFFFFFAE1D76C00BD5700B14B
              00A44A1CE4E5E5FF00FFFF00FFC89673D97E1BDD7600DC7600DC7400CA8449EC
              F9FFF5FFFFFEEED5D96D00C86200BA5400AA4400C59D8AFF00FFFF00FFC1702F
              E99124E27C00E27C00E37C00DA6D00CA6C10D68530D86A00D16900CD6700C862
              00B54F00AF6640FF00FFFF00FFC56A17ED992AE88100E98300E88100F49716FF
              D894FFD58FFFC764DB7100D16B00CE6800BC5700A94E1BFF00FFFF00FFCA6B16
              F6A73CEF8800EF8900EE8700EB9528FBFFFFFFFFFFFFE7B9DD7100D56F00D16B
              00C35D00AB511AFF00FFFF00FFC8752AFCBA5AF58F00F79000F78F00E28D25F4
              FCFFFDFFFFFFE2B2E17500D77100D26C00C86200B2673BFF00FFFF00FFCE966A
              F6AD4AFEAA2CFD9600FE9600DA8423EAF2FBEFF2F7F5D6A9E27600DA7400D56F
              00C25C00C79C81FF00FFFF00FFE2DBD2D3781CFFC662FFA213FF9800CF7A26DF
              EEFEE3EFFBE4CBACE17600DC7600D97200B35613E2E2E0FF00FFFF00FFFF00FF
              E2B795DE8522FFC561FFAD26D97000CD6E0FD5760FDA790BE37B00E07900BC59
              03DDBDA8FF00FFFF00FFFF00FFFF00FFFF00FFE1B795D47A1CFAB249FFBF4EFD
              A92CF69A19EF9115DE7F0FBE6010DDBDA5FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFE2DBD2CF976ACB792BCC7016CB6E15C5732FCA9973E2DEDAFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 90
          end
          object grdDataDBBandedTableViewMOMENT: TcxGridDBBandedColumn
            Caption = #1052#1086#1084#1077#1085#1090
            DataBinding.FieldName = 'MOMENT'
            Width = 104
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn
            Caption = #1059#1095#1077#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
            DataBinding.FieldName = 'LOGIN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPROGRAM: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
            DataBinding.FieldName = 'PROGRAM'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMACHINE: TcxGridDBBandedColumn
            Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088
            DataBinding.FieldName = 'MACHINE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewUSERNAME: TcxGridDBBandedColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'USERNAME'
            HeaderGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA07B4293713D8768387D
              60347358306A512C8C6B3A826436FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B39363B08F5DECB96DEAB463E0AB5CD09F55C1944FB18748A17B4294713C8F6D
              3AFF00FFFF00FFFF00FFFF00FFFF00FFBA9E72EFC484EEC27FEDBD76ECB96CA6
              8148FF00FF916F3CBC904DAB8346A27C42FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFBFA57CF0C88CEFC585B49566FF00FFFF00FFA47E44D6A458896939FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A881BEA37ABA9E7248
              9BDEFF00FFAB8853A47F45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF009BDA0092D44A9EE10080C80079C3FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00ACE572BDF563B2EE55
              A6E7479BE03A91D90079C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF1FB6E888CBFB80C8FB72BDF563B1ED54A5E6459ADF3A91D90079C3FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF319ECE2699CB1792C880C8FB72
              BEF562B1ED53A5E6459ADF007FC7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF41A6D237A1CF2A9BCC1892C880C8FB71BDF561B0EC52A4E50086CCFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FACD546A8D33AA2D02A9BCC16
              91C70187C2007FBC0076B60070B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF5AB1D853AED649A9D33AA2D0289ACC1390C70086C1007EBB0077B7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5CB2D853AED646A8D335
              A0CF2297CA0E8EC50085C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF59B1D74DABD43FA5D12E9DCD1C94C9FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'OBJECTNAME'
            Width = 146
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREFTYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'REFTYPENAME'
            OnCustomDrawCell = grdDataDBBandedTableViewREFTYPENAMECustomDrawCell
            HeaderGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2EAEDDAE5E9FF00FFFF
              00FFE5ECED9FC6A53A8C3C187B1997C19CFF00FFFF00FFFF00FFFF00FFFF00FF
              D4E3EA75AFCC1577A50976A976AED487C48B1F8820007E00008700078F0C006E
              0068A86BE4EBECFF00FFFF00FF83BDD6087BAE0082B50091C30D84B30064AC00
              8110008F00019701049E0819AC27007200006E0067A26AFF00FFFF00FF2C9AC1
              009BCE00A0D400AADD1B90BA0065AE0594170CA81512AB2618B13230C7520075
              00007600418F43FF00FFFF00FF22A0CE00AFE300B3E609C3F4249BC2006BB212
              9C3720BB3D25BE4A28C25644DE75007700007B00308932FF00FFFF00FF18AADA
              00C2F800C9FD0DE5FF29A0C70070B614A24F32DB6C3FDB7652EB886AFFA30993
              0C007B00208421FF00FFFF00FF0EC2E501F9FF27FFFF36FFFF29E2FF007ABA47
              6A2B8195425FFF9855FF9251F07E53EE7D26B93A128012FF00FFFF00FF31C6DA
              12DCFD00D6FF3D979C9B591CCB4600CC5100BA4100A827007672232CC5431BB5
              2E42BE4C88C88EFF00FFFF00FFE5ECEEB1D7E660BCE2C36607DC6800D56D00D9
              7200BE6118A94000AA3300A33F17DEE9E5FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFE3D2C8DF6F00E17900E07A00E67F00CB7024AD4600A94200B7450FFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1D1C3E78000EC8600ED8700F3
              8B00D47F30B24B00AE4800B44505E6ECEEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFE2CFC0F58C00FD9300FD9400FF9B00DE8D3BB84D00B44E00AB4300E3E4
              E6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3CFBEFFB654FFC776FFCA86FF
              CF95F6BB7FD47F2EBF5C08B34A00E2DEDCFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFE6EAEADCB28BDBA776D8965BD2853DCF803BCE8546CE8E5CD0956FFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            MinWidth = 44
            Options.HorzSizing = False
            Width = 44
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREFTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REFTYPESYSNAME'
            Visible = False
            Hidden = True
            Width = 114
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction [0]
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1089#1086#1073#1099#1090#1080#1081
    end
    inherited actAutoFilter: TAction [1]
    end
    object actOpenObject: TAction [2]
      Category = 'Object'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1098#1077#1082#1090'-'#1080#1089#1090#1086#1095#1085#1080#1082
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1086#1073#1098#1077#1082#1090#1072'-'#1080#1089#1090#1086#1095#1085#1080#1082#1072
      OnExecute = actOpenObjectExecute
      OnUpdate = actOpenObjectUpdate
    end
    inherited actRefresh: TAction [3]
    end
    inherited actChangeMaxRecordCount: TAction [4]
    end
    inherited actSaveToFile: TAction [5]
    end
    inherited actCopySelection: TAction [6]
    end
    inherited actCopyAll: TAction [7]
    end
    inherited actFilterByCell: TAction [8]
    end
    inherited actFilterExcludeCell: TAction [9]
    end
    inherited actClearFilter: TAction [10]
    end
    object actOpenUser: TAction [11]
      Category = 'Object'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = actOpenUserExecute
      OnUpdate = actOpenUserUpdate
    end
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
      'select *'
      '  from fdc_Event_Lst'
      ' where (:Name     is null or upper(NAME) like upper(:Name)) and'
      '       (:DateFrom is null or MOMENT >= :DateFrom) and'
      '       (:DateTo   is null or MOMENT <= :DateTo)'
      ' order by MOMENT desc')
    SourceServerObject = 'FDC_EVENT_LST'
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
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateTo'
        ParamType = ptUnknown
      end>
    inherited dsDataSHORTNAME: TStringField
      Size = 0
    end
    inherited dsDataSYSNAME: TStringField
      Size = 0
    end
    object dsDataOBJECT_ID: TFloatField [7]
      FieldName = 'OBJECT_ID'
    end
    object dsDataMOMENT: TDateTimeField [8]
      FieldName = 'MOMENT'
    end
    object dsDataLOGIN: TStringField [9]
      FieldName = 'LOGIN'
      Size = 1500
    end
    object dsDataPROGRAM: TStringField [10]
      FieldName = 'PROGRAM'
      Size = 1500
    end
    object dsDataMACHINE: TStringField [11]
      FieldName = 'MACHINE'
      Size = 1500
    end
    object dsDataUSER_ID: TFloatField [12]
      FieldName = 'USER_ID'
    end
    object dsDataUSERNAME: TStringField [13]
      FieldName = 'USERNAME'
      Size = 1500
    end
    object dsDataOBJECTNAME: TStringField [14]
      FieldName = 'OBJECTNAME'
      Size = 1500
    end
    object dsDataOBJECTTYPEID: TFloatField [15]
      FieldName = 'OBJECTTYPEID'
    end
    object dsDataREFTYPENAME: TStringField [16]
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField [17]
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
  end
end
