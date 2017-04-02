unit ExceptHnd;

interface

implementation

uses
  JClDebug, Windows, SysUtils, Classes, JclSysInfo, Controls, Forms, JclPeImage,
    JclStrings, JclFileUtils, fdcExceptions, fdcMessages, Dialogs, JclHookExcept;

resourcestring
  RsAppError = '%s - application error';
  RsExceptionClass = 'Exception class: %s';
  RsExceptionAddr = 'Exception address: %p';
  RsStackList = 'Stack list, generated %s';
  RsModulesList = 'List of loaded modules:';
  RsOSVersion = 'System   : %s %s, Version: %d.%d, Build: %x, "%s"';
  RsProcessor = 'Processor: %s, %s, %d MHz %s%s';
  RsScreenRes = 'Display  : %dx%d pixels, %d bpp';
  RsActiveControl = 'Active Controls hierarchy:';
  RsThread = 'Thread: %s';
  RsMissingVersionInfo = '(no version info)';

  RsSendBugReportAddress = 'bugreport@yourdomain.com';
  RsSendBugReportSubject = 'Bug Report';

const
//  UM_CREATEDETAILS = WM_USER + $100;

  ReportToLogEnabled   = $00000001; // TExceptionDialog.Tag property
  DisableTextScrollbar = $00000002; // TExceptionDialog.Tag property

type
  TExcDialogSystemInfo = (siStackList, siOsInfo, siModuleList, siActiveControls);
  TExcDialogSystemInfos = set of TExcDialogSystemInfo;

   TExceptionHandler = class(TObject)
   private
    class procedure ExceptionHandler(Sender: TObject; E: Exception);
    class procedure ExceptionThreadHandler(Thread: TJclDebugThread);
    class procedure ShowException(E: Exception; Thread: TJclDebugThread);
   end;

function GetBPP: Integer;
var
  DC: HDC;
begin
  DC := GetDC(0);
  Result := GetDeviceCaps(DC, BITSPIXEL) * GetDeviceCaps(DC, PLANES);
  ReleaseDC(0, DC);
end;

