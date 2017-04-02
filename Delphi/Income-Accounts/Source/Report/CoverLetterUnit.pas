unit CoverLetterUnit;

interface

uses
   ztvConsts,
   ztvBase;

{
  ���������� ����� ��������� ��������� ������.
}
function CoverLetterGetLastError: PChar; stdcall;

{
  ��������� ����� � �������� � ���� ��������� �����.

  � ������ ������ ������������ 0, � ������ ������ ������������
  ��������� ��������.
}
function CoverLetterMakeArchive(AFilesMask, AArchiveName: PChar): integer; stdcall;

{
  ��������� ����� �� ������.

  � ������ ������ ������������ 0, � ������ ������ ������������
  ��������� ��������.
}
function CoverLetterExtractArchive(AFilesMask, AExtractFolder, AArchiveName: PChar; DoDelArch: boolean = True): integer; stdcall;

{
  ��������� ������������ ����� � ���������������� ������ � ����.

  � ������ ������ ������������ 0, � ������ ������ ������������
  ��������� ��������.
}
function CoverLetterMakeTransportArchive(AFolder, ATransportFolder,
  AMsgArchiveFolder, AFilesMask, ASender, APerformer, AAddressee,
  AInfoType, ASenderTCode, AControlChar: PChar;
  const AnArchName: string= ''): integer; stdcall;

{
  ��������� ����� �� ������������� ������.

  � ������ ������ ������������ 0, � ������ ������ ������������
  ��������� ��������.
}
function CoverLetterExtractTransportArchive(AExtractFolder,
  AMsgArchiveFolder, AArchiveName, AFilesMask: PChar): integer; stdcall;


{
  ���������� ���� � ������� 41?.
}
function GetEncodedDate: string;

type
  TCompBaseClass = class of TCompBase;
  TUnBaseClass = class of TUnBase;

 procedure  RegistryArchive(const Ext: string; CompClass: TCompBaseClass; UnClass: TUnBaseClass);
 procedure  UnRegistryArchive(const Ext: string);
 function   GetUnArchiveFilter: string;
 function   CreateComp(const Ext: string): TCompBase;

implementation

uses
  Windows, Classes, SysUtils, DateUtils, ztvLha, ztvUnLha, ztvZip, ztvUnZip,
    ztvGbls, ztvUnRar;

var
  FCompList: TStrings;
  FUnList: TStrings;

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
     raise Exception.CreateFmt('�� ��������������� ��������� ��� ���������� "%s"', [Ext]);
  Result := AClass.Create(nil);
end;



function GetChar(i: integer): string;
const
  SChars = '~!()_-';
begin
  if i <= 9 then
    Result := IntToStr(i)
  else begin
    if i < 36 then
      Result := Chr(i-9+64)
    else
      Result := SChars[i-36+1];
    end;
end;

function DecTo41(Decimal: integer): string;
begin
  Result := '';
  if (Decimal div 41) > 0 then
    Result := DecTo41(Decimal div 41) + GetChar(Decimal mod 41)
  else
    Result := GetChar(Decimal mod 41);
  Result := UpperCase(Result);
end;

function GetEncodedDate: string;
var
Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  DecodeDateTime(Now, Year, Month, Day, Hour, Min, Sec, MSec);
  Result := DecTo41(Day*86400 + Hour*3600 + Min*60 + Sec);
  if Length(Result) < 4 then
    Result := StringOfChar('0', 4-Length(Result)) + Result;
end;

{ ������� ���������� �������� }
procedure EmptyDir(pDir : string);
var
  Srch : TSearchRec;
begin
{  if FindFirst(IncludeTrailingPathDelimiter(pDir)+'*.*', faAnyFile, Srch) = 0 then
     repeat
       if (Srch.Name='.') or (Srch.Name='..') then Continue;
       if faDirectory in [Srch.Attr] then
       begin
         EmptyDir(IncludeTrailingPathDelimiter(pDir)+Srch.Name);
         if not RemoveDir(IncludeTrailingPathDelimiter(pDir)+Srch.Name) then raise Exception.CreateFmt('������ �������� �������� %s', [IncludeTrailingPathDelimiter(pDir)+Srch.Name]);
       end
       else
         if not DeleteFile(IncludeTrailingPathDelimiter(pDir)+Srch.Name) then raise Exception.CreateFmt('������ �������� ����� %s', [IncludeTrailingPathDelimiter(pDir)+Srch.Name]);
     until FindNext(Srch) <> 0;
     FindClose(Srch);}
