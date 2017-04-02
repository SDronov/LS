inherited TaskGridForm: TTaskGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1076#1072#1095
  PixelsPerInch = 115
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 22
      inherited lblRecordCount: TcxLabel
        Width = 100
        Height = 22
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 22
      inherited lblQueryTime: TcxLabel
        Width = 100
        Height = 22
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 22
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 22
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 22
        end
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 265
          Height = 22
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 22
        inherited lblProgress: TcxLabel
          Width = 281
          Height = 22
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 22
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 225
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
      29
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Task_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and rownum <= :MaxRecordCount')
    SourceServerObject = 'FDC_TASK_LST'
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
