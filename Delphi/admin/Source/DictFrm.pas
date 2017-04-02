unit DictFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit;

type
  TDictForm = class(TObjectForm)
    dsDataCODE: TStringField;
    dsDataCODE2: TStringField;
    dsDataFULLCODE: TStringField;
    dsDataOWNERNAME: TStringField;
    dsDataOWNERSYSNAME: TStringField;
    dsDataOWNERTYPENAME: TStringField;
    dsDataOWNERTYPESYSNAME: TStringField;
    edtCode: TcxDBTextEdit;
    lciCode: TdxLayoutItem;
    edtFullCode: TcxDBTextEdit;
    lciFullCode: TdxLayoutItem;
    tabPositions: TcxTabSheet;
    edtOwnerID: TfdcObjectLinkEdit;
    lciOwnerID: TdxLayoutItem;
    procedure tabPositionsShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FPositionGridForm: TForm;
  public
    { Public declarations }
  end;

var
  DictForm: TDictForm;

implementation

{$R *.dfm}

procedure TDictForm.tabPositionsShow(Sender: TObject);
begin
  inherited;

  if not Assigned(FPositionGridForm) then
     FPositionGridForm := ShowForm('TDictGridByObjectForm', Params, tabPositions);
end;

initialization
  RegisterClass(TDictForm);

end.
