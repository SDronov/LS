{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 16457 $
  $Author: adavletyarov $
  $Date: 2013-04-01 17:29:55 +0400 (Пн, 01 апр 2013) $
}
unit TaskNavFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomFrm, DB, FDCCustomDataset, fdcQuery, ExtCtrls,
  dxNavBar, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, fdcOracleSession, ObjServices, dxNavBarCollns, fdcObjectCore;

type
  TTaskListForm = class(TfdcCustomForm)
    barNavigator: TdxNavBar;
    dsTaskList: TfdcQuery;
    procedure barNavigatorLinkClick(Sender: TObject;
      ALink: TdxNavBarItemLink);
  private
    procedure BuildNavigatorBar(Query: TfdcQuery);
    { Private declarations }
  public
    { Public declarations }
    procedure LoadNavigator(Session: TfdcOracleSession);
    procedure ShowGridForm(ClassType: TFormClass);
    function AutoSaveLayout: Boolean; override;
  end;

var
  TaskListForm: TTaskListForm;

implementation


{$R *.dfm}

procedure TTaskListForm.BuildNavigatorBar(Query: TfdcQuery);
var
  I: Integer;
  S: string;
  AGroup: TdxNavBarGroup;
  AnItem: TdxNavBarItem;
  FormClass: TFormClass;
  lv_GroupId: double;
  function GetFormClass(const ClassName: String): TFormClass;
  var
    AClass: TPersistentClass;
  begin
    AClass := GetClass(ClassName);
    if (AClass <> nil) and AClass.InheritsFrom(TForm) then
       Result := TFormClass(AClass)
    else Result := nil;
  end;
begin
  barNavigator.BeginUpdate;
  try
    AGroup := nil;
    lv_GroupId := 0;
    barNavigator.Items.Clear;
    barNavigator.Groups.Clear;
    while not Query.Eof do
    begin
      if Query['LEVEL'] = 1 then
      begin
        if (Query.FieldByName('Is_Visible').AsInteger = 1) then
        begin
          AGroup := barNavigator.Groups.Add;
          AGroup.Caption := Query['NAME'];
          lv_GroupId := Query['ID'];
        end
          else
            AGroup := nil;
      end
      else
        if (AGroup <> nil) and (Query.FieldByName('Is_Visible').AsInteger = 1)
           and (lv_GroupId = Query['OWNER_OBJECT_ID']) then
        begin
          AnItem := barNavigator.Items.Add;
          AnItem.Caption := Query['NAME'];
          S := VarToStr(Query['CODE']);
          if S <> '' then
          begin
            FormClass := GetFormClass('T' + S + 'GridForm');;
            AnItem.Tag := Integer(FormClass);
          end;
          AnItem.Enabled := AnItem.Tag <> 0;
          AGroup.CreateLink(AnItem);
        end;
      Query.Next;
    end;
  finally
    for I := 0 to barNavigator.Groups.Count - 1 do
      barNavigator.Groups[I].Expanded := False;
    if barNavigator.Groups.Count > 0 then
      barNavigator.ActiveGroupIndex := 0;
    barNavigator.EndUpdate;
  end;
end;

procedure TTaskListForm.LoadNavigator(Session: TfdcOracleSession);
begin
  dsTaskList.Session := Session;
  dsTaskList.Open;
  try
    BuildNavigatorBar(dsTaskList);
  finally
    dsTaskList.Close;
  end;
end;

function FindGridForObjectType(ClassType: TFormClass): TForm;
var
  I: Integer;
begin
  for I := Screen.FormCount - 1 downto 0 do
  begin
    Result := Screen.Forms[I];
    if Result.Tag = Integer(ClassType) then
      Exit;
  end;
  Result := nil;
end;

procedure TTaskListForm.ShowGridForm(ClassType: TFormClass);
var
  Form: TForm;
begin
  inherited;
  if ClassType <> nil then
  begin
    Form := FindGridForObjectType(ClassType);
    if Form <> nil then
    begin
      Form.BringToFront;
      if Form.WindowState = wsMinimized then
         Form.WindowState := wsNormal;
    end
    else
    begin
      Form := GetObjectServices.ShowForm(ClassType.ClassName, nil, nil);
      Form.Tag := Integer(ClassType);
    end;
  end;
end;

procedure TTaskListForm.barNavigatorLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
var
  ClassType: TFormClass;
begin
  inherited;
  ClassType := TFormClass(ALink.Item.Tag);
  if ClassType <> nil then
      ShowGridForm(ClassType);
end;

function TTaskListForm.AutoSaveLayout: Boolean;
begin
  Result := False;
end;

end.

