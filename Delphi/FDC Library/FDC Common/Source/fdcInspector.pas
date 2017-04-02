{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcInspector.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcInspector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TfdcInspector = class(TComponent)
  private
    procedure Trap(var Msg: TMsg; var Handled: Boolean);
  public
    fOldTrap: TMessageEvent;
    fKey: word;
    fShift: TShiftState;
    fDoTrap: boolean;
    fShortCut: TShortCut;
    procedure Execute;
  published
    constructor Create(aOwner: TComponent); override;
    property ShortCut: TShortCut read fShortCut write fShortCut;
    property DoTrap: boolean read fDoTrap write fDoTrap default True;
  end;

implementation

uses
  fdcInspectorFrm;

constructor TfdcInspector.Create(aOwner: TComponent);
begin
  fDoTrap := true;
  fShortCut := TextToShortCut('Ctrl+F11');//16506;
  inherited Create(aOwner);
  fOldTrap := nil;
  if (not (csDesigning in ComponentState)) and DoTrap then
  begin
    if assigned(application.onMessage) then
      fOldTrap := application.onMessage;
    application.onMessage := Trap;
  end;

end;

procedure TfdcInspector.Trap(var Msg: TMsg; var Handled: Boolean);
begin
  Handled := false;
  if (Msg.message = WM_KEYDOWN) then
  begin
    ShortCutToKey(ShortCut, fKey, fShift);
    if (Msg.wParam = fKey) and
      (KeyDataToShiftState(Msg.lParam) = fShift) then
    begin
      Execute;
      Handled := true;
    end;
  end;
  if (not Handled) and assigned(fOldTrap) then
    fOldTrap(Msg, Handled);
end;

procedure TfdcInspector.Execute;
begin
  ExecInspector;
end;

end.

 