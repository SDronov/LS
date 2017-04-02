inherited TaskGridForm: TTaskGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1076#1072#1095
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Task_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_TASK_LST'
  end
end
