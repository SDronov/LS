unit uBusiness;
interface
uses
 windows, Classes, SysUtils, Controls, Messages, DB, Masks, dateUtils,
 VKDBFDataSet, uCommon, uQueue, ExtCtrls;


type
 TFullFileList = TList;

 TBusinessState = (bsStarting);

 TBusiness = class
  private
   fBsState: TBusinessState;
   fHandle: THandle;
   fStop: boolean;
   fErrorMSG: string;
   fBusy: boolean;
   fLastClearDate: TDate;

   procedure createAnswers( const aSrvIdx: integer );
   function createAdvice_ANS(const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;

   function createCashFlowNotify( const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;
   function createCashFlowNotify_ANS( const aFileREQ: TFileName; const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;

   procedure fromDownloadToArch(const aEntry: PFileInfoEntry);
   procedure moveToErrorFilesDIR(const aEntry: PFileInfoEntry);
   procedure clearArchives(idx: integer);
   procedure clearOldLogs;

  protected
   procedure validateDirs;

  public
   procedure restart;
   function queriesExecuted: boolean;

   procedure Main;
   procedure Run;
   procedure Stop;

   constructor Create(const aHandle: THandle);
   destructor destroy; override;

  public
   property State: TBusinessState read fBsState write fBsState;
   property Busy: boolean read fBusy;
   property Stopped: boolean read fStop;
 end;

var
 Business: TBusiness;

implementation

uses uOptions, uLoger, dmData, uExport, uExpAOANS, uExpPUANS, uZip, uDMFTP;

{ TBusiness }

 procedure internalFilesClear( aFileMask: string );
  var
  n: TDate;
  sr: TSearchRec;
  filePath, fileName: TFileName;
 begin
  if (options.ArchivePeriod = 0) then
    exit;
  n:= trunc( now );
  filePath:= includeTrailingPathDelimiter( extractFilePath(aFileMask) );
  if ( 0 = findFirst( aFileMask, faAnyFile, sr ) ) then
   repeat
    if ( options.ArchivePeriod <= daysBetween( trunc( FileDateToDateTime( sr.Time ) ), n ) ) then begin
     fileName:= filePath + sr.Name;
     fileSetReadOnly( fileName, false );
     if SysUtils.deleteFile(  fileName ) then
       uLoger.Log( format( 'Удалён в связи с истечением длительности хранения: %s ', [ fileName ] ) );
    end;
   until ( 0 <> findNext( sr ) );
 end;


procedure TBusiness.clearOldLogs;
var
 logMask: TFileName;
 fNme, fExt: string;
 p: integer;
begin
 if (not assigned(options)) or ( '' = options.LogFile ) {or ( currentLogFile = '' )} then
   exit;
 logMask:= includeTrailingPathDelimiter( extractFilePath(currentLogFile) );
 fExt:= extractFileExt(options.LogFile);
 fNme:= extractFileName( options.LogFile );
 p:= pos( fExt, fNme ) - 1;
 if (p > 0) then
   fNme:= copy( fNme, 1, p ) ; // + '*' +
 logMask:= logMask + fNme + '*' + fExt;
 internalFilesClear(logMask);
end;

procedure TBusiness.clearArchives(idx: integer);
var FM: TFileName;
begin

 with Options.ServiceOptions[idx] do
   FM:= Dir_Error + fileMask;
 internalFilesClear(FM);

 with Options.ServiceOptions[idx] do
   FM:= Dir_Error + answerMask;
 internalFilesClear(FM);

 with Options.ServiceOptions[idx] do
  FM:= Dir_DownLoad_Arch + fileMask;
 internalFilesClear(FM);

 with Options.ServiceOptions[idx] do
   FM:= Dir_Answer_Arch + answerMask;
 internalFilesClear(FM);

end;

procedure TBusiness.validateDirs;
var
i: integer;
begin
 for i:= 0 to Options.ServiceCount-1 do begin
  checkDirectory( Options.ServiceOptions[i].Dir_Answer );
  if (Options.ServiceOptions[i].DelAfterImport = 2) then
     checkDirectory( Options.ServiceOptions[i].Dir_Answer_Arch );
  checkDirectory( Options.ServiceOptions[i].Dir_Error );
 end;
end;

procedure TBusiness.Main;
var
 b: boolean;
 i: integer;
 logCleared: boolean;
begin
{$ifdef EXHOSTING}
 dbgLog( 'TBusiness.Main' );
{$endif}
 if uLoger.maxLogSizeExided then
   createNewLog;

 logCleared:= false;
 for i:= 0 to Queue_List.Count - 1 do
  if (options.ArchivePeriod <> 0) and ((0 = fLastClearDate) or ( 1 <= daysBetween( trunc(now), fLastClearDate ) ) ) then begin
    clearArchives(i);
    if( not logCleared ) then begin
      clearOldLogs;
      logCleared:= true;
    end;
    fLastClearDate:= trunc(Now);
  end;

 DMFTP.startDownload;
 exit;

 b:= false;
{$ifdef EXHOSTING}
 dbgLog( 'Начало обработки очередей запросов.' );
 dbgLog( 'Элементов в очереди: ' + intToStr(Queue_List.Count) );
{$endif}

 for i:= 0 to Queue_List.Count - 1 do
  if( PQueueListEntry(Queue_List[i])^.UploadQueue.Count <> 0 )then
    b:= true;
 if b then begin
{$ifdef EXHOSTING}
  dbgLog( 'В очередях есть неотправленые файлы' );
{$endif}
  DMFTP.startUpload;
 end
 else begin
  DMFTP.startDownload;
 end;
 
end;


function TBusiness.queriesExecuted: boolean;
var i: integer;
begin
 result:= false;
 if (fStop) then
   exit;
 fBusy:= True;
 for i:= 0 to Queue_List.Count - 1 do
  if( PQueueListEntry(Queue_List[i])^.DownloadQueue.Count <> 0 )then begin
    uLoger.Log(' ');
    uLoger.Log( Format('Сервис: %s. Обработка запросов.', [Options.ServiceOptions[i].ServiceName ]) );
    createAnswers( i );
    result:= true;
  end;
 fBusy:= false;// данные из входной очереди обрабатываем и помещаем в выходную
end;


procedure TBusiness.restart;
var
 i: integer;
 b: boolean;
begin
 RecreateQueue_List;

 if( not assigned(DMFTP) )then
   DMFTP:= TDMFTP.Create(fHandle);

 DMFTP.recreateFTP_List;

 b:= false;

 if( not downQsAreEmpty )then
   queriesExecuted;

 if (not upQsAreEmpty) then
    DMFTP.startUpload // - отправить неотправленые
 else
   postMessage(fHandle, MSG_After_Startup, 0, 0 );
 Run;
end;


procedure TBusiness.Run;
begin
 fStop:= false;
end;

procedure TBusiness.Stop;
begin
 fStop:= true;
end;

const
 mskZIP = 'LS*.REQ.ZIP';
 mskREQ = 'TK*.REQ';

procedure TBusiness.createAnswers( const aSrvIdx: integer );
var
 loaded, misLoaded: integer;
 e: PFileInfoEntry;
 mask: string;
 Q_Down, Q_Up: TFileQueue;
begin
 loaded:=0; misLoaded:=0;
 mask := Options.ServiceOptions[aSrvIdx].FileMask;
 Q_Down:= PQueueListEntry(Queue_List[aSrvIdx])^.DownloadQueue;
 Q_Up:= PQueueListEntry(Queue_List[aSrvIdx])^.UploadQueue;

 while (not fStop)and(Q_Down.count > 0) do begin
  if (not DM.Connected) and (DM.ErrMSG = '')and (not DM.openSession(Options) ) then
  begin
   uLoger.Log(DM.ErrMSG, leError);
   break;
  end;

  e:= Q_Down.getAndDelete0;
  if matchesMask( extractFileName(e^.FileName), mskREQ )  then
   if createAdvice_ANS( e, Q_Up ) then // создаем ответ и помещаем в выходную очередь Q_Up
    inc(loaded)
    else inc(misloaded)
  else
   if matchesMask( extractFileName(e^.FileName), mskZIP ) then
    if createCashFlowNotify( e, Q_Up ) then  // создаем ответ и помещаем в выходную очередь Q_Up
     inc(loaded)
     else inc(misloaded);

 end;

 if DM.Connected then begin
   DM.closeSession;
   if (DM.ErrMSG <>'') then
    uLoger.Log(DM.ErrMSG, leError);
 end;

 if ( misloaded = 0 ) then
  uLoger.Log( Format('Сервис: %s. Файлов обработано всего: %d ', [Options.ServiceOptions[aSrvIdx].ServiceName, loaded]) )
 else
  uLoger.Log( Format('Сервис: %s. Файлов обработано всего: %d;  с ошибками: %d ', [Options.ServiceOptions[aSrvIdx].ServiceName, loaded + misloaded, misloaded ]) );

end;

function TBusiness.createAdvice_ANS(const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;
// TRUE - при успешной загрузке файла из aEntry
var
 dbfAns, dbfReq: TVKDBFNTX;
 impDT: TDateTime;
 s: string;
 fileName, fileANS: TFileName;
begin
 result := true;
 fileName:= extractFileName(aEntry^.FileName);
 fileANS:= Options.ServiceOptions[aEntry^.serviceIndex].Dir_Answer + changeFileExt( fileName, '.ans' );

 dbfAns:= getDBFForExport( fileANS, cTK_ANS  );
 dbfAns.AccessMode.OpenReadWrite := True;
 dbfAns.Open;
 dbfAns.FLock;
 dbfAns.BeginAddBuffered(cDbfBuffer);
 dbfAns.Append;

 dbfReq:= TVKDBFNTX.Create(nil);
 try
 try
 // --- открываем исходный файл, для того, чтобы проверить NULL поля
   dbfReq.DBFFileName := aEntry^.FileName;
   dbfReq.AccessMode.OpenRead := True;
   dbfReq.Open;
   dbfReq.First;
 // --- копирование полей
   impDT:= Now;
   dbfAns['NUMDOC']     := dbfReq['NUMDOC'];
   dbfAns['DATEDOC']    := dbfReq['DATEDOC'];
   dbfAns['DATEBANK']   := dbfReq['DATEBANK'];
   dbfAns['CURCODE']    := dbfReq['CURCODE'];
   dbfAns['SUMMA']      := dbfReq['SUMMA'];
   dbfAns['ID']         := dbfReq['ID'];
   dbfAns['CUSTOMCODE'] := dbfReq['CUSTOMCODE'];
   dbfAns['CARDNUM']    := dbfReq['CARDNUM'];
   dbfAns['NUMPOST']    := ExtractFileName(dbfReq.DBFFileName);
   dbfAns['FLAG']       := dbfReq['FLAG'];
   dbfAns['DOCDATE']    := Trunc(impDT);
   dbfAns['DOCTIME']    := TimeToStr( impDT, Formats );
   dbfAns['CODEERR']    := 0;
   dbfAns['TEXTERR']    := '';
 except
   on e:exception do begin
     result:= false;
     if(pos(cNotDBF, e.Message) <> 0) then
       e.Message := 'файл не является DBF-файлом';
     fErrorMSG:= Format( 'Файл  %s  ошибка чтения: %s' , [fileName, e.Message] );
     dbfAns['CODEERR'] := cTKInvalid;
     dbfAns['TEXTERR'] := e.Message;
   end;{ on exception..}
 end; {except}
 finally
   if dbfReq.Active then dbfReq.Close;
   freeAndNil(dbfReq);
 end;

 if result then begin
 // --- импорт
   s:= DM.REQ_Ans(aEntry^.FileName);
   result := (s <> '') and (pos('ПП: 0', s ) <> 0); // -- Признак успешной загрузки
   if (not result) then begin  // при неуспешной загрузке:
     fErrorMSG:= Format('Файл  %s. Ошибка загрузки. Код: %d. Описание: %s ', [fileName, DM.ErrCode, DM.ErrMSG ]);
     (*if (DM.ErrCode = cTKDup) then dbfAns['TEXTERR'] := 'Чек с таким ID транзакции уже существует'  else *)
     dbfAns['CODEERR'] := DM.ErrCode;
     dbfAns['TEXTERR'] := DM.ErrMSG;
   end;
 end;{ if Result .. }

//  finally
 dbfAns.Post;
 dbfAns.EndAddBuffered;
 dbfAns.UnLock;
 dbfAns.Close;
 dbfAns.Free;

 if (not result) then begin
   uLoger.Log(Format('Файл %s. Ошибка при обработке', [fileName]), leWarn );
   moveToErrorFilesDIR( aEntry );
 end
 else begin
   uLoger.Log(Format('Файл %s успешно обработан', [fileName]) );
   fromDownloadToArch(aEntry);
 end;
 aEntry^.FileName:= fileANS;
 aQ_Up.Add(aEntry);
end;


procedure TBusiness.fromDownloadToArch(const aEntry: PFileInfoEntry);
var fileName, fileArch: TFileName;
begin
 // moveFile  перемещает входящий файл из Dir_DownLoad в Dir_DownLoad_Arch:
 fileName:= extractFileName(aEntry^.FileName);
 fileArch:= extractFileName( moveFile( aEntry^.FileName, Options.ServiceOptions[aEntry^.serviceIndex].Dir_DownLoad_Arch ) );
 if ( 0 <> compareText( fileArch, fileName )) then begin
   uLoger.Log( Format('Входящий файл %s сохранен под именем %s в каталоге %s ',
      [ fileName, fileArch, Options.ServiceOptions[aEntry^.serviceIndex].Dir_DownLoad_Arch ] ) );
    // Архивному файлу установим атрибут ReadOnly
    fileSetReadOnly(Options.ServiceOptions[aEntry^.serviceIndex].Dir_DownLoad_Arch + fileArch, true );
 end;
end;


procedure TBusiness.moveToErrorFilesDIR( const aEntry: PFileInfoEntry );
var fileName, fileErr: TFileName;
begin
 fileName:= extractFileName(aEntry^.FileName);
 fileErr:= extractFileName( uCommon.moveFile( aEntry^.FileName, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ) );
 if ( fErrorMSG <> '' ) then
   uLoger.Log( fErrorMSG, leError );
 if ( 0 = compareText( fileErr, fileName )) then
   uLoger.Log( Format('Содержащий ошибочные данные файл %s сохранен в каталоге %s ',
      [ fileName, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ] ) )
 else
   uLoger.Log( Format('Содержащий ошибочные данные файл %s сохранен под именем %s в каталоге %s ',
      [ fileName, fileErr, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ] ) );
end;


function TBusiness.createCashFlowNotify( const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;
const mask = 'LS*.REQ';
var
 sl: TStrings;
 fileREQ: TFileName;
begin
 result:= false;
 sl:= nil;
 try
  dmZIP.ZIP2files( aEntry^.FileName, Options.serviceOptions[aEntry^.serviceIndex].Dir_DownLoad, sl, mask );
 except
  uLoger.Log(Format('Ошибка при распаковке ZIP-файла %s',[extractFileName(aEntry^.FileName)]));
  if assigned(sl) then freeAndNil(sl);
  exit;
 end;

 if (assigned(sl) and (sl.Count > 0)) then begin
   fileREQ:= Options.serviceOptions[aEntry^.serviceIndex].Dir_DownLoad + sl[0];
   if fileExists(fileREQ)
     and createCashFlowNotify_ANS(fileREQ,  aEntry, aQ_Up )
   then
     result:= true;
 end;
 if assigned(sl) then
  freeAndNil(sl);
end;


procedure toCyrilic(var aStr: string);
const
 latA='A'; latO='O'; latT='T'; latK='K';
 cyrA='А'; cyrO='О'; cyrT='Т'; cyrK='К';
var
 i: integer;
begin
 aStr:= AnsiUpperCase(aStr);
 for i:= 0 to length(aStr)-1 do
  case aStr[i] of
   latA: aStr[i]:= cyrA;
   latO: aStr[i]:= cyrO;
  end;
end;


function TBusiness.createCashFlowNotify_ANS( const aFileREQ: TFileName; const aEntry: PFileInfoEntry; const aQ_Up: TFileQueue ): boolean;

procedure RenamePackDeleteQueue(aANS_File: TFileName);
var
 zipFile, newName: TFileName;
begin
 try
  zipFile:= aANS_File + '.zip' ;
  dmZIP.file2ZIP( aANS_File, zipFile );
  fromDownloadToArch( aEntry );   // перебросили из DIR_Download в DIR_Download_Arch
  if fileExists( zipFile ) then begin
    aEntry^.FileName:= zipFile;
    aQ_Up.Add( aEntry );   // -- Поставили в очередь на отправку
  end;
 finally
  if (not fileExists( zipFile )) then
    uLoger.Log( 'Ошибка при создании zip - файл ответа для запроса ' + extractFileName( aEntry^.FileName ), leError );
  deleteFile( aANS_File ); // .ans
  deleteFile( aFileREQ );
  newName:= changeFileExt(aFileREQ, ''); // из ls*.req -> ls*
  deleteFile( newName + '.sig1');
  deleteFile( newName + '.sig2');
 end;
end;

var
 ds: TDataSet;
 _Name, _Path, _dbf : TFileName;
 dbfReq: TVKDBFNTX;
 ans: TAnswerRec;

begin
 result:= true;
 clearAnswerRec(ans);
 _Name:= extractFileName( aFileREQ );
 _Path:= extractFilePath( aFileREQ );

 _dbf:= Options.ServiceOptions[aEntry^.serviceIndex].Dir_Answer + changeFileExt( _Name, '.ans' );

 dbfReq:= TVKDBFNTX.Create(nil);
 try
  try
   dbfReq.OEM := True;
   dbfReq.DBFFileName := aFileREQ;
   dbfReq.AccessMode.OpenRead := True;
   dbfReq.Open;
   dbfReq.First;
// --- копирование полей
   ans.NUMPOST := extractFileName(aEntry^.FileName);

   ans.CUSTOMCODE:= Trim(dbfReq['CUSTOMCODE']);
   ans.INN_D:= Trim(dbfReq['INN_D']);
   ans.KPP_D:= Trim(dbfReq['KPP_D']);
   ans.BEGIN_DATE:= dbfReq['BEGIN_DATE'];
   ans.END_DATE:= dbfReq['END_DATE'];
   ans.TYPEDOC:= Trim(dbfReq['TYPEDOC']);
   toCyrilic( ans.TYPEDOC );
   ans.REPEAT_ := Trim(dbfReq['REPEAT']);
   ans.FLAG := Trim(dbfReq['FLAG']);
//   raise Exception.Create('Testing Exception on dbfReq loading'); { TODO : Удалить тестовое исключение после отладки }
  except on e: exception do begin
   result:= false;
   fErrorMSG := e.Message;
   if (pos(cNotDBF, e.Message) <> 0) then
     fErrorMSG := 'Ошибка получения данных из файла '+ _Name;

   ans.CODEERR := IntToStr(cTKInvalid);
   ans.TEXTERR := fErrorMSG;
   
   createAnswDBF_PU(_dbf, nil, ans );
  end; end;
 finally
   if dbfReq.Active then
     dbfReq.Close;
   freeAndNil(dbfReq);
 end;

 try
 fErrorMSG := '';
 if (result) then begin
  ds:= nil;
  if (ans.TYPEDOC ='ПУ') then
   ds:= DM.Answer_PU( ans.CUSTOMCODE, ans.INN_D, ans.KPP_D, ans.BEGIN_DATE, ans.END_DATE )
    else
     if (ans.TYPEDOC='АО') then
      ds:= DM.Answer_AO( ans.CUSTOMCODE, ans.INN_D, ans.KPP_D, ans.BEGIN_DATE, ans.END_DATE );

  if (not assigned(ds)) then begin
   result:= false;
   fErrorMSG:= fErrorMSG + Format(' Файл: %s. Данных по запросу не найдено',[extractFileName(aEntry^.FileName)] );
   ans.CODEERR := IntToStr(cTKDup);
   ans.TEXTERR := fErrorMSG;
   createAnswDBF_PU(_dbf, nil, ans )
  end
  else
   if (ans.TYPEDOC ='ПУ') then
    createAnswDBF_PU(_dbf, ds, ans )
     else
      if (ans.TYPEDOC='АО') then
       createAnswDBF_AO(_dbf, ds, ans );

 end; {if (result).. }
 finally
  if (not result) then
    moveToErrorFilesDIR( aEntry );
  RenamePackDeleteQueue(_dbf );
 end; 
end; { function createCashFlowNotify_ANS }

constructor TBusiness.Create(const aHandle: THandle);
begin
 inherited Create;
 fStop:= false;
 fHandle:= aHandle;
end;

destructor TBusiness.destroy;
begin
 inherited;
end;

end.

