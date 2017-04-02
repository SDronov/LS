{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcInspectorFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcInspectorFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, DB, Grids, DBGrids, DBTables, ExtCtrls,
  Buttons, ImgList, fdcCustomFrm, Clipbrd, OracleData;

type
  TXDBAvComp = class(TComponent)
  public
    comp: TComponent;
    DataSource: TDAtaSource;
  end;

  TfdcInspectorForm = class(TfdcCustomForm)
    ObjPages: TPageControl;
    QueryTS: TTabSheet;
    ImageList1: TImageList;
    FormTS: TTabSheet;
    QueryPages: TPageControl;
    AttrTS: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQL: TMemo;
    FieldsTS: TTabSheet;
    ParamsTS: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Value: TEdit;
    Panel7: TPanel;
    ParamValue: TEdit;
    Panel8: TPanel;
    Label16: TLabel;
    RecordCountBtn: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
      Name: TLabel;
    Caption: TLabel;
    Panel12: TPanel;
    Label17: TLabel;
    EmptyTS: TTabSheet;
    Label15: TLabel;
    Panel13: TPanel;
    Tree: TTreeView;
    DataSource: TDataSource;
    DBATS: TTabSheet;
    Panel15: TPanel;
    Panel17: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Splitter1: TSplitter;
    Label13: TLabel;
    Panel14: TPanel;
    FieldsGrid: TStringGrid;
    Panel16: TPanel;
    ParamsList: TListView;
    ParamsGrid: TStringGrid;
    FormParamsTS: TTabSheet;
    Panel18: TPanel;
    FormParamsGrid: TStringGrid;
    Panel19: TPanel;
    FormParamValue: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure RecordCountBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FieldsGridSelectCell(Sender: TObject; Col, Row: Longint;
      var CanSelect: Boolean);
    procedure ParamsGridSelectCell(Sender: TObject; ACol, ARow: Longint;
      var CanSelect: Boolean);
    procedure FieldsGridDrawCell(Sender: TObject; ACol, ARow: Longint;
      Rect: TRect; State: TGridDrawState);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormParamsGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fSourceList: TList;
    fSetList: TList;
    fNodeList: TList;
    fDBAvareList: TList;
    procedure FillTree;
    procedure FillQueryTS;
    procedure FillFormTS;
    procedure FillFormParamsTS;
    procedure FillDBATS;
    procedure FillFields;
    procedure FillParams;
    procedure FillChilds(n: TTreeNode);
    //procedure FillChildsForQuery(n: TTreeNode);
    procedure FillLists;
    procedure FillListsChilds(c: TComponent);
  public

  end;

var
  fdcInspectorForm: TfdcInspectorForm;

procedure ExecInspector;

implementation

uses DBCtrls, fdcQuery, fdcParamsHolder;

{$R *.DFM}

procedure ExecInspector;
var
  f: TfdcInspectorForm;
  i: integer;
  ds: TDataSet;
begin
  f := TfdcInspectorForm.create(application);

  f.tree.items.BeginUpdate;
  f.FillTree;
  f.tree.items.EndUpdate;

  ds := nil;
  if (Assigned(screen.activeForm)) and
     (Assigned(screen.activeForm.activeControl)) and
     (screen.activeForm.activeControl is TDBGrid) and
    ((screen.activeForm.activeControl as TDBGrid).DataSource <> nil) and
    ((screen.activeForm.activeControl as TDBGrid).DataSource.DataSet <> nil)
      then
    ds := (screen.activeForm.activeControl as TDBGrid).DataSource.DataSet;
  if ds <> nil then
  begin
    for i := 0 to f.fNodeList.count - 1 do
      if TTreeNode(f.fNodeList[i]).data = ds then
      begin
        f.tree.selected := TTreeNode(f.fNodeList[i]);
        break;
      end;
  end
  else
  begin
    for i := 0 to f.fNodeList.count - 1 do
      if (TTreeNode(f.fNodeList[i]).data <> nil) and
        (TTreeNode(f.fNodeList[i]).data = screen.activeForm) then
      begin
        f.tree.selected := TTreeNode(f.fNodeList[i]);
        f.tree.selected.expand(false);
        break;
      end;
  end;

  f.activeControl := f.tree;
  if screen.activeForm.ModalResult <> mrNone then
    f.showModal
  else
    f.show;

end;

procedure SetNodeImages(n: TTreeNode);
var
  im: integer;
begin
  im := 0;
  if n.data = nil then
  begin
    n.ImageIndex := 0;
    n.SelectedIndex := 0;
    exit;
  end;
  if (TObject(n.Data) is TForm) or (TObject(n.Data) is TDataModule) then
    im := 1
  else if (TObject(n.Data) is TDataSet) then
  begin
    if (TObject(n.Data) as TDataSet).active then
      im := 2
    else
      im := 3;
  end
  else if (TObject(n.Data) is TDataSource) then
    im := 4
  else if (TObject(n.Data) is TXDBAvComp) then
    im := 5
  else if (TObject(n.Data) is TfdcParamsHolder) then
    im := 6;

  n.ImageIndex := im;
  n.SelectedIndex := im;
end;

procedure TfdcInspectorForm.FillLists;
var
  i: integer;
begin
  fSourceList.clear;
  fSetList.clear;
  for i := 0 to fDBAvareList.count - 1 do
    TObject(fDBAvareList[i]).free;
  fDBAvareList.clear;

  FillListsChilds(Application);
end;

procedure TfdcInspectorForm.FillListsChilds(c: TComponent);
var
  i: integer;
  a: TXDBAvComp;
begin
  for i := 0 to c.componentCount - 1 do
  begin
    if (c.components[i] is TDataSource) then
      fSourceList.add(c.components[i]);
    if (c.components[i] is TDataSet) then
      fSetList.add(c.components[i]);

    if (c.components[i] is TDBGrid) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBGrid);
      a.DataSource := (c.components[i] as TDBGrid).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBEdit) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBEdit);
      a.DataSource := (c.components[i] as TDBEdit).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBText) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBText);
      a.DataSource := (c.components[i] as TDBText).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBMemo) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBMemo);
      a.DataSource := (c.components[i] as TDBMemo).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBLookupComboBox) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBLookupComboBox);
      a.DataSource := (c.components[i] as TDBLookupComboBox).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBCheckBox) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBCheckBox);
      a.DataSource := (c.components[i] as TDBCheckBox).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBRadioGroup) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBRadioGroup);
      a.DataSource := (c.components[i] as TDBRadioGroup).DataSource;
      fDBAvareList.add(a);
    end;

    {if (c.components[i] is TDBCtrlGrid) then
     begin
     a := TXDBAvComp.create(nil);
     a.comp := (c.components[i] as TDBCtrlGrid);
     a.DataSource := (c.components[i] as TDBCtrlGrid).DataSource;
     fDBAvareList.add(a);
     end;}

    if (c.components[i] is TDBLookupListBox) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBLookupListBox);
      a.DataSource := (c.components[i] as TDBLookupListBox).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBComboBox) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBComboBox);
      a.DataSource := (c.components[i] as TDBComboBox).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBListBox) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBListBox);
      a.DataSource := (c.components[i] as TDBListBox).DataSource;
      fDBAvareList.add(a);
    end;

    if (c.components[i] is TDBImage) then
    begin
      a := TXDBAvComp.create(nil);
      a.comp := (c.components[i] as TDBImage);
      a.DataSource := (c.components[i] as TDBImage).DataSource;
      fDBAvareList.add(a);
    end;

    FillListsChilds(c.components[i]);
  end;
