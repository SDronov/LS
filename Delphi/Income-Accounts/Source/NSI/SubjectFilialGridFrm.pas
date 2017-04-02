unit SubjectFilialGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, fdcObjectCore, fdcMessages;

type
  TSubjectFilialGridForm = class(TSubjectGridForm)
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
  SubjectFilialGridForm: TSubjectFilialGridForm;

implementation

uses  fdcObjectServices;

{$R *.dfm}

procedure TSubjectFilialGridForm.OnSearchFinished(const ADragObject: TfdcDragObject);
var
  i : Integer;
begin
  try
    for i := 0 to ADragObject.Objects.Count - 1 do
      sqlUpdateParent.exec('pId;pParentId',[ADragObject.Objects[i].Id,ParamsHolder.Params[0].Value]);
    sqlUpdateParent.QueryList.Session.Commit;
  except
    on E: EOracleSQLError do
    begin
      sqlUpdateParent.QueryList.Session.Rollback;
      fdcMessages.MessageDlg('Ошибка выполнения операции','Добавление филиала',e.Message, mtError,[mbOK],0);
    end;
  end;
  FSearchCount := ADragObject.Objects.Count;
end;

procedure TSubjectFilialGridForm.actAddExecute(Sender: TObject);
var F : TSubjectGridForm;
begin
  FSearchCount := 0;
  F := TSubjectGridForm.Create(Self);
  F.edtINN.Text := ParamsHolder.Params.ParamValues['INN'];
  F.ParamsHolder.Params.ParamByName('ID').Value := ParamsHolder.Params.ParamValues['ID'];
  F.edtINN.Enabled := False;
  F.SearchMode := True;
  F.SearchMultiple := True;
  F.SearchTypeSysName := 'Subject';

  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;

  F.ShowModal;
  F.Free;
  RefreshData;
end;

procedure TSubjectFilialGridForm.actDeleteExecute(Sender: TObject);
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
      sqlRemoveParent.QueryList.Session.Commit;
    except
      sqlRemoveParent.QueryList.Session.Rollback;
    end;
  end;
  RefreshData;
end;

initialization
   RegisterClass(TSubjectFilialGridForm);

end.
