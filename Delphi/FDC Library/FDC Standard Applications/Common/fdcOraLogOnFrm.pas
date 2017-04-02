{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcOraLogOnFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcOraLogOnFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomLogOnFrm, cxLookAndFeelPainters, ActnList,
  cxPropertiesStore, ExtCtrls, cxContainer, cxEdit, dxLayoutLookAndFeels,
  dxLayoutControl, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, Oracle,
  cxButtonEdit, cxLabel, cxImage, cxGroupBox, cxControls, cxLookAndFeels,
  fdcOracleSession;

const
  SSchemaSep = '/';
    
type
  { ����������� ����� ����������� ������������ ORACLE } 
  TfdcOraLogOnForm = class(TfdcCustomLogOnForm)
    lciSchema: TdxLayoutItem;
    edtSchema: TcxTextEdit;
  private
    { Private declarations }
  protected
    procedure ShowAll(AVisible: boolean); override;
    procedure GetSessionParams; override;
    procedure SetSessionParams; override;
  public
    { Public declarations }
  end;

{ �������� ����������� ����� ����������� ������������. 
  ����������� ���������� ���������� ������� Oracle. }
function LogOn(ASession: TfdcOracleSession; AShowForm: boolean = True): boolean;

implementation

{$R *.dfm}

uses
  fdcExceptions, fdcMessages;

type
  { TfdcOraSessionAdapter }       
  TfdcOraSessionAdapter = class(TInterfacedObject, IfdcSession)
  private
    FOraSession: TfdcOracleSession;
  public
    constructor Create(AOraSession: TfdcOracleSession);
    procedure HandleError(E: Exception);

    // IfdcSession {{{
    { �������� ��� ������������ }
    function GetUserName: string;
    { �������� ������ }
    function GetPassword: string;
    { �������� ������ ���������� � �������� }
    function GetConnectString: string;
    { ���������� ��� ������������ }
    procedure SetUserName(AUserName: string);
    { ���������� ������ }
    procedure SetPassword(APassword: string);
    { ���������� ������ ���������� }
    procedure SetConnectString(AConnectString: string);
    { ������� ������ ���������� }
    function IsConnected: boolean;
    { �������������� � ������� }
    procedure LogOn;
    { ������������� �� ������� }
    procedure LogOff;
    // IfdcSession }}}
    
  end;

function LogOn(ASession: TfdcOracleSession; AShowForm: boolean = True): boolean;
begin
  Result := fdcCustomLogOnFrm.LogOn(TfdcOraLogOnForm, TfdcOraSessionAdapter.Create(ASession), AShowForm);
end;

function MakeConnectString(AServer, ASchema: string): string;
begin
  if (AServer <> '') and
     (ASchema <> '') then
    Result := AServer + SSchemaSep + ASchema
  else
    Result := '';
end;

function ExtractServer(AConnectString: string): string;
var
  SepPos: integer;
begin
  SepPos := Pos(SSchemaSep, AConnectString);
  if SepPos > 0 then
    Result := Copy(AConnectString, 1, SepPos - 1)
  else
    Result := AConnectString;
end;

function ExtractSchema(AConnectString: string): string;
var
  SepPos: integer;
begin
  SepPos := Pos(SSchemaSep, AConnectString);
  if SepPos > 0 then
    Result := Copy(AConnectString, SepPos + 1, Length(AConnectString) - SepPos)
  else
    Result := '';
end;

{ TfdcOraSessionAdapter }

constructor TfdcOraSessionAdapter.Create(AOraSession: TfdcOracleSession);
begin
  inherited Create;
  FOraSession := AOraSession;
end;

procedure TfdcOraSessionAdapter.HandleError(E: Exception);
begin
  try
    { ���������� ������ }
    fdcExceptions.HandleError(E);
  except
    { �������� ������ � ���������� �� ������ }
    on E: Exception do
      ErrorDlg(E);
  end;
end;

function TfdcOraSessionAdapter.GetUserName: string;
begin
  Result := FOraSession.LogonUsername;
end;

function TfdcOraSessionAdapter.GetPassword: string;
begin
  Result := FOraSession.LogonPassword;
end;

function TfdcOraSessionAdapter.GetConnectString: string;
begin
  Result := MakeConnectString(
    FOraSession.LogonDatabase,
    FOraSession.DefSchemeName);
end;

procedure TfdcOraSessionAdapter.SetUserName(AUserName: string);
begin
  FOraSession.LogonUsername := AUserName;
end;

procedure TfdcOraSessionAdapter.SetPassword(APassword: string);
begin
  FOraSession.LogonPassword := APassword;
end;

procedure TfdcOraSessionAdapter.SetConnectString(AConnectString: string);
begin
  FOraSession.LogonDatabase := ExtractServer(AConnectString);
  FOraSession.DefSchemeName := ExtractSchema(AConnectString);
  if FOraSession.DefSchemeName = '' then
    FOraSession.DefSchemeName := FOraSession.LogonUsername;
end;

function TfdcOraSessionAdapter.IsConnected: boolean;
begin
  Result := FOraSession.Connected;
end;

procedure TfdcOraSessionAdapter.LogOn;
begin
  { ������� ����� ���������� }
  try
    FOraSession.LogOn;
  except
    on E: Exception do
      HandleError(E);
  end;
end;

procedure TfdcOraSessionAdapter.LogOff;
begin
  FOraSession.LogOff;
end;

{ TfdcOraLogOnForm }

procedure TfdcOraLogOnForm.GetSessionParams;
begin
  inherited;
  edtSchema       .Text := ExtractSchema(Session.GetConnectString);
  edtConnectString.Text := ExtractServer(Session.GetConnectString);
end;

procedure TfdcOraLogOnForm.SetSessionParams;
begin
  inherited;
  Session.SetConnectString(MakeConnectString(edtConnectString.Text, edtSchema.Text));
end;

procedure TfdcOraLogOnForm.ShowAll(AVisible: boolean);
begin
  inherited;
  { ��������/�������� �������������� ��������� }
  edtSchema.Visible := AVisible;
  lciSchema.ShowCaption := AVisible;
end;

end.
