{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCommonReg.pas $
  $Revision: 271 $
  $Author: alexvolo $
  $Date: 2005-11-03 19:42:50 +0400 (Р§С‚, 03 РЅРѕСЏ 2005) $
}
unit SQLEditorFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, QueryList, DB,
  DesignIntf, ToolWin, ImgList, ActnList, StdActns, Menus, DesignEditors,
    DesignWindows;

type

  TSQLEditor = class(TComponentEditor)
  protected
  public
   destructor Destroy; override;
   procedure ExecuteVerb(Index: Integer); override;
   function GetVerb(Index: Integer): string; override;
   function GetVerbCount: Integer; override;
  end;

  TSQLEditorForm = class(TDesignWindow)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Memo1: TMemo;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    AddCmd: TAction;
    DeleteCmd: TAction;
    TestCmd: TAction;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    InsSQL: TAction;
    UpdSQL: TAction;
    DelSQL: TAction;
    LockSQL: TAction;
    ToolButton5: TToolButton;
    PopupMenu1: TPopupMenu;
    Insert1: TMenuItem;
    Update1: TMenuItem;
    DelSQL1: TMenuItem;
    SQLConst: TAction;
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Exit(Sender: TObject);
    procedure AddCmdExecute(Sender: TObject);
    procedure DeleteCmdUpdate(Sender: TObject);
    procedure DeleteCmdExecute(Sender: TObject);
    procedure TestCmdUpdate(Sender: TObject);
    procedure TestCmdExecute(Sender: TObject);
    procedure InsSQLExecute(Sender: TObject);
    procedure UpdSQLExecute(Sender: TObject);
    procedure DelSQLExecute(Sender: TObject);
    procedure LockSQLExecute(Sender: TObject);
    procedure InsSQLUpdate(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
   private
    FQueryList: TQueryList;
    procedure SetQueryList(const Value: TQueryList);
    procedure SetSelection;
    procedure UpdateListBox;
    procedure UpdateMemo;
    function GetDataSet: TDataSet;
//    procedure ComponentDeleted(Component: IPersistent);
//    procedure ComponentDeleted(Component: IPersistent);
   protected
    function UniqueName(Component: TComponent): string; override;
    procedure Activated; override;
   public
//    FDesigner: IFormDesigner;
    destructor Destroy; override;
    property  QueryList: TQueryList read FQueryList write SetQueryList;
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent); override;
    procedure FormClosed(AForm: TCustomForm); //override;
    procedure DesignerClosed(const Designer: IDesigner; AGoingDormant: Boolean); override;
    procedure FormModified; //override;
    procedure ItemsModified(const Designer: IDesigner); override;
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections); override;
  end;

implementation

uses Oracle, OracleData;

{$R *.dcr}
{$R *.DFM}

var
  Form3: TSQLEditorForm;

resourcestring
 SPalleteName = 'Data Access';
 SEditorTitle = 'Редактирование ';
 SQueryEditor = 'QueryList редактор...';

procedure ShowQueryListEditor(QueryList: TQueryList; Designer: IDesigner);
begin
 if Form3 = nil then Form3 := TSQLEditorForm.Create(Application);
 try
  if Form3.QueryList <> QueryList then
   begin
    Form3.Caption := SEditorTitle + QueryList.Name;
    Form3.Designer := Designer;
    Form3.QueryList := QueryList;
    Form3.Show;
  end;
  Form3.BringToFront;
 except
  Application.HandleException(ExceptObject);
  Form3.Free;
  Form3 := nil;
 end;
end;

{ TForm3 }

function AddItem(Items: TListItems; SQLCmd: TsqlOp): TListItem;
begin
 Result := Items.Add;
 Result.Caption := SQLCmd.Name;
 Result.Data := SQLCmd;
end;

procedure TSQLEditorForm.SetQueryList(const Value: TQueryList);
var
 I: Integer;
begin
 FQueryList := Value;
 ListView1.Items.BeginUpdate;
 try
  ListView1.Items.Clear;
  for I := 0 to FQueryList.QueryCount - 1 do
              AddItem(ListView1.Items, QueryList[I]);
 finally
  ListView1.Items.EndUpdate;
  Memo1.Lines.Clear;
 end;
end;

procedure TSQLEditorForm.SetSelection;
var
  I: Integer;
  List: IDesignerSelections;
begin
  try
    if ListView1.SelCount > 0 then
    begin
      List := CreateSelectionList;
      try
//        FItemIDList.Clear;
        for I := 0 to ListView1.Items.Count - 1 do
          if ListView1.Items[I].Selected then
          begin
            List.Add(ListView1.Items[I].Data);
//            FItemIDList.Add(Pointer(Collection.Items[I].ID));
          end;
        Designer.SetSelections(List);
      finally
//        List.Free;
      end;
    end
//    else
//      Designer.SelectComponent(Collection);
  except
//    FSelectionError := True;
    Application.HandleException(ExceptObject);
    Close;
  end;
end;

