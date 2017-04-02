inherited CorrectPOCustomCodeForm: TCorrectPOCustomCodeForm
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1086#1074#1090#1086#1088#1085#1086#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Top = 385
          TabOrder = 10
          Height = 20
          Width = 655
        end
        object editDocBase: TcxDBTextEdit [2]
          Left = 112
          Top = 192
          DataBinding.DataField = 'DOC_SOURCE_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 694
        end
        object editReasonCorrect: TcxDBMemo [3]
          Left = 112
          Top = 263
          DataBinding.DataField = 'REASON_CORRECT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.ScrollBars = ssVertical
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Height = 103
          Width = 694
        end
        object editCustomcodeOld: TcxDBLookupComboBox [4]
          Left = 60
          Top = 134
          DataBinding.DataField = 'CUSTOMCODE_OLD_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownWidth = 420
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Fixed = True
              Width = 120
              FieldName = 'CUSTOMS_CODE_8'
            end
            item
              Fixed = True
              Width = 300
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCustoms
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 250
        end
        object editCustomcodeNew: TcxDBLookupComboBox [5]
          Left = 399
          Top = 134
          DataBinding.DataField = 'CUSTOMCODE_NEW_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownWidth = 420
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Fixed = True
              Width = 120
              FieldName = 'CUSTOMS_CODE_8'
            end
            item
              Fixed = True
              Width = 300
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCustoms
          Properties.OnChange = Modify
          Properties.OnCloseUp = editCustomcodeNewPropertiesCloseUp
          Properties.OnInitPopup = editCustomcodeNewPropertiesInitPopup
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 250
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 401
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 596
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocNumber: TdxLayoutItem
                Tag = 13
              end
              inherited lciDocDate: TdxLayoutItem
                Tag = 13
              end
            end
            inherited lcgDocumentAttrs: TdxLayoutGroup
              Visible = False
              inherited lciActivationDate: TdxLayoutItem
                Visible = False
              end
            end
          end
          object lcgCustomsCode: TdxLayoutGroup [2]
            Caption = 'New Group'
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcieditCustomcodeOld: TdxLayoutItem
              Tag = 33
              Caption = #1050#1086#1076' '#1058#1054
              CaptionOptions.AlignHorz = taRightJustify
              Control = editCustomcodeOld
              ControlOptions.ShowBorder = False
            end
            object lcieditCustomcodeNew: TdxLayoutItem
              Tag = 13
              Caption = #1053#1086#1074#1099#1081' '#1082#1086#1076' '#1058#1054' *'
              CaptionOptions.AlignHorz = taRightJustify
              Control = editCustomcodeNew
              ControlOptions.ShowBorder = False
            end
          end
          object lcgDocumentBase: TdxLayoutGroup [3]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
            object lcieditDocBase: TdxLayoutItem
              Tag = 33
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              CaptionOptions.AlignHorz = taRightJustify
              Control = editDocBase
              ControlOptions.ShowBorder = False
            end
          end
          object lcgReasonCorrect: TdxLayoutGroup [4]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
            object lcieditReasonCorrect: TdxLayoutItem
              Tag = 13
              Caption = '*'
              CaptionOptions.AlignHorz = taRightJustify
              Control = editReasonCorrect
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 328
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actChangeState: TAction
      Enabled = False
      Visible = False
    end
    inherited actPrint: TAction
      Visible = False
    end
    object actOpenPaymentOrder: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      OnExecute = actOpenPaymentOrderExecute
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 428
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 548
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 584
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 492
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 520
  end
  inherited imglLarge: TImageList
    Left = 400
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
          end
          item
            Item = btnOpenPaymentOrder
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
    Left = 464
    DockControlHeights = (
      0
      0
      0
      0)
    object btnOpenPaymentOrder: TdxBarButton
      Action = actOpenPaymentOrder
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'PAYMENT_ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end>
    Left = 328
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_correctpo_customcode_lst'
      ' where ID = :ID')
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
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
    object dsDataDOC_SOURCE_NAME: TStringField
      FieldName = 'DOC_SOURCE_NAME'
      Size = 1500
    end
    object dsDataREASON_CORRECT: TStringField
      FieldName = 'REASON_CORRECT'
      Size = 1500
    end
    object dsDataCUSTOMCODE_OLD_ID: TFloatField
      FieldName = 'CUSTOMCODE_OLD_ID'
    end
    object dsDataCUSTOMCODE_OLD: TStringField
      FieldName = 'CUSTOMCODE_OLD'
      Size = 8
    end
    object dsDataCUSTOMCODE_NEW_ID: TFloatField
      FieldName = 'CUSTOMCODE_NEW_ID'
    end
    object dsDataCUSTOMCODE_NEW: TStringField
      FieldName = 'CUSTOMCODE_NEW'
      Size = 8
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object dsDataUSER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 4000
    end
    object dsDataDOCUMENT_BASE: TStringField
      FieldName = 'DOCUMENT_BASE'
      Size = 111
    end
    object dsDataPAYMENT_NUMBER: TStringField
      FieldName = 'PAYMENT_NUMBER'
      Size = 100
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataPAYMENT_DOC_SUMMA: TFloatField
      FieldName = 'PAYMENT_DOC_SUMMA'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :id ::= p_correctpo_customcode.add'
      '    ('
      '      preasoncorrect   => :preasoncorrect'
      '     ,ppaymentid       => :ppaymentid'
      '     ,pcustomcodenewid => :pcustomcodenewid'
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
        Name = 'preasoncorrect'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ppaymentid'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pcustomcodenewid'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  null;  '
      'end;')
  end
  object qlSQLResult: TQueryList
    Session = MainData.Session
    Left = 512
    Top = 120
    object sqlisdoccanident: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  case p_correctpo_customcode.isdoccanident(ppaymentid => :ppaym' +
          'entid )'
        
          '    when p_correctpo_customcode.c_sign_ident_in_reestr then :lre' +
          'sult := 1;'
        
          '    when p_correctpo_customcode.c_sign_ident_in_reestr_send then' +
          ' :lresult := 2;'
        '    else :lresult := 0;'
        '  end case; '
        'end;')
    end
  end
  object dsetCustoms: TOracleDataSet
    SQL.Strings = (
      'select * from '
      '('
      'select c.id, c.customs_code_8, c.name, c.dt_end'
      'from fdc_customs_lst c'
      
        'where c.customs_code_8 like (case p_params.customlevel when p_co' +
        'nsts.customlevel_fts then '#39'%'#39' when p_consts.customlevel_rtu then' +
        ' substr(p_params.customcode,1,3) else substr(p_params.customcode' +
        ',1,5) end)||'#39'%000'#39
      'union'
      'select c.id, c.customs_code_8, c.name, c.dt_end'
      'from fdc_customs_lst c'
      'where p_params.customcode = p_params.ELSCustomCode'
      ' and c.customs_code_8 = p_params.ELSCustomCode'
      ')'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000E000000435553544F4D535F434F44455F38010000000000
      040000004E414D45010000000000020000004944010000000000090000004156
      41494C41424C45010000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Filter = 'DT_END = NULL'
    Left = 792
    Top = 160
    object dsetCustomsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetCustomsCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsetCustomsNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetCustomsDT_END: TDateField
      FieldName = 'DT_END'
    end
  end
  object dsCustoms: TDataSource
    AutoEdit = False
    DataSet = dsetCustoms
    Left = 792
    Top = 208
  end
end
