inherited NoDeclarantFoundErrorForm: TNoDeclarantFoundErrorForm
  Left = 306
  Top = 313
  Width = 578
  Height = 422
  Caption = 'NoDeclarantFoundErrorForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 562
    Height = 384
    ClientRectBottom = 360
    ClientRectRight = 562
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Width = 556
        Height = 354
        inherited edtDescript: TcxDBMemo
          Top = 326
          DataBinding.DataField = 'NAME'
          Height = 19
          Width = 362
        end
        object edtINN: TcxDBTextEdit [2]
          Left = 60
          Top = 34
          DataBinding.DataField = 'G141'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 302
        end
        object edtKPP: TcxDBTextEdit [3]
          Left = 60
          Top = 59
          DataBinding.DataField = 'G147'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 302
        end
        object edtDeclName: TcxDBTextEdit [4]
          Left = 60
          Top = 84
          DataBinding.DataField = 'G142'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 302
        end
        object Panel1: TPanel [5]
          Left = 9
          Top = 134
          Width = 142
          Height = 32
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 6
        end
        object cxButton1: TcxButton [6]
          Left = 445
          Top = 109
          Width = 102
          Height = 19
          Caption = #1057#1086#1079#1076#1072#1090#1100'...'
          TabOrder = 5
          OnClick = cxButton1Click
          LookAndFeel.Kind = lfStandard
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AlignVert = avBottom
            Visible = False
          end
          object lcGeneralItem1: TdxLayoutItem
            Caption = #1048#1053#1053
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem
            Caption = #1050#1055#1055
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtDeclName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Caption = 'cxButton1'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = cxButton1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem5: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = 'Panel1'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = Panel1
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 562
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 354
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 357
        Width = 562
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 559
        Top = 3
        Height = 354
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 562
        Height = 360
        ClientRectBottom = 336
        ClientRectRight = 562
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 127
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = False
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.* '
      ' ,CASE :DeclCol'
      #9' WHEN '#39'9'#39' THEN'
      #9#9'TRIM(d.g091)'
      #9#9'ELSE'
      #9#9'TRIM(d.g141)'
      #9'END g141     '
      ' ,CASE :DeclCol'
      #9' WHEN '#39'9'#39' THEN'
      #9#9'TRIM(d.g097)'
      #9' ELSE'
      #9#9'TRIM(d.g147)'
      #9'END g147'
      ' ,CASE :DeclCol'
      #9' WHEN '#39'9'#39' THEN'
      #9#9'TRIM(d.g092)'
      #9' ELSE'
      #9#9'TRIM(d.g142)'
      #9'END g142'
      ',to_number(null) subj_id, x.name subj_name'
      
        '  from fdc_Custom_decl_Error_lst t, dbf_dclhead d, fdc_Subject_l' +
        'st x,fdc_custom_decl_lst o'
      '  where t.id = :ID'
      '  and d.id = t.sysname '
      'and x.id(+)=-t.id'
      'and t.OWNER_OBJECT_ID = o.id'
      'union'
      'select t.*, '
      'u.inn, u.kpp, u.name'
      ',to_number(null) subj_id, x.name subj_name'
      
        'from fdc_Custom_decl_Error_lst t,dbf_tpo dd, dbf_tpo_okpo u,fdc_' +
        'Subject_lst x,fdc_object_LST o'
      'where t.id = :ID '
      'and dd.id(+) = t.SYSNAME'
      'and x.id(+)=-t.id'
      
        'and u.cod(+) || u.inn(+) || u.kodtam(+) = rtrim(ltrim(dd.idpayer' +
        '))'
      'and t.OWNER_OBJECT_ID = o.id'
      'and o.typesysname in ('#39'TPO'#39','#39'TR'#39')')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DeclCol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DeclCol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DeclCol'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataG147: TStringField
      FieldName = 'G147'
      Size = 12
    end
    object dsDataG141: TStringField
      FieldName = 'G141'
      Size = 15
    end
    object dsDataG142: TStringField
      FieldName = 'G142'
      Size = 80
    end
    object dsDataSUBJ_ID: TFloatField
      FieldName = 'SUBJ_ID'
    end
    object dsDataSUBJ_NAME: TStringField
      FieldName = 'SUBJ_NAME'
      Size = 4000
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_object_free(:id);'
      '  p_doc_charge.setdeclarant(pid => :decl_id,'
      '                             psubjectid => :subj_id);'
      '  -- '#1087#1088#1086#1074#1077#1076#1077#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1086' '#1058#1055#1054
      
        '  for ch in (select c.id from fdc_decl_charge c,fdc_document_lst' +
        ' d'
      '             where c.decl_id = :decl_id'
      '               and c.id      = d.id'
      '               and d.is_active <> '#39'Y'#39
      '               and fdc_object_get_typesysname(:decl_id) = '#39'TPO'#39
      '               )'
      '  loop'
      '     p_document.DoActivate(pDocID => ch.id);'
      '  end loop;'
      '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      '  p_document.DoActivateBuffer;'
      'end;')
    BeforeOpen = dsUpdateBeforeOpen
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end>
  end
end
