unit DocumentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxCalendar, fdcWord, Buttons;

type
  TDocumentForm = class(TObjectForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    lcgDocument: TdxLayoutGroup;
    edtDocNumber: TcxDBTextEdit;
    lciDocNumber: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    lciDocDate: TdxLayoutItem;
    chBIsActive: TcxDBCheckBox;
    lciIsActive: TdxLayoutItem;
    lcgDocumentNumDate: TdxLayoutGroup;
    edtActivationDate: TcxDBDateEdit;
    lciActivationDate: TdxLayoutItem;
    lcgDocumentAttrs: TdxLayoutGroup;
    actPrint: TAction;
    btnPrint: TdxBarButton;
    lcIs_TS: TdxLayoutItem;
    cxDBIsTS: TcxDBCheckBox;
    dsDataIS_TS: TStringField;
    procedure actPrintExecute(Sender: TObject);
    procedure actPrintUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetTemplateReportName : string; virtual; abstract;
    procedure FillReportParams(AWord: TWordClass); virtual;
  public
    { Public declarations }
  end;

ResourceString
  SRepTemplateOpenError = 'Ошибка открытия файла шаблона документа!'#$D#$A +
                          'Имя файла: %s';

var
  DocumentForm: TDocumentForm;

implementation

uses fdcActCorrectObSelectTypeOBDlgFrm, ActCorrectOperBalansFrm,
  ActCorrectOperBalansTranGridFrm, ActCorrectOperBalansTranGridByActFrm,
  ActCorrectOperBalansTranFrm, fdcCustomObjectFrm, fdcCustomDataFrm,
  MainFrm;

{$R *.dfm}

procedure TDocumentForm.actPrintExecute(Sender: TObject);
  var
    lv_WordApp  : TWordClass;
    lv_FileName : string;
begin
  lv_FileName := ExtractFilePath(Application.ExeName) + 'Report\' + GetTemplateReportName;
  if not FileExists( lv_FileName ) then
    raise EFOpenError.CreateResFmt( @SRepTemplateOpenError, [lv_FileName] );

  lv_WordApp := TWordClass.Create;
  try
    lv_WordApp.CreateApp;
    lv_WordApp.Open( lv_FileName );
    FillReportParams( lv_WordApp );
    lv_WordApp.AppVisible := True;
  finally
    lv_WordApp.Free;
  end;
end;

procedure TDocumentForm.actPrintUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not IsNew;
end;

procedure TDocumentForm.FillReportParams(AWord: TWordClass);
begin
  AWord.ReplaceRecFromQuery( dsData );
end;

procedure TDocumentForm.FormShow(Sender: TObject);
begin
  inherited;

  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;

end;

procedure TDocumentForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  dsDataIS_TS.ReadOnly   := not dsDataIS_TS.IsNull;

  if dsDataIS_TS.ReadOnly then begin
    cxDBIsTS.Tag := 33;
  end;

end;

end.
