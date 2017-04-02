{+--------------------------------------------------------------------------+
| Class:       TIDEStream
| Created:     9.97
| Author:      Martin Waldenburg
| Copyright    1997, all rights reserved.
| Description: A simple and effective interface to the IDE's text buffer
|              You can retrive the text of the IDE's text buffer either
|              as PChar or as string list.
|              You can manipulate it in any way and then replace the
|              whole text with the result of your manipulation.
| Version:     1.1
| Status:      FreeWare
|   Modified to access not only the current file
   by  Egbert van Nes
| Disclaimer:
| This is provided as is, expressly without a warranty of any kind.
| You use it at your own risc.
+--------------------------------------------------------------------------+}
unit MyIDEStream;

interface

uses
  Windows, SysUtils, Messages, Classes,
  {$WARN UNIT_DEPRECATED OFF}
  ToolIntf, EditIntf, ExptIntf;
  {$WARN UNIT_DEPRECATED ON}

type
  TIDEStream = class(TMemoryStream)
  private
    FLines: TStringList;
    FFileName: string;
    function GetAsPChar: PChar;
    procedure LoadLines;
    function GetLines: TStringList;
    procedure SetLines(NewValue: TStringList);
    function GetStreamTextLen: Longint;
    procedure GetEditReader;
    procedure GetEditWriter;
    procedure FreeEditReader;
    procedure FreeEditWriter;
  protected
  public
    constructor Create(AFileName: string);
    destructor Destroy; override;
    procedure WriteText(Text: PChar);
    property Capacity;
    property AsPChar: PChar read GetAsPChar;
    function GetText: PChar;
    procedure SetMemPointer(Ptr: Pointer; Size: Longint);
    property StreamTextLen: Longint read GetStreamTextLen;
    property Lines: TStringList read GetLines write SetLines;
    property FileName: string read FFileName;
  published
    procedure Clear;
  end;

var
  FToolServices: TIToolServices;
  FModuleInterface: TIModuleInterface;
  FEditorInterface: TIEditorInterface;
  ActualReader: TIEditReader;
  ActualWriter: TIEditWriter;
function GetProjectName: string;
function GetCurrentFile: string;
function IsReadonlyBuffer(FileName: string): Boolean;
function GetToolServieces: TIToolServices;
procedure SaveFile(AFileName: string);

implementation
uses Dialogs, Forms, Menus, StdCtrls, ComCtrls;

procedure SaveFile(AFileName: string);
begin
  FToolServices.SaveFile(AFileName);
end;

function GetProjectName: string;
begin
  Result := FToolServices.GetProjectName;
end; { GetProjectName }

function GetCurrentFile: string;
begin
  Result := FToolServices.GetCurrentFile;
end; { GetCurrentFile }

function GetToolServieces: TIToolServices;
begin
  FToolServices := ExptIntf.ToolServices;
  Result := FToolServices;
  {if GetProjectName = '' then
   raise exception.create('Sorry, a project must be open');}
end; { GetToolServieces }

function IsReadonlyBuffer(FileName: string): Boolean;
{ This function can only check currently opened edit buffer
  build with packages  }
{$IFNDEF ver90} {Not in D3} {probably it works in Component style expert}
var
  I, J: Integer;
begin
  Result := False; {default value}
  if Application <> nil then
    with Application do
      for I := 0 to ComponentCount - 1 do
        if Components[I] is TForm then
          if CompareText(ExtractFileName(TForm(Components[I]).Caption),
            ExtractFileName(FileName)) = 0 then
            with Components[I] do
              for J := 0 to ComponentCount - 1 do
                if Components[J] is TStatusBar then
                  Result := TStatusBar(Components[J]).Panels[2].Text =
                    'Read only';
end;
{$ELSE}
begin
  Result := False;
end;
{$ENDIF}

procedure TIDEStream.GetEditReader;
begin
  GetToolServieces;
  FModuleInterface := FToolServices.GetModuleInterface(FFileName);
  FEditorInterface := FModuleInterface.GetEditorInterface;
  ActualReader := FEditorInterface.CreateReader;
end; { GetEditReader }

procedure TIDEStream.GetEditWriter;
begin
  GetToolServieces;
  FModuleInterface := FToolServices.GetModuleInterface(FFileName);
  FEditorInterface := FModuleInterface.GetEditorInterface;
  ActualWriter := FEditorInterface.CreateWriter;
end; { GetEditWriter }

