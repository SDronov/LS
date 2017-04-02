unit RManCDeclGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CDeclBaseGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxSpinEdit, cxLabel, dxStatusBar, QueryList, fdcObjectCore;

type
  TRManCDeclGridForm = class(TCDeclBaseGridForm)
    QueryList2: TQueryList;
    sqlAddDecl: TsqlOp;
    sqlDelDecl: TsqlOp;
    dsDataRELATION_ID: TFloatField;
    sqlAddTr: TsqlOp;
    sqlDelTr: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OnSearchFinished(const ADragObject: TfdcDragObject);
  protected
    procedure DoDeleteObject; override;
  public
  end;

implementation

{$R *.dfm}

procedure TRManCDeclGridForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TCDeclFindGridForm', 'CustomDecl;CustomDeclTempAdm;TPO;TR', 0, nil, nil, True, OnSearchFinished);
end;

procedure TRManCDeclGridForm.OnSearchFinished(const ADragObject: TfdcDragObject);
var
  i : Integer;
begin
  try
    for i := 0 to ADragObject.Objects.Count - 1 do
    begin
      sqlAddDecl.Exec('RMAN_ID;DECL_ID', [Params.ParamValues['ID'], ADragObject.Objects[i].ID]);
      sqlAddTR.Exec('RMAN_ID;DECL_ID',[Params.ParamValues['ID'], ADragObject.Objects[i].ID]);
    end;
    QueryList2.Session.Commit;
    RefreshData;
    RefreshWaiters;
  except
    QueryList2.Session.Rollback;
    raise;
  end;
end;

procedure TRManCDeclGridForm.FormShow(Sender: TObject);
begin
  inherited;
  cmbxViewMode.Visible := ivNever;
  cmbxCustCode.Visible := ivNever;
end;

procedure TRManCDeclGridForm.DoDeleteObject;
begin
  try
    sqlDelTR.Exec('RMAN_ID', [Params.ParamValues['ID']]);
    sqlDelDecl.Exec;
    QueryList2.Session.Commit;
  except
    QueryList2.Session.Rollback;
    raise;
  end;
end;

initialization
  RegisterClass(TRManCDeclGridForm);

end.
