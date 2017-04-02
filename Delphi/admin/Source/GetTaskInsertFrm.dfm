inherited GetTaskInsertForm: TGetTaskInsertForm
  Left = 204
  Top = 311
  Caption = #1057#1082#1088#1080#1087#1090' grants.sql'
  ClientWidth = 892
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 892
    inherited btnCancel: TcxButton
      Left = 785
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 680
      TabOrder = 2
    end
    object edtText: TcxMemo [2]
      Left = 9
      Top = 9
      Align = alClient
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Height = 248
      Width = 401
    end
    object btnClipBoard: TcxButton [3]
      Left = 9
      Top = 269
      Width = 150
      Height = 30
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
      TabOrder = 1
      OnClick = btnClipBoardClick
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Control = edtText
        ControlOptions.ShowBorder = False
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        object dxLayoutControl1Item2: TdxLayoutItem [0]
          Caption = 'cxButton1'
          ShowCaption = False
          Control = btnClipBoard
          ControlOptions.ShowBorder = False
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
  object dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select * from fdc_task_lst_by_CompInsert'
      'where task_Id = :TaskId')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TaskId'
        ParamType = ptUnknown
      end>
    object dsDataINSERTSTRING: TStringField
      FieldName = 'INSERTSTRING'
      Size = 3028
    end
    object dsDataTASK_ID: TFloatField
      FieldName = 'TASK_ID'
    end
  end
end
