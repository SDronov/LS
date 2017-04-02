unit ExportWizardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWizardFrm, cxLookAndFeelPainters, cxMemo, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxImage, ExtCtrls,
  dxLayoutControl, cxLabel, cxPC, StdCtrls, cxButtons, cxControls,
  AppEvnts, Menus, ComCtrls, ShlObj, cxShellCommon,
  cxDropDownEdit, cxShellComboBox, cxGraphics, ztvregister,
  ztvBase, ztvUnRar, DB, OracleData, JvComponentBase, JvCreateProcess;

type
  TExportWizardForm = class(TBaseWizardForm)
    tabProcess: TcxTabSheet;
    tabResult: TcxTabSheet;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutControl4Item1: TdxLayoutItem;
    cxLabel6: TcxLabel;
    dxLayoutControl4Item2: TdxLayoutItem;
    cxMemo: TcxMemo;
    dxLayoutControl2Item3: TdxLayoutItem;
    Label1: TLabel;
    dxLayoutControl2Item1: TdxLayoutItem;
    cmbxPath: TcxButtonEdit;
    UnRar1: TUnRar;
    dxLayoutControl3: TdxLayoutControl;
    barPos: TcxProgressBar;
    btnStop: TcxButton;
    cxLabel5: TcxLabel;
    cxLogMemo: TcxMemo;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutControl3Item5: TdxLayoutItem;
    dxLayoutControl3Item6: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutControl3Item4: TdxLayoutItem;
    odsExpTables: TOracleDataSet;
    ExpStart: TJvCreateProcess;
    dlgOpen: TOpenDialog;
    dxLayoutControl2Item4: TdxLayoutItem;
    edtFileName: TcxButtonEdit;
    procedure btnStopClick(Sender: TObject);
    procedure cmbxPathButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExpStartRawRead(Sender: TObject; const S: String);
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExpStartTerminate(Sender: TObject; ExitCode: Cardinal);
  published
    procedure tabGeneralNextExecute(Sender: TObject);
  private
    FDumpFileName: TFileName;
    function GetExpTables: string;
    procedure DoLoad;
    procedure OnFinishImport(AExitCode: Cardinal);
    procedure OnMessage(const S: string);
  public
  end;


implementation

uses fdcCustomTabDlgFrm, fdcMessages, DataDM, Oracle, ActiveX, FileCtrl, fdcUtils;

{$R *.dfm}

procedure TExportWizardForm.tabGeneralNextExecute(Sender: TObject);

  function CheckFileName: TFileName;
  begin
    if not FileExists(edtFileName.Text) then
      raise
        Exception.CreateFmt('<<Утилита [%s] не найдена по указанному пути>>.<<Проверьте правильность выбора каталога>>', [edtFileName.Text]);

    if not DirectoryExists(cmbxPath.Text) then
      raise
        Exception.CreateFmt('<<Каталог [%s] не найден>>.<<Проверьте правильность выбора каталога>>', [cmbxPath.Text]);
    with MainData do
      Result := IncludeTrailingPathDelimiter(cmbxPath.Text)+
                Format( 'exp_%s_%s.dmp',
                         [ GetSystemValue('CustomsCode',rvString),
                           FormatDateTime('YYYYMMDD', GetServerDate) ]
                       );
    if FileExists(Result) then
      DeleteFile(Result);
  end;
begin
  FDumpFileName := CheckFileName;
  dxLayoutControl1Item8.Visible := False;  // Спрячем кнопку Отмена
  DoLoad;
end;

procedure TExportWizardForm.DoLoad;
  var
    OldCur : TCursor;
