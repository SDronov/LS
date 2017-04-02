{
  Библиотека различных вспомогательных утилит.

  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcUtils.pas $
  $Revision: 5993 $
  $Author: dnovokshonov $
  $Date: 2008-12-11 13:02:22 +0400 (Р§С‚, 11 РґРµРє 2008) $
}

unit fdcUtils;

interface

uses
  Windows, Controls, DB, Graphics, Classes, ActnList, dxTree, Registry;

{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}

const
  cNewIDNexus  = 0;  // значение идентификатора новой записи
  cIDPrecision = 15; // размерность идентификаторов - number(15)

{
  Обрезает строку AStr справа до ALength символов и
  заменяет последние символы на ATail.
  Returns:
    Возвращает полученную строку.
}
function CutRight(AStr: string; ALength: integer = 30; ATail: string = '...'): string;

{
  Проверяет AStr является ли строка пустой либо
  состоящей из одних пробелов.
}
function IsBlank(AStr: string): boolean;

{
Определение каталога Windows.
  Returns:
    Возвращает путь к папке Windows.
}
function GetWinDir: string;

{
Определение системного каталога Windows.
  Returns:
    Возвращает путь к папке системного каталога Windows.
}
function GetSysDir: string;

{
Определение временного каталога Windows.
  Returns:
    Возвращает путь к папке временных файлов.
}
function GetTempDir: string;

{
Определение временного каталога приложения.
  Returns:
    Возвращает путь к папке временных файлов приложения.
}
function GetAppTempDir: string;

{
Очистка временного каталога приложения.
  Parameters:
    AFileNameMask - маска имени удаляемых файлов
  Remarks:
    см примечания к ClearDir.
}
procedure ClearAppTempDir(AFileNameMask: string = '*.*'; ADoRaise: boolean = False);

{
Очистка указанного каталога.
  Parameters:
    APath - имя очищаемой каталога.
    AFileNameMask - маска имени удаляемых файлов
  Remarks:
    Не удаляет вложенные подкаталоги.
}
procedure ClearDir(APath: string; AFileNameMask: string = '*.*');

{
Копирование файла.
  Parameters:
    ASourceFile - Имя файла - источника
    ATargetFile - Имя нового файла
  Remarks:
    В случае, если файл ATargetFile существует, он предварительно удаляется.
}
procedure CopyFile(const ASourceFile, ATargetFile: string);

{
Удаление файла.
  Parameters:
    AFileName - Имя файла
  Remarks:
    Перед удалением файла прозводится проверка на его наличие.
}
procedure DeleteFile(AFileName: string);

{
 Открытие файла средствами Windows Shell.
 Запускает оболочку, ассоциированную с расширением файла,
 передаваемого ей в качестве параметра.
  Parameters:
    AFileName - Имя файла, папки, документа, URL ...
    AParameters - Cтрока параметров запускаемой программы
    ADirectory - Директория по умолчанию
    AShowCmd -   Состояние окна запущенной программы
  Remarks:
   Если AFileName - приложение, то AParameters может содержать строку параметров приложения.
   Если AFileName - документ или папка, AParameters должен быть nil.
}
procedure ShellOpen(AFileName: string; AParameters: string = '';
  ADirectory: string = ''; AShowCmd: integer = SW_SHOWNORMAL);

{
  Определение информации о версии исполняемого файла.
  Parameters:
    AFileName - Имя файла, информацию о версии которого необходимо получить
    AWhat - Открытый (динамически формирующийся в момент вызова) массив
           строк-запросов по разделам версии. Допустимые строки-запросы:<p>
           'CompanyName', 'FileDescription',  'FileVersion',
           'InternalName', 'LegalCopyright',  'OriginalFilename',
           'ProductName',  'ProductVersion'.
    AVerInfo - Cтрока параметров запускаемой программы
  Remarks:
    Сопоставление элементов AWhat и AVerInfo - позиционное:
    n-ый элемент aVerInfo - ответ на запрос в n-ом элементе AWhat.
    Если размеры в AWhat и aVerInfo различны, aVerInfo содержит ответы
    на первые n запросов из AWhat, где n = Min(размер AVerInfo, размер AWhat),
    при n < размер AVerInfo, оставшиеся элементы массива инициализируются
    пустой строкой.
  Example:
  <Code>
    <b>var</b>
      InternalName, FileVersion: string;
    <b>begin</b>
      GetFileVersion(PChar(Application.ExeName),
        ['InternalName', 'FileVersion'],
        [@InternalName, @FileVersion]);
      Label1.Caption := InternalName + ' ' + FileVersion;
    <b>end;</b>
  </Code>
}
procedure GetFileVersion(AFileName: PChar; const AWhat: array of string;
  AVerInfo: array of PString);