end;

const
  {
    ������ �������� ��� ���������� ������ � Dos. ������������������
    �������� ������������� ������� ��������� ����� �������� �������������
    �� ���� ������������� ������� �� ������� ����� ������� ������ ����
   ..����� ��������� �� ������� ��������..
  }
  //                  �   =   T   �   ||  |  ||-  +  -|| ||-  -   +  -||  L  _|_ _||
  cDelimiterCodes = #201#205#209#187#186#179#204#216#185#199#196#197#182#200#207#188;

  { ��������� �������� ������ �� ��������� }
  cSrcTempName = 'outbuf'; 	// ��� �������� ��� �������� ��������
  cMaxGroupSize = 150000000;		// ������������ ������ ���������, ����
  cErrorOnFileDoesntFit = false;	// �������� ������, ���� ��������� ���� ��������� ������������ ������ ���������

  { ������� ������� ����������������� ������ }
  cNoWidth   = 6;
  cNameWidth = 14;
  cSizeWidth = 14;
  cTypeWidth = 41;
  cCoverWidth = cNoWidth + cNameWidth + cSizeWidth + cTypeWidth + 5;

  { ���������� ������ ������������� ������ }
  SCoverFileExt   = '.(s)';
  SArchiveFileExt = '.lzh';

type

  { TTransportArchive }
  TTransportArchive = class(TObject)
  private
    FName: string;

    function GetArchiveFileName: string;
    function GetArchiveFileNameShort: string;
    function GetCoverFileName: string;
    function GetCoverFileNameShort: string;
    function GetOutArchiveFileName: string;
    function GetOutCoverFileName: string;

    procedure Init;
    function CreateArchive: boolean;
    procedure CreateCover;
    function GetMsgArchiveFileName: string;
    function GetMsgCoverFileName: string;
  public
    Folder: string;
    TransportFolder: string;
    MsgArchiveFolder: string;
    FileMask: string;
    Sender: string;
    Performer: string;
    Addressee: string;
    InfoType: string;
    SenderTCode: string;
    ControlChar: Char;

    procedure Make;

    property ArchiveFileName: string read GetArchiveFileName;
    property ArchiveFileNameShort: string read GetArchiveFileNameShort;
    property CoverFileName: string read GetCoverFileName;
    property CoverFileNameShort: string read GetCoverFileNameShort;
    property OutArchiveFileName: string read GetOutArchiveFileName;
    property OutCoverFileName: string read GetOutCoverFileName;
    property MsgArchiveFileName: string read GetMsgArchiveFileName;
    property MsgCoverFileName: string read GetMsgCoverFileName;
  end;

const
  cMaxIterations = 10;

var
  LastError: string;


type
  TLzh = class(TLha)
  public
   constructor Create(AOwner: TComponent); override;
  end;

procedure DelFile(AFile: string);
begin
  if FileExists(AFile) and
     (
       (not FileSetReadOnly(AFile, False)) or
       (not SysUtils.DeleteFile(AFile))
     ) then
    raise Exception.CreateFmt('�� ������� ������� ���� %s. ', [AFile]);
end;

procedure CopyFile(AOldFile, ANewFile: string);
begin
  DelFile(ANewFile);
  if (not FileSetReadOnly(AOldFile, False)) or
     (not Windows.CopyFile(PChar(AOldFile), PChar(ANewFile), False)) then
    raise Exception.CreateFmt(
      '�� ������� ����������� ���� %s � ���� %s',
      [AOldFile, ANewFile]);
end;

procedure MoveFile(AOldFile, ANewFile: string);
begin
  DelFile(ANewFile);
  if (not FileSetReadOnly(AOldFile, False)) or
     (not RenameFile(AOldFile, ANewFile)) then
    raise Exception.CreateFmt(
      '�� ������� ����������� ���� %s � ���� %s',
      [AOldFile, ANewFile]);
end;

