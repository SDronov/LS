unit MergeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, StdCtrls, fdcOraLogOnFrm, ExtCtrls, fdcOracleSession,
  ActnList, cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxButtonEdit, JvBaseDlg, JvSelectDirectory,
  cxShellBrowserDialog, cxLookAndFeels, JvComponentBase, JvCreateProcess,
  jpeg, QueryList, JvGIF, Buttons, DB, FDCCustomDataset, fdcQuery;

type
  TMergeForm = class(TForm)
    Panel1: TPanel;
    btSource: TButton;
    btDestination: TButton;
    btDBA: TButton;
    btMerge: TButton;
    memOutput: TMemo;
    sessionSource: TfdcOracleSession;
    ActionList1: TActionList;
    actMerge: TAction;
    sessionDestination: TfdcOracleSession;
    sessionDBA: TfdcOracleSession;
    edtUtilPath: TcxButtonEdit;
    Label1: TLabel;
    edtDumpPath: TcxButtonEdit;
    Label2: TLabel;
    dlgUtilPath: TcxShellBrowserDialog;
    dlgDumpPath: TcxShellBrowserDialog;
    ProcStarter: TJvCreateProcess;
    DefaultEditStyleController: TcxDefaultEditStyleController;
    LookAndFeelController: TcxLookAndFeelController;
    WebEditStyleController: TcxEditStyleController;
    OfficeEditStyleController: TcxEditStyleController;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sessionRTU: TfdcOracleSession;
    QueryList2: TQueryList;
    GetCustomsCode: TsqlOp;
    MergeRTU: TsqlOp;
    actMergeRTU: TAction;
    Button1: TButton;
    imgSource: TImage;
    Image3: TImage;
    imgDestination: TImage;
    imgDBA: TImage;
    BitBtn1: TBitBtn;
    actSaveLog: TAction;
    SaveDialog1: TSaveDialog;
    qGetCustomsCode: TfdcQuery;
    procedure btUnloadClick(Sender: TObject);
    procedure btSourceClick(Sender: TObject);
    procedure actMergeUpdate(Sender: TObject);
    procedure btDestinationClick(Sender: TObject);
    procedure btDBAClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtDumpPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actMergeExecute(Sender: TObject);
    procedure ProcStarterRawRead(Sender: TObject; const S: String);
    procedure actMergeRTUExecute(Sender: TObject);
    procedure actSaveLogExecute(Sender: TObject);
  private
    { Private declarations }
    procedure OnMessage(const S: string);
  public
    { Public declarations }
  end;

var
  MergeForm: TMergeForm;

implementation

{$R *.dfm}

procedure TMergeForm.btUnloadClick(Sender: TObject);
var
  t: boolean;
begin
  //Step 1
  t := LogOn(sessionSource, true);

end;

procedure TMergeForm.btSourceClick(Sender: TObject);
begin
  if imgSource.Visible then
  begin
    sessionSource.Connected := false;
    btSource.caption := 'Подключиться';
    imgSource.Visible := sessionSource.Connected;
  end
  else
  begin
    imgSource.Visible := LogOn(sessionSource, true);
    if imgSource.Visible then
      btSource.Caption := 'Отключиться';
  end;
end;

procedure TMergeForm.actMergeUpdate(Sender: TObject);
begin
  if (imgSource.Visible
      and imgDestination.Visible
      and imgDBA.Visible
      and (edtUtilPath.Text<>'')
      and (edtDumpPath.Text<>'')) then
    actMerge.Enabled := true
  else
    actMerge.Enabled := false;
end;

procedure TMergeForm.btDestinationClick(Sender: TObject);
begin
  if imgDestination.Visible then
  begin
    sessionDestination.Connected := false;
    btDestination.caption := 'Подключиться';
    imgDestination.Visible := sessionDestination.Connected;
  end
  else
  begin
    imgDestination.Visible := LogOn(sessionDestination, true);
    if imgDestination.Visible then
      btDestination.Caption := 'Отключиться';
  end;
end;