{
  Определение информации о версии приложения.
  Parameters:
    AWhat - Массив строк-запросов по разделам версии.
    Допустимые строки-запросы:<p>
           'CompanyName', 'FileDescription',  'FileVersion',
           'InternalName', 'LegalCopyright',  'OriginalFilename',
           'ProductName',  'ProductVersion'.
    AVerInfo - Cтрока параметров запускаемой программы
  Remarks:
    Сопоставление элементов AWhat и AVerInfo - позиционное:
    n-ый элемент aVerInfo - ответ на запрос в n-ом элементе AWhat.
    Если размеры в AWhat и aVerInfo различны, aVerInfo содержит ответы
    на первые n запросов из AWhat, где n = Min(размер AVerInfo, размер AWhat),
    при n < размер AVerInfo, оставшиеся элементы массива инициализируются
    пустой строкой.
  Example:
  <Code>
    <b>var</b>
      InternalName, FileVersion: string;
    <b>begin</b>
      GetAppVersion(
        ['InternalName', 'FileVersion'],
        [@InternalName, @FileVersion]);
      Label1.Caption := InternalName + ' ' + FileVersion;
    <b>end;</b>
  </Code>
}
procedure GetAppVersion(const AWhat: array of string; AVerInfo: array of
  PString); overload;

{
  Возвращает строку с версией приложения.
}
function GetAppVersion: string; overload;

{
  Возвращает стандартное расположение ключа реестра
  для хранения настроек приложения.
}
function GetAppRegistryKey: string;

{
  Удаляет ключ AKey реестра из ARootKey. В случает успеха
  возвращается True, иначе False.
}
function DeleteRegistryKey(AKey: string; ARootKey: HKEY = HKEY_CURRENT_USER): boolean;

{
  Читает значение AValue типа AValueType ключа AKeyName реестра
  из ARootKey.
}
type
  TRegValueType = (rvBoolean, rvInteger, rvFloat, rvString, rvDateTime);
function ReadRegistryValue(AKey, AValue: string; AValueType: TRegValueType;
  ARootKey: HKEY = HKEY_CURRENT_USER): Variant;

{
  Записывает значение AValue параметра AName ключа AKey в реестр ARootKey.
}
procedure WriteRegistryValue(AKey, AName: string; const AValue: Variant;
  ARootKey: HKEY = HKEY_CURRENT_USER);
{
  Вызывает стандартный системный диалог выбора папки.
  Parameters:
    ACaption - Заголовок диалога
    ARoot - Корневая папка. Начиная с нее будут показаны папки для выбора.
    ADirectory - Папка выбранная пользователем
  Remarks:
    В отличие от стандартного метода FileCtrl.SelectDirectory вызывает диалог
    в новом стиле WinXP.
  Example:
  <Code>
    <b>var</b>
      Directory: string;
    <b>begin</b>
      if SelectDirectory('Выберите папку', '', Directory) then
        DoSomeWork;
    <b>end;</b>
  </Code>
}
function SelectDirectory(const ACaption: string; const ARoot: WideString;
  var ADirectory: string): Boolean;

{
  Определение текущей языковой раскладки клавиатуры.
  Returns:
    Возвращает сокращенное название текущей языковой раскладки клавиатуры.
}
function GetCurLangName: string;

{
  Определение "знака" числа X.
  Returns:
    Возвращает 1 при X > 0, -1 при X < 0 и 0 при X = 0.
}
function Sign(X: Double): integer;

{
  Аналог if-then-else блока.
  Returns:
    Возвращает ATrue в случае, если выражение AExpr истинно,
    иначе возвращает AFalse.
}
function IfElse(AExpr: Boolean; ATrue, AFalse: Variant): Variant;

function IsDigit(c: char): boolean;
function IsRAlpha(c: char): boolean;
function IsEAlpha(c: char): boolean;
function IsAlpha(c: char): boolean;
function IsAlphaDigit(c: char): boolean;

