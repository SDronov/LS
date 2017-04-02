unit FormUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, cxEdit, dxLayoutControl,
    ObjectFrm, fdcCustomDataFrm, Forms, DB, Controls;


procedure UpdateLayoutControl(IsNew: Boolean; Layout: TdxLayoutControl; IsReadOnly: Boolean = True);

procedure ShowTabForm(var Form: TForm; const FormClass: string; Params: TParams; Tab: TWinControl;
                          Waiter: TfdcCustomDataForm = nil);

implementation

uses
  ObjServices, fdcObjectLinkEdit;


procedure ShowTabForm(var Form: TForm; const FormClass: string; Params: TParams; Tab: TWinControl;
                          Waiter: TfdcCustomDataForm = nil);
begin
  if not Assigned(Form) then
  begin
    Form := GetObjectServices.ShowForm(FormClass, Params, Tab);
    if Waiter <> nil then
       TObjectForm(Form).RegisterWaiter(Waiter);
  end;
end;

type
   TcxCustomEdit_ = class(TcxCustomEdit);

procedure UpdateLayoutControl(IsNew: Boolean; Layout: TdxLayoutControl; IsReadOnly: Boolean = True);
  procedure UpdateGroupItems(AGroup: TdxLayoutGroup);
  var
    I: Integer;
    Flags: string;
    AnItem: TdxLayoutItem;
    DoReadOnly: Boolean;
  begin
    for I := 0 to AGroup.Count - 1 do
    if AGroup.Items[I] is TdxLayoutGroup then
        UpdateGroupItems(TdxLayoutGroup(AGroup.Items[I]))
    else
    begin
      AnItem := AGroup.Items[I] as TdxLayoutItem;
      if AnItem.Tag > 10 then
      begin
        Flags :=  IntToStr(AnItem.Tag);
        DoReadOnly := False;
        if IsNew then
        case Flags[1] of
          '1':  AnItem.Visible := True;
          '2':  AnItem.Visible := False;
          '3': begin
                 AnItem.Visible :=  True;
                 DoReadOnly := True;
               end;
          '4': begin
                 AnItem.Visible :=  True;
                 DoReadOnly := IsReadOnly;
               end;
        end
        else
        case Flags[2] of
          '1':  AnItem.Visible := True;
          '2':  AnItem.Visible := False;
          '3': begin
                 AnItem.Visible :=  True;
                 DoReadOnly := True;
               end;
          '4': begin
                 AnItem.Visible :=  True;
                 DoReadOnly := IsReadOnly;
               end;
        end;

        if AnItem.Control is TcxCustomEdit then
        begin
//          TcxCustomEdit_(AnItem.Control).FDataBinding.
          if not (AnItem.Control is TfdcObjectLinkEdit) then
             TcxCustomEdit_(AnItem.Control).Properties.ReadOnly := DoReadOnly;
          if DoReadOnly then
             TcxCustomEdit_(AnItem.Control).Color := clSilver //clInactiveCaptionText
          else
               TcxCustomEdit_(AnItem.Control).Color := clWindow;
//            if Assigned(TcxCustomEdit_(AnItem.Control).Style) then
//               TcxCustomEdit_(AnItem.Control).Color := TcxCustomEdit_(AnItem.Control).Style.Color
//             else TcxCustomEdit_(AnItem.Control).Color := clWindow;
        end;
      end;
    end;
  end;

begin
  UpdateGroupItems(Layout.Items);
end;

end.
 