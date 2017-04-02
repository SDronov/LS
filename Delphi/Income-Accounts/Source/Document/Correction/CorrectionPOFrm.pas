unit CorrectionPOFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionDocFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxMemo, cxTextEdit, cxPC, cxControls, cxCurrencyEdit,
  OracleData, ObjectFrm, fdcObjectCore, QueryList;

type
  TCorrectionPOForm = class(TCorrectionDocForm)
    dsDataREASON_CORRECT: TStringField;
    lcgReasonCorrection: TdxLayoutGroup;
    lcReasonCorrection: TdxLayoutItem;
    edtReasonCorrection: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionPOForm: TCorrectionPOForm;

implementation


{$R *.dfm}
initialization
  RegisterClass(TCorrectionPOForm);

end.
