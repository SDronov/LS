// Direct Oracle Access - Logon Dialog
// Copyright 1997, 2001 Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl

{$I Oracle.inc}

unit OracleLogon;

interface

{$IFNDEF LINUX}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Oracle, Buttons, IniFiles;
{$ELSE}
uses
  SysUtils, Classes, QGraphics, QControls, QForms, QDialogs, QButtons,
  QStdCtrls, QExtCtrls, QMenus, Qt, IniFiles, Libc, Types, Oracle;
{$ENDIF}
                                             
const // Allow translation of the Logon dialog
  ltLogonTitle:     string = 'Oracle Logon';    // Title of Logon dialog
  ltPasswordTitle:  string = 'Change password'; // Title of Change password dialog
  ltConfirmTitle:   string = 'Confirm';         // Title of password confirmation dialog
  ltUsername:       string = 'Пользователь';
  ltPassword:       string = 'Пароль';
  ltDatabase:       string = 'Сервер';
  ltConnectAs:      string = 'Connect as';
  ltNewPassword:    string = 'New password';
  ltOldPassword:    string = 'Old password';
  ltVerify:         string = 'Verification';
  ltVerifyFail:     string = 'Verification failed';
  ltChangePassword: string = 'Do you wish to change your password now?';
  ltExpired:        string = 'Your password has expired';
  ltOKButton:       string = 'OK';
  ltCancelButton:   string = 'Отмена';
  ltHistoryHint:    string = 'Logon history';
  ltMainFont: TFont = nil;                      // Main Dialog font
  ltFontStyle: TFontStyles = [];                // FontStyle of dialog

type
  THistoryItem = class(TCollectionItem)
  public
    Username: string;
    Password: string;
    Database: string;
    ConnectAs: string;
    Fixed: Boolean;
    function DisplayString: string;
  end;
  THistoryItems = class(TCollection)
  public
    Size: Integer;
    WithPassword: Boolean;
    function  NonFixedCount: Integer;
    procedure Add(Username, Password, Database, ConnectAs: string; Fixed, Sort: Boolean);
    function  Load(Location: string): Boolean;
    function  Save(Location: string): Boolean;
    function  LoadIni(Filename: string): Boolean;
    function  SaveIni(Filename: string): Boolean;
    function  Item(Index: Integer): THistoryItem;
  end;
  TLogOnForm = class(TForm)
    ButtonPanel: TPanel;
    HistoryPopup: TPopupMenu;
    History: TMenuItem;
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox: TPanel;
    CAPanel: TPanel;
    Label4: TLabel;
    ConnectAsList: TComboBox;
    DBPanel: TPanel;
    Label3: TLabel;
    DatabaseEdit: TEdit;
    AliasList: TComboBox;
    Label1: TLabel;
    UsernameEdit: TEdit;
    HistoryBtn: TSpeedButton;
    PasswordEdit: TEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure HistoryBtnClick(Sender: TObject);
    procedure HistoryClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogonHistory: THistoryItems;
  NoUserIdParam: Boolean = False;

function LogonDialog(Session: TOracleSession; Retries, DropDownCount: Integer; var Options: TLogonOptions): Boolean;
function PasswordDialog(Session: TOracleSession; const ACaption: string): Boolean;
function LogonEncrypt(const S: string): string;
function LogonDecrypt(const EnS: string): string;

function StripConnectAs(var S: string): string;
function ConnectAsToString(ConnectAs: TConnectAsOption): string;
function StringToConnectAs(S: string): TConnectAsOption;

implementation

uses OracleCI;

{$R *.dfm}

// Logon history

function THistoryItems.NonFixedCount: Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
    if not Item(i).Fixed then inc(Result);
end;

function StripConnectAs(var S: string): string;
var X: string;
    i: Integer;
begin
  Result := '';
  X := UpperCase(S);
  for i := 1 to Length(X) do if X[i] = #9 then X[i] := ' ';
  i := Pos(' AS ', X);
  if i > 0 then
  begin
    Result := Trim(Copy(X, i + 4, Length(X)));
    S := Trim(Copy(S, 1, i));
  end;
