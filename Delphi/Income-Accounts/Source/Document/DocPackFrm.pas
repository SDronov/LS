unit DocPackFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxSpinEdit, cxCheckBox, cxButtonEdit, fdcObjectLinkEdit;

type
  TDocPackForm = class(TObjectForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    edtDocNumber: TcxDBTextEdit;
    itemDocNumber: TdxLayoutItem;
    edtDocDate: TcxDBDateEdit;
    itemDocDate: TdxLayoutItem;
    tabDocs: TcxTabSheet;
    lcGrpPackage: TdxLayoutGroup;
    lcGrpActivation: TdxLayoutGroup;
    chBIsActive: TcxDBCheckBox;
    itemIsActive: TdxLayoutItem;
    edtActivationDate: TcxDBDateEdit;
    itemActivationDate: TdxLayoutItem;
    fdcSrcAppName: TfdcObjectLinkEdit;
    itemSrcAppName: TdxLayoutItem;
    lcGrpRouting: TdxLayoutGroup;
    fdcDstAppName: TfdcObjectLinkEdit;
    itemDstAppName: TdxLayoutItem;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataIS_RECIEVED: TStringField;
    dsDataRECIEVE_DATE: TDateTimeField;
    chBIsReceived: TcxDBCheckBox;
    itemIsReiceved: TdxLayoutItem;
    edtReceiveDate: TcxDBDateEdit;
    itemReceiveDate: TdxLayoutItem;
    lciGrpDocAttr: TdxLayoutGroup;
    lcGrpReceiveAttr: TdxLayoutGroup;
    tabEnvelops: TcxTabSheet;
    dsDataIS_TS: TStringField;
    lciIsTS: TdxLayoutItem;
    cxDBIsTS: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tabDocsShow(Sender: TObject);
    procedure tabEnvelopsShow(Sender: TObject);
  private
    { Private declarations }
    fDocsForm     : TForm;
    fEnvelopsForm : TForm;
  protected
    function GetDocsFormClassName : string; virtual;
    function GetDocsForm : TForm;
  public
    { Public declarations }
    property tabDocsForm : TForm read fDocsForm;
  end;

var
  DocPackForm: TDocPackForm;

implementation

{$R *.dfm}

uses
  MainDM
 ,DictDM
  , fdcCustomDBDataFrm, fdcCustomCardFrm, fdcCustomObjectFrm;

procedure TDocPackForm.FormCreate(Sender: TObject);
begin
  inherited;

  if not DictData.dsCurrency.Active then
    DictData.dsCurrency.Open;

  fDocsForm := nil;
end;

function TDocPackForm.GetDocsForm: TForm;
begin
  Result := fDocsForm;
end;

function TDocPackForm.GetDocsFormClassName: string;
begin
  Result := '';
end;

procedure TDocPackForm.tabDocsShow(Sender: TObject);
begin
  inherited;

  if not Assigned( fDocsForm ) then
    fDocsForm := ShowForm( GetDocsFormClassName, Params, tabDocs );
end;

procedure TDocPackForm.tabEnvelopsShow(Sender: TObject);
begin
  if not Assigned( fEnvelopsForm ) then
    begin
      fEnvelopsForm := ShowForm( 'TDocPackTransferGridForm', Params, tabEnvelops );

      (fEnvelopsForm as TfdcCustomDBDataForm).RefreshData;
    end;
end;

end.