procedure TSQLEditorForm.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if Item = nil then Exit;
 if Selected then
    if Memo1.Tag <> Integer(Item) then
     begin
       Memo1.Lines := TsqlOp(Item.Data).SQL;
       Memo1.Tag := Integer(Item);
     end
     else TsqlOp(Item.Data).SQL := Memo1.Lines;
 SetSelection;
end;

procedure TSQLEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if QueryList <> nil then Designer.SelectComponent(QueryList);
 Action := caFree;
end;


procedure TSQLEditorForm.FormClosed(AForm: TCustomForm);
begin
 FQueryList := nil;
 Close;
end;

procedure TSQLEditorForm.UpdateListBox;
var
 I: Integer;
 Item: TListItem;
begin
  for I := 0 to ListView1.Items.Count - 1 do
   begin
    Item := ListView1.Items[I];
    Item.Caption := TsqlOp(Item.Data).Name;
    if Item.Selected and (Memo1.Tag <> Integer(Item)) then Memo1.Lines := TsqlOp(Item.Data).SQL;
  end;
end;

procedure TSQLEditorForm.FormModified;
begin
 if QueryList <> nil then
  begin
   UpdateListBox;
//   if CompLib.GetActiveForm.Designer <> Designer then Exit;
 end;
end;

procedure TSQLEditorForm.SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
begin
end;

procedure TSQLEditorForm.Activated;
begin
 UpdateListBox;
 if ListView1.Selected <> nil then SetSelection;
end;

function TSQLEditorForm.UniqueName(Component: TComponent): string;
begin
 Result := Component.Name;
end;

destructor TSQLEditorForm.Destroy;
begin
 inherited;
 Form3 := nil;
end;

procedure TSQLEditorForm.UpdateMemo;
var
 Item: TListItem;
begin
 Item := ListView1.Selected;
 if Item <> nil then
//   if Memo.Tag <> Integer(Item) then
   if TsqlOp(Item.Data).SQL.Text <> Memo1.Lines.Text then
    begin
     TsqlOp(Item.Data).SQL.Text := Memo1.Lines.Text;
     Designer.Modified;
   end;
end;

procedure TSQLEditorForm.AddCmdExecute(Sender: TObject);
var
 SQLCmd: TsqlOp;
 Item: TListItem;
begin
 UpdateMemo;
 SQLCmd := TsqlOp(Designer.CreateComponent(TsqlOp, QueryList, 0, 0, 0, 0));
 SQLCmd.DesignInfo := 0;
 SQLCmd.QueryList := QueryList;
 Item := AddItem(ListView1.Items, SQLCmd);
 Item.Selected := True;
 Item.MakeVisible(False);
end;

procedure TSQLEditorForm.DeleteCmdUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := ListView1.Selected <> nil;
end;

function TSQLEditorForm.GetDataSet: TDataSet;
var
 Item: TListItem;
begin
 Item := ListView1.Selected;
 if Item = nil then Result := nil
  else Result := TsqlOp(Item.Data).DataSet;
end;

procedure TSQLEditorForm.DeleteCmdExecute(Sender: TObject);
var
 Item: TListItem;
 SQLCmd: TsqlOp;
begin
 Item := ListView1.Selected;
 SQLCmd := TsqlOp(Item.Data);
 if Trim(Memo1.Lines.Text) <> '' then
  if Application.MessageBox(PChar('Удалить оператор '+ SQLCmd.Name), PChar(Caption),
          MB_YESNO or MB_ICONQUESTION  or MB_DEFBUTTON2) = IDNO then Exit;
 Item.Delete;
 SQLCmd.Free;
 Item := ListView1.ItemFocused;
 if Item <> nil then Item.Selected := True;
end;

procedure TSQLEditorForm.TestCmdUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled :=  (QueryList <> nil) and (ListView1.Selected <> nil)
       and (QueryList.Session <> nil) and (QueryList.Session.Connected);
end;

procedure TSQLEditorForm.TestCmdExecute(Sender: TObject);
var
 Query: TOracleQuery;
 Vars: TStringList;
 I: Integer;
 Pos: Integer;
begin
 UpdateMemo;
 Query := TOracleQuery.Create(nil);
 try
  Query.SQL.Text := Memo1.Lines.Text;
  Query.Session := QueryList.Session;
  Query.ReadBuffer := 1;
  Query.Cursor := crSQLWait;
  Vars := FindVariables(Query.SQL.Text, False);
  try
   I := Vars.IndexOf('');
   if I >= 0 then Vars.Delete(I);
   for I := 0 to Vars.Count - 1 do
     Query.DeclareVariable(Vars[I], otString);
  finally
   Vars.Free;
  end;
  try
   Query.Session.Rollback;
   Query.Session.SetTransaction(tmReadOnly);
   Query.Execute;
