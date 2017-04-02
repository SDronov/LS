unit DocPackTransferByPackGridFrm;

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
  dxStatusBar, Oracle;

type
  TDocPackTransferByPackGridForm = class(TObjectGridForm)
    btnDoForm: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    actDoForm: TAction;
    pkgDocPackTransfer: TOraclePackage;
    procedure FormCreate(Sender: TObject);
    procedure actDoFormExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDoFormUpdate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fIsOperationsEnable : Boolean;
    procedure RemovePackFromEnvelop(AGridTableView: TcxGridTableView; AIndex,
                   ACount: integer; var ADescr: string; var ABreak: boolean);

  public
    { Public declarations }
  end;

var
  DocPackTransferByPackGridForm: TDocPackTransferByPackGridForm;

implementation

{$R *.dfm}

uses fdcUtils;

procedure TDocPackTransferByPackGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  fIsOperationsEnable := True;
end;

procedure TDocPackTransferByPackGridForm.actDoFormExecute(Sender: TObject);
begin
  pkgDocPackTransfer.CallProcedure( 'FormPackage', [ParamByName( 'ID' ).AsInteger] );
  RefreshData;
end;

procedure TDocPackTransferByPackGridForm.actDeleteExecute(Sender: TObject);
  var
    Msg: string;
    ManySelected : boolean;
begin
  ManySelected := (ActiveGridTableView.Controller.SelectedRecordCount > 1);
  msg := format('Исключить %s документ%s %s из конверта?',
                  [
                    IfElse(ManySelected,'выделенные' , ''),
                    IfElse(ManySelected, 'ы'        , ''),
                    IfElse(ManySelected, ''         , dsDataNAME.Value)
                  ]);
  if MessageDlg( msg,
                 mtConfirmation,
                 [mbYes, mbNo],
                 0 ) = mrYes then
    Try
      Self.IterateRecords( RemovePackFromEnvelop, True, True );
    finally
     ActiveGridTableView.Controller.ClearSelection;
     RefreshData;
    end;
end;

procedure TDocPackTransferByPackGridForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  if (Sender as TAction).Enabled then
    (Sender as TAction).Enabled := fIsOperationsEnable;
end;

procedure TDocPackTransferByPackGridForm.actDoFormUpdate(Sender: TObject);
begin
  if (Sender as TAction).Enabled then
    (Sender as TAction).Enabled := fIsOperationsEnable;
end;

procedure TDocPackTransferByPackGridForm.dsDataAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned( Params.FindParam( 'read_only' ) ) then
    fIsOperationsEnable := False;
end;

procedure TDocPackTransferByPackGridForm.RemovePackFromEnvelop(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
  pkgDocPackTransfer.CallProcedure( 'RemoveDocFromPackage', [ ParamByName( 'id' ).AsInteger, dsDataID.Value ] );
end;

initialization
  RegisterClass( TDocPackTransferByPackGridForm );

end.
