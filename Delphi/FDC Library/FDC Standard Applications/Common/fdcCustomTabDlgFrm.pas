{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomTabDlgFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomTabDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, ActnList,
  dxLayoutLookAndFeels, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxPC, cxLookAndFeels, fdcCustomDlgFrm;

type
  { базовая форма многостраничных диалогов }
  TfdcCustomTabDlgForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    PageControl: TcxPageControl;
    tabGeneral: TcxTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