end;

function ConnectAsToString(ConnectAs: TConnectAsOption): string;
begin
  case ConnectAs of
    caSYSDBA: Result := 'SYSDBA';
   caSYSOPER: Result := 'SYSOPER';
  end;
end;

function StringToConnectAs(S: string): TConnectAsOption;
begin
  Result := caNormal;
  if UpperCase(S) = 'SYSDBA' then Result := caSYSDBA;
  if UpperCase(S) = 'SYSOPER' then Result := caSYSOPER;
end;

procedure THistoryItems.Add(Username, Password, Database, ConnectAs: string; Fixed, Sort: Boolean);
var Item: THistoryItem;
    S: string;
    i, ap, sp: Integer;
begin
  if Username = '' then Exit;
  // Extract the password and/or database from the username if available
  sp := Pos('/', Username);
  ap := Pos('@', Username);
  if ap = 0 then ap := Length(Username) + 1;
  if ap < Length(Username) then Database := Copy(Username, ap + 1, Length(Username) - ap);
  if sp > 0 then Password := Copy(Username, sp + 1, ap - sp - 1);
  if sp = 0 then sp := ap;
  UserName := Copy(Username, 1, sp - 1);
  if not WithPassword then Password := '';
  // Extract ConnactAs part
  S := StripConnectAs(Database);
  if S = '' then S := StripConnectAs(Password);
  if S = '' then S := StripConnectAs(Username);
  StripConnectAs(Password);
  StripConnectAs(Username);
  if S <> '' then ConnectAs := S;
  // Delete any old identical entries
  S := Uppercase(Username);
  if Database <> '' then S := S + '@' + Uppercase(Database);
  if ConnectAs <> '' then S := S + ' AS ' + ConnectAs;
  for i := Count - 1 downto 0 do
  begin
    if Uppercase(Self.Item(i).DisplayString) = S then
    begin
      if Self.Item(i).Fixed then Exit;
      Self.Item(i).Free;
    end;
  end;
  // Check for maximum number of items
  if Size > 0 then while NonFixedCount >= Size do Self.Item(Size - 1).Free;
  // Add the new item
  Item := THistoryItem.Create(Self);
  Item.Username := Username;
  Item.Password := Password;
  Item.Database := Database;
  Item.ConnectAs := ConnectAs;
  Item.Fixed    := Fixed;
  if Sort and (not Fixed) then Item.Index := 0;
end;

function LogonEncrypt(const S: string): string;
var i, v, x: Integer;
begin
  x := Random(1000) + 2000;
  Result := '';
  for i := 1 to Length(S) do
  begin
    v := Ord(S[i]) * 16;
    Result := Result + IntToStr(1000 + (v xor (x + i * 10)));
  end;
  Result := IntToStr(x) + Result;
end;

function LogonDecrypt(const EnS: string): string;
var i, x: Integer;
  S: string;
begin
  Result := '';
  S := EnS;
  if S <> '' then
  try
    x := StrToInt(Copy(S, 1, 4));
    i := 1;
    repeat
      Delete(S, 1, 4);
      if S <> '' then Result := Result + Char(((StrToInt(Copy(S, 1, 4)) - 1000) xor (x + i * 10)) div 16);
      inc(i);
    until S = '';
  except
  end;
end;

function THistoryItems.LoadIni(Filename: string): Boolean;
var INI: TINIFile;
    i: Integer;
    S: string;
begin
  Result := True;
  if Filename = '' then Exit;
{$IFDEF LINUX}
  Filename := FullINIPath(Filename);
{$ENDIF}
  INI := TINIFile.Create(Filename);
  try
    i := 0;
    repeat
      S := INI.ReadString('Logon', IntToStr(i), '');
      if S <> '' then
      begin
        S := LogonDecrypt(S);
        if (Size = 0) or (i < Size) then LogonHistory.Add(S, '', '', '', False, False);
      end;
      inc(i);
    until S = '';
  except
    Result := False;
  end;
  INI.Free;
