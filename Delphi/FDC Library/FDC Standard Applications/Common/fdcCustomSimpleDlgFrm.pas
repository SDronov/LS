{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomSimpleDlgFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcCustomSimpleDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, ExtCtrls, cxControls, fdcCustomDlgFrm,
  cxLookAndFeels;

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
