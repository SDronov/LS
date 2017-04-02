{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2144 $
  $Author: alexvolo $
  $Date: 2006-12-22 00:00:11 +0400 (РџС‚, 22 РґРµРє 2006) $
}

unit IaccUtils;

interface

uses
  DB, Controls, SysUtils;

  procedure SetDefaultParamTypes(const aParamsArr: array of TParams);
  procedure DummyLine;
//  function IfElse(ACondition: Boolean; ATrueObject, AFalseObject: TObject): TObject;
  function SelectDirectoryEx(const Caption: string; const Root: WideString;
    var Directory: string; aOptions: Integer = 0): Boolean;
  function MultiReplace(const S: string; const AFromTo: array of string;
    AFlags: TReplaceFlags): string;

  function CreateSubject(const AName: string = ''; AnInn: string = ''; AKpp: string = ''): TDataSet;

implementation

uses
  Windows, Forms, cxDbEdit, ShellApi, ShlObj, ActiveX, fdcParamsHolder, ObjectFrm,
    dxmdaset, Classes, Graphics, fdcObjectServices;

procedure SetDefaultParamTypes(const aParamsArr: array of TParams);
var
  I, J: Integer;
begin
  for J := 0 to Length(aParamsArr) - 1 do
    for I := 0 to aParamsArr[J].Count - 1 do
      if aParamsArr[J][I].DataType = ftUnknown then
        if SameText(aParamsArr[J][I].Name, 'ID') then
          aParamsArr[J][I].DataType := ftInteger
        else
          aParamsArr[J][I].DataType := ftString;
end;

procedure DummyLine;
begin
 // для отладки
end;

function IfElse(ACondition: Boolean; ATrueObject, AFalseObject: TObject): TObject;
begin
  Result := AFalseObject;
  if ACondition then
    Result := ATrueObject;
end;

// callback для SelectDirectoryEx
function SelectDirExCB(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) and (lpData <> 0) then
    SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpdata);
  result := 0;
end;

// копия FileCtrl.SelectDirectory с расширением опций для ShBrowseForFolder
function SelectDirectoryEx(const Caption: string; const Root: WideString;
  var Directory: string; aOptions: Integer = 0): Boolean;
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
  if not DirectoryExists(Directory) then
    Directory := '';
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      with BrowseInfo do
      begin
        // при использовании Application.Handle наблюдался выход окна диалога
        // за границу экрана при BIF_NEWDIALOGSTYLE or BIF_EDITBOX,
        // а при использовании Application.MainForm.Handle (отличного от
        // Application.Handle !) - непонятные вещи с Z-Order после закрытия диалога (MDI app)
        hwndOwner := Screen.Forms[0].Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS or aOptions;
        if Directory <> '' then
        begin
          lpfn := SelectDirExCB;
          lParam := Integer(PChar(Directory));
        end;
      end;
      WindowList := DisableTaskWindows(0);
      OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        SetErrorMode(OldErrorMode);
        EnableTaskWindows(WindowList);
      end;
      Result :=  ItemIDList <> nil;
      if Result then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

function MultiReplace(const S: string; const AFromTo: array of string; AFlags: TReplaceFlags): string;
var
  I: Integer;
begin
  Result := S;
  Assert(Length(AFromTo) mod 2 = 0);
  for I := 0 to Length(AFromTo) div 2 - 1 do
    Result := StringReplace(Result, AFromTo[I * 2], AFromTo[I * 2 + 1], AFlags);
end;

type
  TApplication_ = class(TComponent)
  protected
    FHandle: HWnd;
    FBiDiMode: TBiDiMode;
    FBiDiKeyboard: string;
    FNonBiDiKeyboard: string;
    FObjectInstance: Pointer;
    FMainForm: TForm;
    FMouseControl: TControl;
    FHelpSystem : IInterface;
    FHelpFile: string;
    FHint: string;
    FHintActive: Boolean;
    FUpdateFormatSettings: Boolean;
    FUpdateMetricSettings: Boolean;
    FShowMainForm: Boolean;
    FHintColor: TColor;
    FHintControl: TControl;
    FHintCursorRect: TRect;
    FHintHidePause: Integer;
    FHintPause: Integer;
    FHintShortCuts: Boolean;
    FHintShortPause: Integer;
    FHintWindow: THintWindow;
    FShowHint: Boolean;
    FTimerMode: TTimerMode;
    FTimerHandle: Word;
    FTitle: string;
    FTopMostList: TList;
    FTopMostLevel: Integer;
    FIcon: TIcon;
    FTerminate: Boolean;
    FActive: Boolean;
    FAllowTesting: Boolean;
    FTestLib: THandle;
    FHandleCreated: Boolean;
    FRunning: Boolean;
    FWindowHooks: TList;
    FWindowList: Pointer;
    FDialogHandle: HWnd;
    FAutoDragDocking: Boolean;
    FModalLevel: Integer;
  end;

function AddParam(AParams: TParams; const Name: string; const Value: Variant): TParam;
begin
  Result := TParam(AParams.Add);
  try
    Result.ParamType := ptInputOutput;
    Result.Name := Name;
    Result.Value := Value;
  except
    Result.Free;
    raise;
  end;
end;

function CreateSubject(const AName: string = ''; AnInn: string = ''; AKpp: string = ''): TDataSet;
var
  AForm: TObjectForm;
  Params: TfdcParams;
begin
  Result := nil;
  Params := TfdcParams.Create(nil);
  try
    AddParam(Params, 'new name', AName);
    AddParam(Params, 'new inn', AnInn);
    AddParam(Params, 'new kpp', AKpp);
    Inc(TApplication_(Application).FModalLevel);
    try
      AForm := GetObjectServices.CreateObject('Subject', True, Params) as TObjectForm;
      if assigned(AForm) and not AForm.IsNew then
      begin
        Result := TdxMemData.Create(nil);
        try
          TdxMemData(Result).CreateFieldsFromDataSet(AForm.dsData);
          TdxMemData(Result).LoadFromDataSet(AForm.dsData);
        except
          Result.Free;
          raise;
        end;
      end;
    finally
       Dec(TApplication_(Application).FModalLevel);
    end;
  finally
     Params.Free;
  end;
end;


end.
