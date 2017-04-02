object dmFileService: TdmFileService
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 228
  Top = 289
  Height = 346
  Width = 542
  object ZipTV: TZipTV
    TranslateOemChar = False
    FileSpec.Strings = (
      '*.xml')
    RecurseDirs = True
    Left = 24
    Top = 14
  end
  object UnLha: TUnLha
    CpuType = cptAuto
    CreateStoredDirs = True
    FileSpec.Strings = (
      '*.xml')
    Left = 61
    Top = 18
  end
end
