inherited CorrectionPOForm: TCorrectionPOForm
  Left = 366
  Top = 169
  Width = 867
  Height = 601
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1082#1086#1088#1088#1077#1082#1094#1080#1080' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 859
    Height = 567
    ClientRectBottom = 543
    ClientRectRight = 859
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 853
        Height = 512
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 305
          TabOrder = 8
          Height = 91
          Width = 185
        end
        object edtReasonCorrection: TcxDBMemo [2]
          Left = 21
          Top = 236
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
          TabOrder = 7
          Height = 50
          Width = 815
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          Enabled = True
          Width = 724
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 715
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
            LayoutDirection = ldHorizontal
            inherited lcDocumentSource: TdxLayoutItem
              AutoAligns = [aaVertical]
            end
          end
          object lcgReasonCorrection: TdxLayoutGroup [3]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
            object lcReasonCorrection: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtReasonCorrection
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 859
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 512
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 540
        Width = 859
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 856
        Height = 512
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 859
        Height = 543
        ClientRectBottom = 519
        ClientRectRight = 859
      end
    end
  end
  inherited ActionList: TActionList
    Top = 91
    inherited actNew: TAction
      Visible = False
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 91
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 91
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 91
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 91
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 91
  end
  inherited imglAction: TImageList
    Top = 91
  end
  inherited imglLarge: TImageList
    Top = 91
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
        FloatLeft = 619
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
    Top = 91
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Top = 119
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select c.*'
      '  from fdc_correction_po_Lst c'
      ' where c.ID = :ID')
    Top = 119
    object dsDataREASON_CORRECT: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1094#1080#1080
      FieldName = 'REASON_CORRECT'
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Top = 147
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= fdc_correction_po_add(pdoctype => :TYPESYSNAME,'
      '                                pdocnumber => :doc_number,'
      '                                pdocdate => :doc_date,'
      '                                pdocid => :doc_id,'
      
        '                                preasoncorrect => :reason_correc' +
        't);'
      'end;')
    Top = 119
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
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  fdc_correction_po_upd(pid => :id,'
      '                         pdocnumber => :doc_number,'
      '                         pdocdate => :doc_date,'
      '                         pdocid => :doc_id,'
      '                         pReasonCorrect => :Reason_correct);'
      'end;')
    Top = 119
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
      end>
  end
  inherited srcTransit: TDataSource
    Top = 147
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 568
    Top = 119
  end
  inherited dsUpdateState: TfdcQuery
    Top = 119
  end
  inherited srcState: TDataSource
    Top = 147
  end
  inherited dsTransit: TfdcQuery
    Top = 119
  end
  inherited dsState: TfdcQuery
    Top = 119
  end
  inherited srcAccessLevel: TDataSource
    Top = 147
  end
  inherited dsAccessLevel: TfdcQuery
    Top = 119
  end
end
