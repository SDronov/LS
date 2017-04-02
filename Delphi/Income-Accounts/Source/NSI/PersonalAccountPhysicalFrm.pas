unit PersonalAccountPhysicalFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PersonalAccountFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, dxBarExtItems, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, ExtCtrls, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit,
  cxMemo, cxTextEdit, cxPC, QueryList, cxCurrencyEdit, cxCheckBox;

type
  TPersonalAccountPhysicalForm = class(TPersonalAccountForm)
    odsOperationPart1INN: TStringField;
    odsOperationPart1DOC_NO: TStringField;
    odsOperationPart1LAST_NAME: TStringField;
    odsOperationPart1MIDDLE_NAME: TStringField;
    odsOperationPart1FIRST_NAME: TStringField;
    cxGridDBBandedTableView10INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10LAST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10FIRST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10MIDDLE_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11DOC_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11LAST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11FIRST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11MIDDLE_NAME: TcxGridDBBandedColumn;
    odsOperationPart2INN: TStringField;
    odsOperationPart2DOC_NO: TStringField;
    odsOperationPart2LAST_NAME: TStringField;
    odsOperationPart2MIDDLE_NAME: TStringField;
    odsOperationPart2FIRST_NAME: TStringField;
    odsNonPaysPart2INN: TStringField;
    odsNonPaysPart2DOC_NO: TStringField;
    odsNonPaysPart2LAST_NAME: TStringField;
    odsNonPaysPart2FIRST_NAME: TStringField;
    odsNonPaysPart2MIDDLE_NAME: TStringField;
    cxGridDBBandedTableView12INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12DOC_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12LAST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12FIRST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12MIDDLE_NAME: TcxGridDBBandedColumn;
    odsSvodOstPart1INN: TStringField;
    odsSvodOstPart1DOC_NO: TStringField;
    odsSvodOstPart1LAST_NAME: TStringField;
    odsSvodOstPart1FIRST_NAME: TStringField;
    odsSvodOstPart1MIDDLE_NAME: TStringField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLAST_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFIRST_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMIDDLE_NAME: TcxGridDBBandedColumn;
    odsZalogPart1INN: TStringField;
    odsZalogPart1DOC_NO: TStringField;
    odsZalogPart1LAST_NAME: TStringField;
    odsZalogPart1FIRST_NAME: TStringField;
    odsZalogPart1MIDDLE_NAME: TStringField;
    cxGridDBBandedTableView1INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DOC_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1LAST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1FIRST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1MIDDLE_NAME: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure odsOperationPart1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PersonalAccountPhysicalForm: TPersonalAccountPhysicalForm;

implementation

{$R *.dfm}
procedure TPersonalAccountPhysicalForm.FormShow(Sender: TObject);
begin
  inherited;
  tabJoin.TabVisible := false;
end;

procedure TPersonalAccountPhysicalForm.odsOperationPart1BeforeOpen(
  DataSet: TDataSet);
begin
    null;
end;

initialization
    RegisterClass(TPersonalAccountPhysicalForm);

end.