procedure TIDEStream.FreeEditReader;
begin
  ActualReader.Free;
  FEditorInterface.Free;
  FModuleInterface.Free;
end; { GetEditorInterface }

procedure TIDEStream.FreeEditWriter;
begin
  ActualWriter.Free;
  FEditorInterface.Free;
  FModuleInterface.Free;
end; { GetEditorInterface }

constructor TIDEStream.Create(AFileName: string);
begin
  inherited Create;
  if AFileName = '' then
  begin
    GetToolServieces;
    FFileName := GetCurrentFile;
  end
  else
    FFileName := AFileName;
  if LowerCase(ExtractFileExt(FFileName)) = '.dfm' then
    raise Exception.Create('Sorry, must be a PAS or DPR file');
  FLines := TStringList.Create;
end; { Create }

procedure TIDEStream.Clear;
begin
  FLines.Clear;
  inherited Clear;
end; { Clear }

destructor TIDEStream.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end; { Destroy }

function TIDEStream.GetAsPChar: PChar;
const
  TheEnd: Char = #0;
begin
  Position := Size;
  Write(TheEnd, 1);
  SetPointer(Memory, Size - 1);
  Result := Memory;
end; { GetAsPChar }

procedure TIDEStream.SetMemPointer(Ptr: Pointer; Size: Longint);
begin
  SetPointer(Ptr, Size);
end; { SetMemPointer }

function TIDEStream.GetStreamTextLen: Longint;
const
  {BuffLen = 16383;}
  BuffLen = $FF;
var
  TextBuffer: PChar;
  Readed, BuffPos, TextLen: Longint;
begin
  TextLen := 0;
  Getmem(TextBuffer, BuffLen + 1);
  BuffPos := 0;
  GetEditReader;
  try
    repeat
      Readed := ActualReader.GetText(BuffPos, TextBuffer, BuffLen);
      TextLen := TextLen + Readed;
      inc(BuffPos, Readed);
    until Readed < BuffLen;
  finally
    FreeEditReader;
    Freemem(TextBuffer, BuffLen + 1);
  end;
  Result := TextLen;
end; { GetStreamTextLen }

function TIDEStream.GetText: PChar;
const
  BuffLen = $FF;
var
  TextBuffer: PChar;
  Readed, BuffPos: Longint;
begin
  Clear;
  Getmem(TextBuffer, BuffLen + 1);
  BuffPos := 0;
  GetEditReader;
  try
    repeat
      Readed := ActualReader.GetText(BuffPos, TextBuffer, BuffLen);
      Write(TextBuffer^, Readed);
      inc(BuffPos, Readed);
    until Readed < BuffLen;
  finally
    FreeEditReader;
    Freemem(TextBuffer, BuffLen + 1);
  end;
  Result := AsPChar;
end; { GetText }

procedure TIDEStream.WriteText(Text: PChar);
var
  TextLen: Longint;
begin
  if Size = 0 then
    TextLen := GetStreamTextLen
  else
    TextLen := Size;
  GetEditWriter;
  if (ActualWriter <> nil) and (Text <> nil) then
    try
      if TextLen > 0 then
      begin
        ActualWriter.CopyTo(0);
        ActualWriter.DeleteTo(TextLen - 2);
        {a bit tricky, in Delphi 3.00 2 char remain in
         editor, while in Delphi 2.01 the editor is clean,
         The following might cause problems in other versions}
{$IFDEF VER100}
        ActualWriter.DeleteTo(2);
{$ENDIF}
      end;
      ActualWriter.Insert(Text);
    finally
      FreeEditWriter;
    end;
end; { WriteText }

procedure TIDEStream.LoadLines;
var
  Run, LineStart, LineEnd: PChar;
begin
  LineStart := GetText;
  Run := LineStart;
  while Run^ <> #0 do
  begin
    Run := LineStart;
    while not (Run^ in [#0, #10, #13]) do
      inc(Run);
    LineEnd := Run;
    if Run^ <> #0 then
    begin
      inc(Run);
      if Run^ in [#10, #13] then
        inc(Run);
    end;
    LineEnd^ := #0;
    FLines.Add(LineStart);
    LineStart := Run;
  end;
end; { LoadLines }

function TIDEStream.GetLines: TStringList;
begin
  if FLines.Count = 0 then
    LoadLines;
  Result := FLines;
end; { GetLines }

procedure TIDEStream.SetLines(NewValue: TStringList);
begin
  FLines.Assign(NewValue);
end; { SetLines }

end.
