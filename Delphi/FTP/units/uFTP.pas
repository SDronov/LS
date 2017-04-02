unit uFTP;
interface
uses
  Windows, Forms, Classes, SysUtils,  IniFiles, Masks, ExtCtrls,
  IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdGlobal,
  uCommon, uQueue;

type
  TFTP = class(TIdFTP)
  private
    fTimer: TTimer;
    fErrorList: TStringList;
    fLastErrMsg: string;
    fServiceIndex: integer;
    fQueue: TFileQueue;
    fThread: TThread;
    fInternal_Stream: TStream;
    procedure timerTimer(Sender: TObject);
    function  GetErrorMsg(e : exception) : string;
    function  DeleteFtpFile(aFtpFileName: string): boolean;
    procedure setOptionIndex(aIndex: integer);
    function getDelFtpFiles: boolean;
    function getDir_Answers: string;
    function getDir_DownLoad: string;
    function getDir_DownLoad_Arch: string;
    function getFileMask: string;
    function getFtpDir_Dest: string;
    function getFtpDir_Source: string;
    function getOverWriteExists: boolean;
    function getFtpTimeOut: integer;

    procedure fileToQueue(const aFileName: TFileName; const aFileDateTime: TDateTime);

    function getHostPort(isProxy : boolean = False) : string;
    procedure fromAnswerToArch(const aEntry: PFileInfoEntry);

  protected
    function  doConnect : boolean;
    function  Upload(e: PFileInfoEntry): boolean;
    procedure DownLoad;

  public
    procedure afterConstruction;   override;
    procedure beforeDestruction;   override;

    procedure tryDownLoad(aHandle: THandle);
    procedure tryUpload(aHandle: THandle);

    function execConnect_D: boolean;
    function execConnect_U: boolean;

    procedure execUpload;
    procedure execDownLoad;

    property  serviceIndex: integer read fServiceIndex write setOptionIndex;
    property  Queue: TFileQueue read fQueue write fQueue;

    property Dir_DownLoad:  string read getDir_DownLoad;
    property Dir_DownLoad_Arch: string read getDir_DownLoad_Arch;

    property Dir_Answers  : string read getDir_Answers;

    property FtpDir_Source : string read getFtpDir_Source;
    property FtpDir_Dest   : string read getFtpDir_Dest;

    property FileMask        : string  read getFileMask;
    property OverWriteExists : boolean read getOverWriteExists;
    property DelFtpFiles     : boolean read getDelFtpFiles;
    property FtpTimeOut     : integer read getFtpTimeOut;

  public

  end;


implementation
uses
 uOptions, uLoger,  ShellApi, uZip , uWatchDog;

type
 TExch  = class(TThread)
 private
  fFTP: TFTP;
  fHandle: THandle;
  function internExchName: string;
 public
  constructor Create( aHandle: THandle; aFTP: TFTP ); reintroduce;
  destructor Destroy; override;
 end;

 function TExch.internExchName: string;
 begin
  result := '??';
  if ClassNameIs('TDownloader') then
   result := 'загрузка'
   else if ClassNameIs('TUploader') then
      result := 'отправка'
 end;

 destructor TExch.Destroy;
 begin
   if assigned(fFTP) then begin
     fFTP.fThread := nil;
          {$ifdef EXHOSTING}
           dbgLog( format('Поток ликвидирован. Напрвление: %s, Индекс сервиса: %d ', [internExchName, fFtp.fServiceIndex]) );
          {$endif}
   end;
   inherited;
 end;

 constructor TExch.Create( aHandle: THandle; aFTP: TFTP );
 begin
  inherited Create(false);
  fHandle:= aHandle;
  fFTP:= aFTP;
  freeOnTerminate:= true;
          {$ifdef EXHOSTING}
          dbgLog( format('Поток создан. Напрвление: %s, Индекс сервиса: %d ', [internExchName, fFtp.fServiceIndex]) );
          {$endif}
 end;

