inherited ActCorrectOperBalansForm: TActCorrectOperBalansForm
  ActiveControl = edtName
  Caption = 'ActCorrectOperBalansForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      Caption = #1040#1082#1090' '#1086' '#1074#1085#1077#1089#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1074' '#1054#1041
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 582
        end
        inherited edtDescript: TcxDBMemo
          Top = 313
          TabOrder = 10
          Height = 99
          Width = 582
        end
        object edtSignDate: TcxDBDateEdit [2]
          Left = 184
          Top = 273
          DataBinding.DataField = 'SIGN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 783
        end
        object edtSignBy: TcxDBTextEdit [3]
          Left = 184
          Top = 246
          DataBinding.DataField = 'SIGNED_BY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 783
        end
        object editDocDateCreated: TcxDBDateEdit [4]
          Left = 184
          Top = 121
          DataBinding.DataField = 'DATE_CREATED'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 630
        end
        object cbTypeBalans: TcxComboBox [5]
          Left = 184
          Top = 148
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1055#1086' '#1089#1091#1073#1089#1095#1077#1090#1091' '#1058#1054)
          Properties.OnChange = cbTypeBalansPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Text = #1055#1086' '#1089#1091#1073#1089#1095#1077#1090#1091' '#1058#1054
          Width = 745
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 184
          Properties.OnChange = Modify
        end
        inherited edtDocDate: TcxDBDateEdit
          Top = 94
          Properties.OnChange = Modify
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 175
          Style.IsFontAssigned = True
          TabOrder = 5
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 175
          Style.IsFontAssigned = True
          TabOrder = 6
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = 175
          Style.IsFontAssigned = True
          TabOrder = 7
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentNumDate: TdxLayoutGroup
              LayoutDirection = ldVertical
              inherited lciDocNumber: TdxLayoutItem
                Tag = 31
              end
              inherited lciDocDate: TdxLayoutItem
                Tag = 13
              end
              object lcgDopDocAttr: TdxLayoutGroup
                CaptionOptions.ShowAccelChar = False
                ShowCaption = False
                ShowBorder = False
                object lciDocDateCreated: TdxLayoutItem
                  Tag = 23
                  Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                  Control = editDocDateCreated
                  ControlOptions.ShowBorder = False
                end
                object lciTypeBalans: TdxLayoutItem
                  Tag = 13
                  Caption = #1058#1080#1087' '#1073#1072#1083#1072#1085#1089#1072
                  Control = cbTypeBalans
                  ControlOptions.ShowBorder = False
                end
              end
            end
            inherited lcgDocumentAttrs: TdxLayoutGroup
              Visible = False
            end
          end
          object lcgSign: TdxLayoutGroup [2]
            Caption = #1055#1086#1076#1087#1080#1089#1100
            object lciSignBy: TdxLayoutItem
              Tag = 33
              Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
              Control = edtSignBy
              ControlOptions.ShowBorder = False
            end
            object lciSignDate: TdxLayoutItem
              Tag = 31
              Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
              Control = edtSignDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = True
          end
        end
      end
    end
    object tabTrans: TcxTabSheet [1]
      Caption = #1055#1088#1086#1090#1086#1090#1080#1087#1099' '#1087#1088#1086#1074#1086#1076#1086#1082
      OnShow = tabTransShow
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090
    end
    inherited actPrint: TAction
      Enabled = False
      Visible = False
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
        FloatClientWidth = 103
        FloatClientHeight = 78
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
            Item = btnPrint
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
      'select *'
      '  from fdc_actcorrectoperbalans_lst'
      ' where ID = :ID')
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataBALANS_TYPE: TIntegerField
      FieldName = 'BALANS_TYPE'
    end
    object dsDataBALANS_TYPE_TEXT: TStringField
      FieldName = 'BALANS_TYPE_TEXT'
      Size = 23
    end
    object dsDataDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsDataSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_actcorrectoperbalans.add'
      '   ('
      '     pdocnumber => :doc_number'
      '    ,pdocdate => :doc_date '
      '    ,pbalans_type => :balans_type'
      '    ,pdescript => :descript'
      '   );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'balans_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_actcorrectoperbalans.modify '
      '    ('
      '      pdocid          => :id,'
      '      pdocnumber => :doc_number,'
      '      pdocdate      => :doc_date,'
      '      psign_date   => :sign_date,'
      '      pdescript      => :descript'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'sign_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      
        '       ) and TR_ACCESS_LEVEL = 1 and fdc_check_sql_condition(CON' +
        'DITION) = 1'
      
        '  and sysname not in ('#39'StateTransit.ActCorrectOperBalans.Create-' +
        '>Signed'#39','#39'StateTransit.ActCorrectOperBalans.Signed->Create'#39')')
  end
end