function CoverLetterGetLastError: PChar;
begin
  Result := PChar(LastError);
end;

function CoverLetterMakeArchive(AFilesMask, AArchiveName: PChar): integer;
var
  ArName: string;
  FiName: string;
  lhaIterationCount: integer;

  procedure Pack;
  var
    lha: TCompBase;
    lhatedCount: integer;
    Errors: boolean;
  begin
    Errors := False;
    lhatedCount := 0;

    { ������� ����� }
    try
      lha := TLzh.Create(nil);
      try
        lha.ArchiveFile := ArName;
        lha.RecurseDirs := False;
        lha.Switch := swMove;
        lha.FileSpec.Add(FiName);
        if Trim(lha.FileSpec.Text) <> '' then
          lhatedCount := lha.Compress;
      finally
        FreeAndNil(lha);
      end;
    except
      Errors := True;
    end;

    { ������� ������ ����� ���� ����� � �������� }
    if (lhatedCount = 0) or Errors then
      DelFile(ArName);
  end;

begin
  try
    { ���������� ���� ������ }
    Result := 0;

    { ������������ ����� ������ ���� �� �� ���������� }
    ArName := ChangeFileExt(AArchiveName, SArchiveFileExt);
    FiName := AFilesMask;
    if not FileExists(ArName) then
    begin
      lhaIterationCount := 0;
      repeat
        Pack;
        Inc(lhaIterationCount);
      until (FileExists(ArName)) or
            (lhaIterationCount >= cMaxIterations);
    end;        
  except
    on E: Exception do begin
      LastError := Format('������ ������������ ������ ������ %s.'#10#13+
        E.Message, [AFilesMask]);
      Result := 1;
    end;
  end;
end;

function CoverLetterExtractArchive(AFilesMask, AExtractFolder, AArchiveName: PChar; DoDelArch: boolean): integer; stdcall;
var
  UnlhaIterationCount: integer;
  UnlhaError: boolean;

  procedure Unpack;
  var
    Unlha: TUnBase;
  begin
    try
      Unlha := GetUnClassFor(ExtractFileExt(AArchiveName)).Create(nil);
      try
        UnlhaError := False;
        Unlha.ArchiveFile := AArchiveName;
        Unlha.RecurseDirs := False;
        Unlha.ConfirmOverwrites := False;
        Unlha.OverwriteMode := omOverwrite;
        Unlha.ExtractDir  := IncludeTrailingPathDelimiter(AExtractFolder);
        Unlha.FileSpec.Add(AFilesMask);
        if Trim(Unlha.FileSpec.Text) <> '' then
          Unlha.Extract;
      finally
        FreeAndNil(Unlha);
      end;
    except
      on E:Exception do
      begin
        UnlhaError := True;
      end;
    end;
  end;

begin
  try
    { ���������� ���� ������ }
    Result := 0;

    { ������� ����� �� ������ }
    UnlhaIterationCount := 0;
    if FileExists(AArchiveName) then
      repeat
        Unpack;
        Inc(UnlhaIterationCount);
      until (not UnlhaError) or
            (UnlhaIterationCount >= cMaxIterations);

    { ������� ����� }
    if DoDelArch then
      DelFile(AArchiveName);
  except
    on E: Exception do begin
      LastError := Format('������ ���������� ������ %s �� ������ %s.'#10#13+
        E.Message, [AFilesMask, AArchiveName]);
      Result := 1;
    end;
  end;
end;

{ �������� ����� �� ������ �������� � ������ }
function CopyFileList(SrcFolder : string; DestFolder : string; FileList : TStringList) : integer;
var
  i : integer;
begin
  try
    ForceDirectories(DestFolder);
    for i:=0 to FileList.Count-1 do
      CopyFile(IncludeTrailingPathDelimiter(SrcFolder)+FileList[i], IncludeTrailingPathDelimiter(DestFolder)+FileList[i]);
  except
    on E:Exception do raise Exception.CreateFmt('������ ����������� ������ �� %s � ������� %s', [SrcFolder, DestFolder]);
  end;
end;

