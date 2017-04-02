unit JobExecFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls,MainDm, Mask, DBCtrls, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxDropDownEdit, cxCalendar, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcCustomCardFrm;

type
  TJobExecForm = class(TfdcCustomCardForm)
    dsDataJOBLIST_ID: TFloatField;
    dsDataWHEN_STARTED: TDateTimeField;
    dsDataWHEN_STOPPED: TDateTimeField;
    dsDataIS_ERRORS: TStringField;
    DBEdit1: TDBEdit;
    lcGeneralItem3: TdxLayoutItem;
    DBEdit2: TDBEdit;
    lcGeneralItem5: TdxLayoutItem;
    DBEdit3: TDBEdit;
    lcGeneralItem7: TdxLayoutItem;
    cxTabSheet1: TcxTabSheet;
    dsDataJOBEXEC_ID: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure cxTabSheet1Show(Sender: TObject);
  private
    { Private declarations }
   fjoberror: TForm;
  public
    { Public declarations }
  end;

var
  JobExecForm: TJobExecForm;

implementation

uses ObjServices, FormUtils;

{$R *.dfm}

procedure TJobExecForm.FormShow(Sender: TObject);
begin
  inherited;
  Params.Fill(dsData.Params);
  dsData.Active := True;
end;

procedure TJobExecForm.cxTabSheet1Show(Sender: TObject);
begin
  inherited;
  ShowTabForm(fjoberror,'TJobErrorsGridForm',params,TWinControl(sender),Self);
end;

initialization
 RegisterClass(TJobExecForm);

end.
