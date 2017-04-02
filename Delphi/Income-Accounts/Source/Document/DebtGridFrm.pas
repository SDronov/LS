{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12026 $
  $Author: anaumenkov $
  $Date: 2010-12-15 23:06:35 +0400 (Ср, 15 дек 2010) $
}
unit DebtGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  cxCurrencyEdit, QueryList;

type
  TDebtGridForm = class(TSubjectGridForm)
    grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn;
    dsDataDEBT_REST: TFloatField;
    grdDataDBBandedTableViewDEBT_REST: TcxGridDBBandedColumn;
    dsDataDEBT_REST_TS: TFloatField;
    grdDataDBBandedTableViewDEBT_REST_TS: TcxGridDBBandedColumn;
    procedure actOpenExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DebtGridForm: TDebtGridForm;

implementation

uses
  fdcObjectCore, ObjectFrm, fdcCustomObjectGridFrm, fdcCustomMainFrm,
  MainDm, MainFrm;

{$R *.dfm}

procedure TDebtGridForm.actOpenExecute(Sender: TObject);
var
  AnObj: TfdcObject;
  AForm: TObjectForm;
begin

  AForm := TObjectForm(ObjectServices.FindObject(dsDataID.Value+0.1));
  if AForm = nil then
  begin
    AnObj := ObjectServices.GetObjectFactory.GetObject(dsDataID.Value, True);

    AForm := TObjectForm(TFormClass(FindClass('TDebtBySubjForm')).Create(Application));
    AForm.ObjectServices := ObjectServices;
    AForm.ID := AnObj.ID;
    RegisterAsWaiterFor(AForm);
    AnObj.ID := AnObj.ID + 0.1;
    TfdcCustomMainForm(Application.MainForm).ShowForm(AForm, Params, nil);
    AForm.tabService.TabVisible := False;
  end;
  AForm.BringToFront;
  if AForm.WindowState = wsMinimized then
        AForm.WindowState := wsNormal;
end;

initialization
    RegisterClass(TDebtGridForm);

end.