type
 TDownloader = class(TExch)
 public
  procedure Execute; override;
 end;

 procedure TDownloader.Execute;
 begin
            {$ifdef EXHOSTING}
             dbgLog('Downloader.Execute.1 Поток загрузки запущен');
            {$endif}
  fFTP.fTimer.Interval:= 1000 * fFTP.ftpTimeOut;
            {$ifdef EXHOSTING}
            dbgLog( format( 'Downloader.Execute.2 Интервал таймера: %d', [fFTP.fTimer.Interval]) );
            {$endif}
  fFTP.fTimer.Enabled:= true;
            {$ifdef EXHOSTING}
            if fFTP.fTimer.Enabled then
              dbgLog('Downloader.Execute.3 Таймер взведен')
            else
              dbgLog('Downloader.Execute.4 !!Таймер НЕ взведен!!');
            dbgLog('Downloader.Execute.5 Начало загрузки');
            {$endif}
  if fFTP.execConnect_D then begin
            {$ifdef EXHOSTING}
            dbgLog('Downloader.Execute.6 Соединено');
            {$endif}
    fFTP.execDownload;
  end;
            {$ifdef EXHOSTING}
            dbgLog('Downloader.Execute.7 Загрузка завершена');
            {$endif}
  fFTP.fTimer.Enabled:= false;
            {$ifdef EXHOSTING}
              if not fFTP.fTimer.Enabled then
                dbgLog('Downloader.Execute.8 Таймер остановлен')
              else
                dbgLog('Downloader.Execute.9 !!Таймер НЕ остановлен!!');
            {$endif}
  windows.postMessage( fHandle, msg_ExchComplete, 0, 0 );
            {$ifdef EXHOSTING}
            dbgLog('Downloader.Execute.10 Уведомление о завершении потока загрузки передано');
            dbgLog('Downloader.Execute.11 Поток загрузки завершен');
            {$endif}
 end;


type
 TUploader = class(TExch)
 public
  procedure Execute; override;
 end;

 procedure TUploader.Execute;
 begin
              {$ifdef EXHOSTING}
              dbgLog('Uploader.Execute.1 - Поток выгрузки запущен');
              {$endif}
  fFTP.fTimer.Interval:= 1000 * fFTP.ftpTimeOut;
              {$ifdef EXHOSTING}
              dbgLog( format( 'Uploader.Execute.2 Интервал таймера: %d', [fFTP.fTimer.Interval]) );
              {$endif}
  fFTP.fTimer.Enabled:= true;
              {$ifdef EXHOSTING}
                if fFTP.fTimer.Enabled then
                  dbgLog('Uploader.Execute.3 Таймер взведен')
                else
                  dbgLog('Uploader.Execute.4 !!Таймер НЕ взведен!!');
                dbgLog('Uploader.Execute.5 Начало выгрузки');
              {$endif}

  if fFTP.execConnect_U then begin
    fFTP.execUpload;
    if fFTP.connected then begin
              {$ifdef EXHOSTING}
              dbgLog('Uploader.Execute.6 Производится отсоединение');
              {$endif}
      fFTP.disconnect;
              {$ifdef EXHOSTING}
              dbgLog('Uploader.Execute.7 Отсоединено');
              {$endif}
    end;
  end;
              {$ifdef EXHOSTING}
              dbgLog('Uploader.Execute.8 Выгрузка завершена');
              {$endif}
  fFTP.fTimer.Enabled:= false;
              {$ifdef EXHOSTING}
              if not fFTP.fTimer.Enabled then
                dbgLog('Uploader.Execute.9 Таймер остановлен')
              else
                dbgLog('Uploader.Execute.10 !!Таймер НЕ остановлен!!');
              {$endif}
  windows.postMessage( fHandle, msg_ExchComplete, 0, 0 );
              {$ifdef EXHOSTING}
              dbgLog('Uploader.Execute.11 Уведомление о завершении потока выгрузки передано');
              dbgLog('Uploader.Execute.12 Завершено');
              {$endif}
 end;

procedure TFTP.tryDownLoad(aHandle: THandle);
begin
              {$ifdef EXHOSTING}
               dbgLog('tryDownLoad.1 Запуск');
              {$endif}
 fThread:= TDownloader.Create(aHandle, self);
              {$ifdef EXHOSTING}
               dbgLog('tryDownLoad.2 Завершено');
              {$endif}
