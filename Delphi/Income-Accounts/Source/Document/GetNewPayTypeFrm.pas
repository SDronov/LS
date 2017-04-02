unit GetNewPayTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxGraphics, DB,
  dxmdaset, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit, cxLookAndFeels,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, StdCtrls, cxButtons,
  cxControls;

type
  TGetNewPayTypeForm = class(TfdcCustomDlgForm)
    edtOldPayType: TcxTextEdit;
    itemOldPayType: TdxLayoutItem;
    edtKBK: TcxTextEdit;
    itemKBK: TdxLayoutItem;
    cbNewPayType: TcxDBLookupComboBox;
    itemNewPayType: TdxLayoutItem;
    dsetPayType: TdxMemData;
    dsetPayTypePAY_TYPE_ID: TFloatField;
    dsPayType: TDataSource;
    dsList: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GetNewPayTypeForm: TGetNewPayTypeForm;

implementation

{$R *.dfm}

procedure TGetNewPayTypeForm.FormCreate(Sender: TObject);
begin
  inherited;

  dsetPayType.Open;
  dsetPayType.Append;
end;

end.
