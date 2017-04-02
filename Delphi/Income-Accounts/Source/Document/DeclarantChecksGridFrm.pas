unit DeclarantChecksGridFrm;

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
  dxStatusBar, cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TDeclarantChecksGridForm = class(TObjectGridForm)

    dsDatacheckdate: TDateTimeField;
    dsDatareqcont: TStringField;
    dsDatasCHECKTYPE: TStringField;
    dsDatasSTATUS: TStringField;
    dsDataansdate: TDateTimeField;
    dsDataanscont: TStringField;
    dsDatachecknumb: TStringField;
    colgrdDataDBBandedTableViewcheckdate: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewreqcont: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewsCHECKTYPE: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewsSTATUS: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewansdate: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewanscont: TcxGridDBBandedColumn;
    colgrdDataDBBandedTableViewchecknumb: TcxGridDBBandedColumn;
    dsDatanstatus: TIntegerField;
    edtChecktype: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    ctxViewMode: TdxBarCombo;
    edtDateBegin: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtDateEnd: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dsChecksRecent: TfdcQuery;
    dsputSubject: TfdcQuery;
    procedure actSearchExecute(Sender: TObject);
    procedure ctxViewModeChange(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dsDatasubject_id: TIntegerField;
    dsDatadocument_id: TIntegerField;
  end;

var
  DeclarantChecksGridForm: TDeclarantChecksGridForm;

implementation
{$R *.dfm}
procedure TDeclarantChecksGridForm.actSearchExecute(Sender: TObject);
begin
  SetSearchParam('SCHECKTYPE', Trim(edtChecktype.Text));
  SetSearchParam('FROM_DATE', Trim(edtDateBegin.Text));
  SetSearchParam('TO_DATE', Trim(edtDateEnd.Text));
  inherited;
end;

procedure TDeclarantChecksGridForm.ctxViewModeChange(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TDeclarantChecksGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   SetSubsParam('viewmode', ctxViewMode.ItemIndex);
end;

procedure TDeclarantChecksGridForm.FormShow(Sender: TObject);
begin
  inherited;
  ActAdd.Visible := true;
  if (uppercase(Owner.ClassName) <> 'TDECLARANTFORM') and
     (uppercase(Owner.ClassName) <> 'TPERSONFORM')
   then // Решение
   begin
    dsData.SQL.AddStrings(dsChecksRecent.SQL);
    dsData.SQL.Text := StringReplace(dsData.SQL.Text,
                                     'ACC',
                                     ParamsHolder.Params.ParamByName('Account').AsString,
                                     [rfReplaceAll]);
    dsData.ReQuery;
    grdData.Refresh;
    ActAdd.Visible := false;
   end;
end;

procedure TDeclarantChecksGridForm.actAddExecute(Sender: TObject);
begin
  dsPutSubject.Params.ParamByName('nID').Value := ParamsHolder.Params.ParamByName('SUBJECT_ID').AsInteger;
  dsPutSubject.ExecSQL;
  inherited;

end;

initialization
RegisterClass(TDeclarantChecksGridForm);

end.
