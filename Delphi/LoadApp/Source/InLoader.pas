unit InLoader;

interface

uses Classes;

type

  TOnMessageProc = procedure (const S: string) of object;

  TInLoader = class(TComponent)
  protected
    FPath: string;
    FTerminated: boolean;
    FStatus: String;
    FOnMessage: TOnMessageProc;
    FLoadMode: integer; //Режим загрузки (для текстовых файлов)
    function GetPosition: Integer; virtual; abstract;
    function GetTotal: Integer;  virtual; abstract;
    procedure DoMessage(const S: String); virtual;
  public
    constructor Create(const Path: string); overload; virtual;
    constructor Create(const Path: string; const LoadMode: integer); overload; virtual;
    procedure DoLoad; virtual;
    procedure Terminate; virtual;
    property Total: Integer read GetTotal;
    property Position: Integer read GetPosition;
    property Status: String read FStatus write FStatus;
    destructor Destroy; override;
    property Terminated: boolean read FTerminated;
    property OnMessage: TOnMessageProc read FOnMessage write FOnMessage;
    class procedure CheckDir(const Dir: String); overload; virtual;
    class procedure CheckDir(const Dir: String; LoadMode: integer); overload; virtual;
  end;

implementation

{ TInLoader }

class procedure TInLoader.CheckDir(const Dir: String);
begin

end;

class procedure TInLoader.CheckDir(const Dir: String; LoadMode: integer);
begin

end;


constructor TInLoader.Create(const Path: string);
begin
  FPath := Path;
end;

constructor TInLoader.Create(const Path: string; const LoadMode: integer);
begin
  FPath := Path;
  FLoadMode:= LoadMode;
end;

destructor TInLoader.Destroy;
begin

  inherited;
end;

procedure TInLoader.DoLoad;
begin

end;

procedure TInLoader.DoMessage(const S: String);
begin
 if Assigned(FOnMessage) then
   FOnMessage(S);
end;

procedure TInLoader.Terminate;
begin
  FTerminated := True;
end;

end.
 