unit PersonalAccountNonResidentFrm;

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
  TPersonalAccountNonResidentForm = class(TPersonalAccountForm)
    odsOperationPart1INN: TStringField;
    odsOperationPart1KPP: TStringField;
    odsOperationPart1NAME: TStringField;
    odsSvodOstPart1INN: TStringField;
    odsSvodOstPart1KPP: TStringField;
    odsSvodOstPart1NAME: TStringField;
    cxGridDBBandedTableView10INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    odsZalogPart1INN: TStringField;
    odsZalogPart1KPP: TStringField;
    odsZalogPart1NAME: TStringField;
    cxGridDBBandedTableView1INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1NAME: TcxGridDBBandedColumn;
    odsOperationPart2INN: TStringField;
    odsOperationPart2KPP: TStringField;
    odsOperationPart2NAME: TStringField;
    cxGridDBBandedTableView11INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11NAME: TcxGridDBBandedColumn;
    odsNonPaysPart2INN: TStringField;
    odsNonPaysPart2KPP: TStringField;
    odsNonPaysPart2NAME: TStringField;
    cxGridDBBandedTableView12INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12NAME: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure odsOperationPart1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PersonalAccountNonResidentForm: TPersonalAccountNonResidentForm;

implementation

{$R *.dfm}

procedure TPersonalAccountNonResidentForm.FormShow(Sender: TObject);
begin
  inherited;
  tabJoin.TabVisible := false;
end;

procedure TPersonalAccountNonResidentForm.odsOperationPart1BeforeOpen(
  DataSet: TDataSet);
begin
  null;
end;

initialization
    RegisterClass(TPersonalAccountNonResidentForm);

end.
