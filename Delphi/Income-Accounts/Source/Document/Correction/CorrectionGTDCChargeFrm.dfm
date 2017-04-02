inherited CorrectiongtdCChargeForm: TCorrectiongtdCChargeForm
  Caption = 'CorrectiongtdCChargeForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Height = 91
          Width = 417
        end
        inherited edtReasonCorrect: TcxDBMemo
          Width = 185
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          Width = 724
        end
        inherited edtDocNumber: TcxDBTextEdit
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
        end
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
        FloatLeft = 55
        FloatTop = 447
        FloatClientWidth = 104
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
      'select *'
      '  from fdc_correction_gtd_ccharge_Lst'
      ' where ID = :ID')
    inherited dsDataREASON_CORRECT: TStringField
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= p_correction_gtd.ccharge_add( pdoctype => :TYPESYSNAME'
      
        '                                       ,pdocnumber => :doc_numbe' +
        'r'
      '                                       ,pdocdate => :doc_date'
      '                                       ,pdocid => :doc_id'
      
        '                                       ,pReasonCorrect => :Reaso' +
        'n_Correct'
      '                                      );'
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
        Name = 'Reason_Correct'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_correction_gtd.ccharge_modify( pid => :id'
      '                                  ,pdocnumber => :doc_number'
      '                                  ,pdocdate => :doc_date'
      '                                  ,pdocid => :doc_id'
      
        '                                  ,pReasonCorrect => :Reason_Cor' +
        'rect'
      '                                 );'
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
        Name = 'Reason_Correct'
        ParamType = ptUnknown
      end>
  end
end