begin
  EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
    MF_GRAYED);
  dxLayoutControl1Group8.Visible := False;
  OldCur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
   // barPos.Position := 0;
    PageControl.ActivePage := tabProcess;
    OnMessage(Format('%s Старт экспорта данных...',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    OnMessage(Format('%s Формирование данных для экспорта...',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
    MainData.pkgCommon.PackageName := 'p_Export';
    try
      MainData.pkgCommon.CallProcedure('UpLoadData', []);
    except
      on E: Exception do
       begin
         OnMessage(Format('В ходе подготовки данных к экспорту произошла ошибка: [%s]', [E.Message]));
         OnFinishImport(13);
         Exit;
       end;
    end;
    ExpStart.CommandLine := format('"%s" %s file=''%s'' log=''%s'' grants=n tables=(%s) statistics=none consistent=y',
        [edtFileName.Text,
         MainData.GetConnectionString,
         FDumpFileName,
         ChangeFileExt(FDumpFileName, '.log'),
         MainData.Session.LogonUsername+'.exp%'
        ]);
    OnMessage(Format('%s Запуск утилиты экспорта из командной строки  [%s]',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now),
       ExpStart.CommandLine]));
    ExpStart.Run;
  finally
    Screen.Cursor := OldCur;
  end;
end;

procedure TExportWizardForm.OnFinishImport(AExitCode: Cardinal);
{  var
    vLog: TFileName;}
begin
{  vLog := ChangeFileExt(FDumpFileName, '.log');
  if FileExists(vLog) then
    begin
      cxMemo.Lines.LoadFromFile(vLog);
      cxLogMemo.Lines.AddStrings(cxMemo.Lines);
    end;}
  //dxLayoutControl3Group1.Visible := False;
  try
    EnableMenuItem(GetSystemMenu(Handle, False), SC_CLOSE, MF_BYCOMMAND or
      MF_ENABLED);
    dxLayoutControl1Group8.Visible := True;
    OnMessage(Format('%s Экспорт данных завершен %s',
      [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now),
       IfElse((AExitCode <> 0), ' с ошибками.', '')
      ]));

    Screen.Cursor := crHourGlass;
    try
      cxMemo.Lines.Assign(cxLogMemo.Lines);
      //cxMemo.CaretPos := Point(1, cxMemo.Lines.Count);
      cxMemo.Lines.Add('');
    finally
      Screen.Cursor := crDefault;
    end;

    PageControl.ActivePage := tabResult;
  finally
    dxLayoutControl1Group8.Visible := True;
    //dxLayoutControl3Group1.Visible := True;
  end;
end;

procedure TExportWizardForm.OnMessage(const S: string);
begin
  cxLogMemo.Lines.Add(S)
end;

procedure TExportWizardForm.btnStopClick(Sender: TObject);
begin
  inherited;
  // Terminate;
end;


function SelectDirExCB(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) and (lpData <> 0) then
    SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpdata);
  result := 0;
end;

function SelectDirectoryEx(const Caption: string; const Root: WideString;
  var Directory: string; aOptions: Integer = 0): Boolean;
var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  OldErrorMode: Cardinal;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;
begin
  Result := False;
  if not DirectoryExists(Directory) then
    Directory := '';
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      with BrowseInfo do
      begin
        // при использовании Application.Handle наблюдался выход окна диалога
        // за границу экрана при BIF_NEWDIALOGSTYLE or BIF_EDITBOX,
        // а при использовании Application.MainForm.Handle (отличного от
        // Application.Handle !) - непонятные вещи с Z-Order после закрытия диалога (MDI app)
        hwndOwner := Screen.Forms[0].Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS or aOptions;
        if Directory <> '' then
        begin
          lpfn := SelectDirExCB;
          lParam := Integer(PChar(Directory));
        end;
      end;
      WindowList := DisableTaskWindows(0);
      OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        SetErrorMode(OldErrorMode);
        EnableTaskWindows(WindowList);
      end;
      Result :=  ItemIDList <> nil;
      if Result then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

procedure TExportWizardForm.cmbxPathButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Dir: string;
begin
  inherited;
  Dir := cmbxPath.Text;
  if SelectDirectoryEx('', '', Dir, 0) then
        cmbxPath.Text := Dir;
end;

function TExportWizardForm.GetExpTables: string;
begin
  RefreshDataset(odsExpTables);
  odsExpTables.First;
  Result := '';
  while not odsExpTables.Eof do
    begin
      Result := Result + odsExpTables.Fields[0].AsString;
      odsExpTables.Next;
      if not odsExpTables.Eof then
        Result := Result + ',';
    end;
  odsExpTables.CloseAll;
end;

procedure TExportWizardForm.ExpStartRawRead(Sender: TObject;
  const S: String);
begin
  OnMessage(S);
end;

procedure TExportWizardForm.edtFileNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
    if dlgOpen.Execute then
     edtFileName.Text := dlgOpen.FileName;
end;

procedure TExportWizardForm.ExpStartTerminate(Sender: TObject;
  ExitCode: Cardinal);
begin
  //OnMessage(Format('Утилита экспорта завершила работу с кодом [%d]', [ExitCode]));
  OnFinishImport(ExitCode);
end;

end.

