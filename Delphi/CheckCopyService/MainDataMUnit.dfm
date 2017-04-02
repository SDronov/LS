object MainDataM: TMainDataM
  OldCreateOrder = False
  Left = 630
  Top = 270
  Height = 270
  Width = 285
  object Session: TfdcOracleSession
    IsolationLevel = ilReadCommitted
    TraceException = False
    Left = 32
    Top = 16
  end
  object FileDbf: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 96
    Top = 16
  end
  object MainQueryList: TQueryList
    Session = Session
    Left = 40
    Top = 72
    object sqlCheckProvision: TsqlOp
      SQL.Strings = (
        'begin'
        '  :l_result := p_provision.check_summ'
        '    ('
        
          '      pps_sysname       => p_provision.get_ps_sysname(:inn, :kpp' +
          ')'
        '     ,pdelta_check_summ => :delta_check_summ'
        '    );'
        'end;')
    end
    object sqlChange_check_summ: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_provision.change_check_summ'
        '    ('
        
          '      pps_sysname       => p_provision.get_ps_sysname(:inn, :kpp' +
          ')'
        '     ,pdelta_check_summ => :delta_check_summ'
        '    );'
        'end;')
    end
    object sqlCheckLevel: TsqlOp
      SQL.Strings = (
        'begin'
        '  if (p_params.customlevel != p_consts.customlevel_fts) then'
        
          '    raise_application_error(-20001,'#39#1057#1077#1088#1074#1080#1089' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085' '#1090#1086#1083#1100#1082#1086' '#1076 +
          #1083#1103' '#1088#1072#1073#1086#1090#1099' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1060#1058#1057'!'#39');'
        '  end if;'
        'end;')
    end
  end
  object MainIdFTP: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 10
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 112
    Top = 80
  end
end
