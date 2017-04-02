inherited SysComponentGridForm: TSysComponentGridForm
  Left = 325
  Top = 281
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1080#1089#1090#1077#1084#1085#1099#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 2
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        object edtSysName: TcxTextEdit [2]
          Left = 9
          Top = 66
          Width = 121
          Height = 21
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            CaptionOptions.Layout = clTop
            Control = edtSysName
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 196
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            DataBinding.FieldName = 'SYSNAME'
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
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
    SQL.Strings = (
      'select *'
      '  from fdc_SysComponent_Lst'
      
        ' where (:Name    is null or upper(NAME)    like upper(:Name)) an' +
        'd'
      '       (:SysName is null or upper(SYSNAME) like upper(:SysName))'
      ' order by Name')
    SourceServerObject = 'FDC_SYSCOMPONENT_LST'
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
        DataType = ftString
        Name = 'SysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SysName'
        ParamType = ptUnknown
      end>
  end
end
