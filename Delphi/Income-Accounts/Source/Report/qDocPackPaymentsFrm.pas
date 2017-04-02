unit qDocPackPaymentsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls,
  cxButtons, cxControls, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, Oracle, fdcObjectCore, FDCCustomDataset,
  fdcQuery, Menus, cxGraphics, cxCheckBox;

type
  TqDocPackPaymentsForm = class(TfdcCustomDlgForm)
    edtDateTo: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxMemData: TdxMemData;
    xlrDocPackPayments: TxlReport;
    srcMain: TDataSource;
    dxMemDataDateFrom: TDateField;
    dxMemDataDateTo: TDateField;
    dxMemDataPeriod: TStringField;
    dsReport: TfdcQuery;
    dxMemDataCustomsName: TStringField;
    dsFooter: TfdcQuery;
    dsSummary: TfdcQuery;
    fdcHeader: TfdcQuery;
    dxLayoutControl1Item1: TdxLayoutItem;
    chBIsActive: TcxDBCheckBox;
    dxMemDataIs_TS: TStringField;
    procedure actOkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

  function ExecReport(Session: TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  fdcCustomObjectGridFrm,
  fdcObjectServices,
  SubjIntf,
  qReportUtil,
  ObjectBufferFrm,
  MainDM,
  fdcUtils;


function ExecReport(Session: TOracleSession): boolean;
var
  TheDate : TDate;
  F : TqDocPackPaymentsForm;
  i : integer;
begin
  F := TqDocPackPaymentsForm.Create(nil);
  with F do
  try
    // --- ��������� dxMemData
    dxMemData.Open;
    dxMemData.Insert;
    // --- ������������� �������
    TheDate := MainData.GetServerDate;
    dxMemDataDateFrom.Value := TheDate;
    dxMemDataDateTo.Value := TheDate;
    // --- ������������� ������
    for i:= 0 to F.ComponentCount - 1 do
      if F.Components[i] is TfdcQuery then
        (F.Components[i] as TfdcQuery).Session := Session;
             
    // --- ���� ���� � ������� ������
    xlrDocPackPayments.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                                  ExtractFileName(xlrDocPackPayments.XLSTemplate);
    // --- ��������� SQL
    LoadReportQueryEx(F, xlrDocPackPayments.XLSTemplate);
    // --- ���������� �����
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;


procedure TqDocPackPaymentsForm.actOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  dxMemData.UpdateRecord;
  // --- ���������� ������
  dxMemDataPeriod.Value := '�  ' + dxMemDataDateFrom.AsString + '  ��  ' + dxMemDataDateTo.AsString;
  dxMemDataCustomsName.Value := MainData.GetSystemValue('CustomsName', rvString);
  // --- �������� ������ � ������� ����������
  dsReport.Open;
  MainData.RegisterEvent('REP','00010');
  // --- generate report
  xlrDocPackPayments.Report(True);
  // --- close datasets
  dsReport.Close;
  // --- get Result
  ModalResult := mrOk;
end;

procedure TqDocPackPaymentsForm.FormShow(Sender: TObject);
begin
  inherited;
  dxMemData.Edit;
end;
end.

