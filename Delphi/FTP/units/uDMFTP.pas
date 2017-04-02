unit uDMFTP;

interface

uses
  SysUtils, Classes, Messages, Windows,
  uCommon, uFTP, ExtCtrls;

type
  TFTP_List = TList;
  TFTP_Couple = record
    Upload: TFTP;
    Download: TFTP;
  end;
  PFTP_Couple = ^TFTP_Couple;

  TExchStates = ( ftpRedy,  ftpUpload, ftpDownload );

  TDMFTP = class(TDataModule)
  private
   fState: TExchStates;
   fHandle: THandle;
   fFTP_List: TFTP_List;
   fControllerHandle: THandle;
   fCounter: integer;

    function internalStateToStr(aState:TExchStates): string;

    procedure Wnd_Proc(var msg: TMessage);
    procedure setState(Value: TExchStates);
    procedure setCounter(Value: integer);
    procedure internalExchange;

  protected
   procedure whenExchComplete(var Message: TMessage); message msg_ExchComplete;
   procedure whenWatchDog(var Message: TMessage); message MSG_Watch_Dog;

   property Handle: THandle read fHandle;

  public
    function  recreateFTP_List: TFTP_List;
    function  createFTP_List: TFTP_List;
    procedure destroyFTP_List(aList: TFTP_List);

    function answersUploaded: boolean;
    function queriesDownloaded: boolean;

    procedure Check_Conection;

    constructor create(aControllerHandle: THandle); reintroduce;
    destructor Destroy; override;

    procedure startDownload;
    procedure startUpload;

    property State: TExchStates read fState write setState;
  end;

var DMFTP: TDMFTP;

implementation

uses uOptions, uQueue, uLoger;
{$R *.dfm}

constructor TDMFTP.create(aControllerHandle: THandle);
begin
 inherited Create(nil);
 fControllerHandle:= aControllerHandle;
 fHandle := AllocateHWND( Wnd_Proc );
 fCounter:= 0;
 fState:= ftpRedy;
end;

destructor TDMFTP.Destroy;
begin
 DeallocateHWnd( fHandle );
 inherited;
end;

procedure TDMFTP.setState(Value: TExchStates);
begin
 fState:= Value;
end;

procedure TDMFTP.setCounter(Value: integer);
begin
 fCounter:= Value;
 if fCounter < Options.ServiceCount then
   exit;
// fCounter:= 0;
// windows.sendMessage(Handle, msg_ExchComplete, 0, 0 );
end;

procedure TDMFTP.startDownload;
begin
        {$ifdef EXHOSTING}
         dbgLog( 'TDMFTP.startDownload - вызов' );
        {$endif}
 fCounter:= 0;
 State:= ftpDownload;
        {$ifdef EXHOSTING}
         dbgLog( 'fCounter:= 0; State:= ftpDownload;' );
        {$endif}
 internalExchange;
        {$ifdef EXHOSTING}
         dbgLog( 'TDMFTP.startDownload - завершен' );
        {$endif}
end;

procedure TDMFTP.startUpload;
begin
        {$ifdef EXHOSTING}
         dbgLog( 'TDMFTP.startUpload - вызов' );
        {$endif}
 fCounter:= 0;
 State:= ftpUpload;
        {$ifdef EXHOSTING}
         dbgLog( 'fCounter:= 0; State:= ftpUpload;' );
        {$endif}
 internalExchange;
        {$ifdef EXHOSTING}
         dbgLog( 'TDMFTP.startUpload - заершен' );
        {$endif}
end;

function TDMFTP.internalStateToStr(aState:TExchStates): string;
begin
 case aState of
  ftpRedy: result     := 'ftpRedy';
  ftpUpload: result   := 'ftpUpload';
  ftpDownload: result := 'ftpDownload'
 else
   result := '??'
 end
end;

procedure TDMFTP.internalExchange;
begin
          {$ifdef EXHOSTING}
           dbgLog( 'TDMFTP.internalExchange - вызов' );
           dbgLog( format('Состояние: fState = %s, fCounter = %d', [internalStateToStr(fState), fCounter] ) );
          {$endif}
 case fState of
   ftpUpload:  begin
      PFTP_Couple(fFTP_List[fCounter])^.Upload.tryUpload(Handle);
   end;

   ftpDownload: begin
     uLoger.Log( '  ' );
     uLoger.Log( Options.ServiceOptions[fCounter].ServiceName + ' Проверка запросов'  );
     PFTP_Couple(fFTP_List[fCounter])^.Download.tryDownLoad(Handle);
   end;
 end;
            {$ifdef EXHOSTING}
            dbgLog( 'TDMFTP.internalExchange - завершен' );
            {$endif}
end;

//var tstC: integer = 0;
procedure TDMFTP.whenExchComplete(var Message: TMessage);
begin
 //inc(tstC);
          {$ifdef EXHOSTING}
           dbgLog(format('DMFTP.whenExchComplete. State = %s, fCounter = %d ', [internalStateToStr(fState), fCounter] ) );
          {$endif}
 if( State = ftpDownload )and( PQueueListEntry(Queue_List[fCounter])^.DownloadQueue.Count = 0 ) then
   uLoger.Log( 'Новых запросов нет.'  );

 if( 1 + fCounter < Options.ServiceCount )then begin
   inc(fCounter);
   internalExchange
 end
 else begin
   case fState of
    ftpUpload:   begin
      windows.postMessage( fControllerHandle, MSG_Uploaded, 0, 0 );
           {$ifdef EXHOSTING}
            dbgLog('DMFTP.whenExchComplete. postMessage( MSG_Uploaded..' );
           {$endif}
    end;
    ftpDownload: begin
      //if tstC < 3 then
      windows.postMessage( fControllerHandle, MSG_Downloaded, 0, 0 );
           {$ifdef EXHOSTING}
            dbgLog('DMFTP.whenExchComplete. postMessage( MSG_Downloaded..' );
           {$endif}
    end;
   end;
   fState:=  ftpRedy;
 end;
            {$ifdef EXHOSTING}
            dbgLog('DMFTP.whenExchComplete. Завершено' ) ;
            {$endif}
