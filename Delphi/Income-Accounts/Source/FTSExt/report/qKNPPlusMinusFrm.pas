unit qKNPPlusMinusFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, DB, dxmdaset,
  OracleData, Oracle, cxDBEdit, xlcClasses, xlEngine, xlReport;

type
  TqKNPPlusMinusForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    srcParam: TDataSource;
    dsParam: TdxMemData;
    dsParamKNP_ID: TFloatField;
    dsParamSUBJ_ID: TFloatField;
    dsParamSUBJ_NAME: TStringField;
    dsParamSDATE: TDateField;
    dsParamEDATE: TDateField;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtbDate: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtEDate: TcxDBDateEdit;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dsMain: TOracleDataSet;
    xlReport: TxlReport;
    dsPayerList: TOracleDataSet;
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure actOkExecute(Sender: TObject);
    procedure dsMainBeforeQuery(Sender: TOracleDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsPayerListBeforeQuery(Sender: TOracleDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function  ExecReport: Boolean;

implementation

uses
  fdcUtils, FormUtils, MainDm, qReportUtil;



procedure SetSession(AForm: TForm; ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to AForm.ComponentCount-1 do
  begin

    { TOracleDataset }
    if (AForm.Components[i] is TOracleDataset) and
       (not Assigned((AForm.Components[i] as TOracleDataset).Session)) then
      (AForm.Components[i] as TOracleDataset).Session := ASession;

    { TOracleQuery }
    if (AForm.Components[i] is TOracleQuery) and
       (not Assigned((AForm.Components[i] as TOracleQuery).Session)) then
      (AForm.Components[i] as TOracleQuery).Session := ASession;

  end;
end;

function  ExecReport: Boolean;
var
  F: TqKNPPlusMinusForm;
begin
  F := TqKNPPlusMinusForm.Create(nil);
  try
    SetSession(F, MainData.Session);
    F.edtbDate.Date := Date;
    F.edtEDate.Date := Date;
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

{$R *.dfm}

procedure TqKNPPlusMinusForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Insert;
  dsParamSDate.Value := Date;
  dsParamEDate.Value := Date;
end;

procedure TqKNPPlusMinusForm.actOkExecute(Sender: TObject);
begin
  inherited;
  dsParam.CheckBrowseMode;
  DisplayBusyCursor;
  dsMain.Close;
  dsMain.Open;
  dsPayerList.Close;
  dsPayerList.Open;
  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqKNPPlusMinusForm.dsMainBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('SDATE', dsParamSDATE.AsVariant);
  Sender.SetVariable('EDATE', dsParamEDATE.AsVariant);
  Sender.SetVariable('AGMT_ID',dsParamKNP_ID.AsVariant);
end;

procedure TqKNPPlusMinusForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);
end;

procedure TqKNPPlusMinusForm.dsPayerListBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('ID',dsParamKNP_ID.AsVariant);
  Sender.SetVariable('SDATE', dsParamSDATE.AsVariant);
  Sender.SetVariable('EDATE', dsParamEDATE.AsVariant);
end;

{initialization
  FormUtils.RegisterMenuItem('miKNPReport', 'Реестры плюсы минусы', '', '', @ExecReport);}
end.