end;

procedure TfdcInspectorForm.FillTree;
var
  i: integer;
  ac, mf, n: TTreeNode;
begin
  FillLists;
  fNodeList.clear;
  tree.items.clear;
  mf := tree.items.addObject(nil, Application.MainForm.caption,
    Application.MainForm);
  fNodeList.add(mf);
  FillChilds(mf);

  ac := tree.items.addObject(nil, 'Normal Forms', nil);
  fNodeList.add(ac);

  for i := 0 to Application.componentCount - 1 do
  begin
    n := nil;
    if (Application.components[i] is TForm) and
      (Application.components[i] <> Application.MainForm) then
    begin
      n := tree.items.addChildObject(ac,
        (Application.components[i] as TForm).caption + ' : ' +
        Application.components[i].className,
        Application.components[i]);

    end;
    if (Application.components[i] is TDataModule) then
    begin
      n := tree.items.addChildObject(ac,
        Application.components[i].name + ' : ' +
        Application.components[i].className,
        Application.components[i]);

    end;
    if n <> nil then
    begin
      fNodeList.add(n);
      FillChilds(n);
    end;
  end;
  for i := 0 to fNodeList.count - 1 do
    SetNodeImages(TTreeNode(fNodeList[i]));
end;

procedure TfdcInspectorForm.FillChilds(n: TTreeNode);
var
  i: integer;
  cn: TTreeNode;
  c: TComponent;
  s: string;
