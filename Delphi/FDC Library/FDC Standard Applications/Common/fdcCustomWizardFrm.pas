{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomWizardFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomWizardFrm;

interface

uses
  Graphics, Forms, StdCtrls, Classes, Controls, ActnList,
  cxLookAndFeelPainters, dxLayoutLookAndFeels, cxImage,
  dxLayoutControl, cxContainer, cxEdit, cxLabel, cxPC,
  cxButtons, ExtCtrls, cxControls, cxLookAndFeels,
  fdcCustomTabDlgFrm;

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

{$R *.dfm}

procedure TfdcCustomWizardForm.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.HideTabs := True;
  PageControl.Style := 2;
  PageControl.ActivePageIndex := 0;
end;

procedure TfdcCustomWizardForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (PageControl.ActivePage.PageIndex = PageControl.PageCount-1);
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
    (PageControl.ActivePage.PageIndex > 0);
end;

procedure TfdcCustomWizardForm.actPrevExecute(Sender: TObject);
begin
  PageControl.SelectNextPage(False);
end;

end.

