inherited fdcActCorrectObSelectTypeOBDlgForm: TfdcActCorrectObSelectTypeOBDlgForm
  Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1073#1072#1083#1072#1085#1089#1072
  ClientHeight = 86
  ClientWidth = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 332
    Height = 86
    inherited btnCancel: TcxButton
      Left = 248
      Top = 54
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 167
      Top = 54
      TabOrder = 1
    end
    object cbTypeBalans: TcxComboBox [2]
      Left = 73
      Top = 9
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1055#1086' '#1089#1091#1073#1089#1095#1077#1090#1091' '#1058#1054)
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Text = #1055#1086' '#1089#1091#1073#1089#1095#1077#1090#1091' '#1058#1054
      Width = 558
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lcicbTypeBalans: TdxLayoutItem [0]
        Caption = #1058#1080#1087' '#1073#1072#1083#1072#1085#1089#1072
        Control = cbTypeBalans
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
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 224
    Top = 16
    object sqlOpGetCurDateActID: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_date date := trunc(sysdate);'
        
          '  lv_state_cr fdc_state_lst.id%type := p_actcorrectoperbalans.gv' +
          '_stateid_created;'
        'begin'
        '  select min(id) into :lv_result'
        '  from fdc_actcorrectoperbalans_lst'
        '  where balans_type = :balans_type'
        '    and doc_date >= lv_date'
        '    and doc_date < (lv_date + 1)'
        '    and state_id = lv_state_cr;'
        'end;')
    end
    object sqlOpCreateAct: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_date date := trunc(sysdate);'
        'begin'
        '  :lv_result := p_actcorrectoperbalans.add'
        '   ('
        '     pdocnumber => null'
        '    ,pdocdate => lv_date '
        '    ,pbalans_type => :balans_type'
        '   );'
        'end;')
    end
  end
end
