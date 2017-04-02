unit fdcWord;

// (c) FORS, 19.11.2007

interface

uses
  Variants, ComObj, Registry, Windows, SysUtils, DB, WordXP;


type

  TWordClass = class
  private
    WordApp       : OleVariant;
    FSaveChanges  : OleVariant;
    FErrorMessage : string;
    procedure   SetVisible(Value: boolean);
    function    GetVisible : boolean;
    function    FIsInstalled: boolean;
    procedure   ClrMsg;
  public
    // --- class
    Constructor Create;
    Destructor  Destroy; override;
    // --- Word application
    function    CreateApp: boolean;
    procedure   CloseApp;
    // --- work with document   
    function    Open(aFileName: string): boolean;
    function    SaveAs(aFileName: string): boolean;
    procedure   CloseDoc;
    function    ReplaceText(aLabel, aText: ansistring): boolean;
    function    MultiReplaceText(aLabels, aTexts: array of string): boolean;
    function    ReplaceRecFromQuery(Ds : TDataSet) : boolean;
    procedure   ReplaceText_(aLabel, aText: ansistring);
    procedure   ReplaceTextFromQuery(aLabel: string;Ds : TDataSet; aSeparator: string);
    function    GetArrayFromDataSet(Ds: TDataSet; aFieldName, aLabel: string; aSeparator: string): boolean;
  published
    property    SaveChanges  : OleVariant read FSaveChanges write FSaveChanges;
    property    AppVisible   : boolean    read GetVisible   write SetVisible;
    property    IsInstalled  : boolean    read FIsInstalled;
    property    ErrorMessage : string     read FErrorMessage;
    property    pWordApp     : OleVariant read WordApp      write WordApp;
  end;


implementation

uses StrUtils;

const
  dfSaveChanges = True;
  dfAppVisible  = False;
  cLabel        = '@';

  cWordApp      = 'Word.Application';  // do not localize
  wdReplaceAll  = 2;                   // do not localize


// --- Class ---
// =============

Constructor TWordClass.Create;
begin
  inherited; 
  FSaveChanges := dfSaveChanges;
  FErrorMessage := '';
end;


Destructor TWordClass.Destroy;
begin
//  CloseApp;
  inherited;
end;


// --- appplication ---
// ====================

function  TWordClass.CreateApp: boolean;
begin
  ClrMsg;
  try
    WordApp := CreateOleObject(cWordApp);
    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
  AppVisible := dfAppVisible;
end;


procedure   TWordClass.CloseApp;
begin
  ClrMsg;
  try
    WordApp.Quit(SaveChanges, EmptyParam, EmptyParam);
  except
    on e: exception do
      FErrorMessage := e.Message;
  end;
end;


// --- properties ---
// ==================

procedure  TWordClass.SetVisible(Value: boolean);
begin
  ClrMsg;
  try
    WordApp.Visible := Value;
  except
    on e: exception do
      FErrorMessage := e.Message;
  end;
end;


function  TWordClass.GetVisible : boolean;
begin
  ClrMsg;
  try
    Result := WordApp.Visible
  except
    on e: exception do begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
end;


function TWordClass.FIsInstalled: boolean;
begin
  ClrMsg;
  try
    with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      Result := KeyExists(cWordApp);
    finally
      Free;
    end;
  except
    on e : exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;                          
end;


// --- Document ---
// ================

function   TWordClass.Open(aFileName: string): boolean;
begin
  ClrMsg;
  try
    WordApp.Documents.Add(aFileName);
    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
end;


function  TWordClass.SaveAs(aFileName: string): boolean;
begin
  ClrMsg;
  try
    WordApp.ActiveDocument.SaveAs(aFileName);
    Result := True;
  except on e: exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
end;


procedure   TWordClass.CloseDoc;
begin
  ClrMsg;
  try
    WordApp.Documents.Close;
  except
    on e: exception do
      FErrorMessage := e.Message;
  end;
end;


