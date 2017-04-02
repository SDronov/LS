unit DocPackReuseYFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, Oracle, cxButtonEdit, fdcObjectLinkEdit;

type
  TDocPackReuseYForm = class(TDocPackForm)
    dsDataDATE_INCOMING: TDateTimeField;
    dsDataDESTINATION: TStringField;
    procedure tabDocsShow(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDocsFormClassName : string; override;  
  public
    { Public declarations }
  end;

var
  DocPackReuseYForm: TDocPackReuseYForm;

implementation
uses
  fdcCustomDataFrm
 ,fdcCustomCardFrm
 ,MainDM
 , fdcCustomDBDataFrm, fdcCustomObjectFrm;

{$R *.dfm}

{ TDocPackReuseYForm }

function TDocPackReuseYForm.GetDocsFormClassName: string;
begin
  Result := 'TDocReuseGridForm';
end;

procedure TDocPackReuseYForm.tabDocsShow(Sender: TObject);
begin
  if not Assigned( Params.FindParam( 'Content' ) ) then
    begin
      Params.CreateParam( ftInteger, 'Content', ptInput ).AsInteger := 2;
    end
  else
    begin
      Params.FindParam( 'Content' ).AsInteger := 2;
    end;

  if not Assigned( Params.FindParam( 'pack_id' ) ) then
    begin
      Params.CreateParam( ftFloat, 'pack_id', ptInput ).AsFloat := Params.ParamByName( 'ID' ).AsFloat;
    end
  else
    begin
      Params.FindParam( 'pack_id' ).AsFloat := Params.ParamByName( 'ID' ).AsFloat;
    end;

  inherited;
end;




procedure TDocPackReuseYForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  Modify( edtDocDate );
end;

procedure TDocPackReuseYForm.FormShow(Sender: TObject);
begin
  inherited;
  if GetIsNew then
    begin
      edtDocDate.Date := Date;
      edtDocDate.PostEditValue;
    end;
end;

procedure TDocPackReuseYForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
     actDelete.Enabled := False;
end;

initialization
  RegisterClass( TDocPackReuseYForm );

end.