begin
  if (n = nil) or (n.data = nil) then
    exit;
  c := (TObject(n.Data) as TComponent);
  if (c is TForm) or (c is TDataModule) then
    for i := 0 to c.componentCount - 1 do
    begin
      cn := nil;
      if (c.components[i] is TForm) then
      begin
        cn := tree.items.addChildObject(n,
          (c.components[i] as TForm).caption + ' : ' +
          c.components[i].className,
          c.components[i]);
      end;
      if (c.components[i] is TDataModule) then
      begin
        cn := tree.items.addChildObject(n,
          c.components[i].name + ' : ' +
          c.components[i].className,
          c.components[i]);
      end;
      if (c.components[i] is TDataSet) then
      begin
        if (c.components[i] as TDataSet).DataSource = nil then
          cn := tree.items.addChildObject(n,
            c.components[i].name + ' : ' +
            c.components[i].className,
            c.components[i]);
      end;
      if (c.components[i] is TfdcParamsHolder) then
      begin
        cn := tree.items.addChildObject(n,
          c.components[i].name + ' : ' +
          c.components[i].className,
          c.components[i]);
      end;

      if cn <> nil then
      begin
        fNodeList.add(cn);
        FillChilds(cn);
      end;
    end;

  if (c is TDataSet) then
  begin
    for i := 0 to fSourceList.count - 1 do
      if TDataSource(fSourceList[i]).DataSet = c then
      begin
        s := TDataSource(fSourceList[i]).name + ' : ' +
          TDataSource(fSourceList[i]).className;

        if TDataSource(fSourceList[i]).owner <> c.owner then
          s := TDataSource(fSourceList[i]).owner.name + '.' + s;

        cn := tree.items.addChildObject(n, s,
          TDataSource(fSourceList[i]));
        fNodeList.add(cn);
        FillChilds(cn);
      end;
  end;

  if (c is TDataSource) then
  begin
    for i := 0 to fSetList.count - 1 do
      if TDataSet(fSetList[i]).DataSource = c then
      begin
        s := TDataSet(fSetList[i]).name + ' : ' +
          TDataSet(fSetList[i]).className;
        if TDataSet(fSetList[i]).owner <> c.owner then
          s := TDataSet(fSetList[i]).owner.name + '.' + s;
        cn := tree.items.addChildObject(n, s,
          TDataSet(fSetList[i]));
        fNodeList.add(cn);
        FillChilds(cn);
      end;
    for i := 0 to fDBAvareList.count - 1 do
      if TXDBAvComp(fDBAvareList[i]).DataSource = c then
      begin
        s := TXDBAvComp(fDBAvareList[i]).comp.name + ' : ' +
          TXDBAvComp(fDBAvareList[i]).comp.ClassName;
        if TXDBAvComp(fDBAvareList[i]).comp.owner <> c.owner then
          s := TXDBAvComp(fDBAvareList[i]).comp.owner.name + '.' + s;
        cn := tree.items.addChildObject(n, s,
          TXDBAvComp(fDBAvareList[i]));
        fNodeList.add(cn);
        FillChilds(cn);
      end;
  end;

