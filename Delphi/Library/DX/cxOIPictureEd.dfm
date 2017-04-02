object cxfmPictureEditor: TcxfmPictureEditor
  Left = 295
  Top = 158
  Width = 372
  Height = 353
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Picture Editor'
  Color = clBtnFace
  Constraints.MinHeight = 220
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0007EEE700000000074EEEEE00000000747EEEEE60000004447EEEEE66007400
    4470EEE776604474C47068F8776004474C70068F877000C7C4703068F870000C
    CC70BB3667000000CC70BB33370000003C70BB33300000003B80BB3330000000
    3BBBBB333000000038888883300000000388888830000000003000000000FE0F
    0000F8070000F0030000E0010000300000000000000080800000C0000000E001
    0000F0030000F0030000F0030000F0030000F0030000F8030000FC030000}
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 364
    Height = 287
    Align = alClient
    TabOrder = 0
    object pnlRight: TPanel
      Left = 273
      Top = 15
      Width = 89
      Height = 270
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnLoad: TcxButton
        Left = 6
        Top = 6
        Width = 79
        Height = 23
        Caption = '&Load...'
        TabOrder = 0
        OnClick = btnLoadClick
      end
      object btnSave: TcxButton
        Left = 6
        Top = 34
        Width = 79
        Height = 23
        Caption = '&Save...'
        TabOrder = 1
        OnClick = btnSaveClick
      end
      object btnCopy: TcxButton
        Left = 6
        Top = 62
        Width = 79
        Height = 23
        Caption = '&Copy'
        TabOrder = 2
        OnClick = btnCopyClick
      end
      object btnPaste: TcxButton
        Left = 6
        Top = 90
        Width = 79
        Height = 23
        Caption = '&Paste'
        TabOrder = 3
        OnClick = btnPasteClick
      end
      object btnClear: TcxButton
        Left = 6
        Top = 118
        Width = 79
        Height = 23
        Caption = 'C&lear'
        TabOrder = 4
        OnClick = btnClearClick
      end
    end
    object pnlClient: TPanel
      Left = 2
      Top = 15
      Width = 271
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 1
      object Panel3: TPanel
        Left = 6
        Top = 6
        Width = 259
        Height = 258
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 0
        object Image: TcxImage
          Left = 0
          Top = 0
          Width = 259
          Height = 258
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 287
    Width = 364
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object pnlBottomRight: TPanel
      Left = 164
      Top = 0
      Width = 200
      Height = 32
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object StatusBar1: TStatusBar
        Left = 0
        Top = 13
        Width = 200
        Height = 19
        Panels = <
          item
            Bevel = pbNone
            Width = 50
          end>
      end
      object btnCancel: TcxButton
        Left = 104
        Top = 7
        Width = 81
        Height = 22
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 0
      end
      object btnOk: TcxButton
        Left = 15
        Top = 7
        Width = 80
        Height = 22
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 1
      end
    end
  end
end
