unit fdcReestrSpecifyKindPayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, xlcClasses, xlEngine, xlReport, DB,
  FDCCustomDataset, fdcQuery, dxmdaset, Oracle, cxGraphics;

type
  TfdcReestrSpecifyKindPayForm = class(TfdcCustomDlgForm)
    xlrNoticeKindPay: TxlReport;
    dxLDate_From: TdxLayoutItem;
    edtDate_From: TcxDBDateEdit;
    dxLDate_To: TdxLayoutItem;
    edtDate_To: TcxDBDateEdit;
    dsHeader: TfdcQuery;
    dxMemData: TdxMemData;
    dxMemDataDate_From: TDateField;
    dxMemDataDate_To: TDateField;
    srcMain: TDataSource;
    dxMemDataCustomsName: TStringField;
    dsBody: TfdcQuery;
    dxMemDataPeriod: TStringField;
    edtReestrType: TcxComboBox;
    dxLReestrType: TdxLayoutItem;
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataDate_FromChange(Sender: TField);
  private
    { Private declarations }
    fcustom_code: String;
  public
    { Public declarations }
    property pcustom_code :String read fcustom_code write fcustom_code;
  end;

function ExecReport(Session : TOracleSession; Custom_code : String): boolean;

var
  fdcReestrSpecifyKindPayForm: TfdcReestrSpecifyKindPayForm;

implementation

{$R *.dfm}

uses
  IniFiles,
  DateUtils,
  qReportUtil
 ,MainDM;

function ExecReport(Session : TOracleSession; Custom_code : String): boolean;
var
  Frm : TfdcReestrSpecifyKindPayForm;
begin
  Frm := TfdcReestrSpecifyKindPayForm.Create(nil);
  with Frm do
  try
    pcustom_code := Custom_code;
    Result := False;
    // --- prepare template
    xlrNoticeKindPay.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                             'ReestrsSpecifyKindPay.xls';
    LoadReportQueryEx(Frm, xlrNoticeKindPay.XLSTemplate);

    dsHeader.Session := Session;

    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);

    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TfdcReestrSpecifyKindPayForm.actOkExecute(Sender: TObject);
begin
  dxMemDataPeriod.AsString := dxMemDataDate_From.AsString + ' - ' + dxMemDataDate_To.AsString;
  dxMemData.CheckBrowseMode;
  // --- check input params
  CheckDate(dxMemDataDate_From);
//  CheckDate(dxMemDataDate_To);
//  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
//  dsHeader.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsHeader.ParamByName( 'custom_code' ).AsString := pcustom_code;
  dsHeader.ParamByName( 'reestr_type' ).AsInteger := edtReestrType.ItemIndex;
  dsHeader.Open;

  dsBody.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
//  dsBody.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsBody.ParamByName( 'custom_code' ).AsString := pcustom_code;
  dsBody.ParamByName( 'reestr_type' ).AsInteger := edtReestrType.ItemIndex;
  dsBody.Open;
  // --- generate report
  try
    xlrNoticeKindPay.Report(True);
    ModalResult := mrOk;
  except on e:exception do begin
    e.Message := ReportError + e.Message;
    raise;
  end; end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TfdcReestrSpecifyKindPayForm.dxMemDataDate_FromChange(Sender: TField);
begin
  inherited;
  if (dxMemDataDate_From.Value > dxMemDataDate_To.Value) then
    begin
      dxMemDataDate_To.Value := dxMemDataDate_From.Value;
    end;
end;

end.
