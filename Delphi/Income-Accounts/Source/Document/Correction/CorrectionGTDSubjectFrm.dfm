inherited CorrectionGTDSubjectForm: TCorrectionGTDSubjectForm
  Left = 296
  Top = 170
  Height = 600
  Caption = 'CorrectionGTDSubjectForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 566
    ClientRectBottom = 542
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 511
        inherited edtDescript: TcxDBMemo
          Top = 540
          TabOrder = 15
          Height = 20
        end
        object edtSubjectName: TfdcObjectLinkEdit [2]
          Left = 112
          Top = 263
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Bank'
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
          TabOrder = 10
          OnAfterAcceptObject = edtSubjectNameAfterAcceptObject
          Width = 121
        end
        object edtSubjectInn: TcxDBTextEdit [3]
          Left = 112
          Top = 236
          DataBinding.DataField = 'SUBJECT_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 121
        end
        object edtSubjectKpp: TcxDBTextEdit [4]
          Left = 329
          Top = 236
          DataBinding.DataField = 'SUBJECT_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 121
        end
        object edtSerDocNo: TcxDBTextEdit [5]
          Left = 550
          Top = 236
          DataBinding.DataField = 'PERSON_SER_DOC_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 121
        end
        object edtSubjectInnOld: TcxDBTextEdit [6]
          Left = 112
          Top = 334
          DataBinding.DataField = 'SUBJECT_INN_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 188
        end
        object edtSubjectKppOld: TcxDBTextEdit [7]
          Left = 458
          Top = 334
          DataBinding.DataField = 'SUBJECT_KPP_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Width = 175
        end
        object edtSubjectNameOld: TfdcObjectLinkEdit [8]
          Left = 112
          Top = 361
          DataBinding.DataField = 'SUBJECT_NAME_OLD'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_NAME_OLD'
          DataBinding.TypeSysName = 'Declarant;Person'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          Enabled = False
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 13
          Width = 614
        end
        inherited edtReasonCorrect: TcxDBMemo
          Top = 432
          TabOrder = 14
          Width = 185
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          Width = 724
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 604
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
          object lcgSubject: TdxLayoutGroup [3]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            object lcGeneralGroup5: TdxLayoutGroup
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem1: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSubjectInn
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem3: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSubjectKpp
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem5: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1057#1077#1088#1080#1103' '#8470
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSerDocNo
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSubjectName
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSubjectOld: TdxLayoutGroup [4]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' '#1076#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            object lcGeneralGroup4: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem4: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSubjectInnOld
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem6: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSubjectKppOld
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem7: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSubjectNameOld
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 511
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 539
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 511
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 542
        ClientRectBottom = 518
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
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
        FloatLeft = 370
        FloatTop = 290
        FloatClientWidth = 134
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
      '  from fdc_correction_gtd_subject_Lst'
      ' where ID = :ID')
    inherited dsDataREASON_CORRECT: TStringField
      Required = True
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
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
    object dsDataPERSON_SER_DOC_NO: TStringField
      FieldName = 'PERSON_SER_DOC_NO'
      Size = 61
    end
    object dsDataSUBJECT_ID_OLD: TFloatField
      FieldName = 'SUBJECT_ID_OLD'
    end
    object dsDataSUBJECT_NAME_OLD: TStringField
      FieldName = 'SUBJECT_NAME_OLD'
      Size = 1500
    end
    object dsDataSUBJECT_INN_OLD: TStringField
      FieldName = 'SUBJECT_INN_OLD'
      Size = 12
    end
    object dsDataSUBJECT_KPP_OLD: TStringField
      FieldName = 'SUBJECT_KPP_OLD'
      Size = 10
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= p_correction_gtd.subject_add ('
      '     pDocType       => :TYPESYSNAME'
      '    ,pDocNumber     => :doc_number'
      '    ,pDocDate       => :doc_date'
      '    ,pDocId         => :doc_id'
      '    ,pReasonCorrect => :Reason_correct'
      '    ,pSubjectId     => :subject_id'
      '  );'
      'end;'
      '')
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
        Name = 'Reason_correct'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_correction_gtd.subject_modify( pId            => :ID'
      '                                  ,pDocNumber     => :DOC_NUMBER'
      '                                  ,pDocDate       => :DOC_DATE'
      '                                  ,pDocID         => :DOC_ID'
      
        '                                  ,pReasonCorrect => :Reason_Cor' +
        'rect'
      '                                  ,pSubjectId     => :Subject_ID'
      '                                  );'
      'end;'
      '')
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
        Name = 'Reason_Correct'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Subject_ID'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 484
    Top = 291
  end
  inherited srcState: TDataSource
    Top = 291
  end
  object dsPassport: TOracleDataSet
    SQL.Strings = (
      'select'
      '  to_char(p.ser_no || '#39' '#39' || p.doc_no) person_ser_doc_no'
      '  ,to_char(s.inn) inn'
      '  ,to_char(s.kpp) kpp'
      'from'
      '  fdc_person_lst p'
      '  ,fdc_subject_lst s'
      'where'
      ' s.id = :Subject_Id'
      '  and p.id(+) = s.id')
    Variables.Data = {
      03000000010000000B0000003A5355424A4543545F4944040000000000000000
      000000}
    Session = MainData.Session
    Left = 611
    Top = 268
  end
end
