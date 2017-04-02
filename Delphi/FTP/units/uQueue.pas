unit uQueue;

interface
uses
 SysUtils, Classes;
type
 TFileQueueNewItem = TNotifyEvent;

 TFileQueue = class(TThreadList)
  private
   fServiceIndex: integer;
   fStopNotify: boolean;
   fOnFileQueueNewItem: TFileQueueNewItem;
   procedure setOnFileQueueNewItem(aValue: TFileQueueNewItem);
   procedure addFileInfo(const aIdx: integer; const aRec: TSearchRec; const aFileDir: TFileName);
   function getCount: integer;
   procedure setServiceIndex(aIndex:integer);

  protected
   property ServiceIndex: integer read fServiceIndex write setServiceIndex;
   function searchDir: TFileName; virtual; abstract;
   function searchMask: TFileName; virtual; abstract;
  public
   procedure stuffQueue;
   procedure storeQueue;

  public
   {$WARN UNSAFE_TYPE OFF}
   procedure Add(Item: Pointer);
   {$WARN UNSAFE_TYPE ON}
   procedure stopNotify;
   procedure proceedNotify;
   {$WARN UNSAFE_TYPE OFF}
   function get0: pointer;
   function getAndDelete0: pointer;

   {$WARN UNSAFE_TYPE ON}
   procedure clear0;

   property onFileQueueNewItem: TFileQueueNewItem read fOnFileQueueNewItem write setOnFileQueueNewItem;
   property Count: integer read getCount;
 end;

 TDownloadQueue = class(TFileQueue)
  private
  protected
   function searchDir: TFileName; override;
   function searchMask: TFileName; override;
  public
 end;

 TUploadQueue = class(TFileQueue)
  private
  protected
   function searchDir: TFileName; override;
   function searchMask: TFileName; override;
  public
 end;

 TQueueList = TList;

 TQueueListEntry = record
  UploadQueue: TUploadQueue;
  DownloadQueue: TDownloadQueue;
 end;
 PQueueListEntry = ^TQueueListEntry;

function createQueue_List: TQueueList;
function recreateQueue_List: TQueueList;
procedure destroyQueue_List(aList: TQueueList);

function upQsAreEmpty: boolean;
function downQsAreEmpty: boolean;

var Queue_List:  TQueueList;

implementation
uses uCommon, uOptions;

function upQsAreEmpty: boolean;
var i: integer;
begin
 result:= true;
 for i:= 0 to Queue_List.Count - 1 do
   if ( PQueueListEntry(Queue_List[i])^.UploadQueue.Count > 0 ) then
      result:= false;
end;

function downQsAreEmpty: boolean;
var i: integer;
begin
 result:= true;
 for i:= 0 to Queue_List.Count - 1 do
   if ( PQueueListEntry(Queue_List[i])^.DownloadQueue.Count > 0 ) then
     result:= false;
end;

function recreateQueue_List: TQueueList;
var i: integer;
begin
 if assigned(Queue_List) then
   destroyQueue_List(Queue_List);

 Queue_List:= createQueue_List; // 1) сначала создаем очереди
 for i:= 0 to Queue_List.Count-1 do begin
   PQueueListEntry(Queue_List[i])^.UploadQueue.stuffQueue; // заполняем неотправлеными, если есть
   PQueueListEntry(Queue_List[i])^.DownloadQueue.stuffQueue; // заполняем необработанными, если есть
 end;
 result:= Queue_List;
end;


function createQueue_List: TQueueList;
var
 i: integer;
 p: PQueueListEntry;
begin
 result:= TQueueList.Create;
 for i:= 0 to Options.ServiceCount-1 do begin
  new(p);
  p^.UploadQueue:= TUploadQueue.Create;
  p^.UploadQueue.ServiceIndex:= i;
  p^.DownloadQueue:= TDownloadQueue.Create;
  p^.DownloadQueue.ServiceIndex:= i;
  result.Add(p);
 end;
end;

procedure destroyQueue_List(aList: TQueueList);
var
 i: integer;
 p: PQueueListEntry;
begin
 if (not Assigned(Queue_List)) then
  exit;
 for i:= 0 to Queue_List.Count-1 do begin
  p:= Queue_List[i];
  if Assigned(p^.UploadQueue) then freeAndNil(p^.UploadQueue);
  if Assigned(p^.DownloadQueue) then freeAndNil(p^.DownloadQueue);
  dispose(p);
  p:= nil;
 end;
 freeAndNil( Queue_List );
end;


procedure TFileQueue.addFileInfo(const aIdx: integer; const aRec: TSearchRec; const aFileDir: TFileName);
var
 l: TList;
 e: PFileInfoEntry;
begin
 new(e);
 e^.serviceIndex:= aIdx;
 e^.FileDate:= fileDateToDateTime(aRec.Time);
 e^.FileName:= aFileDir + aRec.Name;

 l:= lockList;
 l.Add(e);
 unLockList;
end;

{ TFileQueue }

procedure TFileQueue.stuffQueue;
var
 sRec: TSearchRec;
begin
 if (0=findFirst( searchDir + searchMask, faAnyFile, sRec )) then begin
   repeat
    addFileInfo( fServiceIndex, sRec, searchDir );
   until (0 <> findNext(sRec));
 end;
 findClose(sRec);
end;

procedure TFileQueue.storeQueue;
begin end;

{$WARN UNSAFE_TYPE OFF}
procedure TFileQueue.Add(Item: Pointer);
// перед вызовом функции необходима проверка, существует ли добавляемый в очередь элемент
begin
 inherited Add(Item);
 if (not fStopNotify) and  Assigned(fOnFileQueueNewItem) then
   fOnFileQueueNewItem(self);
end;   {$WARN UNSAFE_TYPE ON}

{$WARN UNSAFE_TYPE OFF}
function TFileQueue.get0: pointer;
var l: TList;
begin
 result:= nil;
 l:= lockList;
 if (l.Count > 0) then
   result:= l[0];
 unlockList;
end;

function TFileQueue.getAndDelete0: pointer;
var l: TList;
begin
 result:= nil;
 l:= lockList;
 if (l.Count > 0) then begin
  result:= l[0];
  l.Delete(0);
 end;
 unlockList;
end; {$WARN UNSAFE_TYPE ON}


procedure TFileQueue.clear0;
var l: TList;
begin
 l:= lockList;
 if (l.Count > 0) then begin
  dispose(l[0]);
  l.delete(0);
 end;
 unlockList;
end;

procedure TFileQueue.setOnFileQueueNewItem(aValue: TFileQueueNewItem);
begin
 fOnFileQueueNewItem:= aValue;
end;

function TFileQueue.getCount: integer;
begin
 result:= lockList.Count;
 unlockList;
end;

procedure TFileQueue.setServiceIndex(aIndex: integer);
begin
 fServiceIndex:= aIndex;
end;

procedure TFileQueue.stopNotify;
begin
 fStopNotify:= false;
end;

procedure TFileQueue.proceedNotify;
begin
 fStopNotify:= true;
end;

{ TDownloadQueue }
function TDownloadQueue.searchDir: TFileName;
begin
 result:= Options.ServiceOptions[fServiceIndex].Dir_DownLoad;
end;

function TDownloadQueue.searchMask: TFileName;
begin
 result:= Options.ServiceOptions[fServiceIndex].FileMask;
end;

{ TUploadQueue }
function TUploadQueue.searchDir: TFileName;
begin
 result:= Options.ServiceOptions[fServiceIndex].Dir_Answer;
end;

function TUploadQueue.searchMask: TFileName;
begin
 result:= Options.ServiceOptions[fServiceIndex].AnswerMask;
end;

end.
