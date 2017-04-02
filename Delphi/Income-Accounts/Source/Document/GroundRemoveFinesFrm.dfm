inherited GroundRemoveFinesForm: TGroundRemoveFinesForm
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1089#1085#1103#1090#1080#1103' '#1096#1088#1072#1092#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 117
          Top = 107
          TabOrder = 4
        end
        inherited edtDescript: TcxDBMemo
          Left = 117
          Height = 214
          Width = 637
        end
        inherited edtDocNumber: TcxDBTextEdit
          Top = 40
          Properties.OnChange = Modify
          TabOrder = 0
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Top = 40
          Properties.OnChange = Modify
          TabOrder = 1
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 67
          TabOrder = 2
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 67
          TabOrder = 3
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup [0]
          end
          inherited lciNameEdit: TdxLayoutItem [1]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
            Visible = True
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = True
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
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from FDC_GROUNDS_REMOVE_FINES_LST'
      ' where ID = :ID')
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      
        '  :ID ::= fdc_grounds_remove_fines_add(pdocnumber => :doc_number' +
        ','
      '                                       pdocdate   => :doc_date,'
      '                                       pname      => :NAME,'
      '                                       pdeclid    => :decl_id,'
      '                                       pdescript  => :DESCRIPT);'
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
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
