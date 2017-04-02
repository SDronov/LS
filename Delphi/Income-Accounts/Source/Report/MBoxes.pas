unit MBoxes;

interface

function MBQuestionYesNo(aText:string): boolean;
function FileOk(aFileName: string): boolean;

implementation

uses
  Windows,
  SysUtils,
  Forms;

function MBQuestionYesNo(aText: string): boolean;
begin
  Result := (MessageBox(Screen.ActiveForm.Handle,
              PChar(aText),
              PChar('Внимание'),
              MB_IconQuestion or MB_YESNO or MB_APPLMODAL) = idYes);
end;


function FileOk(aFileName: string): boolean;
begin
  if FileExists(aFileName) then
    Result := MBQuestionYesNo('Файл ' + aFileName + ' существует, заменить?')
  else
    Result := True;
end;


end.
