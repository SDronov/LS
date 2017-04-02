object dmTransfer: TdmTransfer
  OldCreateOrder = False
  Left = 549
  Top = 256
  Height = 270
  Width = 334
  object dsOra: TOracleDataSet
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 152
    Top = 32
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = connMain
    Left = 88
    Top = 32
  end
  object connMain: TSQLConnection
    ConnectionName = 'custom'
    LoginPrompt = False
    TableScope = []
    Left = 24
    Top = 32
  end
end
