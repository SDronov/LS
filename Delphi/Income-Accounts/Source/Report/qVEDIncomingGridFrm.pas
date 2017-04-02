unit qVEDIncomingGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportGridFrm, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, xlcClasses,
  xlEngine, xlReport, OracleData, fdcParamsHolder, dxBar, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxStatusBar, cxTextEdit, cxMaskEdit,
  dxBarExtItems, cxNavigator, cxDBNavigator;

type
  TqVEDIncomingGridForm = class(TqCustomReportGridForm)
    ColumnINN: TcxGridDBBandedColumn;
    ColumnNAME: TcxGridDBBandedColumn;
    ColumnACCOUNT: TcxGridDBBandedColumn;
    ColumnBIK: TcxGridDBBandedColumn;
    ColumnBANK: TcxGridDBBandedColumn;
    cxMaskEditAccount: TcxMaskEdit;
    dsetDataINN: TStringField;
    dsetDataNAME: TStringField;
    dsetDataACCOUNT: TStringField;
    dsetDataBIK: TStringField;
    dsetDataBANK: TStringField;
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    procedure cxMaskEditAccountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEditAccountPropertiesChange(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qVEDIncomingGridForm: TqVEDIncomingGridForm;

implementation

{$R *.dfm}

procedure TqVEDIncomingGridForm.cxMaskEditAccountKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     RefreshData;
end;

procedure TqVEDIncomingGridForm.cxMaskEditAccountPropertiesChange(
  Sender: TObject);
begin
  actExcel.Update;
  actRefresh.Update;
end;

procedure TqVEDIncomingGridForm.actRefreshUpdate(Sender: TObject);
begin
  actRefresh.Enabled := Length(cxMaskEditAccount.Text) = 20;
end;

procedure TqVEDIncomingGridForm.actRefreshExecute(Sender: TObject);
begin
  dsetData.SetVariable('ACCOUNT', cxMaskEditAccount.Text);
  inherited;
end;

procedure TqVEDIncomingGridForm.actExcelExecute(Sender: TObject);
begin
  excelExport.ParamByName['Account'].AsString := VarToStr(dsetData.GetVariable('ACCOUNT'));  
  inherited;
end;

initialization
  RegisterClass (TqVEDIncomingGridForm);


end.

