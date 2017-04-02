inherited qCheckSvedCustomForm: TqCheckSvedCustomForm
  Left = 454
  Top = 566
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1089#1074#1077#1076#1077#1085#1080#1081
  ClientHeight = 212
  ClientWidth = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 587
    Height = 212
    inherited btnCancel: TcxButton
      Left = 503
      Top = 180
      TabOrder = 8
    end
    inherited btnOk: TcxButton
      Left = 422
      Top = 180
      TabOrder = 7
    end
    inherited edtDateFrom: TcxDBDateEdit
      Left = 77
      Width = 121
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Left = 77
      Width = 145
    end
    inherited chbxXML: TcxCheckBox
      Top = 180
      TabOrder = 6
      Visible = False
    end
    inherited edtDateTo: TcxDBDateEdit
      Left = 77
      Width = 381
    end
    object edtINN: TcxDBMaskEdit [6]
      Left = 77
      Top = 90
      DataBinding.DataField = 'INN'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,12}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 3
      Width = 200
    end
    object edtKPP: TcxDBMaskEdit [7]
      Left = 306
      Top = 90
      DataBinding.DataField = 'KPP'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,9}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 5
      Width = 272
    end
    object cmbxPaytype: TfdcObjectLookupEdit [8]
      Left = 77
      Top = 114
      DataBinding.DataField = 'PaytypeID'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcPayTypes
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 4
      Width = 200
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lciCurrency: TdxLayoutItem
        Visible = False
      end
      object dxLayoutControl1Group1: TdxLayoutGroup [3]
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Group3: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object lciINN: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = #1048#1053#1053
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lciPayType: TdxLayoutItem
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            Control = cmbxPaytype
            ControlOptions.ShowBorder = False
          end
        end
        object lciKPP: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #1050#1055#1055
          Control = edtKPP
          ControlOptions.ShowBorder = False
        end
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        inherited lcichbxXML: TdxLayoutItem
          Visible = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 160
    Top = 47
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 236
    Top = 39
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 184
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 476
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 160
    Top = 31
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 148
    Top = 7
  end
  inherited dsMemData: TdxMemData
    Left = 40
    Top = 8
    inherited dsMemDataDateFrom: TDateField
      FieldName = 'DATE_FROM'
    end
    inherited dsMemDataDateTo: TDateField
      FieldName = 'DATE_TO'
    end
    object dsMemDataPaytypeID: TIntegerField
      FieldName = 'PaytypeID'
    end
    object dsMemDataINN: TStringField
      FieldName = 'INN'
    end
    object dsMemDataKPP: TStringField
      FieldName = 'KPP'
    end
  end
  inherited srcMemData: TDataSource
    Left = 72
    Top = 8
  end
  inherited xlrReport: TxlReport
    Left = 296
    Top = 8
  end
  inherited dsValueSys: TOracleDataSet
    Left = 216
    Top = 65528
  end
  inherited dsReportParam: TOracleDataSet
    Left = 408
    Top = 65528
  end
  inherited qryCheckReport: TOracleQuery
    Left = 256
    Top = 65528
  end
  inherited dsHeader: TfdcQuery
    Left = 328
    Top = 8
  end
  inherited dsReport: TfdcQuery
    Left = 424
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end>
  end
  inherited dsXML: TfdcQuery
    Left = 360
    Top = 24
  end
  inherited dlgSave: TSaveDialog
    Left = 272
    Top = 40
  end
  inherited dsCheckRate: TfdcQuery
    Left = 512
    Top = 8
  end
end
