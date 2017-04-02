inherited DeclNoticeAdviceGridForm: TDeclNoticeAdviceGridForm
  Caption = 'DeclNoticeAdviceGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtDocDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtDocDateTo: TcxDateEdit
          Width = 121
        end
        inherited edtDocNumber: TcxMaskEdit
          Width = 121
        end
        inherited cbIsActive: TcxComboBox
          Width = 121
        end
        inherited edtActDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtActDateTo: TcxDateEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      object cbTypeDoc: TcxComboBox
        Left = 16
        Top = 119
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1042#1089#1105
          #1092#1072#1082#1090#1099' '#1091#1095#1105#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
          #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086#1073' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077)
        Properties.OnChange = cbTypeDocPropertiesChange
        Style.BorderStyle = ebsSingle
        Style.HotTrack = False
        Style.StyleController = OfficeEditStyleController
        Style.ButtonStyle = btsHotFlat
        Style.PopupBorderStyle = epbsSingle
        TabOrder = 1
        Text = #1042#1089#1105
        Visible = False
        Width = 289
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchOk: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchCancel: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearch: TAction
      Enabled = False
      Visible = False
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
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            Item = dcciTypeDoc
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
    object dcciTypeDoc: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbTypeDoc
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select doc.*'
      'from fdc_document_lst doc'
      'where :sign_type >= 0'
      '  and doc.id in ('
      '                 select v.owner_object_id'
      '                 from fdc_doc_charge_lst dc'
      '                     ,fdc_decl_charge d'
      '                     ,fdc_value_lst v'
      '                 where dc.id = :ID'
      '                   and dc.id = d.decl_id'
      '                   and d.id = v.ref_object_id'
      '                )'
      '  and ('
      
        '          (:sign_type = 0 and typesysname in ('#39'NoticePay'#39','#39'Advic' +
        'ePay'#39','#39'AdvicePayPeriodic'#39','#39'AdvicePayTPO'#39','#39'AdviceKNP'#39','#39'AdviceLevy' +
        #39')) '
      '          or'
      '          (:sign_type = 1 and typesysname in ('#39'NoticePay'#39'))'
      '          or'
      
        '          (:sign_type = 2 and typesysname in ('#39'AdvicePay'#39','#39'Advic' +
        'ePayPeriodic'#39','#39'AdvicePayTPO'#39','#39'AdviceKNP'#39','#39'AdviceLevy'#39'))'
      '         ) '
      '  and (rownum <= :MaxRecordCount)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sign_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sign_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
