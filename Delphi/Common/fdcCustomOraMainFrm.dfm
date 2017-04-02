inherited fdcCustomOraMainForm: TfdcCustomOraMainForm
  Left = 222
  Top = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer0
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer3
        Width = 20
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end>
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 420
    end
    object StatusBarContainer3: TdxStatusBarContainerControl
      Left = 423
      Top = 2
      Width = 22
      Height = 21
      object imgUser: TImage
        Left = 0
        Top = 0
        Width = 22
        Height = 21
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA07B
          4293713D8768387D60347358306A512C8C6B3A826436FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFB39363B08F5DECB96DEAB463E0AB5CD09F55C1944FB18748
          A17B4294713C8F6D3AFF00FFFF00FFFF00FFFF00FFFF00FFBA9E72EFC484EEC2
          7FEDBD76ECB96CA68148FF00FF916F3CBC904DAB8346A27C42FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFBFA57CF0C88CEFC585B49566FF00FFFF00FFA47E44
          D6A458896939FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A8
          81BEA37ABA9E72489BDEFF00FFAB8853A47F45FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF009BDA0092D44A9EE10080C80079C3
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00AC
          E572BDF563B2EE55A6E7479BE03A91D90079C3FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF1FB6E888CBFB80C8FB72BDF563B1ED54A5E6459ADF
          3A91D90079C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF319ECE2699
          CB1792C880C8FB72BEF562B1ED53A5E6459ADF007FC7FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF41A6D237A1CF2A9BCC1892C880C8FB71BDF561B0EC
          52A4E50086CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FACD546A8
          D33AA2D02A9BCC1691C70187C2007FBC0076B60070B1FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF5AB1D853AED649A9D33AA2D0289ACC1390C70086C1
          007EBB0077B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5CB2
          D853AED646A8D335A0CF2297CA0E8EC50085C0FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF59B1D74DABD43FA5D12E9DCD1C94C9
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        ShowHint = False
        Transparent = True
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
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True)
    DockControlHeights = (
      0
      0
      49
      0)
  end
end
