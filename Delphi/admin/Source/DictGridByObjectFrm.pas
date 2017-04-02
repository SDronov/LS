unit DictGridByObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TDictGridByObjectForm = class(TDictGridForm)
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictGridByObjectForm: TDictGridByObjectForm;

implementation

uses DictFrm;
{$R *.dfm}

procedure TDictGridByObjectForm.actAddExecute(Sender: TObject);
var f: TDictForm;
begin
  f := (ObjectServices.CreateObject(Params.ParamByName('TypeSysName').asString, False, Params) as TDictForm);
  RegisterAsWaiterFor(f);
  f.dsDataOWNER_OBJECT_ID.asFloat := Params.ParamByName('ID').asFloat;
  f.dsDataOWNERNAME.asString := Params.ParamByName('Name').asString;
end;

initialization
  RegisterClass(TDictGridByObjectForm);

end.
