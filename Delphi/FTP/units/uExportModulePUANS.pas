unit uExportModulePUANS;

interface

uses
  Forms,
  SysUtils,
  VKDBFDataSet;

//{$I SearchProcedureConsts.inc}


const
  LSxxxxxxpuANS : TCetTableDescPUANS = (
    TableName  : 'LS.ANS';
    FieldCount : 16;
    Fields     : (('CUSTOMCODE', 'C', '8',   ''),
                  ('INN_D',      'C', '12',  ''),
                  ('KPP_D',      'C', '9',   ''),
                  ('BEGIN_DATE', 'D', '8',   ''),
                  ('END_DATE',   'D', '8',   ''),
                  ('TYPEDOC',    'C', '3',   ''),
                  ('REPORT_DAT', 'D', '8',   ''),
                  ('NUMDOC',     'C', '12',  ''),
                  ('SUMMA',      'N', '19',  '2'),
                  ('KBK',        'C', '20',  ''),
                  ('PAYMENTNUM', 'C', '7',   ''),
                  ('PAYMENTDAT', 'C', '10',  ''),
                  ('NAME_AGENT', 'C', '70',  ''),
                  ('NUMPOST',    'C', '19',  ''),
                  ('CODEERR',    'N', '5',   '0'),
                  ('TEXTERR',    'C', '255',  '')
                 ));


  maxFieldCountPUANS = 16;             // ������������ ����� ����� � dbf �� LS*.ANS


type

{
  TCetFields[i,j] - ������ �������� �����
  i   - ���������� ����� ����
  j=0 - �������� ����
  j=1 - ��� ���� (D,N,C)
  j=2 - ������ ���� (��� Numeric � Char)   (��� Date ������������)
  j=3 - ������ ������� ����� ��� (Numeric) (��� Date ������������)
  TCetTableDesc - ������ ����������� ��������� �������
{}

  TCetFieldsPUANS = array [0..maxFieldCountPUANS-1, 0..3] of string;

  TCetTableDescPUANS = record
    TableName  : string;                  // ��� �������
    FieldCount : integer;                 // ���������� �����
    Fields     : TCetFieldsPUANS;         // ��������� ������ � ������� ��������� �������� �����
  end;

function GetInt(aText : string): integer;  //�������� �� ������ �������� �������
function GetType(aText : string): char;    //�������� ����� � �������
function Create_DBF_PUANS(ExportDir : string; tblDesc : TCetTableDescPUANS) : string;   //�������� dbf �����
procedure Filling_DBF_PUANS(val: string; parray: array of string);  //���������� dbf �����

var
  ExportErrorMsg : string;

implementation

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

// ��������� ��������� DBF ����� LS*.ANS
function Create_DBF_PUANS(ExportDir : string; tblDesc: TCetTableDescPUANS) : string;
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
      FreeAndNil(DBF);
    end;
  except on e : exception do
    begin
      Result := '';
      ExportErrorMsg := e.Message;
    end;
  end;
end;

procedure Filling_DBF_PUANS(val: string; parray: array of string);
var
  dbf: TVKDBFNTX;
begin
  dbf := TVKDBFNTX.Create(nil);
  dbf.OEM := True;
  dbf.AccessMode.OpenReadWrite := True;
  dbf.DBFFileName := ExtractFilePath(val) + ExtractFileName(val);

  dbf.Open;
  dbf.Append;

  dbf.FieldByName('CUSTOMCODE'  ).AsString   := parray[0];                //��� ����������� ������
  dbf.FieldByName('INN_D'       ).AsString   := parray[1];                //��� �����������
  dbf.FieldByName('KPP_D'       ).AsString   := parray[2];                //��� �����������
  if parray[3] <> '' then
    dbf.FieldByName('BEGIN_DATE').AsDateTime := StrToDate(parray[3]);     //���� ������ �������, �� ������� ������������� ���������� � �������� �������� �������
  if parray[4] <> '' then
    dbf.FieldByName('END_DATE'  ).AsDateTime := StrToDate(parray[4]);     //���� ����� �������, �� ������� ������������� ���������� � �������� �������� �������
  dbf.FieldByName('TYPEDOC'     ).AsString   := parray[5];                //��� ���������� ����������
  if parray[6] <> '' then
    dbf.FieldByName('REPORT_DAT').AsDateTime := StrToDate(parray[6]);     //���� ������������� ������ ���������� ������, �������
  dbf.FieldByName('NUMDOC'      ).AsString   := parray[7];                //����� ���������� ���������
  if parray[8] <> '' then
    dbf.FieldByName('SUMMA'     ).AsFloat := StrToFloat(parray[8]);       //����� �������
  dbf.FieldByName('KBK'         ).AsString   := parray[9];                //��� ��������� �������������
  dbf.FieldByName('PAYMENTNUM'  ).AsString   := parray[10];               //����� ��������� ��������� ��� ������������ �������� �������
  if parray[12] <> '' then
    dbf.FieldByName('PAYMENTDAT').AsDateTime := StrToDate(parray[11]);    //���� ���������� ���������
  dbf.FieldByName('NAME_AGENT'  ).AsString   := parray[12];               //������������ ����������� �������������
  dbf.FieldByName('NUMPOST'     ).AsString   := parray[13];               //������������ ����������� ����������
  dbf.FieldByName('CODEERR'     ).AsString   := parray[14];               //��� ������
  dbf.FieldByName('TEXTERR'     ).AsString   := parray[15];               //�������� ������

  dbf.Post;
  dbf.Close;
  dbf.Free;

//  RenameFile(ExtractFilePath(ExtractFilePath(val)) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.dbf')), ExtractFilePath(val) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.ans')));
//  DeleteFile(ExtractFilePath(ExtractFilePath(val)) + ExtractFileName(ChangeFileExt(ExtractFileName(val), '.req')));

end;

Initialization
  ExportErrorMsg := '';


End.


