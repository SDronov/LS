unit SelectLockFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxLabel,
  cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxCurrencyEdit, DB, dxmdaset, cxButtonEdit,
  fdcObjectLinkEdit, cxDBLabel, fdcParamsHolder, fdcObjectServices, cxMemo,
  FDCCustomDataset, fdcQuery;

type
  TSelectLockForm = class(TfdcCustomSimpleDlgForm)
    edtSubject: TfdcObjectLinkEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsData: TdxMemData;
    srcData: TDataSource;
    dsDatabdate: TDateTimeField;
    dsDatasumma: TFloatField;
    dsDatacustoms_code: TStringField;
    dsDatareg_date: TDateTimeField;
    dsDatadecl_no: TStringField;
    dsDatasubject_id: TIntegerField;
    dsDatasubject_name: TStringField;
    edtLockSum: TcxDBCurrencyEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtCustomsCode: TcxDBTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    dsDatarest_summa: TFloatField;
    Params: TfdcParamsHolder;
    edtNote: TcxDBMemo;
    dxLayoutControl1Item9: TdxLayoutItem;
    dsDatanote: TStringField;
    edtRestSum: TcxDBCurrencyEdit;
    dxLayoutControl1Item11: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    { Private declarations }
    FRestSumma: Currency;

  public
    { Public declarations }
  end;


function  SelectLock(const ARestSumma: Currency): TfdcParams;

implementation

{$R *.dfm}

function  SelectLock(const ARestSumma: Currency): TfdcParams;
var
  F: TSelectLockForm;
begin
  Result := nil;
  F := TSelectLockForm.Create(nil);
  try
    F.FRestSumma := ARestSumma;
    if F.ShowModal = mrOk then
    begin
      Result := TfdcParams.Create(nil);
      try
        Result.FillBy(F.dsData);
      except
        Result.Free;
        raise;
      end;    // try/except
    end;
  finally // wrap up
    F.Free;
  end;    // try/finally
end;

procedure TSelectLockForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtSubject.ParamsHolder :=  Params;
  edtSubject.ObjectServices := GetObjectServices;
end;

procedure TSelectLockForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
  dsData.Insert;
  dsDataREST_SUMMA.Value := FRestSumma;
  dsDataSUMMA.Value:= FRestSumma;
  edtLockSum.Properties.MaxValue := FRestSumma;
  edtCustomsCode.SetFocus;
end;

procedure TSelectLockForm.actOkExecute(Sender: TObject);
begin
  inherited;
  try
    dsData.Post;
  except
    ModalResult := mrNone;
    raise;
  end;
end;

end.
