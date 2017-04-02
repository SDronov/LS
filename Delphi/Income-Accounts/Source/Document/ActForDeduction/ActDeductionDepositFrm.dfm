inherited ActDeductionDepositForm: TActDeductionDepositForm
  Caption = 'ActDeductionDepositForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
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
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
      Visible = True
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
        FloatClientWidth = 104
        FloatClientHeight = 86
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
      '      ,0 AS Summa'
      
        '  FROM FDC_ACT_DED_DEPOSIT_LST a, fdc_subject_lst s, fdc_currenc' +
        'y_usable_lst c'
      ' WHERE a.ID = :ID'
      '   AND s.id = a.SUBJECT_ID'
      '   AND c.id = a.CURRENCY_ID'
      '')
    SourceServerObject = 'FDC_ACT_DED_DEPOSIT_LST'
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
