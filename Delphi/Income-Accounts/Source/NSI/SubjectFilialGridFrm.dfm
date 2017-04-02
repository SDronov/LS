inherited SubjectFilialGridForm: TSubjectFilialGridForm
  Left = 359
  Top = 132
  Caption = 'SubjectFilialGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 122
        end
        inherited edtOKPO: TcxTextEdit
          Width = 122
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
      'select *'
      '  from fdc_subject_lst'
      'where rownum <= :MaxRecordCount'
      '/*$p#name#*/ and upper(NAME) like upper(:NAME)'
      '/*$p#inn#*/ and inn        LIKE :INN'
      '/*$p#kpp#*/ and kpp        LIKE :KPP'
      '--$s#viewmode#0*/  and id in (SELECT t.id'
      '--$s#viewmode#0*/              FROM fdc_subject_lst t'
      '--$s#viewmode#0*/              WHERE parent_id = :ID)'
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
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
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited QueryList: TQueryList
    Left = 256
    Top = 160
    inherited sqlUpdateParent: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_ExistsParent NUMBER := 0;'
        'begin'
        '  select count(*)'
        '    into lv_ExistsParent '
        '    from fdc_subject s'
        '   where s.parent_id = :pId'
        '         and s.parent_id is not null;'
        '  IF lv_ExistsParent != 0 THEN'
        
          '    fdc_util.Abort('#39'<<'#1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1088#1077#1097#1077#1085#1086'! '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1091#1082#1072#1079#1072#1085#1085#1072 +
          #1103' '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1092#1080#1083#1080#1072#1083#1072' '#1080#1084#1077#1077#1090' '#1089#1074#1086#1080' '#1092#1080#1083#1080#1072#1083#1099'.>>'#39');'
        '  ELSE'
        '    select count(*)'
        '      into lv_ExistsParent '
        '      from fdc_subject s'
        '     where s.id = :pParentId'
        '           and s.parent_id is not null;'
        '    IF lv_ExistsParent != 0 THEN'
        
          '      fdc_util.Abort('#39'<<'#1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1088#1077#1097#1077#1085#1086'! '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1091#1082#1072#1079#1072#1085 +
          #1085#1072#1103' '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1075#1086#1083#1086#1074#1085#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1089#1072#1084#1072' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1092#1080#1083#1080#1072#1083#1086#1084'.>>'#39');'
        '    ELSE'
        '      select count(*)'
        '        into lv_ExistsParent '
        '        from fdc_subject s, fdc_subject p'
        '       where s.id = :pId'
        '             and p.id = :pParentId'
        '             and s.INN = p.INN;'
        '      IF lv_ExistsParent = 0 THEN'
        
          '        fdc_util.Abort('#39'<<'#1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1088#1077#1097#1077#1085#1086'! '#1059' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1091#1082 +
          #1072#1079#1072#1085#1085#1086#1081' '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1092#1080#1083#1080#1072#1083#1072' '#1048#1053#1053' '#1085#1077' '#1089#1086#1074#1087#1072#1076#1072#1077#1090' '#1089' '#1048#1053#1053' '#1075#1086#1083#1086#1074#1085#1086#1081' '#1086#1088#1075#1072#1085 +
          #1080#1079#1072#1094#1080#1080'.>>'#39');'
        '      ELSE '
        '        update FDC_SUBJECT'
        '           set parent_id = :pParentId'
        '         where id = :pId;'
        '      END IF;'
        '    END IF;'
        '  END IF;'
        ''
        'end;')
    end
    object sqlRemoveParent: TsqlOp
      SQL.Strings = (
        'begin'
        ''
        '  update FDC_SUBJECT'
        '   set parent_id = null'
        '  where id = :pId;'
        ''
        ''
        'end;')
    end
  end
end
