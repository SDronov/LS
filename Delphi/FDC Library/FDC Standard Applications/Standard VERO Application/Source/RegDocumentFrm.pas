unit RegDocumentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxDropDownEdit, cxCalendar;

type
  TRegDocumentForm = class(TObjectForm)
    edtOwnerObjectID: TfdcObjectLinkEdit;
    lciOwnerObjectID: TdxLayoutItem;
    edtDocSerial: TcxDBTextEdit;
    lciDocSerial: TdxLayoutItem;
    edtDocNumber: TcxDBTextEdit;
    lciDocNumber: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtDocDate: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtStopDate: TcxDBDateEdit;
    lciStopDate: TdxLayoutItem;
    edtGrantee: TcxDBMemo;
    lciGrantee: TdxLayoutItem;
    dsDataDOCDATE: TDateTimeField;
    dsDataSTOPDATE: TDateTimeField;
    dsDataDOCNUMBER: TStringField;
    dsDataDOCSERIAL: TStringField;
    dsDataGRANTEE: TStringField;
    dsDataOWNER_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegDocumentForm: TRegDocumentForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TRegDocumentForm);

end.
