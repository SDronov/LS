inherited qBackOrPaymentForm: TqBackOrPaymentForm
  Caption = 'qBackOrPaymentForm'
  ClientHeight = 172
  ClientWidth = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 482
    Height = 172
    inherited btnCancel: TcxButton
      Left = 398
      Top = 140
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 317
      Top = 140
      TabOrder = 3
    end
    inherited edtDateFrom: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 371
    end
    object chkAppendix: TcxDBCheckBox [4]
      Left = 9
      Top = 109
      AutoSize = False
      Caption = #1089' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077#1084' '#1082' '#1086#1090#1095#1077#1090#1091
      DataBinding.DataField = 'APPENDIX'
      DataBinding.DataSource = srcParam
      ParentColor = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.ImmediatePost = True
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 180
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object liAppendix: TdxLayoutItem [1]
        AllowRemove = False
        Caption = 'cxDBCheckBox1'
        CaptionOptions.Layout = clRight
        ShowCaption = False
        Control = chkAppendix
        ControlOptions.FixedSize = True
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
  inherited dsHeader: TfdcQuery
    Left = 232
    Top = 8
  end
  inherited dsData: TfdcQuery
    Left = 232
    Top = 56
  end
  inherited xlReport: TxlReport
    ActiveSheet = #1054#1090#1095#1077#1090
    OnBeforeBuild = xlReportBeforeBuild
    Top = 72
  end
  inherited dsParam: TdxMemData
    object dsParamAppendix: TIntegerField
      DisplayLabel = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1082' '#1086#1090#1095#1077#1090#1091
      FieldName = 'APPENDIX'
    end
  end
  object dsAppendix: TfdcQuery
    DataSource = srcParam
    ReadOnly = False
    Left = 280
    Top = 56
  end
  object dsSum: TOracleQuery
    SQL.Strings = (
      'SELECT COUNT(t.id) cnt, nvl(SUM(t.summa), 0) summa'
      
        'FROM (  SELECT t3.id, t3.summa, t3.typesysname, t3.decision_cour' +
        't, t3.excise_pay, t3.sub_code'
      'FROM'
      'fdc_rep_payback_lst t3'
      'INNER JOIN fdc_po_payback_lst   r   ON r.DEC_PAY_ID = t3.id'
      
        'INNER JOIN fdc_po_payback_y_lst r_y ON r_y.CONFIRMED_DOC_ID = r.' +
        'id AND r_y.IS_CONFIRM = '#39'Y'#39
      'AND r_y.DOC_DATE BETWEEN :DATE_FROM AND :DATE_TO'
      'UNION'
      
        'SELECT t2.id, t2.summa , t2.typesysname, t2.decision_court, t2.e' +
        'xcise_pay, t2.sub_code'
      'FROM fdc_rep_payback_lst t1, fdc_rep_dec_payment_lst t2'
      'WHERE t2.sign_date BETWEEN :DATE_FROM AND :DATE_TO'
      'AND t1.id = t2.id'
      ') t'
      'WHERE 1=1'
      '  :REASON'
      '  :COURT'
      '  :EXCISE '
      '  :DEC_TYPE'
      '/*select COUNT(t.id) cnt, nvl(SUM(t.summa), 0) summa'
      'from fdc_rep_payback_lst t'
      'WHERE t.sign_date BETWEEN :DATE_FROM AND :DATE_TO'
      '  :REASON'
      '  :COURT'
      '  :EXCISE '
      '  :DEC_TYPE*/')
    Variables.Data = {
      03000000060000000A0000003A444154455F46524F4D0C000000000000000000
      0000080000003A444154455F544F0C0000000000000000000000070000003A52
      4541534F4E010000000000000000000000060000003A434F5552540100000000
      00000000000000070000003A4558434953450100000000000000000000000900
      00003A4445435F54595045010000000000000000000000}
    Left = 168
    Top = 120
  end
end