end;


procedure TFTP.tryUpload(aHandle: THandle);
begin
              {$ifdef EXHOSTING}
               dbgLog('tryUpload.1 Запуск');
              {$endif}
 if (PQueueListEntry(Queue_List[serviceIndex])^.uploadQueue.Count > 0) then begin
   uLoger.Log( Options.ServiceOptions[serviceIndex].ServiceName + ' Отправка ответов'  );

   fThread:= TUploader.Create(aHandle, self);
              {$ifdef EXHOSTING}
               dbgLog('tryUpload.2 Поток выгрузки создан');
              {$endif}
 end
 else begin
   windows.PostMessage(aHandle, msg_ExchComplete, 0, 0 );
              {$ifdef EXHOSTING}
              dbgLog('tryUpload.3 Сообщение о пустой очереди на выгрузку отослано');
              {$endif}
 end;
              {$ifdef EXHOSTING}
              dbgLog('tryUpload.4 Завершено');
              {$endif}
end;

procedure cheqQueues_Zip_Answers( aDown_FTP, aUp_FTP: TFTP );
var
 i: integer;
 qDown, qUP: TFileQueue;
 s: string;
 e: PFileInfoEntry;
 sl: TStrings;
begin
 sl:= nil;
 checkDirectory( Options.ServiceOptions[aUP_FTP.fServiceIndex].Dir_Answer );

 qUp:= aUP_FTP.fQueue;
 qDown:= aDown_FTP.fQueue;
 while (qDown.Count > 0 ) do begin
  e:= qDown.getAndDelete0;
  if (e^.serviceIndex=0) then begin
   s:= Options.ServiceOptions[e^.serviceIndex].Dir_Answer + extractFileName(e^.FileName) + '.zip';
   dmZIP.file2ZIP(e^.FileName,  s );
   deleteFile(e^.FileName);
   e^.FileName:= s;
   qUP.Add(e);
  end
   else
    if (e^.serviceIndex=1) then begin
     try
       s:= e^.FileName;
       dmZIP.ZIP2files( e^.FileName, Options.ServiceOptions[e^.serviceIndex].Dir_Answer, sl );
       if (sl.Count <> 1) then begin
         for i:= 0 to sl.Count-1 do
           deleteFile(Options.ServiceOptions[e^.serviceIndex].Dir_Answer + sl[i]);
         dispose(e); //
         sysUtils.abort;
       end;
       e^.FileName:= Options.ServiceOptions[e^.serviceIndex].Dir_Answer + sl[0];
       qUP.Add(e);
     finally
       deleteFile(s);
     end;
    end;{ if (e^.serviceIndex=1).. }

 end;{while  while (qDown.Count > 0 ) }
end;

{ TFTP }
(*
procedure TBusiness.moveToErrorFilesDIR( const aEntry: PFileInfoEntry );
var fileName, fileErr: TFileName;
begin
 fileName:= extractFileName(aEntry^.FileName);
 fileErr:= extractFileName( uCommon.moveFile( aEntry^.FileName, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ) );
 if ( fErrorMSG <> '' ) then
   uLoger.Log( fErrorMSG, leError );
 if ( 0 = compareText( fileErr, fileName )) then
   uLoger.Log( Format('Содержащий ошибки файл %s сохранен в каталоге %s ',
      [ fileName, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ] ) )
 else
   uLoger.Log( Format('Содержащий ошибки файл %s сохранен под именем %s в каталоге %s ',
      [ fileName, fileErr, Options.ServiceOptions[aEntry^.serviceIndex].Dir_Error ] ) );
end; *)

