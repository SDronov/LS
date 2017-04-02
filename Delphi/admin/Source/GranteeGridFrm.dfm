inherited GranteeGridForm: TGranteeGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1080' '#1075#1088#1091#1087#1087
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Grantee_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      ' order by Type_Order, Name')
    SourceServerObject = 'FDC_GRANTEE_LST'
    object dsDataTYPE_ORDER: TFloatField
      FieldName = 'TYPE_ORDER'
    end
  end
end
