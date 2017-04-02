inherited PersonalAccountJoinGridForm: TPersonalAccountJoinGridForm
  Caption = #1057#1083#1080#1103#1085#1080#1077' '#1089#1095#1077#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 115
        end
        inherited edtKPP: TcxTextEdit
          Width = 115
        end
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
      26
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Dat'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT t.*'
      '  FROM fdc_personal_account_lst t'
      '  WHERE'
      '  (:NAME is null or :NAME = :NAME)'
      '  and id <> :id'
      '/*$p#inn#*/ and (inn        LIKE :INN)'
      '/*$p#kpp#*/ and (kpp        LIKE :KPP)'
      '  START WITH t.id = :ID'
      '  CONNECT BY PRIOR t.ID = t.parent_id'
      ''
      '')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
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
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 136
    Top = 168
    object sqlUpdateParent: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_personal_account.mergels('
        '      pid       => :pid'
        '     ,pmergedid => :pMergedID'
        '    );'
        'end;')
    end
    object sqlRemoveParent: TsqlOp
      SQL.Strings = (
        'begin'
        '  update FDC_PERSONAL_ACCOUNT'
        '   set parent_id = null,'
        '       edate = null'
        '  where id = :pId;'
        'end;')
    end
  end
end
