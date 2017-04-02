inherited StateTransitGridBySchemeForm: TStateTransitGridBySchemeForm
  Left = 329
  Top = 233
  Caption = #1055#1077#1088#1077#1093#1086#1076#1099' '#1089#1086#1089#1090#1086#1103#1085#1080#1081' '#1089#1093#1077#1084#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEME_ID
        SourceParamName = 'ID'
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEMENAME
        SourceParamName = 'Name'
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Transit_Lst'
      'where State_Scheme_ID = :ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
