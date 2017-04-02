unit BrokerContractGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TBrokerContractGridForm = class(TObjectGridForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataBROKER_ID: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataCONTRACT_NO: TStringField;
    dsDataCONTRACT_DATE: TDateTimeField;
    dsDataBEGIN_DATE: TDateTimeField;
    dsDataEND_DATE: TDateTimeField;
    dsDataIS_AUTHORIZE: TStringField;
    dsDataBROKER_NAME: TStringField;
    dsDataBROKER_INN: TStringField;
    dsDataBROKER_KPP: TStringField;
    dsDataSUBJECT_TYPENAME: TStringField;
    dsDataSUBJECT_NAME: TStringField;
    dsDataSUBJECT_INN: TStringField;
    dsDataSUBJECT_KPP: TStringField;
    grdDataDBBandedTableViewBROKER_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBROKER_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBROKER_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_TYPENAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCONTRACT_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCONTRACT_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBEGIN_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEND_DATE: TcxGridDBBandedColumn;
    lcgSearchBroker: TdxLayoutGroup;
    edtSrchBrokerName: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtSrchBrokerINN: TcxMaskEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtSrchBrokerKPP: TcxMaskEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    lcgSearchSubject: TdxLayoutGroup;
    edtSrchSubjectName: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtSrchSubjectINN: TcxMaskEdit;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtSrchSubjectKPP: TcxMaskEdit;
    lcgSearchContract: TdxLayoutGroup;
    edtSrchContractNo: TcxTextEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtSrchContractDate: TcxDateEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    edtSrchContractBeginDate: TcxDateEdit;
    lcSearchCriteriaItem9: TdxLayoutItem;
    edtSrchContractEndDate: TcxDateEdit;
    lcSearchCriteriaItem10: TdxLayoutItem;
    grdDataDBBandedTableViewIS_AUTHORIZE: TcxGridDBBandedColumn;
    dsDataSUBJECT_DOC: TStringField;
    grdDataDBBandedTableViewSUBJECT_DOC: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrokerContractGridForm: TBrokerContractGridForm;

implementation

uses
  MainDM, fdcCustomDBDataFrm;

{$R *.dfm}

procedure TBrokerContractGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  SetSearchParam( 'broker_name', Trim( edtSrchBrokerName.Text ) );
  SetSearchParam( 'broker_inn',  Trim( edtSrchBrokerINN.Text  ) );
  SetSearchParam( 'broker_kpp',  Trim( edtSrchBrokerKPP.Text  ) );

  SetSearchParam( 'subject_name', Trim( edtSrchSubjectName.Text ) );
  SetSearchParam( 'subject_inn',  Trim( edtSrchSubjectINN.Text  ) );
  SetSearchParam( 'subject_kpp',  Trim( edtSrchSubjectKPP.Text  ) );

  SetSearchParam( 'contract_no',   Trim( edtSrchContractNo.Text )     );
  SetSearchParam( 'contract_date', edtSrchContractDate.EditValue      );
  SetSearchParam( 'date_from',     edtSrchContractBeginDate.EditValue );
  SetSearchParam( 'date_to',       edtSrchContractEndDate.EditValue   );
end;

procedure TBrokerContractGridForm.FormShow(Sender: TObject);
begin
  inherited;

  grdDataDBBandedTableView.Bands[1].Visible := dsData.Params.ParamByName( 'id' ).IsNull;
end;

initialization
  RegisterClass( TBrokerContractGridForm );

end.
