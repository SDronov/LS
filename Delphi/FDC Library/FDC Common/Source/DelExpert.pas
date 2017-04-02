{|----------------------------------------------------------------------
 | Unit:        DelExpert
 |
 | Author:      Egbert van Nes
 |
 | Description: The main form of DelForExp
 |
 | Copyright (c) 2000  Egbert van Nes
 |   All rights reserved
 |   Disclaimer and licence notes: see license.txt
 |
 |----------------------------------------------------------------------
}
unit DelExpert;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Delfor1;
type
  TDelExpertDlg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OptionsButton: TButton;
    HelpBtn: TButton;
    Label3: TLabel;
    Panel1: TPanel;
    CurrentBtn: TButton;
    AllButton: TButton;
    WholeProjBtn: TButton;
    CancelBtn: TButton;
    procedure CurrentBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OptionsButtonClick(Sender: TObject);
    procedure WholeProjBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllButtonClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
    procedure FormatterProgress(Sender: TObject; Progress: Integer);
    procedure CapFileNameEditChange(Sender: TObject);
  public
    HelpFile: string;
    CfgFile: string;
    procedure DoFormatFile(AFileName: string);
    { Public declarations }
  end;

var
  DelExpertDlg: TDelExpertDlg = nil;
  Formatter: TPascalParser = nil;

implementation

uses {DelForExpert, } DelForTypes, MyIDEStream, Progr, OptDlg, {Winfunc,}
  Dialogs,
  {FileFunc,
  Setup1, }ShellAPI;

{$R *.DFM}

function IsReadonlyFile(const FileName: string): Boolean;
var
  Attributes: Integer;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  Attributes := FileGetAttr(FileName);
  Result := {(Attributes = -1) or}((Attributes and
    faReadOnly) > 0);
  {$WARN SYMBOL_PLATFORM ON}
end;

function StrInsert(Str1, Str2: PChar; I: Integer): PChar;
var
  LenStr2: Integer;
begin
  if I < 0 then
    I := 0;
  LenStr2 := StrLen(Str2);
  StrMove(Str1 + I + LenStr2, Str1 + I, Integer(StrLen(Str1)) - I + 1);
  StrMove(Str1 + I, Str2, LenStr2);
  StrInsert := Str1;
end;

function MakeBakFile(Dest, FileName: PChar): PChar;
var
  F: file;
  P: PChar;
begin
  if FileExists(FileName) then
  begin
    MakeBakFile := StrCopy(Dest, FileName);
    P := StrRScan(Dest, '.');
    if P = nil then
      StrCat(Dest, '.~')
    else
    begin
      (StrEnd(P) - 1)^ := #0;
      StrInsert(P + 1, '~', 0);
    end;
    DeleteFile(string(Dest));
    AssignFile(F, FileName);
    {try}
    Rename(F, Dest);
    {except
      on EInOutError do ;
    end;}
  end
  else
  begin
    Dest[0] := #0;
    MakeBakFile := Dest;
  end;
end;

function FormatFile(Param: Pointer; const FileName, UnitName,
  FormName: string): Boolean stdcall;
var
  BakFile: array[0..255] of Char;
  ExtName: string;
begin
  Result := True;
  ExtName := LowerCase(ExtractFileExt(FileName));
  if ((ExtName = '.pas') or (ExtName = '.dpr'))
    and (Trim(FileName) <> '') then
  begin
    if FToolServices.IsFileOpen(FileName) then
      DelExpertDlg.DoFormatFile(FileName)
    else if (Param = nil) then
    begin
      if FileExists(FileName) and not
        IsReadonlyFile(FileName) then
      begin
        { IF PARAM<>NIL then only open files}
        if ProgressDlg.Visible then
        begin
          {if file not open then load from file}
          ProgressDlg.SetFileName(FileName);
          Application.ProcessMessages;
          Formatter.Clear;
          with Formatter do
          begin
            try
              Clear;
              try
                MakeBakFile(BakFile, PChar(FileName));
                LoadFromFile(BakFile);
                if Parse then
                  WriteToFile(PChar(FileName));
              except
                on E: EInOutError do
                  ShowMessage('I/O Error [' + E.Message + '] with "' + FileName
                    +
                    '"');
              end;
            finally
              Formatter.Clear;
            end;
          end;
        end;
      end
      else
      begin
        ShowMessage('Can not find "' + FileName + '"');
      end;
    end;
  end;
end;

procedure TDelExpertDlg.CapFileNameEditChange(Sender: TObject);
begin
  if OptionsDlg <> nil then
    with OptionsDlg do
      SaveFile(CapFileNameEdit.Text);
end;

procedure TDelExpertDlg.FormatterProgress(Sender: TObject; Progress: Integer);
begin
  ProgressDlg.ProgressBar1.Position := Progress;
end;

procedure TDelExpertDlg.CurrentBtnClick(Sender: TObject);
begin
  ProgressDlg.Show;
  DoFormatFile('');
  ProgressDlg.Hide;
end;

procedure TDelExpertDlg.DoFormatFile(AFileName: string);
{.$define tmpFile}
{$IFDEF tmpFile}
const
  TmpFile = 'DELFOR.~$$';
var
  P1: PChar;
  Tmp: file;
  LenP: Integer;
{$ENDIF}
var
  IDEStream: TIDEStream;
  P: PChar;
