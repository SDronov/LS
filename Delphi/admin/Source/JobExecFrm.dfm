inherited JobExecForm: TJobExecForm
  Left = 314
  Top = 301
  ActiveControl = DBEdit1
  Caption = 'JobExecForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 297
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Height = 291
        object DBEdit1: TDBEdit [0]
          Left = 95
          Top = 10
          Width = 122
          Height = 17
          BorderStyle = bsNone
          DataField = 'WHEN_STARTED'
          DataSource = srcData
          TabOrder = 0
        end
        object DBEdit2: TDBEdit [1]
          Left = 95
          Top = 35
          Width = 154
          Height = 17
          BorderStyle = bsNone
          DataField = 'WHEN_STOPPED'
          DataSource = srcData
          TabOrder = 1
        end
        object DBEdit3: TDBEdit [2]
          Left = 95
          Top = 60
          Width = 178
          Height = 17
          BorderStyle = bsNone
          DataField = 'IS_ERRORS'
          DataSource = srcData
          TabOrder = 2
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem3: TdxLayoutItem
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
            Control = DBEdit1
          end
          object lcGeneralItem5: TdxLayoutItem
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
            Control = DBEdit2
          end
          object lcGeneralItem7: TdxLayoutItem
            Caption = #1050#1086#1083'-'#1074#1086' '#1086#1096#1080#1073#1086#1082
            Control = DBEdit3
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 291
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Top = 3
        Height = 291
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = #1054#1096#1080#1073#1082#1080
      ImageIndex = 1
      OnShow = cxTabSheet1Show
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
        FloatLeft = 293
        FloatTop = 389
        FloatClientWidth = 23
        FloatClientHeight = 44
        ItemLinks = <
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'JOBEXEC_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select e.*,e.id jobexec_id'
      '  from fdc_Job_Exec_Lst e'
      ' where ID = :ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataJOBLIST_ID: TFloatField
      FieldName = 'JOBLIST_ID'
    end
    object dsDataWHEN_STARTED: TDateTimeField
      FieldName = 'WHEN_STARTED'
    end
    object dsDataWHEN_STOPPED: TDateTimeField
      FieldName = 'WHEN_STOPPED'
    end
    object dsDataIS_ERRORS: TStringField
      FieldName = 'IS_ERRORS'
      Size = 1
    end
    object dsDataJOBEXEC_ID: TFloatField
      FieldName = 'JOBEXEC_ID'
    end
  end
end
