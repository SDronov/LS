unit TestMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Oracle, StdCtrls, Controls,
  uPrintDoc{, uDOAPrintDoc};

type
  TTestMainForm1 = class(TForm)
    Button1: TButton;
    OracleSession1: TOracleSession;
    OracleLogon1: TOracleLogon;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label2: TLabel;
    eLogin: TEdit;
    Label3: TLabel;
    ePass: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  TestMainForm1: TTestMainForm1;

implementation

{$R *.dfm}

const
  cDB  = 'B4'; //b4
  cDrv = 'ORACLE';   //ORACLE

procedure TTestMainForm1.Button1Click(Sender: TObject);
  var
    docYear : string;
begin
  docYear := Copy(Edit2.Text, 16, 4);
  exp_PrintGTD(Edit1.Text+'CBD'+docYear+'.esr',cDB,cDrv,eLogin.Text,ePass.Text,Edit2.Text,True,True);
end;

procedure TTestMainForm1.Button2Click(Sender: TObject);
var
  docDate : TDate;
begin
  ShortDateFormat := 'dd.mm.yyyy';
  docDate := StrToDate(Copy(Edit2.Text, 10, 10));
  if docDate < StrToDate('15.04.2013') then
    exp_PrintTPO(Edit1.Text+'TPOViewer.esr',cDB,cDrv,eLogin.Text,ePass.Text,'ÀÁ-4665734',True,True)
  else
    exp_PrintTPO(Edit1.Text+'TPO2013.esr',cDB,cDrv,eLogin.Text,ePass.Text,'ÀÁ-4665734',True,True);
end;

procedure TTestMainForm1.Button3Click(Sender: TObject);
begin
//  OracleLogon1.Execute;
//  exp_PrintGTD(Edit1.Text+'CBD2006DOA.esr','10404070/020106/0500044',OracleSession1,False,True);
end;

procedure TTestMainForm1.Button4Click(Sender: TObject);
begin
//  OracleLogon1.Execute;
//  exp_PrintTPO(Edit1.Text+'TPOViewerDOA.esr','ÀÁ-4665734',OracleSession1,False,True);
end;

procedure TTestMainForm1.Button6Click(Sender: TObject);
begin
//  OracleLogon1.Execute;
//  exp_PrintTR(Edit1.Text+'TRViewerDOA.esr','ÒÐ-0233585',OracleSession1,False,True);
end;

procedure TTestMainForm1.Button5Click(Sender: TObject);
begin
//  exp_PrintTR(Edit1.Text+'TRViewer.esr','b4','ORACLE',eLogin.Text,ePass.Text,'ÒÐ-0233585',True,True);
end;

procedure TTestMainForm1.Button7Click(Sender: TObject);
begin
  exp_PrintGTD(Edit1.Text+'CBD2009.esr',cDB,cDrv,eLogin.Text,ePass.Text,'10005023/04.01.2009/0000009',True,True);
end;

end.
