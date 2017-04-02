unit ActChangeOstKBKTransFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActChangeOstKBKFrm, cxGraphics, OracleData, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxCheckBox, cxDBEdit, cxCurrencyEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMemo, cxTextEdit, cxPC, cxControls, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TActChangeOstKBKTransForm = class(TActChangeOstKBKForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TActChangeOstKBKTransForm);

end.
