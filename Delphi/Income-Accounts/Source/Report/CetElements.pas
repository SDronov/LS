unit CetElements;

interface

const
  maxElement    = 6;
  Nuse          = '';

type
  TElement  = string;                               // ��� ���� �������
  TElements = array [0..maxElement-1] of TElement;  // ������ ��������


function InSet(Element: TElement; Elements: TElements): boolean;


implementation


function InSet(Element: TElement; Elements: TElements): boolean;
var
  i : integer;
begin
  Result := False;
  if (Element = Nuse) then
    exit
  else
    for i := 0 to maxElement-1 do
      if (Elements[i] = Element) then
        Result := True;
end;


End.

