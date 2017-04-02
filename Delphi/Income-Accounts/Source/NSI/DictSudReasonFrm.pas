unit DictSudReasonFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar,
  ImgList, cxEdit, cxLookAndFeels, cxContainer, dxLayoutLookAndFeels,
  ActnList, StdCtrls, dxLayoutControl, cxMaskEdit, cxButtonEdit, cxDBEdit,
  fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls, cxDropDownEdit,
  cxCalendar;

type
  TDictSudReasonForm = class(TDictForm)
    edtDatBegDoc: TcxDBDateEdit;
    lciDatBegDoc: TdxLayoutItem;
    edtEDate: TcxDBDateEdit;
    lciEDate: TdxLayoutItem;
    edtDatEndDoc: TcxDBDateEdit;
    lciDatEndDoc: TdxLayoutItem;
    edtNumEndDoc: TcxDBTextEdit;
    lciNumEndDoc: TdxLayoutItem;
    edtNumBegDoc: TcxDBTextEdit;
    lciNumBegDoc: TdxLayoutItem;
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    dsDataNUMBEGDOC: TStringField;
    dsDataDATBEGDOC: TDateTimeField;
    dsDataNUMENDDOC: TStringField;
    dsDataDATENDDOC: TDateTimeField;
    edtSDate: TcxDBDateEdit;
    lciSDate: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictSudReasonForm: TDictSudReasonForm;

implementation

{$R *.dfm}

initialization
   RegisterClass(TDictSudReasonForm);

end.
