inherited ReportGridForm: TReportGridForm
  Left = 278
  Top = 231
  Caption = 'ReportGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 5
        end
        inherited edtName: TcxTextEdit
          Top = 114
          TabOrder = 3
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 4
        end
        object edtRepNumber: TcxTextEdit [3]
          Left = 9
          Top = 24
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          OnKeyDown = edtSearchKeyDown
          Width = 183
        end
        object edtRepDate: TcxDateEdit [4]
          Left = 76
          Top = 48
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 140
        end
        object chkIsTs: TcxCheckBox [5]
          Left = 9
          Top = 72
          Caption = #1087#1088#1080#1079#1085#1072#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1089#1086#1102#1079#1072
          ParentColor = False
          ParentFont = False
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          State = cbsGrayed
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 183
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciRepNumber: TdxLayoutItem [0]
            Caption = #1053#1086#1084#1077#1088' '#1086#1090#1095#1105#1090#1072':'
            CaptionOptions.Layout = clTop
            Control = edtRepNumber
            ControlOptions.ShowBorder = False
          end
          object lciRepDate: TdxLayoutItem [1]
            Caption = #1044#1072#1090#1072' '#1086#1090#1095#1105#1090#1072':'
            Control = edtRepDate
            ControlOptions.ShowBorder = False
          end
          object lciIsTs: TdxLayoutItem [2]
            Caption = 'cxCheckBox1'
            ShowCaption = False
            Control = chkIsTs
            ControlOptions.ShowBorder = False
          end
          inherited lciName: TdxLayoutItem
            Visible = False
          end
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_report_Lst'
      
        'where (:repnumber is null or upper(rep_number) like upper(:repnu' +
        'mber))'
      '  and (:repdate is null or :repdate = rep_date)'
      '  and (:ists is null or :ists = is_ts)'
      '  and (rownum <= :MaxRecordCount)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'repnumber'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'repnumber'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'repdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'repdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ists'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ists'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