procedure TFTP.fromAnswerToArch(const aEntry: PFileInfoEntry);
var fileName, fileArch: TFileName;
begin
 // moveFile  перемещает входящий файл из Dir_DownLoad в Dir_DownLoad_Arch:
 fileName:= extractFileName(aEntry^.FileName);
 with Options.ServiceOptions[aEntry^.serviceIndex] do begin
  fileArch:= extractFileName( moveFile( aEntry^.FileName, Dir_Answer_Arch ) );
  if ( 0 <> compareText( fileArch, fileName )) then begin
   uLoger.Log( Format('Копия выгружаемого файла %s сохранена под именем %s в каталоге %s ', [ fileName, fileArch, Dir_Answer_Arch ] ) );
   // Архивному файлу установим атрибут ReadOnly
   fileSetReadOnly(Dir_Answer_Arch + fileArch, true );
  end;
 end;
end;

function TFTP.execConnect_U: boolean;
begin
 result:= false;
 uLoger.Log(' ');
                {$ifdef EXHOSTING}
                 dbgLog( 'execConnect_U - запуск' );
                 dbgLog( 'Соединение с FTP сервером '+ Options.ServiceOptions[fServiceIndex].FTP_Host + ' для отправки данных..' );
                {$endif}

 if (not Connected) and (not doConnect) then begin
  uLoger.Log( 'Нет соединения с FTP сервером '+ Options.ServiceOptions[fServiceIndex].FTP_Host, leError );
                {$ifdef EXHOSTING}
                  dbgLog( 'execConnect_U - Нештатное завершение' );
                {$endif}
  exit;
 end;
                {$ifdef EXHOSTING}
                 dbgLog( 'Соединен с FTP сервером '+ Options.ServiceOptions[fServiceIndex].FTP_Host + ' для отправки данных' );
                {$endif}

 try
  if( FtpDir_Dest <> '' )then begin
                {$ifdef EXHOSTING}
                  dbgLog( 'смена директории... на ' + FtpDir_Dest );
                {$endif}
    ChangeDir(FtpDir_Dest);
                {$ifdef EXHOSTING}
                 dbgLog( 'смена директории - успешно' );
                {$endif}
  end;
  result:= true;
 except
   on ex: exception  do begin
     fLastErrMsg:= GetErrorMsg(ex);
     uLoger.Log( Format('Сервер %s. Не возможно установить каталог выгрузки %s.  Детали: %s', [getHostPort, FtpDir_Dest, fLastErrMsg ]), leWarn );
                  {$ifdef EXHOSTING}
                   dbgLog( 'аварийное отсоединение...' );
                  {$endif}
     if connected then
       disconnect;

                    {$ifdef EXHOSTING}
                     dbgLog( 'аварийное отсоединение - произведено' );
                     dbgLog( 'execConnect_U - Нештатное завершение' );
                    {$endif}
   //uLoger.Log( 'Попытка выгрузки в корневой каталог FTP - сервера '+ getHostPort );
   end;
 end;
                    {$ifdef EXHOSTING}
                     dbgLog( 'execConnect_U - штатное завершение' );
                    {$endif}
end;

procedure TFTP.execUpload;
var
 j, k : integer;
 e: PFileInfoEntry;
 Q: TFileQueue;
