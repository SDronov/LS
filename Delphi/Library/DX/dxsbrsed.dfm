object frmSideBarStoreEditor: TfrmSideBarStoreEditor
  Left = 306
  Top = 100
  Width = 554
  Height = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'SideBarStore Editor:'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 546
    Height = 117
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object LItemCaption: TLabel
      Left = 242
      Top = 23
      Width = 46
      Height = 16
      Caption = 'Caption'
    end
    object LLImage: TLabel
      Left = 4
      Top = 6
      Width = 76
      Height = 16
      Caption = 'Large Image'
    end
    object LSImage: TLabel
      Left = 132
      Top = 6
      Width = 75
      Height = 16
      Caption = 'Small Image'
    end
    object LItemHint: TLabel
      Left = 245
      Top = 57
      Width = 23
      Height = 16
      Caption = 'Hint'
    end
    object EItemCaption: TEdit
      Tag = 2
      Left = 326
      Top = 22
      Width = 218
      Height = 24
      TabOrder = 2
      OnExit = EItemCaptionExit
    end
    object BClose: TButton
      Left = 329
      Top = 86
      Width = 107
      Height = 26
      Caption = 'Close'
      TabOrder = 4
      OnClick = BCloseClick
    end
    object BHelp: TButton
      Left = 443
      Top = 86
      Width = 99
      Height = 26
      Caption = 'Help'
      TabOrder = 5
    end
    object SILImage: TdxSpinImage
      Left = 5
      Top = 23
      Width = 86
      Height = 67
      AutoSize = False
      BorderStyle = bsSingle
      DefaultImages = True
      ImageHAlign = hsiCenter
      ImageVAlign = vsiCenter
      Items = <>
      ItemIndex = -1
      ReadOnly = False
      Stretch = True
      UpDownAlign = udaRight
      UpDownOrientation = siVertical
      UpDownWidth = 16
      UseDblClick = True
      OnChange = SIImageChange
      ParentColor = True
      TabOrder = 0
    end
    object SISImage: TdxSpinImage
      Left = 132
      Top = 25
      Width = 86
      Height = 66
      AutoSize = False
      BorderStyle = bsSingle
      DefaultImages = True
      ImageHAlign = hsiCenter
      ImageVAlign = vsiCenter
      Items = <>
      ItemIndex = -1
      ReadOnly = False
      Stretch = True
      UpDownAlign = udaRight
      UpDownOrientation = siVertical
      UpDownWidth = 16
      UseDblClick = True
      OnChange = SISImageChange
      ParentColor = True
      TabOrder = 1
    end
    object EItemHint: TEdit
      Tag = 2
      Left = 327
      Top = 54
      Width = 216
      Height = 24
      TabOrder = 3
      OnExit = EItemHintExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 111
    Height = 223
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object ListBox: TListBox
      Left = 1
      Top = 1
      Width = 109
      Height = 221
      Align = alClient
      ItemHeight = 16
      TabOrder = 0
      OnClick = ListBoxClick
      OnDragOver = ListBoxDragOver
    end
  end
  object Panel3: TPanel
    Left = 111
    Top = 0
    Width = 435
    Height = 223
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 133
      Height = 223
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 0
      object GBGroups: TGroupBox
        Left = 0
        Top = 0
        Width = 133
        Height = 223
        Align = alClient
        Caption = 'Categories'
        TabOrder = 0
        object BGAdd: TButton
          Left = 6
          Top = 21
          Width = 118
          Height = 26
          Caption = 'Add ...'
          TabOrder = 0
          OnClick = BGAddClick
        end
        object BGInsert: TButton
          Left = 6
          Top = 49
          Width = 118
          Height = 26
          Caption = 'Insert ...'
          TabOrder = 1
          OnClick = BGInsertClick
        end
        object BGDelete: TButton
          Left = 6
          Top = 78
          Width = 118
          Height = 25
          Caption = 'Delete'
          TabOrder = 2
          OnClick = BGDeleteClick
        end
        object BGRename: TButton
          Left = 6
          Top = 106
          Width = 118
          Height = 26
          Caption = 'Rename ...'
          TabOrder = 3
          OnClick = BGRenameClick
        end
        object BGMoveUp: TButton
          Left = 7
          Top = 135
          Width = 116
          Height = 26
          Caption = 'Move Up'
          TabOrder = 4
          OnClick = BGMoveUpClick
        end
        object BGMoveDown: TButton
          Left = 7
          Top = 165
          Width = 116
          Height = 26
          Caption = 'Move Down'
          TabOrder = 5
          OnClick = BGMoveDownClick
        end
      end
    end
    object Panel5: TPanel
      Left = 294
      Top = 0
      Width = 141
      Height = 223
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Panel5'
      TabOrder = 2
      object GBItems: TGroupBox
        Left = 0
        Top = 0
        Width = 141
        Height = 223
        Align = alClient
        Caption = 'Items'
        TabOrder = 0
        object BIAdd: TButton
          Left = 6
          Top = 21
          Width = 129
          Height = 26
          Caption = 'Add'
          TabOrder = 0
          OnClick = BIAddClick
        end
        object BIDelete: TButton
          Left = 6
          Top = 49
          Width = 129
          Height = 26
          Caption = 'Delete'
          TabOrder = 1
          OnClick = BIDeleteClick
        end
        object BIClear: TButton
          Left = 6
          Top = 78
          Width = 129
          Height = 25
          Caption = 'Clear'
          TabOrder = 2
          OnClick = BIClearClick
        end
        object BIMoveUp: TButton
          Left = 7
          Top = 107
          Width = 127
          Height = 26
          Caption = 'Move Up'
          TabOrder = 3
          OnClick = BIMoveUpClick
        end
        object BIMoveDown: TButton
          Left = 9
          Top = 135
          Width = 126
          Height = 26
          Caption = 'Move Down'
          TabOrder = 4
          OnClick = BIMoveDownClick
        end
      end
    end
    object ImageListBox: TdxImageListBox
      Left = 133
      Top = 0
      Width = 161
      Height = 223
      Alignment = taLeftJustify
      ImageAlign = dxliLeft
      ItemHeight = 0
      MultiLines = True
      VertAlignment = tvaCenter
      Align = alClient
      DragMode = dmAutomatic
      TabOrder = 1
      OnClick = ImageListBoxClick
      OnDragOver = ImageListBoxDragOver
      OnEndDrag = ImageListBoxEndDrag
      SaveStrings = ()
    end
  end
end