end;

procedure TDMFTP.whenWatchDog(var Message: TMessage);
begin
 uLoger.Log( '  ' );
 uLoger.Log( ' Зависание в канале связи. Производится перезапуск ', leError );
 uLoger.Log( '  ' );

 windows.postMessage( fControllerHandle, MSG_Watch_Dog, 0, 0 );
end;

procedure TDMFTP.Wnd_Proc(var msg: TMessage);
begin
  case msg.Msg of
    msg_ExchComplete: begin
          {$ifdef EXHOSTING}
           dbgLog('DMFTP.Wnd_Proc. msg_ExchComplete');
          {$endif}
      whenExchComplete(msg);
    end;
    msg_Watch_Dog:  begin
          {$ifdef EXHOSTING}
          dbgLog('DMFTP.Wnd_Proc. msg_Watch_Dog');
          {$endif}
      whenWatchDog(msg);
    end
    else begin
     // for all other messages call the default window procedure
          {$ifdef EXHOSTING}
          dbgLog('DMFTP.Wnd_Proc. Прочие сообщения');
          {$endif}
      msg.Result := DefWindowProc(fHandle, msg.Msg, msg.wParam, msg.lParam);
    end
  end;
end;

procedure TDMFTP.Check_Conection;
var i: integer;
 ftp_UP, ftp_Down: TFTP;
begin
// отладочная процедура
 for i:= 0 to fFTP_List.Count - 1 do begin
// check receiver: получаем список файлов по маске и загружаем в Downloads
  ftp_Down:= PFTP_Couple(fFTP_List[i])^.Download;
  ftp_UP  := PFTP_Couple(fFTP_List[i])^.Upload;

  ftp_Down.execDownLoad; // загружаем данные и помещаем во входную очередь
 // cheqQueues_Zip_Answers( ftp_Down, ftp_UP ); // данные из входной очереди обрабатываем и пом5ещаем в выходную
  ftp_UP.execUpLoad; // из выходной очереди данные выгружаем на ФТП сервер
 end;
end;

function TDMFTP.createFTP_List: TFTP_List;
var
 i: integer;
 p: PFTP_Couple;
begin
 result:= TFTP_List.Create;
 for i:= 0 to Options.ServiceCount-1 do begin
  new(p);
  p^.Upload := TFTP.Create(nil);
  p^.Download:= TFTP.Create(nil);
  p^.Upload.serviceIndex:= i;
  p^.Upload.Queue:= PQueueListEntry(Queue_List[p^.Upload.serviceIndex])^.UploadQueue;

  p^.Download.serviceIndex:= i;
  p^.Download.Queue:=PQueueListEntry(Queue_List[p^.Upload.serviceIndex])^.DownloadQueue;

  result.Add(p);
 end;
end;

procedure TDMFTP.destroyFTP_List(aList: TFTP_List);
var i: integer;
 p: PFTP_Couple;
begin
 for i:= 0 to aList.Count-1 do begin
  p:= aList[i];
  if ( not Assigned(p) ) then continue;
  if assigned(p^.Upload) then
    freeAndNil(p^.Upload);
  if assigned(p^.Download) then
    freeAndNil(p^.Download);
  dispose(p);
  p:= nil;
 end;
end;

function TDMFTP.recreateFTP_List;
begin
 if assigned(fFTP_List) then
   destroyFTP_List(fFTP_List);

  fFTP_List:= createFTP_List;
  result:= fFTP_List;
end;


function TDMFTP.answersUploaded: boolean;
//var i: integer;
begin
 result:= false;
(* for i:= 0 to Queue_List.Count - 1 do
  if( PQueueListEntry(Queue_List[i])^.UploadQueue.Count <> 0 )then begin
    uLoger.Log( Format('Сервис: %s. Отправка ответов.', [Options.ServiceOptions[i].ServiceName ]) );
    // из выходной очереди отправляем данные на ФТП сервер:
    PFTP_Couple(fFTP_List[i])^.Upload.execUpLoad(fHandle);
    result:= true;
  end;
*)
end;


function TDMFTP.queriesDownloaded: boolean;
//var i: integer;
begin
 result:= false;
(* // загрузим  входную очередь:
 for i:= 0 to fFTP_List.Count - 1 do begin
   uLoger.Log( Format('Сервис: %s. Проверка запросов.', [Options.ServiceOptions[i].ServiceName ]) );

   PFTP_Couple(fFTP_List[i])^.Download.execDownLoad(fHandle);

   if (PQueueListEntry(Queue_List[i])^.DownloadQueue.Count <> 0) then
     result:= true
   else
     uLoger.Log( 'Новых запросов нет.' );

   uLoger.Log( ' ' ); // Вставим межсервисный разделитель
 end;
// sleep(100000);
*)
end;







end.
