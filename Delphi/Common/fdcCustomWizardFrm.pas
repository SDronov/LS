{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomWizardFrm.pas $
  $Revision: 2040 $
  $Author: alexvolo $
  $Date: 2006-11-20 22:26:11 +0400 (РџРЅ, 20 РЅРѕСЏ 2006) $
}

unit fdcCustomWizardFrm;

interface

uses
  Graphics, Forms, StdCtrls, Classes, Controls, ActnList,
  cxLookAndFeelPainters, dxLayoutLookAndFeels, cxImage,
  dxLayoutControl, cxContainer, cxEdit, cxLabel, cxPC,
  cxButtons, ExtCtrls, cxControls, cxLookAndFeels,
  fdcCustomTabDlgFrm, Menus;

type
  { базовая форма диалогов-мастеров }
  TfdcCustomWizardForm = class(TfdcCustomTabDlgForm)
    Panel1: TPanel;
    cxImage2: TcxImage;
    actNext: TAction;
    actPrev: TAction;
    dxLayoutControl2: TdxLayoutControl;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutControl2Item2: TdxLayoutItem;
    btnPrev: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    btnNext: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPrevUpdate(Sender: TObject);
    procedure actPrevExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses fdcCustomDlgFrm, Windows, Math;

{$R *.dfm}

function FindLayoutControl(AControl: TCustomControl): TdxLayoutControl;
var
  I: Integer;
begin
  for I := 0 to AControl.ControlCount - 1 do
    if AControl.Controls[I] is TdxLayoutControl then
    begin
      Result := TdxLayoutControl(AControl.Controls[I]);
      Exit;
    end;
  Result := nil;
end;

procedure GetContentSize(APageControl: TcxPageControl; var Size: TSize);
var
  I: Integer;
  LayoutControl: TdxLayoutControl;
begin            
  Size.cx := 0;
  Size.cy := 0;
  for I := 0 to APageControl.TabCount - 1 do
  begin
    LayoutControl := FindLayoutControl(APageControl.Pages[I]);
    if LayoutControl <> nil then
    begin
      Size.cx := Max(Size.cx, LayoutControl.ViewInfo.ContentWidth
       + LayoutControl.LookAndFeel.Offsets.ItemsAreaOffsetHorz * 2);
      Size.cy := Max(Size.cy, LayoutControl.ViewInfo.ContentHeight
       + LayoutControl.LookAndFeel.Offsets.ItemsAreaOffsetVert * 2);
    end;
  end;
end;

procedure TfdcCustomWizardForm.FormShow(Sender: TObject);
var
  Size: TSize;
  PrevWidth: integer;
begin
  inherited;
  PageControl.HideTabs := True;
  PageControl.Style := 2;
  PageControl.ActivePageIndex := 0;

  btnPrev.Width := btnCancel.Width;
  btnNext.Width := btnCancel.Width;
  btnPrev.Height := btnCancel.Height;
  btnNext.Height := btnCancel.Height;

  GetContentSize(PageControl, Size);
  PrevWidth := PageControl.Width;
  PageControl.Width := Max(PageControl.Width, Size.cx);
  PageControl.Height := Max(PageControl.Height, Size.cy);

  dxLayoutControl1.Height := dxLayoutControl1.Height - PageControl.Height + Max(PageControl.Height, Size.cy);
  dxLayoutControl1.Width := dxLayoutControl1.Width - PrevWidth + Size.cx;

//  ClientWidth := Max(PageControl.Width + Panel1.Width);
//  ClientHeight := Max(ClientHeight, dxLayoutControl1.ViewInfo.ContentHeight);

  ClientWidth := Max(ClientWidth, Size.cx{dxLayoutControl1.ViewInfo.ContentWidth}
     + Panel1.Width + dxLayoutControl1.LookAndFeel.Offsets.RootItemsAreaOffsetHorz * 4);
  ClientHeight := Max(ClientHeight, dxLayoutControl1.ViewInfo.ContentHeight);
//     + dxLayoutControl1.LookAndFeel.Offsets.RootItemsAreaOffsetVert * 4);
end;

procedure TfdcCustomWizardForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (PageControl.ActivePage <> nil) and (PageControl.ActivePage.PageIndex = PageControl.PageCount-1);
end;

procedure TfdcCustomWizardForm.actNextUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not actOk.Enabled);
end;

procedure TfdcCustomWizardForm.actNextExecute(Sender: TObject);
begin
  PageControl.SelectNextPage(True);
end;

procedure TfdcCustomWizardForm.actPrevUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (PageControl.ActivePage <> nil) and (PageControl.ActivePage.PageIndex > 0);
end;

procedure TfdcCustomWizardForm.actPrevExecute(Sender: TObject);
begin
  PageControl.SelectNextPage(False);
end;

end.

