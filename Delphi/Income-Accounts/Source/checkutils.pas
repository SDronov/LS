{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 2306 $
  $Author: charushin $
  $Date: 2007-03-11 17:48:28 +0400 (Р’СЃ, 11 РјР°СЂ 2007) $
}

unit CheckUtils;

interface

uses
  DB;

type
  TReqCheckFunc = function (const S: string): Boolean;

  function IsINNValid(const Value: string): Boolean;
  function IsPFNumberValid(const Value: string): Boolean;
  function IsKSValid(const Value, BIK: string): Boolean;
  function IsRSValid(const Value, BIK: string): Boolean;
  function IsOKPOValid(const Value: string): Boolean;
  function IsOGRNValid(const Value: string): Boolean;

  procedure CheckINN(const Value: string);
  procedure CheckKPP(const Value: string);

  procedure INNKPPValidate(Sender: TField);  

const
  cReqCheckFuncs: array [0..2] of TReqCheckFunc = (IsInnValid, IsOkpoValid, IsOgrnValid);

implementation

uses
  Math,
  StrUtils,
  SysUtils;

resourcestring
   SBadINNLength = 'ИНН должен состоять из 10 цифр для юридического лица и 12 цифр для физического лица';
   SBadINNCRC  = 'Неверная контрольная сумма для ИНН';
   SBadKPPLength = 'КПП должен состоять из 9 цифр';



procedure INNKPPValidate(Sender: TField);
var
  I: Integer;
const
  cMaxLen = 4;
  cRequisitNames: array [0..cMaxLen * 2 - 1] of string = ('OKPO', 'ОКПО', 'SOATO', 'СОАТО',
    'OGRN', 'ОГРН', 'KPP', 'КПП');
  cRequisitLengths: array [0..cMaxLen - 1] of Integer = (8, 4, 13, 9);
begin
  with Sender do
  begin
    if Length(Trim(Text)) > 0 then
    begin
      if (SameText(FieldName, 'RECEIVER_INN') or SameText(FieldName, 'INN')) and not (Length(Text) in [10,12]) then
        raise Exception.Create('ИНН должен состоять из 10 цифр для юридического лица и 12 цифр для физического');

      for I := 0 to cMaxLen - 1 do
        if SameText(FieldName, cRequisitNames[I shl 1]) and (Length(Text) <> cRequisitLengths[I]) then
          raise Exception.Create(Format('%s должен состоять из %d цифр', [cRequisitNames[I shl 1 + 1], cRequisitLengths[I]]));
    end;

    if Pos(UpperCase(FieldName), 'RECEIVER_INN,INN,OKPO,OGRN') > 0 then
    begin
      I := IfThen(SameText(FieldName, 'INN'), 0, IfThen(SameText(FieldName, 'OKPO'), 1, IfThen(SameText(FieldName, 'RECEIVER_INN'), 0, 2)));
      if (Text <> '') and not cReqCheckFuncs[I](Trim(Text)) then
        raise Exception.Create(IfThen(DisplayLabel <> '', DisplayLabel, FieldName)
          + ': контрольная сумма неверна');
    end;
  end;
end;


procedure CheckINN(const Value: string);
var
  S: string;
  IsValid: boolean;
begin
  S := Trim(Value);
  case Length(S) of
   10: ;
   12: ;
   else raise Exception.Create(SBadINNLength);
  end;
  if not IsINNValid(S) then
      raise Exception.Create(SBadINNCRC);
end;

procedure CheckKPP(const Value: string);
var
  KPP: integer;
begin
  if (Length(Trim(Value)) <> 9) or not TryStrToInt(Trim(Value), KPP) then
    raise Exception.Create(SBadKPPLength);
end;

function IsINN10Valid(const Value: string): Boolean;
const
  INNMask: array[1..10] of byte = (2, 4, 10, 3, 5, 9, 4, 6, 8, 0);
var
  C, I, Summa: Integer;
begin
  Result := False;
  Summa := 0;
  for I := 1 to 10 do
  begin
    if not (Value[I] in ['0'..'9']) then
      exit;
    Inc(Summa, StrToInt(Value[I]) * INNMask[I]);
  end;
  C := Summa mod 11;
  if C > 9 then
    C := C mod 10;
  Result := (C = StrToInt(Value[10]));
