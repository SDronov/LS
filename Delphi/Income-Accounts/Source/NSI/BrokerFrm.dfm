inherited BrokerForm: TBrokerForm
  Left = 329
  Top = 274
  Width = 878
  Height = 445
  Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 862
    Height = 407
    ClientRectBottom = 383
    ClientRectRight = 862
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 40
          Height = 18
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 862
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 352
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 380
        Width = 862
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 859
        Height = 352
      end
      inherited lcMain: TdxLayoutControl
        Width = 856
        Height = 352
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 84
        end
        inherited edtINN: TcxDBMaskEdit
          Top = 34
        end
        inherited edtAddress: TcxDBTextEdit
          Top = 109
        end
        inherited edtPhone: TcxDBTextEdit
          Top = 134
        end
        inherited edtFax: TcxDBTextEdit
          Top = 134
        end
        inherited edtTelex: TcxDBTextEdit
          Top = 159
        end
        inherited edtSOATO: TcxDBMaskEdit
          Top = 34
        end
        inherited edtTeletype: TcxDBTextEdit
          Top = 159
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 59
        end
        object edLicenseNo: TcxDBTextEdit [11]
          Left = 243
          Top = 215
          DataBinding.DataField = 'BKTLIC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 14
          Width = 122
        end
        object cxDBDateEdit2: TcxDBDateEdit [12]
          Left = 243
          Top = 240
          DataBinding.DataField = 'BEG_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 15
          Width = 121
        end
        object cxDBDateEdit1: TcxDBDateEdit [13]
          Left = 562
          Top = 240
          DataBinding.DataField = 'END_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 16
          Width = 122
        end
        object edtReestrNo: TcxDBTextEdit [14]
          Left = 243
          Top = 290
          DataBinding.DataField = 'REESTR_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 17
          Width = 122
        end
        object cxDBTextEdit4: TcxDBTextEdit [15]
          Left = 243
          Top = 265
          Hint = 
            #1050#1086#1083'-'#1074#1086' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074' ('#1074#1089#1077#1075#1086' '#1087#1086' '#1083#1080#1094#1077#1085#1079#1080#1080') '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1092#1086#1088#1084#1083#1077#1085#1080 +
            #1102' I '#1082#1072#1090#1077#1075#1086#1088#1080#1080
          DataBinding.DataField = 'BSKOLTOI'
          DataBinding.DataSource = srcData
          ParentFont = False
          ParentShowHint = False
          Properties.OnChange = Modify
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 18
          Width = 121
        end
        object cxDBTextEdit3: TcxDBTextEdit [16]
          Left = 562
          Top = 265
          Hint = 
            #1050#1086#1083'-'#1074#1086' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074' ('#1074#1089#1077#1075#1086' '#1087#1086' '#1083#1080#1094#1077#1085#1079#1080#1080') '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1092#1086#1088#1084#1083#1077#1085#1080 +
            #1102' II '#1082#1072#1090#1077#1075#1086#1088#1080#1080
          DataBinding.DataField = 'BSKOLTOII'
          DataBinding.DataSource = srcData
          ParentFont = False
          ParentShowHint = False
          Properties.OnChange = Modify
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 120
        end
        inherited edtTeleGraph: TcxDBTextEdit
          Top = 159
        end
        object cxDBTextEdit2: TcxDBTextEdit [18]
          Left = 562
          Top = 215
          Hint = 
            #1050#1086#1083'-'#1074#1086' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074' ('#1074#1089#1077#1075#1086' '#1087#1086' '#1083#1080#1094#1077#1085#1079#1080#1080') '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1092#1086#1088#1084#1083#1077#1085#1080 +
            #1102' I '#1082#1072#1090#1077#1075#1086#1088#1080#1080
          DataBinding.DataField = 'BNPPLIC'
          DataBinding.DataSource = srcData
          ParentFont = False
          ParentShowHint = False
          Properties.OnChange = Modify
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 21
          Width = 122
        end
        inherited dxLayoutGroup3s: TdxLayoutGroup
          inherited dxLayoutGroup2s: TdxLayoutGroup
            inherited lcMainGroup1s: TdxLayoutGroup
              inherited lcMainGroup3s: TdxLayoutGroup
                inherited lcMainGroup4s: TdxLayoutGroup
                  inherited lcGeneralItem2: TdxLayoutItem
                    Tag = 33
                  end
                  inherited lcGeneralItem11: TdxLayoutItem
                    Tag = 33
                  end
                end
              end
              object lcMainGroup1: TdxLayoutGroup
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1051#1080#1094#1077#1085#1079#1080#1103'/'#1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
                object lcMainGroup4: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainItem1: TdxLayoutItem
                    Tag = 33
                    AutoAligns = [aaVertical]
                    Caption = #8470' '#1083#1080#1094#1077#1085#1079#1080#1080'/'#8470' '#1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edLicenseNo
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem7: TdxLayoutItem
                    Tag = 33
                    Caption = #8470' '#1083#1080#1094#1077#1085#1079#1080#1080'/'#1055#1088#1080#1079#1085#1072#1082' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = cxDBTextEdit2
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainGroup2: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainGroup3: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    ShowBorder = False
                    object lcMainItem2: TdxLayoutItem
                      Tag = 33
                      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = cxDBDateEdit2
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem5: TdxLayoutItem
                      Tag = 33
                      Caption = #1050#1086#1083'-'#1074#1086' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074' I '#1082#1072#1090#1077#1075#1086#1088#1080#1080
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = cxDBTextEdit4
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem4: TdxLayoutItem
                      Tag = 33
                      Caption = #8470' '#1074' '#1088#1077#1077#1089#1090#1088#1077' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1077#1081
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = edtReestrNo
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lcMainGroup5: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    ShowBorder = False
                    object lcMainItem3: TdxLayoutItem
                      Tag = 33
                      AutoAligns = [aaVertical]
                      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = cxDBDateEdit1
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem6: TdxLayoutItem
                      Tag = 33
                      Caption = 'II '#1082#1072#1090#1077#1075#1086#1088#1080#1080
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = cxDBTextEdit3
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end
        end
        object TdxLayoutItem [20]
        end
        object TdxLayoutItem [21]
        end
      end
    end
    inherited tabDocList: TcxTabSheet
      inherited pcDocList: TcxPageControl
        Width = 714
        Height = 444
        ClientRectBottom = 440
        ClientRectRight = 710
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 862
        Height = 383
        ClientRectBottom = 359
        ClientRectRight = 862
      end
    end
    object tabContracts: TcxTabSheet [3]
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      ImageIndex = 4
      OnShow = tabContractsShow
    end
    inherited tabBroker: TcxTabSheet
      Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1103
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    object aSetTypeDeclarant: TAction
      Caption = 'aSetTypeDeclarant'
      Enabled = False
      OnExecute = aSetTypeDeclarantExecute
      OnUpdate = aSetTypeDeclarantUpdate
    end
    object aSetTypePerson: TAction
      Caption = #1060#1080#1079'. '#1083#1080#1094#1086
      Enabled = False
      Visible = False
      OnExecute = aSetTypePersonExecute
      OnUpdate = aSetTypeDeclarantUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
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
        FloatLeft = 24
        FloatTop = 121
        FloatClientWidth = 103
        FloatClientHeight = 69
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
          end
          item
            Item = dxBarSubItem1
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
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton2
          Visible = True
        end
        item
          Item = dxBarButton3
          Visible = True
        end>
    end
    object dxBarButton2: TdxBarButton
      Action = aSetTypeDeclarant
      Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aSetTypePerson
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
        SourceField = dsDataBR_ID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_broker_Lst b'
      ' where b.ID = :ID'
      'and b.native_broker = '#39'Y'#39)
    SourceServerObject = 'FDC_BROKER_LST'
    AfterRefresh = dsDataAfterOpen
    object dsDataLICENSE_NO: TStringField
      DisplayLabel = #8470' '#1083#1080#1094#1077#1085#1079#1080#1080
      FieldName = 'LICENSE_NO'
      Size = 30
    end
    object dsDataBEG_DATE: TDateTimeField
      FieldName = 'BEG_DATE'
      Required = True
    end
    object dsDataEND_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1088#1086#1082#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'END_DATE'
    end
    object dsDataBSKOLTOI: TFloatField
      FieldName = 'BSKOLTOI'
    end
    object dsDataBSKOLTOII: TFloatField
      FieldName = 'BSKOLTOII'
    end
    object dsDataREESTR_NO: TStringField
      FieldName = 'REESTR_NO'
      Required = True
      Size = 30
    end
    object dsDataBR_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataBNPPLIC: TFloatField
      FieldName = 'BNPPLIC'
    end
    object dsDataBKTLIC: TStringField
      FieldName = 'BKTLIC'
      Size = 30
    end
    object dsDataST: TStringField
      FieldName = 'ST'
      Size = 2
    end
    object dsDataADROWN: TStringField
      FieldName = 'ADROWN'
      Size = 255
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_BROKER_Add('
      ':Name,'
      ':BktLic,'
      ':Beg_Date,'
      ':End_Date,'
      ':Address,'
      ':OKPO,'
      ':INN,'
      ':OGRN,'
      ':SOATO,'
      ':KPP,'
      ':Phone,'
      ':Fax,'
      ':Telex,'
      ':Teletype,'
      ':BskoltoI,'
      ':BskoltoII,'
      ':REESTR_NO,'
      ':BNPPLIC,'
      ':SUBJECT_ID,'
      ':ST,'
      ':ADROWN);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BKTLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Beg_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'End_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoII'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REESTR_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BNPPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADROWN'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_broker_upd(pid          => :ID,'
      '                 pname        => :Name,'
      '                 plicenceno   => :BktLic,'
      '                 pbegdate     => :Beg_Date,'
      '                 penddate     => :End_Date,'
      '                 paddress     => :Address,'
      '                 pokpo        => :OKPO,'
      '                 pinn         => :INN,'
      '                 pogrn        => :OGRN,'
      '                 psoato       => :SOATO,'
      '                 pkpp         => :KPP,'
      '                 pphone       => :Phone,'
      '                 pfax         => :Fax,'
      '                 ptelex       => :Telex,'
      '                 pteletype    => :Teletype,'
      '                 pbskoltoi    => :BskoltoI,'
      '                 pbskoltoii   => :BskoltoII,'
      '                 psubjectid   => :SUBJECT_ID,'
      '                 preestrno    => :REESTR_NO,'
      '                 pBnppLic     => :BNPPLIC,'
      '                 pSt          => :ST,'
      '                 pAdrOwn      => :ADROWN);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BktLic'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Beg_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'End_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoII'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REESTR_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BNPPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADROWN'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 43
    Top = 204
    object sqlSetType: TsqlOp
      SQL.Strings = (
        'declare'
        
          '  lv_P_TypeId NUMBER := fdc_object_type_get_bysysname(pSysName =' +
          '> '#39'Person'#39');'
        
          '  lv_D_TypeId NUMBER := fdc_object_type_get_bysysname(pSysName =' +
          '> '#39'Declarant'#39');'
        '  lv_Inn  fdc_subject.inn%type;'
        '  lv_Kpp  fdc_subject.kpp%type;'
        '  lv_Name fdc_subject_lst.Name%type;'
        '  lv_TypeId   number;'
        '  '
        'begin'
        '  '
        '  select inn,kpp,name into lv_Inn,lv_Kpp,lv_Name '
        '  from fdc_subject_lst s'
        '  where s.id = :pSubId;'
        '  '
        '  if :pType = '#39'Declarant'#39' Then'
        '     if lv_Inn is null then'
        
          '        fdc_util.Abort(pMessage    => '#39'<<'#1048#1053#1053' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1079#1072#1087#1086#1083#1085#1077 +
          #1085'!!!>>'#39');'
        '     end if;   '
        '     if lv_Kpp is null then'
        
          '        fdc_util.Abort(pMessage    => '#39'<<K'#1055#1055' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1079#1072#1087#1086#1083#1085#1077 +
          #1085'!!!>>'#39');'
        '     end if;   '
        '     if length(lv_Inn) <> 10 then'
        
          '        fdc_util.Abort(pMessage    => '#39'<<'#1048#1053#1053' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 10 '#1089#1080#1084#1074 +
          #1086#1083#1086#1074'!!!>>'#39');'
        '     end if;'
        '     if length(lv_kpp) <> 9 then'
        
          '        fdc_util.Abort(pMessage    => '#39'<<'#1050#1055#1055' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 9 '#1089#1080#1084#1074#1086 +
          #1083#1086#1074'!!!>>'#39');'
        '     end if;'
        '     insert into fdc_declarant(id) values (:pSubId);'
        '     lv_TypeId := lv_D_TypeId;'
        '  end if;'
        ''
        '  if :pType = '#39'Person'#39' Then'
        '     if length(lv_Inn) <> 12 and lv_Inn is not null then'
        
          '       fdc_util.Abort(pMessage    => '#39'<<'#1048#1053#1053' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' 12 '#1089#1080#1084#1074#1086 +
          #1083#1086#1074' '#1083#1080#1073#1086' '#1085#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1099#1084'!!!>>'#39');'
        '     end if;'
        '        '
        '     if lv_Kpp is not null then'
        
          '       fdc_util.Abort(pMessage    => '#39'<<'#1050#1055#1055' '#1076#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1085#1077' '#1079#1072#1087#1086#1083 +
          #1085#1077#1085#1099#1084'!!!>>'#39');'
        '     end if;'
        ''
        
          '     insert into fdc_person(id,last_name) values (:pSubId,lv_Nam' +
          'e);'
        '     lv_TypeId := lv_P_TypeId;'
        '   end if;         '
        '   '
        '   update fdc_object o'
        '     set o.object_type_id = lv_TypeId'
        '        ,o.ext_typesysname= :pType'
        '   where id = :pSubId;'
        'end;')
    end
    object sqlGetType: TsqlOp
      SQL.Strings = (
        'begin'
        '  if :pSubId is not null then'
        '   :result := fdc_object_get_typesysname(pID => :pSubId);'
        '  else'
        '   :result := '#39#39';'
        '  end if;'
        'end;')
    end
  end
end
