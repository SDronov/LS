{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 11913 $
  $Author: rrykunov $
  $Date: 2010-12-04 16:37:16 +0400 (Сб, 04 дек 2010) $
}
unit CDeclBaseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxDBLookupComboBox,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, fdcObjectLookupEdit,
  QueryList, cxCurrencyEdit, cxGraphics, SubjIntf;

type
  TCustomDeclBaseForm = class(TObjectForm, ISubjectHolder, IDocumentHolder)
    tabGoods: TcxTabSheet;
    tabObligation: TcxTabSheet;
    tabPayment: TcxTabSheet;
    tabErrors: TcxTabSheet;
    actPrint: TAction;
    bbPrint: TdxBarButton;
    dsDataERR_COUNT: TFloatField;
    procedure tabGoodsShow(Sender: TObject);
    procedure tabObligationShow(Sender: TObject);
    procedure tabPaymentShow(Sender: TObject);
    procedure tabErrorsShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    FChargeForm: TForm;
    FPaymentForm: TForm;
    FGoodsForm: TForm;
    FErrorForm: TForm;
  public
    function GetSubjectId: Double;   virtual;
    function GetSubjectINN: String;  virtual;
    function GetSubjectKPP: String;  virtual;
    function GetSubjectName: String; virtual;
    function GetDocumentDate: TDateTime;
  end;

implementation

{$R *.dfm}

procedure TCustomDeclBaseForm.tabGoodsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FGoodsForm) then
    FGoodsForm := Self.ObjectServices.ShowForm('TDeclGoodsGridForm', Params, TWinControl(Sender));
end;

procedure TCustomDeclBaseForm.tabObligationShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FChargeForm) then
  begin
    FChargeForm := Self.ObjectServices.ShowForm('TDeclChargeGridForm', Params, TWinControl(Sender));
    TObjectForm(FChargeForm).RegisterWaiter(Self);
    Self.RegisterWaiter(TObjectForm(FChargeForm));
  end;
end;

procedure TCustomDeclBaseForm.tabPaymentShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FPaymentForm) then
  begin
     FPaymentForm := ObjectServices.ShowForm('TDeclPaymentGridForm', Params, TWinControl(Sender));
     TObjectForm(FPaymentForm).RegisterWaiter(Self);
     Self.RegisterWaiter(TObjectForm(FPaymentForm));
  end;
end;

procedure TCustomDeclBaseForm.tabErrorsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FErrorForm) then
  begin
     FErrorForm := ObjectServices.ShowForm('TCustomDeclErrorGridForm', Params, TWinControl(Sender));
     TObjectForm(FErrorForm).RegisterWaiter(Self);
  end;
end;

procedure TCustomDeclBaseForm.FormShow(Sender: TObject);
begin
  inherited;
  tabErrors.TabVisible := dsDataERR_COUNT.Value > 0;
end;

function TCustomDeclBaseForm.GetSubjectId: Double;
var
  F: TField;
begin
  Result := 0;
  F := dsData.FindField('SUBJECT_ID');
  if assigned(F) then
    Result := F.AsFloat;
end;

function TCustomDeclBaseForm.GetSubjectINN: String;
begin
  Result := dsData.FieldByName('DECL_INN').AsString;
end;

function TCustomDeclBaseForm.GetSubjectKPP: String;
begin
  Result := dsData.FieldByName('DECL_KPP').AsString;
end;

function TCustomDeclBaseForm.GetSubjectName: String;
begin
  Result := dsData.FieldByName('DECL_NAME').AsString;
end;

function TCustomDeclBaseForm.GetDocumentDate: TDateTime;
begin
  Result := dsData.FieldByName('REG_DATE').AsDateTime;
end;

end.
