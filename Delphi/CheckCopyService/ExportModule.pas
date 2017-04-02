unit ExportModule;

interface

uses
  Forms,
  SysUtils,
  VKDBFDataSet;

const
  maxFieldCount = 35;             // ������������ ����� ����� � dbf

Type

{
  TCetFields[i,j] - ������ �������� �����
  i   - ���������� ����� ����
  j=0 - �������� ����
  j=1 - ��� ���� (D,N,C)
  j=2 - ������ ���� (��� Numeric � Char)   (��� Date ������������)
  j=3 - ������ ������� ����� ��� (Numeric) (��� Date ������������)
  TCetTableDesc - ������ ����������� ��������� �������
{}

  TCetFields = array [0..maxFieldCount-1, 0..3] of string;

  TCetTableDesc = record
    TableName  : string;                  // ��� �������
    FieldCount : integer;                 // ���������� �����
    Fields     : TCetFields;              // ��������� ������ � ������� ��������� �������� �����
  end;

var
  ExportErrorMsg : string;


function GetAbsPath(DirName : string) : string;
function CreateDBF(ExportDir : string; tblDesc : TCetTableDesc) : string;
function GetDBFForExport(aFileName : string; tblDesc : TCetTableDesc) : TVKDBFNTX;


implementation


function GetAppDir : string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;


function GetAbsPath(DirName : string) : string;
var
  i : integer;
begin
  Result := DirName;
  if (Result = '') then
    Result := GetAppDir
  else if (length(Result) > 1) and (Result[2] <> ':') or (length(Result) = 1) then
  begin
    // otnositelno
    while (Result[1] = '\') do Result := Copy(Result, 2, length(Result)-1);
    Result := GetAppDir + Result;
  end;
  Result := Result + '\';
  i := 1;
  while (i < length(Result)-1) do
    if (Result[i] = '\') and (Result[i+1] = '\') then
      Delete(Result, i, 1)
    else
      Inc(i);
  try
    ForceDirectories(Result);
  except
    Result := '';
  end;
end;


function GetInt(aText : string): integer;
begin
  try
    if (aText = '') then
      Result := 0
    else
      Result := StrToInt(aText);
  except on E: exception do begin
    E.Message := '������ ����������� (������ Export) : ��������� [' + aText + '] �� �������� �������� ����������';
    raise;
  end; end;
end;


function GetType(aText : string): char;
var
  SwapChar : char;
begin
  SwapChar := upperCase(aText)[1];
  if (SwapChar <> 'D') and (SwapChar <> 'C') and (SwapChar <> 'N') then
    raise exception.Create('������ ����������� (������ Export) : ��������� [' + aText + '] �� �������� ���������� ��� ���� ���� dBaseIII')
  else
    Result := SwapChar;
end;


// ��������� ��������� DBF �����
function CreateDBF(ExportDir : string; tblDesc : TCetTableDesc) : string;
var
  i : integer;
  DBF : TVKDBFNTX;
begin
  try
    // ��������
    if (tblDesc.TableName = '') then
      raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� �������');
    if (tblDesc.FieldCount <= 0) then
      raise exception.Create('������ ��������� DBF (������ Export) : ����� ����� � ������� ������ ���� ������ ����');
    // �������� DBF �������
    DBF := TVKDBFNTX.Create(nil);
    try
      DBF.DBFFileName := ExportDir + tblDesc.TableName;
      // �������� �����
      for i := 0 to tblDesc.FieldCount-1 do
        with dbf.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          if (tblDesc.Fields[i,0] = '') then
            raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� ����')
          else
            Name := tblDesc.Fields[i, 0];
          Field_Type := GetType(tblDesc.Fields[i,1]);
          Len := GetInt(tblDesc.Fields[i, 2]);
          Dec := GetInt(tblDesc.Fields[i, 3]);
        end;
      DBF.CreateTable;
      Result := DBF.DBFFileName;
    finally
      DBF.Free;
    end;
  except on e : exception do begin
    Result := '';
    ExportErrorMsg := e.Message;
  end; end;
end;


function GetDBFForExport(aFileName : string; tblDesc : TCetTableDesc) : TVKDBFNTX;
var
  i : integer;
begin
  if (aFileName = '') then
    raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� �������');
  if (tblDesc.FieldCount <= 0) then
    raise exception.Create('������ ��������� DBF (������ Export) : ����� ����� � ������� ������ ���� ������ ����');
  // �������� DBF �������
  Result := TVKDBFNTX.Create(nil);
  Result.DBFFileName := aFileName;
  // �������� �����
  for i := 0 to tblDesc.FieldCount-1 do
    with Result.DBFFieldDefs.Add as TVKDBFFieldDef do
    begin
      if (tblDesc.Fields[i,0] = '') then
        raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� ����')
      else
        Name := tblDesc.Fields[i, 0];
      Field_Type := GetType(tblDesc.Fields[i,1]);
      Len := GetInt(tblDesc.Fields[i, 2]);
      Dec := GetInt(tblDesc.Fields[i, 3]);
    end;
  Result.CreateTable;
end;


Initialization
  ExportErrorMsg := '';
  

End.

