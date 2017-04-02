inherited BrokerContractGridForm: TBrokerContractGridForm
  Caption = #1044#1086#1075#1086#1074#1086#1088#1099' '#1084#1077#1078#1076#1091' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084#1080' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1103#1084#1080' '#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084#1080' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          Left = 101
          Top = 600
          TabOrder = 10
        end
        inherited edtName: TcxTextEdit
          Top = 576
          TabOrder = 11
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 101
          Top = 628
          TabOrder = 12
        end
        object edtSrchBrokerName: TcxTextEdit [3]
          Left = 21
          Top = 55
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
        end
        object edtSrchBrokerINN: TcxMaskEdit [4]
          Left = 21
          Top = 97
          ParentFont = False
          Properties.EditMask = '999999999999;0;_'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Text = '            '
          Width = 121
        end
        object edtSrchBrokerKPP: TcxMaskEdit [5]
          Left = 21
          Top = 139
          ParentFont = False
          Properties.EditMask = '9999999999;0;_'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Text = '          '
          Width = 121
        end
        object edtSrchSubjectName: TcxTextEdit [6]
          Left = 21
          Top = 225
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object edtSrchSubjectINN: TcxMaskEdit [7]
          Left = 21
          Top = 267
          ParentFont = False
          Properties.EditMask = '999999999999;0;_'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Text = '            '
          Width = 143
        end
        object edtSrchSubjectKPP: TcxMaskEdit [8]
          Left = 21
          Top = 309
          ParentFont = False
          Properties.EditMask = '9999999999;0;_'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Text = '          '
          Width = 143
        end
        object edtSrchContractNo: TcxTextEdit [9]
          Left = 21
          Top = 395
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Width = 121
        end
        object edtSrchContractDate: TcxDateEdit [10]
          Left = 21
          Top = 437
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 121
        end
        object edtSrchContractBeginDate: TcxDateEdit [11]
          Left = 21
          Top = 479
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 121
        end
        object edtSrchContractEndDate: TcxDateEdit [12]
          Left = 21
          Top = 521
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 121
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcgSearchBroker: TdxLayoutGroup [0]
            Caption = #1041#1088#1086#1082#1077#1088
            object lcSearchCriteriaItem1: TdxLayoutItem
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              CaptionOptions.Layout = clTop
              Control = edtSrchBrokerName
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem2: TdxLayoutItem
              Caption = #1048#1053#1053
              CaptionOptions.Layout = clTop
              Control = edtSrchBrokerINN
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem3: TdxLayoutItem
              Caption = #1050#1055#1055
              CaptionOptions.Layout = clTop
              Control = edtSrchBrokerKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSearchSubject: TdxLayoutGroup [1]
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            object lcSearchCriteriaItem4: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.Layout = clTop
              Control = edtSrchSubjectName
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem5: TdxLayoutItem
              Caption = #1048#1053#1053
              CaptionOptions.Layout = clTop
              Control = edtSrchSubjectINN
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem6: TdxLayoutItem
              Caption = #1050#1055#1055
              CaptionOptions.Layout = clTop
              Control = edtSrchSubjectKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSearchContract: TdxLayoutGroup [2]
            Caption = #1044#1086#1075#1086#1074#1086#1088
            object lcSearchCriteriaItem7: TdxLayoutItem
              Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
              CaptionOptions.Layout = clTop
              Control = edtSrchContractNo
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem8: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
              CaptionOptions.Layout = clTop
              Control = edtSrchContractDate
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem9: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1085#1077' '#1088#1072#1085#1077#1077
              CaptionOptions.Layout = clTop
              Control = edtSrchContractBeginDate
              ControlOptions.ShowBorder = False
            end
            object lcSearchCriteriaItem10: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1085#1077' '#1087#1086#1079#1076#1085#1077#1077
              CaptionOptions.Layout = clTop
              Control = edtSrchContractEndDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciSearchBtn: TdxLayoutItem [3]
            CaptionOptions.Layout = clTop
          end
          inherited lciName: TdxLayoutItem [4]
            Visible = False
          end
          inherited lciSearchClearBtn: TdxLayoutItem [5]
            CaptionOptions.Layout = clTop
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsView.BandHeaders = True
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
              Visible = False
            end
            item
              Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
            end
            item
              Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            end
            item
              Caption = #1044#1086#1075#1086#1074#1086#1088
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewBROKER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BROKER_NAME'
            Width = 200
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBROKER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BROKER_INN'
            Width = 110
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBROKER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BROKER_KPP'
            Width = 110
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_TYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_TYPENAME'
            Width = 130
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 200
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_INN'
            Width = 110
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_KPP'
            Width = 110
            Position.BandIndex = 2
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_DOC'
            Width = 140
            Position.BandIndex = 2
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCONTRACT_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CONTRACT_NO'
            Width = 90
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCONTRACT_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CONTRACT_DATE'
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBEGIN_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BEGIN_DATE'
            Position.BandIndex = 3
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEND_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'END_DATE'
            Position.BandIndex = 3
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_AUTHORIZE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_AUTHORIZE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 3
            Position.ColIndex = 4
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
      '  FROM fdc_Broker_Contract_Lst'
      
        ' WHERE ( :broker_name   IS NULL OR UPPER( broker_name )  LIKE UP' +
        'PER( :broker_name )  )'
      
        '   AND ( :broker_inn    IS NULL OR broker_inn            LIKE :b' +
        'roker_inn            )'
      
        '   AND ( :broker_kpp    IS NULL OR broker_kpp            LIKE :b' +
        'roker_kpp            )'
      
        '   AND ( :subject_name  IS NULL OR UPPER( subject_name ) LIKE UP' +
        'PER( :subject_name ) )'
      
        '   AND ( :subject_inn   IS NULL OR subject_inn           LIKE :s' +
        'ubject_inn           )'
      
        '   AND ( :subject_kpp   IS NULL OR subject_kpp           LIKE :s' +
        'ubject_kpp           )'
      
        '   AND ( :contract_no   IS NULL OR UPPER( contract_no )  LIKE UP' +
        'PER( :contract_no )  )'
      
        '   AND ( :contract_date IS NULL OR contract_date =  :contract_da' +
        'te                   )'
      
        '   AND ( :date_from     IS NULL OR begin_date    >= :date_from  ' +
        '                     )'
      
        '   AND ( :date_to       IS NULL OR end_date      <= :date_to    ' +
        '                     )'
      '   AND ( :id            IS NULL OR broker_id     =  :id )'
      '   AND rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftString
        Name = 'broker_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'broker_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'broker_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'broker_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'broker_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'broker_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subject_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contract_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'contract_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'contract_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'contract_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataBROKER_ID: TFloatField
      FieldName = 'BROKER_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCONTRACT_NO: TStringField
      DisplayLabel = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'CONTRACT_NO'
      Size = 150
    end
    object dsDataCONTRACT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'CONTRACT_DATE'
    end
    object dsDataBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'BEGIN_DATE'
    end
    object dsDataEND_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'END_DATE'
    end
    object dsDataIS_AUTHORIZE: TStringField
      DisplayLabel = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1086#1087#1083#1072#1090#1099
      FieldName = 'IS_AUTHORIZE'
      Size = 1
    end
    object dsDataBROKER_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'BROKER_NAME'
      Size = 4000
    end
    object dsDataBROKER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'BROKER_INN'
      Size = 12
    end
    object dsDataBROKER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'BROKER_KPP'
      Size = 10
    end
    object dsDataSUBJECT_TYPENAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'SUBJECT_TYPENAME'
      Size = 1500
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SUBJECT_NAME'
      Size = 4000
    end
    object dsDataSUBJECT_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object dsDataSUBJECT_DOC: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldKind = fkCalculated
      FieldName = 'SUBJECT_DOC'
      Size = 61
      Calculated = True
    end
  end
end
