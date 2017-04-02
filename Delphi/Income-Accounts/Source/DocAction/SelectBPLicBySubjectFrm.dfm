inherited SelectBPLicBySubjectForm: TSelectBPLicBySubjectForm
  Left = 354
  Top = 249
  Caption = #1056#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1103' '#1050#1053#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'id'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'typesysname'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'typename'
            Options.Editing = False
            Width = 44
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'name'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn5: TcxGridDBBandedColumn
            DataBinding.FieldName = 'descript'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn6: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'doc_no'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn7: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'doc_date'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn
            Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            DataBinding.FieldName = 'subj_name'
            Options.Editing = False
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn9: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'subj_inn'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn10: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'subj_kpp'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn11: TcxGridDBBandedColumn
            Caption = 'C'
            DataBinding.FieldName = 'from_date'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn12: TcxGridDBBandedColumn
            Caption = #1055#1086
            DataBinding.FieldName = 'to_date'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn13: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1089#1086#1075#1083'.'
            DataBinding.FieldName = 'agrmt_no'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn14: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1089#1086#1075#1083'.'
            DataBinding.FieldName = 'agrmt_date'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 13
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
    Session = MainData.Session
    SQL.Strings = (
      'SELECT lc.*'
      '  from fdc_bp_licence_lst lc'
      ' where lc.subject_id = :subject_id'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
    object dsDataid: TFloatField
      FieldName = 'id'
    end
    object dsDataname: TStringField
      FieldName = 'name'
      Size = 1500
    end
    object dsDatashortname: TStringField
      FieldName = 'shortname'
      Size = 1500
    end
    object dsDataobject_type_id: TFloatField
      FieldName = 'object_type_id'
    end
    object dsDatastate_id: TFloatField
      FieldName = 'state_id'
    end
    object dsDataaccesslevel: TStringField
      FieldName = 'accesslevel'
      Size = 10
    end
    object dsDatasysname: TStringField
      FieldName = 'sysname'
      Size = 1500
    end
    object dsDatadescript: TStringField
      FieldName = 'descript'
      Size = 1500
    end
    object dsDataowner_object_id: TFloatField
      FieldName = 'owner_object_id'
    end
    object dsDatatypename: TStringField
      FieldName = 'typename'
      Size = 1500
    end
    object dsDatatypesysname: TStringField
      FieldName = 'typesysname'
      Size = 1500
    end
    object dsDataobjectkindlist: TStringField
      FieldName = 'objectkindlist'
      Size = 4000
    end
    object dsDatadoc_no: TStringField
      FieldName = 'doc_no'
      Size = 10
    end
    object dsDatadoc_date: TDateTimeField
      FieldName = 'doc_date'
    end
    object dsDatasubject_id: TFloatField
      FieldName = 'subject_id'
    end
    object dsDatasubj_name: TStringField
      FieldName = 'subj_name'
      Size = 1500
    end
    object dsDatasubj_inn: TStringField
      FieldName = 'subj_inn'
      Size = 12
    end
    object dsDatasubj_kpp: TStringField
      FieldName = 'subj_kpp'
      Size = 10
    end
    object dsDatafrom_date: TDateTimeField
      FieldName = 'from_date'
    end
    object dsDatato_date: TDateTimeField
      FieldName = 'to_date'
    end
    object dsDataagrmt_no: TStringField
      FieldName = 'agrmt_no'
      Size = 10
    end
    object dsDataagrmt_date: TDateTimeField
      FieldName = 'agrmt_date'
    end
  end
end
