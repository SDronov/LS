unit MainDataMUnit;

interface

uses
  SysUtils, Classes, Oracle, fdcOracleSession, DB, VKDBFDataSet, QueryList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TMainDataM = class(TDataModule)
    Session: TfdcOracleSession;
    FileDbf: TVKDBFNTX;
    MainQueryList: TQueryList;
    sqlCheckProvision: TsqlOp;
    sqlChange_check_summ: TsqlOp;
    sqlCheckLevel: TsqlOp;
    MainIdFTP: TIdFTP;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConnectToBD(alogin, apassword, atnsname : AnsiString);
    procedure DisConnectToBD;
    function CheckProvision(inn,kpp: AnsiString; delta_check_summ: Currency): Integer;
    procedure provision_change_check_summ(inn,kpp: AnsiString; delta_check_summ: Currency);
    function connectftp: boolean;
    procedure disconnectftp;
  end;

var
  MainDataM: TMainDataM;

implementation

uses CheckCopySevice, CheckCopyUtils;

{$R *.dfm}

procedure TMainDataM.ConnectToBD(alogin, apassword, atnsname: AnsiString);
begin
  try
    Session.LogonUsername := alogin;
    Session.LogonPassword := apassword;
    Session.LogonDatabase := atnsname;
    Session.Connected := True;
  except
    on e:Exception do
      begin
        raise Exception.Create('Ошибка при подключении к базе данных Лицевых счетов: ' + e.Message);
      end;
  end;
end;

procedure TMainDataM.DisConnectToBD;
begin
  Session.Connected := False;
end;

function TMainDataM.connectftp: boolean;
begin
  try
    MainIdFTP.Connect;
    result := MainIdFTP.Connected;
  except
    on e:Exception do
      begin
        raise Exception.Create('Ошибка при подключении к FTP: ' + e.Message);
      end;
  end;
end;

procedure TMainDataM.disconnectftp;
begin
  MainIdFTP.Disconnect;
end;

function TMainDataM.CheckProvision(inn,kpp: AnsiString; delta_check_summ: Currency): Integer;
begin
  try
    sqlCheckProvision.ParamValues['inn'] := inn;
    sqlCheckProvision.ParamValues['kpp'] := kpp;
    sqlCheckProvision.ParamValues['delta_check_summ'] := delta_check_summ;
    sqlCheckProvision.Exec;
    result:= sqlCheckProvision.ParamValues['l_result'];
  except
    on e:Exception do
      begin
        raise Exception.Create('Ошибка при проверке обеспечения платёжной системы: ' + e.Message);
      end;
  end;
end;

procedure TMainDataM.provision_change_check_summ(inn,kpp: AnsiString; delta_check_summ: Currency);
begin
  try
    sqlChange_check_summ.ParamValues['inn'] := inn;
    sqlChange_check_summ.ParamValues['kpp'] := kpp;
    sqlChange_check_summ.ParamValues['delta_check_summ'] := delta_check_summ;
    sqlChange_check_summ.Exec;
  except
    on e:Exception do
      begin
        raise Exception.Create('Ошибка при изменении суммы не подтверждённых чеков: ' + e.Message);
      end;
  end;
end;

end.
