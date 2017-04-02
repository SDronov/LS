{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 228 $
  $Author: alexglad $
  $Date: 2005-09-20 11:37:48 +0400 (Р’С‚, 20 СЃРµРЅ 2005) $
}

unit fdcDBUtils;

interface

uses
  Db, OracleData, fdcQuery, ClipBrd;

const
 cRetRows = True; cNoRows = False;

type
  PFDCQuery = ^TFDCQuery;
  TSetQueryParamOptions = set of (sqpAutoTrim, sqpFixTypeMismatch);

  function ExecAloneSQL(const ASQL: string; AParamsNValues: string = '';
     AReturnRows: Boolean = cNoRows; AQry: TFDCQuery = nil;
     AOutQry: PFDCQuery = nil): Integer;
  procedure SetQryParams(AQuery: TFDCQuery; AParamsNValues: string);
  procedure SetQryParams2(AParams: TParams; const AParamsNValues: array of const;
    AOptions: TSetQueryParamOptions = []);
  function GetQryFldVal(const ASQL: string; const AParams: string = ''): Variant;
  function RecAsStr(ADS: TDataSet): string;
  function DescribeQueryParams(ASource: TObject; AForPSD: Boolean = False): string;        

implementation

uses
  Classes, StrUtils, SysUtils, Variants, MainDm, fdcParamsHolder;

const
  cCxDateEditNullDate: TDateTime = -700000;

function DescribeQueryParams(ASource: TObject; AForPSD: Boolean = False): string;
var
  I: integer;
  sl: TStringList;
  aType: string;
  aParams: TParams;
