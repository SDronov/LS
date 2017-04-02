inherited qEqualINNForm: TqEqualINNForm
  Caption = #1042#1086#1079#1084#1086#1078#1085#1099#1077' '#1076#1091#1073#1083#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044
  ClientHeight = 78
  ClientWidth = 279
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 279
    Height = 78
    inherited btnCancel: TcxButton
      Left = 195
      Top = 46
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 114
      Top = 46
      TabOrder = 1
    end
    object edtINN: TcxButtonEdit [2]
      Left = 32
      Top = 9
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciINN: TdxLayoutItem [0]
        Caption = #1048#1053#1053
        Control = edtINN
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 7
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 44
    Top = 7
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 128
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 156
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 72
    Top = 7
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 100
    Top = 7
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\SVN\IACC\trunk\Delphi\Bin\report\'#1044#1091#1073#1083#1080#1048#1053#1053'.xls'
    DataSources = <
      item
        DataSet = dsReportMaster
        Alias = 'aReportMaster'
        Range = 'masterlist'
        Options = [xrgoAutoOpen]
        Tag = 0
      end
      item
        DataSet = dsReportDetail
        Alias = 'aReportDetail'
        Range = 'list'
        Options = [xrgoAutoOpen]
        Tag = 0
        MasterSourceName = 'aReportMaster'
      end>
    Preview = False
    Params = <>
    Left = 16
    Top = 35
  end
  object dsReportMaster: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'select s.inn'
      '      ,count(*) as reccount'
      '  from fdc_subject_lst s'
      ' where :INN is null or s.inn = :INN'
      ' group by s.inn'
      'having count(*) > 1  ')
    Left = 44
    Top = 35
    ParamData = <
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end>
  end
  object dsReportDetail: TfdcQuery
    DataSource = srcReportMaster
    ReadOnly = False
    SQL.Strings = (
      'select s.inn'
      '      ,s.kpp'
      '      ,s.name'
      '  from fdc_subject_lst s'
      ' where s.inn = :INN ')
    Left = 72
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end>
  end
  object srcReportMaster: TDataSource
    DataSet = dsReportMaster
    Left = 192
    Top = 7
  end
end
