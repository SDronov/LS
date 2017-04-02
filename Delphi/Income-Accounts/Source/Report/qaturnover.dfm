inherited QATurnoverForm: TQATurnoverForm
  Left = 428
  Top = 323
  HelpContext = 4121
  Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1099#1081' '#1073#1072#1083#1072#1085#1089' '#1090#1072#1084#1086#1078#1085#1080
  ClientHeight = 196
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 196
    inherited btnCancel: TcxButton
      Top = 157
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Top = 157
      ModalResult = 0
      TabOrder = 4
    end
    object cmbxedtCurrID: TfdcObjectLookupEdit [2]
      Left = 117
      Top = 38
      DataBinding.DataField = 'CURR_ID'
      DataBinding.DataSource = srcMain
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
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 416
    end
    object edtFrom: TcxDBDateEdit [3]
      Left = 117
      Top = 67
      DataBinding.DataField = 'FROM_DATE'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 320
    end
    object edtTo: TcxDBDateEdit [4]
      Left = 117
      Top = 96
      DataBinding.DataField = 'TO_DATE'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 320
    end
    object edtSubject: TcxDBButtonEdit [5]
      Left = 117
      Top = 9
      DataBinding.DataField = 'SUBJ_NAME'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 286
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item5: TdxLayoutItem [0]
        Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
        Visible = False
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxedtCurrID
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtTo
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    object actPasteFromBuffer: TAction
      Caption = #1042#1089'&'#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -12
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object srcMain: TDataSource
    DataSet = dxMemData1
    Left = 64
    Top = 136
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 104
    Top = 136
    object dxMemData1SUBJ_ID: TFloatField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJ_ID'
    end
    object dxMemData1SUBJ_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJ_NAME'
      Size = 200
    end
    object dxMemData1FROM_DATE: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'FROM_DATE'
      Required = True
      OnValidate = dxMemData1FROM_DATEValidate
    end
    object dxMemData1TO_DATE: TDateField
      DisplayLabel = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'TO_DATE'
      Required = True
    end
    object dxMemData1CURR_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_ID'
      Required = True
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := p_qbalans.getrangedata(prangename => :range,'
      '                                    pcurrid => :curr_id,'
      '                                    psdate => :from_date,'
      '                                    pedate => :to_date);'
      'end;')
    Variables.Data = {
      0300000005000000070000003A524553554C5474000000000000000000000006
      0000003A52414E4745050000000000000000000000080000003A435552525F49
      440400000000000000000000000A0000003A46524F4D5F444154450C00000000
      00000000000000080000003A544F5F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000300000054414701000000000002000000494E0100000000
      000100000049010000000000010000004F010000000000030000004F55540100
      00000000}
    ReadOnly = True
    Left = 304
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 192
    Top = 272
  end
  object xlReport1: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'report\'#1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'.xls'
    DataSources = <
      item
        DataSet = OracleDataSet1
        Alias = 'ds1_1'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReport1DataSources0BeforeDataTransfer
      end
      item
        DataSet = OracleDataSet1
        Alias = 'ds1_2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReport1DataSources0BeforeDataTransfer
      end
      item
        DataSet = OracleDataSet1
        Alias = 'ds1_3'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReport1DataSources0BeforeDataTransfer
      end
      item
        DataSet = OracleDataSet1
        Alias = 'ds2'
        Range = 'rng2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReport1DataSources0BeforeDataTransfer
      end>
    Preview = False
    Params = <>
    Left = 248
    Top = 88
  end
end
