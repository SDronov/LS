unit InteractSettingsQueuesGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, InteractSettingsQueuesFrm;

type
  TInteractSettingsQueuesGridForm = class(TObjectGridForm)
    dsDataCUSTCODE: TStringField;
    dsDataTYPE: TStringField;
    dsDataNTYPE: TIntegerField;
    dsDataMANAGER: TStringField;
    dsDataHOST: TStringField;
    dsDataPORT: TStringField;
    dsDataCHANNEL: TStringField;
    dsDataQUEUE: TStringField;
    dsDataCCSID: TIntegerField;
    grdDataDBBandedTableViewCustcode: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewType: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewManager: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewHost: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPort: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewChannel: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewQueue: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCCSID: TcxGridDBBandedColumn;    
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InteractSettingsQueuesGridForm: TInteractSettingsQueuesGridForm;

implementation

{$R *.dfm}     
procedure TInteractSettingsQueuesGridForm.actAddExecute(Sender: TObject);
var f: TInteractSettingsQueuesForm;
begin          
  Params.ParamByName('OWNER_OBJECT_ID').Value := Params.ParamByName('ID').asFloat;
  
  f := (ObjectServices.CreateObject('InteractSettingsQueues', False, Params) as TInteractSettingsQueuesForm);
  RegisterAsWaiterFor(f);
//  f.dsDataOWNER_OBJECT_ID.asFloat := Params.ParamByName('ID').asFloat;
//  f.dsDataOWNER_NAME.asString := Params.ParamByName('Name').asString;
end;
                  
initialization
  RegisterClass(TInteractSettingsQueuesGridForm);
end.
