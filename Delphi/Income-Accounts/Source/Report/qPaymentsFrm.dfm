inherited qPaymentsForm: TqPaymentsForm
  Caption = 'qPaymentsForm'
  ClientHeight = 201
  ClientWidth = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 491
    Height = 201
    inherited btnCancel: TcxButton
      Left = 407
      Top = 169
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 326
      Top = 169
      TabOrder = 4
    end
    inherited edtDateFrom: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 371
    end
    object edtINN: TcxDBMaskEdit [4]
      Left = 51
      Top = 136
      DataBinding.DataField = 'INN'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.EditMask = '000000000099;1;_'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object lcbCustoms: TcxDBLookupComboBox [5]
      Left = 51
      Top = 109
      DataBinding.DataField = 'FILTER_TO'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.KeyFieldNames = 'CODE'
      Properties.ListColumns = <
        item
          Caption = #1050#1086#1076' '#1058#1054
          MinWidth = 65
          Width = 90
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsetCustoms
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      TabOrder = 2
      Width = 145
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object liCustoms: TdxLayoutItem [1]
        Caption = #1050#1086#1076' '#1058#1054' '
        Control = lcbCustoms
        ControlOptions.ShowBorder = False
      end
      object liINN: TdxLayoutItem [2]
        Caption = #1048#1053#1053
        Control = edtINN
        ControlOptions.ShowBorder = False
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
  inherited dsHeader: TfdcQuery
    Left = 24
    Top = 72
  end
  inherited dsParam: TdxMemData
    BeforePost = dsParamBeforePost
    object dsParamINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsParamFILTER_TO: TStringField
      DisplayLabel = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1086#1076#1091' '#1058#1054
      FieldName = 'FILTER_TO'
      Size = 8
    end
  end
  object dsCustoms: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 1 ID, '#39#1042#1089#1077#39' code, '#39#1042#1089#1077' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1077' '#1058#1054#39' NAME, '#39#1042#1089#1077' '#1087#1086#1076#1095#1080#1085#1077 +
        #1085#1085#1099#1077' '#1058#1054#39' full_name FROM dual'
      'UNION ALL '
      'SELECT t.id, t.customs_code_8 code, t.NAME, t.FULL_NAME'
      'FROM fdc_customs_lst t'
      
        'WHERE t.customs_code_8 LIKE '#39'10_00000'#39' OR t.customs_code_8 LIKE ' +
        ' '#39'1000_000'#39
      '  AND t.customs_code_8 NOT IN ('#39'10007000'#39', '#39'10008000'#39')'
      '  AND t.dt_end IS NULL'
      'ORDER BY code  ')
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000004000000434F444501000000
      0000040000004E414D450100000000000900000046554C4C5F4E414D45010000
      000000}
    Session = MainData.Session
    Left = 248
    Top = 40
    object dsCustomsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsCustomsCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      DisplayWidth = 12
      FieldName = 'CODE'
      Size = 8
    end
    object dsCustomsNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      DisplayWidth = 80
      FieldName = 'NAME'
      Size = 1500
    end
    object dsCustomsFULL_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      DisplayWidth = 80
      FieldName = 'FULL_NAME'
      Size = 4000
    end
  end
  object dsetCustoms: TDataSource
    DataSet = dsCustoms
    Left = 248
    Top = 88
  end
end
