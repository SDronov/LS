unit qReestrSpecifyKindPayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, xlcClasses, xlEngine, xlReport, DB,
  FDCCustomDataset, fdcQuery, dxmdaset, Oracle, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit, cxCheckBox;

type
  TqReestrSpecifyKindPayForm = class(TfdcCustomDlgForm)
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
    dsBody: TfdcQuery;
    dxMemDataPeriod: TStringField;
    edtReestrType: TcxComboBox;
    dxLReestrType: TdxLayoutItem;
    dxLClassReestr: TdxLayoutItem;
    editClassReestr: TcxComboBox;
    dxLCurr: TdxLayoutItem;
    cmbxCurr: TfdcObjectLookupEdit;
    dxMemDataCurrId: TFloatField;
    srcMemData: TDataSource;
    dxLIsTs: TdxLayoutItem;
    chkIsTs: TcxDBCheckBox;
    dxMemDataists: TStringField;
    dsItogo: TfdcQuery;
    procedure actOkExecute(Sender: TObject);
    procedure dxMemDataDate_FromChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecReport(Session : TOracleSession): boolean;

var
  qReestrSpecifyKindPayForm: TqReestrSpecifyKindPayForm;

implementation

{$R *.dfm}

uses
  IniFiles,
  DateUtils,
  qReportUtil
 ,MainDM;

function ExecReport(Session : TOracleSession): boolean;
var
  Frm : TqReestrSpecifyKindPayForm;
begin
  Frm := TqReestrSpecifyKindPayForm.Create(nil);
  with Frm do
  try
    Result := False;
    // --- prepare template
    xlrNoticeKindPay.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                             'RSpecifyKindPay.xls';
    LoadReportQueryEx(Frm, xlrNoticeKindPay.XLSTemplate);

    dsHeader.Session := Session;

    dxMemData.Open;
    dxMemData.Insert;
    dxMemDataDate_From.Value := Trunc(Now);
    dxMemDataDate_To.Value := Trunc(Now);
    dxMemData.FieldByName('CurrID').AsFloat := cmbxCurr.Properties.ListSource.DataSet.Lookup( 'CODE', '643', 'ID' );

    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TqReestrSpecifyKindPayForm.actOkExecute(Sender: TObject);
begin
  dxMemDataPeriod.AsString := dxMemDataDate_From.AsString + ' - ' + dxMemDataDate_To.AsString;
  dxMemData.CheckBrowseMode;
  // --- check input params
  CheckDate(dxMemDataDate_From);
  CheckDate(dxMemDataDate_To);
  CmpDate(dxMemDataDate_From, dxMemDataDate_To);
  // --- open Query`s
  dsHeader.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsHeader.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsHeader.ParamByName( 'classreestr' ).AsString := editClassReestr.EditingValue;
  dsHeader.ParamByName( 'reestr_type_name' ).AsString := edtReestrType.EditingValue;
  dsHeader.Open;

  dsBody.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsBody.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsBody.ParamByName( 'reestr_type' ).AsInteger := edtReestrType.ItemIndex;
  dsBody.ParamByName( 'show' ).AsInteger := editClassReestr.ItemIndex;
  dsBody.ParamByName( 'currid' ).AsInteger := dxMemDataCurrId.AsInteger;
  dsBody.ParamByName( 'ists' ).AsString := dxMemDataists.AsString;
  dsBody.Open;

  dsItogo.ParamByName( 'begin_date' ).AsDate := dxMemDataDate_From.AsDateTime;
  dsItogo.ParamByName( 'end_date' ).AsDate   := dxMemDataDate_To.AsDateTime;
  dsItogo.ParamByName( 'reestr_type' ).AsInteger := edtReestrType.ItemIndex;
  dsItogo.ParamByName( 'show' ).AsInteger := editClassReestr.ItemIndex;
  dsItogo.ParamByName( 'currid' ).AsInteger := dxMemDataCurrId.AsInteger;
  dsItogo.ParamByName( 'ists' ).AsString := dxMemDataists.AsString;
  dsItogo.Open;
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

procedure TqReestrSpecifyKindPayForm.dxMemDataDate_FromChange(Sender: TField);
begin
  inherited;
  if (dxMemDataDate_From.Value > dxMemDataDate_To.Value) then
    begin
      dxMemDataDate_To.Value := dxMemDataDate_From.Value;
    end;
end;

end.
