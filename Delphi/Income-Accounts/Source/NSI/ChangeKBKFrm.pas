unit ChangeKBKFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGraphics, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  OracleData, QueryList;

type
  TChangeKBKForm = class(TObjectForm)
    edtKBKFrom: TcxDBLookupComboBox;
    lcGeneralItem1: TdxLayoutItem;
    edtKBKTo: TcxDBLookupComboBox;
    lcGeneralItem2: TdxLayoutItem;
    edtDateFrom: TcxDBDateEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtDateTo: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataFROM_KBKCODE: TStringField;
    dsDataTO_KBKCODE: TStringField;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    dsKBK: TOracleDataSet;
    srcKBK: TDataSource;
    dsKBKTo: TOracleDataSet;
    srcKBKTo: TDataSource;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

implementation

uses MainDm, fdcMessages;

{$R *.dfm}
procedure TChangeKBKForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if dsDataDATE_BEGIN.IsNull then
    dsDataDATE_BEGIN.Value := Trunc(MainData.GetServerDate);
end;

procedure TChangeKBKForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsKBK.Open;
  dsKBKTo.Open;
end;

procedure TChangeKBKForm.actSaveExecute(Sender: TObject);
begin
  if MainData.GetCustomsLevel = 0 then
    inherited
  else
    MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровне ФТС','Данное действие запрещено!',mtError,[mbOk],0);
end;

procedure TChangeKBKForm.actDeleteExecute(Sender: TObject);
begin
  if MainData.GetCustomsLevel = 0 then
    inherited
  else
    MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровне ФТС','Данное действие запрещено!',mtError,[mbOk],0);
end;

initialization
  RegisterClass(TChangeKBKForm);

end.
