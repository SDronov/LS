object AistDM: TAistDM
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
  object UnZip: TUnZip
    TranslateOemChar = False
    CpuType = cptAuto
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    Left = 168
    Top = 16
  end
  object DBF: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstOuterStream
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 16384
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
    Left = 120
    Top = 16
  end
  object Zip: TZip
    RelativeDir = byItem
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    RecurseDirs = False
    ArcType = atZip
    AttributesEx = []
    CompressMethod = cmDeflate
    DefaultExt = '.zip'
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    StoreFilesOfType.Strings = (
      '.ACE'
      '.ARC'
      '.ARJ'
      '.BH'
      '.CAB'
      '.ENC'
      '.GZ'
      '.HA'
      '.JAR'
      '.LHA'
      '.LZH'
      '.PAK'
      '.PK3'
      '.PK_'
      '.RAR'
      '.TAR'
      '.TGZ'
      '.UUE'
      '.UU'
      '.WAR'
      '.XXE'
      '.Z'
      '.ZIP'
      '.ZOO')
    StoredDirNames = sdNone
    TempDir = 'C:\DOCUME~1\user\LOCALS~1\Temp\'
    Switch = swAdd
    Left = 208
    Top = 16
  end
  object dsDK: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderDK'
    Left = 104
    Top = 72
  end
end