//   Query.Declare;
//   if Query.ReturnCode <> 0 then
  except
   on E: Exception do
    begin
     Application.HandleException(Query);
     if E is EOracleError then
      begin
       Pos := 0;
       for I := 0 to Query.ErrorLine-1 do
               Inc(Pos, Length(Memo1.Lines[I]));
       Memo1.SetFocus;
       Memo1.SelStart := Pos +  Query.ErrorPosition;
       Memo1.SelLength := 1;
     end;
    end;
  end;
 finally
  Query.Session.Rollback;
  Query.Free;
 end;
end;

procedure TSQLEditorForm.Memo1Exit(Sender: TObject);
begin
 UpdateMemo;
end;

procedure TSQLEditorForm.ItemDeleted(const ADesigner: IDesigner;
  AItem: TPersistent);
var
 Temp: TPersistent;
begin
// Temp := TryExtractPersistent(Component);
 Temp := AItem;
 if Temp = nil then Exit;
 if (QueryList = nil) or (csDestroying in QueryList.ComponentState) or
      (Temp = QueryList)  then
       begin
        FQueryList := nil;
        Close;
      end;
end;

procedure TSQLEditorForm.ItemsModified(const Designer: IDesigner);
begin
  inherited;
  FormModified;
end;

procedure TSQLEditorForm.DesignerClosed(const Designer: IDesigner;
  AGoingDormant: Boolean);
begin
  inherited;
  FormClosed(Designer.Root as TCustomForm);
end;

{ TSQLEditor }

destructor TSQLEditor.Destroy;
begin
 inherited;
// CloseQueryListEditor;
end;

procedure TSQLEditor.ExecuteVerb(Index: Integer);
begin
 if Index = GetVerbCount - 1 then
  begin
   ShowQueryListEditor(TQueryList(Component), Self.Designer);
 end
  else inherited;
end;

function TSQLEditor.GetVerb(Index: Integer): string;
begin
 if Index = GetVerbCount - 1 then  Result := SQueryEditor
  else Result := '';
end;

function TSQLEditor.GetVerbCount: Integer;
begin
 Result := inherited GetVerbCount + 1;
end;

function GetTableName(DataSet: TDataSet): string;
begin
 if DataSet is TOracleDataSet then Result := TOracleDataSet(DataSet).GetUpdatingTable
  else Result := '%'+ UpperCase(DataSet.Name) + '%';
end;

procedure TSQLEditorForm.InsSQLExecute(Sender: TObject);
var
 I: Integer;
 DataSet: TDataSet;
 ClmList, VarList: string;
 S: string;
begin
 DataSet := GetDataSet;
 for I := 0 to DataSet.FieldCount - 1 do
  with DataSet.Fields[I] do
   if fieldKind = fkData then
    begin
     ClmList := ClmList + ',' + FieldName;
     VarList := VarList + ',:' + FieldName;
   end;
 Delete(ClmList, 1, 1);
 Delete(VarList, 1, 1);
 Memo1.Lines.Text := 'begin'#10
      +' insert into ' + GetTableName(DataSet)
      +' (' + ClmList + ')'#10
      +'  values(' + VarList + ')'#10
      +'   returning RowId into :RESULT;'#10
      +'end;';
end;

procedure TSQLEditorForm.UpdSQLExecute(Sender: TObject);
var
 I: Integer;
 DataSet: TDataSet;
 ClmList, VarList: string;
begin
 DataSet := GetDataSet;
 for I := 0 to DataSet.FieldCount - 1 do
  with DataSet.Fields[I] do
   if fieldKind = fkData then
    begin
     ClmList := ClmList + #10'   ,' + FieldName + '=:' + FieldName;
   end;
 Delete(ClmList, 1, 5);
 Memo1.Lines.Text := 'begin'#10
      +' update ' + GetTableName(DataSet) + ' set'#10
      +'    ' + ClmList + #10
      +'  where RowId = :DOA_ROWID;'#10
      +'end;';
end;

procedure TSQLEditorForm.DelSQLExecute(Sender: TObject);
var
 I: Integer;
 DataSet: TDataSet;
begin
 DataSet := GetDataSet;
 Memo1.Lines.Text := 'begin'#10
      +' delete from ' + GetTableName(DataSet) + #10
      +'  where RowId = :DOA_ROWID;'#10
      +'end;';
end;

procedure TSQLEditorForm.LockSQLExecute(Sender: TObject);
var
 S: string;
 I: Integer;
 DataSet: TDataSet;
 ClmList: string;
begin
 DataSet := GetDataSet;
 for I := 0 to DataSet.FieldCount - 1 do
  with DataSet.Fields[I] do
   if fieldKind = fkData then
    begin
     ClmList := ClmList + #10' ,' + FieldName + '=:' + FieldName;
   end;
 Delete(ClmList, 1, 3);
 Memo1.Lines.Text := 'begin'#10
      +' update ' + GetTableName(DataSet) + ' set'#10
      + ClmList + #10
      +' where RowId = :DOA_ROWID;'#10
      +'end;';
end;

procedure TSQLEditorForm.InsSQLUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := GetDataSet <> nil;
end;

procedure TSQLEditorForm.ToolButton5Click(Sender: TObject);
begin
 ToolButton5.CheckMenuDropDown;
end;

end.
