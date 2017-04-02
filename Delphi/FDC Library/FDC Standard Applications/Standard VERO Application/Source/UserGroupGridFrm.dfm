inherited UserGroupGridForm: TUserGroupGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited pnlSearchCriteriaCaption: TPanel
        inherited lblSearchCriteriaCaption: TLabel
          Width = 71
          Caption = #1055#1086#1080#1089#1082' '#1075#1088#1091#1087#1087
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsSelection.MultiSelect = True
        end
      end
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
      '  from fdc_User_Group_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_USER_GROUP_LST'
  end
end
