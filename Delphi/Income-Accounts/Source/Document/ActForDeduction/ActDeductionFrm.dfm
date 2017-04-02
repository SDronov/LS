inherited ActDeductionForm: TActDeductionForm
  Left = 321
  Top = 115
  Width = 795
  Height = 633
  ActiveControl = edtName
  Caption = 'ActDeductionForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 779
    Height = 595
    ClientRectBottom = 571
    ClientRectRight = 779
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 773
        Height = 540
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 411
          TabOrder = 15
          Height = 174
          Width = 417
        end
        object edtDeclINN: TcxDBMaskEdit [2]
          Left = 142
          Top = 165
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Width = 209
        end
        object edtDeclKPP: TcxDBMaskEdit [3]
          Tag = 13
          Left = 525
          Top = 165
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 227
        end
        object edtDeclName: TcxDBMaskEdit [4]
          Left = 142
          Top = 192
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        object edtSignBy: TcxDBTextEdit [5]
          Left = 142
          Top = 344
          DataBinding.DataField = 'SIGNED_BY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Width = 121
        end
        object edtSignDate: TcxDBDateEdit [6]
          Left = 142
          Top = 371
          DataBinding.DataField = 'SIGN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 14
          Width = 121
        end
        object edtSignByChief: TcxDBLookupComboBox [7]
          Left = 142
          Top = 317
          DataBinding.DataField = 'SIGNED_BY_CHIEF'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'NAME'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsGetBoss
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 12
          Width = 714
        end
        object edtPersonDoc: TcxDBMaskEdit [8]
          Left = 142
          Top = 219
          DataBinding.DataField = 'PERSONDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 121
        end
        object edtCurrency: TcxDBMaskEdit [9]
          Left = 60
          Top = 259
          DataBinding.DataField = 'CURRENCY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 150
        end
        object adtSumma: TcxDBCurrencyEdit [10]
          Left = 249
          Top = 259
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 121
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 142
          Properties.OnChange = Modify
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 631
          Properties.OnChange = Modify
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocNumber: TdxLayoutItem
                Tag = 11
              end
              inherited lciDocDate: TdxLayoutItem
                Tag = 11
              end
            end
          end
          object lcgDeclarant: TdxLayoutGroup [2]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclINN: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lciDeclKPP: TdxLayoutItem
                Tag = 33
                Caption = #1050#1055#1055
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclName: TdxLayoutItem
              Tag = 33
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtDeclName
              ControlOptions.ShowBorder = False
            end
            object lciPersonDoc: TdxLayoutItem
              Tag = 33
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076'.'#1083#1080#1095#1085#1086#1089#1090#1100
              Control = edtPersonDoc
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciCurrency: TdxLayoutItem
              Tag = 33
              Caption = #1042#1072#1083#1102#1090#1072' '
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtCurrency
              ControlOptions.ShowBorder = False
            end
            object lciSumma: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = adtSumma
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSign: TdxLayoutGroup [4]
            Caption = #1055#1086#1076#1087#1080#1089#1100
            object lciSignByChief: TdxLayoutItem
              Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1054#1058#1055
              Control = edtSignByChief
              ControlOptions.ShowBorder = False
            end
            object lciSignBy: TdxLayoutItem
              Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
              Control = edtSignBy
              ControlOptions.ShowBorder = False
            end
            object lciSignDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072
              Control = edtSignDate
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 779
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 540
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 568
        Width = 779
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 776
        Height = 540
      end
    end
    object tabDocs: TcxTabSheet [1]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabDocsShow
    end
    object tabDeduction: TcxTabSheet [2]
      Caption = #1057#1087#1080#1089#1072#1085#1080#1103
      ImageIndex = 3
      OnShow = tabDeductionShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 779
        Height = 571
        ClientRectBottom = 547
        ClientRectRight = 779
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
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
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 103
        FloatClientHeight = 78
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT a.*'
      '      ,s.NAME AS DECL_NAME'
      '      ,s.INN AS DECL_INN'
      '      ,s.KPP AS DECL_KPP'
      '      ,(SELECT TRIM(p.ser_no || '#39'  '#39' || p.doc_no)'
      '          FROM fdc_person p'
      '         WHERE p.id = s.ID) AS PersonDoc'
      '      ,c.CODE||'#39' - '#39'||c.ACODE AS CURRENCY  '
      
        '  FROM FDC_ACT_DEDUCTION_LST a, fdc_subject_lst s, fdc_currency_' +
        'usable_lst c'
      ' WHERE a.ID = :ID'
      '   AND s.id = a.SUBJECT_ID'
      '   AND c.id = a.CURRENCY_ID'
      '')
    SourceServerObject = 'FDC_ACT_DEDUCTION_LST'
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataPERSONDOC: TStringField
      FieldName = 'PERSONDOC'
      Size = 62
    end
    object dsDataCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Size = 9
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  P_ACT_DEDUCTION.Modify('
      '    :ID,'
      '    :DOC_NUMBER,'
      '    :DOC_DATE,'
      '    :SIGNED_BY,'
      '    :SIGNED_BY_CHIEF,'
      '    :SIGN_DATE);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where 0 = 1 and'
      '       State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )')
  end
  inherited dsState: TfdcQuery
    AfterOpen = dsStateAfterOpen
    AfterRefresh = dsStateAfterRefresh
  end
  object odsGetBoss: TOracleDataSet
    SQL.Strings = (
      'select v.id,v.STRINGVALUE as name from fdc_value_lst_sys v'
      ' where '
      '    v.sysname in ('#39'BossName'#39','#39'PayBossName'#39')'
      ' union all'
      ' select 0 as id,:pName as name from dual'
      ' where '
      '     :pName is not null'
      ' and not exists (select 0 from fdc_value_lst_sys '
      '                  where '
      '                      sysname in ('#39'BossName'#39','#39'PayBossName'#39')'
      '                  and STRINGVALUE = nvl(:pName,'#39#39'))'
      'order by id')
    Variables.Data = {0300000001000000060000003A504E414D45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = MainData.Session
    Left = 555
    Top = 346
    object odsGetBossID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetBossNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsGetBoss: TDataSource
    DataSet = odsGetBoss
    Left = 556
    Top = 395
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT  ( SELECT v.STRINGVALUE '
      '            FROM fdc_value_lst_sys v '
      '            WHERE v.SYSNAME = '#39'CustomsName'#39') AS CustomsName, '
      '        ( SELECT v.STRINGVALUE from fdc_value_lst_sys v'
      '            WHERE v.sysname = '#39'BossName'#39' ) AS BOSSNAME,'
      '        ( SELECT v.STRINGVALUE from fdc_value_lst_sys v'
      '            WHERE v.sysname = '#39'PayBossName'#39' ) AS PAYBOSS'
      ''
      'FROM dual')
    Left = 83
    Top = 314
  end
  object dsDetailPays: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT ROWNUM, po.payer_name, po.payer_inn, po.payer_kpp, po.DOC' +
        '_NUMBER, po.DOC_DATE,'
      '       po.SUMMA, r.summa AS reserve_summa'
      '  FROM fdc_po_lst  po'
      '      ,fdc_reserved_3year_lst r'
      ' WHERE r.doc_id = :ACT_ID'
      '   AND r.payment_id = po.id')
    BeforeOpen = dsDetailPaysBeforeOpen
    Left = 187
    Top = 330
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ACT_ID'
        ParamType = ptUnknown
      end>
  end
  object dsDetailOverPays: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT ROWNUM,'
      
        '       po.payer_name, po.payer_inn, po.payer_kpp, po.DOC_NUMBER,' +
        ' po.DOC_DATE, po.SUMMA, r.summa AS reserve_summa,'
      
        '       d.DOC_NUMBER||'#39' '#1086#1090' '#39'||to_char(d.DOC_DATE, '#39'DD.MM.YY'#39')  AS' +
        ' Advice_Number'
      
        'FROM fdc_document d, fdc_advice a, fdc_value_lst v, fdc_value_ls' +
        't v2, '
      '     fdc_reserved_payment_lst r, fdc_po_lst po'
      'WHERE 1 = :FLAG '
      '  AND v.OWNER_OBJECT_ID = :ACT_ID'
      '  AND v.Ref_Object_ID = a.ID'
      '  AND a.id = d.id'
      '  AND v2.OWNER_OBJECT_ID = a.ID'
      '  AND v2.Ref_Object_ID = r.id'
      '  AND po.ID = r.payment_id'
      '')
    BeforeOpen = dsDetailOverPaysBeforeOpen
    Left = 187
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ACT_ID'
        ParamType = ptUnknown
      end>
  end
  object dsDetailDeposit: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT ROWNUM, q.*'
      'FROM ('
      
        #9#9#9#9'select po.payer_name, po.payer_inn, po.payer_kpp, po.DOC_NUM' +
        'BER, po.DOC_DATE, po.SUMMA, '
      #9#9#9#9#9#9' t.Name AS TR_Name,'
      #9#9#9#9#9#9' SUM(pd.summa) AS reserve_summa'
      #9#9#9#9#9'FROM fdc_rel_act_ded_deduction_lst rd'
      #9#9#9#9#9#9#9',fdc_payment_deduction_all_lst pd'
      #9#9#9#9#9#9#9',fdc_tr_lst                    t'
      #9#9#9#9#9#9#9',fdc_po_lst                    po'
      #9#9#9#9' WHERE rd.object_id  = :ACT_ID'
      #9#9#9#9#9' AND pd.id         = rd.rel_object_id'
      #9#9#9#9#9' AND t.id          = pd.decl_id'
      #9#9#9#9#9' AND po.id         = pd.payment_id'
      
        #9#9#9#9'GROUP BY po.payer_name, po.payer_inn, po.payer_kpp, po.DOC_N' +
        'UMBER, po.DOC_DATE, po.SUMMA, t.Name '
      '  ) q')
    BeforeOpen = dsDetailDepositBeforeOpen
    Left = 187
    Top = 440
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ACT_ID'
        ParamType = ptUnknown
      end>
  end
end
