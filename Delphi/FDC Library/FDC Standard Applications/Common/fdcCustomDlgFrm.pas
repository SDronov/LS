{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomDlgFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxControls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxContainer, cxEdit,
  cxLookAndFeels, fdcCustomFrm;

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
    { Private declarations }
  public
    { Public declarations }
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

end.
