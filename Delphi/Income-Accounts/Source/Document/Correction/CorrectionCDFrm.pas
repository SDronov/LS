unit CorrectionCDFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CorrectionDocFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, QueryList;

type
  TCorrectionCDForm = class(TCorrectionDocForm)
    edtReasonCorrect: TcxDBMemo;
    lciReasonCorrect: TdxLayoutItem;
    lcGeneralGroup3: TdxLayoutGroup;
    dsDataREASON_CORRECT: TStringField;
    procedure actDeleteUpdate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TCorrectionCDForm.actDeleteUpdate(Sender: TObject);
begin
  ;
end;

initialization
  RegisterClass(TCorrectionCDForm);

end.
 