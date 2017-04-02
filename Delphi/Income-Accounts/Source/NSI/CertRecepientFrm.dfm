inherited CertRecepientForm: TCertRecepientForm
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 145
          Top = 117
          TabOrder = 4
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 145
          Top = 144
          TabOrder = 5
          Height = 115
          Width = 185
        end
        object editCustoms: TfdcObjectLinkEdit [2]
          Left = 145
          Top = 9
          DataBinding.DataField = 'CUSTOM_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CUSTOMS_ID'
          DataBinding.TypeSysName = 'Customs'
          DataBinding.SearchFormClass = 'TTargetCustomsGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 0
          Width = 410
        end
        object editSoft: TfdcObjectLinkEdit [3]
          Left = 145
          Top = 36
          DataBinding.DataField = 'SOFTNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SOFT_ID'
          DataBinding.TypeSysName = 'Dict.SoftCode'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 410
        end
        object editCertSubject: TcxDBTextEdit [4]
          Left = 145
          Top = 63
          DataBinding.DataField = 'CERT_SUBJECT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 332
        end
        object editis_active: TcxDBCheckBox [5]
          Left = 145
          Top = 90
          DataBinding.DataField = 'IS_ACTIVE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciCustoms: TdxLayoutItem [0]
            Tag = 13
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
            CaptionOptions.AlignHorz = taRightJustify
            Control = editCustoms
            ControlOptions.ShowBorder = False
          end
          object lcisoft: TdxLayoutItem [1]
            Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = editSoft
            ControlOptions.ShowBorder = False
          end
          object lciCertSubject: TdxLayoutItem [2]
            Caption = #1057#1091#1073#1098#1077#1082#1090' '#1074' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = editCertSubject
            ControlOptions.ShowBorder = False
          end
          object lciis_active: TdxLayoutItem [3]
            Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100' '#1079#1072#1087#1080#1089#1080
            CaptionOptions.AlignHorz = taRightJustify
            Control = editis_active
            ControlOptions.ShowBorder = False
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
        FloatClientHeight = 50
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
      'select *'
      '  from fdc_cert_recepient_lst'
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
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataSOFT_ID: TFloatField
      FieldName = 'SOFT_ID'
    end
    object dsDataCERT_SUBJECT: TStringField
      FieldName = 'CERT_SUBJECT'
      Size = 255
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataSOFTNAME: TStringField
      FieldName = 'SOFTNAME'
      Size = 1500
    end
    object dsDataSOFTCODE: TStringField
      FieldName = 'SOFTCODE'
      Size = 1500
    end
    object dsDataCUSTOM_NAME: TStringField
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_cert_recepient.add'
      '    ('
      '      pcustoms_id    => :customs_id'
      '     ,psoft_id      => :soft_id'
      '     ,pcert_subject => :cert_subject'
      '     ,pis_active    => :is_active'
      '     ,pname         => :name'
      '     ,pdescript     => :descript'
      '    );'
      'end;')
    SourceServerObject = 'p_cert_recepient.add'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'customs_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'soft_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cert_subject'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
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
      '  p_cert_recepient.modify'
      '    ('
      '      pobjid => :id'
      '     ,psoft_id      => :soft_id'
      '     ,pcert_subject => :cert_subject'
      '     ,pis_active    => :is_active'
      '     ,pname         => :name'
      '     ,pdescript     => :descript'
      '    );'
      'end;')
    SourceServerObject = 'p_cert_recepient.modify'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'soft_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cert_subject'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
