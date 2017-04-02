unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, ExtCtrls,  QueryManager;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FManager: TQueryManager;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Log4D;

{$R *.dfm}


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  FManager.DoProcess;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Str: TStrings;
begin
  FManager := TQueryManager.Create;
//  Memo1.Lines.Add(Format('Поключение к БД: %s@%s', [DataModule2.OracleSession1.LogonUsername,
//  DataModule2.OracleSession1.LogonDatabase]));
  Memo1.Lines.Add('Список каталогов обмена с КПС "Инспектор ОТО":');
  Str := FManager.GetPathList;
  try
   Memo1.Lines.AddStrings(Str);
  finally
   Str.Free;
  end;
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FManager);
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

end.

