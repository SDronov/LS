unit SelectDecGridFrm;

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
  dxStatusBar, OracleData;

type
  TSelectDecGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataDECL_NAME_DEST: TStringField;
    dsDataDECL_INN_DEST: TStringField;
    dsDataDECL_KPP_DEST: TStringField;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_NAME_DEST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_INN_DEST: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDECL_KPP_DEST: TcxGridDBBandedColumn;
    Panel1: TPanel;
    dsSubject: TOracleDataSet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel1: TcxGridLevel;
    srcSubject: TDataSource;
    dsSubjectPAYER_ID: TFloatField;
    dsSubjectPAYER_NAME: TStringField;
    dsSubjectPAYER_INN: TStringField;
    dsSubjectPAYER_KPP: TStringField;
    cxGridDBBandedTableView1PAYER_ID: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1PAYER_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1PAYER_INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1PAYER_KPP: TcxGridDBBandedColumn;
    Splitter1: TSplitter;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
    procedure actSearchCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridDBBandedTableView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectDecGridForm: TSelectDecGridForm;

implementation

{$R *.dfm}
procedure TSelectDecGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('pDecSysName').AsString := SearchTypeSysName;
end;

procedure TSelectDecGridForm.actSearchOkUpdate(Sender: TObject);
begin
null;
end;

procedure TSelectDecGridForm.actSearchOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;

procedure TSelectDecGridForm.actSearchCancelExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrCancel;
end;

procedure TSelectDecGridForm.FormShow(Sender: TObject);
begin
  inherited;
    pnlSearchCriteria.Visible   := false;
end;

procedure TSelectDecGridForm.cxGridDBBandedTableView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  dsData.Close;
  dsData.ParamByName('pSubjectId').AsFloat  := dsSubject.FieldByName( 'payer_id' ).AsFloat;
  dsData.Open;
end;

initialization
  RegisterClass(TSelectDecGridForm);
end.