end;

function IsINN12Valid(const Value: string): Boolean;
const
  INNMask: array[1..12] of byte = (3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0);
var
  C_11, C_12, I, Summa: Integer;
begin
  Result := False;
  Summa := 0;
  for I := 1 to 11 do
  begin
    if not (Value[I] in ['0'..'9']) then
      exit;
    Inc(Summa, StrToInt(Value[I]) * INNMask[I + 1]);
  end;
  C_11 := Summa mod 11;
  if C_11 > 9 then
    C_11 := C_11 mod 10;

  if (C_11 <> StrToInt(Value[11])) then
    exit;

  Summa := 0;
  for I := 1 to 12 do
  begin
    if not (Value[I] in ['0'..'9']) then
      exit;
    Inc(Summa, StrToInt(Value[I]) * INNMask[I]);
  end;
  C_12 := Summa mod 11;
  if C_12 > 9 then
    C_12 := C_12 mod 10;
  Result := (C_12 = StrToInt(Value[12]));
end;

function IsSchetValid(const Value: string): Boolean;
const
  SchetMask: array[1..23] of byte = (7, 1, 3, 7, 1, 3, 7, 1, 3, 7, 1, 3, 7, 1,
    3, 7, 1, 3, 7, 1, 3, 7, 1);
var
  I, Summa: Integer;
begin
  Result := False;
  Summa := 0;
  for I := 1 to 23 do
  begin
    if not (Value[I] in ['0'..'9']) then
      exit;
    Inc(Summa, (StrToInt(Value[I]) * SchetMask[I]) mod 10);
  end;
  Result := (Summa mod 10 = 0);
end;

function IsINNValid(const Value: string): Boolean;
begin
  Result := ((Length(Value) = 10) and (IsINN10Valid(Value) or (Copy(Value, 1, 2) = '00')) ) or
    ((Length(Value) = 12) and (IsINN12Valid(Value) or (Copy(Value, 1, 2) = '00')) );
end;

function IsPFNumberValid(const Value: string): Boolean;
var
  I, Summa: Integer;
begin
  Result := False;
  if Length(Value) <> 11 then
    exit;
  for I := 1 to 11 do
    if not (Value[I] in ['0'..'9']) then
      exit;
  Summa := 0;
  for I := 1 to 9 do
    Inc(Summa, StrToInt(Value[I]) * (10 - I));
  Result := StrToInt(Copy(Value, 10, 2)) = (Summa mod 101);
end;

function IsOKPOValid(const Value: string): Boolean;
var
  C, I, Summa, Summa2: Integer;
begin
  Result := False;
  if Length(Value) <> 8 then
    exit;
  for I := 1 to 8 do
    if not (Value[I] in ['0'..'9']) then
      exit;
  Summa := 0;
  Summa2 := 0;
  for I := 1 to 7 do
  begin
    Inc(Summa, StrToInt(Value[I]) * I);
    Inc(Summa2, StrToInt(Value[I]) * (I + 2));
  end;
  C := Summa mod 11;
  if C > 9 then
  begin
    C := Summa2 mod 11;
    if C = 10 then
      C := 0;
  end;
  Result := (C = StrToInt(Value[8]));
end;

function IsKSValid(const Value, BIK: string): Boolean;
begin
  Result := (Length(Value) = 20) and IsSchetValid('0' + Copy(BIK, 5, 2) + Value);
end;

function IsRSValid(const Value, BIK: string): Boolean;
begin
  Result := (Length(Value) = 20) and IsSchetValid(Copy(BIK, Length(BIK) - 2, 3) +
    Value);
end;

function IsOGRNValid(const Value: string): Boolean;
var
  Ogrn: Int64;
begin
  Result := False;
  if (Length(Value) <> 13) or not TryStrToInt64(Copy(Value, 1, 12), Ogrn) then
    Exit;
  if Ogrn <= 0 then
    Exit;
  Result := Ord(Value[13]) - 48 = (Ogrn mod 11) mod 10;
end;

end.

