unit CheckCThread;

interface

uses
  Windows,
  SysUtils,
  Forms,
  Classes,
  CheckCopyUtils,
  Masks,
  VKDBFDataSet;

type

  TFCThread = class(TThread)
  private
    procedure   Log(aText: string; isLogDateTime: boolean = True);
    procedure   LogError(aErrorCode: integer);
  private
    fs : TFormatSettings;
    // --- Log procedures
    FOnLog         : TLogProcedure;
    FOnLogError    : TLogErrorProcedure;
    // --- Folders
    FsrcFtpDir          : AnsiString;
    FdstFtpDir          : AnsiString;
    FsrcFtpListSDirFile : AnsiString;
    FdstAnsFTPDir       : AnsiString;
    FFileMask           : AnsiString;
    FsrcDir             : AnsiString;
    FdstDir             : AnsiString;
    // --- Files for move
    FMoveFiles : TStrings;
    // --- sleep Delay
    FDelaySec : Integer;
    // --- max count load files name
    FMaxCountFiles : Integer;
    // --- waite Exclusive lock
    FWaitExclusive : Integer;
    //--
    FNeedCheckProvision : Boolean;
    //--
    function ProcessMoveFile(aFileName :AnsiString):boolean;
    procedure DownloadFromFtp;
    procedure PutFileToFtp(afile, aCustomCode: AnsiString);
  protected
    procedure   Execute; override;
  public
    Constructor Create(asrcFtpDir, adstFtpDir, asrcFtpListSDirFile, adstAnsFTPDir, aFileMask : AnsiString; aSrcDir : AnsiString; aDstDir : AnsiString; aDelaySec : Integer; aMaxCountFiles: Integer; aWaitExclusive: Integer; aNeedCheckProvision: Boolean);
    Destructor  Destroy; override;
    //--
    procedure LoadFileName(aSrcDir: AnsiString);
  published
    property    OnLog : TLogProcedure read FOnLog write FOnLog;
    property    OnLogError : TLogErrorProcedure read FOnLogError write FOnLogError;
  end;

const cTimeFormat = 'HH:MM:SS';
      cDbfBuffer  = 512;
      cTKInvalid  = 99;
      
implementation

uses CheckCopySevice, MainDataMUnit, Math, ExportModule, ExportFTPAns;

procedure TFCThread.DownloadFromFtp;
  var l_listsourcedir: TStringList;
      l_listfile: TStringList;
      l_i, l_j: Integer;
      l_sm: TMemoryStream;
  //--
  function MatchesMask(const Filename, Mask: string): Boolean;
  var
    CMask: TMask;
  begin
    CMask := TMask.Create(Mask);
    try
      Result := CMask.Matches(Filename);
    finally
      CMask.Free;
    end;
  end;
  //--
begin
 l_listsourcedir := TStringList.Create;
 l_listfile := TStringList.Create;
 try
   if (FsrcFtpListSDirFile <> '') then
     begin
       if (FileExists(GetProgrammPath + FsrcFtpListSDirFile)) then
         begin 
           l_listsourcedir.LoadFromFile(GetProgrammPath + FsrcFtpListSDirFile);
         end;
     end;
   if (l_listsourcedir.Count = 0) then
     begin
       l_listsourcedir.Append(FsrcFtpDir);
     end;
   l_sm := TMemoryStream.Create;
   for l_i := 0 to l_listsourcedir.Count - 1 do
     begin
       MainDataM.MainIdFTP.ChangeDir(DelBackSlash(l_listsourcedir.Strings[l_i]));
       l_listfile.Clear;
       MainDataM.MainIdFTP.List(l_listfile);
       MainDataM.MainIdFTP.DirectoryListing.LoadList(l_listfile);
       l_listfile.Clear;
       for l_j := 0 to MainDataM.MainIdFTP.DirectoryListing.Count - 1 do
         begin
           if (MainDataM.MainIdFTP.Size(MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName) > 0)and(MatchesMask(UpperCase(MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName),UpperCase(FFileMask))) then
             begin
               l_sm.SetSize(0);
               MainDataM.MainIdFTP.Get(MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName, l_sm);
               l_sm.SaveToFile(FsrcDir + MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName);
               FileSetDate(FsrcDir + MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName, DateTimeToFileDate(MainDataM.MainIdFTP.DirectoryListing.Items[l_j].ModifiedDate));
               MainDataM.MainIdFTP.Delete(MainDataM.MainIdFTP.DirectoryListing.Items[l_j].FileName);
             end;
         end;
     end;
   FreeAndNil(l_listsourcedir);
   FreeAndNil(l_listfile);
   FreeAndNil(l_sm);
  except
    on e:Exception do
      begin
        FreeAndNil(l_listsourcedir);
        FreeAndNil(l_listfile);
        FreeAndNil(l_sm);
        e.Message := Format('Ошибка FTP : %s', [e.Message]);
        Log(e.Message);
      end;
  end;