begin
                    {$ifdef EXHOSTING}
                     dbgLog( 'execUpload.1 - запуск' );
                    {$endif}
 Q:= PQueueListEntry(Queue_List[serviceIndex])^.UploadQueue;
 k:= Q.Count;
 if ( k = 0 )  then begin
                    {$ifdef EXHOSTING}
                     dbgLog( 'В очереди на отправку нет файлов. execUpload.2 - завершение' );
                    {$endif}
   exit;
 end;

 j:= 0;
 repeat
  e:= Q.get0;
  // проверка существует ли извлеченный из очереди для отправки элемент
  if (not fileExists(e^.FileName)) then begin
   Q.clear0;
   uLoger.Log(Format('Попытка отправить через FTP - соединение несуществующий файл %s из каталога %s ', [extractFileName(e^.FileName), extractFileDir(e^.FileName)] ), leWarn );
   continue;
  end;
  // Отправка файла ответа
                    {$ifdef EXHOSTING}
                    dbgLog( 'execUpload.3 - Отправка файла ответа...' );
                    {$endif}
  if upload(e) then begin
   inc(j);
    with Options.ServiceOptions[e^.serviceIndex] do
    if (1 <> DelAfterExport) then begin
      fromAnswerToArch( e );
                    {$ifdef EXHOSTING}
                    dbgLog( 'execUpload.4 - файл ответа скопирован в архив' );
                    {$endif}
    end
    else begin
      deleteFile ( e^.FileName );
                    {$ifdef EXHOSTING}
                    dbgLog( 'execUpload.5 - файл ответа удалён' );
                    {$endif}
    end;
  end { if upload(e) }
  else begin
    // Возможные причины ошибки при upload: 1)такой файл уже существует на сервере или нет прав доступа, 2)нет связи с ФТП сервером
    //  если такой файл уже существует, переносим в архив здесь:

    uLoger.Log(Format('Ошибка при отправке файла ответа %s  на FTP: %s', [ extractFileName( e^.FileName), fLastErrMsg]), leWarn);
    fromAnswerToArch( e );
    { TODO : если нет связи с ФТП сервером, надо оставить файл в каталоге и в очереди на отправку и прекратиь обмен}
  end;
  Q.clear0;
 until ( Q.Count = 0 );

                      {$ifdef EXHOSTING}
                       dbgLog( 'execUpload.6 - все файлы ответ отправлены' );
                       dbgLog( 'execUpload.6 - попытка отсоединения..' );
                      {$endif}

 if connected then
   disconnect;

 uLoger.Log( Format(' Отсоединен от %s ', [GetHostPort])  );
 if (j <> k) then
   uLoger.Log( Format('На сервер %s отправлено файлов: %s из: %s.', [GetHostPort, intToStr(j), intToStr(k) ]) )
 else
   uLoger.Log( Format('На сервер %s отправлено файлов: %s.', [GetHostPort, intToStr(j)] ) );

                      {$ifdef EXHOSTING}
                      dbgLog( 'execUpload.6 - штатное завершение' );
                      {$endif}
end;


function TFTP.Upload(e: PFileInfoEntry): boolean;
var fileName: TFileName;
begin
                  {$ifdef EXHOSTING}
                  dbgLog( 'Upload.1 - запуск ' );
                  {$endif}
 fLastErrMsg := '';
 try
  fileName:= ExtractFileName(e^.FileName);

  if assigned(fInternal_Stream) then begin
    freeAndNil(fInternal_Stream);
                  {$ifdef EXHOSTING}
                  dbgLog( 'Upload.2 - freeAndNil(fInternal_Stream)' );
                  {$endif}
  end;

  fInternal_Stream:= TFileStream.Create( e^.FileName, fmOpenRead );
  fInternal_Stream.Position:= 0;
                  {$ifdef EXHOSTING}
                  dbgLog( 'Upload.3 - Отправка файла ответа...' );
                  {$endif}
  Put( fInternal_Stream, fileName );
                  {$ifdef EXHOSTING}
                  dbgLog( 'Upload.4 - Файл ответа отправлен' );
                  {$endif}
  freeAndNil(fInternal_Stream);
  result:= true;
  uLoger.Log( format('Файл ответа %s выгружен на FTP-сервер %s', [fileName, getHostPort]) );
 except
  on ex: exception do begin
    fLastErrMsg:= GetErrorMsg(ex);  // Permission denied
    uLoger.Log( format('Файл ответа %s  Ошибка выгрузки на FTP-сервер %s', [fileName, getHostPort]) );
    if assigned(fInternal_Stream) then
      freeAndNil(fInternal_Stream);
  result:= false;
 end;end;
                    {$ifdef EXHOSTING}
                     dbgLog( 'Upload.5 - завершено' );
                    {$endif}
end;


function  TFTP.doConnect : boolean;
begin
 fLastErrMsg:= '';
 try
  if (UserName = '') or (Host = '') or (Port = 0) then
    fLastErrMsg:= 'Не назначены имя FTP сервера или порт или имя учетной записи на FTP сервере!';

  if ('' = fLastErrMsg) then
    if (ProxySettings.ProxyType <> fpcmNone) and ( (ProxySettings.Host = '') or (ProxySettings.Port = 0) ) then begin
      fLastErrMsg:= 'Необходимо указать имя прокси-сервера и порт, либо отключить использование прокси соединения';
      sysUtils.abort;
    end;

  Connect( true, 25000 );
  result := true;
 except on ex: exception do begin
  if ( fLastErrMsg = '' ) then
    fLastErrMsg:= GetErrorMsg(ex);
  result:= false;
 end; end;
