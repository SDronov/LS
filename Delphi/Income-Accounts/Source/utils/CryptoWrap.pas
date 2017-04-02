{///////////////////////////////////////////////////////////////////////////////
�����: CCryptoWrap
------------------
Init    - ����� ������� � ������� ������ �������������� �������� � ����� ������ ������
SetInfo - ������ ���������� ��� ���������� ����� ������������� ��� ��������
Exp     - �������� �������������� �������� ��� ��������
Imp     - ����������� � ���������� ������ ������ �� ����������� ��������
EncryptMsg - ���������� ��������� (������� BYTE)
DecryptMsg - ������������ ��������� (������� BYTE)
///////////////////////////////////////////////////////////////////////////////}

unit CryptoWrap;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCryptMethod = (cmVerba, cmCryptoPro);

    //--������������ �����������
    // ���������
    TPackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall;
    TUnpackData = function(ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean; stdcall;
    TCreateTxt = function(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean; stdcall;
    // �����
    TVerbaEncryptFile = function(Log: PChar; LogSize: Integer; FileName: PChar; CustomsCode: PChar; Path: PChar): Integer; stdcall;
    TVerbaDecryptFile = function(Log: PChar; LogSize: Integer; ArchName: PChar; TxtName: PChar; Dir: PChar): Boolean; stdcall;
    // ���������
    //--���������� ��������� ��� �������� ������------------------------------------
    TGetKeyContainer = function (Log: PChar; LogSize: Integer; ContainerName: PChar; CryptProv: PInteger): Integer; stdcall;
    //--������� ��������� ��� �������� ������---------------------------------------
    TCreateKeyContainer = function (Log: PChar; LogSize: Integer; ContainerName: PChar; CryptProv: PInteger): Integer; stdcall;
    //--���������� ����� ��� ������� � ������---------------------------------------
    TGetKey = function (Log: PChar; LogSize: Integer; CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;
    //--������� ����� ��� ������� � ������------------------------------------------
    TCreateKey = function (Log: PChar; LogSize: Integer; CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;
    //--���������� ����� ������-----------------------------------------------------
    TEncryptMessage = function (Log: PChar; LogSize: Integer; CryptProv: Integer;
                            Msg: PBYTE; MsgLen: DWORD;
                            pbEncryptedBlob: PBYTE; cbEncryptedBlob: PDWORD;
                            CertStoreName: PChar; CountSubject: Integer; Subject: PChar; Signer: PChar;
                            WithSign: Boolean; Password: PChar): Integer; stdcall;
    //--������������ ����� ������---------------------------------------------------
    TDecryptMessage = function (Log: PChar; LogSize: Integer; CryptProv: Integer;
                            DecryptedMessage: PBYTE; DecryptedMessageSize: PDWORD;
                            EncryptedBlob: PBYTE; EncryptedBlobSize: DWORD;
                            CertStoreName: PChar;
                            WithSign: Boolean; Password: PChar; CountSigner: Integer; Signer: PChar): Integer; stdcall;
    //--������������ ����������-----------------------------------------------------
    TReleaseContext = function (CryptProv: Integer; SignKey: PInteger; ExchKey: PInteger): Integer; stdcall;

    TGetArchiveFiles = function(ArchName: string): TStringList; stdcall;

    //����� - ������� ��� ������ ������ ���������� � ����������
    CCryptoWrap = class
      private
        // ���������
        PackerDLLHandle : THandle;
        fPackData       : TPackData;
        fUnpackData     : TUnpackData;
        fCreateTxt      : TCreateTxt;

        // �����
        VerbaDLLHandle   : THandle;
        VerbaEncryptFile : TVerbaEncryptFile;
        VerbaDecryptFile : TVerbaDecryptFile;

        // ���������
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
        ������ ������������ ���������� (������ ����� SetParam)
        DecryptDir      - ������� ��� ����������� ������������
        EncryptDir      - ������� ��� ����������� ����������
        DataDir         - ������� � ������� ������
        PackFileMask    - ����� ��� ��������

        CustomsName     - ������������ ����������� ������
        CustomsCode     - ��� ����������� ������
        Performer       - �����������
        TypeInfo        - ��� ������������ ���������� (�����)
        Currency        - ��� ������
        ReceiverName    - ������������ ���������� (������� ����������)

        ContainerName      - ��� ���������� � ������� ������� � ������
        Password           - ������ �� ���������
        CertSubject        - ��������� �� ���� SUBJECT ���������� ���������� + #0
        SignerCertSubject  - ��������� �� ���� SUBJECT ���������� ����������

        CountCertRecepient - ���������� ����������� ���������
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

        // ���������
        function PackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer;
        function UnpackData (ArchDir: PChar; ArchName: PChar; FileDir: PChar): Boolean;
        function GetArchiveFiles (ArchName: string): TStringList;
        function CreateTxt(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean;

        // �������� ������ ���� ������ (���������)
        function    SetMessage(SourceMsg: PBYTE; Size: DWORD): PBYTE;
        // �������� ������ ��������� �� ���� ������ (��������� �� ���������)
        function    SetMessageAddress(MsgPointer: PBYTE; Size: DWORD): PBYTE;
        // �������� ������ ������������ ����
        function    SetBlob(SourceBlob: PBYTE; Size: DWORD): PBYTE;
        // �������� ������ ��������� �� ������������� ����
        function    SetBlobAddress(BlobPointer: PBYTE; Size: DWORD): PBYTE;
        // ���������� ��������� �� ���� ������ � ������,
        // ������������� Size � ������������ � �������� ����� ������
        function    GetMessage(Size: PDWORD = nil): PBYTE;
        // ���������� ��������� �� ������������� ���� ������ � ������
        // ������������� Size � ������������ � �������� �������������� �����
        function    GetEncryptedBlob(Size: PDWORD = nil): PBYTE;

        // ������� ������� ��� �������� (��� ������ ��� ����������, ��� ����������� ������ - ����������)
        // � ������������ ������������ ���������� �����
        function    Exp(var FileName: String; CustomsCode: String; Encrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
        // ��������� ����� ������ �� ����������� �������� (��� ������ ��� ����������)
        // � ������������ ������������ ������������ �����
        function    Imp(FileName: String; Decrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
        // ���������� ��������� (������� BYTE)
        // ���������� ��������� �� ������������� ���� ������
        function    EncryptMsg(CountResponder: Integer; Responder: String; ResultSize: PDWORD; WithSign: Boolean): PBYTE;
        // ������������ ��������� (������� BYTE)
        // ���������� ��������� �� �������������� ���� ������
        function    DecryptMsg(ResultSize: PDWORD; WithSign: Boolean): PBYTE;
        // ������� ����� ��������� � ������� ������� � ������
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
  DoLog( '�������� ���������� ���������� (packer.dll)...' );
  PackerDLLHandle := LoadLibrary('packer.dll');
  if PackerDLLHandle = 0 then
    DoLog( '������ ��� �������� ���������� ���������� (packer.dll): ' + IntToStr( GetLastError ) + '.' );

  DoLog( '�������� ���������� "�����" (verba.dll)...' );
  VerbaDLLHandle := LoadLibrary('verba.dll');
  if VerbaDLLHandle = 0 then
    DoLog( '������ ��� �������� ���������� "�����" (verba.dll): ' + IntToStr( GetLastError ) + '.' );

  DoLog( '�������� ���������� "���������" (CryptoPro.dll)...' );
  CryptoProDLLHandle := LoadLibrary('CryptoPro.dll');
  if CryptoProDLLHandle = 0 then
    DoLog( '������ ��� �������� ���������� "���������" (CryptoPro.dll): ' + IntToStr( GetLastError ) + '.' );

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

      if @fPackData   = nil then DoLog( '������ ������� � ������� PackData �� ���������� packer.dll.' );
      if @fUnpackData = nil then DoLog( '������ ������� � ������� UnpackData �� ���������� packer.dll.' );
      if @fCreateTxt  = nil then DoLog( '������ ������� � ������� CreateTxt �� ���������� packer.dll.' );
    end;

  if VerbaDLLHandle <> 0 then
    begin
      VerbaEncryptFile := GetProcAddress(VerbaDLLHandle, 'VerbaEncryptFile');
      VerbaDecryptFile := GetProcAddress(VerbaDLLHandle, 'VerbaDecryptFile');

      if @VerbaEncryptFile = nil then DoLog( '������ ������� � ������� VerbaEncryptFile �� ���������� verba.dll.' );
      if @VerbaDecryptFile = nil then DoLog( '������ ������� � ������� VerbaDecryptFile �� ���������� verba.dll.' );
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

      if @GetKeyContainer    = nil then DoLog( '������ ������� � ������� GetKeyContainer �� ���������� CryptoPro.dll.');
      if @CreateKeyContainer = nil then DoLog( '������ ������� � ������� CreateKeyContainer �� ���������� CryptoPro.dll.');
      if @GetKey             = nil then DoLog( '������ ������� � ������� GetKey �� ���������� CryptoPro.dll.');
      if @CreateKey          = nil then DoLog( '������ ������� � ������� CreateKey �� ���������� CryptoPro.dll.');
      if @EncryptMessage     = nil then DoLog( '������ ������� � ������� EncryptMessage �� ���������� CryptoPro.dll.');
      if @DecryptMessage     = nil then DoLog( '������ ������� � ������� DecryptMessage �� ���������� CryptoPro.dll.');
      if @ReleaseContext     = nil then DoLog( '������ ������� � ������� ReleaseContext �� ���������� CryptoPro.dll.');
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
  //--������� � ������������� �������
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
  // �������� �������� ��������� � ��������� �������
  DoLog( '�������� � ���������� ������:' );
  DoLog( '  ��� �����: ' + FileName );
  DoLog( '  ���������: ' + IfThen( Encrypt, '��', '���' ) );
  
  if Encrypt then
    DoLog( '  ����� ����������: ' + IfThen( ACryptMethod = cmVerba, '�����', '���������' ) );

  if not CheckPacker( True ) then
    begin
      DoLog( '����� �� ��������� � �� �����������.' );
      Exit;
    end;

  {$ifdef _DEBUG_}
  WriteDebug( '        �������� �������� ����� �����������' );
  {$endif}

  for i := 1 to Length( FileName ) do
    lv_PFileName[i] := FileName[i];

  file_len := PackData(PChar(Params.Values['EncryptDir']),
                       @lv_PFileName,//PChar(FileName),
                       PChar(Params.Values['DataDir']),
                       PChar(Params.Values['PackFileMask']));

  if file_len = 0 then
    begin
      DoLog( '������ ��� �������� ������ ��� ����� �����������.' );
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
        WriteDebug( '        ����������...' );
        {$endif}

        DoLog( '����������...' );
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
                  DoLog( '������ ��� ����������.' );
                  DeleteFile ( Params.Values['EncryptDir'] + '\' + FileName + '.lzh' );
                end;
            end;
        end;

        {$ifdef _DEBUG_}
        WriteDebug( '        �����������' );
        {$endif}
      except
        DeleteFile ( Params.Values['EncryptDir'] + '\' + FileName + '.lzh' );
      end;
    end;

  if (not(Encrypt))or(lv_Size > 0) then
    begin
      DoLog( '������������ ����������������� �����...' );
      ChDir(ExtractFileDir(Application.ExeName));
      CreateTxt(PChar(Params.Values['EncryptDir']),
                @lv_PFileName,//PChar(FileName),
                PChar(Params.Values['CustomsName']),
                PChar(Params.Values['TypeInfo']),
                PChar(Params.Values['CustomsCode']),
                PChar(Params.Values['ReceiverName']),
                PChar(Params.Values['Performer']),
                PChar(Params.Values['Currency']));

      DoLog( '����� ������������ ��� ��������.' );
      Result := True;
    end;
end;

function CCryptoWrap.Imp(FileName: String; Decrypt: Boolean; ACryptMethod : TCryptMethod = cmVerba): Boolean;
  //--������������� � ������������� �������
  var
    log_array:  Array[1..4096] of Char;
    lv_File   : TFileStream;
    lv_Msg    : PBYTE;
    lv_Size   : DWORD;
    lv_SignMessage : Boolean;
begin
  Result := False;
  lv_Size := 0;
  // �������� �������� ��������� � ��������� �������
  DoLog( '���������� � ������������ ������:' );
  DoLog( '  ��� �����: ' + FileName );
  DoLog( '  �����������: ' + IfThen( Decrypt, '��', '���' ) );
  if Decrypt then
    DoLog( '  ����� ������������: ' + IfThen( ACryptMethod = cmVerba, '�����', '���������' ) );

  if Decrypt then
    begin
      DoLog( '������������...' );
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
                DoLog( '������ ��� �������������...' );
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
          DoLog( '����� �� �����������.' );
          Result := False;
          Exit;
        end;

      Result := UnpackData(PChar(Params.Values['DecryptDir']),
                           PChar(FileName + '.lzh'),
                           PChar(Params.Values['DataDir']));
      if Result then
        begin
          DoLog( '����� "'+FileName + '.lzh"'+' ����������!' );
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
  DoLog( '����������. ���������...' );
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
        DoLog( '����������. ���������. ������ ��� ��������� ���������� "' + Params.Values['ContainerName'] + '": ' + E.Message );
      end;
  end;
  if (l_result <> 0) then
    begin
      DoLog( '����������. ���������. �� ������� �������� ��������� "' + Params.Values['ContainerName'] + '"' );
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
            DoLog( '����������. ���������. ������ ��� ��������� ������� ������������ �����: ' + E.Message );
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
               DoLog( '����������. ���������. ������ ��� ���������� �����: ' + E.Message );
              end;
          end;
          if (l_result <> 0) then
            begin
              DoLog( '����������. ���������. �� ������� ����������� ����' );
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
          DoLog( '����������. ���������. �� ������� �������� ������ ������������ �����');
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
  DoLog( '������������. ���������...' );
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
        DoLog( '������������. ���������. ������ ��� ��������� ���������� "' + Params.Values['ContainerName'] + '": ' + E.Message );
        l_result := 1;
      end;
  end;
  if (l_result <> 0) then
    begin
      DoLog( '������������. ���������. �� ������� �������� ��������� "' + Params.Values['ContainerName'] + '"');
    end
  else
    begin
      try
        l_result:= DecryptMessage(@log_array, 4095, CryptProv, nil, @MsgLen, EncryptedBlob, EncryptedSize, PChar('MY'), WithSign, PChar(Params.Values['Password']), 0, nil);
        DoLog( log_array );
      except
        on E : Exception do
          begin
            DoLog( '������������. ���������. ������ ��� ��������� ������� ��������������� �����: ' + E.Message );
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
                DoLog( '������������. ���������. ������ ��� ������������: ' + E.Message );
                l_result := 1;
              end;
          end;
          if (l_result <> 0) then
            begin
              DoLog( '������������. ���������. �� ������� ������������ ����' );
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
  // ���������
  fPackData   := nil;
  fUnpackData := nil;
  fCreateTxt  := nil;

  // �����
  VerbaEncryptFile := nil;
  VerbaDecryptFile := nil;

  // ���������
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

  // ���������
  PackerDLLHandle := 0;
  fPackData       := nil;
  fUnpackData     := nil;
  fCreateTxt      := nil;

  // �����
  VerbaDLLHandle   := 0;
  VerbaEncryptFile := nil;
  VerbaDecryptFile := nil;

  // ���������
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
// ����� ������� ������������� �� ��������� ����� Windows, � ����� ���������� �� ���������� ����.
// ��� ��������� ��������� �������� ��� ��������� ����� �� �������� ���������.
// ������� �. 27.01.15
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
                DoLog(Format('������ ����������� ����� %s �� ��������� ����� � ����� %s', [sr.Name, FileDir]));
                Result := -1;
              end;
          until
            FindNext(sr) <> 0;
        end;
        FindClose(sr);
        RemoveDirFiles(sTempFolder);
      end;

      DoLog('�������� ������: ������� - ' + FileDir + ', ��� ����� - ' + FileName + ', ��� ������ - ' + ArchDir + '\' + ArchName);
      //Result := fPackData( ArchDir, ArchName, FileDir, FileName );
    end
  else
    DoLog('�������� ������ ����������: ������� �������� �� ���������.');
end;

function CCryptoWrap.UnpackData(ArchDir, ArchName,
  FileDir: PChar): Boolean;
begin
  if Assigned( fUnpackData ) then
    begin
      DoLog( '���������� ������: ������� - ' + FileDir + ', ��� ������ - ' + ArchDir + '\' + ArchName );
      try
        Result := fUnpackData( ArchDir, ArchName, FileDir );
      except
        on E:Exception do
          begin
            DOLog(Format('������ ���������� ������: %s', [E.Message]));
            raise Exception.Create('������ ���������� ����� ' + ArchName);
          end;
      end;
    end
  else
    DoLog( '���������� ������ ����������: ������� ���������� �� ���������.' );
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
// ���������� ������ ������ ������ (��������� FilesInArchive �������� �� ������ ���������)
// ������� �. 26.01.15
//
function CCryptoWrap.GetArchiveFiles(ArchName: string): TStringList;
var
  sTempFolder: string;
  sr: TSearchRec;
begin
  Result := TStringList.Create();
  sTempFolder := PrepareTempDir() +'\'+ ExtractFileName(ArchName);

  DoLog('���������� ������ ��� ��������� ������ ������: ������� - ' + sTempFolder + ', ��� ������ - ' + ArchName);

  if ForceDirectories(sTempFolder) then
    if CheckPacker(True) and
      UnpackData(PChar(ExtractFilePath(ArchName)), PChar(ExtractFileName(ArchName)), PChar(sTempFolder)) then
    begin
      DoLog('����� ' + ArchName  + ' ����������');
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
      DoLog('������ ���������� ������ ' + ArchName);
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
      DoLog( '������������ ����������������� �����: ���� - ' + Dir + '\' + FileName );
      Result := fCreateTxt( Dir, FileName, CustomsName, TypeInfo, CustomsCode, ReceiverName, Performer, Currency );
    end
  else
    DoLog( '������������ ����������������� ����� ����������: ������� ������������ �� ���������.' );
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
        DoLog( '���������� ���������� (packer.dll) �� ���������.' );
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
        DoLog( '���������� ���������� (verba.dll) �� ���������.' );
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
        DoLog( '���������� ���������� (CryptoPro.dll) �� ���������.' );
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
