inherited UserGridByRoleForm: TUserGridByRoleForm
  Left = 273
  Top = 256
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1088#1086#1083#1080' '#1076#1086#1089#1090#1091#1087#1072
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 225
        end
        inherited edtLogin: TcxTextEdit
          Width = 149
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Enabled = False
      Visible = False
    end
    inherited actReGrant: TAction
      Enabled = False
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
      27
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_User_Lst'
      ' where login in ('
      '     select grantee'
      '     from dba_role_privs'
      '     where granted_role= :ROLE_NAME'
      ' ) and'
      ' (:Name is null or upper(NAME) like upper(:Name))'
      ' order by Name')
    ParamData = <
      item
        DataType = ftString
        Name = 'ROLE_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
end
