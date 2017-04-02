inherited DeclarantChecksForm: TDeclarantChecksForm
  Left = 519
  Top = 169
  Width = 898
  Height = 801
  Caption = #1055#1088#1086#1074#1077#1088#1082#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 882
    Height = 763
    ClientRectBottom = 739
    ClientRectRight = 882
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 876
        Height = 708
        inherited edtName: TcxDBTextEdit
          Left = 118
        end
        inherited edtDescript: TcxDBMemo
          Left = 118
          Top = 810
          TabOrder = 7
        end
        object edtreqContent: TcxDBMemo [2]
          Left = 118
          Top = 474
          DataBinding.DataField = 'REQCONT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ScrollBars = ssVertical
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Height = 162
          Width = 749
        end
        object edtansContent: TcxDBMemo [3]
          Left = 118
          Top = 642
          DataBinding.DataField = 'ANSCONT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ScrollBars = ssVertical
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Height = 162
          Width = 749
        end
        object edtcheckNumber: TcxDBTextEdit [4]
          Left = 118
          Top = 447
          DataBinding.DataField = 'CHECKNUMB'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object edtCheckDate: TcxDBDateEdit [5]
          Left = 273
          Top = 447
          DataBinding.DataField = 'CHECKDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 200
        end
        object cmbxChecktype: TfdcObjectLookupEdit [6]
          Left = 118
          Top = 36
          DataBinding.DataField = 'nCHECKTYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              MinWidth = 250
              FieldName = 'sDESCRIPTION'
            end>
          Properties.ListOptions.ColumnSorting = False
          Properties.ListSource = srcChecktype
          Properties.MaxLength = 250
          Properties.OnChange = cmbxChecktypePropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 145
        end
        object grdParams: TcxGrid [7]
          Left = 118
          Top = 63
          Width = 699
          Height = 378
          BevelEdges = [beLeft, beTop]
          TabOrder = 2
          object grdParamsDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcCheckTypeParams
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object colName: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'sDESCRIPTION'
              Options.Editing = False
              Options.SortByDisplayText = isbtOff
              Options.Sorting = False
              Width = 319
            end
            object colType: TcxGridDBColumn
              DataBinding.FieldName = 'TYPE'
              Visible = False
              Options.Editing = False
            end
            object colValue: TcxGridDBColumn
              Caption = #1047#1085#1072#1095#1077#1085#1080#1077
              DataBinding.FieldName = 'VALUE'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.MaxLength = 250
              BestFitMaxWidth = 30
              MinWidth = 60
              Options.SortByDisplayText = isbtOff
              Options.Sorting = False
              Width = 378
            end
          end
          object grdParamsLevel1: TcxGridLevel
            GridView = grdParamsDBTableView1
          end
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              Caption = #1058#1080#1087' '#1087#1088#1086#1074#1077#1088#1082#1080
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxChecktype
              ControlOptions.ShowBorder = False
            end
            object lciParamsGrid: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
              CaptionOptions.AlignHorz = taRightJustify
              Control = grdParams
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciCheckNumber: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtcheckNumber
                ControlOptions.ShowBorder = False
              end
              object lcicheckDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtCheckDate
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcireqContent: TdxLayoutItem [2]
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtreqContent
            ControlOptions.ShowBorder = False
          end
          object lciAnsContent: TdxLayoutItem [3]
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtansContent
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 882
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 708
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 736
        Width = 882
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 879
        Height = 708
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 882
        Height = 739
        ClientRectBottom = 715
        ClientRectRight = 882
      end
    end
  end
  inherited ActionList: TActionList
    Left = 792
    Top = 379
    inherited actDelete: TAction
      Visible = False
    end
    inherited actCreateActCorrOB: TAction
      Visible = False
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 676
    Top = 387
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 596
    Top = 387
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 648
    Top = 419
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 540
    Top = 387
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 568
    Top = 387
  end
  inherited imglAction: TImageList
    Left = 796
    Top = 411
  end
  inherited imglLarge: TImageList
    Left = 768
    Top = 411
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
        FloatLeft = 876
        FloatTop = 472
        FloatClientWidth = 113
        FloatClientHeight = 82
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
    Left = 632
    Top = 387
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
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    Left = 584
    Top = 31
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from v_asbc_checks_lst'
      ' where ID = :ID')
    Left = 620
    Top = 31
    object dsDataCHECKDATE: TDateTimeField
      FieldName = 'CHECKDATE'
    end
    object dsDataREQCONT: TStringField
      DisplayWidth = 500
      FieldName = 'REQCONT'
      Size = 500
    end
    object dsDataNSTATUS: TIntegerField
      FieldName = 'NSTATUS'
    end
    object dsDataANSDATE: TDateTimeField
      FieldName = 'ANSDATE'
    end
    object dsDataANSCONT: TStringField
      DisplayWidth = 500
      FieldName = 'ANSCONT'
      Size = 240
    end
    object dsDataCHECKNUMB: TIntegerField
      FieldName = 'CHECKNUMB'
    end
    object dsDataSUBJECT_ID: TIntegerField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataDOCUMENT_ID: TIntegerField
      FieldName = 'DOCUMENT_ID'
    end
    object dsDataSCHECKTYPE: TStringField
      FieldName = 'SCHECKTYPE'
    end
    object dsDatanCHECKTYPE: TIntegerField
      FieldName = 'nCHECKTYPE'
    end
  end
  inherited srcData: TDataSource
    Left = 724
    Top = 27
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= PKG_ASBC_CHECKS.Add(nChecktype => :NCHECKTYPE,'
      
        '                                                     nSubjectId ' +
        '=> :SUBJECT_ID,'
      
        '                                                     nDocumentId' +
        ' => :Document_ID,'
      
        '                                                     nRaiseParam' +
        'sError => 1);'
      'end;')
    Left = 656
    Top = 23
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NCHECKTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Document_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Left = 700
    Top = 23
  end
  inherited srcTransit: TDataSource
    Left = 636
    Top = 443
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 728
    Top = 423
  end
  inherited dsUpdateState: TfdcQuery
    Left = 528
    Top = 31
  end
  inherited srcState: TDataSource
    Left = 680
    Top = 443
  end
  inherited dsTransit: TfdcQuery
    Left = 556
    Top = 31
  end
  inherited dsState: TfdcQuery
    Left = 776
    Top = 23
  end
  inherited srcAccessLevel: TDataSource
    Left = 764
    Top = 443
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 500
    Top = 31
  end
  object dsChecktype: TOracleDataSet
    SQL.Strings = (
      'select t.id, t.name sDESCRIPTION'
      'from ASBC_CHECKTYPES t'
      'order by t.id')
    Session = MainData.Session
    Left = 603
    Top = 428
    object dsChecktypeID: TFloatField
      FieldName = 'ID'
    end
    object dsChecktypesDESCRIPTION: TStringField
      DisplayWidth = 250
      FieldName = 'sDESCRIPTION'
      Size = 250
    end
  end
  object srcChecktype: TDataSource
    DataSet = dsChecktype
    Left = 571
    Top = 428
  end
  object srcCheckTypeParams: TDataSource
    DataSet = dsCheckTypeParamsQ
    Left = 67
    Top = 180
  end
  object dsCheckTypeParamsQ: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoCalcFields = False
    ReadOnly = False
    SQL.Strings = (
      'select t.display_name as SDESCRIPTION,'
      '        t.name as sname,'
      '       t.type as type,'
      '       '#39#39' as value'
      '  from ASBC_CHECKTYPEPARAMS t'
      '    where t.prn = :PRN'
      
        '     and (t.subject_type = :NSUBJECT_TYPE or t.subject_type is n' +
        'ull )'
      '    order by t.norder')
    Left = 43
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NSUBJECT_TYPE'
        ParamType = ptUnknown
      end>
    object dsCheckTypeParamsQsDESCRIPTION: TStringField
      FieldName = 'sDESCRIPTION'
      Size = 100
    end
    object dsCheckTypeParamsQTYPE: TIntegerField
      FieldName = 'TYPE'
    end
    object dsCheckTypeParamsQVALUE: TStringField
      DisplayWidth = 250
      FieldName = 'VALUE'
      Size = 250
    end
    object dsCheckTypeParamsQSNAME: TStringField
      FieldName = 'SNAME'
      Size = 50
    end
  end
  object dsDeclarantData: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  pkg_asbc_checks.getsubjectdata(nid => :id,'
      '                                 ntype => :ntype,'
      '                                 inn => :inn,'
      '                                 kpp => :kpp,'
      '                                 surname => :surname,'
      '                                 name => :name,'
      '                                 middlename => :middlename,'
      
        '                                 passportseria => :passportseria' +
        ','
      
        '                                 passportnumber => :passportnumb' +
        'er,'
      '                                 passportdate => :passportdate,'
      
        '                                 passportorganizationname => :pa' +
        'ssportorganizationname,'
      
        '                                 passportorganizationcode => :pa' +
        'ssportorganizationcode,'
      '                                 ogrn => :ogrn,'
      '                                 birthdate => :birthdate,'
      '                                 accountnum => :accountnum,'
      '                                 bik => :bik);'
      'end;')
    Left = 3
    Top = 28
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ntype'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'surname'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'middlename'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'passportseria'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'passportnumber'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'passportdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'passportorganizationname'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'passportorganizationcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ogrn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'birthdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'accountnum'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'bik'
        ParamType = ptUnknown
      end>
  end
  object dsPullParams: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  pkg_asbc_checks.putparamvalue(sparamname => :sparamname,'
      '                                sparamvalue => :sparamvalue);'
      'end;')
    Left = 3
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'sparamname'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sparamvalue'
        ParamType = ptUnknown
      end>
  end
  object dsgetSubjectID: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'declare'
      'begin'
      'PKG_ASBC_CHECKS.getSubject(:nID);'
      'end;')
    Left = 11
    Top = 132
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nID'
        ParamType = ptUnknown
        Size = 17
      end>
  end
end
