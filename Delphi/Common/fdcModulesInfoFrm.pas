{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcModulesInfoFrm.pas $
  $Revision: 4 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:39:19 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcModulesInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomFrm, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, dxLayoutLookAndFeels, ActnList, cxLookAndFeels, ComCtrls;

type

  { Окно информации о загруженных модулях }
  TfdcModulesInfoForm = class(TfdcCustomForm)
    Memo: TcxMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateModulesInfo;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

function GetModuleVersionInfo(const ModuleName: PChar; var VersionMS,
  VersionLS: Cardinal): Boolean;
var
  SizeOfBuffer: integer;
  Dummy: cardinal;
  Buffer: Pointer;
  FixedFileInfo: PVSFixedFileInfo;
begin
  Result := False;
  SizeOfBuffer := GetFileVersionInfoSize(ModuleName, Dummy);
  if SizeOfBuffer > 0 then
  begin
    GetMem(Buffer, SizeOfBuffer);
    try
      if GetFileVersionInfo(ModuleName, 0, SizeOfBuffer, Buffer)
        and
        VerQueryValue(Buffer, '\', Pointer(FixedFileInfo), Dummy) then
      begin
        VersionMS := FixedFileInfo.dwFileVersionMS;
        VersionLS := FixedFileInfo.dwFileVersionLS;
        Result := True;
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

procedure TfdcModulesInfoForm.UpdateModulesInfo;
var
  mbi: TMemoryBasicInformation;
  lp: cardinal;
  buf: array[0..MAX_PATH + 255] of char;
//  DW: DWORD;
//  sz: cardinal;
//  p: pointer;
//  PVerBuf: pointer;
//  b: boolean;
  S: String;
  VersionMS, VersionLS: Cardinal;
begin
  { В начало памяти }
  lp := 0;
  { Разрешаем работу со списком }
  Memo.Properties.ReadOnly := False;
  { Очистка списка модулей }
  Memo.Lines.Clear;
  { Просматриваем всю виртуальную память приложения }
  while VirtualQuery(pointer(lp), mbi, sizeof(mbi)) = sizeof(mbi) do
  begin
    { Память исползуется и она выделена }
    if (mbi.State <> MEM_FREE) and (mbi.AllocationBase <> nil) then
    begin
      { Это первая страница }
      if mbi.AllocationBase = mbi.BaseAddress then
      begin
        { Получили имя модуля }
        if GetModuleFileName(integer(mbi.BaseAddress), buf, sizeof(buf)) > 0
          then
        begin
          S := buf;
(*
          { Размер буфера с информацией о версии }
          sz := GetFileVersionInfoSize(@buf, DW);
          { Информация о версии существует }
          if sz <> 0 then
          begin
            { Выделим память для чтения }
            p := pointer(LocalAlloc(LMEM_FIXED or LMEM_ZEROINIT, sz));
            { Получили версию модуля }
            if GetFileVersionInfo(@buf, 0, sz, p) then
            begin
              { Читаем версию на английском }
              b := VerQueryValue(p, '\\StringFileInfo\\040904e4\\FileVersion',
                PVerBuf, sz);
              { Читаем версию по на русском }
              if not b then
                b := VerQueryValue(p, '\\StringFileInfo\\041904e3\\FileVersion',
                  PVerBuf, sz);
              { Удалось прочитать, добавим её к имени модуля }
              if b then
                lstrcat(lstrcat(@buf, ' Version '), PVerBuf);
            end;
            { Освободим память }
            LocalFree(integer(p));
          end;
          { Прописные символы }
          CharUpperBuffA(buf, sizeof(buf));
          { Добавим в список }
*)
          if GetModuleVersionInfo(buf, VersionMS, VersionLS) then
            S := Format('%s           %d.%d.%d.%d', [S, HiWord(VersionMS),
                     LoWord(VersionMS), HiWord(VersionLS), LoWord(VersionLS)]);
          Memo.Lines.Add(S);
        end;
      end;
    end;
    { Следующая страница памяти }
    lp := lp + mbi.RegionSize;
  end;
  { Запрещаем работу со списком }
  Memo.Properties.ReadOnly := True;
end;

procedure TfdcModulesInfoForm.FormShow(Sender: TObject);
//var
//  I: Integer;
//  S: String;
//  Item: TListItem;
begin
  inherited;
  UpdateModulesInfo;
{
  for I := 0 to Memo.Lines.Count - 1 do
  begin
    Item := ListView1.Items.Add;
    S := Memo.Lines.ValueFromIndex[I];
    Item.Caption := ExtractFileName(S);
    Item.SubItems.Add(Memo.Lines.Names[I]);
    Item.SubItems.Add(ExtractFilePath(S));
  end;
}
end;

end.

