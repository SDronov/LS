unit uHelpClasses;

interface
uses
  Windows, Classes, SysUtils;

type
 TListClass = class of TList;

{ TNewThreadList class }

 TNewThreadList = class
  private
    FList: TList;
    FLock: TRTLCriticalSection;

  protected
    property List: TList read fList;

  public
    procedure Add(Item: Pointer);
    procedure Remove(Item: Pointer);
    procedure Clear;

    function  LockList: TList;
    procedure UnlockList;

    destructor Destroy; override;
    constructor Create(aListClass: TListClass); overload;
    constructor Create(aList: TList); overload;
    
  end;

implementation


{ TNewThreadList }

constructor TNewThreadList.Create(aList: TList);
begin
 inherited Create;
 InitializeCriticalSection(FLock);
 FList := aList;
end;

constructor TNewThreadList.Create(aListClass: TListClass);
begin
 inherited Create;
 InitializeCriticalSection(FLock);
 FList := aListClass.Create;
end;

destructor TNewThreadList.Destroy;
begin
  LockList;    // Make sure nobody else is inside the list.
  try
    FList.Free;
    inherited Destroy;
  finally
    UnlockList;
    DeleteCriticalSection(FLock);
  end;
end;

procedure TNewThreadList.Add(Item: Pointer);
begin
  LockList;
  try
   fList.Add(Item);
  finally
    UnlockList;
  end;
end;

procedure TNewThreadList.Clear;
begin
  LockList;
  try
    FList.Clear;
  finally
    UnlockList;
  end;
end;

function  TNewThreadList.LockList: TList;
begin
  EnterCriticalSection(FLock);
  Result := FList;
end;

procedure TNewThreadList.Remove(Item: Pointer);
begin
  LockList;
  try
    FList.Remove(Item);
  finally
    UnlockList;
  end;
end;

procedure TNewThreadList.UnlockList;
begin
  LeaveCriticalSection(FLock);
end;

initialization
finalization
end.
