inherited BPLicenceBrokerForm: TBPLicenceBrokerForm
  Left = 321
  Top = 242
  Width = 474
  Height = 316
  Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' '#1074' '#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1080' '#1050#1053#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 458
    Height = 278
    ClientRectBottom = 254
    ClientRectRight = 458
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 452
        Height = 223
        inherited edtName: TcxDBTextEdit
          Top = 180
          AutoSize = False
          TabOrder = 5
          Height = 1
        end
        inherited edtDescript: TcxDBMemo
          Top = 200
          TabOrder = 6
          Height = 1
        end
        object edtDeclName: TfdcObjectLinkEdit [2]
          Left = 96
          Top = 67
          DataBinding.DataField = 'BROK_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BROKER_ID'
          DataBinding.TypeSysName = 'Declarant;Subject'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          OnBeforeAcceptObject = edtDeclNameBeforeAcceptObject
          Width = 343
        end
        object edtDeclINN: TcxDBMaskEdit [3]
          Left = 96
          Top = 40
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          Width = 167
        end
        object edtDeclKPP: TcxDBMaskEdit [4]
          Tag = 13
          Left = 287
          Top = 40
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Width = 147
        end
        object edtBeginDate: TcxDBDateEdit [5]
          Left = 96
          Top = 138
          DataBinding.DataField = 'FROM_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 190
        end
        object edtEndDate: TcxDBDateEdit [6]
          Left = 284
          Top = 138
          DataBinding.DataField = 'TO_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 167
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcgBroker: TdxLayoutGroup [0]
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclINN: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lciKPP: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclName: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDeclName
              ControlOptions.ShowBorder = False
            end
          end
          object lcgPeriod: TdxLayoutGroup [1]
            Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
            LayoutDirection = ldHorizontal
            object lciFrom: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1089': '
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtBeginDate
              ControlOptions.ShowBorder = False
            end
            object lciTo: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1087#1086': '
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtEndDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avBottom
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AlignVert = avBottom
            Visible = False
            ControlOptions.MinHeight = 1
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 458
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 223
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 251
        Width = 458
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 455
        Height = 223
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 458
        Height = 254
        ClientRectBottom = 230
        ClientRectRight = 458
      end
    end
  end
  inherited ActionList: TActionList
    Left = 152
    Top = 91
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 236
    Top = 91
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 348
    Top = 91
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 376
    Top = 91
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 292
    Top = 91
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 320
    Top = 91
  end
  inherited imglAction: TImageList
    Left = 180
    Top = 91
  end
  inherited imglLarge: TImageList
    Left = 208
    Top = 91
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
        FloatClientWidth = 103
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
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
    Left = 264
    Top = 91
    DockControlHeights = (
      0
      0
      0
      0)
    inherited btnStateTransit: TdxBarSubItem
      Visible = ivNever
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 152
    Top = 119
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*, t.name as brok_name'
      '  from fdc_bp_licence_broker_lst t'
      ' where t.broker_id = :id'
      '   and t.licence_id = :licence_id')
    SourceServerObject = 'FDC_BP_LICENCE_BROKER_LST'
    Left = 180
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'licence_id'
        ParamType = ptInput
      end>
    inherited dsDataID: TFloatField
      DisplayLabel = #1041#1088#1086#1082#1077#1088
    end
    inherited dsDataNAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1086#1073#1098#1077#1082#1090#1072
    end
    object dsDataFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataBROKER_ID: TFloatField
      DisplayLabel = #1041#1088#1086#1082#1077#1088
      FieldName = 'BROKER_ID'
      Required = True
    end
    object dsDataFROM_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'FROM_DATE'
      Required = True
    end
    object dsDataTO_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'TO_DATE'
      Required = True
    end
    object dsDataBROK_NAME: TStringField
      FieldName = 'BROK_NAME'
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Left = 204
    Top = 195
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'BEGIN'
      '  :ID ::= :BROKER_ID; -- '#1073#1077#1079' '#1087#1072#1088#1072#1084#1077#1090#1088#1072' ID '#1088#1072#1081#1079#1080#1090#1089#1103' '#1086#1096#1080#1073#1082#1072
      '  fdc_bp_licence_broker_add(plicenceid => :LICENCE_ID'
      '                           ,pbrokerid  => :BROKER_ID'
      '                           ,pFromDate  => :FROM_DATE'
      '                           ,pToDate    => :TO_DATE);'
      'END;'
      '')
    Left = 208
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BROKER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LICENCE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BROKER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'BEGIN'
      '  -- Call the procedure'
      '  fdc_bp_licence_broker_upd(plicenceid => :LICENCE_ID'
      '                           ,pbrokerid  => :ID'
      '                           ,pFromDate  => :FROM_DATE'
      '                           ,pToDate    => :TO_DATE);'
      'END;'
      '')
    Left = 236
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'LICENCE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 316
    Top = 195
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 376
    Top = 119
  end
  inherited dsUpdateState: TfdcQuery
    Left = 320
    Top = 119
  end
  inherited srcState: TDataSource
    Left = 288
    Top = 195
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where 1 = 2'
      ' and State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )')
    Left = 292
    Top = 119
  end
  inherited dsState: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Lst_By_Object'
      ' where 1 = 2'
      ' and Object_ID = :ID')
    Left = 264
    Top = 119
  end
  inherited srcAccessLevel: TDataSource
    Left = 372
    Top = 195
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 348
    Top = 119
  end
end
