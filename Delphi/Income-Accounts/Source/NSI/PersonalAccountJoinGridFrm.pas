unit PersonalAccountJoinGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PersonalAccountGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBarExtItems, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, QueryList,
  fdcObjectCore,fdcMessages, cxCalendar;

type
  TPersonalAccountJoinGridForm = class(TPersonalAccountGridForm)
    QueryList: TQueryList;
    sqlUpdateParent: TsqlOp;
    sqlRemoveParent: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FSearchCount	: Integer;
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
  public
    { Public declarations }
  end;


var
  PersonalAccountJoinGridForm: TPersonalAccountJoinGridForm;

implementation

uses  fdcObjectServices;

{$R *.dfm}
procedure TPersonalAccountJoinGridForm.actAddExecute(Sender: TObject);
var F : TPersonalAccountGridForm;
begin
  FSearchCount := 0;
  F := TPersonalAccountGridForm.Create(Self);
  F.ParamsHolder.Params[0].Value := dsData.Params.ParamByName('ID').AsInteger;
  F.SearchMode := True;
  F.SearchMultiple := True;
  F.SearchTypeSysName := 'PersonalAccount';

  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.lv_viewmode := 1;

  F.ShowModal;
  F.Free;
  RefreshData;
end;

procedure TPersonalAccountJoinGridForm.OnSearchFinished(const ADragObject: TfdcDragObject);
var
  i : Integer;
begin
  if ConfirmDlg('Выполнить объединение лицевых счетов?', 'Внимание! Результаты данной операции отменить невозможно!') <> mrYes then
    EXIT;
  try
    for i := 0 to ADragObject.Objects.Count - 1 do
        sqlUpdateParent.exec('pId;pMergedId',[dsData.Params.ParamByName('ID').AsInteger, ADragObject.Objects[i].Id]);
    FSearchCount := ADragObject.Objects.Count;
    sqlUpdateParent.QueryList.Session.Commit;
  except
    sqlUpdateParent.QueryList.Session.Rollback;
    raise;
  end;
end;

procedure TPersonalAccountJoinGridForm.actDeleteExecute(
  Sender: TObject);
var i :integer;
begin
  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do begin
    { показать предупреждение }
    if (
         (SelectedRecordCount > 1) and
         (WarningDlg(
           'Удаление выделенных объектов. Продолжить?',
           Format('Все выделенные объекты (%d из %d) будут удалены. ' +
             'Удаление выделенных объектов невозможно будет отменить. ' +
             'Удалить выделенные объекты?', [SelectedRecordCount, RecordCount])
          ) <> mrYes)
       ) or
       (
         (SelectedRecordCount = 1) and
         (WarningDlg(
            'Удаление объекта. Продолжить?',
            dsDataTYPENAME.asString + ' ' + dsDataNAME.asString + ' будет удален. ' +
            'Удаление объекта невозможно будет отменить. ' +
            'Удалить объект?'
          ) <> mrYes)
       )
    then
      Exit;
    try
       for i := 0 to SelectedRecordCount-1 do
        sqlRemoveParent.exec('pId',[ActiveGridTableView.Controller.SelectedRows[i].Values[grdDataDBBandedTableViewID.Index]]);
       sqlRemoveParent.QueryList.Session.Commit
    except
       sqlRemoveParent.QueryList.Session.Rollback;
    end;
  end;
  RefreshData;
end;

initialization
    RegisterClass(TPersonalAccountJoinGridForm);

end.
