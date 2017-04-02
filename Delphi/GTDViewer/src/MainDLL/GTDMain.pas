unit GTDMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, RpCon, Buttons, ExtCtrls, Grids, DBGrids,
  StdCtrls, RpDefine, RpRave, ComCtrls, uReportScript, ToolWin, Oracle, BDE,
  RpBase, RpSystem, uDMMain, ValEdit, KERpFormPreview, OracleData, RpConDS;

type
  TGTDMainForm = class(TForm)
    RvProjectGTD: TRvProject;
    RvSystem1: TRvSystem;
    Panel2: TPanel;
    BtnLoadScript: TButton;
    sbPrint: TSpeedButton;
    vleFilter: TValueListEditor;
    OracleDataSet1: TOracleDataSet;
    OracleSession1: TOracleSession;
    TPO_1: TRvDataSetConnection;
    OracleDataSet1TPO_NUMBER: TStringField;
    OracleDataSet1ORDER_TYPE: TStringField;
    OracleDataSet1EXT_LIST: TStringField;
    OracleDataSet1DOC_NAME: TStringField;
    OracleDataSet1INN: TStringField;
    OracleDataSet1NAME: TStringField;
    OracleDataSet1KODVAL: TStringField;
    OracleDataSet1CURS_USD: TStringField;
    OracleDataSet1CURS_EKU: TStringField;
    OracleDataSet1DOP_INF1: TStringField;
    OracleDataSet1DOP_INF2: TStringField;
    OracleDataSet1DOP_INF3: TStringField;
    OracleDataSet1WEIGHT_AL: TStringField;
    OracleDataSet1TOVCOST_PL: TStringField;
    OracleDataSet1TOVCOST_USD: TStringField;
    OracleDataSet1TOVCOST_EKU: TStringField;
    OracleDataSet1SUM_RUB: TStringField;
    OracleDataSet1SUM_USD: TStringField;
    OracleDataSet1SUM_EKU: TStringField;
    OracleDataSet1SPRUB: TStringField;
    OracleDataSet1OPLRUB: TStringField;
    OracleDataSet1FIOTAM: TStringField;
    OracleDataSet1FIOKAS: TStringField;
    OracleDataSet1NAIMENOV: TStringField;
    OracleDataSet1CODTNVED: TStringField;
    OracleDataSet1WEIGHT: TStringField;
    OracleDataSet1KOLVO: TStringField;
    OracleDataSet1COD_PLAT: TStringField;
    OracleDataSet1TOVCOST0_PL: TStringField;
    OracleDataSet1TOVCOST0_USD: TStringField;
    OracleDataSet1TOVCOST0_EKU: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RvProjectGTDBeforeOpen(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure BtnLoadScriptClick(Sender: TObject);
    procedure RvSystem1OverridePreview(ReportSystem: TRvSystem;
      OverrideMode: TOverrideMode; var OverrideForm: TForm);
  private
    FMainDir, FScriptName : string;
    GTDScript: TReportObjects;

    procedure LoadScript;
    procedure PrintDoc;
    procedure FindGTD;
  public
    procedure SetFilter(AFilter: string);
    procedure SetScriptDir(ADir: string);
  end;

procedure ext_print_doa_doc(AApplicationHandle: THandle; ADOASession: TOracleSession; AScriptFileName, AFilter: PChar; ShowFilterForm, DesignerMode: boolean);StdCall;
procedure ext_print_doc(AApplicationHandle: THandle; ADBName, ADriver, AUserName, APassword, AScriptFileName, AFilter: PChar; ShowFilterForm, DesignerMode: boolean);StdCall;

implementation

uses uParser;

procedure ext_print_doa_doc(AApplicationHandle: THandle; ADOASession: TOracleSession; AScriptFileName, AFilter: PChar; ShowFilterForm, DesignerMode: boolean);StdCall;
var
  GTDMainForm: TGTDMainForm;
begin
  Application.Handle:=AApplicationHandle;
  GTDMainForm:=TGTDMainForm.Create(Application);
  try
    GTDMainForm.BtnLoadScript.Visible:=DesignerMode;
    GTDMainForm.SetScriptDir(AScriptFileName);
    if ADOASession<>nil then GTDMainForm.GTDScript.SetDOASession(ADOASession);
    GTDMainForm.SetFilter(AFilter);
    if ShowFilterForm then GTDMainForm.ShowModal
    else GTDMainForm.sbPrintClick(GTDMainForm);
  finally
    GTDMainForm.Free;
  end;
end;

procedure ext_print_doc(AApplicationHandle: THandle; ADBName, ADriver, AUserName, APassword, AScriptFileName, AFilter: PChar; ShowFilterForm, DesignerMode: boolean);
var
  GTDMainForm: TGTDMainForm;
  LDataBase: TDataBase;
begin
  Application.Handle:=AApplicationHandle;
  try
  GTDMainForm:=TGTDMainForm.Create(Application);
  try
    GTDMainForm.BtnLoadScript.Visible:=DesignerMode;
    LDataBase:=TDataBase.Create(GTDMainForm);
    try
      LDataBase.DatabaseName:=ADBName;
      LDataBase.DriverName:=ADriver;
      LDataBase.Params.Add('SERVER NAME='+ADBName);
      LDataBase.Params.Add('USER NAME='+AUserName);
      LDataBase.Params.Add('PASSWORD='+APassword);
      if APassword<>'' then LDataBase.LoginPrompt:=False;
      LDataBase.Open;
      GTDMainForm.SetScriptDir(AScriptFileName);
      GTDMainForm.SetFilter(AFilter);
      if ShowFilterForm then GTDMainForm.ShowModal
      else GTDMainForm.sbPrintClick(GTDMainForm);
    finally
      LDataBase.Free;
    end;
  finally
    GTDMainForm.Free;
  end;
  except
    on E: Exception do Application.ShowException(E);
  end;
end;

{$R *.dfm}

procedure TGTDMainForm.FormCreate(Sender: TObject);
begin
//  FMainDir:=ExtractFilePath(ParamStr(0));
  GTDScript:=TReportObjects.Create;
  Application.CreateForm(TDMMain, DMMain);
  DMMain.Script:=GTDScript;
end;

procedure TGTDMainForm.FormDestroy(Sender: TObject);
begin
  DMMain.Free;
  GTDScript.Free;
end;

procedure TGTDMainForm.FindGTD;
begin
  GTDScript.SetFilter(vleFilter.Strings.DelimitedText);
end;

procedure TGTDMainForm.RvProjectGTDBeforeOpen(Sender: TObject);
begin
  GTDScript.InitAllDS;
end;

procedure TGTDMainForm.LoadScript;
begin
  GTDScript.ClearAll;
  DMMain.ClearAll;
  GTDScript.ExecScript(FMainDir+FScriptName);
end;

procedure TGTDMainForm.PrintDoc;
begin
  RvProjectGTD.ProjectFile:=TTemplate(GTDScript.GetParserObjectByName('Template')).PRvTemplateFile;
  RvProjectGTD.Open;
  RvProjectGTD.Execute;
  RvProjectGTD.Close;
end;

procedure TGTDMainForm.SetFilter(AFilter: string);
begin
  vleFilter.Strings.DelimitedText:=AFilter;
end;

procedure TGTDMainForm.sbPrintClick(Sender: TObject);
begin
  LoadScript;
  FindGTD;
  PrintDoc;
  KERavePreviewForm:=TKERavePreviewForm.Create(Application);
end;

procedure TGTDMainForm.SetScriptDir(ADir: string);
begin
  FMainDir:=ExtractFilePath(ADir);
  FScriptName:=ExtractFileName(ADir);
end;

procedure TGTDMainForm.BtnLoadScriptClick(Sender: TObject);
begin
  LoadScript;
  FindGTD;
end;

procedure TGTDMainForm.RvSystem1OverridePreview(ReportSystem: TRvSystem;
  OverrideMode: TOverrideMode; var OverrideForm: TForm);
begin
  case OverrideMode of
    omCreate: begin
      OverrideForm := TKERavePreviewForm.Create(ReportSystem);
      OverrideForm.Caption := ReportSystem.TitlePreview;
      OverrideForm.Width := ReportSystem.SystemPreview.FormWidth;
      OverrideForm.Height := ReportSystem.SystemPreview.FormHeight;
      OverrideForm.WindowState := ReportSystem.SystemPreview.FormState;
      (OverrideForm as TKERavePreviewForm).ReportSystem := ReportSystem;
    end;
    omShow: begin
      (OverrideForm as TKERavePreviewForm).RvRenderPrinter.MacroData.Assign(ReportSystem.StorageMacroData);
      (OverrideForm as TKERavePreviewForm).RvRenderPreview.MacroData.Assign(ReportSystem.StorageMacroData);

      ReportSystem.SystemPreview.InitPreview((OverrideForm as TKERavePreviewForm).RvRenderPreview);

      (OverrideForm as TKERavePreviewForm).InputFileName := ReportSystem.SystemFiler.Filename;
      (OverrideForm as TKERavePreviewForm).InputStream := ReportSystem.SystemFiler.Stream;
      (OverrideForm as TKERavePreviewForm).InitFromRPSystem;
    (* *)
       OverrideForm.ShowModal;
    end;
    omWait: begin

    end;
    omFree: begin
      if (ReportSystem.SystemFiler.StreamMode in [smTempFile,smFile]) then begin
        (OverrideForm as TKERavePreviewForm).RvRenderPreview.NDRStream.Free;
        (OverrideForm as TKERavePreviewForm).RvRenderPreview.NDRStream := nil;
      end; { if }
      FreeAndNil(OverrideForm);
    end;
  end; { case }
//  KERvSystemOverridePreview(ReportSystem,OverrideMode,OverrideForm);
end;

end.
