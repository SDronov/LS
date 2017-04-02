object fdcCustomMainData: TfdcCustomMainData
  OldCreateOrder = False
  Left = 495
  Top = 279
  Height = 271
  Width = 324
  object Session: TfdcOracleSession
    AfterLogOn = SessionAfterLogOn
    Cursor = crHourGlass
    DesignConnection = True
    LogonUsername = 'vero2'
    LogonPassword = 'vero2'
    LogonDatabase = 'TATYANA9206.FORS.RU'
    ConnectAs = caNormal
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Preferences.NullLOBIsEmpty = False
    Pooling = spNone
    MTSOptions = [moImplicit, moUniqueServer]
    Connected = True
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    TraceException = False
    Left = 32
    Top = 16
  end
  object StartScript: TOracleScript
    Session = Session
    Debug = False
    Cursor = crDefault
    Lines.Strings = (
      'alter session set NLS_DATE_FORMAT = '#39'%s'#39';'
      'alter session disable PARALLEL QUERY;'
      'alter session set USE_STORED_OUTLINES = OPERATION;'
      'alter session set HASH_JOIN_ENABLED = FALSE;'
      'alter session set CURRENT_SCHEMA = %s;')
    AutoCommit = False
    ExitOnError = False
    OutputOptions = [ooSQL, ooNonSQL, ooData, ooFeedback, ooError]
    Left = 93
    Top = 16
  end
end
