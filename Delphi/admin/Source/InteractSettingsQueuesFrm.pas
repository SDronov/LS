unit InteractSettingsQueuesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TInteractSettingsQueuesForm = class(TObjectForm)
    dsDataOWNER_NAME: TStringField;
    dsDataCUSTCODE: TStringField;
    dsDataTYPE: TStringField;
    dsDataNTYPE: TIntegerField;
    dsDataMANAGER: TStringField;
    dsDataHOST: TStringField;
    dsDataPORT: TStringField;
    dsDataCHANNEL: TStringField;
    dsDataQUEUE: TStringField;
    dsDataCCSID: TIntegerField;
    edtMANAGER: TcxDBTextEdit;
    lciManagerEdit: TdxLayoutItem;
    edtHOST: TcxDBTextEdit;
    lciHostEdit: TdxLayoutItem;
    edtPORT: TcxDBTextEdit;
    lciPortEdit: TdxLayoutItem;
    edtCCSID: TcxDBTextEdit;
    lciCCSIDEdit: TdxLayoutItem;
    edtQUEUE: TcxDBTextEdit;
    lciQueueEdit: TdxLayoutItem;
    edtCHANNEL: TcxDBTextEdit;
    lciChannelEdit: TdxLayoutItem;
    edtTYPE: TcxDBComboBox;
    lciTypeEdit: TdxLayoutItem;
    cmbxCustcode: TcxDBLookupComboBox;
    lciCustCodeEdit: TdxLayoutItem;
    dsCustoms: TfdcQuery;
    srcCustoms: TDataSource;
    dsCustomsID: TIntegerField;
    dsCustomsCUSTOMS_CODE_8: TStringField;
    dsCustomsNAME: TStringField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterClose(DataSet: TDataSet);  
    procedure Modify(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InteractSettingsQueuesForm: TInteractSettingsQueuesForm;

implementation

{$R *.dfm}

procedure TInteractSettingsQueuesForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsCustoms.Open;
end;

procedure TInteractSettingsQueuesForm.dsDataAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsCustoms.Close;
end;

procedure TInteractSettingsQueuesForm.Modify(Sender: TObject);
begin
  inherited;
  dsDataNTYPE.Value := edtType.ItemIndex;
end;

procedure TInteractSettingsQueuesForm.FormShow(Sender: TObject);
begin
  inherited;    
  dsDataOWNER_OBJECT_ID.asFloat := ParamByName('OWNER_OBJECT_ID').Value;

end;

initialization
  RegisterClass(TInteractSettingsQueuesForm);
end.
