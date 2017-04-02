inherited SubjectGridForm: TSubjectGridForm
  Width = 729
  HelpContext = 32
  Caption = #1057#1091#1073#1098#1077#1082#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 713
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 410
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 410
      end
      inherited pnlProgress: TPanel
        Width = 410
        inherited lblProgress: TcxLabel
          Width = 410
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 620
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 713
  end
  inherited pnlWorkspace: TPanel
    Width = 713
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 4
        end
        object edtINN: TcxTextEdit [2]
          Left = 9
          Top = 63
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 122
        end
        object edtOKPO: TcxTextEdit [3]
          Left = 9
          Top = 102
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 122
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 3
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            CaptionOptions.Layout = clTop
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            CaptionOptions.Layout = clTop
            Control = edtOKPO
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 508
      inherited grdData: TcxGrid
        Width = 508
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.KeyFieldNames = 'ID'
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 160
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ADDRESS'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 122
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Width = 114
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FULL_NAME'
            Width = 269
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        SourceParamName = 'GL_SUBJECT_ID'
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Subject_Lst s'
      ' where  rownum <= :MaxRecordCount'
      '/*$p#name#*/and (upper(s.name) like upper(:NAME))'
      '/*$p#inn#*/ and (s.inn         like :INN)'
      '/*$p#kpp#*/ and (s.kpp         like :KPP)'
      '--$s#viewmode#0*/ and (    s.id <> :ID'
      '--$s#viewmode#0*/       and s.parent_id is null'
      
        '--$s#viewmode#0*/       and not exists (select 1 from fdc_Subjec' +
        't_Lst'
      '--$s#viewmode#0*/                       where parent_id = s.id))')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
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
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataFULL_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataOGRN: TStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      DisplayLabel = #1057#1054#1040#1058#1054
      FieldName = 'SOATO'
      Size = 8
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Size = 30
    end
    object dsDataFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      DisplayLabel = #1058#1077#1083#1077#1082#1089
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      DisplayLabel = #1058#1077#1083#1077#1075#1088#1072#1092
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1090#1072#1081#1087
      FieldName = 'TELETYPE'
      Size = 100
    end
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 104
    Top = 208
    object sqlUpdateParent: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_ParentId  number;'
        '  lv_Pr        varchar2(1);'
        'begin'
        '  if :pId <> -1 and :pParentId is not null Then'
        '  '
        '  if fdc_object_get_typesysname(:pParentId) = '#39'Declarant'#39' then'
        
          '     select nvl(resident,'#39'Y'#39') into lv_Pr from fdc_declarant wher' +
          'e id = :pParentId;'
        
          '  if lv_Pr = '#39'N'#39' and fdc_object_get_typesysname(:pId) = '#39'Persona' +
          'lAccount'#39' '
        '  then'
        
          '    fdc_util.Abort('#39#1053#1077#1088#1077#1079#1080#1076#1077#1085#1090' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1088#1080#1077#1084#1085#1080#1082#1086#1084' '#1076#1083#1103' '#1088#1077#1079#1080 +
          #1076#1077#1085#1090#1072'!!!'#39');'
        '  end if;'
        
          '  if lv_Pr = '#39'Y'#39' and fdc_object_get_typesysname(:pId) <> '#39'Person' +
          'alAccount'#39' '
        '  then'
        
          '    fdc_util.Abort('#39#1056#1077#1079#1080#1076#1077#1085#1090' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1088#1080#1077#1084#1085#1080#1082#1086#1084' '#1076#1083#1103' '#1086#1073#1097#1077#1075#1086 +
          ' '#1089#1095#1077#1090#1072' '#1085#1077#1088#1077#1079#1080#1076#1077#1085#1090#1086#1074'!!!'#39');'
        '  end if;'
        '  end if;   '
        ''
        '  if fdc_object_get_typesysname(:pParentId) = '#39'Person'#39' then'
        
          '     select nvl(private_owner,'#39'N'#39') into lv_Pr from fdc_person  w' +
          'here id = :pParentId;'
        
          '     if lv_Pr = '#39'N'#39' and fdc_object_get_typesysname(:pId) = '#39'Pers' +
          'onalAccount'#39' '
        '     then'
        
          '          fdc_util.Abort('#39#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1088#1080#1077#1084#1085#1080#1082 +
          #1086#1084' '#1076#1083#1103' '#1048#1055'!!!'#39');'
        '     end if;'
        
          '     if lv_Pr = '#39'Y'#39' and fdc_object_get_typesysname(:pId) <> '#39'Per' +
          'sonalAccount'#39' '
        '     then'
        
          '          fdc_util.Abort('#39#1048#1055' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1088#1080#1077#1084#1085#1080#1082#1086#1084' '#1076#1083#1103' '#1086#1073#1097#1077#1075#1086 +
          ' '#1089#1095#1077#1090#1072' '#1092#1080#1079'. '#1083#1080#1094'.!!!'#39');'
        '     end if;'
        '  end if;   '
        '  '
        '  '
        '  begin'
        
          '    select id  into lv_ParentId from FDC_PERSONAL_ACCOUNT where ' +
          'subject_id = :pParentId;'
        '  exception'
        '    when no_data_found then'
        '       lv_ParentId := null;  '
        '  end;  '
        '  '
        '  if lv_ParentId is not null then'
        '  update FDC_PERSONAL_ACCOUNT'
        '   set  parent_id = lv_ParentId'
        '       ,edate = trunc(sysdate)   '
        '  where id = :pId;'
        '  end if;'
        '  end if;'
        ''
        'end;')
    end
  end
end
