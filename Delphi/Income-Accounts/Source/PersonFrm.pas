unit PersonFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxSpinEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TPersonForm = class(TObjectForm)
    edtShortName: TcxDBTextEdit;
    lciShortName: TdxLayoutItem;
    edtFirstName: TcxDBTextEdit;
    lciFirstName: TdxLayoutItem;
    edtMiddleName: TcxDBTextEdit;
    lciMiddleName: TdxLayoutItem;
    edtINN: TcxDBTextEdit;
    lciINN: TdxLayoutItem;
    edtKPP: TcxDBTextEdit;
    lciKPP: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtOKPO: TcxDBTextEdit;
    lciOKPO: TdxLayoutItem;
    edtOGRN: TcxDBTextEdit;
    lciOGRN: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    edtBIC: TcxDBTextEdit;
    lciBIC: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    edtBirthDate: TcxDBDateEdit;
    lciBirthDate: TdxLayoutItem;
    edtBirthYear: TcxDBSpinEdit;
    lciBirthYear: TdxLayoutItem;
    lcGeneralGroup4: TdxLayoutGroup;
    edtBirthLocation: TcxDBMemo;
    lciBirthLocation: TdxLayoutItem;
    dsDataSURNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataOGRN: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataOKPO: TStringField;
    dsDataBIC: TStringField;
    dsDataBIRTHDATE: TDateTimeField;
    dsDataBIRTHYEAR: TIntegerField;
    dsDataBIRTHLOCATION: TStringField;
    dsDataOPF_DICT_ID: TFloatField;
    dsDataOPF_NAME: TStringField;
    cmbxOpfDictID: TcxDBLookupComboBox;
    lciOpfDictID: TdxLayoutItem;
    dsDictOpf: TfdcQuery;
    dsDictOpfID: TFloatField;
    dsDictOpfName: TStringField;
    srcDictOpf: TDataSource;
    dsDictOpfOWNERNAME: TStringField;
    dsDictOpfCODE: TStringField;
    dsDictOpfCODE2: TStringField;
    edtSurName: TcxDBTextEdit;
    lciSurName: TdxLayoutItem;
    lcGeneralGroup5: TdxLayoutGroup;
    tabChars: TcxTabSheet;
    pcChars: TcxPageControl;
    tabAddress: TcxTabSheet;
    tabRegDocument: TcxTabSheet;
    tabContact: TcxTabSheet;
    tabCharsFake: TcxTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDictOpfAfterOpen(DataSet: TDataSet);
    procedure cmbxOpfDictIDDblClick(Sender: TObject);
    procedure tabAddressShow(Sender: TObject);
    procedure tabCharsShow(Sender: TObject);
    procedure tabRegDocumentShow(Sender: TObject);
    procedure tabContactShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FAddressGridForm: TForm;
    FRegDocumentGridForm: TForm;
    FContactGridForm: TForm;
  public
    { Public declarations }
  end;

var
  PersonForm: TPersonForm;

implementation

{$R *.dfm}

procedure TPersonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  dsDictOpf.Close;
end;

procedure TPersonForm.dsDictOpfAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if dsDictOpf.Active then
     dsDictOpf.Close;
  dsDictOpf.Open;
end;

procedure TPersonForm.cmbxOpfDictIDDblClick(Sender: TObject);
begin
  inherited;

  if dsDataOPF_DICT_ID.asFloat < 1 then exit;
  ObjectServices.OpenObject(dsDataOPF_DICT_ID.asFloat, nil);
end;

procedure TPersonForm.tabAddressShow(Sender: TObject);
begin
  inherited;

  if not Assigned(FAddressGridForm) then
     FAddressGridForm := ShowForm('TAddressGridByObjectForm', Params, tabAddress);
end;

procedure TPersonForm.tabCharsShow(Sender: TObject);
var ap: TcxTabSheet;
begin
  ap := pcChars.ActivePage;
  pcChars.ActivePage := tabCharsFake;
  pcChars.ActivePage := ap;

  inherited;
end;

procedure TPersonForm.tabRegDocumentShow(Sender: TObject);
begin
  inherited;

  if not Assigned(FRegDocumentGridForm) then
     FRegDocumentGridForm := ShowForm('TRegDocumentGridByObjectForm', Params, tabRegDocument);
end;

procedure TPersonForm.tabContactShow(Sender: TObject);
begin
  inherited;

  if not Assigned(FContactGridForm) then
     FContactGridForm := ShowForm('TContactGridByObjectForm', Params, tabContact);
end;

initialization
  RegisterClass(TPersonForm);

end.
