inherited SubjectGridForm: TSubjectGridForm
  Width = 684
  Caption = #1057#1087#1080#1089#1086#1082' '#1057#1091#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 120
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 676
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited lblRecordCount: TcxLabel
        Height = 25
        Width = 102
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 25
        Width = 106
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 370
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 370
      end
      inherited pnlProgress: TPanel
        Width = 370
        inherited lblProgress: TcxLabel
          Height = 25
          Width = 370
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 583
      inherited ProgressBar: TcxProgressBar
        Height = 24
        Width = 98
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 676
  end
  inherited pnlWorkspace: TPanel
    Width = 676
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        object edtNAME: TcxTextEdit [1]
          Left = 108
          Top = 12
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 0
          Width = 161
        end
        object edtINN: TcxTextEdit [2]
          Left = 108
          Top = 40
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 1
          Width = 161
        end
        object edtKPP: TcxTextEdit [3]
          Left = 108
          Top = 68
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 2
          Width = 161
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [0]
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Control = edtNAME
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 408
      inherited grdData: TcxGrid
        Width = 408
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
      end
    end
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select t.id, t.inn, t.kpp, t.name from fdc_subject_lst t'
      'where'
      '/*t.typesysname in ('#39'Declarant'#39', '#39'Person'#39', '#39'Broker'#39')'
      'and*/ (:name is null or name like :name)'
      'and (:inn is null or inn like :inn)'
      'and (:kpp is null or kpp like :kpp)'
      'and rownum < :MaxRecordCount')
    Left = 137
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
  end
end
