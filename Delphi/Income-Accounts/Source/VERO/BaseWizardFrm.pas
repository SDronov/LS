{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 4577 $
  $Author: FORS\anaumenkov $
  $Date: 2008-03-12 08:59:53 +0400 (Ср, 12 мар 2008) $
}
unit BaseWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomWizardFrm, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxImage,
  ExtCtrls, dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  Menus;

type
  TBaseWizardForm = class(TfdcCustomWizardForm)
    procedure actOkUpdate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actPrevExecute(Sender: TObject);
    procedure actPrevUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function DoCallMethod(const MethodName: String;
      Sender: TObject): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseWizardForm: TBaseWizardForm;

implementation

{$R *.dfm}

function TBaseWizardForm.DoCallMethod(const MethodName: String; Sender: TObject): Boolean;
var
  UpdateMethod: TMethod;
begin
  Result := False;
  if Assigned(PageControl.ActivePage) then
  begin
   UpdateMethod.Code := MethodAddress(PageControl.ActivePage.Name + MethodName);
   if Assigned(UpdateMethod.Code) then
   begin
     UpdateMethod.Data := Self;
     TNotifyEvent(UpdateMethod)(Sender);
     Result := True;
   end;
 end;
end;

procedure TBaseWizardForm.actOkUpdate(Sender: TObject);
begin
  if not DoCallMethod('FinishUpdate', Sender) then
    inherited;
end;

procedure TBaseWizardForm.actOkExecute(Sender: TObject);
begin
  if not DoCallMethod('FinishExecute', Sender) then
    inherited;
end;

procedure TBaseWizardForm.actNextExecute(Sender: TObject);
begin
  if not DoCallMethod('NextExecute', Sender) then
    inherited;
end;

procedure TBaseWizardForm.actNextUpdate(Sender: TObject);
begin
  if not DoCallMethod('NextUpdate', Sender) then
    inherited;
end;

procedure TBaseWizardForm.actPrevExecute(Sender: TObject);
begin
  if not DoCallMethod('PrevExecute', Sender) then
    inherited;
end;

procedure TBaseWizardForm.actPrevUpdate(Sender: TObject);
begin
  if not DoCallMethod('PrevUpdate', Sender) then
    inherited;
end;

procedure TBaseWizardForm.FormShow(Sender: TObject);
var
  SysMenu: HMENU;
begin
  SysMenu := GetSystemMenu(Handle, False);
  DeleteMenu(SysMenu, SC_RESTORE, MF_BYCOMMAND);
  DeleteMenu(SysMenu, SC_MAXIMIZE, MF_BYCOMMAND);
  DeleteMenu(SysMenu, SC_MINIMIZE, MF_BYCOMMAND);
  inherited;
end;

end.
