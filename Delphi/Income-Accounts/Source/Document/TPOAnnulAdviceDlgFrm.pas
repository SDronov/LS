unit TPOAnnulAdviceDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, FDCCustomDataset, fdcQuery, QueryList,
  cxTextEdit, cxCalendar, cxCheckBox;

type
  TTPOAnnulAdviceDlgForm = class(TfdcCustomDlgForm)
    QueryList1: TQueryList;
    sqlModifyAdvice: TsqlOp;
    dsAdvice: TfdcQuery;
    srcAdvice: TDataSource;
    dxLayoutControl1Item1: TdxLayoutItem;
    grdAdvice: TcxGrid;
    grdAdviceDBTableView1: TcxGridDBTableView;
    grdAdviceLevel1: TcxGridLevel;
    grdAdviceDBTableView1ADVICE_ID: TcxGridDBColumn;
    grdAdviceDBTableView1DOC_NUMBER: TcxGridDBColumn;
    grdAdviceDBTableView1DOC_DATE: TcxGridDBColumn;
    grdAdviceDBTableView1DECL_NAME: TcxGridDBColumn;
    dsAdviceADVICE_ID: TFloatField;
    dsAdviceDOC_NUMBER: TStringField;
    dsAdviceDOC_DATE: TDateTimeField;
    dsAdviceDECL_NAME: TStringField;
    grdAdviceDBTableView1TO_OPEN: TcxGridDBColumn;
    dsAdviceTO_OPEN: TFloatField;
    procedure actOkExecute(Sender: TObject);
  private
    procedure ModifyAdviceParams();
  public
  end;

function OpenAdvicePayTPOList(DeclId: double): Boolean;

implementation

uses fdcMessages, ObjServices;

{$R *.dfm}
function OpenAdvicePayTPOList(DeclId: double): Boolean;
var
  F: TTPOAnnulAdviceDlgForm;
  RecCount: integer;
  i: integer;
begin
  Result := False;
  F := TTPOAnnulAdviceDlgForm.Create(nil);
  try
    F.actOk.OnExecute := F.actOkExecute;
    F.dsAdvice.ParamByName('DECL_ID').AsFloat := DeclId;
    F.dsAdvice.Open;
    if (F.dsAdvice.RecordCount > 0) then
    begin
      if (F.ShowModal = mrOK) then
        with F.grdAdviceDBTableView1.ViewData,
             F.grdAdviceDBTableView1.Controller,
             F.grdAdviceDBTableView1.DataController do
        begin
          RecCount := RecordCount;
          for i:=0 to RecCount-1 do
          begin
            FocusedRecord := Records[i];
            if (F.dsAdviceTO_OPEN.Value = 1) and (F.dsAdviceADVICE_ID.Value > 0) then
              GetObjectServices.OpenObject( F.dsAdviceADVICE_ID.Value, nil );
          end;
          Result := True;
        end;
    end
    else
    begin
      InfoDlg('При аннулировании ТПО уведомления не были созданы.');
      Result := True;
    end;
  finally
    F.Free;
  end;
end;

procedure TTPOAnnulAdviceDlgForm.actOkExecute(Sender: TObject);
begin
  inherited;
  try
    QueryList1.Session.Savepoint( 'ModifyAdvice' );
    ModifyAdviceParams();
//    QueryList1.Session.Commit;
  except
    QueryList1.Session.RollbackToSavepoint( 'ModifyAdvice' );
    raise;
  end;
  ModalResult := mrOK;
end;

procedure TTPOAnnulAdviceDlgForm.ModifyAdviceParams();
var
  i: integer;
  SavePosition: TBookmark;
  BreakProcess: boolean;
  ProgressDescr: string;
  RecCount: integer;
begin
  BreakProcess := False;
  ProgressDescr := '';
  with grdAdviceDBTableView1.ViewData,
       grdAdviceDBTableView1.Controller,
       grdAdviceDBTableView1.DataController do begin
    { save current position }
    SavePosition := dsAdvice.GetBookmark;
    try
      { get iteration count }
      RecCount := RecordCount;
      { iterate records }
      for i:=0 to RecCount-1 do begin
        { go to the record }
        FocusedRecord := Records[i];
        { execute }
        //**********************************
        sqlModifyAdvice.Exec;

        //**********************************
        { check form destroying }
        if BreakProcess then Break;
      end;
      { return to the saved position }
      dsAdvice.GotoBookmark(SavePosition);
    finally
      if not (csDestroying in ComponentState) then
      begin
        { free temporary bookmark }
        dsAdvice.FreeBookmark(SavePosition);
      end;
    end;
  end;
end;

end.