begin
  if ProgressDlg.Visible then
  begin
    IDEStream := TIDEStream.Create(AFileName);
    try
      if (not IsReadonlyFile(IDEStream.FileName)) and
        (not IsReadonlyBuffer(IDEStream.FileName)) then
      begin
        Formatter.Clear;
        if ProgressDlg.Visible then
          ProgressDlg.SetFileName(IDEStream.FileName);
        Application.ProcessMessages;

{$IFNDEF tmpFile}
        Formatter.LoadFromList(IDEStream.Lines);
        IDEStream.Lines.Clear;
{$ELSE}
        P1 := IDEStream.GetText;
        if P1 <> nil then
        begin
          LenP := StrLen(P1);
          if LenP > $8FFF then
          begin
            AssignFile(Tmp, TmpFile);
            Rewrite(Tmp, 1);
            BlockWrite(Tmp, P1^, LenP);
            CloseFile(Tmp);
            Formatter.LoadFromFile(TmpFile);
            Erase(Tmp);
          end
          else
            Formatter.Text := P1; {GetTextStr is very slow
          for large strings}
        end
{$ENDIF}
          if Formatter.Parse then
          begin
            P := PChar(Formatter.Text);
            IDEStream.WriteText(P);
          end;
      end
      else
        ShowMessage(ExtractFileName(IDEStream.FileName) +
          ': File or buffer is read only, or not yet saved');
    finally
      Formatter.Clear;
      IDEStream.Free;
    end;
  end;
end;

procedure TDelExpertDlg.FormCreate(Sender: TObject);
var
  DelForName: string;
begin
  GetToolServieces;
  //DelForName := GetDelForName;
  DelForName := '';
  if DelForName <> '' then
  begin
    if Formatter = nil then
      Formatter := TPascalParser.Create(PChar(ExtractFilePath(DelForName)));
    Formatter.OnProgress := FormatterProgress;
    {    HelpFile := Formatter.RootDir + 'DelFor.hlp';
        CfgFile := Formatter.RootDir + ExtractFileName(DelForName);
        ChangeFileExt(CfgFile, '.cfg');   }
  end
  else
  begin
    if Formatter = nil then
      Formatter := TPascalParser.Create('');
    {    HelpFile := 'DelFor.hlp';
        CfgFile := '';  }
  end;
  try
    {   Formatter.CfgFile := CfgFile;
       Formatter.Config(True);}
    Formatter.SetBorland;
    if ProgressDlg = nil then
      ProgressDlg := TProgressDlg.Create(Application);
    ActiveControl := CurrentBtn;
  finally
    Formatter.Deactivate;
  end;
end;

procedure TDelExpertDlg.OptionsButtonClick(Sender: TObject);
begin
  if OptionsDlg = nil then
  begin
    OptionsDlg := TOptionsDlg.Create(Application);
    OptionsDlg.HelpFile := PChar(HelpFile);
    OptionsDlg.CapFileNameEdit.OnChange := CapFileNameEditChange;
  end;
  OptionsDlg.Formatter := Formatter;
  OptionsDlg.ShowModal;
end;

procedure TDelExpertDlg.WholeProjBtnClick(Sender: TObject);
var
  Dir: string;
begin
  ProgressDlg.Show;
  Dir := ExtractFileDir(ExpandFileName(GetProjectName));
  if Dir <> '' then
    Chdir(Dir);
  FToolServices.EnumProjectUnits(FormatFile, nil);
  ProgressDlg.Hide;
end;

procedure TDelExpertDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ProgressDlg.Hide;
  with Formatter do
  begin
    Clear;
    if (FillNewWords = fmAddNewWord) then
      SaveCapFile(CapFileName);
    Deactivate;
  end;
end;

procedure TDelExpertDlg.AllButtonClick(Sender: TObject);
var
  I: Integer;
begin
  with FToolServices do
  begin
    ProgressDlg.Show;
    FToolServices.EnumProjectUnits(FormatFile, @I);
    ProgressDlg.Hide;
  end;
end;

procedure TDelExpertDlg.HelpBtnClick(Sender: TObject);
begin
  WinHelp(0, PChar(HelpFile), Help_Contents, 0);
end;

procedure TDelExpertDlg.FormShow(Sender: TObject);
var
  ProjectOpened: Boolean;
  S: array[0..260] of Char;
begin
  Formatter.Activate;
  with Formatter do
    if CapFileName <> nil then
    begin
      SaveFile(CapFileName);
      CapFileName := StrCopy(S, CapFileName);
    end;
  {if file is changed reread}
  ProjectOpened := GetProjectName <> '';
  AllButton.Enabled := ProjectOpened;
  WholeProjBtn.Enabled := ProjectOpened;
  CurrentBtn.Enabled := GetCurrentFile <> '';
end;

procedure TDelExpertDlg.FormDestroy(Sender: TObject);
begin
  //  Formatter.Config(False);
  Formatter.Free;
  Formatter := nil;
  ProgressDlg.Free;
  ProgressDlg := nil;
end;

procedure TDelExpertDlg.Label4Click(Sender: TObject);
begin
  {opens default explorer with the URL of the homepage}
  ShellExecute(HInstance, 'open', 'http://www.dow.wau.nl/aew/delforexp.html',
    nil, nil, SW_SHOW);
end;

end.
