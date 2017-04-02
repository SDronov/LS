inherited PersonalAccountFindGridForm: TPersonalAccountFindGridForm
  Caption = #1042#1099#1073#1086#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 115
        end
        inherited edtKPP: TcxTextEdit
          Width = 115
        end
      end
    end
  end
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select -1 id,'#39#1053#1086#1074#1099#1081' '#1089#1095#1077#1090#39' as name,null shortname,'
      
        '        fdc_object_type_get_bysysname(:TYPESYSNAME) as object_ty' +
        'pe_id,'
      
        '        null state_id,2 as accesslevel,null as sysname,null as d' +
        'escript,null as owner_object_id,'#39#1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090#39' as typename,'#39'Pers' +
        'onalAccount'#39' as typesysname,null objectkindlist,trunc(sysdate) s' +
        'date,null edate,null as subject_id,null as parent_id,null as sub' +
        'ject_name,null inn,null kpp from dual'
      'union all'
      'select t.*'
      '  from fdc_personal_account_lst t'
      'where '
      
        '   (t.TypeSysName = '#39'PersonalAccountNonResident'#39' and :TYPESYSNAM' +
        'E = '#39'Declarant'#39')'
      
        ' or(t.TypeSysName = '#39'PersonalAccountPhysical'#39' and :TYPESYSNAME =' +
        ' '#39'Person'#39')'
      'union all'
      'select t.*'
      '  from fdc_personal_account_lst t,'
      '       fdc_subject_lst s '
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))'
      '--$s#viewmode#1*/ and t.parent_id is null'
      'and (:id is null or t.id <> :id)'
      '/*$p#inn#*/ and (t.inn        LIKE :INN)'
      '/*$p#kpp#*/ and (t.kpp        LIKE :KPP)'
      'and t.subject_id = s.id'
      'and s.TypeSysName = :TYPESYSNAME')
    ParamData = <
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
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
        DataType = ftDateTime
        Name = 'dat'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end>
  end
end
