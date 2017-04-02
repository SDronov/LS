unit TransferDm;

interface

uses
  SysUtils, Classes, DataDm, FMTBcd, Oracle, OracleData, DB, DBXpress,
  SqlExpr;


type
  TdmTransfer = class(TDataModule)
    dsOra: TOracleDataSet;
    SQLQuery1: TSQLQuery;
    connMain: TSQLConnection;
  private
    { Private declarations }
    FDirName: string;
  public
    { Public declarations }
    procedure RetrieveDecl(aFiles: string; aParams: TStringList);
    property DirName: string read FDirName write FDirName;
  end;

var
  dmTransfer: TdmTransfer;

implementation

uses IniFiles, VKDBFDataSet, Windows, OracleCI, StrUtils;

type
  TStringListEx = class(TStringList)
  protected
    procedure SetTextStr(const Value: string); override;
   end;

procedure TStringListEx.SetTextStr(const Value: string);
var
  P, Start: PChar;
  S: string;
  S1: String;
begin
  S1 := '';
  BeginUpdate;
  try
    Clear;
    P := Pointer(Value);
    if P <> nil then
      begin
        while P^ <> #0 do
        begin
          Start := P;
          while not (P^ in [#0, #10, #13]) do Inc(P);
          if (P > Start) and ((P-1)^ = '\') then
          begin
             SetString(S, Start, P - Start - 1);
             if S1 <> '' then
                S1 := S1 + #13#10;
             S1 := S1 + S;
          end
          else
          begin
            SetString(S, Start, P - Start);
            if S1 <> '' then
              S1 := S1 + #13#10;
            Add(S1 + S);
            S1 := '';
          end;
          if P^ = #13 then Inc(P);
          if P^ = #10 then Inc(P);
        end;
        if S1 <> '' then
          Add(S1);
    end;
  finally
    EndUpdate;
  end;
end;   

function LoadIniFile(const FileName: string): TMemIniFile;
var
  Lines: TStrings;
begin
  Lines := TStringListEx.Create;
  try
    Lines.LoadFromFile(FileName);
    Result := TMemIniFile.Create('');
    try
      Result.SetStrings(Lines);
    except
      Result.Free;
      raise;
    end;
  finally
    Lines.Free;
  end;
end;

procedure SetDBFFieldDefs(Dbf: TVKDBFNTX; const DBFFieldDefs: string);
var
  Mem: TMemoryStream;
  Src: TStringStream;
  Reader: TReader;
begin
  Src := TStringStream.Create(Format('inherited %s: TVKDBFNTX DBFFieldDefs = <%s>end',
           [Dbf.Name, DBFFieldDefs]));
  try
    Mem := TMemoryStream.Create;
    try
      ObjectTextToBinary(Src, Mem);
      Mem.Position := 0;
      Dbf.DBFFieldDefs.Clear;
      Reader := TReader.Create(Mem, 4096);
      try
        Reader.ReadSignature;
        Reader.BeginReferences;
        Reader.ReadComponent(Dbf);
        Reader.FixupReferences;
      finally
        Reader.Free;
      end;
    finally
      Mem.Free;
    end;
  finally
    Src.Free;
  end;
end;

function CreateDBF(const FileName: string; const DBFFieldDefs: string): TVKDBFNTX;
begin
  Result := TVKDBFNTX.Create(nil);
  try
    Result.Name := 'X';
    Result.DBFFileName := FileName;
    Result.AccessMode.AccessMode := fmOpenReadWrite;
    Result.DbfVersion :=   xbaseIII;
    Result.TrimCType := True;
    Result.OEM := True;
    SetDBFFieldDefs(Result, DBFFieldDefs);
    Result.CreateTable;
    Result.BufferSize :=  1024 * 24;
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

procedure LoadQuery(FromDataSet: TDataSet; ToDataSet: TDataSet);
var
  Field: TField;
  I: Integer;
begin
  while not FromDataSet.Eof do
  begin
    ToDataSet.Append;
    for I := 0 to FromDataSet.FieldCount - 1 do    // Iterate
    begin
      Field := ToDataSet.FindField(FromDataSet.Fields[I].FieldName);
      if Field <> nil then
          Field.Value := FromDataSet.Fields[I].Value;
    end;    // for
    ToDataSet.Post;
    FromDataSet.Next;
  end;    // while
end;


procedure TdmTransfer.RetrieveDecl(aFiles: string; aParams: TStringList);
var
  IniFile: TMemIniFile;
  Files: TStringList;
  FileName: string;
  I: Integer;
  J: integer;
  DataSet: TDataSet;
  S: string;
  fd: string;
begin
  IniFile := LoadIniFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'LoadApp_out.ini');
  try
    //DirName := StringReplace(IniFile.ReadString('common', 'SaveDir', '%TEMP%')
    // , '%TEMP%', GetEnvironmentVariable('TEMP'), [rfReplaceAll, rfIgnoreCase]);
    //CreateDirectory(PChar(DirName), nil);
    //DirName := IncludeTrailingPathDelimiter(DirName);

    Files := TStringList.Create;
    try
      Files.CommaText :=  aFiles;
      for I := 0 to Files.Count - 1 do
      begin
        FileName := DirName + Files[i];
        SysUtils.DeleteFile(FileName);
        dsOra.Close;
        dsOra.DeleteVariables;
        dsOra.SQL.Text := IniFile.ReadString(Files[i], 'sql', '');
        (*SQLQuery1.SQL.Assign(dsOra.SQL);

        for j := 0 to SQLQuery1.Params.Count - 1 do
        begin
           S := SQLQuery1.Params[j].Name;
           dsOra.DeclareVariable(S, otDate);
           dsOra.SetVariable(S, aParams.Values[S]);
        end;*)
        dsOra.Open;
        try
         fd:=IniFile.ReadString(Files[i], 'field_defs', '');
         DataSet := CreateDBF(FileName, fd);
         try
           LoadQuery(dsOra, DataSet);
         finally
           DataSet.Free;
         end;
        finally
            dsOra.Close;
        end;
      end;
    finally
      Files.Free;
    end;
  finally
    IniFile.Free;
  end;
end;


{$R *.dfm}

end.