end;

{procedure TfdcInspectorForm.FillChildsForQuery(n: TTreeNode);
var
  ds: TDataSet;
  i: integer;
  s: string;
  nn: TTreeNode;
begin
  if (n.data = nil) or (not (TObject(n.data) is TDataSet)) then
    exit;
  ds := (TObject(n.data) as TDataSet);
  for i := 0 to fSourceList.count - 1 do
    if TDataSource(fSourceList[i]).DataSet = ds then
    begin
      s := TDataSource(fSourceList[i]).name;
      if TDataSource(fSourceList[i]).owner <> ds.owner then
        s := TDataSource(fSourceList[i]).owner.name + '.' + s;
      nn := tree.items.AddChildObject(n, s, fSourceList[i]);
      SetNodeImages(nn);
    end;

end;}

procedure TfdcInspectorForm.TreeChange(Sender: TObject; Node: TTreeNode);
var
  ds: TDataSet;
begin
  if tree.selected.data = nil then
  begin
    DataSource.DataSet := nil;
    ObjPages.activePage := EmptyTS;
    exit;
  end;

  if (TObject(tree.selected.data) is TDataSet) then
  begin
    ds := (TObject(tree.selected.data) as TDataSet);
    DataSource.DataSet := ds;
    FillQueryTS;
  end

  else if (TObject(tree.selected.data) is TForm) or
    (TObject(tree.selected.data) is TDataModule) then
  begin
    DataSource.DataSet := nil;
    FillFormTS;
  end

  else if (TObject(tree.selected.data) is TfdcParamsHolder) then
  begin
    DataSource.DataSet := nil;
    FillFormParamsTS;
  end

  else if (TObject(tree.selected.data) is TXDBAvComp) then
  begin
    DataSource.DataSet := nil;
    FillDBATS;
  end

  else
    ObjPages.activePage := EmptyTS;
end;

procedure TfdcInspectorForm.FillQueryTS;
var
  q: TDataSet;
  CachUpd: Boolean;
begin
  if (tree.selected.data = nil) or
    (not (TObject(tree.selected.data) is TDataSet)) then
    exit;
    
  q := (TObject(tree.selected.data) as TDataSet);

  ObjPages.ActivePage := QueryTS;

  SQL.lines.text := '';
  label6.caption := '';
  label8.caption := 'undefine';
  Label16.caption := '???';
    
  CachUpd := False;
  RecordCountBtn.Enabled := q.active;
  
  if q.active then
    label4.caption := 'true'
  else
    label4.caption := 'false';

  if (q is TTable) then
    label5.caption := (q as TTable).DatabaseName
  else if (q is TStoredProc) then
    label5.caption := (q as TStoredProc).DatabaseName
  else  
    label5.caption := '';

  if q is TQuery then
  begin
    label5.caption := (q as TQuery).DatabaseName;  
    if (q as TQuery).DataSource <> nil then
    begin
      label6.caption := (q as TQuery).DataSource.name;
      if (q as TQuery).DataSource.owner <> q.owner then
        label6.caption := (q as TQuery).DataSource.owner.name +
          '.' + label6.caption;
    end;
    SQL.lines.text := (q as TQuery).SQL.Text;
  end;

  if q is TFDCQuery then
  begin
    label5.caption := (q as TFDCQuery).Session.LogonDatabase;  
    if (q as TFDCQuery).DataSource <> nil then
    begin
      label6.caption := (q as TFDCQuery).DataSource.name;
      if (q as TFDCQuery).DataSource.owner <> q.owner then
        label6.caption := (q as TFDCQuery).DataSource.owner.name +
          '.' + label6.caption;
    end;
    SQL.lines.text := (q as TFDCQuery).SQL.Text;
  end;

  if q is TOracleDataSet then
  begin
    if (q as TOracleDataSet).DataSource <> nil then
    begin
      label6.caption := (q as TOracleDataSet).DataSource.name;
      if (q as TOracleDataSet).DataSource.owner <> q.owner then
        label6.caption := (q as TOracleDataSet).DataSource.owner.name +  '.' + label6.caption;
    end;
    CachUpd := (q as TOracleDataSet).CachedUpdates;
    SQL.lines.text := (q as TOracleDataSet).SQL.Text;
  end;
  
  if (q is TBDEDataSet) then
  begin
    CachUpd := (q as TBDEDataSet).CachedUpdates;
  end;

  if CachUpd then
    label8.caption := 'true'
  else
    label8.caption := 'false';
  
  FillFields;
  FillParams;