{
Определение, является ли строка S числом с плавающей точкой.
  Returns:
    Возвращет True, если строка S является числом с плавающей точкой,
    иначе возвращает False.
  Remarks
   Если строка S является числом с плавающей точкой,
   то присваивает полученное число переменной AResult.
  Example:
  <Code>
    <b>var</b>
      v: double;
    <b>begin</b>
      if IsDbl(s, v) then
        Cell.SetValue(v);
    <b>end</b>;
}
function IsDbl(S: string; var AResult: Double): Boolean;

{
Определение, является ли строка S целым числом.
  Returns:
    Возвращет True, если строка S является целым числом,
    иначе возвращает False.
  Remarks
   Если строка S является целым числом,
   то присваивает полученное число переменной AResult.
  Example:
  <Code>
    <b>var</b>
      v: integer;
    <b>begin</b>
      if IsInt(s, v) then
        Cell.SetValue(v);
    <b>end</b>;
}
function IsInt(S: string; var AResult: Integer): Boolean;

{
Показывает оглавление файла справки AHelpFileName.
  Remarks
    Предназначена для работы со справочной подсистемой в CHM - формате.
}
procedure ShowHelpContents(const AHelpFileName: string);

{
Показывает раздел AIndex файла справки AHelpFileName.
  Remarks
    Предназначена для работы со справочной подсистемой в CHM - формате.
}
procedure ShowHelpContent(const AHelpFileName: string; AIndex: integer);

{
Устанавливает курсор мыши приложения в ACursor.
  Remarks
    Предназначена для управления курсором во время длительных операций
    и предотвращает эффект "мигания" при частой смене курсора.
  Note
    Реализовано "скобочное" управление курсором. Возвращаемый указатель
    на интерфейс Delphi автоматически освободит как только выполнение выйдет
    из области видимости первого вызвавшего метода. Таким образом, после
    освобождения интерфейса полученного в результате первого вызова метода,
    произойдет уничтожение объекта TCursorController и восстановление
    первоначального вида курсора. 

  Example:
  <Code>
  <b>procedure</b> TForm1.Button1Click(Sender: TObject);
  <b>begin</b>
    DisplayCursor(crSQLWait);
    DoSomeWork;
  <b>end</b>;
}
function DisplayCursor(ACursor: TCursor): IUnknown;

{
  Устанавливает курсор мыши приложения в crHourGlass.
    Remarks
      см. примечание к DisplayCursor.
    Note
      см. примечание к DisplayCursor.
    Example:
    <Code>
    <b>procedure</b> TForm1.btnSomeWorkClick(Sender: TObject);
    <b>begin</b>
      DisplayBusyCursor;  // <--
      DoSomeWork;
    <b>end</b>;
}
function DisplayBusyCursor: IUnknown;

{
  Конвертирует Bitmap в Icon.
}
procedure BitmapToIcon(ABitmap: TBitmap; AIcon: TIcon);

{
  Идентификатор считается новым (виртуальным, несуществующим),
  если его значение меньше либо равно 0.
}
function IsNewID(AID: double): boolean;

{
  Преобразует идентификатор в строку.
}
function IDToStr(AID: double): string;

{
  Преобразует идентификатор в вариант.
}
function ID2Var(AID: integer): Variant;

{
  Перечитывает данные ADataSet, сохраняя текущую позицию. При этом набор
  данных открывается, если он не был открыт ранее. Параметр AReOpen
  задает необходимость принудительного закрытия и открытия набора данных.
}
procedure RefreshDataset(ADataSet: TDataset; AReOpen: boolean = False);

{
  Читает значение поля AFieldName набора данных ADataset и
  приводит его к типу ValueType. В случае отсутствия заданного
  поля возвращается null.
}
function ReadField(ADataset: TDataset; AFieldName: string; AValueType:
  TVarType): Variant;

{
  Записывает значение AValue типа ValueType в поле AFieldName
  набора данных ADataset. В случае отсутствия заданного поля
  запись не производится.
}
procedure WriteField(ADataset: TDataset; AFieldName: string; AValue: Variant;
  AValueType: TVarType);

{
  Читает строку из бинарного 16-ричного потока AStream и
  возвращает результат.
}
function ReadHexString(AStream: TMemoryStream): string;