procedure TMergeForm.btDBAClick(Sender: TObject);
begin
  if imgDBA.Visible then
  begin
    sessionDBA.Connected := false;
    btDBA.caption := 'Подключиться';
    imgDBA.Visible := sessionDBA.Connected;
  end
  else
  begin
    imgDBA.Visible := LogOn(sessionDBA, true);
    if imgDBA.Visible then
      btDBA.Caption := 'Отключиться';
  end;
end;

procedure TMergeForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if dlgUtilPath.Execute then
    edtUtilPath.Text := dlgUtilPath.Path;
end;

procedure TMergeForm.edtDumpPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if dlgDumpPath.Execute then
    edtDumpPath.Text := dlgDumpPath.Path;
end;

procedure TMergeForm.actMergeExecute(Sender: TObject);
var
  cmd: string;
  i: integer;
begin
  procStarter.CurrentDirectory := ExtractFilePath(Application.ExeName)+'MergeScripts';
//  OnMessage(procStarter.CurrentDirectory);
  //for i := 0 to 3 do
  begin
//    cmd:='"'+ProcStarter.CurrentDirectory+'\run_merge_step'+IntToStr(i)+'.cmd" '+
    cmd:='"'+ProcStarter.CurrentDirectory+'\run_merge.cmd" '+
      sessionSource.LogonUsername+'/'+sessionSource.LogonPassword+'@'+sessionSource.LogonDatabase+' '+
      sessionDestination.LogonUsername+'/'+sessionDestination.LogonPassword+'@'+sessionDestination.LogonDatabase+' '+
      sessionDBA.LogonUsername+'/'+sessionDBA.LogonPassword+'@'+sessionDBA.LogonDatabase+' '+
      edtDumpPath.Text+' '+
      edtUtilPath.Text+' '+
      DateToStr(NOW)+' '+
      sessionDestination.LogonDatabase+' '+
      sessionSource.LogonUsername;

//    OnMessage(cmd);

    ProcStarter.CommandLine := cmd;
    ProcStarter.Run;
  end;
{
set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set desc_inst=%7
}
    {ExpStart.CommandLine := format('"%s" %s file=''%s'' log=''%s'' INDEXES=n CONSTRAINTS=n ignore=y',
        [edtImpFileName.Text,
         MainData.GetConnectionString,
         edtDumpFileName.Text,
         ChangeFileExt(edtDumpFileName.Text, '_imp.log')
        ]);   }
  actMergeRTU.Enabled := True;
  actSaveLog.Enabled := True;
end;

procedure TMergeForm.OnMessage(const S: string);
begin
  memOutput.Lines.Add(S)
end;


procedure TMergeForm.ProcStarterRawRead(Sender: TObject; const S: String);
begin
  OnMessage(S);
end;

procedure TMergeForm.actMergeRTUExecute(Sender: TObject);
var
  SCode: string;
  TCode: string;
//  DT: TDate;
begin
//  DT:=NOW;
  if LogOn(sessionRTU, true) then
  begin
    //Получим код исходной таможни
    qGetCustomsCode.Session:=sessionSource;
    qGetCustomsCode.Open;
    SCode:= qGetCustomsCode.FieldValues['CCODE'];
    qGetCustomsCode.Close;
    //Получим код целевой таможни
    qGetCustomsCode.Session:=sessionDestination;
    qGetCustomsCode.Open;
    TCode:= qGetCustomsCode.FieldValues['CCODE'];
    qGetCustomsCode.Close;
    //Запустим генерацию актов
    QueryList2.Session:=sessionRTU;
//    MergeRTU.ParamValues['DT']:=DT;
    MergeRTU.ParamValues['scode']:=SCode;
    MergeRTU.ParamValues['tcode']:=TCode;
    MergeRTU.Exec;
    sessionRTU.Commit;
    Application.MessageBox('Выполнено.','Проведение на РТУ');
    actMergeRTU.Enabled := False;
  end;
end;

procedure TMergeForm.actSaveLogExecute(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    memOutput.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

end.
