unit DocActivateErrorGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxMemo, Oracle;

type
  TDocActivateErrorGridForm = class(TfdcCustomGridForm)
    dsDataDOC_ID: TFloatField;
    dsDataMSG: TStringField;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDOC_NAME: TStringField;
    dsDataDOC_TYPE_ID: TFloatField;
    dsDataDOC_TYPE_SYSNAME: TStringField;
    dsDataDOC_TYPE_NAME: TStringField;
    grdDataDBBandedTableViewDOC_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMSG: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_TYPE_ID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_TYPE_SYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_TYPE_NAME: TcxGridDBBandedColumn;
    actActivateDoc: TAction;
    qryActivateDoc: TOracleQuery;
    btnActivateDoc: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure actActivateDocExecute(Sender: TObject);
    procedure actActivateDocUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocActivateErrorGridForm: TDocActivateErrorGridForm;

implementation

uses
  MainDm, fdcCustomDBDataFrm, fdcObjectServices;

{$R *.dfm}

procedure TDocActivateErrorGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  dsData.Open;
end;

procedure TDocActivateErrorGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  inherited;

  GetObjectServices.OpenObject( dsData.FieldByName( 'doc_id' ).AsInteger, nil );
end;

procedure TDocActivateErrorGridForm.actActivateDocExecute(Sender: TObject);
  var
    lv_OldID  : Integer;
begin
  lv_OldID := dsData.FieldByName( 'doc_id' ).AsInteger;
  qryActivateDoc.SetVariable( 'pDocID', lv_OldID );
  qryActivateDoc.Execute;

  grdDataDBTableView.BeginUpdate;
  try
    grdDataDBTableView.DataController.GotoNext;
    dsData.Close;
    dsData.Open;
  finally
    grdDataDBTableView.EndUpdate;
  end;
end;

procedure TDocActivateErrorGridForm.actActivateDocUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := dsData.Active
                             and not dsData.IsEmpty;
end;

initialization
   RegisterClass(TDocActivateErrorGridForm);

end.
