{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomMainDm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcCustomMainDm;

interface

uses
  Windows, SysUtils, Classes, Oracle, FDCOracleSession, Registry;

type
  { TfdcCustomMainData }
  TfdcCustomMainData = class(TDataModule)
    Session: TFDCOracleSession;
    StartScript: TOracleScript;
    procedure SessionAfterLogOn(Sender: TOracleSession);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfdcCustomMainData.SessionAfterLogOn(Sender: TOracleSession);
begin
  { execute start script }
  if Session.Connected then
  begin
    StartScript.Lines.Text := Format(StartScript.Lines.Text,
      [ShortDateFormat, Session.DefSchemeName]);
    StartScript.Execute;
  end;  
end;

end.
