{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomDlgFrm.pas $
  $Revision: 3962 $
  $Author: FORS\anaumenkov $
  $Date: 2007-12-08 18:17:36 +0400 (РЎР±, 08 РґРµРє 2007) $
}

unit fdcCustomDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxControls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxContainer, cxEdit,
  cxLookAndFeels, fdcCustomFrm, Menus;

type
  { базовая форма диалогов }
  TfdcCustomDlgForm = class(TfdcCustomForm)
    actOk: TAction;
    actCancel: TAction;
    dxLayoutControl1: TdxLayoutControl;
    btnCancel: TcxButton;
    btnOk: TcxButton;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutControl1Group8: TdxLayoutGroup;
    dxLayoutControl1Item10: TdxLayoutItem;
    dxLayoutControl1Item8: TdxLayoutItem;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
  protected
    { Private declarations }
    function CalcClientWidth: Integer; dynamic;
    function CalcClientHeight: Integer; dynamic;
  public
    { Public declarations }
    function AutoSaveLayout: boolean; override;
    procedure LoadLayout; override;
  end;

implementation

{$R *.dfm}

procedure TfdcCustomDlgForm.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfdcCustomDlgForm.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfdcCustomDlgForm.AutoSaveLayout: Boolean;
begin
   Result := False;
end;

procedure TfdcCustomDlgForm.CMShowingChanged(var Message: TMessage);
var
  x: integer;
begin
  inherited;
  if Showing then
  begin
    x := CalcClientWidth;
//    if ClientWidth  < x then
           ClientWidth := x;

    x := CalcClientHeight;
//    if ClientHeight  < x then
            ClientHeight := x;
  end;
end;

function TfdcCustomDlgForm.CalcClientWidth: Integer;
begin
  Result := dxLayoutControl1.ViewInfo.ContentWidth + dxLayoutControl1.Left;
end;

function TfdcCustomDlgForm.CalcClientHeight: Integer;
begin
  Result := dxLayoutControl1.ViewInfo.ContentHeight +  + dxLayoutControl1.Top;
end;

procedure TfdcCustomDlgForm.LoadLayout;
begin
//  inherited;

end;

end.
