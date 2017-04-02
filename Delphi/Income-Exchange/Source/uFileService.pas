unit uFileService;

interface

uses
  SysUtils, Classes, uOptions, uInterfaces, ztvregister, ztvBase, ztvZipTV,
  ztvUnLha;

type
  // Упаковщик
  TPackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall;
  TUnpackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean; stdcall;
  TCreateTxt = function(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean; stdcall;

  TdmFileService = class(TDataModule, IFileService)
    ZipTV: TZipTV;
    UnLha: TUnLha;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    // Упаковщик
    PackerDLLHandle : THandle;
    fPackData       : TPackData;
    fUnpackData     : TUnpackData;
    fCreateTxt      : TCreateTxt;

    fOptions : TieOptions;
    fDBService : IDBService;

    // Упаковщик
    function PackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer;
    function UnpackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean;
    function CreateTxt(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean;

    // Обработка файлов в каталоге
    procedure ProcessDir(const SrcDir, ArchDir: string; DoArchFile: boolean);

  public
    { Public declarations }
    property Options : TieOptions read fOptions write fOptions;

    property DBService : IDBService read fDBService write fDBService;

    procedure ExecRequests;

    procedure SendStream(
       AStream : TStream;
       ACustomsCode : string;
       ACustomsName, ASrcCustomsName : string;
       ACustomsCodeTTT : string;
       ASoftCode : string;
       AEnvelopID : Integer
      );
  end;

var
  dmFileService: TdmFileService;

procedure MoveFile(const AFileName, ADestPath : string);

implementation

{$R *.dfm}

uses
  Windows, Log4D;

procedure MoveFile(const AFileName, ADestPath : string);
  var
    fSrc, fDst : TFileStream;
    NewFileName: string;
begin
  NewFileName := IncludeTrailingPathDelimiter(ADestPath)+ExtractFileName(AFileName);
  fSrc := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    fDst := TFileStream.Create(NewFileName, fmCreate or fmShareDenyRead);
    try
      fDst.CopyFrom(fSrc, fSrc.Size);
    finally
      FreeAndNil(fDst);
    end;
  finally
    FreeAndNil(fSrc);
  end;
  SysUtils.DeleteFile(AFileName);
end;

function TdmFileService.CreateTxt(Dir, FileName, CustomsName, TypeInfo,
  CustomsCode, ReceiverName, Performer, Currency: PChar): Boolean;
begin
  if Assigned( fCreateTxt ) then
    begin
      //DoLog( 'Формирование сопроводительного файла: файл - ' + Dir + '\' + FileName );
      Result := fCreateTxt( Dir, FileName, CustomsName, TypeInfo, CustomsCode, ReceiverName, Performer, Currency );
    end
  else
    ; //DoLog( 'Формирование сопроводительного файла не возможна: функция формирования не назначена.' );
end;

procedure TdmFileService.DataModuleCreate(Sender: TObject);
begin
  PackerDLLHandle := LoadLibrary('packer.dll');
  if PackerDLLHandle = 0 then
    raise Exception.Create(
        'Ошибка при загрузки библиотеки упаковщика (packer.dll): ' + IntToStr( GetLastError ) + '.'#$D#$A
      );

  fPackData   := GetProcAddress(PackerDLLHandle, 'PackData');
  fUnpackData := GetProcAddress(PackerDLLHandle, 'UnpackData');
  fCreateTxt  := GetProcAddress(PackerDLLHandle, 'CreateTxt');

  if @fPackData   = nil then
    raise Exception.Create( 'Ошибка доступа к функции PackData из библиотеки packer.dll.'#$D#$A );
  if @fUnpackData = nil then
    raise Exception.Create( 'Ошибка доступа к функции UnpackData из библиотеки packer.dll.'#$D#$A );
  if @fCreateTxt  = nil then
    raise Exception.Create( 'Ошибка доступа к функции CreateTxt из библиотеки packer.dll.' );
end;

procedure TdmFileService.ExecRequests;
begin
  with fOptions do
    begin
      if PrivilegesEnebled then
        ProcessDir(PrivilegesDirIn, PrivilegesDirArc, PrivilegesDoArc);
      if DebtEnebled then
        ProcessDir(DebtDirIn, DebtDirArc, DebtDoArc);
      if FinesEnebled then
        ProcessDir(FinesDirIn, FinesDirArc, FinesDoArc);
      if CostEnebled then
        ProcessDir(CostDirIn, CostDirArc, CostDoArc);
    end;
end;

function TdmFileService.PackData(ArchDir, ArchName, FileDir,
  FileName: PChar): Integer;
begin
  if Assigned( fPackData ) then
    begin
      //DoLog( 'Упаковка данных: каталог - ' + FileDir + ', имя файла - ' + FileName + ', имя архива - ' + ArchDir + '\' + ArchName );
      Result := fPackData( ArchDir, ArchName, FileDir, FileName );
    end
  else
    ;//DoLog( 'Упаковка данных не возможна: функция упаковки не назначена.' );
end;


procedure TdmFileService.SendStream(AStream: TStream; ACustomsCode, ACustomsName,
  ASrcCustomsName, ACustomsCodeTTT, ASoftCode: string; AEnvelopID : Integer);

  var
    FileStream   : TFileStream;
    vfile_len    : Longint;
    vLZHFileName : array[1..255] of Char;
    vFileName    : string;
    vStr         : string;
    vOutDir      : string;
    vPacked      : Boolean;
    i : Integer;
begin
  if ASoftCode = 'ASPRIVILEGES' then
    begin
      vOutDir := IncludeTrailingPathDelimiter(fOptions.PrivilegesDirOut);
      vPacked := fOptions.PrivilegesPackedOut;
    end
  else
  if ASoftCode = 'ASDEBT' then
    begin
      vOutDir := IncludeTrailingPathDelimiter(fOptions.DebtDirOut);
      vPacked := fOptions.DebtPackedOut;
    end
  else
  if ASoftCode = 'ASFINES' then
    begin
      vOutDir := IncludeTrailingPathDelimiter(fOptions.FinesDirOut);
      vPacked := fOptions.FinesPackedOut;
    end
  else
  if ASoftCode = 'ASKTS' then
    begin
      vOutDir := IncludeTrailingPathDelimiter(fOptions.CostDirOut);
      vPacked := fOptions.CostPackedOut;
    end
  else
    raise Exception.CreateFmt('Указан неизвестный код ПО [%s]!', [ASoftCode]);

  if vOutDir = '' then
    raise Exception.Create('Не задан путь для сохранения конвертов!');
  if not DirectoryExists(vOutDir) then
    raise Exception.CreateFmt('Указанный путь [%s] не существует!', [vOutDir]);


  vFileName := fOptions.CurDir + ACustomsCode + '_' + IntToStr( AEnvelopID ) + '.xml';
  Try
    FileStream := TFileStream.Create( vFileName, fmCreate or fmShareDenyRead );
  except
    raise Exception.CreateFmt('Ошибка создания файла [%s]!', [vFileName]);
  end;
  try
    AStream.Position := 0;
    try
      FileStream.CopyFrom ( AStream, AStream.Size );
    except
      on E: Exception do
        raise Exception.CreateFmt('В ходе записи данных в файл [%s] возникла ошибка: <%s> !', [vFileName, E.Message]);
    end;
  finally
    FileStream.Free;
  end;
  if vPacked then
    begin
      vStr := Trim( ACustomsCodeTTT );
      for i := 1 to Length(vStr) do
        vLZHFileName[i] := vStr[i];
      vLZHFileName[Length(vStr)+1] := #0;
      vfile_len := PackData
        (
          PChar(AnsiString(vOutDir)),
          @vLZHFileName,
          PChar(ExtractFileDir( vFileName)),
          PChar(ExtractFileName( vFileName))
         );
      SysUtils.DeleteFile( vFileName );
      ChDir(fOptions.CurDir);
      CreateTxt
       (
          PChar(AnsiString(vOutDir)),
          @vLZHFileName,
          PChar( ASrcCustomsName ),
          PChar('Конверт по взаимодействию'),
          PChar( ACustomsCode ),
          PChar( ACustomsName),
          PChar( 'Сервис файлового обмена' ),
          PChar('643')
       );

    end
  else
    MoveFile(vFileName, vOutDir);
end;

function TdmFileService.UnpackData(ArchDir, ArchName,
  FileDir: PChar): Boolean;
begin
  if Assigned( fUnpackData ) then
    begin
      //DoLog( 'Распаковка данных: каталог - ' + FileDir + ', имя архива - ' + ArchDir + '\' + ArchName );
      Result := fUnpackData( ArchDir, ArchName, FileDir );
    end ;
  {else
    ; }//DoLog( 'Распаковка данных не возможна: функция распаковки не назначена.' );
end;

procedure TdmFileService.DataModuleDestroy(Sender: TObject);
begin
  fOptions := nil;
end;

procedure TdmFileService.ProcessDir(const SrcDir, ArchDir: string;
  DoArchFile: boolean);
 var
   vFileList, vArcFiles :TStringList;
   i, j                 :integer;
   vPath, vMask, vExt, vFileName :string;
   F                    :TSearchRec;
   Attr                 :Integer;

   procedure ProcessFile(const AFileName : String);
     var
       FS :TFileStream;
   begin
     if not FileExists(AFileName) then
       raise Exception.CreateFmt('Указанного файла [%s] не существует!', [AFileName]);
     FS := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
     try
       fDBService.SaveMessage(FS, '' );
     finally
       FS.Free;
     end;
   end;

begin
  if not DirectoryExists(SrcDir) then
    raise Exception.CreateFmt('Указанный путь <%s> не существует', [SrcDir]);
  if DoArchFile and
     not DirectoryExists(ArchDir) then
    raise Exception.CreateFmt('Указанный путь <%s> не существует', [ArchDir]);
  vFileList := TStringList.Create;
  try
    vPath := IncludeTrailingPathDelimiter(SrcDir);
    vMask := '*.*';
    if (FindFirst(vPath+vMask, Attr, F)=0) then
    begin
      repeat
       if (f.Attr<>16)and(f.Attr<>17)and(f.Attr<>22) then
         begin
           vExt := UpperCase(ExtractFileExt(f.Name));
           if (vExt = '.XML')or(vExt = '.LZH') then
             vFileList.Add(vPath+f.Name);
         end;
      until FindNext(f) <> 0;
      SysUtils.FindClose(f);
    end;
    if vFileList.Count > 0 then
      begin
        TLogLogger.GetRootLogger.Info( 'Просмотр каталога < '+ SrcDir+' >');
        TLogLogger.GetRootLogger.Info( 'Обработка входящих сообщений. В очереди: ' + IntToStr( vFileList.Count ) );
      end;

    for i := 0 to vFileList.Count - 1 do
    begin
       if (UpperCase(ExtractFileExt(vFileList[i])) = '.LZH') then
         begin
           ZipTV.ArchiveFile := vFileList[i];
           vArcFiles := TStringList.Create;
           try
             //-- получение списка файлов архива
             ZipTV.FilesInArchive(vArcFiles);
             if (vArcFiles.Count = 0) then
               TLogLogger.GetRootLogger.Info('  Архив <'+vFileList[i]+'> - не содержит ни одного файла с расширением "xml"!')
             else
               begin
                 UnLha.ExtractDir  := fOptions.CurDir;
                 UnLha.ArchiveFile := ZipTV.ArchiveFile;
                 UnLha.Extract;
                 for j:=0 to vArcFiles.Count - 1 do
                   begin
                     vFileName := IncludeTrailingPathDelimiter(fOptions.CurDir)+ExtractFileName(vArcFiles[j]);
                     ProcessFile(vFileName);
                     SysUtils.DeleteFile(vFileName);
                   end;
               end;
           finally
             vArcFiles.Free;
           end;
         end
       else
         ProcessFile(vFileList[i]);

      TLogLogger.GetRootLogger.Info( 'Обработка файла < ' + ExtractFileName( vFileList[i]) + ' > ..... OK' );

      if DoArchFile then
        MoveFile(vFileList[i], ArchDir)
      else
        SysUtils.DeleteFile(vFileList[i]);
    end;

  finally
    vFileList.Free;
  end;
end;

end.

