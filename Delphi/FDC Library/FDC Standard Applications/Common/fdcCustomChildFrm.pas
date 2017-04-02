{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomChildFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomChildFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxGraphics, cxContainer, cxEdit,
  AppEvnts, ImgList, ActnList, dxBar, XPMan, cxControls,
  dxStatusBar, dxLayoutLookAndFeels, fdcCustomWindowFrm;

type
  { Базовый класс для дочерних окон.
    Каждое дочернее окно показывается как новая задача на
    панели задач Windows. }
  TfdcCustomChildForm = class(TfdcCustomWindowForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfdcCustomChildForm.FormCreate(Sender: TObject);
var
  FormStyle: Integer;
begin
  inherited;

  { отобразить окно как новую задачу на системной панели задач }
  FormStyle := GetWindowLong(Handle, GWL_EXSTYLE);
  FormStyle := FormStyle or WS_EX_APPWINDOW;
  SetWindowLong(Handle, GWL_EXSTYLE, FormStyle);
end;

end.

