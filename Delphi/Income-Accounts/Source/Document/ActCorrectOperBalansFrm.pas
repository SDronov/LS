unit ActCorrectOperBalansFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxGraphics, dxmdaset;

type
  TActCorrectOperBalansForm = class(TDocumentForm)
    lcgSign: TdxLayoutGroup;
    edtSignDate: TcxDBDateEdit;
    edtSignBy: TcxDBTextEdit;
    lciSignBy: TdxLayoutItem;
    lciSignDate: TdxLayoutItem;
    lciDocDateCreated: TdxLayoutItem;
    editDocDateCreated: TcxDBDateEdit;
    lciTypeBalans: TdxLayoutItem;
    lcgDopDocAttr: TdxLayoutGroup;
    cbTypeBalans: TcxComboBox;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataBALANS_TYPE: TIntegerField;
    dsDataBALANS_TYPE_TEXT: TStringField;
    dsDataDATE_CREATED: TDateTimeField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    tabTrans: TcxTabSheet;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure cbTypeBalansPropertiesChange(Sender: TObject);
    procedure tabTransShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fTransForm: TForm;
  protected
    function GetTransFormClassName : string; virtual;
    function GetTransForm : TForm;
  public
    { Public declarations }
    property tabTransForm : TForm read fTransForm;
  end;

var
  ActCorrectOperBalansForm: TActCorrectOperBalansForm;

implementation

uses fdcCustomObjectFrm, MainDm, ObjectGridFrm;

{$R *.dfm}

procedure TActCorrectOperBalansForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not(GetIsNew) then
    begin
      if (DataSet.FieldByName('BALANS_TYPE').IsNull) then
        begin
          cbTypeBalans.ItemIndex := -1;
        end
      else
        begin
          cbTypeBalans.ItemIndex := DataSet.FieldByName('BALANS_TYPE').AsInteger;
        end;
    end
  else
    begin
      cbTypeBalans.ItemIndex := 0;
    end;
end;

procedure TActCorrectOperBalansForm.cbTypeBalansPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (GetIsNew) then
    begin
      dsDataBALANS_TYPE.AsInteger := cbTypeBalans.ItemIndex;
    end;
  Modified := True;
end;

procedure TActCorrectOperBalansForm.tabTransShow(Sender: TObject);
begin
  if not(Assigned(Params.FindParam('act_id'))) then
    begin
      Params.CreateParam(ftFloat, 'act_id', ptInput);
    end;
  Params.ParamByName('act_id').AsFloat := dsDataID.AsFloat;
  if not Assigned(fTransForm) then
    begin
      fTransForm := ObjectServices.ShowForm(GetTransFormClassName, params, tabTrans);
    end;
  //--
  TObjectGridForm(fTransForm).actAdd.Enabled := (dsDataIS_ACTIVE.asString = 'N');
  //--
end;

procedure TActCorrectOperBalansForm.FormCreate(Sender: TObject);
begin
  inherited;
  fTransForm := nil;
  //-- Заполнение режимов отображения баланса
  //-- только для уровня РТУ и ФТС
  if (MainData.GetCustomsLevel < 2) then
    begin
      cbTypeBalans.Properties.Items.Add('Непосредственно РТУ/ФТС');
      cbTypeBalans.Properties.Items.Add('Суммарный');
    end;
end;

function TActCorrectOperBalansForm.GetTransForm: TForm;
begin
  Result := fTransForm;
end;

function TActCorrectOperBalansForm.GetTransFormClassName: string;
begin
  Result := 'TActCorrectOperBalansTranGridByActForm';
end;

procedure TActCorrectOperBalansForm.FormShow(Sender: TObject);
begin
  inherited;
  if (GetIsNew) then
    begin
      if (dsDataBALANS_TYPE.IsNull) then
        begin
          dsDataBALANS_TYPE.AsInteger := cbTypeBalans.ItemIndex;
        end;
    end;
end;

initialization
  RegisterClass(TActCorrectOperBalansForm);

end.
