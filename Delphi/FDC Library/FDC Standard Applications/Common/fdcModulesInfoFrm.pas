{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcModulesInfoFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}

unit fdcModulesInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomFrm, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, dxLayoutLookAndFeels, ActnList, cxLookAndFeels;

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

procedure TfdcModulesInfoForm.UpdateModulesInfo;
var
  mbi : TMemoryBasicInformation;
  lp : cardinal;
  buf : array[0..MAX_PATH + 255] of char;
  DW : DWORD;
  sz : cardinal;
  p : pointer;
  PVerBuf : pointer;
  b : boolean;
begin
  { � ������ ������ }
  lp := 0;
  { ��������� ������ �� ������� }
  Memo.Properties.ReadOnly := False;
  { ������� ������ ������� }
  Memo.Lines.Clear;
  { ������������� ��� ����������� ������ ���������� }
  while VirtualQuery(pointer(lp),mbi,sizeof(mbi)) = sizeof(mbi) do begin
    { ������ ����������� � ��� �������� }
    if (mbi.State <> MEM_FREE) and (mbi.AllocationBase <> nil) then begin
      { ��� ������ �������� }
      if mbi.AllocationBase = mbi.BaseAddress then begin
        { �������� ��� ������ }
        if GetModuleFileName(integer(mbi.BaseAddress),buf,sizeof(buf)) > 0 then begin
          { ������ ������ � ����������� � ������ }
          sz := GetFileVersionInfoSize(@buf,DW);
          { ���������� � ������ ���������� }
          if sz <> 0 then begin
            { ������� ������ ��� ������ }
            p := pointer(LocalAlloc(LMEM_FIXED or LMEM_ZEROINIT,sz));
            { �������� ������ ������ }
            if GetFileVersionInfo(@buf,0,sz,p) then begin
              { ������ ������ �� ���������� }
              b := VerQueryValue(p,'\\StringFileInfo\\040904e4\\FileVersion',PVerBuf,sz);
              { ������ ������ �� �� ������� }
              if not b then
                b := VerQueryValue(p,'\\StringFileInfo\\041904e3\\FileVersion',PVerBuf,sz);
              { ������� ���������, ������� � � ����� ������ }  
              if b then
                lstrcat(lstrcat(@buf,' Version '),PVerBuf);
            end;
            { ��������� ������ }
            LocalFree(integer(p));
          end;
          { ��������� ������� }
          CharUpperBuffA(buf,sizeof(buf));
          { ������� � ������ }
          Memo.Lines.Add(String(Buf));
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
begin
  inherited;
  UpdateModulesInfo;
end;

end.