function TWordClass.ReplaceText(aLabel, aText: ansistring): boolean;
begin
  ClrMsg;
  try
    WordApp.Selection.HomeKey(wdStory);
    WordApp.Selection.Find.Text := aLabel;
    WordApp.Selection.Find.Replacement.Text := aText;
    Result := WordApp.Selection.Find.Execute(Replace := wdReplaceAll);
  except
    on e: exception do begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
end;


procedure   TWordClass.ClrMsg;
begin
  FErrorMessage := '';
end;


function  TWordClass.MultiReplaceText(aLabels, aTexts: array of string): boolean;
var
  i, jl, jh : integer;
  b : boolean;
begin
  ClrMsg;
  jl := low(aTexts);
  jh := high(aTexts);
  Result := True;
  for i := low(aLabels) to high(aLabels) do
  begin
    if (i >= jl) and (i <= jh) then
      b := ReplaceText(aLabels[i], aTexts[i])
    else
      b := ReplaceText(aLabels[i], '');
    if not b then
      Result := False;
  end;
end;


function    TWordClass.ReplaceRecFromQuery(Ds : TDataSet) : boolean;
var
  i : integer;
  s,s2: array of string;
begin
  ClrMsg;
  try
    SetLength(s, Ds.FieldCount);
    SetLength(s2, Ds.FieldCount);
    try
//      Query.First;
      for i := 0 to Ds.FieldCount-1 do
      begin
        s[i] := cLabel + Ds.Fields[i].FieldName;
        s2[i] := Ds.Fields[i].DisplayText;
      end;
      Result := MultiReplaceText(s, s2);
    finally
      SetLength(s, 0);
      SetLength(s2, 0);
    end;
  except
    on e: exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end;
end;

function  TWordClass.GetArrayFromDataSet(Ds: TDataSet; aFieldName, aLabel: string; aSeparator: string): boolean;
var
  s : string;
begin
  ClrMsg;
  s := '';
  if Ds.Active and (Ds.FieldByName(aFieldName) <> nil) then
  try
    Ds.First;
    while not Ds.Eof do
    begin
      s := s + IfThen((LowerCase(aSeparator) = '^p'),#13#10,aSeparator) + Ds.FieldByName(aFieldName).DisplayText;
      Ds.Next;
    end;
    ReplaceText_(cLabel + aLabel, Copy(s, length(IfThen((LowerCase(aSeparator) = '^p'),#13#10,aSeparator)) + 1, length(s) - length(IfThen((LowerCase(aSeparator) = '^p'),#13#10,aSeparator))));
    Result := true;
  except
    on e: exception do
    begin
      Result := False;
      FErrorMessage := e.Message;
    end;
  end
  else
    Result := False;
end;

procedure TWordClass.ReplaceText_(aLabel, aText: ansistring);
  var l_i: boolean;
begin
  ClrMsg;
  try
    WordApp.Selection.HomeKey(wdStory);
    WordApp.Selection.Find.Text := aLabel;
    l_i := WordApp.Selection.Find.Execute();
    while (l_i) do
      begin
        WordApp.Selection.Text := aText;
        WordApp.Selection.Collapse(wdCollapseEnd);
        l_i := WordApp.Selection.Find.Execute();
      end;
  except
    on e: exception do begin
      FErrorMessage := e.Message;
    end;
  end;
end;

procedure TWordClass.ReplaceTextFromQuery(aLabel: string;Ds : TDataSet; aSeparator: string);
var
  lv_text: AnsiString;
  lv_i   : Integer;
begin
  lv_text :='';
  try
    if ds.Active then
      begin
        Ds.First;
      end
    else
      begin
        Ds.Open;
      end;
    while not(Ds.eof) do
      begin
        if (lv_text <> '') then
          begin // перевод строки
            lv_text := lv_text + #13#10;
          end;
        for lv_i := 0 to Ds.FieldCount - 1 do
          begin
            lv_text := lv_text + IfThen((lv_i = 0),'',aSeparator)  + Ds.Fields.Fields[lv_i].AsString;
          end;
        Ds.Next;
      end;
    ReplaceText_(aLabel, lv_text);
  except
    on e: exception do
    begin
      FErrorMessage := e.Message;
    end;
  end;
end;

end.

