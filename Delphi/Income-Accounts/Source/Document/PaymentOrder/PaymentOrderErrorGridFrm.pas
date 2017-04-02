{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 7236 $
  $Author: rrykunov $
  $Date: 2009-07-13 22:24:20 +0400 (Пн, 13 июл 2009) $
}
unit PaymentOrderErrorGridFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  Menus;

type
  TPaymentOrderErrorGridForm = class(TObjectGridForm)
    dsDataADDITIONMESSAGE: TStringField;
    dsDataERRORMESSAGE: TStringField;
    grdDataDBBandedTableViewERRORMESSAGE: TcxGridDBBandedColumn;
  private
  protected
  public
  end;

implementation


{$R *.dfm}

{ TPaymentOrderErrorGridForm }



initialization
  RegisterClass(TPaymentOrderErrorGridForm);

end.
