{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcModulesInfoFrm.pas $
  $Revision: 4 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:39:19 +0400 (Пн, 18 июл 2005) $
}

unit fdcModulesInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomFrm, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, dxLayoutLookAndFeels, ActnList, cxLookAndFeels, ComCtrls;

type

  { ���� ���������� � ����������� ������� }
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
  { � ������ ������ }
  lp := 0;
  { ��������� ������ �� ������� }
  Memo.Properties.ReadOnly := False;
  { ������� ������ ������� }
  Memo.Lines.Clear;
  { ������������� ��� ����������� ������ ���������� }
  while VirtualQuery(pointer(lp), mbi, sizeof(mbi)) = sizeof(mbi) do
  begin
    { ������ ����������� � ��� �������� }
    if (mbi.State <> MEM_FREE) and (mbi.AllocationBase <> nil) then
    begin
      { ��� ������ �������� }
      if mbi.AllocationBase = mbi.BaseAddress then
      begin
        { �������� ��� ������ }
        if GetModuleFileName(integer(mbi.BaseAddress), buf, sizeof(buf)) > 0
          then
        begin
          S := buf;
(*
          { ������ ������ � ����������� � ������ }
          sz := GetFileVersionInfoSize(@buf, DW);
          { ���������� � ������ ���������� }
          if sz <> 0 then
          begin
            { ������� ������ ��� ������ }
            p := pointer(LocalAlloc(LMEM_FIXED or LMEM_ZEROINIT, sz));
            { �������� ������ ������ }
            if GetFileVersionInfo(@buf, 0, sz, p) then
            begin
              { ������ ������ �� ���������� }
              b := VerQueryValue(p, '\\StringFileInfo\\040904e4\\FileVersion',
                PVerBuf, sz);
              { ������ ������ �� �� ������� }
              if not b then
                b := VerQueryValue(p, '\\StringFileInfo\\041904e3\\FileVersion',
                  PVerBuf, sz);
              { ������� ���������, ������� � � ����� ������ }
              if b then
                lstrcat(lstrcat(@buf, ' Version '), PVerBuf);
            end;
            { ��������� ������ }
            LocalFree(integer(p));
          end;
          { ��������� ������� }
          CharUpperBuffA(buf, sizeof(buf));
          { ������� � ������ }
*)
          if GetModuleVersionInfo(buf, VersionMS, VersionLS) then
            S := Format('%s           %d.%d.%d.%d', [S, HiWord(VersionMS),
                     LoWord(VersionMS), HiWord(VersionLS), LoWord(VersionLS)]);
          Memo.Lines.Add(S);
        end;
      end;
    end;
    { ��������� �������� ������ }
    lp := lp + mbi.RegionSize;
  end;
  { ��������� ������ �� ������� }
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

