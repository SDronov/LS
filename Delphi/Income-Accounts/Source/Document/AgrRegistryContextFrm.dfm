inherited AgrRegistryContextForm: TAgrRegistryContextForm
  Left = 408
  Top = 346
  Caption = ''
  PixelsPerInch = 120
  TextHeight = 17
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewND: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ND'
            Width = 149
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewND_40: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ND_40'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_TYPE'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewG43: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G43'
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewZ_31: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Z_31'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewZ_VD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Z_VD'
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_RASP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_RASP'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDAT_RASP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_RASP'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewV_PL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'V_PL'
            Width = 40
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKOD_W: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KOD_W'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_PL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_PL'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
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
    Session = MainData.Session
    SQL.Strings = (
      'select '
      ' r3.nd_40'
      ',r2.nd'
      ',trim(r2.g011||'#39' '#39'||r2.g012||'#39' '#39'||r2.g0131) decl_type'
      ',r2.g43'
      ',r2.z_31'
      ',r2.z_vd'
      ',r2.num_rasp'
      ',r2.dat_rasp'
      ',r3.v_pl'
      '--,r3.bud_kod'
      ',r3.kod_w'
      ',r3.sum_pl'
      'from fdc_agreement_registry_lst ar'
      ',dbf_r_sgl2 r2'
      ',dbf_r_sgl3 r3'
      'where ar.id = :id'
      'and r3.kodt = ar.Customs_Code'
      'and r3.num_ree = ar.Decl_No'
      'and r3.dat_ree = ar.Reg_Date'
      'and r3.inn_knp = ar.decl_inn'
      'and r3.kodt = r2.kodt'
      'and r3.num_ree = r2.num_ree'
      'and r3.dat_ree = r2.dat_ree'
      'and r3.inn_knp = r2.inn_knp'
      'and r3.nd = r2.nd')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataND: TStringField
      DisplayLabel = #1043#1058#1044
      FieldName = 'ND'
      Size = 23
    end
    object dsDataND_40: TStringField
      DisplayLabel = #1042#1043#1058#1044
      FieldName = 'ND_40'
      Size = 23
    end
    object dsDataDECL_TYPE: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'DECL_TYPE'
      Size = 9
    end
    object dsDataG43: TStringField
      DisplayLabel = #1050#1086#1088#1088'. '#1087#1083
      FieldName = 'G43'
      Size = 1
    end
    object dsDataZ_31: TIntegerField
      DisplayLabel = #1069#1090#1072#1087
      FieldName = 'Z_31'
    end
    object dsDataZ_VD: TStringField
      DisplayLabel = #1047#1072#1082#1088#1099#1090'.'
      FieldName = 'Z_VD'
      Size = 1
    end
    object dsDataNUM_RASP: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1072#1089#1087'.'
      FieldName = 'NUM_RASP'
      Size = 10
    end
    object dsDataDAT_RASP: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1089#1087'.'
      FieldName = 'DAT_RASP'
    end
    object dsDataV_PL: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'V_PL'
      Size = 2
    end
    object dsDataKOD_W: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'KOD_W'
      Size = 3
    end
    object dsDataSUM_PL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_PL'
      DisplayFormat = ',0.00'
    end
  end
end
