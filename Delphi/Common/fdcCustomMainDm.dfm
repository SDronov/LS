object fdcCustomMainData: TfdcCustomMainData
  OldCreateOrder = False
  Left = 434
  Top = 273
  Height = 271
  Width = 324
  object Session: TfdcOracleSession
    AfterLogOn = SessionAfterLogOn
    LogonUsername = 'vero2'
    LogonPassword = 'vero2'
    LogonDatabase = 'TATYANA9206.FORS.RU'
    TraceException = False
    Left = 32
    Top = 16
  end
  object StartScript: TOracleScript
    Session = Session
    Lines.Strings = (
      'alter session set NLS_DATE_FORMAT = '#39'%s'#39';'
      'alter session disable PARALLEL QUERY;'
      'alter session set USE_STORED_OUTLINES = OPERATION;'
      'alter session set HASH_JOIN_ENABLED = FALSE;'
      'alter session set CURRENT_SCHEMA = %s;')
    Left = 93
    Top = 16
  end
end