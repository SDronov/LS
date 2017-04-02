{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1226 $
  $Author: alexvolo $
  $Date: 2006-03-13 11:57:56 +0400 (РџРЅ, 13 РјР°СЂ 2006) $
}

unit LhaIntf;

interface

uses
  SysUtils, Classes;

const
  cMaxMessageLenth = 16384;

type
  ELhaException = class(Exception)
  public
    ErrorCode: Integer;
    constructor Create(AErrorCode: Integer; const AMessage: string);
  end;

  TLhaExtractor = class
  private
    MessageBuff: array [0..cMaxMessageLenth] of AnsiChar;
    FLhaName: string;
    function GetArchMessage: string;
  public
    // получить список файлов из архива
    procedure GetLhaFileList(var AFileList: TStrings);
    // распаковать архив
    procedure ExtractLha(const AExtractPath: string; const ASwitches: string = '');
    procedure CompressLha(const ASourceFile: string);
    constructor Create(const ALhaName: string);
    property ArchMessage: string read GetArchMessage;
  end;

  procedure ExtractLha(const LhaName: string; const ExtractPath: string);
  procedure GetLhaFileList(const LhaName: string; var FileList: TStrings);
  procedure CreateLha(LhaName: string; const FilePath: string); overload;
  procedure CreateLha(LhaName: string; const FileNames: TStrings); overload;

implementation

uses
  Windows, Forms, LhaDll, StrUtils;

{ TLhaExtractor }

constructor TLhaExtractor.Create(const ALhaName: string);
begin
  inherited Create;
  FLhaName := ALhaName;
end;

procedure TLhaExtractor.GetLhaFileList(var AFileList: TStrings);
var
  Archiver: HARC;
  MessageBuff: array [0..cMaxMessageLenth] of AnsiChar;
  SubInfo: INDIVIDUALINFO;
begin
  AFileList := TStringList.Create;

  if not UnlhaCheckArchive(PChar(FLhaName), CHECKARCHIVE_ALL) then
    raise ELhaException.Create(0, 'Архив не типа LZH или поврежден');

  Archiver := UnlhaOpenArchive(Application.MainForm.Handle, PChar(FLhaName), M_ERROR_MESSAGE_OFF);
  if Archiver <= 0 then
    raise ELhaException.Create(0, 'Не удалось открыть архив');

  try
    if UnlhaFindFirst(Archiver, MessageBuff, SubInfo) = 0 then
      repeat
        AFileList.Add(SubInfo.szFileName);
      until UnlhaFindNext(Archiver, SubInfo) <> 0;
  finally
    UnlhaCloseArchive(Archiver);
  end;
end;

{$WARN SYMBOL_PLATFORM OFF}

procedure TLhaExtractor.ExtractLha(const AExtractPath: string; const ASwitches: string = '');
var
  ErrorCode: Integer;
  S: string;
begin
  S := ExcludeTrailingBackSlash(Trim(AExtractPath)) + '\TMP00000.LZH';
  if CopyFile(PChar(FLhaName), PChar(S), FALSE) = TRUE then
    try
      FileSetAttr(S, 0);
    ErrorCode := Unlha(Application.MainForm.Handle,
    PChar(Format('e %s "%s" "%s\"', [ASwitches, PChar(S),
                     ExcludeTrailingBackSlash(Trim(AExtractPath))])),
    MessageBuff, cMaxMessageLenth);
     if ErrorCode <> 0 then
       raise ELhaException.Create(ErrorCode, 'Архив не типа LZH или поврежден'#13#10'Сообщение архиватора: '
           + string(MessageBuff));
    finally
      DeleteFile(PChar(S));
    end
  else
    raise ELhaException.Create(-1, 'Архив не найден: ' + FLhaName);
end;

function TLhaExtractor.GetArchMessage: string;
begin
  Result := PAnsiChar(@MessageBuff);
end;

procedure TLhaExtractor.CompressLha(const ASourceFile: string);
var
  fs: TFileStream;
  Buff: Pointer;
  Attrs: DWORD;
  DT: DWORD;
  Times: array [0..2] of FILETIME;
  ErrorCode: Integer;
begin
  fs := TFileStream.Create(ASourceFile, fmOpenRead or fmShareDenyWrite);
  Buff := nil;
  try
    GetMem(Buff, fs.Size);
    fs.Read(Buff^, fs.Size);
    Attrs := FileGetAttr(ASourceFile);
    if not GetFileTime(fs.Handle, @Times[0], @Times[1], @Times[2]) then
      raise ELhaException.Create(0, 'Невозможно получить дату/время файла');
    DT := Round(Int64(Times[2]) / 1e7) - 11644473600;
    ErrorCode := UnlhaCompressMem(Application.MainForm.Handle, PAnsiChar(FLhaName + ' ' + ASourceFile),
      Buff, fs.Size, @DT, @Attrs, nil);
    if ErrorCode <> 0 then
      raise ELhaException.Create(ErrorCode, 'При сжатии произошла ошибка');
  finally
    fs.Free;
    if Buff <> nil then
     FreeMem(Buff);
  end;
end;

{$WARN SYMBOL_PLATFORM ON}

procedure GetLhaFileList(const LhaName: string; var FileList: TStrings);
begin
  with TLhaExtractor.Create(LhaName) do
    try
      GetLhaFileList(FileList);
    finally
      Free;
    end;  
end;

procedure ExtractLha(const LhaName: string; const ExtractPath: string);
begin
  with TLhaExtractor.Create(LhaName) do
    try
      ExtractLha(IfThen(DirectoryExists(ExtractPath), ExtractPath,
        ExtractFileDir(LhaName)), '-m1 -c1 -n');
    finally
      Free;
    end;
end;

procedure CreateLha(LhaName: string; const FilePath: string);
begin
  if LhaName = '' then
    LhaName := ChangeFileExt(FilePath, '.lzh');
  with TLhaExtractor.Create(LhaName) do
    try
      CompressLha(FilePath);
    finally
      Free;
    end;
end;

procedure CreateLha(LhaName: string; const FileNames: TStrings);
var
  I: Integer;
begin
  with TLhaExtractor.Create(LhaName) do
    try
      for I := 0 to FileNames.Count - 1 do
        CompressLha(FileNames[I]);
    finally
      Free;
    end;
end;

{ ELhaException }

constructor ELhaException.Create(AErrorCode: Integer; const AMessage: string);
begin
  inherited Create(AMessage);
  ErrorCode := AErrorCode;
end;

initialization

end.