{ �������� �������� ������ �� ������ �������� �� ����� cMaxGroupSize, �������� ������� }
function CoverLetterMakeTransportArchive(AFolder, ATransportFolder,
  AMsgArchiveFolder, AFilesMask, ASender, APerformer, AAddressee,
  AInfoType, ASenderTCode, AControlChar: PChar;
  const AnArchName: string): integer;
var
  TransportArchive : TTransportArchive;
  Srch : TSearchRec;
  i, j : integer;
  _FSize : PInteger;
  TempFolder : string; 			// ��������� ������� ��� �������� �����
  SrcFileList : TStringList;	// ������ �������� ������
  TempFileList : TStringList; // ������ ������ ������� ������
  FileGroupSize : Int64;      // ������ ������� ������
  AddToGroup, ProcessGroup : boolean;
  MaxGroupSize : Int64;			// ������������ ������ ������ �������� ������ ��� �������� ������
  ErrorOnFileDoesntFit : boolean;	// �������� ������, ���� ��������� ���� ��������� ������������ ������ ���������

begin
try

  MaxGroupSize := cMaxGroupSize;
  ErrorOnFileDoesntFit := cErrorOnFileDoesntFit;

  // ������ ���� � ���������� ��������
  TempFolder := IncludeTrailingPathDelimiter(AFolder)+cSrcTempName;

  // ������ � ���������� ������ �������� ������
  SrcFileList := TStringList.Create;
  if FindFirst(IncludeTrailingPathDelimiter(AFolder)+AFilesMask, faAnyFile, Srch) = 0 then
  repeat
    if ((Srch.Name='.') or (Srch.Name='..')) then Continue;
    new(_FSize);
    _FSize := pointer(Srch.Size);
    SrcFileList.AddObject(Srch.Name, pointer(_FSize)); // ������ �����
  until FindNext(Srch) <> 0;
  FindClose(Srch);
  SrcFileList.Sort;

  // ������������ ����� �������� �� ����� MaxGroupSize; �������� �������

  FileGroupSize := 0;
  TempFileList := TStringList.Create;

  // ���� �� ������ �������� ������
  i := 0;
  ProcessGroup := false;
  while (i <= SrcFileList.Count-1) do
  begin
    if (Integer(SrcFileList.Objects[i]) > MaxGroupSize) and ErrorOnFileDoesntFit then
      raise Exception.CreateFmt('�������� ���� %s ��������� ������������ ������ ���������', [SrcFileList[i]]);
    AddToGroup :=
    	(FileGroupSize + Integer(SrcFileList.Objects[i]) <= MaxGroupSize) or
    	((TempFileList.Count = 0) and (ErrorOnFileDoesntFit = false));

    ProcessGroup :=
      (FileGroupSize + Integer(SrcFileList.Objects[i]) >= MaxGroupSize) or
      (i = SrcFileList.Count-1);

    if AddToGroup then
    begin
      // �������� ���� � ������
      TempFileList.Add(SrcFileList[i]); // ���������� ����� � ������
      inc(FileGroupSize, Integer(SrcFileList.Objects[i]));
      inc(i);
    end;

    if ProcessGroup then
    begin
      CopyFileList(AFolder, TempFolder, TempFileList);
      TransportArchive := TTransportArchive.Create;
      try
        TransportArchive.FName 				:= AnArchName;
        TransportArchive.Folder           := TempFolder;
        TransportArchive.TransportFolder  := ATransportFolder;
        TransportArchive.MsgArchiveFolder := AMsgArchiveFolder;
        TransportArchive.FileMask         := AFilesMask;
        TransportArchive.Sender           := ASender;
        TransportArchive.Performer        := APerformer;
        TransportArchive.Addressee        := AAddressee;
        TransportArchive.InfoType         := AInfoType;
        TransportArchive.SenderTCode      := ASenderTCode;
        TransportArchive.ControlChar      := string(AControlChar)[1];
        TransportArchive.Make;
      finally
        TransportArchive.Free;
      end;

      for j := 0 to TempFileList.Count-1 do
        DeleteFile(IncludeTrailingPathDelimiter(AFolder)+TempFileList[j]);
      TempFileList.Clear;
      //EmptyDir(TempFolder); ������� ��������� � ��� ������� ������� � �����������. �� ���������� ������� :)
      FileGroupSize := 0;
      ProcessGroup := false;
    end;
  end;
  finally
    SrcFileList.Free;
    TempFileList.Free;
    RemoveDir(TempFolder);
  end;

  Result := 0;
