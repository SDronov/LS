object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 113
    Top = 0
    Height = 453
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 453
    Align = alLeft
    BevelOuter = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 111
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Color = 14737632
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ListView1: TListView
      Left = 1
      Top = 21
      Width = 111
      Height = 431
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsNone
      Columns = <>
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 116
    Top = 0
    Width = 572
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 0
      Top = 112
      Width = 572
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 572
      Height = 112
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 570
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        Caption = #1059#1089#1083#1086#1074#1080#1103
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 115
      Width = 572
      Height = 338
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 570
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        Caption = #1058#1072#1073#1083#1080#1094#1072
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cxTabControl1: TcxTabControl
        Left = 120
        Top = 56
        Width = 289
        Height = 193
        TabOrder = 1
        ClientRectBottom = 193
        ClientRectRight = 289
        ClientRectTop = 0
      end
    end
  end
  object DataSource1: TDataSource
    Left = 261
    Top = 223
  end
end
