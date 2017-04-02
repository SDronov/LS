unit ProvisionPSGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, fdcObjectServices;

type
  TProvisionPSGridForm = class(TfdcCustomGridForm)
    dsDataPS_SYSNAME: TStringField;
    dsDataPS_NAME: TStringField;
    dsDataPROVISION_SUMM: TFloatField;
    dsDataPROVISION_UPDATE: TDateTimeField;
    dsDataCHECK_SUMM: TFloatField;
    dsDataCHECK_UPDATE: TDateTimeField;
    dsDataPS_SHORTNAME: TStringField;
    dsDataPS_INN: TStringField;
    dsDataPS_KPP: TStringField;
    dsDataPS_OGRN: TStringField;
    dsDataDIFF: TFloatField;
    grdDataDBBandedTableViewPS_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPROVISION_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPROVISION_UPDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHECK_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCHECK_UPDATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDIFF: TcxGridDBBandedColumn;
    btnShowProvisionStat: TdxBarButton;
    actShowProvisionStat: TAction;
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actShowProvisionStatExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProvisionPSGridForm: TProvisionPSGridForm;

implementation

uses ProvisionPSStatGridFrm, MainFrm;

{$R *.dfm}

procedure TProvisionPSGridForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Color := clBlack;
  if (dsDataDIFF.AsInteger > 0) then
    begin
      ACanvas.Brush.Color := 12686815;
    end
  else
    begin
      ACanvas.Brush.Color := clWhite;
    end;
  inherited;
end;

procedure TProvisionPSGridForm.actShowProvisionStatExecute(
  Sender: TObject);
  //--
  var l_form: TForm;
      l_i: Integer;
  //--
  function is_form_present: boolean;
    var li: Integer;
  begin
    result := false;
    for li := 0 to MainForm.Navigator.TreeView.Items.Count-1 do
      begin
        if (TObject(MainForm.Navigator.TreeView.Items[li].Data) is TProvisionPSStatGridForm) then
          begin
            result := true;
            break;
          end;
      end;
  end;
begin
  if not(is_form_present) then
    begin
      l_form := GetObjectServices.ShowForm('TProvisionPSStatGridForm',nil,nil);
      l_form.Tag := Integer(l_form.ClassType);
    end;
end;

initialization
  RegisterClass(TProvisionPSGridForm);

end.