end;

function CoverLetterExtractTransportArchive(AExtractFolder,
  AMsgArchiveFolder, AArchiveName, AFilesMask: PChar): integer;
var
  ArchiveFileName: string;
  MsgArchiveFolder: string;
  InArchiveFileName: string;
  MsgArchiveFileName: string;
  MsgCoverFileName: string;
  CoverFileName: string;
  UnlhaIterationCount: integer;
  UnlhaError: boolean;

  procedure Unpack;
  var
    Unlha: TUnBase;
  begin
    try
      Unlha := TUnlha.Create(nil);
      try
        UnlhaError := False;
        Unlha.ArchiveFile := InArchiveFileName;
        Unlha.RecurseDirs := False;
        Unlha.ConfirmOverwrites := False;
        Unlha.OverwriteMode := omOverwrite;
        Unlha.ExtractDir  := IncludeTrailingPathDelimiter(ExtractFilePath(InArchiveFileName));
        Unlha.FileSpec.Add(AFilesMask);
        if Trim(Unlha.FileSpec.Text) <> '' then
          Unlha.Extract;
      finally
        FreeAndNil(Unlha);
      end;
    except
      on E:Exception do
      begin
        UnlhaError := True;
      end;
    end;
  end;

begin
  try
    try
      { ���������� ���� ������ }
      Result := 0;

      { �������� � �������� �� ������� ���������
        ������ ������� ������ ����� 1 ������ }
      if FileDateToDateTime(FileAge(AArchiveName)) + 1/24/60 > Now then
        Exit;

      { ���������� � ���������� ������ }
      ArchiveFileName    := ChangeFileExt(AArchiveName, SArchiveFileExt);
      CoverFileName      := ChangeFileExt(AArchiveName, SCoverFileExt);
      InArchiveFileName  := IncludeTrailingPathDelimiter(AExtractFolder) + ExtractFileName(ArchiveFileName);
      MsgArchiveFolder   := IncludeTrailingPathDelimiter(AMsgArchiveFolder);
      MsgArchiveFileName := MsgArchiveFolder + ExtractFileName(ArchiveFileName);
      MsgCoverFileName   := MsgArchiveFolder + ExtractFileName(CoverFileName);

      { ����������� ������������ ����� � ����� ���������� }
      if ArchiveFileName <> InArchiveFileName then
        CopyFile(ArchiveFileName, InArchiveFileName);

      { ������� ����� �� ���������� ������ }
      UnlhaIterationCount := 0;
      if FileExists(InArchiveFileName) then
        repeat
          Unpack;
          Inc(UnlhaIterationCount);
        until (not UnlhaError) or
              (UnlhaIterationCount >= cMaxIterations);

      { ����������� ������������ ����� �
        ���������������� ������ � ����� ������

        ������� ������������� ����� ����������������� ������
        �����������, �. �. ��� ������� ������������ ��� ����������
        � ��� ����� � ������� ������� ��� ���������������� ����� }
      MoveFile(ArchiveFileName, MsgArchiveFileName);
      if FileExists(CoverFileName) then
        MoveFile(CoverFileName, MsgCoverFileName);
    finally
      { ������� ��������� ����� }
      DelFile(InArchiveFileName);
    end;  
  except
    on E: Exception do begin
      LastError := Format('������ ���������� ������ %s �� ������������� ������ %s.'#10#13+
        E.Message, [AFilesMask, AArchiveName]);
      Result := 1;
    end;
  end;
end;

function AnsiToOem(const AnsiStr: string): string;
begin
  SetLength(Result, Length(AnsiStr));
  if Length(Result) > 0 then
    CharToOem(PChar(AnsiStr), PChar(Result));
end;

function Delim(i: integer): char;
begin
  Result := cDelimiterCodes[i];
end;

function CenterString(const AStr: string; const ALength: integer): string;
var
  LeftShift: integer;
begin
  LeftShift := (ALength - Length(AStr)) div 2;
  Result := AnsiToOem(
    StringOfChar(' ', LeftShift) +
    Copy(AStr, 1, ALength) +
    StringOfChar(' ', ALength - LeftShift - (Length(AStr)))
  );
