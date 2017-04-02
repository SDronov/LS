inherited BadPayOrderErrorResolveForm: TBadPayOrderErrorResolveForm
  Left = 104
  Top = 129
  Caption = #1055#1086#1076#1073#1086#1088' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1087#1086#1088#1091#1095#1077#1085#1080#1081
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 80
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 85
        end
        inherited edtINN: TcxTextEdit
          Enabled = False
          Width = 85
        end
        inherited edtNomer: TcxTextEdit
          Width = 85
        end
        inherited edtCurrency: TcxTextEdit
          Width = 85
        end
        inherited edtFromDate: TcxDateEdit
          Width = 85
        end
        inherited edtToDate: TcxDateEdit
          Width = 85
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 85
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 85
        end
        inherited edtKPP: TcxTextEdit
          Enabled = False
          Width = 85
        end
        inherited edtPayCode: TcxTextEdit
          Width = 106
        end
        inherited edtDescript: TcxMemo
          Width = 106
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaItem1: TdxLayoutItem
            Enabled = False
          end
          inherited lcSearchCriteriaItem10: TdxLayoutItem
            Enabled = False
          end
          inherited lcSearchCriteriaItem3: TdxLayoutItem
            Visible = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        Height = 465
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
            end>
        end
      end
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 465
        Width = 706
        Height = 170
        Align = alBottom
        TabOrder = 1
        LookAndFeel = LayoutWebLookAndFeel
        object lcGeneral: TdxLayoutControl
          Left = 9
          Top = 9
          Width = 336
          Height = 146
          Align = alClient
          DragMode = dmAutomatic
          ParentBackground = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 60
            Top = 33
            DataBinding.DataField = 'INN'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 2
            Width = 99
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 205
            Top = 33
            DataBinding.DataField = 'KPP'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 3
            Width = 99
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 60
            Top = 9
            DataBinding.DataField = 'K92'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 0
            Width = 99
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 205
            Top = 9
            DataBinding.DataField = 'K93'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 1
            Width = 99
          end
          object cxDBMaskEdit1: TcxDBCurrencyEdit
            Left = 60
            Top = 57
            RepositoryItem = DictData.repCurrencyItem
            DataBinding.DataField = 'K95'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 4
            Width = 99
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 205
            Top = 57
            DataBinding.DataField = 'K_VAL'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 5
            Width = 99
          end
          object cxDBMaskEdit2: TcxDBCurrencyEdit
            Left = 60
            Top = 81
            RepositoryItem = DictData.repCurrencyItem
            DataBinding.DataField = 'SUMMA'
            DataBinding.DataSource = srcDKPP
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clSilver
            Style.StyleController = WebEditStyleController
            TabOrder = 6
            Width = 244
          end
          object dxLayoutGroup1: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup3: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItem3: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = cxDBTextEdit4
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItem4: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1044#1072#1090#1072
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = cxDBDateEdit1
                  ControlOptions.ShowBorder = False
                end
              end
              object dxLayoutGroup2: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object dxLayoutItem1: TdxLayoutItem
                  Caption = #1048#1053#1053
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = cxDBTextEdit2
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItem2: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1050#1055#1055
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = cxDBTextEdit3
                  ControlOptions.ShowBorder = False
                end
              end
            end
            object lcGeneralGroup4: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem5: TdxLayoutItem
                Caption = #1057#1091#1084#1084#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBMaskEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem6: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1042#1072#1083#1102#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBTextEdit5
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem8: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1087#1080#1089#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBMaskEdit2
              ControlOptions.ShowBorder = False
            end
          end
        end
        object dxLayoutControl1Group_Root: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutControl1Item1: TdxLayoutItem
            Control = lcGeneral
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
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
            BeginGroup = True
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 151
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
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      
        '      ,(select s.sysname from fdc_state_lst s where s.id = t.sta' +
        'te_id) state_sysname'
      
        '      ,(select s.name from fdc_state_lst s where s.id = t.state_' +
        'id) state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AS AVAIL_SUMMA'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,0                         AS ak'
      '      ,t.doc_number doc_no'
      '      ,to_number(null) subject_id'
      '  from fdc_po_credit_lst t'
      '--$s#USE_DK_PP#1*/      ,dbf_pp_plt_lst        d'
      '--$s#USE_DK_PP#1*/      ,fdc_object_lst        o'
      ' WHERE t.payer_id IS NOT NULL'
      '   AND nvl(:id, 0) = nvl(:id, 0)'
      '   AND t.typesysname <> '#39'PaymentOrderConfirm'#39
      '--$s#USE_DK_PP#1*/   and o.id = :ID'
      '   and (   :NA IS NULL'
      '        OR (    :NA = 2'
      '            AND SUMMA IS NULL)'
      '       )'
      '--$s#USE_DK_PP#1*/   AND d.id = o.sysname'
      '--$s#USE_DK_PP#1*/   AND NVL(t.payer_inn,'#39'X'#39') = NVL(d.inn, '#39'X'#39')'
      
        '--$s#USE_DK_PP#1*/   AND ( t.payer_kpp = d.kpp OR d.kpp IS NULL ' +
        ')'
      '--$s#USE_DK_PP#1*/   AND t.doc_number = d.k92'
      
        '--$s#USE_DK_PP#1*/   AND ( t.doc_date = d.k93 OR t.doc_summa = d' +
        '.k95 )'
      '--$s#USE_DK_PP#1*/   AND t.curr_code = d.k_val'
      '      --  and t.rest_summa > 0'
      '/*$p#name#*/   and upper(t.payer_name) like upper(:name)'
      '/*$p#INN#*/   and (t.payer_inn like :INN)'
      '/*$p#KPP#*/   and (t.payer_kpp like :KPP)'
      
        '/*$p#DOC_NO#*/   and (t.doc_number like :DOC_NO or t.doc_no2 lik' +
        'e :DOC_NO)'
      '/*$p#CURR#*/   and (t.curr_code like :CURR)'
      '/*$p#FROM_DATE#*/   and (t.doc_date >= :FROM_DATE)'
      '/*$p#TO_DATE#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#SUM_MIN#*/   and (t.doc_summa >= :SUM_MIN)'
      '/*$p#SUM_MAX#*/   and (t.doc_summa <= :SUM_MAX)'
      '/*$p#CURRENCY_ID#*/   and NVL(t.CURRENCY_ID,0) >=0'
      '/*$p#DESCRIPT#*/   and t.DESCRIPT like :DESCRIPT'
      '/*$p#REST_SUMMA#*/   and NVL(:REST_SUMMA, 0) >= 0'
      '/*$p#PAY_CODE#*/ and  ((PAY_TYPE_CODE like  :PAY_CODE))'
      'and (1=1 or REST_SUMMA - LOCKED_SUMMA>= NVL(:AVAIL_SUMMA, 0))'
      'and rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
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
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
  inherited srcAccData: TDataSource
    Left = 278
  end
  inherited dsAccData: TfdcQuery
    Left = 238
    Top = 404
  end
  object dsDKPP: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select o.*'
      '     ,d.ID as DK_PP_ID'
      '      ,INN'
      '      ,KPP'
      '      ,K92'
      '      ,K93'
      '      ,K94 summa'
      '      ,K95'
      '      ,K_VAL'
      '  from dbf_pp_plt_lst    d'
      '      ,fdc_Custom_decl_Error_lst o'
      ' where o.id = :ID'
      '   and d.id = o.sysname')
    SourceServerObject = 'FDC_OBJECT_LST'
    BeforeOpen = dsDKPPBeforeOpen
    Left = 260
    Top = 223
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object srcDKPP: TDataSource
    DataSet = dsDKPP
    Left = 296
    Top = 222
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 268
    Top = 156
    object sqlResolve: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_cdecl_loader_ex.executepayment(pdeclid => :decl_id,'
        '                                   pid => :id,'
        '                                   ppayorderid => :payment_id,'
        '                                   psumma => :sum);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  if fdc_object_get_typesysname(:decl_id) = '#39'TR'#39' then'
        '        p_document.doactivate(:decl_id);'
        '  else'
        '        p_document.doactivatebuffer;'
        '  end if;      '
        '  --'
        'end;')
    end
    object sqlGetTypeSysName: TsqlOp
      SQL.Strings = (
        'begin'
        '   begin'
        '     select typesysname'
        '       into :result '
        '     from fdc_object_lst '
        '     where id = :decl_id;'
        '   exception'
        '   when others then'
        '    :result:=null;'
        '   end;'
        'end;')
    end
  end
  object dsAllPP: TfdcQuery
    Session = MainData.Session
    DataSource = srcDKPP
    ReadOnly = False
    SQL.Strings = (
      'select t.id, pp.id as pp_id, d.id decl_id, d.name, pp.k94'
      
        '  from dbf_pp_plt_lst pp, fdc_custom_decl_lst d, fdc_custom_decl' +
        '_error_lst t'
      ' where to_char(pp.id) = t.sysname'
      '   and pp.INN = :INN'
      
        '   and ((:KPP is null and pp.KPP is null) or (:KPP is not null a' +
        'nd pp.Kpp = :KPP))'
      '   and pp.k92 = :K92'
      '   and pp.k93 = :K93'
      '   and pp.k95 = :K95'
      '   and pp.k_val = :K_VAL'
      '   and pp.id <> :DK_PP_ID'
      '   and d.customs_code = pp.g071'
      '   and d.reg_date = pp.g072'
      '   and d.decl_no = pp.g073'
      '   and t.owner_object_id = d.id'
      '   ')
    Left = 304
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'K92'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'K93'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'K95'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'K_VAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DK_PP_ID'
        ParamType = ptUnknown
      end>
  end
end
