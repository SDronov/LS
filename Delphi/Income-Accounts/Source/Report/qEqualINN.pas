unit qEqualINN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle, cxTextEdit,
  cxMaskEdit, cxButtonEdit, fdcObjectCore, DB, FDCCustomDataset, fdcQuery,
  xlcClasses, xlEngine, xlReport, cxCheckBox;

type
  TqEqualINNForm = class(TfdcCustomDlgForm)
    edtINN: TcxButtonEdit;
    lciINN: TdxLayoutItem;
    xlReport: TxlReport;
    dsReportMaster: TfdcQuery;
    dsReportDetail: TfdcQuery;
    srcReportMaster: TDataSource;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actOkExecute(Sender: TObject);
  private
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation
uses
  fdcCustomObjectGridFrm, fdcObjectServices, qReportUtil;

{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqEqualINNForm;
begin
  F := TqEqualINNForm.Create(nil);
  with F do
  try
    // --- init Sessions
    dsReportMaster.Session := Session;
    dsReportDetail.Session := Session;
    // --- prepare Template
    xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                            ExtractFileName(F.xlReport.XLSTemplate);
    LoadReportQueryEx(F, xlReport.XLSTemplate);
{    BaseSQLLong := dspaylong.SQL.Text;
    BaseSQLShort := dspayshort.SQL.Text;
    BaseSQLLong2 := dsLong2.SQL.Text;
    BaseSQLShort2 := dsShort2.SQL.Text;}
    Result := (F.ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqEqualINNForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(edtINN) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := edtINN;
  F.SearchTypeSysName := 'Declarant;Person;Bank;Customs;Subject';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchSubjFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;

procedure TqEqualINNForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  edtINN.Text := ADragObject.SingleObject.FieldValues['INN'];
end;


procedure TqEqualINNForm.actOkExecute(Sender: TObject);
begin
  inherited;
  // --- open Query's
  if edtINN.Text <> '' then
    dsReportMaster.ParamByName('INN').Value := edtINN.Text;
  dsReportMaster.Open;
  dsReportDetail.Open;
  // --- выбор Excel Template
  xlReport.Report(True);
  // --- Close Query's
  dsReportMaster.Close;
  dsReportDetail.Close;
end;

end.
