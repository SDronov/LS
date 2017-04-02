inherited DictGridExForm: TDictGridExForm
  PixelsPerInch = 96
  TextHeight = 13
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Dict_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and (:sysname is null'
      '    or (:sysname is not null and'
      '       object_type_id in'
      '       (select id'
      '           from Fdc_Object_Type_Lst x'
      '         connect by x.parent_object_type_id = prior x.id'
      '          start with x.sysname = :sysname)))')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sysname'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sysname'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sysname'
        ParamType = ptUnknown
      end>
  end
end
