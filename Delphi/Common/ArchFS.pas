{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source: MainFrm.pas $
  $Revision: 1.49 $
  $Author: pkruglov $
  $Date: 2007/03/28 11:46:53 $
}
unit ArchFS;

interface

uses Classes, SysUtils, IFS, ztvBase, ztvStreams;

type
   TDecompMemoryStorage = class(TInterfacedObject, IFileStorage)
   private
     FArchiveName: string;
     FDecompMemory: TDecompMemoryStream;
    function GetFileIndex(const AFileName: String): Integer;
   public
     constructor Create(AnArch: TUnBase); overload;
     constructor Create(const AFileName: string; const AFileMask: String= '*.*'); overload;
     function FileExists(const AFileName: String): Boolean;
     function GetFileCount: Integer;
     procedure GetFileList(List: TStrings);
     function GetFileName(AnIndex: Integer): String;
     function GetFileStream(const AFileName: String): TStream;
     function GetStorageName: String;
     destructor Destroy; override;
   end;

implementation

uses ArchUtils;


{ TDecompMemoryStorage }

constructor TDecompMemoryStorage.Create(AnArch: TUnBase);
begin
  FArchiveName := AnArch.ArchiveFile;
  FDecompMemory := TDecompMemoryStream.Create;
  try
    AnArch.ExtractToMemoryStream(FDecompMemory);
  except
    FDecompMemory.Destroy;
    FDecompMemory := nil;
    raise;
  end;
end;

constructor TDecompMemoryStorage.Create(const AFileName: string; const AFileMask: String);
var
  UnComp: TUnBase;
begin
  UnComp := OpenArchive(AFileName, AFileMask);
  try
    Create(UnComp);
  finally
    UnComp.Free;
  end;
end;

destructor TDecompMemoryStorage.Destroy;
begin
  if FDecompMemory <> nil then
      FDecompMemory.Destroy;
  inherited;
end;

function TDecompMemoryStorage.FileExists(const AFileName: String): Boolean;
begin
  Result := GetFileIndex(AFileName) >= 0;
end;

function TDecompMemoryStorage.GetFileIndex(const AFileName: String): Integer;
var
  I: Integer;
begin
  for I := 0 to FDecompMemory.FileCount - 1 do    // Iterate
  begin
    if SameText(FDecompMemory.FileName[I], AFileName) then
    begin
      Result := I;
      Exit;
    end;
  end;    // for
  Result := -1;
end;

function TDecompMemoryStorage.GetFileCount: Integer;
begin
  Result := FDecompMemory.FileCount;
end;

procedure TDecompMemoryStorage.GetFileList(List: TStrings);
var
  I: Integer;
begin
  List.Clear;
  List.BeginUpdate;
  try
    for I := 0 to FDecompMemory.FileCount - 1 do    // Iterate
    begin
      List.Add(FDecompMemory.FileName[I]);
    end;    // for
  finally
    List.EndUpdate;
  end;
end;

function TDecompMemoryStorage.GetFileName(AnIndex: Integer): String;
begin
  Result := FDecompMemory.FileName[AnIndex];
end;

function TDecompMemoryStorage.GetFileStream(
  const AFileName: String): TStream;
var
  Index: Integer;
begin
  Index := GetFileIndex(AFileName);
  if Index  =  -1 then
  begin
    raise Exception.CreateFmt('Файл "%s" не существует', [AFileName]);
  end;

  Result := TMemoryStream32.Create;
  try
    Result.Size := FDecompMemory.FileSize[Index];
    FDecompMemory.Position := FDecompMemory.FileOffset[Index];
    Result.CopyFrom(FDecompMemory, FDecompMemory.FileSize[Index]);
    Result.Position := 0;
  except
    Result.Free;
    raise;
  end;
end;

function TDecompMemoryStorage.GetStorageName: String;
begin
  Result := FArchiveName;
end;

end.

