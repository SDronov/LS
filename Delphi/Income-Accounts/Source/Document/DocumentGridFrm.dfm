inherited DocumentGridForm: TDocumentGridForm
  Top = 245
  Height = 453
  Caption = 'DocumentGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 405
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 17
      inherited lblRecordCount: TcxLabel
        Height = 17
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 17
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 17
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 17
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 17
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 17
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 17
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 402
  end
  inherited pnlWorkspace: TPanel
    Height = 376
    inherited splSearchCriteria: TSplitter
      Height = 376
    end
    inherited pnlSearchCriteria: TPanel
      Height = 376
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 356
        inherited btnSearch: TcxButton
          Left = 101
          Top = 357
          TabOrder = 8
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 101
          Top = 328
          TabOrder = 7
        end
        object edtDocDateFrom: TcxDateEdit [3]
          Left = 35
          Top = 79
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 121
        end
        object edtDocDateTo: TcxDateEdit [4]
          Left = 35
          Top = 106
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 121
        end
        object edtDocNumber: TcxMaskEdit [5]
          Left = 9
          Top = 161
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object cbIsActive: TcxComboBox [6]
          Left = 9
          Top = 203
          ParentFont = False
          Properties.Items.Strings = (
            #1042#1089#1077
            #1055#1088#1086#1074#1077#1076#1105#1085#1085#1099#1077
            #1053#1077#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1077)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Text = #1042#1089#1077
          Width = 121
        end
        object edtActDateFrom: TcxDateEdit [7]
          Left = 35
          Top = 261
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 121
        end
        object edtActDateTo: TcxDateEdit [8]
          Left = 35
          Top = 288
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 121
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaGroup1: TdxLayoutGroup [1]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            object lcSearchCriteriaItem2: TdxLayoutItem
              Caption = #1089
              Control = edtDocDateFrom
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem3: TdxLayoutItem
              Caption = #1087#1086
              Control = edtDocDateTo
              ControlOptions.ShowBorder = False
            end
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [2]
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            CaptionOptions.Layout = clTop
            Control = edtDocNumber
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem6: TdxLayoutItem [3]
            Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1080#1077
            CaptionOptions.Layout = clTop
            Control = cbIsActive
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaGroup2: TdxLayoutGroup [4]
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            object lcSearchCriteriaItem7: TdxLayoutItem
              Caption = #1089
              Control = edtActDateFrom
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem8: TdxLayoutItem
              Caption = #1087#1086
              Control = edtActDateTo
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 376
      inherited grdData: TcxGrid
        Height = 376
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end
            item
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 170
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Width = 200
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Options.IncSearch = False
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Options.Grouping = False
            Width = 150
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Options.IncSearch = False
            Width = 90
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Options.IncSearch = False
            Position.BandIndex = 1
            Position.ColIndex = 3
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM fdc_Document_Lst'
      
        ' WHERE (:Name          IS NULL OR UPPER( name       ) LIKE UPPER' +
        '( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( doc_number ) LIKE UPPER' +
        '( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR doc_date >= :doc_date_from    ' +
        '   )'
      
        '   AND (:doc_date_to   IS NULL OR doc_date <= :doc_date_to      ' +
        '   )'
      
        '   AND (:is_active     IS NULL OR is_active = :is_active        ' +
        '   )'
      
        '   AND (:act_date_from IS NULL OR activation_date >= :act_date_f' +
        'rom)'
      
        '   AND (:act_date_to   IS NULL OR activation_date <= :act_date_t' +
        'o  )')
    SourceServerObject = 'FDC_DOCUMENT_LST'
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
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
  end
end
