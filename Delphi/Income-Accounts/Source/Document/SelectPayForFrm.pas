unit SelectPayForFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxMemo,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxLabel, cxDBLabel,
  cxTextEdit, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, DB,
  fdcParamsHolder, dxmdaset, fdcObjectServices;

type
  TSelectPayForForm = class(TfdcCustomSimpleDlgForm)
    dsData: TdxMemData;
    dsDatasumma: TCurrencyField;
    dsDatasubject_id: TIntegerField;
    dsDatasubject_name: TStringField;
    dsDatarest_summa: TCurrencyField;
    srcData: TDataSource;
    Params: TfdcParamsHolder;
    dsDatadoc_date: TDateTimeField;
    dsDatadoc_no: TStringField;
    dsDatadoc_name: TStringField;
    edtSubject: TfdcObjectLinkEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBLabel1: TcxDBLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtSumma: TcxDBCurrencyEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxDBMemo1: TcxDBMemo;
    dxLayoutControl1Item7: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
  private
    { Private declarations }
    FRetPay: Boolean;
    FRestSumma,FSumma: Currency;
    FSubjectId: integer;
    FSubjectName: string;
    
  public
    { Public declarations }
  end;

var
  SelectPayForForm: TSelectPayForForm;

function  SelectPayFor(const ASubjectId: integer;const ASubjectName: string;const ARestSumma,ASumma: Currency;const ARetPay: boolean = False): TfdcParams;

implementation

{$R *.dfm}

function  SelectPayFor(const ASubjectId: integer;const ASubjectName: string;const ARestSumma,ASumma: Currency;const ARetPay: boolean = False): TfdcParams;
var
  F: TSelectPayForForm;
begin
  Result := nil;
  F := TSelectPayForForm.Create(nil);
  try
    F.FRetPay:= ARetPay;
    F.FRestSumma:= ARestSumma;
    if F.FRetPay then
      begin
      F.FSubjectId:= ASubjectId;
      F.FSubjectName:= ASubjectName;
      if ASumma=0 then
        F.FSumma:= -0.01
        else if ASumma>0 then
        F.FSumma:= -ASumma
        else
        F.FSumma:= ASumma;
      end
      else
      begin
      if ASumma=0 then
        F.FSumma:= ARestSumma
        else if ASumma<0 then
        F.FSumma:= -ASumma
        else
        F.FSumma:= ASumma;
      end;

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

procedure TSelectPayForForm.FormCreate(Sender: TObject);
begin
  inherited;
  edtSubject.ParamsHolder :=  Params;
  edtSubject.ObjectServices := GetObjectServices;
end;

procedure TSelectPayForForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
  dsData.Insert;
  if FRetPay then
    begin
    Caption:= 'Возврат суммы перевода';
    dsDataSUBJECT_ID.Value:= FSubjectId;
    dsDataSUBJECT_NAME.Value:= FSubjectName;
    dsDataSUBJECT_ID.ReadOnly:= True;
    end;
  dsDataSUMMA.Value:= FSumma;
  dsDataREST_SUMMA.Value := FRestSumma;

  edtSubject.SetFocus;
end;

procedure TSelectPayForForm.actOkUpdate(Sender: TObject);
begin
  inherited;

  if not dsDataSUBJECT_ID.IsNull
    and ((FRetPay and (dsDataSUMMA.AsCurrency>=-FRestSumma) and (dsDataSUMMA.AsCurrency<0))
    or (not FRetPay and (dsDataSUMMA.AsCurrency >0) and (dsDataSUMMA.AsCurrency<=FRestSumma))) then
    TAction(Sender).Enabled:= True
    else
    TAction(Sender).Enabled:= False;
end;

end.