end;

function GetFileSize(const AFileName: string): integer;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(AFileName, faAnyFile, SearchRec) = 0 then
    Result := SearchRec.Size
  else
    Result := 0;
end;

{ TTransportArchive }

function TTransportArchive.GetArchiveFileName: string;
begin
  Result := Folder + ArchiveFileNameShort;
end;

function TTransportArchive.GetArchiveFileNameShort: string;
begin
  Result := FName + SArchiveFileExt;
end;

function TTransportArchive.GetCoverFileName: string;
begin
  Result := Folder + CoverFileNameShort;
end;

function TTransportArchive.GetCoverFileNameShort: string;
begin
  Result := FName + SCoverFileExt;
end;

function TTransportArchive.GetOutArchiveFileName: string;
begin
  Result := TransportFolder + ArchiveFileNameShort;
end;

function TTransportArchive.GetOutCoverFileName: string;
begin
  Result := TransportFolder + CoverFileNameShort;
end;

function TTransportArchive.GetMsgArchiveFileName: string;
begin
  Result := MsgArchiveFolder + ArchiveFileNameShort;
end;

function TTransportArchive.GetMsgCoverFileName: string;
begin
  Result := MsgArchiveFolder + CoverFileNameShort;
end;

function TTransportArchive.CreateArchive: boolean;
var
  lhaIterationCount: integer;

  procedure Pack;
  var
    lha: TCompBase;
    lhatedCount: integer;
    Errors: boolean;
    err : string;
  begin
    Errors := False;
    lhatedCount := 0;

    { ������� ����� }
    try
      lha := TLzh.Create(nil);
      try
        lha.ArchiveFile := ArchiveFileName;
        lha.RecurseDirs := False;
        lha.Switch := swMove;
        lha.FileSpec.Add(Folder + FileMask);
        if Trim(lha.FileSpec.Text) <> '' then
          lhatedCount := lha.Compress;
      finally
        FreeAndNil(lha);
      end;
    except
      Errors := True;
    end;

    { ������� ������ ����� ���� ����� � �������� }
    if (lhatedCount = 0) or Errors then
      DelFile(ArchiveFileName);
  end;

begin
  Result := False;
  try
    { ����������� ����� ����� ������ ���� �� �� ���������� ����
      ���������� ����� 1 ������ � ����� ���� ������ }
    if (not FileExists(ArchiveFileName)) or
		(FileDateToDateTime(FileAge(ArchiveFileName)) + 1/24/60 < Now) then
    begin

      { ������� ������ ����� ���� �� ���������� }
      DelFile(ArchiveFileName);

      { ������������ ����� ����� }
      lhaIterationCount := 0;
      repeat
        Pack;
        Inc(lhaIterationCount);
      until (FileExists(ArchiveFileName)) or
            (lhaIterationCount >= cMaxIterations);

      { ����������� ����� � �����
        ������ � ����������� ��� � ����� ���������� }
      if (FileExists(ArchiveFileName)) then
      begin
        CopyFile(ArchiveFileName, MsgArchiveFileName);
        MoveFile(ArchiveFileName, OutArchiveFileName);
      end;

      { ����������� �� ������������ ����� � ����� ���������� }
      Result := FileExists(OutArchiveFileName);
    end
    else
    begin
    end;
  except
    on E: Exception do begin
      DelFile(ArchiveFileName);
      E.Message := '������ �������� ������ � ������������ �����.'#10#13+E.Message;
      raise;
    end;
  end;
end;

procedure TTransportArchive.CreateCover;
var
  Cover: TStringList;
  fno, fname, fdscr, fsize: string;
