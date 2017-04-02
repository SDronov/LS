object BPReport: TBPReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 557
  Top = 462
  Height = 212
  Width = 482
  object xlrKNP: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\LSSVN\Delphi\Bin\report\'#1056#1077#1077#1089#1090#1088'_'#1043#1058#1044'_'#1050#1053#1055'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = mdsRep
        Alias = 'aReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsTotal
        Alias = 'aTotal'
        Range = 'rngTotal'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsTotalKBK
        Alias = 'aTotalKBK'
        Range = 'rngTotalKBK'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    OnBeforeBuild = xlrKNPBeforeBuild
    Left = 28
    Top = 28
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select t.id'
      'from fdc_doc_pack_gtd_knp_lst t'
      'where t.id = :ID')
    Left = 80
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select t.id'
      'from fdc_doc_pack_gtd_knp_lst t'
      'where t.id = :ID')
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsTotal: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select t.id'
      'from fdc_doc_pack_gtd_knp_lst t'
      'where t.id = :ID')
    Left = 232
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsTotalKBK: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select t.id'
      'from fdc_doc_pack_gtd_knp_lst t'
      'where t.id = :ID')
    Left = 296
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsCharges: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select 1'
      'from dual'
      'where rownum = :id')
    Left = 368
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsKBK: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select 1'
      'from dual'
      'where rownum = :id')
    Left = 280
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object mdsRep: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 112
    Top = 104
  end
end
