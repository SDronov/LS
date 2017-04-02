object DM: TDM
  OldCreateOrder = False
  Left = 610
  Top = 199
  Height = 228
  Width = 182
  object qDBF: TOracleQuery
    SQL.Strings = (
      'begin'
      ' :result :='
      '  fdc_load_dbf( pFile      => :Blob_Data'
      '               ,pTableName => :Table_Name'
      '              ,pColMap    => :Column_Map );'
      'end;')
    Session = Session
    Variables.Data = {
      0300000004000000070000003A524553554C540500000000000000000000000A
      0000003A424C4F425F444154417100000000000000000000000B0000003A5441
      424C455F4E414D450500000000000000000000000B0000003A434F4C554D4E5F
      4D4150050000000000000000000000}
    Left = 64
    Top = 8
  end
  object qPO: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  p_document_loader.LoadCustomPays(poReport=> :report, doRaiseCC' +
        'UNQ => 1);'
      'end;')
    Session = Session
    Variables.Data = {0300000001000000070000003A5245504F5254050000000000000000000000}
    Left = 112
    Top = 8
  end
  object Q: TOracleQuery
    Session = Session
    Left = 64
    Top = 64
  end
  object ds: TOracleDataSet
    Variables.Data = {
      03000000050000000C0000003A435553544F4D53434F44450500000000000000
      00000000040000003A494E4E050000000000000000000000040000003A4B5050
      050000000000000000000000060000003A44415445310C000000000000000000
      0000060000003A44415445320C0000000000000000000000}
    Session = Session
    Left = 112
    Top = 64
  end
  object Session: TfdcOracleSession
    TraceException = False
    Left = 16
    Top = 8
  end
  object qSes: TOracleQuery
    Session = Session
    Left = 40
    Top = 112
  end
end
