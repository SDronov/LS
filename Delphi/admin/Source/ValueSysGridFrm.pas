unit ValueSysGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, MainDM,
  Menus;

type
  TValueGridForm = class(TObjectGridForm)
    grdDataDBBandedTableViewStringValue: TcxGridDBBandedColumn;
    dsDataSTRINGVALUE: TStringField;
    dsDataNUMVALUE: TFloatField;
    dsDataDATETIMEVALUE: TDateTimeField;
    dsDataREF_OBJECT_ID: TFloatField;
    dsDataISSYSTEM: TIntegerField;
    dsDataOWNERNAME: TStringField;
    dsDataOWNERTYPENAME: TStringField;
    dsDataOWNERTYPESYSNAME: TStringField;
    dsDataREFNAME: TStringField;
    dsDataREFTYPENAME: TStringField;
    dsDataREFTYPESYSNAME: TStringField;
    dsDataFILESOURCENAME: TStringField;
    grdDataDBBandedTableViewSysName: TcxGridDBBandedColumn;
  private
  protected
    function DoOpenObject(AID: Double; AParams: TParams = nil): TForm;
      override;
  public
  end;

var
  ValueGridForm: TValueGridForm;

implementation

uses ValueFrm;

{$R *.dfm}

{ TValueGridForm }

function TValueGridForm.DoOpenObject(AID: Double; AParams: TParams): TForm;
begin
  Result := inherited DoOpenObject(AID, AParams);
  TValueForm(Result).actNew.Visible := False;
  TValueForm(Result).actDelete.Visible := False;
  TValueForm(Result).lciOwnerID.Control := nil;
  TValueForm(Result).lciOwnerID.Visible := False;
  TValueForm(Result).lciOwnerID.ShowCaption := False;
  TValueForm(Result).edtOwnerID.Visible := False;
  TValueForm(Result).lciOwnerID.AlignVert := avBottom;
end;

Initialization
  RegisterClass(TValueGridForm);

end.
