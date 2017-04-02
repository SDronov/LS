inherited ProvisionPSGridForm: TProvisionPSGridForm
  Caption = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1089#1080#1089#1090#1077#1084
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          object grdDataDBBandedTableViewPS_NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1078#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
            DataBinding.FieldName = 'PS_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPROVISION_SUMM: TcxGridDBBandedColumn
            Caption = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'PROVISION_SUMM'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPROVISION_UPDATE: TcxGridDBBandedColumn
            Caption = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1076#1072#1090#1072
            DataBinding.FieldName = 'PROVISION_UPDATE'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHECK_SUMM: TcxGridDBBandedColumn
            Caption = #1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080' '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'CHECK_SUMM'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHECK_UPDATE: TcxGridDBBandedColumn
            Caption = #1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080' '#1076#1072#1090#1072
            DataBinding.FieldName = 'CHECK_UPDATE'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDIFF: TcxGridDBBandedColumn
            Caption = #1055#1088#1077#1074#1099#1096#1077#1085#1080#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'DIFF'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchOk: TAction
      Enabled = False
    end
    inherited actSearchCancel: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearch: TAction
      Enabled = False
      Visible = False
    end
    object actShowProvisionStat: TAction
      Category = 'View'
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
      OnExecute = actShowProvisionStatExecute
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
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = btnShowProvisionStat
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
    object btnShowProvisionStat: TdxBarButton
      Action = actShowProvisionStat
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'SELECT ps_sysname'
      '      ,ps_name'
      '      ,provision_summ'
      '      ,provision_update'
      '      ,check_summ'
      '      ,check_update'
      '      ,ps_shortname'
      '      ,ps_inn'
      '      ,ps_kpp'
      '      ,ps_ogrn'
      '      ,case'
      
        '         when (nvl(check_summ,0) - nvl(provision_summ,0)) <= 0 t' +
        'hen 0'
      '         else (nvl(check_summ,0) - nvl(provision_summ,0))'
      '       end diff'
      '  FROM fdc_provision_lst pr')
    object dsDataPS_SYSNAME: TStringField
      FieldName = 'PS_SYSNAME'
      Size = 64
    end
    object dsDataPS_NAME: TStringField
      FieldName = 'PS_NAME'
      Size = 255
    end
    object dsDataPROVISION_SUMM: TFloatField
      FieldName = 'PROVISION_SUMM'
      DisplayFormat = ',0.00'
    end
    object dsDataPROVISION_UPDATE: TDateTimeField
      FieldName = 'PROVISION_UPDATE'
    end
    object dsDataCHECK_SUMM: TFloatField
      FieldName = 'CHECK_SUMM'
      DisplayFormat = ',0.00'
    end
    object dsDataCHECK_UPDATE: TDateTimeField
      FieldName = 'CHECK_UPDATE'
    end
    object dsDataPS_SHORTNAME: TStringField
      FieldName = 'PS_SHORTNAME'
      Size = 255
    end
    object dsDataPS_INN: TStringField
      FieldName = 'PS_INN'
      Size = 15
    end
    object dsDataPS_KPP: TStringField
      FieldName = 'PS_KPP'
      Size = 9
    end
    object dsDataPS_OGRN: TStringField
      FieldName = 'PS_OGRN'
      Size = 15
    end
    object dsDataDIFF: TFloatField
      FieldName = 'DIFF'
      DisplayFormat = ',0.00'
    end
  end
end
