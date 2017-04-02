unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, dxLayoutControl, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, DB, VKDBFDataSet, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, ActnList, AppEvnts,
  cxProgressBar, uOptions;

type
  TMainForm = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    edtMemo: TcxMemo;
    dxLayoutControl1Item2: TdxLayoutItem;
    dlgOpen: TOpenDialog;
    dsDBF: TVKDBFNTX;
    btnClose: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    actlMain: TActionList;
    actFile: TAction;
    btnFile: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    actClose: TAction;
    evtApp: TApplicationEvents;
    styleMain: TcxEditStyleController;
    barFile: TcxProgressBar;
    dxLayoutControl1Item5: TdxLayoutItem;
    barDir: TcxProgressBar;
    dxLayoutControl1Item6: TdxLayoutItem;
    actDir: TAction;
    btnDir: TcxButton;
    dxLayoutControl1Item8: TdxLayoutItem;
    actStop: TAction;
    btnStop: TcxButton;
    dxLayoutControl1Item1: TdxLayoutItem;
    procedure Log(aText: string = ''; DoSkip: boolean = False);
    procedure KillDuple(aFileName: string; IsAtomic: boolean = False);
    procedure KillDupleDir(aDir : string);
    procedure actFileExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure evtAppException(Sender: TObject; E: Exception);
    procedure actDirExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actStopExecute(Sender: TObject);
    procedure actWorkDisabled(Sender: TObject);
    procedure actWorkEnabled(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DoStop : boolean;
    IsWork : boolean;
    Options : TOptions;
  public
  published
  end;

var
  MainForm : TMainForm;

implementation

{$R *.dfm}

uses
  ShellAPI,
  ShlObj,
  IniFiles;

const
  cSec     = 'main';
  cDBFFile = 'DBF';
  cDir     = 'Dir';

function GetIniFileName: string;
begin
  Result := ExtractFileName(ChangeFileExt(Application.ExeName, '.ini'));
end;


procedure TMainForm.Log(aText: string = ''; DoSkip: boolean = False);
begin
  edtMemo.Lines.Append(aText);
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsWork := False;
  DoStop := False;
  barFile.Properties.Min := 0;
  barFile.Position := 0;
  barDir.Properties.Min := 0;
  barDir.Position := 0;
  Options := TOptions.Create;
end;


procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Options.Free;
  inherited;
end;



procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not IsWork;
end;


procedure TMainForm.evtAppException(Sender: TObject;
  E: Exception);
begin
  Log(e.Message);
end;


procedure TMainForm.KillDuple(aFileName: string; IsAtomic: boolean = False);
var
  s  : string;
  d1 : integer;
  d2 : integer;
  i  : integer;
  doDel   : boolean;
  swap    : TStrings;
  TheDate : TDateTime;
  
  function GetRecString: string;
  var
    i : integer;
  begin
    Result := '';
    for i := 0 to dsDBF.FieldCount-1 do
      Result := Result +  '[' + dsDBF.Fields[i].AsString + ']';
  end;

  procedure CheckStop;
  begin
    if DoStop and dsDBF.Active then
    begin
      dsDBF.Last;
      dsDBF.Next;
      Log('Остановлено пользователем');
    end;
  end;

begin
  if IsAtomic then
  begin
    DoStop := False;
    IsWork := True;
    UpdateActions;
  end;
  try
    Log(Format('файл %s',[aFileName]));
    TheDate := Now;
    // --- open
    swap := TStringList.Create; 
    dsDBF.DBFFileName := aFileName;
    dsDBF.AccessMode.OpenReadWrite := True;
    dsDBF.Open;
    dsDBF.FLock;
    dsDBF.BeginAddBuffered(1024);
    try
      // --- log
      Log(Format('Число строк %d',[dsDBF.RecordCount]));
      barFile.Properties.Max := dsDBF.RecordCount;
      // --- поиск дублей
      d1 := 0;
      d2 := 0;
      dsDBf.First;
      while not dsDBF.Eof do
        if dsDBF.Deleted then
        begin
          // --- обработка удаленных записей 
          inc(d1);
          dsDBF.Next;
          barFile.Position := dsDBF.RecNo;
          CheckStop;
          Application.ProcessMessages;
        end
        else
        begin
          // --- получить строку
          s := GetRecString;
          doDel := False;

          // --- если в своп массиве она есть, удалить из DBF
          for i := 0 to swap.Count-1 do
            if swap[i] = s then
              doDel := True;

          // --- удаление если надо иначе сохранить строку в свопе
          if doDel then
          begin
            dsDBF.Delete;
            inc(d2);
          end
          else
            swap.Append(s);
          // --- следующая запись в DBF
          dsDBF.Next;
          barFile.Position := dsDBF.RecNo;
          CheckStop;
          Application.ProcessMessages;
        end;
        if Options.doPack then
          dsDBF.Pack;
    finally
      // --- close
      swap.Free;
      dsDBF.EndAddBuffered;
      dsDBF.UnLock;
      dsDBF.Close;
    end;
    barFile.Position := 0;
    log(Format('Удаленных записей %d',[d1]));
    log(Format('Дублей удалено %d',[d2]));
    Log(Format('Время обработки %s', [TimeToStr(Now - TheDate)]));
  except on e:exception do
    Log(Format('Ошибка %s', [{aFileName, }e.Message]));
  end;
  Log;
  if IsAtomic then
  begin
    IsWork := False;
    UpdateActions;
  end;
end;


procedure TMainForm.KillDupleDir(aDir : string);
var
  Files     : TStrings;
  i         : integer;
  StartDate : TDateTime;

  Procedure ScanDir(Dir: string);
  var
    SearchRec:TSearchRec;
  begin
    if (Dir <> '') and (Dir[length(Dir)] <> '\') then
      Dir := Dir + '\';
    if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
    repeat
      if (SearchRec.name='.') or (SearchRec.name='..') then
        continue;
      if (SearchRec.Attr and faDirectory) <> 0 then
        ScanDir(Dir + SearchRec.name)
      else
        Files.Append(Dir + SearchRec.name);
    until (FindNext(SearchRec) <> 0);
    FindClose(SearchRec);
  end;

begin
  DoStop := False;
  IsWork := True;
  UpdateActions;
  try
    Files := TStringList.Create;
    ScanDir(aDir);
    barDir.Properties.Max := Files.Count;
    StartDate := Now;
    i := 0;
    while i < Files.Count do
    begin
      KillDuple(Files[i]);
      Inc(i);
      barDir.Position := i;
      if DoStop then
        i := Files.Count;      
    end;
    Files.Free;
    Log(Format('Время обработки каталога %s', [TimeToStr(Now - StartDate)]));
    Log;
  except on e: exception do begin
    Log('Ошибка выполнения: ' + e.Message);
  end; end;
  barDir.Position := 0;
  IsWork := False;
  UpdateActions;
end;


procedure TMainForm.actDirExecute(Sender: TObject);
var
  TitleName : string;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Options.Load;
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner := MainForm.Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName := 'Выберите каталог';
  BrowseInfo.lpszTitle := PChar(TitleName);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if (lpItemId <> nil) then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    GlobalFreePtr(lpItemID);
    // --- work with directory
    KillDupleDir(TempPath);
  end;
end;


procedure TMainForm.actFileExecute(Sender: TObject);
begin
  Options.Load;
  if dlgOpen.Execute then
    KillDuple(dlgOpen.FileName, True);
end;


procedure TMainForm.actCloseExecute(Sender: TObject);
begin
  Self.Close;
end;


procedure TMainForm.actStopExecute(Sender: TObject);
begin
  DoStop := True;
end;


procedure TMainForm.actWorkDisabled(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsWork;
end;


procedure TMainForm.actWorkEnabled(Sender: TObject);
begin
  TAction(Sender).Enabled := IsWork;
end;


end.