begin
  Result := '';
  if ASource = nil then
    Exit;
  sl := nil;
  if AForPSD then
  begin
    sl := TStringList.Create;
    sl.Sorted := True;
    sl.Duplicates := dupIgnore;
  end;
  if ASource is TOracleDataSet then
    with ASource as TOracleDataSet do
      for I := 0 to Variables.Count - 1 do
        Result := Result + Variables.Data(I).Name + ' = ' + VarToStr(GetVariable(I)) + '; '
  else
  begin
    aParams := nil;
    if ASource is TFDCQuery then
      aParams := (ASource as TFDCQuery).Params
    else
      if ASource is TParams then
        aParams := ASource as TParams
      else Assert(False);

    if AForPSD then
      sl.Add(IntToStr(aParams.Count));
    for I := 0 to aParams.Count - 1 do
      if AForPSD then
      begin
        case aParams[I].DataType of
          ftFloat: aType := '4';
          ftInteger: aType := '3';
          ftDate, ftDateTime: aType := '12';
          else aType := '5'
        end;
        sl.Add(aParams[I].Name + #13#10 + IfThen(VarToStr(aParams[I].Value) = '', '0',
          '1'#13#10 + VarToStr(aParams[I].Value)) + #13#10 + aType);
      end
      else
        Result := Result + aParams[I].Name + ' = ' + VarToStr(aParams[I].Value) + '; ';
    if AForPSD then
    begin
      Result := sl.Text + #13#10'0';
      sl.Free;
    end;
  end;
end;

function DQ(AQuery: TDataSet; AForPSD: Boolean = False): string;
var
  aSQL: string;
  eClp: TClipBoard;
  sl: TStringList;
begin
  Result := '';
  if aQuery = nil then
    Exit;
  if aQuery is TOracleDataset then
    aSQL := (aQuery as TOracleDataset).SQL.Text
  else
  if aQuery is TFDCQuery then
    aSQL := (aQuery as TFDCQuery).SQL.Text
  else Assert(False);
  if AForPSD then
  begin
    sl := TStringList.Create;
    sl.Text := aSQL;
    Result := 'PL/SQL Developer Test script 3.0' + #13#10 + IntToStr(sl.Count) + #13#10
      + Trim(aSQL) + #13#10 + DescribeQueryParams(aQuery, AForPSD);
  end    
  else
    Result := '--' + DescribeQueryParams(aQuery) + #13#10 + aSQL;
  eClp := TClipBoard.Create;
  try
    eClp.AsText := Result;
    eClp.Close;
  finally
    FreeAndNil(eClp);
  end;
end;
  
procedure SetQryParams2(AParams: TParams; const AParamsNValues: array of const;
  AOptions: TSetQueryParamOptions = []);
var
  I: Integer;
  S: string;
  aFK: Boolean;

  procedure _FixStrToFloat;
  var
    D: Double;
    aCode: Integer;
    S2: string;
  begin
    with AParams, AParamsNValues[I * 2 + 1] do
    begin
      ParamByName(S).Clear;
      if (VType = vtVariant) and (VarType(VVariant^) = varString) then
        S2 := Trim(VarToStr(VVariant^))
      else
        if VType = vtAnsiString then
          S2 := Trim(string(VANSIString))
        else
          Assert(False);
      Val(S2, D, aCode);
      if aCode = 0 then
        ParamByName(s).AsFloat := D;
    end;
  end;

begin
  for I := 0 to Length(AParamsNValues) div 2 - 1 do
  with AParams, AParamsNValues[I * 2 + 1] do
  begin
    s := string(AParamsNValues[I * 2].VAnsiString);

    aFK := False;
    if Pos('%fk', s) = 1 then
    begin
      aFK := True;
      s := copy(s, 4, length(s) - 3);
    end;

    if Pos('%d', s) = 1 then
    begin
      s := copy(s, 3, Length(s) - 2);
      ParamByName(s).AsDateTime := AParamsNValues[I * 2 + 1].VExtended^;
      if (AParamsNValues[I * 2 + 1].VExtended^ = 0) or (AParamsNValues[I * 2 + 1].VExtended^ = cCxDateEditNullDate) then
        ParamByName(s).Clear;
    end
    else
      case VType of
        vtInteger:
          if aFK and (VInteger = 0) then
          begin
            ParamByName(s).AsInteger := 0;
            ParamByName(s).Clear;
          end
          else
            ParamByName(s).AsInteger := VInteger;
        vtBoolean:
          ParamByName(s).AsBoolean := VBoolean;
        vtChar:
          ParamByName(s).AsString := VChar;
        vtExtended:
          ParamByName(s).AsFloat := VExtended^;
        vtString:
          ParamByName(s).AsString := IfThen(sqpAutoTrim in AOptions, Trim(VString^), VString^);
        vtAnsiString:
          if (ParamByName(s).DataType = ftFloat) and (sqpFixTypeMismatch in AOptions) then // params came from DBF, e.g.
            _FixStrToFloat
          else
            ParamByName(s).AsString := IfThen(sqpAutoTrim in AOptions, Trim(string(VANSIString)), string(VANSIString));
        vtCurrency:
          ParamByName(s).AsCurrency := VCurrency^;
        vtVariant:
          if VarType(VVariant^) = varString then
          begin
            if (sqpFixTypeMismatch in AOptions) and (ParamByName(s).DataType = ftFloat) then
              _FixStrToFloat
            else
              if sqpAutoTrim in AOptions then
                ParamByName(s).Value := Trim(VarToStr(VVariant^))
              else
                ParamByName(s).Value := VVariant^;
          end      
          else
            ParamByName(s).Value := VVariant^;
        vtInt64:
          ParamByName(s).AsInteger := VInt64^
        else
          Assert(False, Format('SetQryParams2: тип %d не поддерживается',
            [AParamsNValues[I * 2].VType]));
      end; // case
  end; // with
end;

function ExecAloneSQL(const ASQL: string; AParamsNValues: string = '';
  AReturnRows: Boolean = cNoRows; AQry: TFDCQuery = nil;
  AOutQry: PFDCQuery = nil): Integer;
var
  aOwnQry: boolean;
begin
  Result := 0;
  aOwnQry := False;
  if AQry = nil then
  begin
    AQry := TFDCQuery.Create(nil);
    AQry.Session := MainData.Session;
    aOwnQry := True;
  end;

  try
    AQry.SQL.Text := ASQL;

    if AParamsNValues <> '' then
      SetQryParams(AQry as TDataSet, AParamsNValues);

    if AReturnRows then
    begin
      AQry.ReQuery;
    end else
    begin
      AQry.ExecSQL;
      Result := AQry.RecordCount; // todo: is it rows affected count ?
    end;
  finally
    if aOwnQry and (AOutQry = nil) then
      FreeAndNil(AQry)
  end;

  if AOutQry <> nil then
    AOutQry^ := AQry;
end;

procedure SetQryParams(AQuery: TFDCQuery; AParamsNValues: string);
var
  sl: TStringList;
  I: Integer;
begin
  sl := TStringList.Create;
  try
   sl.CommaText := AParamsNValues;
    for I := 0 to sl.Count div 2 - 1 do
      AQuery.ParamByName(sl[I * 2]).Value := sl[I * 2 + 1];
  finally
    sl.Free;
  end;
end;

function GetQryFldVal(const ASQL: string; const AParams: string = ''): Variant;
var
  aQry: TFDCQuery;
begin
  Result := Null;
  ExecAloneSQL(ASQL, AParams, cRetRows, nil, @aQry);
  if not aQry.Eof then
    Result := aQry.Fields[0].AsVariant;
  aQry.Free;
end;

function RecAsStr(ADS: TDataSet): string;
var
  I: Integer;
begin
  Result := '';
  if ADS = nil then
    Exit;
  for I := 0 to ADS.FieldCount - 1 do
    Result := Result + Trim(ADS.Fields[I].AsString) + IfThen(I < ADS.FieldCount - 1, ';');
end;

initialization
  // linker should not remove debug funcs
  DQ(nil);

end.
