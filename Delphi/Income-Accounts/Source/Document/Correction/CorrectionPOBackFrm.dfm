inherited CorrectionPOBackForm: TCorrectionPOBackForm
  Left = 266
  Top = 133
  Width = 920
  Height = 619
  Caption = 
    #1044#1086#1082#1091#1084#1077#1085#1090' '#1082#1086#1088#1088#1077#1082#1094#1080#1080' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103' '#1087#1088#1080' '#1074#1086#1079#1074#1088#1072#1090#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088 +
    #1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 904
    Height = 581
    ClientRectBottom = 557
    ClientRectRight = 904
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 898
        Height = 526
        inherited edtDescript: TcxDBMemo
          Top = 599
          TabOrder = 16
        end
        object edtReasonBack: TcxDBComboBox [2]
          Left = 112
          Top = 559
          DataBinding.DataField = 'REASON_BACK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1054#1096#1080#1073#1082#1072' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072
            #1054#1096#1080#1073#1082#1072' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 15
          Width = 756
        end
        object edtDeclarant: TfdcObjectLinkEdit [3]
          Left = 112
          Top = 361
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Subject;Bank'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
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
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 12
          OnBeforeAcceptObject = edtDeclarantBeforeAcceptObject
          Width = 756
        end
        object edtDeclINN: TcxDBMaskEdit [4]
          Left = 112
          Top = 334
          DataBinding.DataField = 'SUBJECT_INN'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 476
        end
        object edtDeclKPP: TcxDBMaskEdit [5]
          Left = 612
          Top = 334
          DataBinding.DataField = 'SUBJECT_KPP'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 251
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [6]
          Left = 112
          Top = 263
          DataBinding.DataField = 'OLDPAYERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OLDPAYERID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 9
          Width = 890
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [7]
          Left = 112
          Top = 236
          DataBinding.DataField = 'OLDPAYERINN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 473
        end
        object cxDBMaskEdit2: TcxDBMaskEdit [8]
          Left = 611
          Top = 236
          DataBinding.DataField = 'OLDPAYERKPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 251
        end
        object edtSumma: TcxDBCurrencyEdit [9]
          Left = 60
          Top = 501
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = dsGetSum
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 121
        end
        inherited edtReasonCorrection: TcxDBMemo
          Top = 432
          TabOrder = 13
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 739
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
          inherited lcgDocumentSource: TdxLayoutGroup
            inherited lcDocumentSource: TdxLayoutItem
              Tag = 33
              AlignHorz = ahClient
            end
          end
          object lcGeneralGroup5: TdxLayoutGroup [3]
            Tag = 33
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' '#1076#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            object lcGeneralGroup4: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem2: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBMaskEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem3: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBMaskEdit2
                ControlOptions.ShowBorder = False
              end
            end
            object lciOldDeclName: TdxLayoutItem
              Tag = 33
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcObjectLinkEdit1
              ControlOptions.ShowBorder = False
            end
          end
          object lcgDeclarant: TdxLayoutGroup [4]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclInn: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lciDeclKpp: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclName: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDeclarant
              ControlOptions.ShowBorder = False
            end
          end
          object lcSumma: TdxLayoutItem [6]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          object lcgReasonBack: TdxLayoutGroup [7]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
            object lcGeneralItem1: TdxLayoutItem
              Caption = #1055#1088#1080#1095#1080#1085#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtReasonBack
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 904
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 526
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 554
        Width = 904
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 901
        Height = 526
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 904
        Height = 557
        ClientRectBottom = 533
        ClientRectRight = 904
      end
    end
  end
  inherited ActionList: TActionList
    inherited actPrint: TAction
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
        FloatLeft = 540
        FloatTop = 259
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
      'select t.*, '
      '       t.OLD_SUBJECT_ID AS OldPayerId, '
      '       s.name AS OldPayerName, '
      '       s.inn AS OldPayerINN, '
      '       s.kpp AS OldPayerKPP'
      'from fdc_correction_po_back_lst t, fdc_subject_lst s'
      'WHERE t.ID = :ID'
      '  AND s.id(+) = t.OLD_SUBJECT_ID'
      '')
    inherited dsDataDOC_ID: TFloatField
      Required = True
    end
    inherited dsDataREASON_CORRECT: TStringField
      Required = True
    end
    object dsDataREASON_BACK: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'REASON_BACK'
      Required = True
      Size = 1500
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Required = True
      Size = 1500
    end
    object dsDataSUBJECT_INN: TStringField
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object dsDataOLDPAYERID: TFloatField
      FieldName = 'OLDPAYERID'
    end
    object dsDataOLDPAYERNAME: TStringField
      FieldName = 'OLDPAYERNAME'
      Size = 1500
    end
    object dsDataOLDPAYERINN: TStringField
      FieldName = 'OLDPAYERINN'
      Size = 12
    end
    object dsDataOLDPAYERKPP: TStringField
      FieldName = 'OLDPAYERKPP'
      Size = 10
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= fdc_correction_po_back_add('
      '                                pdocnumber => :doc_number,'
      '                                pdocdate => :doc_date,'
      '                                pdocid => :doc_id,'
      '                                psubjectid => :subject_id,'
      
        '                                preasoncorrect => :reason_correc' +
        't,'
      '                                preasonback => :reason_back);'
      'end;')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_correct'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_back'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_correction_po_back_upd( pid             => :id,'
      '                              pdocnumber      => :doc_number,'
      '                              pdocdate        => :doc_date,'
      '                              pdocid          => :doc_id,'
      '                              pSubjectId      => :subject_id,'
      
        '                              pReasonCorrect  => :reason_correct' +
        ');'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_correct'
        ParamType = ptUnknown
      end>
  end
  object qlCorrectionBack: TQueryList
    Session = MainData.Session
    Left = 187
    Top = 188
    object sqlGetDecision: TsqlOp
      SQL.Strings = (
        'begin'
        'select v.Ref_Object_ID into :result'
        'from fdc_value_lst v '
        'where v.OWNER_OBJECT_ID = :pId; '
        'end;')
    end
  end
  object dsGetSum: TDataSource
    DataSet = odsGetSum
    Left = 459
    Top = 394
  end
  object odsGetSum: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(r.summa),0) as summa'
      'from fdc_reserved_payment r'
      'where  r.doc_id = :pId')
    Variables.Data = {
      0300000001000000040000003A50494404000000080000000000000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000500000053554D4D41010000000000}
    Session = MainData.Session
    Left = 459
    Top = 346
    object odsGetSumSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
end
