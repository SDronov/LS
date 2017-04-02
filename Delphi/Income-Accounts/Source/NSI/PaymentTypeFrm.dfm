inherited PaymentTypeForm: TPaymentTypeForm
  Top = 192
  Height = 523
  Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 496
    ClientRectBottom = 472
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 443
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 337
          TabOrder = 11
          Height = 204
          Width = 423
        end
        object cmbxKBK: TcxDBLookupComboBox [2]
          Left = 145
          Top = 309
          DataBinding.DataField = 'CODE2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.GridMode = True
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = srcKBK
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 229
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 276
          Width = 121
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Top = 182
          Width = 121
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Top = 243
          Width = 121
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Top = 215
          Width = 121
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Top = 149
          Width = 121
        end
        inherited edtSDate: TcxDBDateEdit
          Top = 121
          Width = 121
        end
        inherited edtCode: TcxDBTextEdit
          Top = 37
          Width = 423
        end
        inherited edtFullCode: TcxDBTextEdit
          Top = 65
          Width = 423
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 93
          Width = 423
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem8: TdxLayoutItem [10]
            Caption = #1050#1041#1050
            CaptionOptions.AlignHorz = taRightJustify
            Visible = False
            Control = cmbxKBK
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 443
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 469
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 443
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 472
        ClientRectBottom = 448
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSave: TAction
      Enabled = False
      Visible = False
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.BorderStyle = ebsSingle
    Style.Font.Height = -12
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
        FloatLeft = 534
        FloatTop = 306
        FloatClientWidth = 127
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = btnRefresh
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
      '  from FDC_Payment_Type_lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_Payment_Type_lst'
  end
  inherited srcData: TDataSource
    AutoEdit = False
  end
  object dsKBK: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select CODE, NAME'
      '  from FDC_KBK_DICT_lst'
      'order by CODE')
    Left = 12
    Top = 95
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object StringField7: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Size = 1500
    end
  end
  object srcKBK: TDataSource
    DataSet = dsKBK
    Left = 11
    Top = 148
  end
end