end;

function StringOfFieldType(ft: TFieldType): string;
begin
  case ft of
    ftUnknown: result := 'ftUnkown';
    ftString: result := 'ftString';
    ftSmallint: result := 'ftSmallint';
    ftInteger: result := 'ftInteger';
    ftWord: result := 'ftWord';
    ftBoolean: result := 'ftBoolean';
    ftFloat: result := 'ftFloat';
    ftCurrency: result := 'ftCurrency';
    ftBCD: result := 'ftBCD';
    ftDate: result := 'ftDate';
    ftTime: result := 'ftTime';
    ftDateTime: result := 'ftDateTime';
    ftBytes: result := 'ftBytes';
    ftVarBytes: result := 'ftVarBytes';
    ftAutoInc: result := 'ftAutoInc';
    ftBlob: result := 'ftBlob';
    ftMemo: result := 'ftMemo';
    ftGraphic: result := 'ftGraphic';
    ftFmtMemo: result := 'ftFmtMemo';
    ftParadoxOle: result := 'ftParadoxOle';
    ftDBaseOle: result := 'ftDBaseOle';
    ftTypedBinary: result := 'ftTypedBinary';
    ftWideString: result := 'ftWideString';
    else
      result := '???';
  end;
end;

procedure TfdcInspectorForm.FillFields;
var
  q: TDataSet;
  i: integer;
begin
  Value.text := '';
  if (tree.selected.data = nil) or
    (not (TObject(tree.selected.data) is TDataSet)) then
    exit;
  q := (TObject(tree.selected.data) as TDataSet);

  if q.fieldCount = 0 then
  begin
    FieldsGrid.RowCount := 2;
    FieldsGrid.Rows[1].clear;
  end
  else
    FieldsGrid.RowCount := q.fieldCount + 1;

  for i := 0 to q.fieldCount - 1 do
  begin
    FieldsGrid.cells[0, i + 1] := q.fields[i].fieldName;
    FieldsGrid.cells[1, i + 1] := q.fields[i].DisplayLabel;
    FieldsGrid.cells[2, i + 1] := q.fields[i].asString;
    FieldsGrid.cells[3, i + 1] := StringOfFieldType(q.fields[i].DataType);

    if q.fields[i].isNull then
      FieldsGrid.cells[4, i + 1] := '(null)'
    else
      FieldsGrid.cells[4, i + 1] := '';

    if q.fields[i].visible then
      FieldsGrid.cells[5, i + 1] := '+'
    else
      FieldsGrid.cells[5, i + 1] := '';

    if q.fields[i] is TFloatField then
      FieldsGrid.cells[6, i + 1] := (q.fields[i] as TFloatField).DisplayFormat
    else if q.fields[i] is TDateTimeField then
      FieldsGrid.cells[6, i + 1] := (q.fields[i] as TDateTimeField).DisplayFormat
    else
      FieldsGrid.cells[6, i + 1] := '';

    FieldsGrid.objects[0, i + 1] := q.fields[i];
  end;
  Value.text := '';
end;

procedure TfdcInspectorForm.FillParams;
var
  p: TParams;
  i, cnt: integer;
