unit NotifyMe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TNotifyMe = class(TForm)
    mNotify: TcxMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MainDm, StdCtrls;

{$R *.dfm}

procedure TNotifyMe.FormCreate(Sender: TObject);
var
  vStrBuff: TStringList;
begin
  vStrBuff := TStringList.Create;
  vStrBuff.Text := MainData.NoteStr;
  mNotify.Lines := vStrBuff;
//  Self.Constraints.MinHeight := mNotify.Lines.Count*13+50;
//  Self.Constraints.MaxHeight := mNotify.Lines.Count*13+50;
  if (mNotify.Lines.Count <= 15) then
    begin
      mNotify.Properties.ScrollBars := ssNone;
      Self.Constraints.MinHeight := mNotify.Lines.Count*13+50;
      Self.Constraints.MaxHeight := mNotify.Lines.Count*13+50;
    end
  else
    begin
      mNotify.Properties.ScrollBars := ssVertical;
      Self.Constraints.MinHeight := 440;
      Self.Constraints.MaxHeight := 440;
    end;
end;

end.