end;

procedure TFCThread.PutFileToFtp(afile, aCustomCode: AnsiString);
begin
  if (LowerCase(ExtractFileExt(afile))='.ans') then
    begin
      MainDataM.MainIdFTP.ChangeDir(Format(FdstAnsFtpDir, [aCustomCode]));
    end
  else
    begin
      MainDataM.MainIdFTP.ChangeDir(Format(FdstFtpDir, [aCustomCode]));
    end;
  MainDataM.MainIdFTP.Put(afile,ExtractFileName(afile),true);
end;

procedure TFCThread.Execute;
  var l_movecount: Integer;
begin
  FOnLog('Процесс обработки запущен');
  while not(CheckCopyService.needstop) do
    begin
      //-- загрузка файлов с ФТП
      DownloadFromFtp;
      //-- очистка списка файлов для перемещения
      FMoveFiles.Clear;
      //-- загрузка списка файлов для перемещения
      LoadFileName(FsrcDir);
      l_movecount := 0;
      //-- обработка файлов
      if (FMoveFiles.Count > 0) then
        begin
          while (FMoveFiles.Count > 0) do
            begin
              if (ProcessMoveFile(FMoveFiles.Strings[0])) then
                begin
                  Inc(l_movecount);
                end;
              FMoveFiles.Delete(0);
            end;
          //-- задержка между сканированием входящей директории если ни один файл не удалось переместить
          if (l_movecount = 0) then
            begin
              sleep(FDelaySec);
            end;
        end
      else
        begin
          //-- задержка между сканированием входящей директории
          sleep(FDelaySec);
        end;
      //--
    end;
  //--
  FOnLog('Процесс обработки закончил работу');
end;

// ----------------------------------------------------------------------------
// --- Протокол


procedure TFCThread.Log(aText: string; isLogDateTime: boolean = True);
begin
  if Assigned(FOnLog) then
    FOnLog(aText);
end;


procedure TFCThread.LogError(aErrorCode: integer);
begin
  if Assigned(FOnLogError) then
    FOnLogError(aErrorCode);
end;


Constructor TFCThread.Create(asrcFtpDir, adstFtpDir, asrcFtpListSDirFile, adstAnsFTPDir, aFileMask : AnsiString; aSrcDir : AnsiString; aDstDir : AnsiString; aDelaySec : Integer; aMaxCountFiles: Integer; aWaitExclusive: Integer; aNeedCheckProvision: Boolean);
begin
  inherited Create(False);
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, fs);
  fs.ShortTimeFormat := cTimeFormat;
  fs.LongTimeFormat := cTimeFormat;
  FreeOnTerminate := false;
  //--
  FMoveFiles := TStringList.Create;
  FsrcFtpDir := aSrcFtpDir;
  FdstFtpDir := aDstFtpDir;
  FsrcFtpListSDirFile := asrcFtpListSDirFile;
  FdstAnsFTPDir := adstAnsFTPDir;
  FFileMask := aFileMask;
  FsrcDir := aSrcDir;
  FdstDir := aDstDir;
  AddSlashP(FsrcDir);
  AddSlashP(FdstDir);
  FDelaySec := aDelaySec;
  FMaxCountFiles := aMaxCountFiles;
  FWaitExclusive := aWaitExclusive;
  FNeedCheckProvision := aNeedCheckProvision;
  //--
