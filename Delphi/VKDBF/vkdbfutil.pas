{Copyright:      Vlad Karpov
 		 mailto:KarpovVV@protek.ru
		 http:\\vlad-karpov.narod.ru
     ICQ#136489711
 Author:         Vlad Karpov
 Remarks:        Freeware with pay for support, see license.txt
}
unit VKDBFUtil;

interface

uses
  Windows, SysUtils, Dialogs, VKDBFMemMgr;

function GetTmpFileName(PathName: String = 'SYSTEM_TMP_PATH'): String;
function GetTmpPath: String;
function wildc(cpPattern, cpStr: pChar; iLenString: Integer; ManyChars, OneChar: Char): Boolean;
function FileLock(Handle, Offset, NumberOfBytes: Integer): Boolean;
function FileUnLock(Handle, Offset, NumberOfBytes: Integer): Boolean;
procedure ReplBlanks(var Strg: string; R: Char = '0');
procedure ReplSign(var Strg: string);
procedure Int2Str(val: Integer; width: Integer; var s: ShortString);
function DtoS(d: TDateTime): String;
function TtoS(d: TDateTime): String;
function DTtoS(d: TDateTime): String;
procedure WriteBugFile(FileName: String; Str: String);
function ClipperVal(const str: String): Extended;
function SubStr( sStr: String; iStart: Integer; iCount: Integer = 0) : String;
function Stuff(sSource: String; iStart, iDel: Integer; sInsert: String = ''): String;
function StrTran(sStr, sFind: String; sReplace: String = ''; iStart: Integer = 1; iNum: Integer = 0): String;

var
  VKDBFUtil__LegalSym__for__ClipperVal,
  VKDBFUtil__DigChar__for__ClipperVal,
  VKDBFUtil__NotDigChar__for__ClipperVal: set of char;

implementation

function wildc(cpPattern, cpStr: pChar; iLenString: Integer; ManyChars, OneChar: Char): Boolean;
var
  WasStar, ucRet: Boolean;
  i: Integer;
  iLenStr: Integer;
  cpString: pChar;
label
  WhileRet;

  function SerchPattern(cpPatt: pChar; iLen: Integer): boolean;
  var
    ucRet: boolean;
    i: Integer;
  label
    EndWhile, EndFOR;
  begin
    ucRet := true;
    while ( iLenStr <> 0 ) do
    begin
      ucRet := TRUE;
      for i:=0 to iLen-1 do
      begin
        if ( (cpPatt[i] <> OneChar) and ( cpString[i] <> cpPatt[i] ) ) then
        begin
          ucRet := FALSE;
          if WasStar then
            goto EndFOR
          else
            goto EndWhile;
        end;
        if iLenStr-i-1 < 0 then
        begin
          ucRet := FALSE;
          goto EndWhile;
        end;
      end;
      EndFOR:
      if ucRet then
      begin
        Inc(cpString, iLen);
        Dec(iLenStr, iLen);
        goto EndWhile;
      end;
      Inc(cpString);
      Dec(iLenStr);
    end;
    EndWhile:
    Result := ucRet;
  end;

begin
  i := 0;
  cpString := cpStr;
  iLenStr := iLenString;
  if iLenStr = 0 then begin
    if cpPattern = ManyChars then begin
      Result := true;
      Exit;
    end else begin
      Result := false;
      Exit;
    end;
  end;
  WasStar := false;
  while cpPattern[0] <> #0 do
  begin
    if ( cpPattern[0] = ManyChars ) then
    begin
      ucRet := SerchPattern(cpPattern - i, i);
      i := -1;
      WasStar := true;
      if ( not ucRet ) then goto WhileRet;
    end;
    Inc(i);
    Inc(cpPattern);
  end;
  ucRet := SerchPattern(cpPattern-i, i);
  if ( not ucRet ) then goto WhileRet;
  if ( (iLenStr <> 0) and ((cpPattern - 1)[0] <> ManyChars) ) then ucRet := false;
  WhileRet:
  Result := ucRet;
end;

