{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: $
  $Revision: 3436 $
  $Author: FORS\anaumenkov $
  $Date: 2007-10-04 16:17:56 +0400 (Р§С‚, 04 РѕРєС‚ 2007) $
}
unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomOraMainFrm, cxGraphics, Oracle, XPMan,
  AppEvnts, ImgList, dxBar, cxContainer, cxEdit, dxLayoutLookAndFeels,
  ActnList, cxControls, dxStatusBar, cxLookAndFeels, ExtCtrls, cxLabel,
  StdActns, fdcOracleSession, fdcInspector, dxDockControl, fdcParamsHolder,
  IaccLoader, cxProgressBar, cxTextEdit, cxMemo, dxLayoutControl,
  dxBarExtItems, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  Menus;

type
  TMainForm = class(TfdcCustomOraMainForm)
    actStartStopChecking: TAction;
    dxBarButton1: TdxBarButton;
    progrBar: TcxProgressBar;
    actSetInterval: TAction;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    mmLog: TcxMemo;
    edLogPath: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edImportDir: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edCfgFile: TcxTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edPwd: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    edUserName: TcxTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    edDBName: TcxTextEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    bstConnectIndicator: TdxBarStatic;
    btnChooseDir: TcxButton;
    dxLayoutControl1Item8: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    dxLayoutControl1Item9: TdxLayoutItem;
    btnOpenConfig: TcxButton;
    dxLayoutControl1Item10: TdxLayoutItem;
    btnChooseLog: TcxButton;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dxLayoutControl1Group4: TdxLayoutGroup;
    dxBarEdit1: TdxBarEdit;
    dxBarStatic1: TdxBarStatic;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    medInterval: TcxMaskEdit;
    dxBarButton2: TdxBarButton;
    procedure actStartStopCheckingExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDBNamePropertiesChange(Sender: TObject);
    procedure edUserNamePropertiesChange(Sender: TObject);
    procedure edPwdPropertiesChange(Sender: TObject);
    procedure edImportDirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnChooseDirClick(Sender: TObject);
    procedure btnOpenConfigClick(Sender: TObject);
    procedure btnChooseLogClick(Sender: TObject);
    procedure actSetIntervalExecute(Sender: TObject);
    procedure actSetIntervalUpdate(Sender: TObject);
    procedure edImportDirExit(Sender: TObject);
    procedure actStartStopCheckingUpdate(Sender: TObject);
  private
    FLoader: TIaccFileLoader;
    FStartTime: TDateTime;
    FPrevProgr: Double;
    procedure OnLoadProgress(Sender: TObject);
    procedure OnFinishImport(Sender: TObject);
    procedure OnMessage(const S: string);
  protected
    function ShowLogon: boolean; override;
    procedure LoadLogon; override;
    procedure SaveLogon; override;
    function GetSession: TfdcOracleSession; override;
  end;

var
  MainForm: TMainForm;

implementation

uses
  MainDm, fdcCustomMainDm, Registry, StrUtils, fdcMessages, ShlObj, IaccUtils;

{$R *.dfm}

const
  cCheckInterval = 'CheckInterval';
  cGUIIntervalMult: Integer = 60000;

{ TMainForm }

function TMainForm.GetSession: TfdcOracleSession;
begin
  Result := MainData.Session;
end;

procedure TMainForm.actStartStopCheckingExecute(Sender: TObject);
begin
  with Sender as TAction do
  begin
    gBreakImport := not Checked;

    if Checked then
    begin
      try
        Session.Connected := True;
        bstConnectIndicator.Caption := 'Соединен';
        SaveLogon;
      except
        Checked := not Checked;
        raise;
      end;
      FLoader.Directory := edImportDir.Text;
      FLoader.LogFileName := edLogPath.Text;
      FLoader.ConfigFileName := edCfgFile.Text;
    end;

    Hint := IfThen(Checked, 'Прекратить', 'Продолжить') + ' проверку файлов/импорт';
    edCfgFile.Enabled := not Checked;
    edLogPath.Enabled := not Checked;
    edImportDir.Enabled := not Checked;
    btnChooseDir.Enabled := not Checked;
    btnChooseLog.Enabled := not Checked;
    btnOpenConfig.Enabled := not Checked;

    mmLog.Lines.Add(Format(#13#10'Загрузка %s в %s', [IfThen(Checked,
      'начата', 'остановлена'), DateTimeToStr(Now)]));

    FLoader.Active := Checked;
  end;
end;

procedure TMainForm.OnLoadProgress(Sender: TObject);
begin
  with Sender as TIaccLegacyLoader do
  begin
    if Position <= 1 then
    begin
      FStartTime := Now;
      progrBar.Visible := True;
      progrBar.Properties.Max := Total;
      FPrevProgr := 0;
    end;
    if (Position/Total - FPrevProgr) * 100 > 1 then
    begin
      FPrevProgr := Position/Total;
      progrBar.Position := Position;
      lblHint.Caption := Format('%s %s осталось', [ShortCaption,
        TimeToStr((Total - Position)/Position * (Now - FStartTime))]);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  S: string;
  I: Integer;
