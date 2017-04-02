inherited CDeclBaseGridForm: TCDeclBaseGridForm
  Left = 584
  Top = 410
  Width = 842
  Height = 550
  HelpContext = 4202
  Caption = #1057#1087#1080#1089#1086#1082' '#1043#1058#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 487
    Width = 826
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 523
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 523
      end
      inherited pnlProgress: TPanel
        Width = 523
        inherited lblProgress: TcxLabel
          Width = 523
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 733
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 484
    Width = 826
  end
  inherited pnlWorkspace: TPanel
    Width = 826
    Height = 456
    inherited splSearchCriteria: TSplitter
      Height = 456
    end
    inherited pnlSearchCriteria: TPanel
      Height = 456
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 436
        inherited btnSearch: TcxButton
          Top = 405
          TabOrder = 10
        end
        inherited edtName: TcxTextEdit
          Left = 78
          Top = 182
          TabOrder = 4
          Width = 127
        end
        object edtINN: TcxTextEdit [2]
          Left = 78
          Top = 200
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 110
        end
        object edtKPP: TcxTextEdit [3]
          Left = 78
          Top = 218
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 110
        end
        object edtCustomsCode: TcxTextEdit [4]
          Left = 78
          Top = 60
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 110
        end
        object edtFrom: TcxDateEdit [5]
          Left = 78
          Top = 78
          ParentFont = False
          Properties.ImmediatePost = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 110
        end
        object edtTo: TcxDateEdit [6]
          Left = 78
          Top = 96
          ParentFont = False
          Properties.ImmediatePost = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 110
        end
        object edtNo: TcxTextEdit [7]
          Left = 78
          Top = 114
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 110
        end
        object edtGoodsCode: TcxMaskEdit [8]
          Left = 78
          Top = 286
          Hint = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1058#1053#1042#1069#1044
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 69
        end
        object edtGoodsPref: TcxTextEdit [9]
          Left = 78
          Top = 304
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 69
        end
        inherited btnSearchClear: TcxButton
          Top = 376
          TabOrder = 9
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1086#1084#1077#1088
            CaptionOptions.Layout = clLeft
            Visible = False
            Control = nil
          end
          object lcgDocument: TdxLayoutGroup [1]
            Caption = #1043#1058#1044
            UseIndent = False
            object lcSearchCriteriaItem3: TdxLayoutItem
              Caption = #1050#1086#1076' '#1090#1072#1084'.'
              Control = edtCustomsCode
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem4: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1089
              Control = edtFrom
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem5: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1087#1086
              Control = edtTo
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem6: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088
              Control = edtNo
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSubject: TdxLayoutGroup [2]
            Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
            UseIndent = False
            object lcSearchCriteriaItem7: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085'.'
              Control = edtName
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem1: TdxLayoutItem
              Caption = #1048#1053#1053' '
              Control = edtINN
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem2: TdxLayoutItem
              Caption = #1050#1055#1055
              Control = edtKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcgGoods: TdxLayoutGroup [3]
            Caption = #1058#1086#1074#1072#1088
            UseIndent = False
            object lcSearchCriteriaItem8: TdxLayoutItem
              Caption = #1050#1086#1076
              Control = edtGoodsCode
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem9: TdxLayoutItem
              Caption = #1055#1088#1077#1092#1077#1088#1077#1085'.'
              Control = edtGoodsPref
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 621
      Height = 456
      inherited grdData: TcxGrid
        Width = 621
        Height = 456
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            Width = 161
            Position.ColIndex = 5
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME'
            Width = 245
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP'
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object colERR_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERR_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Visible = False
            Width = 63
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REG_DATE'
            Visible = False
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBT_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Caption = #1052#1077#1090#1082#1080
            DataBinding.FieldName = 'OBJECTKINDLIST'
            OnGetDisplayText = grdDataDBBandedTableViewOBJECTKINDLISTGetDisplayText
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'OPERATION_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actCorrect: TAction
      Category = 'Object'
      Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100
      Enabled = False
      Visible = False
      OnExecute = actCorrectExecute
      OnUpdate = actCorrectUpdate
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
            BeginGroup = True
            Item = cmbxCustCode
            Visible = True
          end
          item
            Item = btnCorrect
            Visible = True
          end
          item
            Item = cmbxViewMode
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
      28
      0)
    object cmbxCustCode: TdxBarCombo
      Align = iaRight
      Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      Category = 2
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1043#1058#1044' '#1090#1086#1083#1100#1082#1086' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1082#1086#1076#1086#1084' '#1090#1072#1084#1086#1078#1085#1080
      Visible = ivAlways
      OnChange = cmbxCustCodeChange
      ShowCaption = True
      Width = 100
      ItemIndex = -1
    end
    object cmbxViewMode: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 2
      Hint = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1043#1058#1044
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = cmbxViewModeChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077
        #1041#1077#1079' '#1086#1096#1080#1073#1086#1082
        #1057' '#1086#1096#1080#1073#1082#1072#1084#1080
        #1057' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100#1102)
      ItemIndex = 0
    end
    object btnCorrect: TdxBarButton
      Action = actCorrect
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select /*+ FIRST_ROWS INDEX_DESC(fdc_custom_decl, FDC_CUSTOM_DEC' +
        'L_AK) */ * from ('
      '      select  t.*'
      '            ,t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      '        from fdc_obligation_doc_lst t'
      '       where t.Customs_Code > '#39' '#39
      
        '--$s#viewmode#2*/  and EXISTS (select 0 from fdc_Custom_decl_Err' +
        'or_lst x where t.id = x.owner_object_id )'
      
        '--$s#viewmode#1*/  and not exists( select '#39#39' from fdc_Custom_dec' +
        'l_Error_lst x where x.owner_object_id = t.id)'
      '/*$  p#cust_code#*/ and t.Customs_Code like NVL(:cust_code, '#39'%'#39')'
      '/*$p#decl_no#*/    and t.Decl_No like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#name#*/       and UPPER(t.decl_name) like upper(:name)'
      '/*$p#inn#*/        and t.decl_inn like :INN'
      '/*$p#kpp#*/        and t.decl_kpp like :KPP'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      
        '    and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID' +
        ')'
      
        '    and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088 +
        #1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      
        '--        order by t.Customs_Code desc, t.Reg_Date desc, t.Decl_' +
        'No desc'
      ')'
      'where rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_pref'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataERR_COUNT: TFloatField
      FieldName = 'ERR_COUNT'
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'REG_DATE'
    end
    object dsDataDECL_NO: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076'. '#1085#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsDataDEBT_COUNT: TFloatField
      FieldName = 'DEBT_COUNT'
      Visible = False
    end
    object dsDataOBJKINDLABEL: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082#1080
      FieldKind = fkCalculated
      FieldName = 'OBJKINDLABEL'
      Size = 100
      Calculated = True
    end
    object dsDataOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 304
    Top = 244
    object sqlReparse: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_cdecl_loader_ex.reparsepayments(pdeclid => :OWNER_OBJECT_ID,'
        '                                    pid => :sysname);'
        'end;')
      DataSet = dsErrorsLst
    end
    object sqlCheckPayments: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_check_payments(pdeclid => :owner_object_id);'
        'end;')
      DataSet = dsErrorsLst
    end
    object sqlReparseTempAdm: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_cdecl_loader_ex.ReparseTempAdm('
        '    pdeclid => :OWNER_OBJECT_ID,'
        '    pid => :sysname    '
        '    );'
        'end;')
      DataSet = dsErrorsLst
    end
    object sqlReparsePaymentTPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_tpo_loader.reparsepayments(pTPOID => :OWNER_OBJECT_ID,'
        '                               pID    => :sysname);'
        'end;')
      DataSet = dsErrorsLst
    end
    object sqlReIdentGTD: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_cdecl_loader_ex.ReIdentCustomDecl(pId => :OWNER_OBJECT_ID,'
        '                                      pErrorId => :ID);'
        'end;')
      DataSet = dsErrorsLst
    end
    object sqlReIdentTPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_tpo_loader.ReIdentTPO(pId => :OWNER_OBJECT_ID,'
        '                                    pErrorId => :ID);'
        'end;')
      DataSet = dsErrorsLst
    end
  end
  object dsErrorsLst: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_Object_Lst t'
      ' where t.object_type_id in'
      '       (select id'
      '          from fdc_object_type_lst o'
      '         start with o.sysname = '#39'CustomDeclError'#39
      '        connect by o.parent_object_type_id = prior o.id)'
      '  and t.owner_object_id =  :ID')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 404
    Top = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsErrorsLstID: TFloatField
      FieldName = 'ID'
    end
    object dsErrorsLstNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsErrorsLstSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsErrorsLstOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsErrorsLstSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsErrorsLstACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsErrorsLstSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsErrorsLstDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsErrorsLstOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsErrorsLstTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsErrorsLstTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsErrorsLstOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
  end
end
