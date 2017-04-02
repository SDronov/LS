inherited CorrectionPOSumForm: TCorrectionPOSumForm
  Left = 223
  Top = 277
  Caption = 'CorrectionPoSumForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 139
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Left = 139
          Top = 359
          TabOrder = 10
          Height = 219
          Width = 417
        end
        object edtCorrectSumma: TcxDBCurrencyEdit [2]
          Left = 139
          Top = 305
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 121
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          DataBinding.TypeSysName = ''
          DataBinding.SearchFormClass = ''
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 121
        end
        object edtOldSumma: TcxDBCurrencyEdit [6]
          Left = 139
          Top = 332
          DataBinding.DataField = 'OLD_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 121
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
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocNumber: TdxLayoutItem
                Tag = 13
              end
              inherited lciDocDate: TdxLayoutItem
                Tag = 13
              end
            end
          end
          inherited lcgDocumentSource: TdxLayoutGroup
            inherited lcDocumentSource: TdxLayoutItem
              Tag = 33
            end
          end
          object lcGeneralItem1: TdxLayoutItem [4]
            Tag = 13
            Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCorrectSumma
            ControlOptions.ShowBorder = False
          end
          object lcOldSum: TdxLayoutItem [5]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072' '#1076#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtOldSumma
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
        FloatLeft = 763
        FloatTop = 245
        FloatClientWidth = 117
        FloatClientHeight = 86
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
      '  from fdc_correction_po_sum_Lst c'
      ' where c.ID = :ID')
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataOLD_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'OLD_SUMMA'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= fdc_correction_po_sum_add( pdoctype => :TYPESYSNAME'
      '                                    ,pDocNumber => :doc_number'
      '                                    ,pDocDate => :doc_date'
      '                                    ,pDocID => :doc_id'
      '                                    ,pSumma => :SUMMA'
      
        '                                    ,preasoncorrect => :reason_c' +
        'orrect);'
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
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reason_correct'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_correction_po_sum_upd( pid => :id'
      '                            ,pdocnumber => :doc_number'
      '                            ,pdocdate => :doc_date'
      '                            ,pdocid => :doc_id'
      '                            ,pSumma => :SUMMA'
      '                            ,pReasonCorrect => :Reason_correct);'
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
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reason_correct'
        ParamType = ptUnknown
      end>
  end
end
