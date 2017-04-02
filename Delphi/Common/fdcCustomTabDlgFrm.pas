{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcCustomTabDlgFrm.pas $
  $Revision: 3963 $
  $Author: FORS\anaumenkov $
  $Date: 2007-12-09 03:13:30 +0400 (Р’СЃ, 09 РґРµРє 2007) $
}

unit fdcCustomTabDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, ActnList,
  dxLayoutLookAndFeels, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxPC, cxLookAndFeels, fdcCustomDlgFrm, Menus;

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
