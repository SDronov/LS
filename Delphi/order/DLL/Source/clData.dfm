object LocalDM: TLocalDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 304
  Top = 349
  Height = 256
  Width = 311
  object dsOtvet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 40
    Top = 72
  end
  object dsData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 40
    Top = 120
  end
  object dsDK: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderDK'
    Left = 104
    Top = 72
  end
end
