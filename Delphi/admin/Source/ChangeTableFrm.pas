unit ChangeTableFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomCardFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxPC, cxControls,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit,
  ChangeColumnGridFrm, cxGroupBox, fdcCustomNonObjectFrm;

type
  TChangeTableForm = class(TfdcCustomNonObjectForm)
    edtEventType: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    dsDataDATE_FROM: TDateTimeField;
    dsDataOBJECT_ID: TFloatField;
    dsDataEVENT_TYPE_ID: TFloatField;
    dsDataUSER_ID: TFloatField;
    dsDataTABLE_NAME: TStringField;
    dsDataEVENTNAME: TStringField;
    dsDataUSERNAME: TStringField;
    dsDataNAME: TStringField;
    dsDataSYSNAME: TStringField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    edtDate_From: TcxDBTextEdit;
    lcGeneralItem3: TdxLayoutItem;
    edtName: TcxDBTextEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtSysName: TcxDBTextEdit;
    lcGeneralItem5: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    edtTypeName: TcxDBTextEdit;
    lcGeneralItem6: TdxLayoutItem;
    edtTypeSysName: TcxDBTextEdit;
    lcGeneralItem7: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
    tabColumns: TcxTabSheet;
    edtUserName: TcxDBTextEdit;
    lcGeneralItem8: TdxLayoutItem;
    dxBarButton1: TdxBarButton;
    edtTableName: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure tabColumnsShow(Sender: TObject);
    function  SupportedTypeSysName: string; override;
    function  MakeCaption(AUseModifiedFlag: boolean = True): string; override;
  private
    FColumnGridForm : TChangeColumnGridForm;
  public
  end;

implementation

{$R *.dfm}

uses
  MainDm;

procedure TChangeTableForm.FormCreate(Sender: TObject);
begin
  inherited;
  FColumnGridForm := nil;
end;


procedure TChangeTableForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('ID').Value := Params.ParamValues['THE_ID'];
end;


procedure TChangeTableForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  Params.ParamByName('ID').Value := dsDataID.Value;
  inherited;
end;


procedure TChangeTableForm.tabColumnsShow(Sender: TObject);
begin
  if (FColumnGridForm = nil) then
  try
    FColumnGridForm := TChangeColumnGridForm.Create(Self);
    FColumnGridForm.Parent := tabColumns;
    FColumnGridForm.Align := alClient;
    FColumnGridForm.dsData.ParamByName('Table_ID').Value := dsDataId.Value;
    FColumnGridForm.Visible := True;
  except
    FColumnGridForm := nil;
    raise;
  end;
end;


function  TChangeTableForm.SupportedTypeSysName: string;
begin
  Result := 'DataChangeTable';
end;


function GetDisplayName(aText: string): string;
const
  cNameLen = 30;
begin
  if Length(aText) > cNameLen then
    Result := Copy(aText, 1, cNameLen) + '...'
  else
    Result := aText;
end;

function  TChangeTableForm.MakeCaption(AUseModifiedFlag: boolean = True): string;
var
  s : string;
begin
  if dsDataName.IsNull and dsDataTypeName.IsNull then
    s := dsDataTable_Name.Value
  else
    s := GetDisplayName(dsDataName.Value) +                 // имя объекта
         ' (' + GetDisplayName(dsDataTypeName.Value) + ')'; // тип объекта

  Result := dsDataEventName.Value +                         // имя события
//            ' (' + dsDataDate_From.AsString + ')' +       // момент события
            ': ' +                                          // сепаратор
            s;                                              // детальная информация
end;


initialization
  RegisterClass(TChangeTableForm);

end.
