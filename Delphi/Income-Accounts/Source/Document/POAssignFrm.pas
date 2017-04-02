unit POAssignFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxDBEdit,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, cxControls, Menus, cxGraphics, cxEditRepositoryItems;

type
  TPOAssignForm = class(TfdcCustomDlgForm)
    edtPODeduct: TcxCurrencyEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtSumma: TcxCurrencyEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtLimit: TcxCurrencyEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    srcData: TDataSource;
    cmbxPO: TcxLookupComboBox;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    procedure actOkExecute(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure cmbxPOPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function AutoSaveLayout: Boolean; override;
    { Public declarations }
  end;

var
  POAssignForm: TPOAssignForm;

  function SelectPayment(DataSet: TDataSet; const Limit: double; var Id, Summa: double): Boolean;

implementation

uses
  Math;

{$R *.dfm}

function SelectPayment(DataSet: TDataSet; const Limit: double; var Id, Summa: double): Boolean;
var
  F: TPOAssignForm;
begin
  F := TPOAssignForm.Create(nil);
  try
    F.srcData.DataSet := DataSet;
    F.edtLimit.Value := Limit;

    if F.cmbxPO.Properties.ListSource.DataSet.FindField( 'KBKCODE' ) = nil then
      begin
        F.cmbxPO.Properties.ListFieldNames := 'NAME;SUMMA';
        F.cmbxPO.Properties.ListColumns[0].Width := 150;
        F.cmbxPO.Properties.ListColumns[1].Width := 120;
        F.cmbxPO.Properties.DropDownWidth        := 150 + 120;
      end
    else
      begin
        F.cmbxPO.Properties.ListFieldNames := 'NAME;KBKCODE;SUMMA';
        F.cmbxPO.Properties.ListColumns[0].Width := 150;
        F.cmbxPO.Properties.ListColumns[1].Width := 180;
        F.cmbxPO.Properties.ListColumns[2].Width := 120;
        F.cmbxPO.Properties.DropDownWidth        := 150 + 180 + 120;
      end;

    Result := F.ShowModal = mrOk;
    if Result then
    begin
       Id := F.cmbxPO.EditValue;
       Summa := F.edtSumma.Value;
    end;
  finally
    F.Free;
  end;
end;

procedure TPOAssignForm.actOkExecute(Sender: TObject);
begin
  edtSumma.PostEditValue;
  ModalResult := mrOk;
end;

procedure TPOAssignForm.actOkUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (edtSumma.Value > 0)
    and (edtSumma.Value <= edtPODeduct.Value)
    and (edtSumma.Value <= edtLimit.Value);
end;

function DoLocateRecord(DataSet: TDataSet; const KeyFieldName: string; const KeyValue: Variant): Boolean;
begin
  Result := False;
  DataSet.DisableControls;
  try
   DataSet.First;
   while not DataSet.Eof do
   begin
      if DataSet[KeyFieldName] = KeyValue then
      begin
        Result := True;
        Exit;
      end;
      DataSet.Next;
   end;
  finally
    DataSet.EnableControls;
  end;
end;


function TPOAssignForm.AutoSaveLayout: Boolean;
begin
  Result := False;
end;

procedure TPOAssignForm.cmbxPOPropertiesChange(Sender: TObject);
begin
  inherited;
  if DoLocateRecord(srcData.DataSet, 'ID', cmbxPO.EditValue) then
  begin
    edtPODeduct.Value := srcData.DataSet['SUMMA'];
    edtSumma.Value := Min(edtLimit.Value, edtPODeduct.Value);
  end;
end;

procedure TPOAssignForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight + 14 * 2;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
end;

end.
