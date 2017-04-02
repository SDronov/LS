{
  Утилиты FDC для работы со строковыми переменными

##  Copyright © Fors Development Center.
##  All rights reserved.

##  $Workfile: fdcStrings.pas $
##  $Revision: 3 $
##  $Author: alexvolo $
##  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcStrings;

interface

{ Возвращает строку полученную удалением ACount символов из
  строки ASourceStr, начиная с позиции AIndex }
function DeleteSubString(const ASourceStr: string;
  AIndex, ACount: integer): string;
{ Проверяет заканчивается ли строка ASourceStr подстрокой AWithStr }
function IsEndWith(const ASourceStr, AWithStr: string): Boolean;
{ Проверяет начинается ли строка ASourceStr подстрокой AWithStr }
function IsBeginWith(const ASourceStr, AWithStr: string): Boolean;
{ Проверяет соответствует ли строка AStr маске AMask.
  Remarks:
  Маска может содержать символы * и ?, обозначающие любое кол-во
  любых символов и один любой символ соответственно.<p>
  Например, выражение  IsMaskedString('Москва','Мо?к*')
  возвращает True. }
function IsMaskedString(AStr, AMask: string): Boolean;
{ Возвращает слово с номером AWordNo в строке, разделенной
  символом ASeparator }
function GetWord(AString: string; ASeparator: Char; AWordNo: Integer): string;
{ Возвращает количество слов в строке AString разделенной символом ASeparator }
function GetWordCount(AString: string; ASeparator: Char): Integer;

implementation

uses SysUtils;

function DeleteSubString(const ASourceStr: string;
  AIndex, ACount: integer): string;
var
  s: string;
begin
  s := ASourceStr;
  Delete(s, AIndex, ACount);
  Result := s;
end;

function IsEndWith(const ASourceStr, AWithStr: string): boolean;
var
  SourceStrLen, WithStrLen: integer;
  s: string;
begin
  WithStrLen := Length(AWithStr);
  SourceStrLen := Length(ASourceStr);
  if SourceStrLen > WithStrLen then
  begin
    s := Copy(ASourceStr, (SourceStrLen + 1) - WithStrLen, WithStrLen);
    if s = AWithStr then
      Result := True
    else
      Result := False;
  end
  else
    Result := False;
end;

function IsBeginWith(const ASourceStr, AWithStr: string): boolean;
var
  s: string;
begin
  Result := False;
  if Length(ASourceStr) >= Length(AWithStr) then
  begin
    s := Copy(ASourceStr, 1, Length(AWithStr));
    if CompareText(s, AWithStr) = 0 then
      Result := True;
  end;
end;

function Q_StrScan(const S: string; Ch: Char; StartPos: Integer = 1): Integer;
asm
        TEST    EAX,EAX
        JE      @@qt
        PUSH    EDI
        MOV     EDI,EAX
        LEA     EAX,[ECX-1]
        MOV     ECX,[EDI-4]
        SUB     ECX,EAX
        JLE     @@m1
        PUSH    EDI
        ADD     EDI,EAX
        MOV     EAX,EDX
        POP     EDX
        REPNE   SCASB
        JNE     @@m1
        MOV     EAX,EDI
        SUB     EAX,EDX
        POP     EDI
        RET
@@m1:   POP     EDI
        XOR     EAX,EAX
@@qt:
end;

function Q_TestByMask(const S, Mask: string; MaskChar: Char = 'X'): Boolean;
asm
        TEST    EAX,EAX
        JE      @@qt2
        PUSH    EBX
        TEST    EDX,EDX
        JE      @@qt1
        MOV     EBX,[EAX-4]
        CMP     EBX,[EDX-4]
        JE      @@01
@@qt1:  XOR     EAX,EAX
        POP     EBX
@@qt2:  RET
@@01:   DEC     EBX
        JS      @@07
@@lp:   MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JNS     @@lp
@@eq:   MOV     EAX,1
        POP     EBX
        RET
@@cm:   CMP     CH,BYTE PTR [EAX+EBX]
        JNE     @@07
        DEC     EBX
        JNS     @@lp
        MOV     EAX,1
        POP     EBX
        RET
@@07:   XOR     EAX,EAX
        POP     EBX
end;

function Q_TestWildStr(const S, Mask: string): Boolean;
label
  99;
var
  L, X, X0, Q: Integer;
  P, P1, B: PChar;
  C: Char;
const
  cMaskChar = '?';
  cWildCard = '*';
begin
  X := Q_StrScan(Mask, cWildCard);
  if X = 0 then
  begin
    Result := Q_TestByMask(S, Mask, cMaskChar);
    Exit;
  end;
  L := Length(S);
  P := Pointer(S);
  Result := False;
  B := Pointer(Mask);
  Q := X - 1;
  if L < Q then
    Exit;
  while Q > 0 do
  begin
    C := B^;
    if (C <> cMaskChar) and (C <> P^) then
      Exit;
    Dec(Q);
    Inc(B);
    Inc(P);
  end;
  Dec(L, X - 1);
  repeat
    X0 := X;
    P1 := P;
    while (X0 <= Length(Mask)) and (Mask[X0] = cWildCard) do
      Inc(X0);
    X := Q_StrScan(Mask, cWildCard, X0);
    if X = 0 then
      Break;
    99:
    P := P1;
    B := @Mask[X0];
    Q := X - X0;
    if L < Q then
      Exit;
    while Q > 0 do
    begin
      C := B^;
      if (C <> cMaskChar) and (C <> P^) then
      begin
        Inc(P1);
        Dec(L);
        goto 99;
      end;
      Dec(Q);
      Inc(B);
      Inc(P);
    end;
    Dec(L, X - X0);
  until False;
  X := Length(Mask);
  if L >= X - X0 + 1 then
  begin
    P := Pointer(S);
    Inc(P, Length(S) - 1);
    while X >= X0 do
    begin
      C := Mask[X];
      if (C <> cMaskChar) and (C <> P^) then
        Exit;
      Dec(X);
      Dec(P);
    end;
    Result := True;
  end;
end;

procedure PrepareMask(var Mask: string);
begin
  Trim(Mask);
  while Pos('* ', Mask) > 0 do
    Mask := StringReplace(Mask, '* ', '*', [rfReplaceAll, rfIgnoreCase]);
  while Pos(' *', Mask) > 0 do
    Mask := StringReplace(Mask, ' *', '*', [rfReplaceAll, rfIgnoreCase]);
  while Pos('**', Mask) > 0 do
    Mask := StringReplace(Mask, '**', '*', [rfReplaceAll, rfIgnoreCase]);
end;

function IsMaskedString(AStr, AMask: string): boolean;
begin
  PrepareMask(AMask);
  Result := Q_TestWildStr(AStr, AMask);
end;

function GetWord(AString: string; ASeparator: Char; AWordNo: Integer): string;
var
  i, p: Integer;
begin
  Result := '';
  for i := 1 to AWordNo - 1 do
  begin
    p := Pos(ASeparator, AString);
    AString := Copy(AString, p + 1, Length(AString) - p);
  end;
  p := Pos(ASeparator, AString);
  if p <> 0 then
    Result := Copy(AString, 1, p - 1)
  else
    Result := AString;
end;

function GetWordCount(AString: string; ASeparator: Char): Integer;
var
  i: Integer;
  s: string;
begin
  Result := 0;
  if Length(AString) = 0 then
    Exit;
  for i := 0 to Length(AString) do
  begin
    s := Copy(AString, i, 1);
    if s = ASeparator then
      Inc(Result);
  end;
end;

end.