{
  Записывает строку AStr в бинарный 16-ричный поток AStream.
}
procedure WriteHexString(AStr: string; AStream: TMemoryStream);

procedure HighlightEAlpha(s: string; Canvas: TCanvas; Rect: TRect;
	Color: TColor = clRed; FontStyle: TFontStyles = []);

{
  Раскрашивает латинские буквы в заданный цвет и с заданным стилем
}

{ ищет недопустимые символы. Допустимые символы ASCII с 32 по 126 (кроме 124), 168, 184, 185 и с 192 по 255}
procedure checkIllegalChars(const aDataSet: TDataSet; var aMsgList: TStrings );


implementation

uses
  Forms, SysUtils, Math, ShellAPI, ShlObj, ActiveX, Variants,
  fdcConsts, ComObj, Dialogs{XXX};

const
  CMaxDirLength: Integer = 1024;

function CutRight(AStr: string; ALength: integer = 30; ATail: string = '...'):
  string;
begin
  if Length(AStr) > ALength then
    Result := Copy(AStr, 1, ALength - Length(ATail)) + ATail
  else
    Result := AStr;
end;

function IsBlank(AStr: string): boolean;
begin
  Result := Trim(AStr) = '';
end;

function GetWinDir: string;
var
  Buffer: PChar;
