{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: MainFrm.pas $
  $Revision: 2470 $
  $Author: alexvolo $
  $Date: 2007-03-29 16:48:54 +0400 (Р§С‚, 29 РјР°СЂ 2007) $
}
unit ArchUtils;

interface

uses
   ztvBase;

type
  TCompBaseClass = class of TCompBase;
  TUnBaseClass = class of TUnBase;

 procedure  RegistryArchive(const Ext: string; CompClass: TCompBaseClass; UnClass: TUnBaseClass);
 procedure  UnRegistryArchive(const Ext: string);
 function   GetUnArchiveFilter: string;
 procedure ExtractArchive(const AFilesMask, AExtractFolder, AArchiveName: String); overload;
 procedure ExtractArchive(const AFilesMask, AExtractFolder, AArchiveName, APassword: String); overload;
 function  OpenArchive(const AFileName: string; const AFileMask: String = '*.*'): TUnBase;
// function   CreateComp(const Ext: string): TCompBase;

implementation

uses
  Windows, Classes, SysUtils, ztvConsts, ztvLha, ztvUnLha, ztvZip, ztvUnZip,
    ztvGbls, ztvUnRar, ztvUnArj;

var
  FCompList: TStrings;
  FUnList: TStrings;

type
  TLzh = class(TLha)
  public
   constructor Create(AOwner: TComponent); override;
  end;

procedure  RegistryArchive(const Ext: string; CompClass: TCompBaseClass; UnClass: TUnBaseClass);
begin
  if FCompList.IndexOf(Ext) < 0 then
  begin
    FCompList.AddObject(Ext, TObject(CompClass));
    FUnList.AddObject(Ext, TObject(UnClass));
  end;
end;

procedure  UnRegistryArchive(const Ext: string);
  procedure RemoveStr(List: TStrings; const S: string);
  var
    I: Integer;
  begin
   I := List.IndexOf(S);
   if I > 0 then
     List.Delete(I);
  end;
begin
  RemoveStr(FCompList, Trim(Ext));
  RemoveStr(FUnList, Trim(Ext));
end;

function GetUnClassFor(const Ext: string): TUnBaseClass;
var
  S: string;
  I: Integer;
begin
  if (Ext <> '') and (Ext[1] = '.') then
     S := Copy(Ext, 2, MaxInt)
  else
     S := Ext;
  I := FUnList.IndexOf(Trim(S));
  Result := TUnBaseClass(FUnList.Objects[I]);
end;

function FindCompClass(const Ext: string): TCompBaseClass;
var
  S: string;
  I: Integer;
begin
  if (Ext <> '') and (Ext[1] = '.') then
     S := Copy(Ext, 2, MaxInt)
  else
     S := Ext;
  I := FCompList.IndexOf(Trim(S));
  Result := TCompBaseClass(FCompList.Objects[I]);
end;

function CreateComp(const Ext: string): TCompBase;
var
 AClass: TCompBaseClass;
begin
  AClass := FindCompClass(Ext);
  if AClass = nil then
     raise Exception.CreateFmt('Не зарегистрирован архиватор для расширения "%s"', [Ext]);
  Result := AClass.Create(nil);
end;

constructor TLzh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fMasterExt := '.LZH';
  DefaultExt := fMasterExt;
  //CompressMethodState := [cmStore, cmFrozen5];
  CompressMethod := cmFrozen6;
  fArcType := atLzh;
end;

function   GetUnArchiveFilter: string;
var
  S: string;
  I: integer;
begin
  for I := 0 to FUnList.Count - 1  do
  begin
    if FUnList.Objects[I] <> nil then
      S := S + ';*.' + FUnList[I];
  end;
  S := Copy(S, 2, MaxInt);
  Result := Format('Архивные файлы  (%s)|%s', [S, S]);
end;

procedure Initialize;
  function CreateStringList: TStringList;
  begin
     Result := TStringList.Create;
     Result.CaseSensitive := False;
     Result.Duplicates := dupError;
  end;