begin
  inherited;
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      I := 0;
      if OpenKey(AppRegistryKey, False) then
      begin
        S := ReadString('ImportDirectory');
        if ValueExists(cCheckInterval) then
          I := ReadInteger(cCheckInterval) * cGUIIntervalMult;
      end;
      CloseKey;

      FLoader := TIaccFileLoader.Create(S);
      if OpenKey(AppRegistryKey, False) then
      begin
        if ValueExists('LogFileName') and (ReadString('LogFileName') <> '') then
          FLoader.LogFileName := ReadString('LogFileName');
        if ValueExists('ConfigFileName') and (ReadString('ConfigFileName') <> '') then
          FLoader.ConfigFileName := ReadString('ConfigFileName');
      end;

      edDBName.Text := Session.LogonDatabase;
      edUserName.Text := Session.LogonUsername;
      edPwd.Text := Session.LogonPassword;

      edImportDir.Text := S;
      edLogPath.Text := FLoader.LogFileName;
      edCfgFile.Text := FLoader.ConfigFileName;

      FLoader.OnProgress := OnLoadProgress;
      FLoader.OnFinishImport := OnFinishImport;
      FLoader.OnMessage := OnMessage;
      if I > 0 then
        FLoader.Interval := I;
      medInterval.Text := IntToStr(Round(FLoader.Interval / cGUIIntervalMult));

      Session.Connected := True;
      bstConnectIndicator.Caption := 'Соединен';
              
      // импорт без директории невозможен - добавляется backslash to filename
      if S <> '' then
        actStartStopChecking.Execute;
    finally
      Free;
    end;
end;

procedure TMainForm.OnFinishImport(Sender: TObject);
begin
  progrBar.Visible := False;
  lblHint.Caption := '';
  mmLog.Lines.Add(FLoader.LastMessage);
end;

procedure TMainForm.OnMessage(const S: string);
begin
  mmLog.Lines.Add(S);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with TRegistry.Create do
    if OpenKey(AppRegistryKey, True) then
    begin
      WriteString('LogFileName', edLogPath.Text);
      WriteString('ConfigFileName', edCfgFile.Text);
    end;
end;

function TMainForm.ShowLogon: boolean;
begin
  Result := True;
end;

procedure TMainForm.edDBNamePropertiesChange(Sender: TObject);
begin
  Session.LogonDatabase := edDBName.Text;
end;

procedure TMainForm.edUserNamePropertiesChange(Sender: TObject);
begin
  Session.LogonUsername := edUserName.Text;
end;

procedure TMainForm.edPwdPropertiesChange(Sender: TObject);
begin
  Session.LogonPassword := edPwd.Text;
end;

procedure TMainForm.edImportDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (sSCtrl in Shift) and (Key = VK_F4) then
    btnChooseDirClick(Sender);
end;

procedure TMainForm.btnChooseDirClick(Sender: TObject);
var
  S: string;
begin
  if SelectDirectoryEx('Выберите директорию', '', S, BIF_NEWDIALOGSTYLE or BIF_EDITBOX) then
    edImportDir.Text := S;
end;

// todo: it's recommended to compile w/o debug info; some in Win CryptAPI ? 
function HardCodedCrypt(S: string; ADoCrypt: Boolean = False): string;
var
  I, J: Integer;
const
  cHardCodedPassword = 'ksfdghoewv';
  cHCPLen = Length(cHardCodedPassword);
begin
  Result := '';
  if not ADoCrypt then
    if Pos('enc->', LowerCase(S)) = 0 then
    begin
      Result := S;
      Exit;
    end
    else
      Delete(S, 1, 5);

  for I := 1 to Length(S) div cHCPLen do
    for J := 1 to cHCPLen do
      Result := Result + Chr(Ord(S[(I - 1) * cHCPLen + J])
        xor Ord(cHardCodedPassword[J]));
  J := Length(S) mod cHCPLen;
  for I := 1 to J do
    Result := Result + Chr(Ord(S[Length(S) - J + I])
      xor Ord(cHardCodedPassword[I]));
end;

procedure TMainForm.LoadLogon;
begin
  inherited;
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(AppRegistryKey, False) then
        Session.LogonPassword := HardCodedCrypt(ReadString('PASSWORD'));
    finally
      Free;
    end;
end;

procedure TMainForm.SaveLogon;
begin
  inherited;
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(AppRegistryKey, False) then
        WriteString('PASSWORD', 'enc->' + HardCodedCrypt(Session.LogonPassword, True));
    finally
      Free;
    end;
end;

procedure TMainForm.btnOpenConfigClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edCfgFile.Text := dlgOpen.FileName;
end;

procedure TMainForm.btnChooseLogClick(Sender: TObject);
begin
  if dlgSave.Execute then
    edLogPath.Text := dlgSave.FileName;
end;

procedure TMainForm.actSetIntervalExecute(Sender: TObject);
begin
  FLoader.Interval := StrToInt(medInterval.Text) * cGUIIntervalMult;
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(AppRegistryKey, False) then
        WriteInteger(cCheckInterval, Round(FLoader.Interval / cGUIIntervalMult));
    finally
      Free;
    end;
end;

procedure TMainForm.actSetIntervalUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := StrToIntDef(medInterval.Text, -555) <> -555;
end;

procedure TMainForm.edImportDirExit(Sender: TObject);
begin
  if (Trim(edImportDir.Text) <> '') and not DirectoryExists(edImportDir.Text) then
  begin
    MessageDlg('Заданная директория недоступна', '', '', mtWarning, [mbOK], 0);
    edImportDir.SetFocus;
    edImportDir.SelStart := Length(edImportDir.Text);
  end;
end;

procedure TMainForm.actStartStopCheckingUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := DirectoryExists(edImportDir.Text);
end;

end.
