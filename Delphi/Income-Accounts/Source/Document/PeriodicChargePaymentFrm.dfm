inherited PeriodicChargePaymentForm: TPeriodicChargePaymentForm
  Left = 344
  Top = 321
  Width = 708
  Height = 496
  Caption = 'PeriodicChargePaymentForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 606
    Height = 469
    inherited btnCancel: TcxButton
      Left = 522
      Top = 437
    end
    inherited btnOk: TcxButton
      Left = 441
      Top = 437
    end
    inherited btnPrev: TcxButton
      Left = 279
      Top = 437
    end
    inherited btnNext: TcxButton
      Left = 360
      Top = 437
    end
    inherited PageControl: TcxPageControl
      Width = 330
      Height = 249
      ActivePage = tabMonthlyPayments
      ClientRectBottom = 248
      ClientRectLeft = 1
      ClientRectRight = 329
      ClientRectTop = 21
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 328
          Height = 227
        end
      end
      object tabMonthlyPayments: TcxTabSheet
        Caption = 'tabMonthlyPayments'
        ImageIndex = 1
        object dxLayoutControl5: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 328
          Height = 227
          Align = alClient
          TabOrder = 0
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxLabel5: TcxLabel
            Left = 9
            Top = 9
            Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1103#1094', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1086#1087#1083#1072#1090#1072':'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.StyleController = WebEditStyleController
            Transparent = True
          end
          object grdPO: TcxGrid
            Left = 9
            Top = 32
            Width = 279
            Height = 169
            Align = alClient
            TabOrder = 1
            object grdPODBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srcRunningPayments
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CopyCaptionsToClipboard = False
              OptionsBehavior.ImmediateEditor = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object grdPODBTableView1MONTH: TcxGridDBColumn
                Caption = #1052#1077#1089#1103#1094
                DataBinding.FieldName = 'MONTH'
              end
              object grdPODBTableView1SUMMA: TcxGridDBColumn
                Caption = #1057#1091#1084#1084#1072
                DataBinding.FieldName = 'SUMMA'
              end
            end
            object grdPOLevel1: TcxGridLevel
              GridView = grdPODBTableView1
            end
          end
          object dxLayoutGroup5: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object dxLayoutItem2: TdxLayoutItem
              ShowCaption = False
              Control = cxLabel5
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl5Item3: TdxLayoutItem
              AutoAligns = []
              AlignHorz = ahClient
              AlignVert = avClient
              Caption = 'cxGrid1'
              ShowCaption = False
              Control = grdPO
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Height = 469
  end
  object dsRunningPayments: TfdcQuery
    Session = MainData.Session
    Filtered = True
    ReadOnly = False
    SQL.Strings = (
      'select '
      
        '       to_char(Trunc(ADD_MONTHS(IMPORT_DATE, rownum - 1), '#39'MONTH' +
        #39'), '#39'yyyy.mm'#39') month,'
      
        '       (select sum(month_summa) from fdc_periodic_charge_lst whe' +
        're decl_id = cd.id)*GREATEST(rownum - cd.payed_months,0) summa,'
      '       rownum ID'
      'from '
      '     fdc_object c, fdc_custom_decl cd'
      'where '
      
        '     rownum < CEIL(MONTHS_BETWEEN(trunc(EXPORT_DATE, '#39'MONTH'#39'), t' +
        'runc(IMPORT_DATE, '#39'MONTH'#39'))) + 2 and cd.id = :DECL_ID')
    Left = 8
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    object dsRunningPaymentsMONTH: TStringField
      FieldName = 'MONTH'
    end
    object dsRunningPaymentsSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
  object srcRunningPayments: TDataSource
    DataSet = dsRunningPayments
    Left = 48
    Top = 224
  end
end