begin
  try
    Cover := TStringList.Create;
    try
      { ������������ ��������� }
      Cover.Add(CenterString('���������������� �������� ' + CoverFileNameShort          , cCoverWidth));
      Cover.Add(CenterString('���������: ' + FormatDateTime('DD-MM-YY � HH:MM:SS', Now) , cCoverWidth));
      Cover.Add(CenterString('---------------------------------------------------------', cCoverWidth));
      Cover.Add(CenterString(Sender                                                     , cCoverWidth));
      Cover.Add(CenterString('�����������: ' + Performer                                , cCoverWidth));
      Cover.Add(CenterString('����: ' + Addressee                                       , cCoverWidth));
      Cover.Add(CenterString(' '                                                        , cCoverWidth));

      { ������������ ����� ������� }
      Cover.Add(Delim(1)+   StringOfChar(Delim(2),cNoWidth)   +Delim(3)+   StringOfChar(Delim(2)   ,cNameWidth)   +Delim(3)+   StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(3)+   StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(4));
      Cover.Add(Delim(5)+   CenterString('�'     ,cNoWidth)   +Delim(6)+   CenterString('��� �����',cNameWidth)   +Delim(6)+   CenterString('������ �����',cSizeWidth)   +Delim(6)+   CenterString('��� ����������',cTypeWidth)   +Delim(5));
      Cover.Add(Delim(5)+   CenterString('��'    ,cNoWidth)   +Delim(6)+   CenterString(' '        ,cNameWidth)   +Delim(6)+   CenterString('(����)'      ,cSizeWidth)   +Delim(6)+   CenterString(' '             ,cTypeWidth)   +Delim(5));
      Cover.Add(Delim(7)+   StringOfChar(Delim(2),cNoWidth)   +Delim(8)+   StringOfChar(Delim(2)   ,cNameWidth)   +Delim(8)+   StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(8)+   StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(9));

      { ������������ ���������� ������� }
      fno   := IntToStr(1);
      fname := ArchiveFileNameShort;
      fdscr := InfoType;
      fsize := IntToStr(GetFileSize(OutArchiveFileName));
      Cover.Add(Delim(5) +  CenterString(fno     ,cNoWidth)   +Delim(6)+   CenterString(fname      ,cNameWidth)   +Delim(6)+   CenterString(fsize         ,cSizeWidth)   +Delim(6)+   CenterString(fdscr           ,cTypeWidth)   +Delim(5));
      Cover.Add(Delim(14)+  StringOfChar(Delim(2),cNoWidth)   +Delim(15)+  StringOfChar(Delim(2)   ,cNameWidth)   +Delim(15)+  StringOfChar(Delim(2)      ,cSizeWidth)   +Delim(15)+  StringOfChar(Delim(2)        ,cTypeWidth)   +Delim(16));

      { ��������� ���������������� ������ }
      Cover.SaveToFile(CoverFileName);
    finally
      Cover.Free;
    end;


    { ����������� ���������������� ������ � �����
      ������ � ����������� ��� � ����� ���������� }
    if (FileExists(CoverFileName)) then
    begin
      CopyFile(CoverFileName, MsgCoverFileName);
      MoveFile(CoverFileName, OutCoverFileName);
    end;

    { ������������ �� ���������������� ������ � ����� ���������� }
    if not FileExists(OutCoverFileName) then
      raise Exception.Create('�� ������������ ���������������� ������ � ����� ����������');
  except
    on E: Exception do begin
      DelFile(CoverFileName);
      E.Message := '������ ������������ ����������������� ������ � ������������� ������.'#10#13+E.Message;
      raise;
    end;
  end;
end;

procedure TTransportArchive.Init;
var
  CurrentTime : TDateTime;
begin
  if FName = '' then
  begin
   CurrentTime := Now;
   while SecondsBetween(CurrentTime, Now)<1 do;

   FName := SenderTCode + ControlChar + GetEncodedDate;
  end;
  Folder := IncludeTrailingPathDelimiter(Folder);
  TransportFolder := IncludeTrailingPathDelimiter(TransportFolder);
end;

procedure TTransportArchive.Make;
begin
  Init;
  if CreateArchive then
    CreateCover
  else
end;

constructor TLzh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fMasterExt := '.LZH';
  DefaultExt := fMasterExt;
  CompressMethodState := [cmStore, cmFrozen5];
  CompressMethod := cmFrozen5;
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
  Result := Format('�������� �����  (%s)|%s', [S, S]);
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
end;

procedure Finalize;
begin
  FreeAndNil(FCompList);
  FreeAndNil(FUnList);
end;

initialization
    Initialize;

finalization
    Finalize;


end.
