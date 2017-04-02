inherited CorrectionPOSubjectForm: TCorrectionPOSubjectForm
  Width = 722
  Height = 583
  Caption = 'CorrectionPOSubjectForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 706
    Height = 545
    ClientRectBottom = 521
    ClientRectRight = 706
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 700
        Height = 490
        inherited edtDescript: TcxDBMemo
          Top = 403
          TabOrder = 11
        end
        object edtDeclarant: TfdcObjectLinkEdit [2]
          Left = 112
          Top = 263
          DataBinding.DataField = 'DECL_NAME'
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
          TabOrder = 9
          OnBeforeAcceptObject = edtDeclarantBeforeAcceptObject
          Width = 756
        end
        object edtDeclINN: TcxDBMaskEdit [3]
          Left = 112
          Top = 236
          DataBinding.DataField = 'DECL_INN'
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
          TabOrder = 7
          Width = 250
        end
        object edtDeclKPP: TcxDBMaskEdit [4]
          Left = 412
          Top = 236
          DataBinding.DataField = 'DECL_KPP'
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
          TabOrder = 8
          Width = 251
        end
        inherited edtReasonCorrection: TcxDBMemo
          Top = 334
          TabOrder = 10
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
        end
        inherited edtDocDate: TcxDBDateEdit
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
              AlignHorz = ahClient
            end
          end
          object lcgDeclarant: TdxLayoutGroup [3]
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
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 706
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 490
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 518
        Width = 706
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 703
        Height = 490
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 706
        Height = 521
        ClientRectBottom = 497
        ClientRectRight = 706
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
        FloatLeft = 329
        FloatTop = 268
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
      'select c.*'
      '  from fdc_correction_po_subject_Lst c'
      ' where c.ID = :ID')
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      
        '  :ID ::= fdc_correction_po_subject_add(pdoctype       => :TYPES' +
        'YSNAME,'
      
        '                                        pdocnumber     => :doc_n' +
        'umber,'
      
        '                                        pdocdate       => :doc_d' +
        'ate,'
      
        '                                        pdocid         => :doc_i' +
        'd,'
      
        '                                        preasoncorrect => :reaso' +
        'n_correct,'
      
        '                                        psubjectid     => :subje' +
        'ct_id);'
      'end;')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
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
        Name = 'reason_correct'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_correction_po_subject_upd(pid            => :id,'
      '                                pdocnumber     => :doc_number,'
      '                                pdocdate       => :doc_date,'
      '                                pdocid         => :doc_id,'
      
        '                                pReasonCorrect => :Reason_correc' +
        't,'
      '                                pSubjectId     => :subject_id);'
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
        Name = 'Reason_correct'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
end
