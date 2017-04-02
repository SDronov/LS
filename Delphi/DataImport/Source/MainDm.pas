{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: MainDm.pas $
  $Revision: 260 $
  $Author: alexglad $
  $Date: 2005-10-07 16:41:23 +0400 (РџС‚, 07 РѕРєС‚ 2005) $
}
unit MainDm;

interface

uses
  SysUtils, Classes, Oracle, FDCOracleSession, fdcCustomMainDm;

type
  TMainData = class(TfdcCustomMainData)
    procedure SessionAfterLogOn(Sender: TOracleSession);
  end;

var
  MainData: TMainData;

implementation

uses
  MainFrm, StrUtils;

{$R *.dfm}

procedure TMainData.SessionAfterLogOn(Sender: TOracleSession);
begin
  inherited;
  MainForm.bstConnectIndicator.Caption := IfThen(Session.Connected, 'Соединен', 'Не соединен');
end;

end.