begin
  ParamVAlue.text := '';

  if (tree.selected.data = nil) then
    exit;
  if (TObject(tree.selected.data) is TQuery) then
  begin
    p := (TObject(tree.selected.data) as TQuery).Params;
    cnt := (TObject(tree.selected.data) as TQuery).ParamCount;
  end

  else if (TObject(tree.selected.data) is TFDCQuery) then
  begin
    p := (TObject(tree.selected.data) as TFDCQuery).Params;
    cnt := (TObject(tree.selected.data) as TFDCQuery).ParamCount;
  end

  else if (TObject(tree.selected.data) is TStoredProc) then
  begin
    p := (TObject(tree.selected.data) as TStoredProc).Params;
    cnt := (TObject(tree.selected.data) as TStoredProc).ParamCount;
  end
  else
    exit;

  if cnt = 0 then
  begin
    ParamsGrid.RowCount := 2;
    ParamsGrid.Rows[1].clear;
  end
  else
    ParamsGrid.RowCount := cnt + 1;

  for i := 0 to cnt - 1 do
  begin
    ParamsGrid.cells[0, i + 1] := p[i].Name;
    ParamsGrid.cells[1, i + 1] := p[i].asString;
    ParamsGrid.cells[2, i + 1] := StringOfFieldType(p[i].DataType);
    if p[i].isNull then
      ParamsGrid.cells[3, i + 1] := '(null)'
    else
      ParamsGrid.cells[3, i + 1] := '';
  end;

  ParamVAlue.text := '';
end;

function FormStyleStr(fs: TFormStyle): string;
begin
  result := '';
  case fs of
    fsNormal: result := 'fsNormal';
    fsMDIChild: result := 'fsMDIChild';
    fsMDIForm: result := 'fsMDIForm';
    fsStayOnTop: result := 'fsStayOnTop';
  end;
end;

procedure TfdcInspectorForm.FillFormTS;
var
  c: TComponent;
begin
  ObjPages.ActivePage := FormTS;
  c := (TObject(tree.selected.data) as TComponent);
  Edit1.Text := c.ClassName;
  Edit2.Text := c.Name;
  if (c is TForm) then
  begin
    Edit3.Text := (c as TForm).caption;
    Edit4.Text := FormStyleStr((c as TForm).FormStyle);
  end;
end;

procedure TfdcInspectorForm.FillFormParamsTS;
var
  p: TfdcParams;
  i, cnt: integer;
begin
  ObjPages.activePage := FormParamsTS;

  FormParamValue.Text := '';

  if (tree.selected.data = nil) then
    exit;
  if (TObject(tree.selected.data) is TfdcParamsHolder) then
  begin
    p := (TObject(tree.selected.data) as TfdcParamsHolder).Params;
    cnt := (TObject(tree.selected.data) as TfdcParamsHolder).Params.Count;
  end
  else
    exit;

  if cnt = 0 then
  begin
    FormParamsGrid.RowCount := 2;
    FormParamsGrid.Rows[1].Clear;
  end
  else
    FormParamsGrid.RowCount := cnt + 1;

  for i := 0 to cnt - 1 do
  begin
    FormParamsGrid.cells[0, i + 1] := p[i].Name;
    FormParamsGrid.cells[1, i + 1] := p[i].asString;
    FormParamsGrid.cells[2, i + 1] := StringOfFieldType(p[i].DataType);
    if p[i].isNull then
      FormParamsGrid.cells[3, i + 1] := '(null)'
    else
      FormParamsGrid.cells[3, i + 1] := '';
  end;

  FormParamValue.text := '';
end;

procedure TfdcInspectorForm.FillDBATS;
begin
  if (tree.selected.data = nil) or
    (not (TObject(tree.selected.data) is TXDBAvComp)) then
    exit;
  ObjPages.ActivePage := DBATS;
  label11.caption := (TObject(tree.selected.data) as TXDBAvComp).comp.name;
  label12.caption := (TObject(tree.selected.data) as TXDBAvComp).comp.ClassName;
end;

