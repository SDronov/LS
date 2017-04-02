inherited EventGridByObjectForm: TEventGridByObjectForm
  Caption = #1057#1086#1073#1099#1090#1080#1103' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 275
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 275
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 275
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 275
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 485
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtDateFrom: TcxDateEdit
          Width = 105
        end
        inherited edtDateTo: TcxDateEdit
          Width = 105
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select /*+ INDEX (FDC_EVENT_OBJECT_ID) */ *'
      '  from fdc_Event_Lst'
      ' where OBJECT_ID in (select ID'
      '     from fdc_Object_Lst_ID'
      '     start with ID = :ID'
      '     connect by prior ID = OWNER_OBJECT_ID)'
      '/*$p#name#*/ and upper(NAME) like upper(:Name) '
      '/*$p#DateFrom#*/ and MOMENT >= :DateFrom'
      '/*$p#DateTo#*/  and MOMENT <= :DateTo'
      'order by MOMENT desc')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DateTo'
        ParamType = ptUnknown
      end>
    inherited dsDataOBJECTKINDLIST: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
  end
end
