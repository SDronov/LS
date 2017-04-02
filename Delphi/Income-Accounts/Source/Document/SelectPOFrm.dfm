inherited SelectPOForm: TSelectPOForm
  Left = 490
  Top = 267
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1091#1084#1084#1099' '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 201
    BevelInner = bvNone
    inherited Bevel1: TBevel
      Top = 161
      Width = 482
    end
    inherited btnCancel: TcxButton
      Top = 169
      TabOrder = 11
    end
    inherited btnOk: TcxButton
      Top = 169
      ModalResult = 0
      TabOrder = 10
    end
    object cmbxedtCurrID: TfdcObjectLookupEdit [3]
      Left = 376
      Top = 9
      DataBinding.DataField = 'SUMM_CURR_ID'
      DataBinding.DataSource = srcData
      Enabled = False
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 55
    end
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [4]
      Left = 376
      Top = 105
      DataBinding.DataField = 'PO_CURR_ID'
      DataBinding.DataSource = srcData
      Enabled = False
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 7
      Width = 55
    end
    object fdcObjectLookupEdit2: TfdcObjectLookupEdit [5]
      Left = 376
      Top = 129
      DataBinding.DataField = 'SUMM_CURR_ID'
      DataBinding.DataSource = srcData
      Enabled = False
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 9
      Width = 55
    end
    object fdcObjectLookupEdit3: TfdcObjectLookupEdit [6]
      Left = 376
      Top = 81
      DataBinding.DataField = 'PO_CURR_ID'
      DataBinding.DataSource = srcData
      Enabled = False
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 5
      Width = 55
    end
    object edtPaySumma: TcxDBCurrencyEdit [7]
      Left = 116
      Top = 105
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.AssignedValues.MaxValue = True
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edtPaySummaPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      TabOrder = 6
      Width = 147
    end
    object edtChargeSumma: TcxDBCurrencyEdit [8]
      Left = 116
      Top = 129
      DataBinding.DataField = 'CHARGE_SUMMA'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = edtChargeSummaPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      TabOrder = 8
      Width = 147
    end
    object cxDBCurrencyEdit3: TcxDBCurrencyEdit [9]
      Left = 116
      Top = 81
      DataBinding.DataField = 'PO_REST_SUMM'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = OfficeEditStyleController
      TabOrder = 4
      Width = 147
    end
    object cxDBCurrencyEdit4: TcxDBCurrencyEdit [10]
      Left = 116
      Top = 9
      DataBinding.DataField = 'TOTAL_SUMM'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 146
    end
    object cxDBTextEdit1: TcxDBTextEdit [11]
      Left = 116
      Top = 57
      DataBinding.DataField = 'PAYER_NAME'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Width = 208
    end
    object cxDBTextEdit2: TcxDBTextEdit [12]
      Left = 116
      Top = 33
      DataBinding.DataField = 'PO_NAME'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 2
      Width = 320
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Group2: TdxLayoutGroup [0]
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item17: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
          Control = cxDBCurrencyEdit4
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item6: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahRight
          Control = cmbxedtCurrID
          ControlOptions.ShowBorder = False
        end
      end
      object dxLayoutControl1Item13: TdxLayoutItem [1]
        Caption = #1055#1083#1072#1090#1077#1078'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [2]
        Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
        Control = cxDBTextEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Group3: TdxLayoutGroup [3]
        ShowCaption = False
        Hidden = True
        ShowBorder = False
        object dxLayoutControl1Group4: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayoutControl1Item16: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1087'/'#1087
            Control = cxDBCurrencyEdit3
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item12: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Enabled = False
            Control = fdcObjectLookupEdit3
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayoutControl1Group6: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayoutControl1Item14: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
            Control = edtPaySumma
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item7: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Enabled = False
            Control = fdcObjectLookupEdit1
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayoutControl1Group5: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayoutControl1Item15: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1053#1072#1073#1088#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
            Control = edtChargeSumma
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item9: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Enabled = False
            Control = fdcObjectLookupEdit2
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 72
    Top = 159
    inherited actOk: TAction
      OnUpdate = actOkUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 276
    Top = 31
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 360
    Top = 31
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 388
    Top = 31
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 304
    Top = 31
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 332
    Top = 39
  end
  object dsData: TdxMemData
    Indexes = <>
    SortOptions = []
    Top = 152
    object dsDataNEED_SUMM: TCurrencyField
      FieldName = 'TOTAL_SUMM'
      ReadOnly = True
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 200
    end
    object dsDataSUMM_CURR_ID: TFloatField
      DefaultExpression = '915446'
      FieldName = 'SUMM_CURR_ID'
    end
    object dsDataRATE: TFloatField
      FieldName = 'RATE'
    end
    object dsDataPO_ID: TFloatField
      FieldName = 'PO_ID'
    end
    object dsDataTOTAL_PO_SUMM: TCurrencyField
      FieldName = 'PO_LIMIT_SUMM'
    end
    object dsDataPO_REST: TCurrencyField
      FieldName = 'PO_REST_SUMM'
      ReadOnly = True
    end
    object dsDataPO_CURR_ID: TFloatField
      FieldName = 'PO_CURR_ID'
    end
    object dsDataSUMMA: TCurrencyField
      FieldName = 'SUMMA'
    end
    object dsDataCHARGE_SUMMA: TCurrencyField
      FieldName = 'CHARGE_SUMMA'
    end
    object dsDataPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      ReadOnly = True
      Size = 200
    end
    object dsDataSUBJECT_ID: TIntegerField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataKBK_ID: TFloatField
      FieldName = 'KBK_ID'
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 32
    Top = 160
  end
  object Params: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
        Value = 0.010000000000000000
      end>
    Left = 312
    Top = 40
  end
end
