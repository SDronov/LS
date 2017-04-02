unit cxListBoxEx;

// ������ ����� ������������ ��� �������� ��������������� � ����� �� �������� ��������,
// �������������� � cxListBox'��
// ������� ���������� �������� ���������� ��������
// � �� ������ ������, �������� � TStrings, � �������� TStrings.delete
// ����� �� ���� �������� LBox.Count <> FCount

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxListBox;


type

// --- ������������� ����
// !!! ��������
// ���� ������ ���� �����������


  TIdType    = Double;       // ��� �������
  TValueType = string;       // ��� ������������� � cxListBox'e �������� (���� ������� �� string ���������� ����

// !!! �������� !!!
// ���������� ���������� � ������� [0..Count-1]


// --- �������� ������

  TIdRec     = record
    Id       : TIdType;
    Value    : TValueType;
  end;

  TcxListBoxExClass = class
  private
    Ids             : array of TIdRec;
    FCount          : integer;
    FDisableDupple  : boolean;
    FSingle         : boolean;
    procedure   SetSingle(Value : boolean);
  public
    LBox            : TcxListBox;                                   // ��������� �����������
    Constructor Create;
    Destructor  Destroy; override;
    function    Append(Rec : TIdRec) : boolean;                     // ���������� ������ � ������
    procedure   Delete(Idx : integer);                              // �������� ������ �� �������
    procedure   DeleteById(aId : integer);
    procedure   DeleteSelected;                                     // �������� ������ ���������� � cxListBox'e
    procedure   DeleteAll;                                          // ������� ���
    function    GetRec(Idx : integer): TIdRec;                      // ���������� ������ �� ������� �� �������
    procedure   RefreshLst;                                         // �������������� ���������� ������ � cxListBox'e
  published
    property    Count         : Integer Read FCount;                              // ����� ������� � �������
    property    DisableDupple : Boolean Read FDisableDupple Write FDisableDupple; // ���������� ������������ �������  (���� True - �� � ������ �� ����� ����������� ������ ����� ������� ��� ������������ � �������)
    property    Single        : Boolean Read FSingle        Write SetSingle;      //
  end;


implementation

const
  dfLength = 64;                            // ����� �� ������� ����� ������������� ������ �������
  

Constructor TcxListBoxExClass.Create;
begin
  inherited;
  SetLength(Ids, dfLength);
  LBox := nil;
  FCount := 0;
  FDisableDupple := True;
end;


Destructor TcxListBoxExClass.Destroy;
begin
  SetLength(Ids, 0);
  inherited;
end;


function TcxListBoxExClass.Append(Rec : TIdRec) : boolean;
var
  i, l : integer;
begin
  Result := False;
  if (FCount > 0) and FSingle then
    exit;
  l := length(Ids);
  if DisableDupple then
    for i := 0 to Self.Count - 1 do
    begin
      if (Ids[i].Id = Rec.Id) or (Ids[i].Value = Rec.Value) then
        exit;
    end;
  if (FCount + 1 >= l) then
    SetLength(Ids, l + dfLength);
  Inc(FCount);
  Ids[FCount - 1] := Rec;
  Result := True;
  if Assigned(LBox) then
    LBox.Items.Append(Rec.Value);
end;


procedure TcxListBoxExClass.DeleteById(aId : integer);
var
  i : integer;
begin
  i := 0;
  while (i < FCount) do
    if (Ids[i].id = aId) then
      Delete(i)
    else
      inc(i);
end;


procedure TcxListBoxExClass.Delete(Idx : integer);
var
  i : integer;
begin
  if (Idx >= 0) and (Idx < FCount) then
  begin
    for i := Idx to FCount - 2 do
      Ids[i] := Ids[i + 1];
    Dec(FCount);
    if Assigned(LBox) then
      LBox.Items.Delete(Idx);
  end;
end;


procedure TcxListBoxExClass.DeleteSelected;
var
  i, k : integer;
begin
  if not Assigned(LBox) then
    exit;
  if (LBox.Count <> Self.Count) then
    raise exception.Create('cxListBoxExClass Error (DeleteSelected) : LBox.Count <> Self.Count');
  LBox.Enabled := False;
  k := 0;
  for i := 0 to LBox.Count - 1 do
  begin
    if (k <> i) then
      Ids[k] := Ids[i];
    if not LBox.Selected[i] then
      Inc(k);
  end;
  FCount := k; 
  RefreshLst;
  LBox.Enabled := True;    
end;

function TcxListBoxExClass.GetRec(Idx : integer): TIdRec;
begin
  if (Idx >= 0) and (Idx < FCount) then
    Result := Ids[Idx];
end;


procedure TcxListBoxExClass.RefreshLst;
var
  i : integer;
begin
  if Assigned(LBox) then
  begin
    LBox.Clear;
    for i := 0 to Count-1 do
      LBox.Items.Append(Ids[i].Value);
  end;
end;


procedure TcxListBoxExClass.DeleteAll;                                          
begin
  FCount := 0;
  RefreshLst;
end;


procedure TcxListBoxExClass.SetSingle(Value : boolean);
begin
  if Value and (FCount < 2) then
    FSingle := Value
  else if not Value then
    FSingle := Value;
end;


End.

