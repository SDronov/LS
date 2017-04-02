unit DateForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, cxControls;

type
  TfdcCustomDlgForm1 = class(TfdcCustomDlgForm)
    cxDateEdit1: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdcCustomDlgForm1: TfdcCustomDlgForm1;

implementation

{$R *.dfm}

end.
