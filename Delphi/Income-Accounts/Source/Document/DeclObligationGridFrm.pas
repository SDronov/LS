unit DeclObligationGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDeclObligationGridForm = class(TObjectGridForm)
    dsDataPAY_TYPE_ID: TFloatField;
    dsDataSUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDECL_ID: TFloatField;
    dsDataPAYMENT_CODE: TStringField;
    dsDataPAYMENT_NAME: TStringField;
    dsDataCURR_CODE: TStringField;
    dsDataCURR_NAME: TStringField;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeclObligationGridForm: TDeclObligationGridForm;

implementation

uses
  ObjectFrm;

{$R *.dfm}

procedure TDeclObligationGridForm.actAddExecute(Sender: TObject);
var
  Form: TObjectForm;
begin
  inherited;
//  Form := TObjectForm(ObjectServices.ShowForm('TDeclObligationForm', Params, nil));
//  Form.RegisterWaiter(Self);
end;

initialization
   RegisterClass(TDeclObligationGridForm);

end.
