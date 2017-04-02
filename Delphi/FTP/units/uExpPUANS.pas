unit uExpPUANS;
interface

uses Forms, SysUtils, DB, VKDBFDataSet, uCommon;



const
  maxFieldCnt = 17;             // ������������ ����� ����� � dbf �� LS*.ANS

type
  TAnswTableFields = array[0..maxFieldCnt-1] of TFieldDef;

  TAnswTableDesc = record
    TableName  : string;                  // ��� �������
//    FieldCount : integer;                 // ���������� �����
    Fields     : TAnswTableFields;         // ��������� ������ � ������� ��������� �������� �����
  end;

const
  LSxxxxxxANS_PU : TAnswTableDesc = (
    TableName  : 'LS.ANS';
//    FieldCount : 17;  // (name:''; _type:''; size:0; frac:''),
    Fields  :( (name:'CUSTOMCODE'; _type:'C'; size:8;   frac:0),
               (name:'INN_D';      _type:'C'; size:12;  frac:0),
               (name:'KPP_D';      _type:'C'; size:9;   frac:0),
               (name:'BEGIN_DATE'; _type:'D'; size:8;   frac:0),
               (name:'END_DATE';   _type:'D'; size:8;   frac:0),
               (name:'TYPEDOC';    _type:'C'; size:3;   frac:0),
               (name:'REPORT_DAT'; _type:'D'; size:8;   frac:0),
               (name:'NUMDOC';     _type:'C'; size:12;  frac:0),
               (name:'DATE_DOC';   _type:'D'; size:8;   frac:0),
               (name:'SUMMA';      _type:'N'; size:19;  frac:2),
               (name:'KBK';        _type:'C'; size:20;  frac:0),
               (name:'PAYMENTNUM'; _type:'C'; size:30;   frac:0),
               (name:'PAYMENTDAT'; _type:'C'; size:10;  frac:0),
               (name:'NAME_AGENT'; _type:'C'; size:70;  frac:0),
               (name:'NUMPOST';    _type:'C'; size:19;  frac:0),
               (name:'CODEERR';    _type:'N'; size:5;   frac:0),
               (name:'TEXTERR';    _type:'C'; size:255; frac:0) ) );

function GetInt(aText : string): integer;  //�������� �� ������ �������� �������
function GetType(aText : string): char;    //�������� ����� � �������
procedure createAnswDBF_PU(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec); //�������� � ���������� dbf ����� ������

implementation

var ExportErrorMsg : string = '';

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
function Create_DBF_PUANS( ExportDir : string; tblDesc: TAnswTableDesc ) : string;
var
  i : integer;
  DBF : TVKDBFNTX;
begin
  try
    // ��������
    if (tblDesc.TableName = '') then
      raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� �������');
    if (length(tblDesc.Fields) <= 0) then
      raise exception.Create('������ ��������� DBF (������ Export) : ����� ����� � ������� ������ ���� ������ ����');
    // �������� DBF �������
    DBF := TVKDBFNTX.Create(nil);
    try
      DBF.DBFFileName := includeTrailingPathDelimiter(ExportDir) + tblDesc.TableName;
      // �������� �����
      for i := low(tblDesc.Fields) to high(tblDesc.Fields) do
        with dbf.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          if (tblDesc.Fields[i].name = '') then
            raise exception.Create('������ ��������� DBF (������ Export) : �� ������� ��� ����')
          else
            Name := tblDesc.Fields[i].name;
          Field_Type := GetType(tblDesc.Fields[i]._type);
          Len := tblDesc.Fields[i].size;
          Dec := tblDesc.Fields[i].frac;
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

procedure createAnswDBF_PU(const aDBF_Name:TFileName; const aDS: TDataSet; var aRec:TAnswerRec);
var
 dbf: TVKDBFNTX;
// PU: TAnswTableDesc;
 ans_PU: TAnswTableDesc;
 _dbf: TFileName;
begin
 //���������� ������ ��� ��������� DBF
 ans_PU := LSxxxxxxANS_PU;
// PU.FieldCount := 16;
 ans_PU.TableName := extractFileName( aDBF_Name );
 _dbf := create_DBF_PUANS( extractFileDir(aDBF_Name) , ans_PU );

 dbf := TVKDBFNTX.Create(nil);
 dbf.DBFFileName := _dbf;
 dbf.OEM := True;
 dbf.AccessMode.OpenReadWrite := True;

  dbf.Open;
  repeat;
    dbf.Append;

    dbf.FieldByName('CUSTOMCODE').AsString:= aRec.CUSTOMCODE;          //��� ����������� ������
    dbf.FieldByName('INN_D').AsString     := aRec.INN_D;               //��� �����������
    dbf.FieldByName('KPP_D').AsString     := aRec.KPP_D;               //��� �����������

    dbf.FieldByName('BEGIN_DATE').AsDateTime := aRec.BEGIN_DATE;     //���� ������ �������, �� ������� ������������� ���������� � �������� �������� �������
    if (aRec.BEGIN_DATE = 0) then
      dbf.FieldByName('BEGIN_DATE').Clear;

    dbf.FieldByName('END_DATE').AsDateTime := aRec.END_DATE;         //���� ����� �������, �� ������� ������������� ���������� � �������� �������� �������
    if (aRec.END_DATE = 0) then
      dbf.FieldByName('END_DATE').Clear;

    dbf.FieldByName('TYPEDOC').AsString      := aRec.TYPEDOC;          //��� ���������� ����������
    dbf.FieldByName('REPORT_DAT').AsDateTime := now;

    dbf.FieldByName('NUMPOST'     ).AsString   := aRec.NUMPOST;        //������������ ����������� ����������
    dbf.FieldByName('CODEERR'     ).AsString   := aRec.CODEERR;        //��� ������
    dbf.FieldByName('TEXTERR'     ).AsString   := aRec.TEXTERR;        //�������� ������
    if assigned(aDS) then begin
      dbf.FieldByName('NUMDOC').AsString:= aDS.FieldByName('NUMDOC').AsString;

      dbf.FieldByName('DATE_DOC').AsDateTime := aDS.FieldByName('DATE_DOC').AsDateTime;
      if aDS.FieldByName('DATE_DOC').IsNull then
        dbf.FieldByName('DATE_DOC').Clear;

      dbf.FieldByName('SUMMA').AsFloat:=  aDS.FieldByName('SUMMA').AsFloat;
      dbf.FieldByName('KBK').AsString:= aDS.FieldByName('KBK').AsString;
      dbf.FieldByName('PAYMENTNUM').AsString:= aDS.FieldByName('PAYMENTNUM').AsString;
      dbf.FieldByName('PAYMENTDAT').AsDateTime:= aDS.FieldByName('PAYMENTDAT').AsDateTime;
      dbf.FieldByName('NAME_AGENT').AsString:= aDS.FieldByName('NAME_AGENT').AsString;
      aDS.Next;
    end;{}
    dbf.Post;
  until ( not assigned(aDS) ) or aDS.Eof ; {while not aDS.Eof..}
  if assigned(aDS) then aDS.Close;  
  dbf.Close;
  dbf.Free;
end;

initialization

end.
