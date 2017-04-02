{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1705 $
  $Author: mkazanov $
  $Date: 2006-07-04 13:43:50 +0400 (Вт, 04 июл 2006) $
}
unit SubjectDblGridFrm;

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
  TSubjectDblGridForm = class(TObjectGridForm)
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
    dxBarButton1: TdxBarButton;
    dsDataTYPENAME_WORD: TStringField;
    grdDataDBBandedTableViewTYPENAME_WORD: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectDblGridForm: TSubjectDblGridForm;

implementation

uses fdcCustomGridFrm, MainDm, SubjDoublesGridFrm, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TSubjectDblGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('INN', Trim(edtInn.Text));
  SetSearchParam('OKPO', Trim(edtOKPO.Text));
end;

procedure TSubjectDblGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  if Self.ClassType = TSubjectDblGridForm then
  begin
    grdDataDBBandedTableViewADDRESS_.Visible := True ;
    grdDataDBBandedTableViewINN_.Visible := True;
    grdDataDBBandedTableViewKPP_.Visible := True;
    grdDataDBBandedTableViewADDRESS_.Hidden := False;
    grdDataDBBandedTableViewINN_.Hidden := False;
    grdDataDBBandedTableViewKPP_.Hidden := False;
  end;
end;

procedure TSubjectDblGridForm.dxBarButton1Click(Sender: TObject);
var
 F:TSubjDoublesGridForm;
begin
 inherited;
 F := TSubjDoublesGridForm.Create(nil);
 F.dsData.ParamByName('SUBJ_ID').AsFloat := dsDataID.AsFloat;
 F.ShowModal;
 Self.RefreshData; 
end;

initialization
   RegisterClass(TSubjectDblGridForm);

end.
