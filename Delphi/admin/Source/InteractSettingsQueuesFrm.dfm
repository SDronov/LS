inherited InteractSettingsQueuesForm: TInteractSettingsQueuesForm
  Left = 770
  Top = 338
  Width = 554
  Height = 380
  Caption = #1054#1095#1077#1088#1077#1076#1080' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103' ('#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077')'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 546
    Height = 353
    ClientRectBottom = 329
    ClientRectRight = 546
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 540
        Height = 300
        inherited edtName: TcxDBTextEdit
          Left = 107
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 107
          Top = 252
          TabOrder = 9
          Height = 89
          Width = 185
        end
        object edtMANAGER: TcxDBTextEdit [2]
          Left = 107
          Top = 90
          DataBinding.DataField = 'MANAGER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 424
        end
        object edtHOST: TcxDBTextEdit [3]
          Left = 107
          Top = 117
          DataBinding.DataField = 'HOST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 424
        end
        object edtPORT: TcxDBTextEdit [4]
          Left = 107
          Top = 144
          DataBinding.DataField = 'PORT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 424
        end
        object edtCCSID: TcxDBTextEdit [5]
          Left = 107
          Top = 225
          DataBinding.DataField = 'CCSID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 424
        end
        object edtQUEUE: TcxDBTextEdit [6]
          Left = 107
          Top = 198
          DataBinding.DataField = 'QUEUE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 424
        end
        object edtCHANNEL: TcxDBTextEdit [7]
          Left = 107
          Top = 171
          DataBinding.DataField = 'CHANNEL'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 424
        end
        object edtTYPE: TcxDBComboBox [8]
          Left = 107
          Top = 63
          DataBinding.DataField = 'TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1042#1093#1086#1076#1103#1097#1072#1103
            #1048#1089#1093#1086#1076#1103#1097#1072#1103)
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 424
        end
        object cmbxCustcode: TcxDBLookupComboBox [9]
          Left = 107
          Top = 36
          DataBinding.DataField = 'CUSTCODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'CUSTOMS_CODE_8'
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              MinWidth = 60
              FieldName = 'CUSTOMS_CODE_8'
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              FieldName = 'NAME'
            end>
          Properties.ListSource = srcCustoms
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
          TabOrder = 1
          Width = 424
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          object lciCustCodeEdit: TdxLayoutItem [1]
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxCustcode
            ControlOptions.ShowBorder = False
          end
          object lciTypeEdit: TdxLayoutItem [2]
            Caption = #1058#1080#1087
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtTYPE
            ControlOptions.ShowBorder = False
          end
          object lciManagerEdit: TdxLayoutItem [3]
            Caption = #1052#1077#1085#1077#1076#1078#1077#1088
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtMANAGER
            ControlOptions.ShowBorder = False
          end
          object lciHostEdit: TdxLayoutItem [4]
            Caption = #1061#1086#1089#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtHOST
            ControlOptions.ShowBorder = False
          end
          object lciPortEdit: TdxLayoutItem [5]
            Caption = #1055#1086#1088#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtPORT
            ControlOptions.ShowBorder = False
          end
          object lciChannelEdit: TdxLayoutItem [6]
            Caption = #1050#1072#1085#1072#1083
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCHANNEL
            ControlOptions.ShowBorder = False
          end
          object lciQueueEdit: TdxLayoutItem [7]
            Caption = #1054#1095#1077#1088#1077#1076#1100
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtQUEUE
            ControlOptions.ShowBorder = False
          end
          object lciCCSIDEdit: TdxLayoutItem [8]
            Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCCSID
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 546
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 300
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 326
        Width = 546
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 543
        Height = 300
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 546
        Height = 329
        ClientRectBottom = 305
        ClientRectRight = 546
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from ASBC_INTERACTQUEUES_LST'
      ' where ID = :ID')
    SourceServerObject = 'ASBC_INTERACTQUEUES_LST'
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Required = True
    end
    object dsDataOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 1000
    end
    object dsDataCUSTCODE: TStringField
      FieldName = 'CUSTCODE'
      Size = 8
    end
    object dsDataTYPE: TStringField
      FieldName = 'TYPE'
      Required = True
    end
    object dsDataNTYPE: TIntegerField
      FieldName = 'NTYPE'
      Required = True
    end
    object dsDataMANAGER: TStringField
      FieldName = 'MANAGER'
      Required = True
      Size = 30
    end
    object dsDataHOST: TStringField
      FieldName = 'HOST'
      Size = 30
    end
    object dsDataPORT: TStringField
      FieldName = 'PORT'
      Size = 10
    end
    object dsDataCHANNEL: TStringField
      FieldName = 'CHANNEL'
      Size = 30
    end
    object dsDataQUEUE: TStringField
      FieldName = 'QUEUE'
      Required = True
      Size = 30
    end
    object dsDataCCSID: TIntegerField
      FieldName = 'CCSID'
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_asbc_interactqueues.add(pname            => :name,'
      
        '                                    powner_object_id => :owner_o' +
        'bject_id,'
      
        '                                    pcustcode        => :custcod' +
        'e,'
      '                                    ptype       => :ntype,'
      
        '                                    pmanager         => :manager' +
        ','
      '                                    phost            => :host,'
      '                                    pport            => :port,'
      
        '                                    pchannel         => :channel' +
        ','
      '                                    pqueue           => :queue,'
      '                                    pccsid           => :ccsid,'
      
        '                                    pdescript        => :descrip' +
        't);'
      'end;')
    SourceServerObject = 'p_asbc_interactqueues'
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
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'custcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ntype'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'host'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'port'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'channel'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'queue'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ccsid'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_asbc_interactqueues.modify(pdocid     => :ID,'
      '                               pname      => :name,'
      '                               pcustcode  => :custcode,'
      '                               ptype => :ntype,'
      '                               pmanager   => :manager,'
      '                               phost      => :host,'
      '                               pport      => :port,'
      '                               pchannel   => :channel,'
      '                               pqueue     => :queue,'
      '                               pccsid     => :ccsid,'
      '                               pdescript  => :descript);'
      'end;')
    SourceServerObject = 'p_asbc_interactqueues'
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
        Name = 'custcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ntype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'host'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'port'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'channel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'queue'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ccsid'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object dsCustoms: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select *'
      '  from fdc_customs_lst t'
      ' where (t.dt_start is null or t.dt_start <= sysdate)'
      '   and (t.dt_end is null or t.dt_end >= sysdate)'
      ' order by t.customs_code_8')
    SourceServerObject = 'FDC_CUSTOMS_LST'
    Left = 264
    Top = 176
    object dsCustomsID: TIntegerField
      FieldName = 'ID'
    end
    object dsCustomsCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsCustomsNAME: TStringField
      FieldName = 'NAME'
      Size = 1000
    end
  end
  object srcCustoms: TDataSource
    DataSet = dsCustoms
    Left = 272
    Top = 184
  end
end
