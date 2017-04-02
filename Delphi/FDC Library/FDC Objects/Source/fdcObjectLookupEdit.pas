unit fdcObjectLookupEdit;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, fdcObjectServices,
  cxDBLookupComboBox;

type
  TfdcObjectLookupEdit = class(TcxDBLookupComboBox)
  private
    procedure SetFilter(OnOff: Boolean);
    { Private declarations }
  protected
    { Protected declarations }
    function GetDisplayValue: String; override;
    procedure DblClick; override;
    function CanDropDown: Boolean; override;
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;


implementation

uses
  fdcUtils, Windows;


{ TfdcObjectLookupEdit }

function TfdcObjectLookupEdit.CanDropDown: Boolean;
begin
  Result := inherited CanDropDown;
  if Result then
  begin
//    SetFocus;
    Result := Focused;
  end;
end;

procedure TfdcObjectLookupEdit.DblClick;
begin
  inherited;
  Exit;
  if (GetObjectServices(False) <> nil) and
     Assigned(DataBinding) and Assigned(DataBinding.Field) and
     (not DataBinding.Field.IsNull) and
     (not IsNewID(DataBinding.Field.AsFloat)) then
    GetObjectServices.OpenObject(DataBinding.Field.AsFloat, nil); //Params);
end;

procedure TfdcObjectLookupEdit.SetFilter(OnOff: Boolean);
begin
  if (Tag <> -34) and (Properties.ListSource <> nil)
    and (Properties.ListSource.DataSet <> nil) then
  begin
     Properties.ListSource.DataSet.Filtered := False;
     if OnOff then
       Properties.ListSource.DataSet.Filtered := True;
  end;
end;

procedure TfdcObjectLookupEdit.DoEnter;
begin
  inherited;
  SetFilter(True);
end;

procedure TfdcObjectLookupEdit.DoExit;
begin
  inherited;
  SetFilter(False);
end;

function TfdcObjectLookupEdit.GetDisplayValue: String;
begin
  if not( csDesigning in ComponentState) then
  begin
    if Assigned(Properties.ListSource) and Assigned(Properties.ListSource.DataSet) then
       Properties.ListSource.DataSet.Active := True;
  end;
  Result := inherited GetDisplayValue;
end;

end.