procedure TfdcInspectorForm.RecordCountBtnClick(Sender: TObject);
begin
  if (tree.selected.data = nil) or
    (not (TObject(tree.selected.data) is TDataSet)) then
    exit;
    
  if (TObject(tree.selected.data) as TDataSet).Active then
    Label16.caption := intToStr((TObject(tree.selected.data) as TDataSet).RecordCount)
  else  
    Label16.caption := '???';  
end;

procedure TfdcInspectorForm.FormCreate(Sender: TObject);
begin
  if AutoSaveLayout then
    LoadLayout;

  fSourceList := TList.create;
  fSetList := TList.create;
  fNodeList := TList.create;
  fDBAvareList := TList.create;

  FieldsGrid.Cells[0, 0] := 'FieldName';
  FieldsGrid.ColWidths[0] := 100;
  FieldsGrid.Cells[1, 0] := 'DisplayLabel';
  FieldsGrid.Cells[2, 0] := 'Value';

  FieldsGrid.Cells[3, 0] := 'DataType';
  FieldsGrid.ColWidths[3] := 70;

  FieldsGrid.Cells[4, 0] := '(null)';
  FieldsGrid.ColWidths[4] := 50;
  FieldsGrid.Cells[5, 0] := 'Visible';
  FieldsGrid.ColWidths[5] := 50;

  FieldsGrid.Cells[6, 0] := 'DisplayMask';

  ParamsGrid.Cells[0, 0] := 'Name';
  ParamsGrid.ColWidths[0] := 100;

  ParamsGrid.Cells[1, 0] := 'Value';
  ParamsGrid.Cells[2, 0] := 'DataType';
  ParamsGrid.ColWidths[2] := 70;
  ParamsGrid.Cells[3, 0] := '(null)';
  ParamsGrid.ColWidths[3] := 50;

  FormParamsGrid.Cells[0, 0] := 'Name';
  FormParamsGrid.ColWidths[0] := 100;

  FormParamsGrid.Cells[1, 0] := 'Value';
  FormParamsGrid.Cells[2, 0] := 'DataType';
  FormParamsGrid.ColWidths[2] := 70;
  FormParamsGrid.Cells[3, 0] := '(null)';
  FormParamsGrid.ColWidths[3] := 50;
end;

procedure TfdcInspectorForm.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  if AutoSaveLayout then  
    SaveLayout;

  fSourceList.free;
  fSetList.free;
  fNodeList.free;
  for i := 0 to fDBAvareList.count - 1 do
    TObject(fDBAvareList[i]).free;
  fDBAvareList.free;
end;

procedure TfdcInspectorForm.FieldsGridSelectCell(Sender: TObject; Col,
  Row: Longint; var CanSelect: Boolean);
begin
  value.text := FieldsGrid.cells[col, row];
end;

procedure TfdcInspectorForm.ParamsGridSelectCell(Sender: TObject; ACol,
  ARow: Longint; var CanSelect: Boolean);
begin
  ParamValue.text := ParamsGrid.cells[Acol, Arow];
end;

procedure TfdcInspectorForm.FieldsGridDrawCell(Sender: TObject; ACol,
  ARow: Longint; Rect: TRect; State: TGridDrawState);
begin
  if FieldsGrid.objects[0, ARow] = nil then
    exit;
  if (FieldsGrid.objects[0, ARow] as TField).visible then
    FieldsGrid.canvas.font.style := [fsBold]
  else
    FieldsGrid.canvas.font.style := [];
end;

procedure TfdcInspectorForm.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if DataSource.DataSet = nil then
    exit;
  FillQueryTS;
end;

procedure TfdcInspectorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfdcInspectorForm.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfdcInspectorForm.FormParamsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  FormParamValue.text := FormParamsGrid.cells[ACol, ARow];
end;

procedure TfdcInspectorForm.StringGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = 67) then
    Clipboard.AsText := (Sender as TStringGrid).Cells[(Sender as TStringGrid).Col, (Sender as TStringGrid).Row];
end;

end.

