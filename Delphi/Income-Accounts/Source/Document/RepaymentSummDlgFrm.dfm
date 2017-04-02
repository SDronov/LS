inherited RepaymentSummDlgForm: TRepaymentSummDlgForm
  Left = 356
  Top = 303
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091' '#1080' '#1089#1091#1084#1084#1091' '#1086#1087#1083#1072#1090#1099
  ClientHeight = 111
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 111
    OnEnter = actOkExecute
    inherited btnCancel: TcxButton
      Top = 79
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Top = 79
      ModalResult = 0
      TabOrder = 2
    end
    object cxDateEdit1: TcxDateEdit [2]
      Left = 122
      Top = 9
      ParentFont = False
      Properties.OnEditValueChanged = cxDateEdit1PropertiesEditValueChanged
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 309
    end
    object cxDBCurrencyEdit1: TcxCurrencyEdit [3]
      Left = 122
      Top = 36
      ParentFont = False
      Properties.DisplayFormat = ',0.00'
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseThousandSeparator = True
      Properties.OnEditValueChanged = cxDBCurrencyEdit1PropertiesEditValueChanged
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 1
      Width = 309
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        Control = cxDateEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1057#1091#1084#1084#1072' '#1076#1083#1103' '#1087#1086#1075#1072#1096#1077#1085#1080#1103
        Control = cxDBCurrencyEdit1
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 215
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 215
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Top = 215
  end
  inherited WebEditStyleController: TcxEditStyleController
    Top = 215
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 215
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Top = 215
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 88
    Top = 182
    object sqlPreparePayments: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_payment_helper.prepare;'
        'end;')
    end
    object sqlAddCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_repayment_helper.addcharges(pdocid => :declid,'
        '                             ppaytypeid => :paytypeid,'
        '                             pcurrid => :currencyid,'
        '                             psumma => :TOTALSUMMA,'
        '                             todate => :TODATE,'
        '                             pRepayId => :REPAYID);'
        ''
        'end;'
        '')
    end
    object sqlSummWithInterest: TsqlOp
      SQL.Strings = (
        'begin'
        
          ' :SUMMWI := p_repayment_helper.SummWithInterest(:DECLID,:REPAYID' +
          ',:summ,:todate);'
        'end;'
        '                                     ')
    end
  end
end
