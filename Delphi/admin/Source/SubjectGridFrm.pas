{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1735 $
  $Author: alexvolo $
  $Date: 2006-07-12 11:16:41 +0400 (Ср, 12 июл 2006) $
}
unit SubjectGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus;

type
  TSubjectGridForm = class(TObjectGridForm)
    edtINN: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtOKPO: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataKPP: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectGridForm: TSubjectGridForm;

implementation

uses fdcCustomGridFrm, MainDm, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TSubjectGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('INN', Trim(edtInn.Text));
  SetSearchParam('OKPO', Trim(edtOKPO.Text));
end;

procedure TSubjectGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  if Self.ClassType = TSubjectGridForm then
  begin
    grdDataDBBandedTableViewADDRESS_.Visible := True ;
    grdDataDBBandedTableViewINN_.Visible := True;
    grdDataDBBandedTableViewKPP_.Visible := True;
    grdDataDBBandedTableViewADDRESS_.Hidden := False;
    grdDataDBBandedTableViewINN_.Hidden := False;
    grdDataDBBandedTableViewKPP_.Hidden := False;
  end;
end;

procedure TSubjectGridForm.actSearchOkExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(OnSearchFinished) then
       ModalResult := mrOk; 
end;

initialization
   RegisterClass(TSubjectGridForm);

end.