begin
  Result := '';
  GetMem(Buffer, CMaxDirLength);
  try
    if GetWindowsDirectory(Buffer, CMaxDirLength) <> 0 then
      Result := string(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;

function GetSysDir: string;
var
  Buffer: PChar;
begin
  Result := '';
  GetMem(Buffer, CMaxDirLength);
  try
    if GetSystemDirectory(Buffer, CMaxDirLength) <> 0 then
      Result := string(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;

function GetTempDir: string;
var
  Buffer: PChar;
begin
  Result := '';
  GetMem(Buffer, CMaxDirLength);
  try
    if GetTempPath(CMaxDirLength, Buffer) <> 0 then
      Result := string(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;

function GetAppTempDir: string;
begin
  Result := IncludeTrailingPathDelimiter(GetTempDir) +
    ChangeFileExt(ExtractFileName(Application.ExeName), '');
  if Result <> '' then
    ForceDirectories(Result);
end;

procedure ClearAppTempDir(AFileNameMask: string = '*.*';
  ADoRaise: boolean = False);
begin
  try
    ClearDir(GetAppTempDir, AFileNameMask);
  except
    if ADoRaise then
      raise;
  end;  
end;

procedure CopyFile(const ASourceFile, ATargetFile: string);
begin
  FileSetAttr(ATargetFile, FileGetAttr(ATargetFile) xor faReadOnly);
  Windows.DeleteFile(PChar(ATargetFile));
  Windows.CopyFile(PChar(ASourceFile), PChar(ATargetFile), False);
end;

procedure DeleteFile(AFileName: string);
begin
  if FileExists(AFileName) then
    SysUtils.DeleteFile(AFileName);
end;

procedure ClearDir(APath: string; AFileNameMask: string = '*.*');
var
  sr: TSearchRec;
  path: string;
begin
  path := IncludeTrailingPathDelimiter(APath);
  if FindFirst(path + AFileNameMask, faAnyFile, sr) = 0 then
  begin
    repeat
      DeleteFile(path + sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure ShellOpen(AFileName: string; AParameters: string = '';
  ADirectory: string = ''; AShowCmd: integer = SW_SHOWNORMAL);
begin
  ShellExecute(0,
    'open',
    PAnsiChar(AFileName),
    PAnsiChar(AParameters),
    PAnsiChar(ADirectory),
    AShowCmd);
end;

procedure GetFileVersion(AFileName: PChar; const AWhat: array of string;
  AVerInfo: array of PString);
var
  { необходиа для вызова GetFileVersionInfoSize, см. Win32.hlp }
  toAcceptZero: THandle;
  { размер в байтах глобального блока данных о версии }
  globalVersionInfoSize: DWORD;
  { размер в байтах какого-либо раздела версии }
  partialVersionInfoSize: UINT;

  { указатель на глобальный блок данных о версии }
  GlobalVersionInfo,
    { указатель на какой-либо раздел версии [внутри глобального блока] }
  PartialVersionInfo: Pointer;
  {строка поиска раздела в глобальном блоке}
  StringForSearch: string;
  { счетчик цикла }
  i: integer;
begin
  { Инициализация на случай несовпадения размеров массивов AWhat и aVerInfo }
  for i := Low(AVerInfo) to High(AVerInfo) do
    AVerInfo[i]^ := '';

  { Получаем размер глобального блока даных - для резервирования памяти }
  globalVersionInfoSize := GetFileVersionInfoSize(AFileName, toAcceptZero);

  { Резервируем память}
  GetMem(GlobalVersionInfo, globalVersionInfoSize);
  try
    {Считываем глобальный блок данных о версии в зарезервированный участок памяти }
    if GetFileVersionInfo(
      AFileName,
      0,
      globalVersionInfoSize,
      GlobalVersionInfo) then
    begin
      {Интерпретация значений разделов версии зависит от языка файла,
       поэтому прежде всего определяем язык}
      StringForSearch := '\VarFileInfo\Translation';
      if VerQueryValue(
        GlobalVersionInfo,
        PChar(StringForSearch),
        PartialVersionInfo,
        partialVersionInfoSize) then
      begin
        {Получили указатель на буфер, в котором хранится язык файла}
        FmtStr(StringForSearch, '%p', [Ptr((PInteger(PartialVersionInfo))^)]);
        {Формируем подстроку поиска с учетом языка}
        StringForSearch := '\StringFileInfo\' +
          Copy(StringForSearch, 5, 4) {Lang} +
        Copy(StringForSearch, 1, 4) {CharSet} +
        '\';
        {Последовательно обрабатываем запросы массива AWhat}
        for i := Low(AVerInfo) to Min(High(AWhat), High(AVerInfo)) do
          if VerQueryValue(
            GlobalVersionInfo,
            PChar(StringForSearch + AWhat[i]),
            PartialVersionInfo,
            partialVersionInfoSize) then
            AVerInfo[i]^ := PChar(PartialVersionInfo);
      end;
    end;
  finally
    {Освобождаем память, задействованную под хранение глобального блока данных}
    FreeMem(GlobalVersionInfo, globalVersionInfoSize);
  end;
end;

procedure GetAppVersion(const AWhat: array of string; AVerInfo: array of
  PString);
begin
  GetFileVersion(PChar(Application.ExeName), AWhat, AVerInfo);
end;

function GetAppVersion: string;
begin
  GetAppVersion(['FileVersion'], [@Result]);
end;

function GetAppRegistryKey: string;
var
  InternalName: string;
begin
  GetAppVersion(['InternalName'], [@InternalName]);
  Result := SCompanyRegistryKey + '\' + InternalName;
end;

function DeleteRegistryKey(AKey: string; ARootKey: HKEY = HKEY_CURRENT_USER): boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := ARootKey;
    Result := Reg.DeleteKey(AKey);
  finally
    Reg.Free;
  end;
end;

procedure WriteRegistryValue(AKey, AName: string; const AValue: Variant;
  ARootKey: HKEY = HKEY_CURRENT_USER);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := ARootKey;
    if Reg.OpenKey(AKey, True) then
      case VarType(AValue) of
        varBoolean: Reg.WriteBool(AName, AValue);
        varInteger,
        varSmallint,
        varShortInt: Reg.WriteInteger(AName, AValue);
        varCurrency:   Reg.WriteCurrency(AName, AValue);
        varDouble:   Reg.WriteFloat(AName, AValue);
        varDate: Reg.WriteDateTime(AName, AValue);
        varInt64: Reg.WriteInteger(AName, AValue);
        else  Reg.WriteString(AName, AValue);
      end;
  finally
    Reg.Free;
  end;
end;

function ReadRegistryValue(AKey, AValue: string; AValueType: TRegValueType;
  ARootKey: HKEY = HKEY_CURRENT_USER): Variant;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := ARootKey;
    if Reg.OpenKey(AKey, False) and
       Reg.ValueExists(AValue)
    then
      case AValueType of
        rvBoolean  : Result := Reg.ReadBool(AValue);
        rvInteger  : Result := Reg.ReadInteger(AValue);
        rvFloat    : Result := Reg.ReadFloat(AValue);
        rvString   : Result := Reg.ReadString(AValue);
        rvDateTime : Result := Reg.ReadDateTime(AValue);
      else
        Result := Unassigned;
      end    
    else
      Result := Unassigned;  
  finally
    Reg.Free;
  end;
end;

function SelectDirCB(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer
  stdcall;
var
  wa, rect: TRect;
  dialogPT: TPoint;
begin
  Result := 0;
  case uMsg of
    BFFM_INITIALIZED:
      begin
        if lpData <> 0 then
          SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpdata);
        wa := Screen.WorkAreaRect;
        GetWindowRect(Wnd, Rect);
        dialogPT.X := ((wa.Right - wa.Left) div 2) -
          ((rect.Right - rect.Left) div 2);
        dialogPT.Y := ((wa.Bottom - wa.Top) div 2) -
          ((rect.Bottom - rect.Top) div 2);
        MoveWindow(Wnd,
          dialogPT.X,
          dialogPT.Y,
          Rect.Right - Rect.Left,
          Rect.Bottom - Rect.Top,
          True);
      end;
  end; // case
end;

function SelectDirectory(const ACaption: string; const ARoot: WideString;
  var ADirectory: string): Boolean;
var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  OldErrorMode: Cardinal;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;
begin
  Result := False;

  { проверить что папка существует }
  if not DirectoryExists(ADirectory) then
    ADirectory := '';

  { инициализировать структуру для открытия папки }
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);

  { вызвать диалог }
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try

      { получить PIDL для корневой папки }
      RootItemIDList := nil;
      if ARoot <> '' then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(ARoot), Eaten, RootItemIDList, Flags);
      end;

      { сформировать структуру для открытия папки }
      with BrowseInfo do
      begin
        hwndOwner := Application.Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(ACaption);
        ulFlags := BIF_USENEWUI + BIF_RETURNONLYFSDIRS + BIF_VALIDATE;
        lpfn := SelectDirCB;
        if ADirectory <> '' then
          lParam := Integer(PChar(ADirectory));
      end;

      { открыть диалог }
      WindowList := DisableTaskWindows(0);
      OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        SetErrorMode(OldErrorMode);
        EnableTaskWindows(WindowList);
      end;

      { преобразовать PIDL выбранной папки в ее строковое представление }
      Result := ItemIDList <> nil;
      if Result then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        ADirectory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

function GetCurLangName: string;
var
  strKeyBoardLayoutName: PChar;
  strParamName: string;
  Reg: TRegistry;
begin
  Result := '';
  strKeyBoardLayoutName := StrAlloc(50);
  try
    { get current keyboard layout }
    if GetKeyBoardLayoutName(strKeyBoardLayoutName) then
    begin
      { extract registry param name }
      strParamName := Copy(strKeyBoardLayoutName,
        Length(strKeyBoardLayoutName) - 3,
        4);
      { read lang short name from registry }
      Reg := TRegistry.Create;
      try
        Reg.RootKey := HKEY_CLASSES_ROOT;
        if Reg.OpenKey('MIME\Database\Rfc1766', False) and
          Reg.ValueExists(strParamName) then
          Result := Reg.ReadString(strParamName);
      finally
        Reg.Free;
      end;
    end;
  finally
    StrDispose(strKeyBoardLayoutName);
  end;
end;

function Sign(X: Double): integer;
begin
  if X > 0 then
    Result := 1
  else if X < 0 then
    Result := -1
  else
    Result := 0;
end;

function IfElse(AExpr: Boolean; ATrue, AFalse: Variant): Variant;
begin
  if AExpr then
    Result := ATrue
  else
    Result := AFalse;
end;

function IsDigit(c: char): boolean;
begin
  Result := (c>='0') and (c<='9');
end;

function IsRAlpha(c: char): boolean;
begin
  Result := (c>='А') and (c<='я');
end;

function IsEAlpha(c: char): boolean;
begin
  Result := ((c>='A') and (c<='Z')) or
            ((c>='a') and (c<='z'))
end;

function IsAlpha(c: char): boolean;
begin
  Result := IsRAlpha(c) or IsEAlpha(c);
end;

function IsAlphaDigit(c: char): boolean;
begin
  Result := IsAlpha(c) or IsDigit(c);
end;

function IsDbl(S: string; var AResult: Double): Boolean;
var
  V: Extended;
begin
  Result := TextToFloat(PChar(S), V, fvExtended);
  if Result then
    AResult := V;
end;

function IsInt(S: string; var AResult: Integer): Boolean;
var
  V: Double;
begin
  Result := IsDbl(S, V) and (Round(V) = V);
  if Result then
    AResult := Round(V);
end;

function ShowCHMHelp(hwndCaller: HWND; pszFile: PChar; uCommand: Integer;
  dwData: DWORD): HWND; stdcall; external 'hhctrl.ocx' name 'HtmlHelpA';

procedure ShowHelpContents(const AHelpFileName: string);
const
  HH_DISPLAY_TOC = $0001;
begin
  try
    ShowCHMHelp(Application.Handle, PChar(AHelpFileName), HH_DISPLAY_TOC, 0);
  except
    raise Exception.Create('Ошибка справочной подсистемы');
  end;
end;

procedure ShowHelpContent(const AHelpFileName: string; AIndex: integer);
const
  HH_HELP_CONTEXT = $000F;
begin
  try
    ShowCHMHelp(Application.Handle, PChar(AHelpFileName), HH_HELP_CONTEXT,
      AIndex);
  except
    raise Exception.Create('Ошибка справочной подсистемы');
  end;
end;

type
  { TCursorController }
  TCursorController = class(TInterfacedObject, IUnknown)
  private
    FSavedCursor: TCursor;
  public
    constructor Create(ACursor: TCursor);
    destructor Destroy; override;
  end;

var
  CursorController: TCursorController;

constructor TCursorController.Create(ACursor: TCursor);
begin
  inherited Create;
  FSavedCursor := Screen.Cursor;
  Screen.Cursor := ACursor;
end;

destructor TCursorController.Destroy;
begin
  inherited;
  CursorController := nil;
  Screen.Cursor := FSavedCursor;
end;

function DisplayCursor(ACursor: TCursor): IUnknown;
begin
  if not Assigned(CursorController) then
    CursorController := TCursorController.Create(ACursor);
  Result := CursorController;
end;

function DisplayBusyCursor: IUnknown;
begin
  Result := DisplayCursor(crHourGlass);
end;

procedure BitmapToIcon(ABitmap: TBitmap; AIcon: TIcon);
var
  ImageList: TImageList;
begin
  ImageList := TImageList.CreateSize(ABitmap.Width, ABitmap.Height);
  try
    ImageList.AddMasked(ABitmap, ABitmap.TransparentColor);
    ImageList.GetIcon(0, AIcon);
  finally
    ImageList.Free;
  end;
end;

function IsNewID(AID: double): boolean;
begin
  Result := AID <= cNewIDNexus;
end;

function IDToStr(AID: double): string;
begin
  Result := FloatToStrF(AID, ffFixed, cIDPrecision, 0);
end;

function ID2Var(AID: integer): Variant;
begin
  Result := IfElse(not IsNewID(AID), AID, Unassigned);
end;

procedure RefreshDataset(ADataSet: TDataset; AReOpen: boolean = False);
var
  SavePosition: TBookmark;
begin
  { check dataset }
  if not Assigned(ADataSet) then
    Exit;

  { refresh dataset }
  if not ADataSet.Active then
    ADataSet.Open
  else begin
    { disable data-aware controls }
    ADataset.DisableControls;
    try
      { save position }
      SavePosition := ADataset.GetBookmark;
      try
        { refresh data }
        if AReOpen then begin
          ADataset.Close;
          ADataset.Open;
        end
        else
          ADataSet.Refresh;
        { restore saved position }
        if (ADataset.RecordCount > 0) and
            ADataset.BookmarkValid(SavePosition) then
          ADataset.GotoBookmark(SavePosition);
      finally
        { free bookmark }
        ADataset.FreeBookmark(SavePosition);
      end;
    finally
      { enable data-aware controls }
      ADataSet.EnableControls;
    end;
  end;
end;

function GetDefVarValue(AVarType: TVarType): Variant;
begin
  case AVarType of
    varEmpty, varUnknown, varAny, varTypeMask, varArray, varVariant, varByRef:
      Result := Unassigned;
    varNull:
      Result := Null;
    varSmallint, varInteger, varSingle, varDouble, varCurrency, varShortInt,
      varByte, varWord, varLongWord, varInt64, varDate, varDispatch, varError:
      Result := 0;
    varOleStr, varStrArg, varString:
      Result := '';
    varBoolean:
      Result := False;
    else
      Result := Unassigned;
  end;
end;

function ReadField(ADataset: TDataset; AFieldName: string; AValueType:
  TVarType): Variant;
var
  Field: TField;
begin
  { find field }
  Field := ADataset.FindField(AFieldName);
  { read field data }
  if Assigned(Field) and
    (not Field.IsNull) then
    Result := Field.AsVariant
  else
    Result := Null;
  { assert null field value }
  if VarIsNull(Result) or
    VarIsEmpty(Result) then
    Result := GetDefVarValue(AValueType);
  { cast field value to the specified type }
  Result := VarAsType(Result, AValueType)
end;

procedure WriteField(ADataset: TDataset; AFieldName: string; AValue: Variant;
  AValueType: TVarType);
var
  Field: TField;
begin
  Field := ADataset.FindField(AFieldName);
  if Assigned(Field) then
    if not VarIsEmpty(AValue) then
      Field.AsVariant := VarAsType(AValue, AValueType)
    else
      Field.Clear;  
end;

function BufferToHexString(buffer: Pointer; size: integer): string;
var
  i: integer;
  ss: string;
begin
  SetLength(result, size * 2);
  for i := 0 to size - 1 do
  begin
    ss := IntToHex(byte(buffer^), 2);
    result[i * 2 + 1] := ss[1];
    result[i * 2 + 2] := ss[2];
    inc(PByte(buffer));
  end;
end;

function ReadHexString(AStream: TMemoryStream): string;
begin
  SetLength(Result, AStream.Size * 2);
  BinToHex(AStream.Memory, PChar(Result), AStream.Size);
end;

procedure WriteHexString(AStr: string; AStream: TMemoryStream);
begin
  AStream.Size := Length(AStr) div 2;
  HexToBin(PChar(AStr), AStream.Memory, AStream.Size);
end;

procedure HighlightEAlpha(s: string; Canvas: TCanvas; Rect: TRect;
	Color: TColor = clRed; FontStyle: TFontStyles = []);
var	i: integer;
	  x: integer;
	  XR: TRect;
	  DefFontColor: TColor;
	  DefFontStyle: TFontStyles;
begin
  XR := Rect;
  XR.Right := XR.Right - 1;
  Canvas.FillRect(Rect);
  x := 0;

  DefFontColor := Canvas.Font.Color;
  DefFontStyle := Canvas.Font.Style;

  for i:=1 to length(s) do
	  begin
    	if IsEAlpha(s[i]) then
	      begin
      		Canvas.Font.Color := Color;
		      Canvas.Font.Style := FontStyle;
    		end
	     else
		    begin
		      Canvas.Font.Color := DefFontColor;
		      Canvas.Font.Style := DefFontStyle;
    		end;

	    XR := Rect;
	    XR.Left := Rect.Left + 1 + x;
	    XR.Right := XR.Left + Canvas.TextWidth(s[i]);
	    if XR.Left > (Rect.Right-1) then break;

	    Canvas.TextRect(XR,XR.Left,XR.Top,s[i]);
	    x := x + Canvas.TextWidth(s[i]);
	  end;

  Canvas.Font.Color := DefFontColor;
  Canvas.Font.Style := DefFontStyle;
end;


procedure checkIllegalChars(const aDataSet: TDataSet; var aMsgList: TStrings );
(* Текст, строка символов без пробелов в начале и в конце – допустимые символы ASCII с 32 по 126 (кроме 124), 168, 184, 185 и с 192 по 255.
   При наличии в исходной строке символа с кодом 124 «|» он заменяется символом « » (пробел). *)
const
 legalChars = [ #32..#123, #124, #125, #126, #168, #184, #185, #192..#255];
var
 f, c: integer;
 s: string;
begin
 for f := 0 to aDataSet.FieldCount - 1 do
  if ( aDataSet.Fields[f].DataType = ftString ) then begin
    s:= aDataSet.Fields[f].asString;
    for c := 1 to length(s) do
      if not( s[c] in legalChars ) then begin
        if not assigned(aMsgList) then aMsgList:= TStringList.Create;
        aMsgList.Add( format('Поле: "%s"  Позиция: %d  Недопустимый символ: "%s"', [ aDataSet.Fields[f].DisplayLabel, c, s[c] ]) );
      end;
  end;{ if ( dsData.Fields[f].DataType = ftString ) .. }
end;


initialization
  CursorController := nil;

end.

