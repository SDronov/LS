inherited fdcCustomDlgForm: TfdcCustomDlgForm
  Left = 207
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '<'#1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1072#1083#1086#1075#1072'>'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 440
    Height = 321
    Align = alClient
    ParentBackground = True
    TabOrder = 0
    AutoContentSizes = [acsWidth, acsHeight]
    LookAndFeel = LayoutOfficeLookAndFeel
    object btnCancel: TcxButton
      Left = 356
      Top = 289
      Width = 75
      Height = 23
      Action = actCancel
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TcxButton
      Left = 275
      Top = 289
      Width = 75
      Height = 23
      Action = actOk
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Group8: TdxLayoutGroup
        AutoAligns = [aaHorizontal]
        AlignVert = avBottom
        Caption = 'New Group'
        ShowCaption = False
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item10: TdxLayoutItem
          AutoAligns = []
          AlignHorz = ahRight
          AlignVert = avBottom
          Caption = 'cxButton2'
          ShowCaption = False
          Control = btnOk
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item8: TdxLayoutItem
          AutoAligns = []
          AlignHorz = ahRight
          AlignVert = avBottom
          Caption = 'cxButton1'
          ShowCaption = False
          Control = btnCancel
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actOk: TAction
      Caption = #1054#1050
      Hint = 
        #1055#1088#1080#1084#1077#1085#1080#1090#1100'|'#1055#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1074#1085#1077#1089#1077#1085#1085#1099#1093' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1080' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1076#1080#1072#1083#1086#1075#1086#1074#1086#1075#1086' ' +
        #1086#1082#1085#1072
      ImageIndex = 0
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = 
        #1047#1072#1082#1088#1099#1090#1100'|'#1047#1072#1082#1088#1099#1090#1080#1077' '#1076#1080#1072#1083#1086#1075#1086#1074#1086#1075#1086' '#1086#1082#1085#1072' '#1073#1077#1079' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1074#1085#1077#1089#1077#1085#1085#1099#1093' '#1080#1079#1084#1077#1085 +
        #1077#1085#1080#1081
      ShortCut = 27
      OnExecute = actCancelExecute
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
end
