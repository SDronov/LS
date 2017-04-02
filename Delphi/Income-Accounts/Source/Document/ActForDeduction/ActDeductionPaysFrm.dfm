inherited ActDeductionPaysForm: TActDeductionPaysForm
  Left = 190
  Top = 104
  Caption = 'ActDeductionPaysForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Height = 565
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Height = 174
          Width = 417
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 209
        end
        inherited edtDeclName: TcxDBMaskEdit
          Width = 121
        end
        inherited edtSignBy: TcxDBTextEdit
          Width = 121
        end
        inherited edtSignDate: TcxDBDateEdit
          Width = 121
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 714
        end
        inherited edtPersonDoc: TcxDBMaskEdit
          Width = 121
        end
        inherited adtSumma: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
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
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 565
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Top = 3
        Height = 565
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 113
        FloatClientHeight = 82
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
      
        '  FROM FDC_ACT_DED_PAYS_LST a, fdc_subject_lst s, fdc_currency_u' +
        'sable_lst c'
      ' WHERE a.ID = :ID'
      '   AND s.id = a.SUBJECT_ID'
      '   AND c.id = a.CURRENCY_ID'
      '')
    SourceServerObject = 'FDC_ACT_DED_PAYS_LST'
  end
  inherited dsDetailOverPays: TfdcQuery
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLAG'
        ParamType = ptUnknown
        Value = 2
      end
      item
        DataType = ftFloat
        Name = 'ACT_ID'
        ParamType = ptUnknown
      end>
  end
end
