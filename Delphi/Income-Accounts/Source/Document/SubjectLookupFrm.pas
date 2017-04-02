unit SubjectLookupFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TSubjectLookupForm = class(TSubjectGridForm)
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure actSearchCancelUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectLookupForm: TSubjectLookupForm;

implementation

uses fdcCustomObjectGridFrm, fdcCustomGridFrm;

{$R *.dfm}

procedure TSubjectLookupForm.FormShow(Sender: TObject);
begin
  inherited;
  SearchMode := True;
  SearchTypeSysName := 'Subject';
  edtName.Text := Params.ParamValues['G142'];
  edtINN.Text := Params.ParamValues['G141'];
  edtOKPO.Text := Params.ParamValues['G147'];
end;

procedure TSubjectLookupForm.actSearchCancelUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := False;
end;


initialization
    RegisterClass(TSubjectLookupForm);

end.
