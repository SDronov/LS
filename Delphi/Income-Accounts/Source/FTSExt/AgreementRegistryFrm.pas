unit AgreementRegistryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, cxButtonEdit, cxDBEdit, fdcObjectLinkEdit,
  cxDropDownEdit, cxCalendar, cxMaskEdit, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxTextEdit, cxPC, cxControls,CDeclBaseFrm, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxCurrencyEdit;

type
  TAgreementRegistryForm = class(TCustomDeclBaseForm)
    cxDBMaskEdit1: TcxDBMaskEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBMaskEdit2: TcxDBMaskEdit;
    lcGeneralItem3: TdxLayoutItem;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem4: TdxLayoutItem;
    fdcObjectLinkEdit2: TfdcObjectLinkEdit;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    tabDocList: TcxTabSheet;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    lcGeneralItem7: TdxLayoutItem;
    grdSumByKBK: TcxGrid;
    grdSumByKBKDBTableView: TcxGridDBTableView;
    grdSumByKBKDBTableViewCODE: TcxGridDBColumn;
    grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn;
    grdSumByKBKLevel: TcxGridLevel;
    grdSumByKBKDBTableViewKBK: TcxGridDBColumn;
    dsKBKSum: TOracleDataSet;
    srcKBKSum: TDataSource;
    cxDBMaskEdit3: TcxDBMaskEdit;
    lcGeneralItem8: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataKODT: TStringField;
    dsDataINN_KNP: TStringField;
    dsDataCRE_MEMO: TStringField;
    dsDataAGREEMENT_ID: TFloatField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataREG_DATE: TDateTimeField;
    dsDataDECL_NO: TStringField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataDECL_NAME: TStringField;
    dsDataDECL_INN: TStringField;
    dsDataDECL_KPP: TStringField;
    dsDataSUBJ_NAME: TStringField;
    dsDataSUBJ_INN: TStringField;
    dsDataSUBJ_KPP: TStringField;
    dsDataAGREEMENT_NAME: TStringField;
    dsDataSTATE_SYSNAME: TStringField;
    procedure tabDocListShow(Sender: TObject);
    procedure dsKBKSumBeforeQuery(Sender: TOracleDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
				procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FContextForm: TForm;
  protected
    function GetReadOnly: Boolean; override;
  public
    { Public declarations }
    procedure RefreshData; override;
  end;

var
  AgreementRegistryForm: TAgreementRegistryForm;

implementation

uses fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TAgreementRegistryForm.tabDocListShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FContextForm) then
	begin
		FContextForm := Self.ObjectServices.ShowForm('TAgrRegistryContextForm', Params, TWinControl(Sender));
      TObjectForm(FContextForm).RegisterWaiter(Self)
	end;
end;

procedure TAgreementRegistryForm.dsKBKSumBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  Sender.SetVariable('ID', dsDataID.Value);
end;

procedure TAgreementRegistryForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if dsKBKSum.Active then dsKBKSum.Refresh
   else dsKBKSum.Open;
end;

procedure TAgreementRegistryForm.FormShow(Sender: TObject);
begin
	inherited;
   tabErrors.TabVisible := True;
end;

procedure TAgreementRegistryForm.RefreshData;
begin
  inherited;
  if FErrorForm <> nil then
     TfdcCustomObjectGridForm(FErrorForm).RefreshData;
end;

function TAgreementRegistryForm.GetReadOnly: Boolean;
begin
  Result := inherited GetReadOnly or (dsDataSTATE_SYSNAME.Value = 'AgrmntRegDone');
end;

initialization
   RegisterClass(TAgreementRegistryForm);

end.
