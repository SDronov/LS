inherited CorrectionDocForm: TCorrectionDocForm
  Caption = 'CorrectionDocForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 205
          TabOrder = 7
          Height = 91
          Width = 185
        end
        object edtDocumentSource: TfdcObjectLinkEdit [2]
          Left = 112
          Top = 165
          DataBinding.DataField = 'DOC_SOURCE_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DOC_ID'
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
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 6
          Width = 724
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
            inherited lcgDocumentAttrs: TdxLayoutGroup
              inherited lcIs_TS: TdxLayoutItem
                Tag = 22
              end
            end
          end
          object lcgDocumentSource: TdxLayoutGroup [2]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
            object lcDocumentSource: TdxLayoutItem
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocumentSource
              ControlOptions.ShowBorder = False
            end
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
        FloatLeft = 370
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
      'select *'
      '  from fdc_correction_doc_Lst'
      ' where ID = :ID')
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataDOC_SOURCE_NAME: TStringField
      FieldName = 'DOC_SOURCE_NAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= fdc_correction_doc_add(pdoctype => :TYPESYSNAME,'
      '                                    pdocnumber => :doc_number,'
      '                                    pdocdate => :doc_date,'
      '                                    pdocid => :doc_id);'
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
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_correction_doc_upd(pid => :id,'
      '                         pdocnumber => :doc_number,'
      '                         pdocdate => :doc_date,'
      '                         pdocid => :doc_id);'
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
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 259
    Top = 282
    object sqlActivate: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_document.DoActivate( :id );'
        'end;')
      DataSet = dsData
    end
  end
end