end;

function TFTP.execConnect_D: boolean;
begin
                  {$ifdef EXHOSTING}
                   dbgLog('execConnect_D.1 Запуск');
                  {$endif}
 result:= false;
 fLastErrMsg:= '';
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.2 Установка соединения..');
                  {$endif}
 if (not Connected)and (not doConnect) then begin
   uLoger.Log( fLastErrMsg, leError );
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.3 Соединение не установлено. Выход');
                  {$endif}
   exit;
 end;
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.3 Соединение установлено.');
                  {$endif}
// uLoger.Log( Format('Соединён с FTP-сервером %s для загрузки', [GetHostPort])  );
 try
  if (FtpDir_Source <> '') then begin
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.4 Установка директории ' + FtpDir_Source );
                  {$endif}
    changeDir(FtpDir_Source);
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.5 Директория установлена' );
                  {$endif}
  end;
  result:= true;
 except
  on ex: exception  do begin
   fLastErrMsg:= GetErrorMsg(ex);
   uLoger.Log( Format('Сервер %s. Невозможно установить каталог-источник данных %s. Детали: %s', [getHostPort, FtpDir_Source, fLastErrMsg ]), leWarn );
   //uLoger.Log( 'Попытка загрузки данных из корневого каталога FTP - сервера ' + getHostPort );
   if connected then begin
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.6 Аварийное отсоединение..');
                  {$endif}
     disconnect;
                  {$ifdef EXHOSTING}
                  dbgLog('execConnect_D.7 Отсоединено');
                  {$endif}
   end;
  end;
 end;
                  {$ifdef EXHOSTING}
                   dbgLog('execConnect_D.8 Завершено');
                  {$endif}
end;

procedure TFTP.execDownLoad;
begin
                  {$ifdef EXHOSTING}
                  dbgLog('execDownLoad.1 Запущено');
                  {$endif}
 if connected then begin
                  {$ifdef EXHOSTING}
                  dbgLog('execDownLoad.2 Соединено');
                  dbgLog('execDownLoad.3 Загрузка..');
                  {$endif}
  DownLoad();
                  {$ifdef EXHOSTING}
                  dbgLog('execDownLoad.4 Загружено');
                  dbgLog('execDownLoad.5 Отсоединение..');
                  {$endif}
  disconnect;
                  {$ifdef EXHOSTING}
                  dbgLog('execDownLoad.6 Отсоединено');
                  {$endif}
 end;
// uLoger.Log( Format('Отсоединен от %s ', [GetHostPort])  );
                 {$ifdef EXHOSTING}
                 dbgLog('execDownLoad.7 Завершено');
                 {$endif}
end;


procedure TFTP.DownLoad;
var
  ftpErr: boolean;
  fileMask: string;
  fn: TFileName;
  i, j, k : integer;
  sl: TStringList;
