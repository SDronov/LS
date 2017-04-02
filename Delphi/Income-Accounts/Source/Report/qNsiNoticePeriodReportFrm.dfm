inherited qNsiNoticePeriodReportForm: TqNsiNoticePeriodReportForm
  Left = 641
  Top = 346
  Caption = #1054#1073#1084#1077#1085' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1077#1081' '#1089' '#1048#1048#1057' '#1060#1061#1044
  ClientHeight = 125
  ClientWidth = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 469
    Height = 125
    inherited btnCancel: TcxButton
      Left = 385
      Top = 93
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 304
      Top = 93
      TabOrder = 4
    end
    inherited edtDateFrom: TcxDBDateEdit
      Width = 200
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Top = 63
      TabOrder = 2
    end
    inherited chbxXML: TcxCheckBox
      Top = 93
      TabOrder = 3
    end
    object edtDateTo: TcxDBDateEdit [5]
      Left = 50
      Top = 36
      DataBinding.DataField = 'DateTo'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 200
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lciDateFrom: TdxLayoutItem
        Caption = #1057
      end
      object lciDateTo: TdxLayoutItem [1]
        AutoAligns = [aaVertical]
        AlignHorz = ahClient
        Caption = #1055#1086
        Control = edtDateTo
        ControlOptions.ShowBorder = False
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
  inherited dsMemData: TdxMemData
    object dsMemDataDateTo: TDateField [0]
      FieldName = 'DateTo'
    end
  end
  inherited xlrReport: TxlReport
    Left = 232
  end
  inherited qryCheckReport: TOracleQuery
    Left = 232
  end
  inherited dsHeader: TfdcQuery
    Left = 264
  end
  inherited dsReport: TfdcQuery
    Left = 264
  end
  inherited dsXML: TfdcQuery
    Left = 312
    Top = 24
  end
  object odsGetPayments: TOracleDataSet
    SQL.Strings = (
      'select doc_date,doc_number '
      'from fdc_doc_pack_payments_lst t'
      'where '
      '   t.DOC_DATE between :DATE_FROM and :DATE_TO')
    Variables.Data = {
      03000000020000000A0000003A444154455F46524F4D05000000000000000000
      0000080000003A444154455F544F050000000000000000000000}
    Left = 360
    Top = 48
  end
end
