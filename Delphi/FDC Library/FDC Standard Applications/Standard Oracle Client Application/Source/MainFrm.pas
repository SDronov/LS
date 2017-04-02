{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: MainFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomOraMainFrm, cxGraphics, Oracle, XPMan,
  AppEvnts, ImgList, dxBar, cxContainer, cxEdit, dxLayoutLookAndFeels,
  ActnList, cxControls, dxStatusBar, cxLookAndFeels, ExtCtrls, cxLabel,
  StdActns, fdcOracleSession;

type
  TMainForm = class(TfdcCustomOraMainForm)
  private
    { Private declarations }
  protected
    function GetSession: TfdcOracleSession; override;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses MainDm, fdcCustomMainDm;

{$R *.dfm}

{ TMainForm }

function TMainForm.GetSession: TfdcOracleSession;
begin
  Result := MainData.Session;
end;

end.
