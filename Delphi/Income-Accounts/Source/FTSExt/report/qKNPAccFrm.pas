unit qKNPAccFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, DB, OracleData,
  xlcClasses, xlEngine, xlReport, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxDBEdit, cxGraphics;

type
  TqKNPAccForm = class(TfdcCustomDlgForm)
    edtbDate: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtEDate: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsData: TOracleDataSet;
    dsDetail: TOracleDataSet;
    xlReport: TxlReport;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsParam: TdxMemData;
    dsParamAGMT_ID: TFloatField;
    srcParam: TDataSource;
    dsHeader: TOracleDataSet;
    dsParamSDATE: TDateField;
    dsParamEDATE: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dsDataBeforeQuery(Sender: TOracleDataSet);
    procedure dsHeaderBeforeQuery(Sender: TOracleDataSet);
    procedure dsParamAfterOpen(DataSet: TDataSet);
    procedure dsDetailBeforeQuery(Sender: TOracleDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport: Boolean;

implementation

uses
  fdcUtils, DateUtils, MainDm, IniFiles, DictDm, Excel8G2, ActiveX,
  FormUtils, qReportUtil;

{$R *.dfm}

procedure SetSession(AForm: TForm; ASession: TOraclesession);
var
  i: integer;
begin
  for i:=0 to AForm.ComponentCount-1 do
  begin

    { TfdcQuery }
//    if (AForm.Components[i] is TfdcQuery) and
//       (not Assigned((AForm.Components[i] as TfdcQuery).Session)) then
//      (AForm.Components[i] as TfdcQuery).Session := ASession;
//

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
  F: TqKNPAccForm;
begin
  F := TqKNPAccForm.Create(nil);
  try
    SetSession(F, MainData.Session);
    Result := F.ShowModal = mrOk;
  finally
    F.Free;
  end;
end;

procedure TqKNPAccForm.FormCreate(Sender: TObject);
begin
  inherited;
  xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + xlReport.XLSTemplate;
  LoadReportQueryEx(TForm(Self), xlReport.XLSTemplate);
end;

procedure TqKNPAccForm.actOkExecute(Sender: TObject);
begin
//  inherited;
  dsParam.CheckBrowseMode;
  DisplayBusyCursor;
  xlReport.Report(True);
  ModalResult := mrOk;
end;

procedure TqKNPAccForm.dsDataBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('SDATE', dsParamSDATE.AsVariant);
  Sender.SetVariable('EDATE', dsParamEDATE.AsVariant);
  Sender.SetVariable('AGMT_ID', dsParamAGMT_ID.AsVariant);
  dsDetail.SetVariable('AGMT_ID', dsParamAGMT_ID.AsVariant);
end;

procedure TqKNPAccForm.dsHeaderBeforeQuery(Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('SDATE', dsParamSDATE.AsVariant);
  Sender.SetVariable('EDATE', dsParamEDATE.AsVariant);
  Sender.SetVariable('AGMT_ID',dsParamAGMT_ID.AsVariant);
end;

procedure TqKNPAccForm.dsParamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Insert;
  dsParamSDate.Value := Date;
  dsParamEDate.Value := Date;
end;

{initialization
    FormUtils.RegisterMenuItem('miKNPReport', 'Лиц. счет соглашения', '', '', @ExecReport);}

procedure TqKNPAccForm.dsDetailBeforeQuery(Sender: TOracleDataSet);
begin
  Sender.SetVariable('OPERDATE', dsData.FieldValues['OPERDATE']);
  inherited;
end;

end.
