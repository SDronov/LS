{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomSimpleDlgFrm.pas $
  $Revision: 6068 $
  $Author: dkligunov $
  $Date: 2008-12-21 23:09:04 +0400 (Вс, 21 дек 2008) $
}
unit fdcCustomSimpleDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, ExtCtrls, cxControls, fdcCustomDlgFrm,
  cxLookAndFeels, Menus;

type
  { ������� ����� ������� �������� }
  TfdcCustomSimpleDlgForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
