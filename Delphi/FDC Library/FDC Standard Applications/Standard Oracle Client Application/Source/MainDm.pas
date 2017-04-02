{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: MainDm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit MainDm;

interface

uses
  SysUtils, Classes, Oracle, FDCOracleSession, fdcCustomMainDm;

type
  TMainData = class(TfdcCustomMainData)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainData: TMainData;

implementation

{$R *.dfm}

end.
