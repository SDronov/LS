inherited DeclarantForm: TDeclarantForm
  Left = 276
  Top = 272
  Width = 773
  Height = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 757
    Height = 577
    ActivePage = tabChecks
    ClientRectBottom = 553
    ClientRectRight = 757
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 303
        end
        inherited edtDescript: TcxDBMemo
          Top = 39
          Height = 17
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 757
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 522
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 550
        Width = 757
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 754
        Height = 522
      end
      inherited lcMain: TdxLayoutControl
        Width = 751
        Height = 522
        TabOrder = 4
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 81
          Width = 449
        end
        inherited edtOKPO: TcxDBMaskEdit
          Width = 142
        end
        inherited edtINN: TcxDBMaskEdit
          Top = 33
          Width = 141
        end
        inherited edtOGRN: TcxDBMaskEdit
          Width = 63
        end
        inherited edtAddress: TcxDBTextEdit
          Top = 105
          Width = 340
        end
        inherited edtPhone: TcxDBTextEdit
          Top = 129
        end
        inherited edtFax: TcxDBTextEdit
          Top = 129
          Width = 203
        end
        inherited edtTelex: TcxDBTextEdit
          Top = 153
        end
        inherited edtSOATO: TcxDBMaskEdit
          Top = 33
          Width = 104
        end
        inherited edtTeletype: TcxDBTextEdit
          Top = 153
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 57
        end
        object edtCategory: TcxDBTextEdit [11]
          Left = 83
          Top = 208
          DataBinding.DataField = 'CATEGORY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 20
          Width = 210
        end
        object edtRegDate: TcxDBDateEdit [12]
          Left = 394
          Top = 208
          DataBinding.DataField = 'REG_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 15
          Width = 122
        end
        object edtCustomCode: TcxDBMaskEdit [13]
          Left = 394
          Top = 256
          DataBinding.DataField = 'CUSTOM_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,5}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 16
          Width = 122
        end
        object cmbxCountryCode: TfdcObjectLookupEdit [14]
          Left = 83
          Top = 232
          DataBinding.DataField = 'ALFA2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsEditList
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'CODE2'
          Properties.ListColumns = <
            item
              FieldName = 'CODE2'
            end
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = DictData.srcCountryCode
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 17
          Width = 248
        end
        object edtPost9: TcxDBTextEdit [15]
          Left = 438
          Top = 232
          DataBinding.DataField = 'POST9'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 18
          Width = 122
        end
        object edtAlfa2: TcxDBTextEdit [16]
          Left = 83
          Top = 256
          DataBinding.DataField = 'ALFA2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 210
        end
        inherited edtTeleGraph: TcxDBTextEdit
          Top = 153
        end
        object cxDBCheckBox1: TcxDBCheckBox [18]
          Left = 21
          Top = 280
          Anchors = [akLeft]
          AutoSize = False
          Caption = #1056#1077#1079#1080#1076#1077#1085#1090
          DataBinding.DataField = 'RESIDENT'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Height = 21
          Width = 76
        end
        inherited dxLayoutGroup3s: TdxLayoutGroup
          inherited dxLayoutGroup2s: TdxLayoutGroup
            inherited lcMainGroup1s: TdxLayoutGroup
              object lcglcMainGroup1: TdxLayoutGroup
                Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
                object lcMainGroup2: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainItem1: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
                    Control = edtCategory
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem2: TdxLayoutItem
                    Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
                    Control = edtRegDate
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainGroup4: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcMainGroup6: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lcMainItem5: TdxLayoutItem
                      AutoAligns = [aaVertical]
                      Caption = #1050#1086#1076' '#1089#1090#1088#1072#1085#1099
                      Control = cmbxCountryCode
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem6: TdxLayoutItem
                      Caption = #1050#1086#1076' '#1087#1086#1095#1090#1086#1074#1086#1081' '#1079#1086#1085#1099
                      Control = edtPost9
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lcMainGroup3: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lcMainItem7: TdxLayoutItem
                      AutoAligns = [aaVertical]
                      Caption = #1050#1086#1076' '#1089#1090#1088#1072#1085#1099
                      Control = edtAlfa2
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem4: TdxLayoutItem
                      Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
                      Control = edtCustomCode
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
                object lcMainItem3: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  ShowCaption = False
                  Control = cxDBCheckBox1
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
        end
      end
    end
    inherited tabDocList: TcxTabSheet
      inherited pcDocList: TcxPageControl
        Width = 757
        Height = 615
        ClientRectBottom = 611
        ClientRectRight = 753
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 757
        Height = 553
        ClientRectBottom = 529
        ClientRectRight = 757
      end
    end
    object tsAccounts: TcxTabSheet
      Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1089#1095#1077#1090#1072
      ImageIndex = 2
      OnShow = tsAccountsShow
    end
    object tabChecks: TcxTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1080
      ImageIndex = 7
      OnShow = tabChecksShow
    end
  end
  inherited ActionList: TActionList
    object acAddAccount: TAction
      Category = 'Accounts'
      Hint = #1044#1086#1073#1072#1074#1090#1100' '#1089#1095#1077#1090
      ImageIndex = 2
    end
    object acDelAccount: TAction
      Category = 'Accounts'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1095#1077#1090
      ImageIndex = 3
    end
    object acEditAccount: TAction
      Category = 'Accounts'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1095#1077#1090
    end
    object acRefreshAccounts: TAction
      Category = 'Accounts'
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 0
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
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
        FloatLeft = 502
        FloatTop = 269
        FloatClientWidth = 103
        FloatClientHeight = 50
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
    object dxBarButton1: TdxBarButton
      Action = acAddAccount
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = acRefreshAccounts
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = acDelAccount
      Category = 0
    end
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
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = SubjectForm.dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Declarant_Lst'
      ' where ID = :ID')
    inherited dsDataINN: TStringField
      Required = False
    end
    object dsDataCATEGORY: TStringField
      FieldName = 'CATEGORY'
      Size = 3
    end
    object dsDataCUSTOM_CODE: TStringField
      FieldName = 'CUSTOM_CODE'
      OnValidate = dsDataValidate
      Size = 10
    end
    object dsDataREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsDataIS_BIG: TFloatField
      FieldName = 'IS_BIG'
    end
    object dsDataIS_NSI: TFloatField
      FieldName = 'IS_NSI'
    end
    object dsDataPOST9: TStringField
      FieldName = 'POST9'
      Size = 9
    end
    object dsDataALFA2: TStringField
      FieldName = 'ALFA2'
      Size = 2
    end
    object dsDataRESIDENT: TStringField
      FieldName = 'RESIDENT'
      Size = 1
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_declarant_add(pname => :name,'
      '                                 paddress => :address,'
      '                                 pokpo => :okpo,'
      '                                 pinn => :inn,'
      '                                 pogrn => :ogrn,'
      '                                 psoato => :soato,'
      '                                 pkpp => :kpp,'
      '                                 pphone => :phone,'
      '                                 pfax => :fax,'
      '                                 ptelex => :telex,'
      '                                 ptelegraph => :telegraph,'
      '                                 pcategory => :category,'
      '                                 pcustomcode => :custom_code,'
      '                                 pregdate => :reg_date,'
      '                                 pPost9 => :Post9,'
      '                                 pAlfa2 => :Alfa2,'
      '                                 pResident => :resident);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 13
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
        Size = 13
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'SOATO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'PHONE'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEGRAPH'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CATEGORY'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CUSTOM_CODE'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'REG_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'Post9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alfa2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resident'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_declarant_upd(pid => :id,'
      '                    pname => :name,'
      '                    paddress => :address,'
      '                    pokpo => :okpo,'
      '                    pinn => :inn,'
      '                    pogrn => :ogrn,'
      '                    psoato => :soato,'
      '                    pkpp => :kpp,'
      '                    pphone => :phone,'
      '                    pfax => :fax,'
      '                    ptelex => :telex,'
      '                    ptelegraph => :telegraph,'
      '                    pcategory => :category,'
      '                    pcustomcode => :custom_code,'
      '                    pregdate => :reg_date,'
      '                    pPost9 => :Post9,'
      '                    pAlfa2 => :Alfa2,'
      '                    pResident => :resident);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 13
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
        Size = 13
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'SOATO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'PHONE'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEGRAPH'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CATEGORY'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CUSTOM_CODE'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'REG_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'Post9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alfa2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resident'
        ParamType = ptUnknown
      end>
  end
  object dsCheckAcc: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT * FROM fdc_bank_lst WHERE okpo = :okpo')
    Left = 448
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end>
  end
end
