{///////////////////////////////////////////////////////////////////////////////
Класс: CCryptoWrap
------------------
Init    - Перед работой с объетом задаем обрабатываемые каталоги и маску файлов обмена
SetInfo - Задает информацию для заполнения файла сопровождения при выгрузке
Exp     - Создание зашифрованного конверта для отправки
Imp     - Расшифровка и извлечение файлов обмена из полученного конверта
EncryptMsg - Шифрование сообщения (массива BYTE)
DecryptMsg - Дешифрование сообщения (массива BYTE)
///////////////////////////////////////////////////////////////////////////////}

unit CryptoWrap;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCryptMethod = (cmVerba, cmCryptoPro);

    //--Динамическое подключение
    // Упаковщик
    TPackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall;
    TUnpackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean; stdcall;
    TCreateTxt = function(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean; stdcall;
    // Верба
    TVerbaEncryptFile = function(Log: PChar; LogSize: Integer; FileName: PChar; CustomsCode: PChar; Path: PChar): Integer; stdcall;
    TVerbaDecryptFile = function(Log: PChar; LogSize: Integer; ArchName: PChar; TxtName: PChar; Dir: PChar): Boolean; stdcall;
    // КриптоПро
    //--Подключаем контейнер для хранения ключей------------------------------------
    TGetKeyContainer = function (Log: PChar; LogSize: Integer; ContainerName: PChar; CryptProv: PInteger): Integer; stdcall;
    //--Создаем контейнер для хранения ключей---------------------------------------
    TCreateKeyContainer = function (Log: PChar; LogSize: Integer; ContainerName: PChar; CryptProv: PInteger): Integer; stdcall;
    //--Подключаем ключи для подписи и обмена---------------------------------------
    TGetKey = function (Log: PChar; LogSize: Integer; CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;
    //--Создаем ключи для подписи и обмена------------------------------------------
    TCreateKey = function (Log: PChar; LogSize: Integer; CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;
    //--Шифрование блока памяти-----------------------------------------------------
    TEncryptMessage = function (Log: PChar; LogSize: Integer; CryptProv: Integer;
                            Msg: PBYTE; MsgLen: DWORD;
                            pbEncryptedBlob: PBYTE; cbEncryptedBlob: PDWORD;
                            CertStoreName: PChar; CountSubject: Integer; Subject: PChar; Signer: PChar;
                            WithSign: Boolean; Password: PChar): Integer; stdcall;
    //--Дешифрование блока памяти---------------------------------------------------
    TDecryptMessage = function (Log: PChar; LogSize: Integer; CryptProv: Integer;
                            DecryptedMessage: PBYTE; DecryptedMessageSize: PDWORD;
                            EncryptedBlob: PBYTE; EncryptedBlobSize: DWORD;
                            CertStoreName: PChar;
                            WithSign: Boolean; Password: PChar; CountSigner: Integer; Signer: PChar): Integer; stdcall;
    //--Освобождение контекстов-----------------------------------------------------
    TReleaseContext = function (CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;

    TGetArchiveFiles = function(ArchName: string): TStringList; stdcall;

    //Класс - обертка для вызова систем шифрования и упаковщика
    CCryptoWrap = class
      private
        // Упаковщик
        PackerDLLHandle : THandle;
        fPackData       : TPackData;
        fUnpackData     : TUnpackData;
        fCreateTxt      : TCreateTxt;

        // Верба
        VerbaDLLHandle   : THandle;
        VerbaEncryptFile : TVerbaEncryptFile;
        VerbaDecryptFile : TVerbaDecryptFile;

        // КриптоПро
        CryptoProDLLHandle : THandle;
        GetKeyContainer    : TGetKeyContainer;
        CreateKeyContainer : TCreateKeyContainer;
        GetKey             : TGetKey;
        CreateKey          : TCreateKey;
        EncryptMessage     : TEncryptMessage;
        DecryptMessage     : TDecryptMessage;
        ReleaseContext     : TReleaseContext;
        fGetArchiveFiles    : TGetArchiveFiles;

        {
        СПИСОК ИСПОЛЬЗУЕМЫХ ПАРАМЕТРОВ (задаем через SetParam)
        DecryptDir      - каталог для результатов дешифрования
        EncryptDir      - каталог для релультатов шифрования
        DataDir         - каталог с файлами данных
        PackFileMask    - маска для упаковки

        CustomsName     - наименование таможенного органа
        CustomsCode     - код таможенного органа
        Performer       - исполнитель
        TypeInfo        - тип передаваемой информации (текст)
        Currency        - код валюты
        ReceiverName    - наименование получателя (таможни назначения)

        ContainerName      - имя контейнера с ключами подписи и обмена
        Password           - пароль на контейнер
        CertSubject        - подстрока из поля SUBJECT сертификта получателя + #0
        SignerCertSubject  - подстрока из поля SUBJECT сертификта подписчика

        CountCertRecepient - количество получателей сообщения
        }
        Params: TStringList;

        Msg:    PBYTE;
        MsgLen: DWORD;
        EncryptedBlob: PBYTE;
        EncryptedSize: DWORD;

        fLog : TStrings;

        function LoadDLL(): boolean;
        procedure DoLog( AMsg : string );

        function CheckPacker( AWriteLog : Boolean ) : Boolean;
        function CheckVerba( AWriteLog : Boolean ) : Boolean;
        function CheckCryptoPro( AWriteLog : Boolean ) : Boolean;
      public
        constructor Create;
        destructor Destroy; override;

        procedure   Init( Alog : TStrings );
        procedure   SetParam(Name: String; Value: String);

        // Упаковщик
        function PackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer;
        function UnpackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean;
        function GetArchiveFiles (ArchName: string): TStringList;
        function CreateTxt(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean;

        // Передает классу блок данных (сообщение)
        function    SetMessage(SourceMsg: PBYTE; Size: DWORD): PBYTE;
        // Передает классу указатель на блок данных (указатель на сообщение)
        function    SetMessageAddress(MsgPointer: PBYTE; Size: DWORD): PBYTE;
        // Передает классу зашифрованый блок
        function    SetBlob(SourceBlob: PBYTE; Size: DWORD): PBYTE;
        // Передает классу указатель на зашифрованный блок
        function    SetBlobAddress(BlobPointer: PBYTE; Size: DWORD): PBYTE;
        // Возвращает указатель на блок данных в классе,
        // устанавливает Size в соответствии с размером блока данных
        function    GetMessage(Size: PDWORD = nil): PBYTE;
        // Возвращает указатель на зашифрованный блок данных в классе
        // устанавливает Size в соответствии с размером зашифрованного блока
        function    GetEncryptedBlob(Size: PDWORD = nil): PBYTE;

        // Создаем конверт для отправки (имя архива без расширения, код таможенного органа - получателя)
        // с возможностью использовать шифрования ВЕРБА
        function    Exp(var FileName: String; CustomsCode: String; Encrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
        // Извлекаем файлы обмена из полученного конверта (имя архива без расширения)
        // с возможностью использовать дешифрования ВЕРБА
        function    Imp(FileName: String; Decrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
        // Шифрование сообщения (массива BYTE)
        // возвращает указатель на зашифрованный блок данных
        function    EncryptMsg(CountResponder: Integer; Responder: String; ResultSize: PDWORD; WithSign: Boolean): PBYTE;
        // Дешифрование сообщения (массива BYTE)
        // возвращает указатель на расшифрованный блок данных
        function    DecryptMsg(ResultSize: PDWORD; WithSign: Boolean): PBYTE;
        // Создаем новый контейнер с ключами подписи и обмена
        function    NewContainer(ContainerName: String): Boolean;

        function IsPackerLoaded : Boolean;
        function IsVerbaLoaded : Boolean;
        function IsCryptoProLoaded : Boolean;
        procedure RemoveDirFiles(path: String);
        function PrepareTempDir(): PChar;
    end;

implementation

uses
  StrUtils
  {$ifdef _DEBUG_}
 ,uDebug
  {$endif}
  ;

function CCryptoWrap.LoadDLL(): boolean;
begin
  DoLog( 'Загрузка библиотеки упаковщика (packer.dll)...' );
  PackerDLLHandle := LoadLibrary('packer.dll');
  if PackerDLLHandle = 0 then
    DoLog( 'Ошибка при загрузки библиотеки упаковщика (packer.dll): ' + IntToStr( GetLastError ) + '.' );

  DoLog( 'Загрузка библиотеки "Верба" (verba.dll)...' );
  VerbaDLLHandle := LoadLibrary('verba.dll');
  if VerbaDLLHandle = 0 then
    DoLog( 'Ошибка при загрузки библиотеки "Верба" (verba.dll): ' + IntToStr( GetLastError ) + '.' );

  DoLog( 'Загрузка библиотеки "КриптоПро" (CryptoPro.dll)...' );
  CryptoProDLLHandle := LoadLibrary('CryptoPro.dll');
  if CryptoProDLLHandle = 0 then
    DoLog( 'Ошибка при загрузки библиотеки "КриптоПро" (CryptoPro.dll): ' + IntToStr( GetLastError ) + '.' );

{  Result := ( PackerDLLHandle    <> 0 )
        and ( VerbaDLLHandle     <> 0 )
        and ( CryptoProDLLHandle <> 0 );
  if not Result then
    Exit;}

  if PackerDLLHandle <> 0 then
    begin
      fPackData   := GetProcAddress(PackerDLLHandle, 'PackData');
      fUnpackData := GetProcAddress(PackerDLLHandle, 'UnpackData');
      fCreateTxt  := GetProcAddress(PackerDLLHandle, 'CreateTxt');

      if @fPackData   = nil then DoLog( 'Ошибка доступа к функции PackData из библиотеки packer.dll.' );
      if @fUnpackData = nil then DoLog( 'Ошибка доступа к функции UnpackData из библиотеки packer.dll.' );
      if @fCreateTxt  = nil then DoLog( 'Ошибка доступа к функции CreateTxt из библиотеки packer.dll.' );
    end;

  if VerbaDLLHandle <> 0 then
    begin
      VerbaEncryptFile := GetProcAddress(VerbaDLLHandle, 'VerbaEncryptFile');
      VerbaDecryptFile := GetProcAddress(VerbaDLLHandle, 'VerbaDecryptFile');

      if @VerbaEncryptFile = nil then DoLog( 'Ошибка доступа к функции VerbaEncryptFile из библиотеки verba.dll.' );
      if @VerbaDecryptFile = nil then DoLog( 'Ошибка доступа к функции VerbaDecryptFile из библиотеки verba.dll.' );
    end;

  if CryptoProDLLHandle <> 0 then
    begin
      GetKeyContainer    := GetProcAddress( CryptoProDLLHandle, 'GetKeyContainer'    );
      CreateKeyContainer := GetProcAddress( CryptoProDLLHandle, 'CreateKeyContainer' );
      GetKey             := GetProcAddress( CryptoProDLLHandle, 'GetKey'             );
      CreateKey          := GetProcAddress( CryptoProDLLHandle, 'CreateKey'          );
      EncryptMessage     := GetProcAddress( CryptoProDLLHandle, 'EncryptMessage'     );
      DecryptMessage     := GetProcAddress( CryptoProDLLHandle, 'DecryptMessage'     );
      ReleaseContext     := GetProcAddress( CryptoProDLLHandle, 'ReleaseContext'     );

      if @GetKeyContainer    = nil then DoLog( 'Ошибка доступа к функции GetKeyContainer из библиотеки CryptoPro.dll.');
      if @CreateKeyContainer = nil then DoLog( 'Ошибка доступа к функции CreateKeyContainer из библиотеки CryptoPro.dll.');
      if @GetKey             = nil then DoLog( 'Ошибка доступа к функции GetKey из библиотеки CryptoPro.dll.');
      if @CreateKey          = nil then DoLog( 'Ошибка доступа к функции CreateKey из библиотеки CryptoPro.dll.');
      if @EncryptMessage     = nil then DoLog( 'Ошибка доступа к функции EncryptMessage из библиотеки CryptoPro.dll.');
      if @DecryptMessage     = nil then DoLog( 'Ошибка доступа к функции DecryptMessage из библиотеки CryptoPro.dll.');
      if @ReleaseContext     = nil then DoLog( 'Ошибка доступа к функции ReleaseContext из библиотеки CryptoPro.dll.');
    end;
Result :=   ( PackerDLLHandle    <> 0 )
        and ( VerbaDLLHandle     <> 0 )
        and ( CryptoProDLLHandle <> 0 );
end;

procedure CCryptoWrap.SetParam(Name: String; Value: String);
begin
  Params.Values[Name] := Value;
end;

procedure CCryptoWrap.Init( Alog : TStrings );
begin
  fLog := Alog;

  LoadDLL();
end;

function CCryptoWrap.Exp(var FileName: String; CustomsCode: String; Encrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
  //--Готовим и зашифровываем конверт
  var
    file_len  : Integer;
    log_array : Array[1..4096] of Char;
    lv_File   : TFileStream;
    lv_Msg    : PBYTE;
    lv_Size   : DWORD;
    lv_SignMessage : Boolean;
    lv_PFileName : array[1..255] of Char;
    //lv_FileName  : string;
    i            : Integer;
begin
  Result := False;
  lv_Size := 0;
  // Проверим загрузку библиотек и получение методов
  DoLog( 'Упаковка и шифрование файлов:' );
  DoLog( '  имя файла: ' + FileName );
  DoLog( '  шифровать: ' + IfThen( Encrypt, 'Да', 'Нет' ) );
  
  if Encrypt then
    DoLog( '  Метод шифрования: ' + IfThen( ACryptMethod = cmVerba, 'Верба', 'КриптоПро' ) );

  if not CheckPacker( True ) then
    begin
      DoLog( 'Файлы не упакованы и не зашифрованы.' );
      Exit;
    end;

  {$ifdef _DEBUG_}
  WriteDebug( '        Упаковка конверта перед шифрованием' );
  {$endif}

  for i := 1 to Length( FileName ) do
    lv_PFileName[i] := FileName[i];

  file_len := PackData(PChar(Params.Values['EncryptDir']),
                       @lv_PFileName,//PChar(FileName),
                       PChar(Params.Values['DataDir']),
                       PChar(Params.Values['PackFileMask']));

  if file_len = 0 then
    begin
      DoLog( 'Ошибка при упаковке файлов или файлы отсутствуют.' );
      DeleteFile ( Params.Values['DataDir'] + '\' + FileName + '.xml' );
      Exit;
    end

  else if Encrypt then
    begin
      FileName := '';
      i := 1;
      while ( i < 256 )
        and ( lv_PFileName[i] <> #0 ) do
        begin
          FileName := FileName + lv_PFileName[i];
          inc( i );
        end;

      try
        {$ifdef _DEBUG_}
        WriteDebug( '        Шифрование...' );
        {$endif}

        DoLog( 'Шифрование...' );
        case ACryptMethod of
          cmVerba :
            begin
              if not CheckVerba( True ) then
                Exit;

              file_len := VerbaEncryptFile(@log_array, 4095,
                                           @lv_PFileName,//PChar(FileName),
                                           PChar(Params.Values['CustomsCode']),
                                           PChar(Params.Values['EncryptDir']));
              DoLog( log_array );
            end;

          cmCryptoPro :
            begin
              if not CheckCryptoPro( True ) then
                Exit;
              lv_File          := TFileStream.Create( Params.Values['EncryptDir'] + '\' + FileName + '.lzh', fmOpenReadWrite );
              lv_File.Position := 0;
              GetMem( lv_Msg, lv_File.Size );
              lv_File.ReadBuffer( lv_Msg^, lv_File.Size );
              SetMessage( lv_Msg, lv_File.Size );
              FreeMem( lv_Msg, lv_File.Size );
              lv_SignMessage := Params.Values['SignMessage'] = 'True';
              EncryptMsg(strtoint(ifthen((Params.Values['CountCertRecepient'] = ''),'0',Params.Values['CountCertRecepient'])), Params.Values['CertSubject'], @lv_Size, lv_SignMessage );
              if lv_Size > 0 then
                begin
                  lv_Msg := GetEncryptedBlob;
                  lv_File.Size := lv_Size;
                  lv_File.Position := 0;
                  lv_File.WriteBuffer( lv_Msg^, lv_Size );
                  lv_File.Free;
                end
              else
                begin
                  lv_File.Free;
                  DoLog( 'Ошибка при шифровании.' );
                  DeleteFile ( Params.Values['EncryptDir'] + '\' + FileName + '.lzh' );
                end;
            end;
        end;

        {$ifdef _DEBUG_}
        WriteDebug( '        Зашифровано' );
        {$endif}
      except
        DeleteFile ( Params.Values['EncryptDir'] + '\' + FileName + '.lzh' );
      end;
    end;

  if (not(Encrypt))or(lv_Size > 0) then
    begin
      DoLog( 'Формирование сопроводительного файла...' );
      ChDir(ExtractFileDir(Application.ExeName));
      CreateTxt(PChar(Params.Values['EncryptDir']),
                @lv_PFileName,//PChar(FileName),
                PChar(Params.Values['CustomsName']),
                PChar(Params.Values['TypeInfo']),
                PChar(Params.Values['CustomsCode']),
                PChar(Params.Values['ReceiverName']),
                PChar(Params.Values['Performer']),
                PChar(Params.Values['Currency']));

      DoLog( 'Файлы подготовлены для передачи.' );
      Result := True;
    end;
end;

function CCryptoWrap.Imp(FileName: String; Decrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
  //--Рашифровываем и распаковываем конверт
  var
    log_array:  Array[1..4096] of Char;
    lv_File   : TFileStream;
    lv_Msg    : PBYTE;
    lv_Size   : DWORD;
    lv_SignMessage : Boolean;
begin
  Result := False;
  lv_Size := 0;
  // Проверим загрузку библиотек и получение методов
  DoLog( 'Распаковка и дешифрование файлов:' );
  DoLog( '  имя файла: ' + FileName );
  DoLog( '  дешифровать: ' + IfThen( Decrypt, 'Да', 'Нет' ) );
  if Decrypt then
    DoLog( '  Метод дешифрования: ' + IfThen( ACryptMethod = cmVerba, 'Верба', 'КриптоПро' ) );

  if Decrypt then
    begin
      DoLog( 'Дешифрование...' );
      case ACryptMethod of
        cmVerba :
          begin
            if not CheckVerba( True ) then
              Exit;
            Result := VerbaDecryptFile(@log_array, 4095,
                                       PChar(String(FileName + '.lzh')),
                                       PChar(String(FileName + '.(s)')),
                                       PChar(Params.Values['DecryptDir']));
            DoLog( log_array );
          end;

        cmCryptoPro :
          begin
            if not CheckCryptoPro( True ) then
              Exit;
            lv_File          := TFileStream.Create( Params.Values['DecryptDir'] + '\' + FileName + '.lzh', fmOpenReadWrite );
            lv_File.Position := 0;
            GetMem( lv_Msg, lv_File.Size );
            lv_File.ReadBuffer( lv_Msg^, lv_File.Size );
            SetBlob( lv_Msg, lv_File.Size );
            FreeMem( lv_Msg, lv_File.Size );
            lv_SignMessage := Params.Values['SignMessage'] = 'True';
            DecryptMsg( @lv_Size, lv_SignMessage );
            Result := lv_Size > 0;
            if Result then
              begin
                lv_Msg := GetMessage;
                lv_File.Size := lv_Size;
                lv_File.Position := 0;
                lv_File.WriteBuffer( lv_Msg^, lv_Size );
              end
            else
              begin
                DoLog( 'Ошибка при декодировании...' );
              end;
            lv_File.Free;
          end;
      else
        Result := True;
      end;
    end;

  if Result then
    begin
      if not CheckPacker( True ) then
        begin
          DoLog( 'Файлы не распакованы.' );
          Result := False;
          Exit;
        end;

      Result := UnpackData(PChar(Params.Values['DecryptDir']),
                           PChar(FileName + '.lzh'),
                           PChar(Params.Values['DataDir']));
      if Result then
        begin
          DoLog( 'Архив "'+FileName + '.lzh"'+' распакован!' );
        end;
    end;
end;

function CCryptoWrap.SetMessage(SourceMsg: PBYTE; Size: DWORD): PBYTE;
begin
  if (Msg <> nil) then
    FreeMem(Msg);
  GetMem(Msg, Size);
  MsgLen := Size;
  CopyMemory(Msg, SourceMsg, Size);
  Result := Msg;
end;

function CCryptoWrap.SetMessageAddress(MsgPointer: PBYTE; Size: DWORD): PBYTE;
begin
  if (MsgPointer <> nil) then
    begin
      MsgLen := Size;
      Msg := MsgPointer;
    end;
  Result := Msg;
end;

function CCryptoWrap.GetMessage(Size: PDWORD): PBYTE;
begin
  if (Size <> nil) then
    Size^  := MsgLen;
  Result := Msg;
end;

function CCryptoWrap.SetBlob(SourceBlob: PBYTE; Size: DWORD): PBYTE;
begin
  if (EncryptedBlob <> nil) then
    FreeMem(EncryptedBlob);
  GetMem(EncryptedBlob, Size);
  EncryptedSize := Size;
  CopyMemory(EncryptedBlob, SourceBlob, Size);
  Result := EncryptedBlob;
end;

function CCryptoWrap.SetBlobAddress(BlobPointer: PBYTE; Size: DWORD): PBYTE;
begin
  if (BlobPointer <> nil) then
    begin
      EncryptedSize := Size;
      EncryptedBlob := BlobPointer;
    end;
  Result := EncryptedBlob;
end;

function CCryptoWrap.GetEncryptedBlob(Size: PDWORD): PBYTE;
begin
  if (Size <> nil) then
    Size^  := EncryptedSize;
  Result := EncryptedBlob;
end;

function CCryptoWrap.EncryptMsg(CountResponder: Integer; Responder: String; ResultSize: PDWORD; WithSign: Boolean): PBYTE;
  var
    CryptProv: Integer;
    log_array: Array[1..4096] of Char;
    l_str_tmp: AnsiString;
    l_responder: PChar;
    l_result: WORD;
begin
  l_responder := nil;
  DoLog( 'Шифрование. КриптоПро...' );
  if ResultSize <> nil then
    begin
      ResultSize^ := 0;
    end;

  try
    l_result:= GetKeyContainer(@log_array, 4095, PChar(Params.Values['ContainerName']), @CryptProv);
    DoLog( log_array );
  except
    on E : Exception do
      begin
        l_result := 1;
        DoLog( 'Шифрование. КриптоПро. Ошибка при получении контейнера "' + Params.Values['ContainerName'] + '": ' + E.Message );
      end;
  end;
  if (l_result <> 0) then
    begin
      DoLog( 'Шифрование. КриптоПро. Не удалось получить контейнер "' + Params.Values['ContainerName'] + '"' );
    end
  else
    begin
      l_str_tmp := Responder;
      GetMem(l_responder,length(l_str_tmp));
      CopyMemory(l_responder,PChar(l_str_tmp),length(l_str_tmp));
      try
        l_result:= EncryptMessage(@log_array, 4095, CryptProv, Msg, MsgLen, nil, @EncryptedSize, PChar('MY'), CountResponder, l_responder, PChar(Params.Values['SignerCertSubject']), WithSign, PChar(Params.Values['Password']));
        DoLog( log_array );
      except
        on E : Exception do
          begin
            l_result := 1;
            DoLog( 'Шифрование. КриптоПро. Ошибка при получении размера шифрованного файла: ' + E.Message );
          end;
      end;
      if (EncryptedSize > 0)and(l_result = 0) then
        begin
          if (EncryptedBlob <> nil) then
            begin
              FreeMem(EncryptedBlob);
            end;
          GetMem(EncryptedBlob, EncryptedSize);
          try
            l_result:= EncryptMessage(@log_array, 4095, CryptProv, Msg, MsgLen, EncryptedBlob, @EncryptedSize, PChar('MY'), CountResponder, l_responder,  PChar(Params.Values['SignerCertSubject']), WithSign, PChar(Params.Values['Password']));
            DoLog( log_array );
          except
            on E : Exception do
              begin
               l_result := 1;
               DoLog( 'Шифрование. КриптоПро. Ошибка при шифровании файла: ' + E.Message );
              end;
          end;
          if (l_result <> 0) then
            begin
              DoLog( 'Шифрование. КриптоПро. Не удалось зашифровать файл' );
              EncryptedSize := 0;
              if (EncryptedBlob <> nil) then
                begin
                  FreeMem(EncryptedBlob);
                end;
            end;
          if ResultSize <> nil then
            ResultSize^ := EncryptedSize;
        end
      else
        begin
          DoLog( 'Шифрование. КриптоПро. Не удалось получить размер шифрованного файла');
        end; //--if
      //--
      if (l_responder <> nil) then
        begin
          FreeMemory(l_responder);
        end;
      if (CryptProv <> 0) then
        begin
          ReleaseContext(CryptProv, nil, nil);
        end;
    end; //--if
end;

function CCryptoWrap.DecryptMsg(ResultSize: PDWORD; WithSign: Boolean): PBYTE;
  var
    CryptProv: Integer;
    log_array: Array[1..4096] of Char;
    l_result: WORD;
begin
  DoLog( 'Дешифрование. КриптоПро...' );
  if ResultSize <> nil then
    begin
      ResultSize^ := 0;
    end;
  try
    l_result:= GetKeyContainer(@log_array, 4095, PChar(Params.Values['ContainerName']), @CryptProv);
    DoLog( log_array );
  except
    on E : Exception do
      begin
        DoLog( 'Дешифрование. КриптоПро. Ошибка при получении контейнера "' + Params.Values['ContainerName'] + '": ' + E.Message );
        l_result := 1;
      end;
  end;
  if (l_result <> 0) then
    begin
      DoLog( 'Дешифрование. КриптоПро. Не удалось получить контейнер "' + Params.Values['ContainerName'] + '"');
    end
  else
    begin
      try
        l_result:= DecryptMessage(@log_array, 4095, CryptProv, nil, @MsgLen, EncryptedBlob, EncryptedSize, PChar('MY'), WithSign, PChar(Params.Values['Password']), 0, nil);
        DoLog( log_array );
      except
        on E : Exception do
          begin
            DoLog( 'Дешифрование. КриптоПро. Ошибка при получении размера расшифрованного файла: ' + E.Message );
            l_result := 1;
          end;
      end;
      if (MsgLen > 0)and(l_result = 0) then
        begin
          if (Msg <> nil) then
            begin
              FreeMem(Msg);
            end;
          GetMem(Msg, MsgLen);
          try
            l_result:= DecryptMessage(@log_array, 4095, CryptProv, Msg, @MsgLen, EncryptedBlob, EncryptedSize, PChar('MY'), WithSign, PChar(Params.Values['Password']), 0, nil);
            DoLog( log_array );
          except
            on E : Exception do
              begin
                DoLog( 'Дешифрование. КриптоПро. Ошибка при дешифровании: ' + E.Message );
                l_result := 1;
              end;
          end;
          if (l_result <> 0) then
            begin
              DoLog( 'Дешифрование. КриптоПро. Не удалось расшифровать файл' );
              MsgLen := 0;
              if (Msg <> nil) then
                begin
                  FreeMem(Msg);
                end;
            end;
          if ResultSize <> nil then
            ResultSize^ := MsgLen;
        end;
        if (CryptProv <> 0) then
          begin
            ReleaseContext(CryptProv, nil, nil);
          end;
    end; //--if
end;

function CCryptoWrap.NewContainer(ContainerName: String): Boolean;
  var
    CryptProv: Integer;
    SignKey: Integer;
    ExchKey: Integer;
    log_array: Array[1..4096] of Char;
begin
  CreateKeyContainer(@log_array, 4095, PChar(ContainerName), @CryptProv);
  DoLog( log_array );
  CreateKey(@log_array, 4095, CryptProv, @SignKey, @ExchKey,);
  DoLog( log_array );
  ReleaseContext(CryptProv, @SignKey, @ExchKey);
end;

destructor CCryptoWrap.Destroy;
begin
  // Упаковщик
  fPackData   := nil;
  fUnpackData := nil;
  fCreateTxt  := nil;

  // Верба
  VerbaEncryptFile := nil;
  VerbaDecryptFile := nil;

  // КриптоПро
  GetKeyContainer    := nil;
  CreateKeyContainer := nil;
  GetKey             := nil;
  CreateKey          := nil;
  EncryptMessage     := nil;
  DecryptMessage     := nil;
  ReleaseContext     := nil;

  if PackerDLLHandle <> 0 then
    FreeLibrary( PackerDLLHandle );

  if VerbaDLLHandle <> 0 then
    FreeLibrary( VerbaDLLHandle );

  if CryptoProDLLHandle <> 0 then
    FreeLibrary( CryptoProDLLHandle );

  inherited;
end;

procedure CCryptoWrap.DoLog(AMsg: string);
begin
  if Assigned( fLog ) then
    fLog.Add( DateTimeToStr( Now ) + '  ' + AMsg ); 
end;

constructor CCryptoWrap.Create;
begin
  inherited;

  Msg           := nil;
  MsgLen        := 0;
  EncryptedBlob := nil;
  EncryptedSize := 0;
  Params        := TStringList.Create;
  fLog          := nil;

  // Упаковщик
  PackerDLLHandle := 0;
  fPackData       := nil;
  fUnpackData     := nil;
  fCreateTxt      := nil;

  // Верба
  VerbaDLLHandle   := 0;
  VerbaEncryptFile := nil;
  VerbaDecryptFile := nil;

  // КриптоПро
  CryptoProDLLHandle := 0;
  GetKeyContainer    := nil;
  CreateKeyContainer := nil;
  GetKey             := nil;
  CreateKey          := nil;
  EncryptMessage     := nil;
  DecryptMessage     := nil;
  ReleaseContext     := nil;
end;

// ------------------------------------------------------------------------------------------------
// Архив сначала упаковывается во временную папку Windows, а потом копируется по указанному пути.
// Это устраняет возможные проблемы при архивации сразу на удалённое хранилище.
// Патокин В. 27.01.15
//
function CCryptoWrap.PackData(ArchDir, ArchName, FileDir,
  FileName: PChar): Integer;
var
  sTempFolder: string;
  sr: TSearchRec;
begin
  if Assigned(fPackData) then
    begin
      sTempFolder := PrepareTempDir() + '\' + ExtractFileName(ArchName);

      if ForceDirectories(sTempFolder) then
        Result := fPackData(PChar(sTempFolder), ArchName, FileDir, FileName);

      if Result > 0 then
      begin
        if FindFirst(sTempFolder + '\*.*', faAnyFile, sr) = 0 then
        begin
          repeat
            if sr.Attr and faDirectory = 0 then
              if not MoveFile(PChar(sTempFolder + '\'+ sr.Name), PChar(FileDir + '\'+ sr.Name)) then
              begin
                DoLog(Format('Ошибка перемещения файла %s из временной папки в папку %s', [sr.Name, FileDir]));
                Result := -1;
              end;
          until
            FindNext(sr) <> 0;
        end;
        FindClose(sr);
        RemoveDirFiles(sTempFolder);
      end;

      DoLog('Упаковка данных: каталог - ' + FileDir + ', имя файла - ' + FileName + ', имя архива - ' + ArchDir + '\' + ArchName);
      //Result := fPackData( ArchDir, ArchName, FileDir, FileName );
    end
  else
    DoLog('Упаковка данных невозможна: функция упаковки не назначена.');
end;

function CCryptoWrap.UnpackData(ArchDir, ArchName,
  FileDir: PChar): Boolean;
begin
  if Assigned( fUnpackData ) then
    begin
      DoLog( 'Распаковка данных: каталог - ' + FileDir + ', имя архива - ' + ArchDir + '\' + ArchName );
      try
        Result := fUnpackData( ArchDir, ArchName, FileDir );
      except
        on E:Exception do
          begin
            DOLog(Format('Ошибка распаковки данных: %s', [E.Message]));
            raise Exception.Create('Ошибка распаковки файла ' + ArchName);
          end;
      end;
    end
  else
    DoLog( 'Распаковка данных невозможна: функция распаковки не назначена.' );
end;

function CCryptoWrap.PrepareTempDir(): PChar;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetEnvironmentVariable('TMP', tempFolder, MAX_PATH);
  Result := tempFolder;
  RemoveDirFiles(Result);
end;

// ---------------------------------------------------------------------------------------
// Возвращает список файлов архива (процедура FilesInArchive работает не всегда корректно)
// Патокин В. 26.01.15
//
function CCryptoWrap.GetArchiveFiles(ArchName: string): TStringList;
var
  sTempFolder: string;
  sr: TSearchRec;
begin
  Result := TStringList.Create();
  sTempFolder := PrepareTempDir() +'\'+ ExtractFileName(ArchName);

  DoLog('Распаковка данных для получения списка файлов: каталог - ' + sTempFolder + ', имя архива - ' + ArchName);

  if ForceDirectories(sTempFolder) then
    if CheckPacker(True) and
      UnpackData(PChar(ExtractFilePath(ArchName)), PChar(ExtractFileName(ArchName)), PChar(sTempFolder)) then
    begin
      DoLog('Архив ' + ArchName  + ' распакован');
      if FindFirst(sTempFolder + '\*.*', faAnyFile, sr) = 0 then
      begin
        repeat
          if sr.Attr and faDirectory = 0 then
          begin
            Result.Append(sr.name);
          end;
        until
          FindNext(sr) <> 0;
      end;
      FindClose(sr);
      RemoveDirFiles(sTempFolder);
    end
    else
      DoLog('Ошибка распаковки архива ' + ArchName);
end;

procedure CCryptoWrap.RemoveDirFiles(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(Path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(PChar( Path + '\' + sr.name));
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveDirFiles(Path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(Path));
end;


function CCryptoWrap.CreateTxt(Dir, FileName, CustomsName, TypeInfo,
  CustomsCode, ReceiverName, Performer, Currency: PChar): Boolean;
begin
  if Assigned( fCreateTxt ) then
    begin
      DoLog( 'Формирование сопроводительного файла: файл - ' + Dir + '\' + FileName );
      Result := fCreateTxt( Dir, FileName, CustomsName, TypeInfo, CustomsCode, ReceiverName, Performer, Currency );
    end
  else
    DoLog( 'Формирование сопроводительного файла невозможна: функция формирования не назначена.' );
end;

function CCryptoWrap.CheckPacker(AWriteLog: Boolean): Boolean;
begin
  if    ( PackerDLLHandle = 0 )
     or ( @fPackData   = nil )
     or ( @fUnpackData = nil )
     or ( @fCreateTxt  = nil ) then
    begin
      Result := False;
      if AWriteLog then
        DoLog( 'Библиотека упаковщика (packer.dll) не загружена.' );
    end
  else
    Result := True;
end;

function CCryptoWrap.CheckVerba(AWriteLog: Boolean): Boolean;
begin
  if    ( VerbaDLLHandle = 0 )
     or ( @VerbaEncryptFile = nil )
     or ( @VerbaDecryptFile = nil ) then
    begin
      Result := False;
      if AWriteLog then
        DoLog( 'Библиотека шифрования (verba.dll) не загружена.' );
    end
  else
    Result := True;
end;

function CCryptoWrap.CheckCryptoPro(AWriteLog: Boolean): Boolean;
begin
  if    ( CryptoProDLLHandle = 0 )
     or ( @GetKeyContainer    = nil )
     or ( @CreateKeyContainer = nil )
     or ( @GetKey             = nil )
     or ( @CreateKey          = nil )
     or ( @EncryptMessage     = nil )
     or ( @DecryptMessage     = nil )
     or ( @ReleaseContext     = nil ) then
    begin
      Result := False;
      if AWriteLog then
        DoLog( 'Библиотека шифрования (CryptoPro.dll) не загружена.' );
    end
  else
    Result := True;
end;

function CCryptoWrap.IsPackerLoaded: Boolean;
begin
  Result := CheckPacker( False );
end;

function CCryptoWrap.IsVerbaLoaded: Boolean;
begin
  Result := CheckVerba( False );
end;

function CCryptoWrap.IsCryptoProLoaded: Boolean;
begin
  Result := CheckCryptoPro( False );
end;

end.