begin
  FCompList := CreateStringList;
  FUnList := CreateStringList;
  RegistryArchive('lzh', TLzh, TUnLha);
  RegistryArchive('lha', TLha, TUnLha);
  RegistryArchive('zip', TZip, TUnZip);
  RegistryArchive('rar', nil, TUnRar);
  RegistryArchive('arj', nil, TUnArj);
end;

procedure Finalize;
begin
  FreeAndNil(FCompList);
  FreeAndNil(FUnList);
end;

type
  TExceptionTrap = record
    E: Exception;
  end;
  PExceptionTrap = ^TExceptionTrap;

procedure UnpackError(ETrap: PExceptionTrap; Sender: TObject; FileName,
  ExtendedMsg, VolumeID: String; ECode: Integer);
begin
  ETrap.E := E_RAISE.CreateRes(ECode);
end;

procedure ExtractArchive(const AFilesMask, AExtractFolder, AArchiveName: String);
  procedure Unpack;
  var
    Unlha: TUnBase;
    AnOnError: TMethod;
    ETrap: TExceptionTrap;
  begin
      Unlha := GetUnClassFor(ExtractFileExt(AArchiveName)).Create(nil);
      try
        ETrap.E := nil;
        AnOnError.Data := @ETrap;
        AnOnError.Code := @UnpackError;
        Unlha.ArchiveFile := AArchiveName;
        Unlha.OnError :=  TOnError(AnOnError);
        Unlha.RecurseDirs := False;
        Unlha.ConfirmOverwrites := False;
        Unlha.OverwriteMode := omOverwrite;
        Unlha.ExtractDir  := IncludeTrailingPathDelimiter(AExtractFolder);
        Unlha.FileSpec.Add(AFilesMask);
        if Trim(Unlha.FileSpec.Text) <> '' then
          Unlha.Extract;
        if assigned(ETrap.E) then
          raise ETrap.E;
      finally
        FreeAndNil(Unlha);
      end;
  end;

begin
  if FileExists(AArchiveName) then
  try
     Unpack;
  except
    on E: Exception do
      raise Exception.CreateFmt('<<Ошибка извлечения файлов>>.<<Ошибка извлечения файлов %s из архива %s.>>'#10#13+
        E.Message, [AFilesMask, AArchiveName]);
  end;
end;

procedure ExtractArchive(const AFilesMask, AExtractFolder, AArchiveName, APassword: String);
  procedure Unpack;
  var
    Unlha: TUnBase;
    AnOnError: TMethod;
    ETrap: TExceptionTrap;
  begin
      Unlha := GetUnClassFor(ExtractFileExt(AArchiveName)).Create(nil);
      try
        ETrap.E := nil;
        AnOnError.Data := @ETrap;
        AnOnError.Code := @UnpackError;
        Unlha.ArchiveFile := AArchiveName;
        Unlha.Password := APassword;
        Unlha.OnError :=  TOnError(AnOnError);
        Unlha.RecurseDirs := False;
        Unlha.ConfirmOverwrites := False;
        Unlha.OverwriteMode := omOverwrite;
        Unlha.ExtractDir  := IncludeTrailingPathDelimiter(AExtractFolder);
        Unlha.FileSpec.Add(AFilesMask);
        if Trim(Unlha.FileSpec.Text) <> '' then
          Unlha.Extract;
        if assigned(ETrap.E) then
          raise ETrap.E;
      finally
        FreeAndNil(Unlha);
      end;
  end;

begin
  if FileExists(AArchiveName) then
  try
     Unpack;
  except
    on E: Exception do
      raise Exception.CreateFmt('<<Ошибка извлечения файлов>>.<<Ошибка извлечения файлов %s из архива %s.>>'#10#13+
        E.Message, [AFilesMask, AArchiveName]);
  end;
end;


function  OpenArchive(const AFileName: string; const AFileMask: String): TUnBase;
begin
  Result := GetUnClassFor(ExtractFileExt(AFileName)).Create(nil);
  try
    Result.ArchiveFile := AFileName;
    Result.FileSpec.CommaText := AFileMask;
  except
    Result.Free;
    raise;
  end;
end;

initialization
    Initialize;

finalization
    Finalize;


end.