begin
                    {$ifdef EXHOSTING}
                    dbgLog('DownLoad.1 Запущено');
                    {$endif}
 j := 0;  k := 0;
 fLastErrMsg:= '';
 fileMask:= Options.ServiceOptions[serviceIndex].FileMask;
 sl:= TStringList.Create;
 try
                    {$ifdef EXHOSTING}
                    dbgLog('DownLoad. Список файлов получение..');
                    {$endif}
  List( sl, fileMask );
  directoryListing.LoadList(sl);
                    {$ifdef EXHOSTING}
                    dbgLog('DownLoad. Список файлов получен');
                    {$endif}
  ftpErr:= false;
 except on ex: exception do begin
  fLastErrMsg:= GetErrorMsg(ex);
  Log( Format('Ошибка FTP : %s', [fLastErrMsg] ), leError );
                   {$ifdef EXHOSTING}
                   dbgLog('DownLoad. Ошибка получения списока файлов.');
                   {$endif}
  ftpErr:= true;
 end; end;
 freeAndNil(sl);

 if ftpErr then Exit;

  if assigned(fInternal_Stream) then
    freeAndNil(fInternal_Stream);

  fInternal_Stream:= TMemoryStream.Create;
  i := 0;
  try
  fLastErrMsg:= '';
  while (i < directoryListing.Count) do begin
    if (directoryListing[i].Text[1] <> 'd') and  matchesMask(directoryListing[i].FileName, fileMask )
    then
      fn:= Dir_DownLoad + directoryListing[i].FileName
    else
      continue;

    if fileAlredyLoaded( directoryListing[i].FileName,  serviceIndex) then  // загружался ли ранее файл с таким именем ?
     if (not OverWriteExists) then begin
       uLoger.Log(Format('Файл запроса %s загружен ранее. Повторная загрузка не производится.', [directoryListing[i].FileName]), leWarn );

       if deleteFtpFile( directoryListing[i].FileName ) then
         inc(k);

       inc(i);
       continue;
     end
     else
      uLoger.Log(Format('Повторная загрузка файла запроса %s.', [directoryListing[i].FileName]), leWarn );

    (fInternal_Stream as TMemoryStream).SetSize(0);
    Get( directoryListing[i].FileName, fInternal_Stream );

    if fileExists( fn ) then
      deleteFile( fn );

    (fInternal_Stream as TMemoryStream).saveToFile( fn );
    fileSetDate( fn, dateTimeToFileDate(directoryListing[i].ModifiedDate) );
    inc(j);

    uLoger.Log(Format('%s  загружен из  %s.', [directoryListing[i].FileName, getHostPort]), leInfo );
      // сохраним файл в очереди
    fileToQueue( fn, directoryListing[i].ModifiedDate );

    if deleteFtpFile( directoryListing[i].FileName ) then
      inc(k);

    if ( j >= Options.ServiceOptions[serviceIndex].MaxTransCount ) then begin
      with Options.ServiceOptions[serviceIndex] do
        fLastErrMsg:= Format( 'Количество загруженых файлов достигло значения, указанного в параметре MaxTransactionCount = %d. Загрузка приостановлена.', [ MaxTransCount ] );
      sysUtils.abort;
    end;
    inc(i);
  end; {while (i < directoryListing.Count)..}

  except
  on ex: exception do begin
   if ( fLastErrMsg = '') then begin
     fLastErrMsg:= GetErrorMsg(ex);
     uLoger.Log(Format('Ошибка при загрузке файла запроса %s : %s', [DirectoryListing.Items[i].FileName, fLastErrMsg ]), leError);
   end
   else
     uLoger.Log(fLastErrMsg);
  end; end;

 freeAndNil(fInternal_Stream);

 if (j > 0)or(k > 0) then
   uLoger.Log(Format('Файлов запроса Загружено: %d; Удалено с FTP: %d ', [j, k]), leInfo);
                  {$ifdef EXHOSTING}
                   dbgLog('DownLoad. Завершено');
                  {$endif}
end;

procedure TFTP.fileToQueue(const aFileName: TFileName; const aFileDateTime: TDateTime);
var pe: PFileInfoEntry;
begin
 new(pe);
 pe^.serviceIndex:= fServiceIndex;
 pe^.FileName:= aFileName;
 pe^.FileDate:= aFileDateTime;
 FileSetDate( pe^.FileName, DateTimeToFileDate(pe^.FileDate) );
 fQueue.Add(pe);
end;

function TFTP.GetHostPort(isProxy : boolean = False) : string;
begin
  Result := Format('%s@%s:%d', [UserName, Host, Port]);
end;

function TFTP.DeleteFtpFile(aFtpFileName: string): boolean;
begin
 Result := False;
 if DelFtpFiles then
 try
  Delete(aFtpFileName);
  Result := True;
  uLoger.Log(Format('%s удален из %s.', [aFtpFileName, getHostPort]) );
 except
   on ex: exception do begin
     fLastErrMsg:= GetErrorMsg(ex);
     uLoger.Log(Format('Ошибка при удалении файла с FTP %s: %s', [aFtpFileName, fLastErrMsg ]), leWarn);
   end;
 end;
