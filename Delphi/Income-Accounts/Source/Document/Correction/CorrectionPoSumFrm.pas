unit CorrectionPoSumFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionPOFrm, OracleData, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxCurrencyEdit, cxMemo, cxTextEdit, cxPC, cxControls,
  QueryList;

type
  TCorrectionPOSumForm = class(TCorrectionPOForm)
    dsDataSUMMA: TFloatField;
    edtCorrectSumma: TcxDBCurrencyEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtOldSumma: TcxDBCurrencyEdit;
    lcOldSum: TdxLayoutItem;
    dsDataOLD_SUMMA: TFloatField;
  private
  public
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TCorrectionPOSumForm);


end.
 