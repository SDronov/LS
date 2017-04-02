inherited SubjectFeeGridForm: TSubjectFeeGridForm
  Left = 341
  Top = 409
  HelpContext = 45
  Caption = #1055#1088#1086#1095#1080#1077' '#1089#1087#1080#1089#1072#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 7
        end
        inherited edtName: TcxTextEdit
          Left = 52
          Top = 9
          Width = 135
        end
        object edtFrom: TcxDateEdit [2]
          Left = 52
          Top = 105
          ParentFont = False
          Properties.ImmediatePost = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 104
        end
        object edtTo: TcxDateEdit [3]
          Left = 52
          Top = 129
          ParentFont = False
          Properties.ImmediatePost = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 104
        end
        object edtNo: TcxTextEdit [4]
          Left = 52
          Top = 81
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 104
        end
        object edtINN: TcxTextEdit [5]
          Left = 52
          Top = 33
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 104
        end
        object edtKPP: TcxTextEdit [6]
          Left = 52
          Top = 57
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 104
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 6
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1072#1080#1084'.:'
            CaptionOptions.Layout = clLeft
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [1]
            Caption = #1048#1053#1053
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem5: TdxLayoutItem [2]
            Caption = #1050#1055#1055
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [3]
            Caption = #1053#1086#1084#1077#1088
            Control = edtNo
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [4]
            Caption = #1044#1072#1090#1072' '#1089
            Control = edtFrom
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [5]
            Caption = #1044#1072#1090#1072' '#1087#1086
            Control = edtTo
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewMODIFY_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODIFY_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACT_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACT_NO'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBT_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'CHARGED'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = ',0.00'
            Width = 102
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1095#1077#1085#1086
            DataBinding.FieldName = 'PAYED'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = ',0.00'
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,fdc_decl_debt_get_count(t.id) debt_count'
      '      ,fdc_decl_charge_get_summ_decl ( t.id ) charged'
      '      ,fdc_decl_ded_get_summ_decl( t.id )     payed'
      '  from fdc_Subject_Fee_Lst t'
      ' where (:name is null or t.DECL_NAME like :name)'
      '   and (:from_date is null or t.Modify_Date >= :from_date)'
      '   and (:to_date is null or t.modify_date <= :to_date)'
      '   and (:INN is null or t.DECL_INN like :INN)'
      '   and (:KPP is null or t.DECL_KPP like :KPP)'
      '   and (:ACT_NO is null or t.act_no like :ACT_NO)'
      
        '    and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID' +
        ')'
      '   and rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
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
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACT_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACT_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataMODIFY_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'MODIFY_DATE'
    end
    object dsDataACT_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ACT_NO'
      Size = 30
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDEBT_COUNT: TFloatField
      FieldName = 'DEBT_COUNT'
      Visible = False
    end
    object dsDataCHARGED: TFloatField
      FieldName = 'CHARGED'
    end
    object dsDataPAYED: TFloatField
      FieldName = 'PAYED'
    end
  end
end
