unit JobListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls,MainDm, Mask, DBCtrls, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxDropDownEdit, cxCalendar, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TJobListForm = class(TObjectForm)
    dsDataJOB_ID: TFloatField;
    dsDataJOB_PARAMS: TBlobField;
    dsDataWHEN: TDateTimeField;
    dsDataJOB_SUBMIT_ID: TFloatField;
    dsDataSTATUS: TStringField;
    dsDataDIR: TStringField;
    dsDataJOB_NAME: TStringField;
    fdcObjectLinkEdit1: TfdcObjectLinkEdit;
    lcGeneralItem9: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    lcGeneralItem2: TdxLayoutItem;
    dsOraDirectories: TfdcQuery;
    srcOraDirectories: TDataSource;
    cxTabSheet1: TcxTabSheet;
    dsOraDirectoriesOWNER: TStringField;
    dsOraDirectoriesDIRECTORY_NAME: TStringField;
    dsOraDirectoriesDIRECTORY_PATH: TStringField;
    dsDataINTERVAL: TFloatField;
    dsDataINTERVAL_UNITS: TStringField;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    lcGeneralItem5: TdxLayoutItem;
    dsTimeUnits: TfdcQuery;
    srcTimeUnits: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataWHEN_LAST: TDateTimeField;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    procedure cxTabSheet1Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   fjobexec: TForm;
  public
    { Public declarations }
  end;

var
  JobListForm: TJobListForm;

implementation

uses FormUtils, ObjServices;

{$R *.dfm}

procedure TJobListForm.cxTabSheet1Show(Sender: TObject);
begin
  inherited;
  SetObjectServices(ObjectServices);
  ShowTabForm(fjobexec,'TJobExecGridForm',params,TWinControl(sender),Self);
end;

procedure TJobListForm.FormShow(Sender: TObject);
begin
  inherited;
  dsOraDirectories.Active := True;
  dsTimeUnits.Active := True;
end;

initialization
  RegisterClass(TJobListForm);

end.
