unit RepayGroupBySubjFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, Mask, DBCtrls;

type
  TRepayGroupBySubjForm = class(TObjectForm)
    dsDataADDRESS: TStringField;
    dsDataFULL_NAME: TStringField;
    dsDataOKPO: TStringField;
    dsDataINN: TStringField;
    dsDataOGRN: TStringField;
    dsDataSOATO: TStringField;
    dsDataKPP: TStringField;
    dsDataPHONE: TStringField;
    dsDataFAX: TStringField;
    dsDataTELEX: TStringField;
    dsDataTELEGRAPH: TStringField;
    dsDataTELETYPE: TStringField;
    DBEdit1: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    DBEdit2: TcxDBTextEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    cxTabSheet1: TcxTabSheet;
    procedure cxTabSheet1Show(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
     frepay: TForm;
  protected
    function MakeCaption(AUseModifiedFlag: Boolean = True): String;
      override;
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  RepayGroupBySubjForm: TRepayGroupBySubjForm;

implementation

uses MainDm, FormUtils, fdcCustomCardFrm;

{$R *.dfm}

procedure TRepayGroupBySubjForm.cxTabSheet1Show(Sender: TObject);
begin
  inherited;
  ShowTabForm(frepay,'TRepaymentGridForm',params,TWinControl(sender),Self);
end;

procedure TRepayGroupBySubjForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tabService.TabVisible := False;
end;

function TRepayGroupBySubjForm.MakeCaption(
  AUseModifiedFlag: Boolean): String;
begin
  if Assigned(EditObject) then
     Result := EditObject.ObjName + '(' + 'отсрочки' + ')';
end;

procedure TRepayGroupBySubjForm.RefreshData;
begin
  with ParamByName('ID') do
    Value := Trunc(Value);
  inherited;
  with ParamByName('ID') do
    Value := Value + 0.11;
end;

initialization
  RegisterClass(TRepayGroupBySubjForm);

end.
