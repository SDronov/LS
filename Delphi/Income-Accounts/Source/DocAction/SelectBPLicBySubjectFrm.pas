unit SelectBPLicBySubjectFrm;

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
  dxStatusBar;

type
  TSelectBPLicBySubjectForm = class(TfdcCustomGridForm)
    dsDataid: TFloatField;
    dsDataname: TStringField;
    dsDatashortname: TStringField;
    dsDataobject_type_id: TFloatField;
    dsDatastate_id: TFloatField;
    dsDataaccesslevel: TStringField;
    dsDatasysname: TStringField;
    dsDatadescript: TStringField;
    dsDataowner_object_id: TFloatField;
    dsDatatypename: TStringField;
    dsDatatypesysname: TStringField;
    dsDataobjectkindlist: TStringField;
    dsDatadoc_no: TStringField;
    dsDatadoc_date: TDateTimeField;
    dsDatasubject_id: TFloatField;
    dsDatasubj_name: TStringField;
    dsDatasubj_inn: TStringField;
    dsDatasubj_kpp: TStringField;
    dsDatafrom_date: TDateTimeField;
    dsDatato_date: TDateTimeField;
    dsDataagrmt_no: TStringField;
    dsDataagrmt_date: TDateTimeField;
    grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn5: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn6: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn7: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn9: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn10: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn11: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn12: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn13: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewColumn14: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectBPLicBySubjectForm: TSelectBPLicBySubjectForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TSelectBPLicBySubjectForm.FormShow(Sender: TObject);
begin
  inherited;
  pnlSearchCriteria.Visible := False;
  splSearchCriteria.Visible := False;
end;

initialization
   RegisterClass(TSelectBPLicBySubjectForm);
end.
