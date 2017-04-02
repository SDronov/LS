{|----------------------------------------------------------------------
 | Unit:        DelforEng
 |
 | Author:      Egbert van Nes
 |
 | Description: Interface with delfordll.dll (engine of Delphi formatter)
 |
 | Copyright (c) 2000  Egbert van Nes
 |
 | Redistribution and use in source and binary form, with or without
 | modification, are permitted provided that the following conditions
 | are met:
 |
 | 1. Redistributions of source code must retain the above copyright
 |    notice, this list of conditions and the following disclaimer.
 |    If the source is modified, the complete original and unmodified
 |    source code has to distributed with the modified version.
 |
 | 2. Redistributions in binary form must reproduce the above
 |    copyright notice, these licence conditions and the disclaimer
 |    found at the end of this licence agreement in the documentation
 |    and/or other materials provided with the distribution.
 |
 | 3. Software using this code must contain a visible line of credit.
 |
 | 4. If my code is used in a "for profit" product, you have to donate
 |    to a registered charity in an amount that you feel is fair.
 |    You may use it in as many of your products as you like.
 |    Proof of this donation must be provided to the author of
 |    this software.
 |
 | 5. If you for some reasons don't want to give public credit to the
 |    author, you have to donate three times the price of your software
 |    product, or any other product including this component in any way,
 |    but no more than $500 US and not less than $200 US, or the
 |    equivalent thereof in other currency, to a registered charity.
 |    You have to do this for every of your products, which uses this
 |    code separately.
 |    Proof of this donations must be provided to the author of
 |    this software.
 |
 | DISCLAIMER:
 |
 | THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS'.
 |
 | ALL EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 | THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 | PARTICULAR PURPOSE ARE DISCLAIMED.
 |
 | IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 | INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 | (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 | OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 | INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 | WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 | NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 | THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 |
 |---------------------------------------------------------------------- |----------------------------------------------------------------------}

unit DelforEng;
{.$DEFINE nodll}
interface
{dynamical loading of the dll for greater flexibility}
uses Classes, DelForTypes, OObjects;
const
  SDelForDLL = 'DelForDLL.DLL';
type
  TProc = procedure;
  TCharProc = procedure(P: PChar);
  TCharSettingProc = procedure(P: PChar; S: PSettings; I: Integer);
  TListProc = procedure(L: TStringList; S: PSettings; I: Integer);
  TParseFunc = function(S: PSettings; I: Integer): Boolean;
  TCharFunc = function: PChar;
  TIntegerFunc = function: Integer;
  TProgrProc = procedure(AOnProgress: TProgressEvent);

procedure LoadDll {(APath: PChar)};
procedure FreeDll;
var
  Formatter_Destroy: TProc;
  Formatter_LoadFromFile: TCharSettingProc;
  Formatter_LoadFromList: TListProc;
  Formatter_Parse: TParseFunc;
  Formatter_clear: TProc;
  Formatter_writeToFile: TCharProc;
  Formatter_GetTextStr: TCharFunc;
  Formatter_SetTextStr: TCharProc;
  Formatter_SetOnProgress: TProgrProc;
  Formatter_LoadCapFile: TCharProc;
  Formatter_SaveCapFile: TCharProc;
  Formatter_Version: TIntegerFunc;

implementation

uses Windows, SysUtils

{$IFDEF nodll}, DelForInterf{$ENDIF};
var
  Handle: Integer = 0;

procedure LoadDll {(APath: PChar)};
{$IFNDEF nodll}
var
  Formatter_Create: TProc;
  S: string;
  A: array[0..80] of Char;
  APath: PChar;
{$ENDIF}
begin
{$IFDEF nodll}
  DelForInterf.Formatter_Create;
  @Formatter_Destroy := @DelForInterf.Formatter_Destroy;
  @Formatter_LoadFromFile := @DelForInterf.Formatter_LoadFromFile;
  @Formatter_LoadFromList := @DelForInterf.Formatter_LoadFromList;
  @Formatter_Parse := @DelForInterf.Formatter_Parse;
  @Formatter_clear := @DelForInterf.Formatter_clear;
  @Formatter_writeToFile := @DelForInterf.Formatter_writeToFile;
  @Formatter_GetTextStr := @DelForInterf.Formatter_GetTextStr;
  @Formatter_SetTextStr := @DelForInterf.Formatter_SetTextStr;
  @Formatter_SetOnProgress := @DelForInterf.Formatter_SetOnProgress;
  @Formatter_LoadCapFile := @DelForInterf.Formatter_LoadCapFile;
  @Formatter_SaveCapFile := @DelForInterf.Formatter_SaveCapFile;
  @Formatter_Version := @DelForInterf.Formatter_Version;
{$ELSE}
  APath := '';
  if Handle = 0 then
  begin
    S := APath + SDelForDLL;
    if not FileExists(S) then
    begin
      GetWindowsDirectory(pchar(@A), 80);
      S := string(A) + '\' + SDelForDLL;
    end;
    Handle := LoadLibrary(PChar(S));
    if Handle <> 0 then
    begin
      @Formatter_Create := GetProcAddress(Handle, 'Formatter_Create');
      Formatter_Create;
      @Formatter_Destroy := GetProcAddress(Handle, 'Formatter_Destroy');
      @Formatter_LoadFromFile := GetProcAddress(Handle,
        'Formatter_LoadFromFile');
      @Formatter_LoadFromList := GetProcAddress(Handle,
        'Formatter_LoadFromList');
      @Formatter_Parse := GetProcAddress(Handle, 'Formatter_Parse');
      @Formatter_clear := GetProcAddress(Handle, 'Formatter_Clear');
      @Formatter_writeToFile := GetProcAddress(Handle, 'Formatter_WriteToFile');
      @Formatter_GetTextStr := GetProcAddress(Handle, 'Formatter_GetTextStr');
      @Formatter_SetTextStr := GetProcAddress(Handle, 'Formatter_SetTextStr');
      @Formatter_SetOnProgress := GetProcAddress(Handle,
        'Formatter_SetOnProgress');
      @Formatter_LoadCapFile := GetProcAddress(Handle, 'Formatter_LoadCapFile');
      @Formatter_SaveCapFile := GetProcAddress(Handle, 'Formatter_SaveCapFile');
      @Formatter_Version := GetProcAddress(Handle, 'Formatter_Version');
    end;
  end;
{$ENDIF}
end;

procedure FreeDll;
begin
  if Handle <> 0 then
    FreeLibrary(Handle);
  @Formatter_Destroy := nil;
  @Formatter_LoadFromFile := nil;
  @Formatter_LoadFromList := nil;
  @Formatter_Parse := nil;
  @Formatter_clear := nil;
  @Formatter_writeToFile := nil;
  @Formatter_GetTextStr := nil;
  @Formatter_SetTextStr := nil;
  @Formatter_SetOnProgress := nil;
  @Formatter_LoadCapFile := nil;
  @Formatter_SaveCapFile := nil;
  @Formatter_Version := nil;
  Handle := 0;
end;

initialization
  FreeDll;
finalization
  FreeDll;
end.
