inherited ObjectRelationGridByObjectForm: TObjectRelationGridByObjectForm
  Left = 331
  Top = 241
  Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1077' '#1086#1073#1098#1077#1082#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            Position.ColIndex = 1
          end
          inherited grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Width = 53
            Position.ColIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1085#1086#1096#1077#1085#1080#1103
            Width = 190
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewROLE: TcxGridDBBandedColumn
            Caption = #1056#1086#1083#1100
            DataBinding.FieldName = 'ROLE'
            Width = 135
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRELOBJNAME: TcxGridDBBandedColumn
            Caption = #1057#1074#1103#1079#1072#1085' '#1089
            DataBinding.FieldName = 'RELOBJNAME'
            Width = 202
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRELOBJTYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RELOBJTYPENAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRELOBJTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RELOBJTYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
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
      'select ID,'
      '          Name,'
      '          ShortName,'
      '          Object_Type_ID,'
      '          State_ID,'
      '          AccessLevel,'
      '          SysName,'
      '          Descript,'
      '          Owner_Object_ID,'
      '          TypeName,'
      '          TypeSysName,'
      '          Rel_Object_ID,'
      '          Role,'
      '          RObjName  as RelObjName,'
      '          RObj_Type_ID  as Rel_Obj_Type_ID,'
      '          RObjTypeName  as RelObjTypeName,'
      '          RObjTypeSysName  as RelObjTypeSysName,'
      '          0 as IsBackward'
      '  from fdc_Object_Relation_Lst'
      ' where Object_ID = :ID'
      '    union'
      'select ID,'
      '          Name,'
      '          ShortName,'
      '          Object_Type_ID,'
      '          State_ID,'
      '          AccessLevel,'
      '          SysName,'
      '          Descript,'
      '          Owner_Object_ID,'
      '          TypeName,'
      '          TypeSysName,'
      '          Object_ID as Rel_Object_ID,'
      '          BackwardRole as Role,'
      '          ObjName as RelObjName,'
      '          RObj_Type_ID as Rel_Obj_Type_ID,'
      '          RObjTypeName as RelObjTypeName,'
      '          RObjTypeSysName as RelObjTypeSysName,'
      '          1 as IsBackward'
      '  from fdc_Object_Relation_Lst'
      'where Rel_Object_ID = :ID'
      '')
    SourceServerObject = 'FDC_OBJECT_RELATION_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataREL_OBJECT_ID: TFloatField
      FieldName = 'REL_OBJECT_ID'
    end
    object dsDataROLE: TStringField
      FieldName = 'ROLE'
      Size = 1500
    end
    object dsDataRELOBJNAME: TStringField
      FieldName = 'RELOBJNAME'
      Size = 1500
    end
    object dsDataREL_OBJ_TYPE_ID: TFloatField
      FieldName = 'REL_OBJ_TYPE_ID'
    end
    object dsDataRELOBJTYPENAME: TStringField
      FieldName = 'RELOBJTYPENAME'
      Size = 1500
    end
    object dsDataRELOBJTYPESYSNAME: TStringField
      FieldName = 'RELOBJTYPESYSNAME'
      Size = 1500
    end
    object dsDataISBACKWARD: TFloatField
      FieldName = 'ISBACKWARD'
    end
  end
end