end;

function TFTP.getDir_Download_Arch: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].Dir_DownLoad_Arch
end;

function TFTP.getDir_DownLoad: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].Dir_DownLoad
end;

function TFTP.getDir_Answers: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].Dir_Answer
end;

function TFTP.getFtpTimeOut: integer;
begin
 result:= Options.ServiceOptions[fServiceIndex].FTP_TimeOut
end;

function TFTP.getFtpDir_Source: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].FtpDir_Source
end;

function TFTP.getFtpDir_Dest: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].FtpDir_Dest
end;

function TFTP.getFileMask: string;
begin
 result:= Options.ServiceOptions[fServiceIndex].FileMask
end;

function TFTP.getOverWriteExists: boolean;
begin
 result:= Options.ServiceOptions[fServiceIndex].OverWriteExists
end;

function TFTP.getDelFtpFiles: boolean;
begin
 result:= Options.ServiceOptions[fServiceIndex].DelFtpFiles
end;

procedure TFTP.setOptionIndex(aIndex: integer);
begin
 fServiceIndex:= aIndex;

 UserName:= Options.ServiceOptions[aIndex].FTP_UserName;
 Host:=  Options.ServiceOptions[aIndex].FTP_Host;
 Port:=  Options.ServiceOptions[aIndex].FTP_Port;
 Password := Options.ServiceOptions[aIndex].Ftp_Password;
 Passive  := Options.ServiceOptions[aIndex].Ftp_Passive;

 ProxySettings.ProxyType := Options.ServiceOptions[aIndex].Proxy_Type;
 ProxySettings.Host      := Options.ServiceOptions[aIndex].Proxy_Host;
 ProxySettings.Port      := Options.ServiceOptions[aIndex].Proxy_Port;
 ProxySettings.UserName  := Options.ServiceOptions[aIndex].Proxy_UserName;
 ProxySettings.Password  := Options.ServiceOptions[aIndex].Proxy_Password;
end;

function TFTP.GetErrorMsg(e : exception) : string;
begin
// список кодов ответов ФТП
// https://ru.wikipedia.org/wiki/Список_кодов_ответов_FTP
 result := e.message;
 if (result = 'Operation aborted') then
   result := Format('Ошибка FTP. Код: %s - Текст: %s', [Trim(LastCmdResult.TextCode), Trim( LastCmdResult.Text.Text) ]);
end;

procedure TFTP.timerTimer(Sender: TObject);
var
 res: dword;
 myHandle: THandle;
begin
 fTimer.Enabled:= false;
 myHandle:= 0;

 uLoger.Log( 'Сработал Таймер - прерыватель обмена!',  leError );

 if assigned( fThread ) then begin
   fThread.Suspend;
   myHandle:= (fThread as TExch).fHandle;

   Windows.TerminateThread( fThread.Handle, 0 );
   GetExitCodeThread( fThread.Handle, res );

   freeAndNil(fThread);
 end;
 // zzzzzzzzzzzzzzzzzzzzzzzzz
 // abort;
 if (myHandle <> 0) then
   windows.postMessage(myHandle, msg_Watch_Dog, 0, 0);
end;

procedure TFTP.afterConstruction;
begin
 inherited;
 fInternal_Stream:= nil;
 fErrorList:= TStringList.Create;
 fTimer:= TTimer.Create( self );
 fTimer.Enabled:= false;
 fTimer.onTimer := timerTimer;
end;

procedure TFTP.beforeDestruction;
begin
 if assigned(fTimer) then begin
   fTimer.Enabled:= false;
   freeAndNil(fTimer);
 end;

 if assigned( fThread ) then begin
   fThread.Suspend;
   freeAndNil(fThread);
 end;

 if assigned( fInternal_Stream ) then
   freeAndNil( fInternal_Stream );

 if assigned(fErrorList) then
   freeAndNil(fErrorList);
 inherited;
end;


end.
