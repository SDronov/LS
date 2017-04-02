object cxfmStringsEditor: TcxfmStringsEditor
  Left = 370
  Top = 256
  Width = 420
  Height = 349
  ActiveControl = Memo1
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'String List Editor'
  Color = clBtnFace
  Constraints.MinHeight = 200
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
    000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000F0
    000000000F0000FFFFFFFFFFFF0000F000000000FF0000FFFFFFFFFFFF0000F0
    0000FFFFFF0000FFFFFFFFFFFF0000F00000000FFF0000FFFFFFFFFFFF0000F0
    00000000FF0000FFFFFFFFFFFF0000000000000000000000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 275
    Width = 412
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object pnlBottomRight: TPanel
      Left = 168
      Top = 0
      Width = 244
      Height = 40
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object StatusBar1: TStatusBar
        Left = 0
        Top = 21
        Width = 244
        Height = 19
        Panels = <
          item
            Alignment = taCenter
            Bevel = pbNone
            Width = 50
          end>
      end
      object btnOK: TcxButton
        Left = 64
        Top = 10
        Width = 81
        Height = 23
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TcxButton
        Left = 151
        Top = 10
        Width = 80
        Height = 23
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 275
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object GroupBox: TGroupBox
      Left = 5
      Top = 5
      Width = 402
      Height = 265
      Align = alClient
      TabOrder = 0
      object pnlClientTop: TPanel
        Left = 2
        Top = 15
        Width = 398
        Height = 19
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 1
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
      end
      object pnlClientClient: TPanel
        Left = 2
        Top = 34
        Width = 398
        Height = 229
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 1
        object Memo1: TcxMemo
          Left = 5
          Top = 5
          Width = 388
          Height = 219
          Align = alClient
          Lines.Strings = (
            'Memo1')
          Properties.OnChange = Memo1PropertiesChange
          TabOrder = 0
        end
      end
    end
  end
end
