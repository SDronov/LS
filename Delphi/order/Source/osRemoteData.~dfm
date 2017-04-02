object RemoteDM: TRemoteDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 919
  Top = 369
  Height = 285
  Width = 192
  object OracleSession: TOracleSession
    DesignConnection = True
    LogonUsername = 'tula_270_4'
    LogonPassword = 'w'
    LogonDatabase = 'ORCL'
    ThreadSafe = True
    Preferences.MaxStringFieldSize = 255
    NullValue = nvNull
    Left = 40
    Top = 16
  end
  object QueryList1: TQueryList
    Session = OracleSession
    Left = 40
    Top = 72
    object sqlInsert: TsqlOp
    end
    object sqlBeginLoad: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_loader.beginload;'
        'end;')
    end
    object sqlCreateAns: TsqlOp
    end
  end
  object qryQuery: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_order_query('
      '      pKey     => :Key'
      '     ,pInData  => :InData'
      '     ,pOutData => :OutData'
      '    );'
      'end;')
    Session = OracleSession
    ReadBuffer = 50
    Variables.Data = {
      0300000003000000040000003A4B455905000000000000000000000008000000
      3A4F555444415441700000000000000000000000070000003A494E4441544170
      0000000000000000000000}
    Left = 112
    Top = 72
  end
end
