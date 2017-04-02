inherited SelectPOWizardForm: TSelectPOWizardForm
  Left = 76
  Top = 62
  Width = 602
  Height = 419
  Caption = #1052#1072#1089#1090#1077#1088' '#1086#1087#1083#1072#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 500
    Height = 392
    inherited btnCancel: TcxButton
      Left = 416
      Top = 360
    end
    inherited btnOk: TcxButton
      Left = 335
      Top = 360
      ModalResult = 0
    end
    inherited btnPrev: TcxButton
      Left = 173
      Top = 360
    end
    inherited btnNext: TcxButton
      Left = 254
      Top = 360
    end
    inherited PageControl: TcxPageControl
      Width = 364
      Height = 241
      ClientRectBottom = 240
      ClientRectRight = 363
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 362
          Height = 219
          inherited cxLabel1: TcxLabel
            Top = 37
            Style.Font.Height = -15
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          inherited cxLabel2: TcxLabel
            Top = 65
            Properties.WordWrap = False
          end
          object grdPO: TcxGrid [2]
            Left = 9
            Top = 115
            Width = 224
            Height = 114
            Align = alClient
            TabOrder = 5
            object grdPODBTableView1: TcxGridDBTableView
              OnDblClick = grdPODBTableView1DblClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcPayments
              DataController.KeyFieldNames = 'RecId'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0.00'
                  Kind = skSum
                  FieldName = 'SUMMA'
                  Column = grdPODBTableView1SUMMA
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CopyCaptionsToClipboard = False
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object grdPODBTableView1NAME: TcxGridDBColumn
                DataBinding.FieldName = 'NAME'
                Width = 148
              end
              object grdPODBTableView1SUMMA: TcxGridDBColumn
                DataBinding.FieldName = 'SUMMA'
                Width = 71
              end
              object grdPODBTableView1CURR_SUMMA: TcxGridDBColumn
                DataBinding.FieldName = 'CURR_SUMMA'
                Visible = False
                Width = 53
              end
              object grdPODBTableView1CURR_CODE: TcxGridDBColumn
                DataBinding.FieldName = 'CURR_CODE'
                Visible = False
                Width = 76
              end
            end
            object grdPOLevel1: TcxGridLevel
              GridView = grdPODBTableView1
            end
          end
          object cxButton1: TcxButton [3]
            Left = 396
            Top = 115
            Width = 62
            Height = 20
            Action = actAdd
            TabOrder = 6
          end
          object cxButton2: TcxButton [4]
            Left = 396
            Top = 166
            Width = 68
            Height = 19
            Action = actDelete
            TabOrder = 8
          end
          object chbxDebt: TcxCheckBox [5]
            Left = 9
            Top = 88
            Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1091#1102' '#1089#1091#1084#1084#1091' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
            Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
            ParentColor = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            TabOrder = 4
            Width = 458
          end
          object edtPayDate: TcxDateEdit [6]
            Left = 78
            Top = 9
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = edtPayDatePropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 0
            Width = 93
          end
          object btnEditCharge: TcxButton [7]
            Left = 396
            Top = 141
            Width = 75
            Height = 19
            Action = actEdit
            TabOrder = 7
          end
          object cxLabel3: TcxLabel [8]
            Left = 177
            Top = 9
            Caption = #1050#1041#1050':'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.IsFontAssigned = True
            Transparent = True
          end
          inherited dxLayoutGroup2: TdxLayoutGroup
            object dxLayoutControl2Group3: TdxLayoutGroup [0]
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object dxLayoutControl2Item6: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
                Control = edtPayDate
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl2Item7: TdxLayoutItem
                ShowCaption = False
                Control = cxLabel3
                ControlOptions.ShowBorder = False
              end
            end
            object dxLayoutControl2Item5: TdxLayoutItem
              AutoAligns = [aaHorizontal]
              Caption = 'cxCheckBox1'
              ShowCaption = False
              Control = chbxDebt
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl2Group1: TdxLayoutGroup
              AutoAligns = [aaHorizontal]
              AlignVert = avClient
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object dxLayoutControl2Item1: TdxLayoutItem
                AutoAligns = []
                AlignHorz = ahClient
                AlignVert = avClient
                Control = grdPO
                ControlOptions.ShowBorder = False
              end
              object dxLayoutControl2Group2: TdxLayoutGroup
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                ShowCaption = False
                Hidden = True
                ShowBorder = False
                object dxLayoutControl2Item3: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  ShowCaption = False
                  Control = cxButton1
                  ControlOptions.ShowBorder = False
                end
                object lciEditCharge: TdxLayoutItem
                  Caption = 'New Item'
                  ShowCaption = False
                  Control = btnEditCharge
                  ControlOptions.ShowBorder = False
                end
                object dxLayoutControl2Item4: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  ShowCaption = False
                  Control = cxButton2
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
        end
      end
      object tabDoc: TcxTabSheet
        Caption = 'tabDoc'
        ImageIndex = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 362
          Height = 219
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object chBDocShow: TcxCheckBox
            Left = 9
            Top = 86
            Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
            ParentColor = False
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 3
            Width = 462
          end
          object cxLabel6: TcxLabel
            Left = 9
            Top = 9
            Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091#1095#1077#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
            ParentColor = False
            ParentFont = False
            Style.Edges = []
            Style.HotTrack = False
          end
          object edtDocNumber: TcxTextEdit
            Left = 100
            Top = 32
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            TabOrder = 1
            Width = 371
          end
          object edtDocDate: TcxDateEdit
            Left = 100
            Top = 59
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.HotTrack = False
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            TabOrder = 2
            Width = 371
          end
          object lcgDoc: TdxLayoutGroup
            ShowCaption = False
            ShowBorder = False
            object lciDocTypeNotice: TdxLayoutItem
              Caption = 'cxLabel6'
              ShowCaption = False
              Control = cxLabel6
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item1: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Control = edtDocNumber
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item4: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl3Item3: TdxLayoutItem
              Caption = 'cxCheckBox1'
              ShowCaption = False
              Control = chBDocShow
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 392
    ParentBackground = False
  end
  inherited ActionList: TActionList
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object dsPayments: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 48
    Top = 168
    object dsPaymentsID: TFloatField
      FieldName = 'ID'
    end
    object dsPaymentsNAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      FieldName = 'NAME'
      Size = 80
    end
    object dsPaymentsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1075#1072#1096'.'
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsPaymentsCURR_SUMMA: TCurrencyField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'CURR_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsPaymentsCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object dsPaymentsTRANS_KEY: TStringField
      FieldName = 'TRANS_KEY'
      Size = 60
    end
    object dsPaymentsRATE: TFloatField
      FieldName = 'RATE'
    end
    object dsPaymentsREST_SUMM: TCurrencyField
      FieldName = 'REST_SUMM'
    end
    object dsPaymentsCURR_ID: TFloatField
      FieldName = 'CURR_ID'
    end
    object dsPaymentsPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 4000
    end
    object dsPaymentsKBK_ID: TFloatField
      FieldName = 'KBK_ID'
    end
    object dsPaymentsTR_ID: TFloatField
      FieldName = 'TR_ID'
    end
  end
  object srcPayments: TDataSource
    DataSet = dsPayments
    Left = 48
    Top = 208
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 8
    Top = 168
    object sqlAddPayment: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :TRANS_KEY := fdc_addpaymentKBK('
        '      ppoid => :id'
        '     ,psumma => :summa'
        '     ,pposumma => :curr_summa'
        '     ,pErrBool => 0'
        '     ,pActivateDoc => :activate_doc'
        '     ,ptrid => :tr_id'
        '    );'
        'end;')
      DataSet = dsPayments
    end
    object sqlRemovePayment: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  begin'
        '   p_params.ForceDropObject := '#39'Y'#39';'
        '   p_payment_helper.removepayment(ppaymentkey => :TRANS_KEY);'
        '   p_params.ForceDropObject := '#39'N'#39';'
        '  exception'
        '  when others then'
        '    null;'
        '  end;    '
        'end;')
      DataSet = dsPayments
    end
    object sqlFinish: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_payment_helper.Finish(pDoDebt => :debt,'
        '                          pDonoticePay => 1);'
        'end;')
    end
    object sqlSetDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_payment_helper.setdate(pdate => :pdate);'
        'end;')
    end
    object sqlGetPOInfo: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_payment_helper.getpoinfo(pid => :ID,'
        '                             ptotalsum => :TOTAL_SUMMA,'
        '                             pcurrid => :SUMM_CURR_ID,'
        '                             podocname => :NAME,'
        '                             popayername => :PAYER_NAME,'
        '                             porestsum => :REST_SUMM,'
        '                             pocurrid => :CURR_ID,'
        '                             porate => :RATE,'
        '                             pochargesumma => :SUMMA,'
        '                             podedsumma => :CURR_SUMMA,'
        '                             psubjectid => :SUBJECT_ID,'
        '                             ptrid => :TR_ID'
        '                             );'
        'end;')
      DataSet = dsPayments
    end
    object sqlGetOstPOKbk: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := fdc_getrestmoneybykbkandprekbk(pid => :id,'
        
          '                                            pkbkid => :kbkcode_i' +
          'd,'
        '                                            p_flag => :p_flag,'
        
          '                                            p_PayTypeSysName => ' +
          ':PayTypeSysName,'
        
          '                                            p_IsDebt => :IsDebt)' +
          ';'
        'end;')
    end
    object sqlAddDept: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        ' :result := p_payment_helper.AddDept('
        '     pDoDebt      => :debt'
        '    ,pDonoticePay => 1'
        '    ,pDocNumber   => :pDocNumber'
        '    ,pDocDate     => :pDocDate'
        '   );'
        '  if :debt = 1 then'
        '    delete from fdc_document_for_activate where id = :result; '
        '    p_document.doactivatebuffer;    '
        '  end if; '
        'end;')
    end
    object sqlGetDeclID: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_payment_helper.getdeclid;'
        'end;')
    end
    object sqlCreateInteractPayFines: TsqlOp
      SQL.Strings = (
        'begin'
        'fdc_create_interact_pay_fines(pDeclId => :pDeclId);'
        'end;')
    end
    object sqlGetCodeKbk: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_nsi_kbk.GetCodeById(pId => :pId);'
        'end;')
    end
    object sqlPinaltyIs: TsqlOp
      SQL.Strings = (
        'declare'
        '  vCode Varchar2(4);'
        'begin'
        '  begin'
        '  SELECT CODE2 INTO vCode FROM FDC_DICT WHERE ID =  :pId;'
        '  exception'
        '   when no_data_found then'
        '      vCode := NULL;'
        '  end;'
        '  '
        '  if vCode is not null then'
        
          '    :result := P_TPO_LOADER.GetPinaltyIs(pPayTypeCode =>  vCode)' +
          ';'
        '  else'
        '    :result := 0;'
        '  end if;'
        'end;')
    end
    object sqlKBK_IsTS: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  :result := p_nsi_kbk.iskbkts(pid => :kbk_id);'
        'END;')
    end
    object sqlGetTypeSysName: TsqlOp
      SQL.Strings = (
        'begin '
        
          '  :result := fdc_object_get_typesysname(pID =>p_payment_helper.g' +
          'etdeclid);'
        'end;')
    end
    object sqlAddError: TsqlOp
      SQL.Strings = (
        'declare'
        '    dummy BOOLEAN;'
        'BEGIN'
        ''
        
          '     dummy := p_Cdecl_Loader_Ex.CheckUnpaid(p_payment_helper.get' +
          'declid);'
        'end;')
    end
    object sqlAddPaymentInList: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  p_payment_helper.AddPaymentInList('
        '      ppoid => :id'
        '     ,psumma => :summa'
        '     ,pkbkid => :kbkcode_id'
        '     ,ptrid => :tr_id'
        '    );'
        'end;')
    end
    object sqlParseTR: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_payment_helper.ParseTR;'
        'end;')
    end
    object sqlSignDecision: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_payment_helper.SignDecision;'
        'end;')
    end
    object sqlGetPaymentId: TsqlOp
      SQL.Strings = (
        'begin'
        '  select payment_id'
        '    into :result'
        '    from fdc_payment_deduction_lst '
        '   where id = :DED_ID;'
        'end;')
    end
    object sqlCheckActivate: TsqlOp
      SQL.Strings = (
        'DECLARE'
        '  lv_DeclId fdc_object.id%type := p_payment_helper.getdeclid;'
        'BEGIN'
        '  SELECT sign(COUNT(*))'
        '    INTO :result'
        '    FROM ( SELECT 0'
        '             FROM fdc_decl_charge_hist_lst dc'
        '             WHERE dc.decl_id = lv_DeclId'
        '               AND dc.is_active = '#39'Y'#39
        '           UNION ALL'
        '           SELECT 0'
        '             FROM fdc_payment_deduction_lst pd'
        '             WHERE pd.decl_id = lv_DeclId'
        '               AND pd.is_active = '#39'Y'#39' );'
        'END;')
    end
    object sqlObjectTypeIsSubtype: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := Fdc_Object_Type_Is_Subtype( pType     => :DOC_TYPE'
        '                                       , pBaseType => :BASE_TYPE'
        '                                       );'
        'end;')
    end
    object sqlGetTypeSysNameByID: TsqlOp
      SQL.Strings = (
        'begin '
        '  :result := fdc_object_get_typesysname(pID => :ID);'
        'end;')
    end
  end
  object dsetNotice: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM fdc_document'
      '  WHERE id = ( SELECT t.noticepay_id'
      '                 FROM fdc_noticepay_charge_lst t'
      '                WHERE t.decl_id = :decl_id'
      
        '                      AND NOT EXISTS ( SELECT 1 FROM fdc_noticep' +
        'ay_lst n'
      
        '                                        WHERE n.owner_object_id ' +
        '= t.noticepay_id )'
      '                      AND noticepay_is_active = '#39'N'#39
      '                      AND rownum = 1 )')
    Variables.Data = {
      0300000001000000080000003A4445434C5F4944040000000000000000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = MainData.Session
    Left = 136
    Top = 254
  end
  object dsNotice: TDataSource
    DataSet = dsetNotice
    Left = 136
    Top = 302
  end
end
