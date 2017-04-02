inherited DocPackConfirmationsForm: TDocPackConfirmationsForm
  Left = 278
  Top = 362
  Height = 494
  ActiveControl = nil
  Caption = #1056#1077#1077#1089#1090#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 467
    ClientRectBottom = 443
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 414
        inherited edtName: TcxDBTextEdit
          Left = 112
          Top = 303
          TabOrder = 9
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Left = 112
          Top = 330
          TabOrder = 10
          Height = 223
          Width = 417
        end
        object edtDestCustomsCode: TcxDBTextEdit [7]
          Left = 112
          Top = 276
          DataBinding.DataField = 'DESTCUSTOMSCODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        inherited chBIsReceived: TcxDBCheckBox
          Enabled = False
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGrpPackage: TdxLayoutGroup
            inherited lciGrpDocAttr: TdxLayoutGroup
              inherited itemDocNumber: TdxLayoutItem
                Tag = 33
              end
              inherited itemDocDate: TdxLayoutItem
                Tag = 33
              end
            end
            inherited lcGrpReceiveAttr: TdxLayoutGroup
              inherited itemIsReiceved: TdxLayoutItem
                Visible = False
              end
            end
          end
          inherited lcGrpActivation: TdxLayoutGroup
            Visible = False
          end
          object lciDestCustomsCode: TdxLayoutItem [3]
            Tag = 33
            Caption = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtDestCustomsCode
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 414
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 440
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 414
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 443
        ClientRectBottom = 419
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
    inherited btnSave: TdxBarButton
      Enabled = False
    end
    inherited btnNew: TdxBarButton
      Enabled = False
    end
    inherited btnStateTransit: TdxBarSubItem
      Enabled = False
    end
    inherited btnDelete: TdxBarButton
      Enabled = False
    end
  end
  inherited dsData: TfdcQuery
    ReadOnly = True
    SQL.Strings = (
      'select *'
      '  from FDC_REESTR_CONFIRMATION_LST'
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
    object dsDataDESTCUSTOMSID: TFloatField
      FieldName = 'DESTCUSTOMSID'
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      
        '  :ID ::= fdc_doc_confirm_add(pdoctypesysname => '#39'DocumentConfir' +
        'mation'#39','
      '                                 pdocnumber => :DOC_NUMBER,'
      '                                 pdocdate => :DOC_DATE,'
      '                                 pname => NULL,'
      '                                 pdescript => :DESCRIPT,'
      '                                 pextsource => :EXT_SOURCE,'
      
        '                                 pexttypesysname => :EXT_TYPESYS' +
        'NAME,'
      '                                 pextid => :EXT_ID,'
      '                                 pconfirmeddocid => ???);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftUnknown
        Name = 'EXT_SOURCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXT_TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXT_ID'
        ParamType = ptUnknown
      end>
  end
end