function FileLock(Handle, Offset, NumberOfBytes: Integer): Boolean;
begin
  Result := LockFile(THandle(Handle), Offset, 0, NumberOfBytes, 0);
end;

function FileUnLock(Handle, Offset, NumberOfBytes: Integer): Boolean;
begin
  Result := UnlockFile(THandle(Handle), Offset, 0, NumberOfBytes, 0);
end;

procedure ReplSign(var Strg: string);
var
  l, i: Integer;
begin
  l := Length(Strg);
  for i := 1 to l do
    Strg[i] := chr(Ord(#44) - Ord(Strg[i]) + Ord(#48));
end;

procedure ReplBlanks(var Strg: string; R: Char = '0');
var
  l, i: Integer;
begin
  l := Length(Strg);
  for i := 1 to l do
    if Strg[i] = ' ' then
      Strg[i] := R;
end;

function DtoS(d: TDateTime): String;
const
  ss: array [0..31] of string[2] = ('00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31');
var
  Year, Month, Day: Word;
  s: ShortString;
begin
  DecodeDate(d, Year, Month, Day);
  Int2Str(Year, 4, s);
  Result := s + ss[Month] + ss[Day];
end;

function DTtoS(d: TDateTime): String;
const
  ss: array [0..59] of string[2] = ('00', '01', '02', '03', '04', '05', '06', '07',
                                    '08', '09', '10', '11', '12', '13', '14', '15',
                                    '16', '17', '18', '19', '20', '21', '22', '23',
                                    '24', '25', '26', '27', '28', '29', '30', '31',
                                    '32', '33', '34', '35', '36', '37', '38', '39',
                                    '40', '41', '42', '43', '44', '45', '46', '47',
                                    '48', '49', '50', '51', '52', '53', '54', '55',
                                    '56', '57', '58', '59');
var
  Year, Month, Day: Word;
  Hour, Min, Sec, MSec: Word;
  s: ShortString;
begin
  DecodeDate(d, Year, Month, Day);
  DecodeTime(d, Hour, Min, Sec, MSec);
  Int2Str(Year, 4, s);
  Result := s + ss[Month] + ss[Day] + ss[Hour] + ss[Min] + ss[Sec];
end;

function TtoS(d: TDateTime): String;
const
  ss: array [0..59] of string[2] = ('00', '01', '02', '03', '04', '05', '06', '07',
                                    '08', '09', '10', '11', '12', '13', '14', '15',
                                    '16', '17', '18', '19', '20', '21', '22', '23',
                                    '24', '25', '26', '27', '28', '29', '30', '31',
                                    '32', '33', '34', '35', '36', '37', '38', '39',
                                    '40', '41', '42', '43', '44', '45', '46', '47',
                                    '48', '49', '50', '51', '52', '53', '54', '55',
                                    '56', '57', '58', '59');
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(d, Hour, Min, Sec, MSec);
  Result := ss[Hour] + ss[Min] + ss[Sec];
end;

procedure Int2Str(val: Integer; width: Integer; var s: ShortString);
asm
{      ->EAX     Value
        EDX     Width
        ECX     Pointer to string       }

        PUSH    EBX             { VAR i: Longword;              }
        PUSH    ESI             { VAR sign : Longint;           }
        PUSH    EDI
        PUSH    EDX             { store width on the stack      }
        SUB     ESP,20          { VAR a: array [0..19] of Char; }

        MOV     EDI,ECX

        MOV     ESI,EAX         { sign := val                   }

        CDQ                     { val := Abs(val);  canned sequence }
        XOR     EAX,EDX
        SUB     EAX,EDX

        MOV     ECX,10
        XOR     EBX,EBX         { i := 0;                       }

@@repeat1:                      { repeat                        }
        XOR     EDX,EDX         {   a[i] := Chr( val MOD 10 + Ord('0') );}

        DIV     ECX             {   val := val DIV 10;          }

        ADD     EDX,'0'
        MOV     [ESP+EBX],DL
        INC     EBX             {   i := i + 1;                 }
        TEST    EAX,EAX         { until val = 0;                }
        JNZ     @@repeat1

        MOV     [EDI],BL        { s^++ := Chr(i);               }
        INC     EDI

        mov     EDX, EDI

        MOV     ECX,[ESP+20]    { spaceCnt := width - i;        }
        CMP     ECX,255
        JLE     @@3
        MOV     ECX,255
@@3:
        SUB     ECX,EBX
        JLE     @@repeat2       { for k := 1 to spaceCnt do s^++ := '0';        }
        ADD     [EDI-1],CL
        MOV     AL,'0'
        REP     STOSB

@@repeat2:                      { repeat                        }
        MOV     AL,[ESP+EBX-1]  {   s^ := a[i-1];               }
        MOV     [EDI],AL
        INC     EDI             {   s := s + 1                  }
        DEC     EBX             {   i := i - 1;                 }
        JNZ     @@repeat2       { until i = 0;                  }

        TEST    ESI,ESI
        JGE     @@2
        MOV     AL, '-'
        MOV     [EDX],AL
@@2:

        ADD     ESP,20+4
        POP     EDI
        POP     ESI
        POP     EBX
end;


//------------------------------------------------------------------------------
function GetTmpFileName(PathName: String = 'SYSTEM_TMP_PATH'): String;
var
  cpBufferPath: pChar;
  cpBufferTmpFile: pChar;
  i: Integer;
begin
  cpBufferTmpFile := VKDBFMemMgr.oMem.GetMem(nil, MAX_PATH + 1);
  FillChar(cpBufferTmpFile^, MAX_PATH + 1, 0);
  cpBufferPath := VKDBFMemMgr.oMem.GetMem(nil, MAX_PATH + 1);
  FillChar(cpBufferPath^, MAX_PATH + 1, 0);
  if PathName = 'SYSTEM_TMP_PATH' then begin
    GetTempPath(MAX_PATH, cpBufferPath);
    for i := 0 to MAX_PATH - 1 do
    begin
      if Ord(cpBufferPath[i]) = 0 then break;
      if Ord(cpBufferPath[i]) <= 32 then
      begin
        cpBufferPath[i] := '\';
        cpBufferPath[i + 1] := #0;
        break;
      end;
    end;
  end else begin
    if PathName = '' then PathName := GetCurrentDir;
    i := Length(PathName);
    if PathName[i] <> '\' then begin
      PathName := PathName + '\';
      Inc(i);
    end;
    Move(pChar(PathName)^, cpBufferPath^, i);
  end;
  GetTempFileName(cpBufferPath, PChar('VKT'), 0, cpBufferTmpFile);
  Result := Copy(cpBufferTmpFile, 1, Length(cpBufferTmpFile));
  VKDBFMemMgr.oMem.FreeMem(cpBufferPath);
  VKDBFMemMgr.oMem.FreeMem(cpBufferTmpFile);
end;

//------------------------------------------------------------------------------
function GetTmpPath: String;
var
  cpBufferPath: pChar;
  i: Integer;
begin

  cpBufferPath := VKDBFMemMgr.oMem.GetMem('GetTmpPath', MAX_PATH + 1);
  FillChar(cpBufferPath^, MAX_PATH + 1, 0);

  GetTempPath(MAX_PATH, cpBufferPath);

  for i := 0 to MAX_PATH - 1 do
  begin
    if Ord(cpBufferPath[i]) = 0 then break;
    if Ord(cpBufferPath[i]) <= 32 then
    begin
      cpBufferPath[i] := '\';
      cpBufferPath[i + 1] := #0;
      break;
    end;
  end;

  Result := Copy(cpBufferPath, 1, Length(cpBufferPath));

  VKDBFMemMgr.oMem.FreeMem(cpBufferPath);

end;

procedure WriteBugFile(FileName: String; Str: String);
const
  CR = #13#10;
var
  h: Integer;
  q: String;
begin
  if FileExists(FileName) then
    h := Sysutils.FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone)
  else
    h := Sysutils.FileCreate(FileName);
  if h > 0 then begin
    Sysutils.FileSeek(h, 0, 2);
    DateTimeToString(q, 'dd.mm.yyyy hh:nn:ss ', now);
    q := q + Str + CR;
    Sysutils.FileWrite(h, pChar(q)^, Length(q));
    Sysutils.FileClose(h);
  end;
end;

function ClipperVal(const str: String): Extended;
var
  c, i, j, k: Integer;
  t: String;
begin
  t := trim(str);
  j := Length(t);
  k := 0;
  for i := 1 to j do begin
    if not ( t[i] in VKDBFUtil__LegalSym__for__ClipperVal ) then Break
    else begin
      if ( t[i] in VKDBFUtil__NotDigChar__for__ClipperVal ) then begin
        if ( i = j ) then Break;
        if not ( t[i + 1] in VKDBFUtil__DigChar__for__ClipperVal ) then Break;
      end;
    end;
    Inc(k);
  end;
  if ( k <> 0 ) and ( k <> j ) then t := Copy(t, 1, k);
  try
    Val(t, Result, c);
  except
    Result := 0;
  end;
end;

function SubStr( sStr: String; iStart: Integer; iCount: Integer = 0) : String;
begin
  Result := '';
  if (iStart > Length(sStr)) then exit;
  if (iCount < 1) then iCount := Length(sStr);
  Result := Copy( sStr, iStart, iCount );
end;

function Stuff(sSource: String; iStart, iDel: Integer; sInsert: String = ''): String;
begin
  if iDel > 0 then Delete(sSource, iStart, iDel);
  if sInsert <> '' then
  begin
    SetLength(Result, Length(sSource) + Length(sInsert));
    Insert( sInsert, sSource, iStart );
  end;
  Result := sSource;
end;

function StrTran(sStr, sFind: String; sReplace: String = ''; iStart: Integer = 1; iNum: Integer = 0): String;
var
  bAll: Boolean;
  iPos : LongInt;
  iCtr : LongInt;
  iRep : LongInt;
begin
  Result := '';
  bAll := (iNum = 0);
  iPos := Pos(sFind, sStr);
  if iPos = 0 then
  begin
    Result := sStr;
    exit;
  end;
  if Length(sReplace) > Length(sFind) then
    iRep := Length(sReplace) - Length(sFind)
  else if Length(sReplace) = Length(sFind) then
    iRep := 0
  else
    iRep := Length(sReplace);

  if (iStart = 1) then
  begin
    sStr := Stuff( sStr, iPos, Length(sFind), sReplace );
    if iNum = 1 then
    begin
      Result := sStr;
      Exit;
    end;
    Result := Result + SubStr(sStr, 1, iPos + iRep);
    sStr := SubStr(sStr, iPos + iRep + 1, 0);
  end
  else
  begin
    for iCtr := 1 to (iStart - 1) do
    begin
      Result := Result + SubStr( sStr, 1, iPos + iRep);
      sStr := SubStr( sStr, iPos + iRep + 1, 0 );
      iPos := Pos( sFind, sStr );
    end;
  end;

  if (bAll) then
  begin
    Result := Result + sStr;
    iPos := Pos( sFind, Result );
    while iPos > 0 do begin
      Result := Stuff(Result, iPos, Length(sFind), sReplace);
      iPos := Pos(sFind, Result);
    end;
  end
  else
  begin
    if iStart = 1 then
      iCtr := 1
    else
      iCtr := 0;
    iPos := Pos( sFind, sStr );
    while True do
    begin
      if iPos = 0 then
        Break;
      sStr := Stuff( sStr, iPos, Length(sFind), sReplace );
      Result := Result + SubStr( sStr, 1, iPos + iRep);
      sStr := SubStr( sStr, iPos + iRep + 1, 0);
      Inc( iCtr );
      if iCtr = iNum then
        Break;
      iPos := Pos( sFind, sStr );
    end;
    Result := Result + sStr;
  end;
end;

initialization

  VKDBFUtil__LegalSym__for__ClipperVal := ['+', '-', '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  VKDBFUtil__DigChar__for__ClipperVal := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  VKDBFUtil__NotDigChar__for__ClipperVal := ['+', '-', '.'];

end.
