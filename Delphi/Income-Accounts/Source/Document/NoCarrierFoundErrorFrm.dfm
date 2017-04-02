inherited NoCarrierFoundErrorForm: TNoCarrierFoundErrorForm
  Height = 577
  Caption = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 539
    ClientRectBottom = 515
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 484
        inherited edtName: TcxDBTextEdit
          Top = 81
          TabOrder = 3
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 454
          TabOrder = 6
          Height = 21
          Width = 185
        end
        object pnlGrid: TPanel [2]
          Left = 9
          Top = 130
          Width = 353
          Height = 260
          Align = alClient
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 5
        end
        object edtKPP: TcxDBTextEdit [3]
          Left = 60
          Top = 57
          DataBinding.DataField = 'G147'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 92
        end
        object edtINN: TcxDBTextEdit [4]
          Left = 60
          Top = 33
          DataBinding.DataField = 'G141'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 92
        end
        object edtCarrierName: TcxDBTextEdit [5]
          Left = 60
          Top = 9
          DataBinding.DataField = 'G142'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 92
        end
        object btnCreate: TcxButton [6]
          Left = 393
          Top = 105
          Width = 76
          Height = 19
          Action = actCreate
          TabOrder = 4
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem4: TdxLayoutItem [0]
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCarrierName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            Visible = False
          end
          object lcGeneralItem5: TdxLayoutItem [4]
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Caption = 'cxButton1'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = btnCreate
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem1: TdxLayoutItem [5]
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = 'Panel1'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = pnlGrid
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AlignVert = avBottom
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 484
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 512
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 484
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 515
        ClientRectBottom = 491
      end
    end
  end
  inherited ActionList: TActionList
    object actCreate: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnExecute = actCreateExecute
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
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
        FloatLeft = 329
        FloatTop = 191
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
        Visible = True
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
      '  ,to_number(null) subj_id'
      '  ,x.name subj_name'
      'from '
      '  fdc_Custom_decl_Error_lst t'
      '  ,dbf_dclhead d'
      '  ,fdc_Subject_lst x'
      '  ,fdc_custom_decl_lst o'
      'where t.id = :ID'
      '  and d.id = t.sysname '
      '  and x.id(+)=-t.id'
      '  and t.OWNER_OBJECT_ID = o.id'
      'union'
      'select '
      '  t.*, '
      '  u.inn'
      '  ,u.kpp'
      '  ,u.name'
      '  ,to_number(null) subj_id'
      '  ,x.name subj_name'
      'from '
      '  fdc_Custom_decl_Error_lst t'
      '  ,dbf_tpo dd'
      '  ,dbf_tpo_okpo u'
      '  ,fdc_Subject_lst x'
      '  ,fdc_object_LST o'
      'where t.id = :ID '
      '  and dd.id(+) = t.SYSNAME'
      '  and x.id(+)=-t.id'
      
        '  and u.cod(+) || u.inn(+) || u.kodtam(+) = rtrim(ltrim(dd.idpay' +
        'er2))'
      '  and t.OWNER_OBJECT_ID = o.id'
      '  and o.typesysname in ('#39'TPO'#39','#39'TR'#39')')
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
    object dsDataSUBJ_NAME: TStringField
      FieldName = 'SUBJ_NAME'
      Size = 1500
    end
    object dsDataG141: TStringField
      FieldName = 'G141'
      Size = 12
    end
    object dsDataG147: TStringField
      FieldName = 'G147'
      Size = 9
    end
    object dsDataG142: TStringField
      FieldName = 'G142'
      Size = 150
    end
    object dsDataSUBJ_ID: TFloatField
      FieldName = 'SUBJ_ID'
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_object_free(:id);'
      '  p_doc_charge.setcarrier(pid => :decl_id,'
      '                             psubjectid => :subj_id);'
      '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      '  p_document.doactivatebuffer;'
      '  --'
      'end;')
    BeforeOpen = dsUpdateBeforeOpen
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end>
  end
end
