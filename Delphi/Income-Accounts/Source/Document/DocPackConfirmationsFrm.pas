unit DocPackConfirmationsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TDocPackConfirmationsForm = class(TDocPackForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDESTCUSTOMSID: TFloatField;
    dsDataDESTCUSTOMSCODE: TStringField;
    edtDestCustomsCode: TcxDBTextEdit;
    lciDestCustomsCode: TdxLayoutItem;
  private
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

var
  DocPackConfirmationsForm: TDocPackConfirmationsForm;

implementation

{$R *.dfm}

{ TDocPackConfirmationsForm }

function TDocPackConfirmationsForm.GetDocsFormClassName: string;
begin
  Result := 'TDocumentConfirmationGridForm';
end;

initialization
  RegisterClass( TDocPackConfirmationsForm );

end.