function SortModulesListByAddressCompare(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := Integer(List.Objects[Index1]) - Integer(List.Objects[Index2]);
end;

procedure CreateReport(Lines: TStrings; const SystemInfo: TExcDialogSystemInfos);
const
  MMXText: array[Boolean] of PChar = ('', 'MMX');
  FDIVText: array[Boolean] of PChar = (' [FDIV Bug]', '');
var
  SL: TStringList;
  I: Integer;
  ModuleName: TFileName;
  CpuInfo: TCpuInfo;
  C: TWinControl;
  NtHeaders: PImageNtHeaders;
  ModuleBase: Cardinal;
  ImageBaseStr: string;
  StackList: TJclStackInfoList;
  procedure NextDetailBlock;
  begin
  end;
begin
  SL := TStringList.Create;
  try
    // Stack list
    if siStackList in SystemInfo then
    begin
      StackList := JclLastExceptStackList;
      if Assigned(StackList) then
      begin
        Lines.Add(Format(RsStackList, [DateTimeToStr(StackList.TimeStamp)]));
        StackList.AddToStrings(Lines, False, True, True);
        NextDetailBlock;
      end;
    end;
    // System and OS information
    if siOsInfo in SystemInfo then
    begin
      Lines.Add(Format(RsOSVersion, [GetWindowsVersionString, NtProductTypeString,
        Win32MajorVersion, Win32MinorVersion, Win32BuildNumber, Win32CSDVersion]));
      GetCpuInfo(CpuInfo);
      with CpuInfo do
        Lines.Add(Format(RsProcessor, [Manufacturer, CpuName,
          RoundFrequency(FrequencyInfo.NormFreq),
          MMXText[MMX], FDIVText[IsFDIVOK]]));
      Lines.Add(Format(RsScreenRes, [Screen.Width, Screen.Height, GetBPP]));
      NextDetailBlock;
    end;
    // Modules list
    if (siModuleList in SystemInfo) and LoadedModulesList(SL, GetCurrentProcessId) then
    begin
      Lines.Add(RsModulesList);
      SL.CustomSort(SortModulesListByAddressCompare);
      for I := 0 to SL.Count - 1 do
      begin
        ModuleName := SL[I];
        ModuleBase := Cardinal(SL.Objects[I]);
        Lines.Add(Format('[%.8x] %s', [ModuleBase, ModuleName]));
        NtHeaders := PeMapImgNtHeaders(Pointer(ModuleBase));
        if (NtHeaders <> nil) and (NtHeaders^.OptionalHeader.ImageBase <> ModuleBase) then
          ImageBaseStr := Format('<%.8x> ', [NtHeaders^.OptionalHeader.ImageBase])
        else
          ImageBaseStr := StrRepeat(' ', 11);
        if VersionResourceAvailable(ModuleName) then
          with TJclFileVersionInfo.Create(ModuleName) do
          try
            Lines.Add(ImageBaseStr + BinFileVersion + ' - ' + FileVersion);
            if FileDescription <> '' then
              Lines.Add(StrRepeat(' ', 11) + FileDescription);
          finally
            Free;
          end
        else
          Lines.Add(ImageBaseStr + RsMissingVersionInfo);
      end;
      NextDetailBlock;
    end;
    // Active controls
    if (siActiveControls in SystemInfo) and (Screen.ActiveControl <> nil) then
    begin
      Lines.Add(RsActiveControl);
      C := Screen.ActiveControl;
      while C <> nil do
      begin
        Lines.Add(Format('%s "%s"', [C.ClassName, C.Name]));
        C := C.Parent;
      end;
      NextDetailBlock;
    end;
  finally
    SL.Free;
  end;
end;

procedure GetStackList(AStackList: TStringList);
const
  MMXText: array[Boolean] of PChar = ('', 'MMX');
  FDIVText: array[Boolean] of PChar = (' [FDIV Bug]', '');
var
  C: TWinControl;
  StackList: TJclStackInfoList;
begin
  StackList := JclLastExceptStackList;
  if Assigned(StackList) then
  begin
    AStackList.Add(Format(RsStackList, [DateTimeToStr(StackList.TimeStamp)]));
    StackList.AddToStrings(AStackList, False, True, True);
  end;
end;

var
  ExceptionShowing: Boolean;


class procedure TExceptionHandler.ExceptionHandler(Sender: TObject; E: Exception);
begin
  if ExceptionShowing then
    Application.ShowException(E)
  else
  begin
    ExceptionShowing := True;
    try
      ShowException(E, nil);
    finally
      ExceptionShowing := False;
    end;
  end;
end;

class procedure TExceptionHandler.ExceptionThreadHandler(
  Thread: TJclDebugThread);
begin

end;

class procedure TExceptionHandler.ShowException(E: Exception;
  Thread: TJclDebugThread);
var
  S: TStringList;
  UserMessage: string;
  UserHint: string;
begin
  if not (E is  EfdcException) then
     ParseError(E, UserMessage, UserHint)
  else
   begin
     UserMessage := EfdcException(E).UserMessage;
     UserHint := EfdcException(E).UserHint;
     if E.Message = '' then
       E.Message := UserMessage + '.'#13 + UserHint;
   end;
  S := TStringList.Create;
  try
    CreateReport(S, [siStackList]);
    fdcMessages.MessageDlg(UserMessage, UserHint,
      Format('Ошибка:'#13'%s'#13'Стек:'#13+'%s', [E.Message, S.Text]),
      mtError, [mbOK], 0)
  finally
    S.Free;
  end;
end;

//==================================================================================================
// Exception handler initialization code
//==================================================================================================

procedure InitializeHandler;
begin
  JclStackTrackingOptions := JclStackTrackingOptions + [stRawMode];
  {$IFNDEF HOOK_DLL_EXCEPTIONS}
  JclStackTrackingOptions := JclStackTrackingOptions + [stStaticModuleList];
  {$ENDIF HOOK_DLL_EXCEPTIONS}
  JclDebugThreadList.OnSyncException := TExceptionHandler.ExceptionThreadHandler;
  JclStartExceptionTracking;
  {$IFDEF HOOK_DLL_EXCEPTIONS}
  if HookTApplicationHandleException then
    JclTrackExceptionsFromLibraries;
  {$ENDIF HOOK_DLL_EXCEPTIONS}
  Application.OnException := TExceptionHandler.ExceptionHandler;
end;

//--------------------------------------------------------------------------------------------------

procedure UnInitializeHandler;
begin
  Application.OnException := nil;
  JclDebugThreadList.OnSyncException := nil;
  JclUnhookExceptions;
  JclStopExceptionTracking;
end;

//--------------------------------------------------------------------------------------------------

initialization
  InitializeHandler;

finalization
  UnInitializeHandler;

end.