end;

function THistoryItems.Load(Location: string): Boolean;
{$IFNDEF LINUX}
var Handle: HKey;
    Buffer: Array[0..256] of Char;
    i, BufSize, DataType: Integer;
    S: string;
{$ENDIF}
begin
  Result := True;
  if Location = '' then Exit;
{$IFDEF LINUX}
  LoadIni(Location);
{$ELSE}
  if (Location <> '') and (location[1] = '\') then System.Delete(Location, 1, 1);
  if RegOpenKeyEx(HKEY_CURRENT_USER, PChar(Location), 0, KEY_READ, Handle) = ERROR_SUCCESS then
  begin
    DataType := reg_sz;
    i := 0;
    repeat
      S := '';
      BufSize := SizeOf(Buffer);
      if RegQueryValueEx(Handle, PChar('Logon' + IntToStr(i)), nil, @DataType, @Buffer, @BufSize) = ERROR_SUCCESS then
      begin
        S := LogonDecrypt(Buffer);
        if (Size = 0) or (i < Size) then LogonHistory.Add(S, '', '', '', False, False);
      end;
      inc(i);
    until S = '';
    RegCloseKey(Handle);
  end;
{$ENDIF}
end;

function THistoryItems.SaveIni(Filename: string): Boolean;
var INI: TINIFile;
    i: Integer;
    S: string;
begin
  Result := True;
  if Filename = '' then Exit;
  Randomize;
{$IFDEF LINUX}
  Filename := FullINIPath(Filename);
{$ENDIF}
  INI := TINIFile.Create(Filename);
  try
    INI.EraseSection('Logon');
    for i := 0 to NonFixedCount - 1 do with Item(i) do
    begin
      S := Username + '/' + Password + '@' + Database;
      if ConnectAs <> '' then S := S + ' as ' + ConnectAs;
      S := LogonEncrypt(S);
      INI.WriteString('Logon', IntToStr(i), S);
    end;
{$IFDEF LINUX}
    INI.UpdateFile;
{$ENDIF}
  except
    Result := False;
  end;
  INI.Free;
end;

function THistoryItems.Save(Location: string): Boolean;
{$IFNDEF LINUX}
var Handle: HKey;
    i, Disposition: Integer;
    S: string;
{$ENDIF}
begin
  Result := True;
  if Location = '' then Exit;
  Randomize;
{$IFDEF LINUX}
  SaveINI(Location);
{$ELSE}
  if (Location <> '') and (location[1] = '\') then System.Delete(Location, 1, 1);
  if RegCreateKeyEx(HKEY_CURRENT_USER, PChar(Location), 0, nil, REG_OPTION_NON_VOLATILE,
       KEY_ALL_ACCESS, nil, Handle, @Disposition) = ERROR_SUCCESS then
  begin
    // First delete any old entries
    i := 0;
    while RegDeleteValue(Handle, PChar('Logon' + IntToStr(i))) = ERROR_SUCCESS do inc(i);
    // Store history
    for i := 0 to NonFixedCount - 1 do with Item(i) do
    begin
      S := Username + '/' + Password + '@' + Database;
      if ConnectAs <> '' then S := S + ' as ' + ConnectAs;
      S := LogonEncrypt(S);
      if not RegSetValueEx(Handle, PChar('Logon' + IntToStr(i)), 0, reg_sz, @S[1], Length(S)) = ERROR_SUCCESS then Result := False;
    end;
    RegCloseKey(Handle);
  end;
{$ENDIF}
end;

function THistoryItems.Item(Index: Integer): THistoryItem;
begin
  Result := Self.Items[Index] as THistoryItem;
end;

function THistoryItem.DisplayString: string;
begin
  Result := Username;
  if Database <> '' then Result := Result + '@' + Database;
  if ConnectAs <> '' then Result := Result + ' as ' + ConnectAs;
end;

function GetParamString(Name:String):String; { Search a commandline parameter }
var i: Integer;
begin
  for i := 1 to ParamCount do
  begin
    if Pos(UpperCase(Name) + '=', UpperCase(ParamStr(i))) > 0 then
    begin
      Result := Copy(ParamStr(i), Length(Name) + 2, 255);
      Exit;
    end;
  end;
  Result := '';
end;

// Main functions

function ChangePassword(Session: TOracleSession; const ACaption: string): Boolean;
var dr: Integer;
    Done: Boolean;
begin
  Result := False;
  if Session = nil then raise Exception.Create('Session undefined');
  with TLogonForm.Create(nil) do
  begin
    // Adjust dialog
    if ltMainFont <> nil then Font.Assign(ltMainFont);
    Font.Style := ltFontStyle;
    OKBtn.Caption := ltOKButton;
    CancelBtn.Caption := ltCancelButton;
    Caption := ACaption;
    Label1.Caption := ltNewPassword;
    Label2.Caption := ltVerify;
    {$IFDEF LINUX}

    {$ELSE}
    UsernameEdit.PasswordChar := '*';
    {$ENDIF}
    GroupBox.Height := GroupBox.Height - DBPanel.Height - CAPanel.Height;
    Height := Height - DBPanel.Height - CAPanel.Height;
    DBPanel.Visible := False;
    CAPanel.Visible := False;
    repeat
      Done := True;
      dr := ShowModal;
      if dr = mrOK then
      begin
        if AnsiUpperCase(UserNameEdit.Text) <> AnsiUpperCase(PasswordEdit.Text) then
        begin
          ShowMessage(ltVerifyFail);
          Done := False;
        end else try
          Session.SetPassword(PasswordEdit.Text);
          if not Session.Connected then Session.LogOn;
          Result := True;
        except on E:EOracleError do
          begin
            ShowMessage(E.Message);
            Done := False;
          end;
        end;
      end;
    until Done;
    Free;
  end;
end;

function PasswordDialog(Session: TOracleSession; const ACaption: string): Boolean;
var dr: Integer;
    Done: Boolean;
begin
  Result := False;
  if Session = nil then raise Exception.Create('Session undefined');
  with TLogonForm.Create(nil) do
  begin
    // Adjust dialog
    if ltMainFont <> nil then Font.Assign(ltMainFont);
    Font.Style := ltFontStyle;
    OKBtn.Caption := ltOKButton;
    CancelBtn.Caption := ltCancelButton;
    Caption := ACaption;
    Label1.Caption := ltOldPassword;
    Label2.Caption := ltNewPassword;
    Label3.Caption := ltVerify;
    {$IFDEF LINUX}

    {$ELSE}
    UsernameEdit.PasswordChar := '*';
    PasswordEdit.PasswordChar := '*';
    DatabaseEdit.PasswordChar := '*';
    {$ENDIF}
    GroupBox.Height := GroupBox.Height - CAPanel.Height;
    Height := Height -  CAPanel.Height;
    CAPanel.Visible := False;
    repeat
      Done := True;
      dr := ShowModal;
      if dr = mrOK then
      begin
        if (AnsiUpperCase(UsernameEdit.Text) <> AnsiUpperCase(Session.LogonPassword)) or
           (AnsiUpperCase(PasswordEdit.Text) <> AnsiUpperCase(DatabaseEdit.Text)) then
        begin
          ShowMessage(ltVerifyFail);
          Done := False;
        end else try
          Session.SetPassword(PasswordEdit.Text);
          if not Session.Connected then Session.LogOn;
          Result := True;
        except on E:EOracleError do
          begin
            ShowMessage(E.Message);
            Done := False;
          end;
        end;
      end;
    until Done;
    Free;
  end;
end;

function LogonDialog(Session: TOracleSession; Retries, DropDownCount: Integer; var Options: TLogonOptions): Boolean;
var i, dr, LogCount: Integer;
    s: string;
    NoHistory: Boolean;
begin
  Result := False;
  NoHistory := False;
  if Session = nil then raise Exception.Create('Session undefined');
  with TLogonForm.Create(nil) do
  begin
    // Adjust Dialog
    if ltMainFont <> nil then Font.Assign(ltMainFont);
    Font.Style := ltFontStyle;
    OKBtn.Caption := ltOKButton;
    CancelBtn.Caption := ltCancelButton;
    Caption := ltLogonTitle;
    Label1.Caption := ltUsername;
    Label2.Caption := ltPassword;
    Label3.Caption := ltDatabase;
    Label4.Caption := ltConnectAs;
    UsernameEdit.Text := Session.LogonUsername;
    PasswordEdit.Text := Session.LogonPassword;
    if not (ldDatabaseList in Options) then
      DatabaseEdit.Text := Session.LogonDatabase
    else begin
      AliasList.DropDownCount := DropDownCount;
      AliasList.Visible := True;
      AliasList.Left  := DatabaseEdit.Left;
      AliasList.Width := DatabaseEdit.Width;
      for i := 0 to OracleAliasList.Count - 1 do AliasList.Items.Add(OracleAliasList[i]);
      DatabaseEdit.Visible := False;
      AliasList.Text := Session.LogonDatabase;
    end;
    case Session.ConnectAs of
       caSYSDBA: ConnectAsList.ItemIndex := 1;
      caSYSOPER: ConnectAsList.ItemIndex := 2;
    else
      ConnectAsList.ItemIndex := 0;
    end;
    if ldLogonHistory in Options then
    begin
      HistoryBtn.Visible := True;
      HistoryBtn.Enabled := LogonHistory.Count > 0;
      HistoryBtn.Hint    := ltHistoryHint;
    end;
    if not (ldDatabase in Options) then
    begin
      // Adjust dialog for database edit
      GroupBox.Height := GroupBox.Height - DBPanel.Height;
      Height := Height - DBPanel.Height;
      DBPanel.Visible := False;
    end;
    if (not (ldConnectAs in Options)) or
       (not OCI80Detected) or
       (Session.Preferences.UseOCI7 or ForceOCI7) then
    begin
      // Adjust dialog for connect as list
      GroupBox.Height := GroupBox.Height - CAPanel.Height;
      Height := Height - CAPanel.Height;
      CAPanel.Visible := False;
    end;
    LogCount := 0;
    repeat
      // Direct logon or show dialog first ?
      dr := mrCancel;
      if (ldAuto in Options) and (LogCount = 0) then
      begin
        Options := Options - [ldAuto];
        if not NoUserIdParam then s := GetParamString('UserId') else s := '';
        if s <> '' then
        begin
          UsernameEdit.Text := s;
          PasswordEdit.Text := '';
          if (ldDatabaseList in Options) then
            AliasList.Text := ''
          else
            DatabaseEdit.Text := '';
          dr := mrOK;
        end else begin
          if (Session.LogonUsername <> '') and (Session.LogonPassword <> '') then
            dr := mrOK
        end;
      end;
      if dr <> mrOK then
      begin
        dr := ShowModal;
        {$IFNDEF LINUX}
        if dr = mrOK then NoHistory := ((GetKeyState(vk_Control) and $80) <> 0);
        {$ENDIF}
      end;
      inc(LogCount);
      if dr = mrOK then
      begin
        Result := True;
        Session.LogonUsername := UsernameEdit.Text;
        Session.LogonPassword := PasswordEdit.Text;
        if (ldDatabaseList in Options) then
          Session.LogonDatabase := AliasList.Text
        else
          Session.LogonDatabase := DatabaseEdit.Text;
        Session.ConnectAs := caNormal;
        if (ldConnectAs in Options) then
        begin
          if ConnectAsList.ItemIndex = 1 then Session.ConnectAs := caSYSDBA;
          if ConnectAsList.ItemIndex = 2 then Session.ConnectAs := caSYSOPER;
        end;
        try
          if Session.POLite and (ldDatabaseList in Options) then
          begin
            Session.LogOff;
            DLLExit;
          end;
          Session.Logon;
          if Session.ExpirationMessage <> '' then
          begin
            s := Session.ExpirationMessage + #13#10 + ltChangePassword;
            if Confirm(s, ltConfirmTitle, 'YN') = idYes then ChangePassword(Session, ltExpired);
          end;
          if (ldLogonHistory in Options) and (not NoHistory) then
          begin
            LogonHistory.Add(Session.LogonUsername, Session.LogonPassword, Session.LogonDatabase, ConnectAsToString(Session.ConnectAs), False, True);
          end;
        except
          on E:EOracleError do
          begin
            if (E.ErrorCode <> 28001) or not OCI80 then
              ShowMessage(E.Message)
            else
              ChangePassword(Session, ltExpired);
          end;
        end;
        UsernameEdit.Text := Session.LogonUsername;
        PasswordEdit.Text := Session.LogonPassword;
        if (ldDatabaseList in Options) then
          AliasList.Text := Session.LogonDatabase
        else
          DatabaseEdit.Text := Session.LogonDatabase;
      end;
    until Session.Connected or (dr <> mrOK) or (LogCount > Retries);
    Free;
  end;
end;

procedure TLogOnForm.FormActivate(Sender: TObject);
begin
  {$IFDEF LINUX}
  if AliasList.Visible then
  begin
    AliasList.Left  := DatabaseEdit.Left;
    AliasList.Width := DatabaseEdit.Width;
  end;
  {$ENDIF}  
  InitForm(Self);
end;

procedure TLogOnForm.FormShow(Sender: TObject);
begin
  if UsernameEdit.Text = '' then UsernameEdit.Setfocus else PasswordEdit.Setfocus;
end;

procedure TLogOnForm.HistoryClick(Sender: TObject);
var Index: Integer;
begin
  Index := TMenuItem(Sender).Tag;
  UsernameEdit.Text := LogonHistory.Item(Index).Username;
  if LogonHistory.WithPassword or LogonHistory.Item(Index).Fixed then
    PasswordEdit.Text := LogonHistory.Item(Index).Password
  else
    PasswordEdit.Text := '';
  if DatabaseEdit.Visible then DatabaseEdit.Text := LogonHistory.Item(Index).Database;
  if AliasList.Visible then AliasList.Text := LogonHistory.Item(Index).Database;
  if ConnectAsList.Visible then
  begin
    case StringToConnectAs(LogonHistory.Item(Index).ConnectAs) of
       caSYSDBA: ConnectAsList.ItemIndex := 1;
      caSYSOPER: ConnectAsList.ItemIndex := 2;
    else
      ConnectAsList.ItemIndex := 0;
    end;
  end;
end;

procedure TLogOnForm.HistoryBtnClick(Sender: TObject);
var P: TPoint;
    i: Integer;
 procedure AddPopup(S: string; Index: Integer);
 var Item: TMenuItem;
 begin
   if (HistoryPopup.Items.Count = 0) and (S = '-') then Exit;
   Item := TMenuItem.Create(HistoryPopup);
   Item.Caption := S;
   Item.Tag := Index;
   Item.OnClick := HistoryClick;
   HistoryPopup.Items.Add(Item);
 end;
begin
  for i := 0 to HistoryPopup.Items.Count - 1 do HistoryPopup.Items.Delete(0);
  for i := 0 to logonHistory.Count - 1 do AddPopup(LogonHistory.Item(i).DisplayString, i);
  P.X := HistoryBtn.Left;
  P.Y := HistoryBtn.Top + HistoryBtn.Height;
  P := GroupBox.ClientToScreen(P);
  HistoryPopup.Popup(P.X, P.Y);
end;

procedure TLogOnForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if EnterKey(Key) and (ssCtrl in Shift) then
  begin
    Key := 0;
    ModalResult := mrOK;
  end;
end;

initialization
  LogonHistory := THistoryItems.Create(THistoryItem);

finalization
  LogonHistory.Free;

end.
