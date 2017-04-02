inherited DictGridByObjectForm: TDictGridByObjectForm
  Left = 288
  Top = 194
  Caption = #1055#1086#1079#1080#1094#1080#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091
  PixelsPerInch = 96
  TextHeight = 13
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
      '  from fdc_Dict_Lst'
      ' where Owner_Object_ID = :ID and'
      '           (:Name is null or upper(NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
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