end;



Destructor TFCThread.Destroy;
begin
  if Assigned(FMoveFiles) then FreeAndNil(FMoveFiles);
  inherited;
end;

procedure TFCThread.LoadFileName(aSrcDir: AnsiString);
var
  SearchRec : TSearchRec;
  h : integer;
  l_count : integer;
begin
  if DirectoryExists(aSrcDir) then
  begin
    AddSlashP(aSrcDir);
    // --- поиск файлов
    l_count := 0;
    if (FindFirst(aSrcDir + cAnyFile, faAnyFile, SearchRec) = 0) then
      begin
        repeat
          // --- если нашли текущий каталог или родительский то опускаем
          if not((SearchRec.Name = '.') or (SearchRec.Name = '..')) then
            begin
              // --- если нашли файл то
              if (SearchRec.Attr and faDirectory = 0) then
                begin
                  if WaitExclusive(aSrcDir + SearchRec.Name , h) then
                    begin
                      FMoveFiles.Add(aSrcDir + SearchRec.Name);
                      Inc(l_count);
                      FileClose(h);
                    end;
                end // --- если нашли каталог то продолжаем поиски в нем
              else
                begin
                  LoadFileName(aSrcDir + SearchRec.Name);
                end;
            end;
        until (FindNext(SearchRec) <> 0)or(FMaxCountFiles <= l_count);
        FindClose(SearchRec);
      end;
  end;
end;

function TFCThread.ProcessMoveFile(aFileName :AnsiString):boolean;
  var h: integer;
      l_sign: Integer;
      l_destdir: AnsiString;
      l_destFilename: AnsiString;
      l_destFilenameAns: AnsiString;
      //--
      l_customcode: AnsiString;
      l_datedoc: TDateTime;
      l_datebank: TDateTime;
      l_curcode: AnsiString;
      l_summa: Currency;
      l_typedoc: AnsiString;
      l_name_s: AnsiString;
      l_inn_s: AnsiString;
      l_kpp_s: AnsiString;
      l_cardnum: AnsiString;
      l_numdoc: AnsiString;
      l_id: AnsiString;
      l_flag: AnsiString;
      //--
      l_dbfans: TVKDBFNTX;
      l_importdate: TDateTime;
      //--
begin
  result := false;
  l_importdate := Now;
  try
    //--
    MainDataM.FileDbf.Close;
    MainDataM.FileDbf.DBFFileName := aFileName;
    MainDataM.FileDbf.Open;
    //--
    l_customcode := Trim(MainDataM.FileDbf.FieldByName('CUSTOMCODE').AsString);
    l_datedoc    := MainDataM.FileDbf.FieldByName('DATEDOC').AsDateTime;
    l_curcode    := Trim(MainDataM.FileDbf.FieldByName('CURCODE').AsString);
    l_summa      := MainDataM.FileDbf.FieldByName('SUMMA').AsCurrency;
    l_typedoc    := Trim(MainDataM.FileDbf.FieldByName('TYPEDOC').AsString);
    l_name_s     := Trim(MainDataM.FileDbf.FieldByName('NAME_S').AsString);
    l_inn_s      := Trim(MainDataM.FileDbf.FieldByName('INN_S').AsString);
    l_kpp_s      := Trim(MainDataM.FileDbf.FieldByName('KPP_S').AsString);
    l_cardnum    := Trim(MainDataM.FileDbf.FieldByName('CARDNUM').AsString);
    //--
    l_numdoc   := Trim(MainDataM.FileDbf.FieldByName('NUMDOC').AsString);
    l_datebank := MainDataM.FileDbf.FieldByName('DATEBANK').AsDateTime;
    l_id       := Trim(MainDataM.FileDbf.FieldByName('ID').AsString);
    l_flag     := Trim(MainDataM.FileDbf.FieldByName('FLAG').AsString);
    //--
    MainDataM.FileDbf.Close;
    if WaitExclusive(aFileName , h) then
      begin
        if (FNeedCheckProvision) then
          begin
            l_sign := MainDataM.CheckProvision(l_inn_s,l_kpp_s,l_summa);
          end
        else
          begin
            l_sign := 1;
          end;
        //--
          if DirectoryExists(FdstDir) then
            begin
              l_destdir := FdstDir + l_customcode;
              if  not(DirectoryExists(l_destdir)) then
                begin
                  CreateDir(l_destdir);
                end;
              AddSlashP(l_destdir);
              l_destFilename := l_destdir + ExtractFileName(aFileName);
              //--
              if not(l_sign > 0) then
                begin
                  l_destFilenameAns := ChangeFileExt(aFileName, '.ans');
                  //-- создание файла ответа
                  l_dbfans := GetDBFForExport(l_destFilenameAns, TKxxxxxx);
                  l_dbfans.AccessMode.OpenReadWrite := True;
                  l_dbfans.Open;
                  l_dbfans.FLock;
                  l_dbfans.BeginAddBuffered(cDbfBuffer);
                  l_dbfans.Append;
                  // --- заполнение файла ответа
                  l_dbfans['NUMDOC']     := l_numdoc;
                  l_dbfans['DATEDOC']    := l_datedoc;
                  l_dbfans['DATEBANK']   := l_datebank;
                  l_dbfans['CURCODE']    := l_curcode;
                  l_dbfans['SUMMA']      := l_summa;
                  l_dbfans['ID']         := l_id;
                  l_dbfans['CUSTOMCODE'] := l_customcode;
                  l_dbfans['CARDNUM']    := l_cardnum;
                  l_dbfans['NUMPOST']    := ExtractFileName(aFileName);
                  l_dbfans['FLAG']       := l_flag;
                  l_dbfans['DOCDATE']    := Trunc(l_importdate);
                  l_dbfans['DOCTIME']    := TimeToStr(l_importdate, fs);
                  l_dbfans['CODEERR']    := cTKInvalid;
                  l_dbfans['TEXTERR']    := ConvertAnsiToOem('Для перемещения отсутствует "Обеспечение"');
                  l_dbfans.Post;
                  l_dbfans.EndAddBuffered;
                  l_dbfans.UnLock;
                  l_dbfans.Close;
                  l_dbfans.Free;
                  //--
                end
              else
                begin
                  l_destFilenameAns := '';
                end;
              // --- если целевой файл существует то заменяем
              if FileExists(l_destFilename) then
                begin
                 DeleteFile(PChar(l_destFilename));
                end;
              Log(cMove + aFileName + cRightArrow + l_destFilename);
              FileClose(h);
              if not RenameFile(aFileName, l_destFilename) then
                begin
                  LogError(GetLastError);
                end
              else
                begin
                  if (l_destFilenameAns = '') then
                    begin
                      //-- обновление суммы не подтверждённых чеков для платёжной системы
                      MainDataM.provision_change_check_summ(l_inn_s,l_kpp_s,l_summa);
                      //-- перемещение файла
                      PutFileToFtp(l_destFilename,l_customcode);
                      //--
                      MainDataM.Session.Commit;
                    end
                  else
                    begin
                      //-- перемещение файла
                      PutFileToFtp(l_destFilenameAns,l_customcode);
                      RenameFile(l_destFilenameAns, ExtractFilePath(l_destFilename) + ExtractFileName(l_destFilenameAns));
                    end;
                  result := true;
                end;
            end
          else
            begin
              raise Exception.Create('Не удалось переместить файл т.к. для его перемещения не найдена директория - '+FdstDir+'!');
            end;
        //--
        FileClose(h);
      end
    else
      begin
        raise Exception.Create('Не удалось заблокировать файл для перемещения!');
      end;
  except
    on e:Exception do
      begin
        MainDataM.Session.Rollback;
        FileClose(h);
        Log(cError + 'при обработке файла("' + aFileName + '"):' + e.Message);
      end;
  end;
end;

end.

