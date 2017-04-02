unit TPOErrorGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomDeclErrorGridFrm, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, QueryList, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TTPOErrorGridForm = class(TCustomDeclErrorGridForm)
    sqlActivateTR: TsqlOp;
    sqlGetTypesysname: TsqlOp;
    procedure actPayExecute(Sender: TObject);
    procedure actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TPOErrorGridForm: TTPOErrorGridForm;

implementation

{$R *.dfm}

uses SelectPOWizardFrm, fdcCustomDataFrm;

procedure TTPOErrorGridForm.actPayExecute(Sender: TObject);
begin
//  inherited;
  dsRestList.ParamByName('ID').Value := dsDataOWNER_OBJECT_ID.Value;
  dsRestList.Open;
  try
    try
      while not dsRestList.Eof do
      begin
        if ((sqlGetTypesysname.Exec('decl_id',Params.ParamByName('ID').Value) = 'TR')
            or
            (sqlGetTypesysname.Exec('decl_id',Params.ParamByName('ID').Value) = 'TrDuplicate')) then
        begin
          sqlStartPay['result'] := 0.0;
          sqlStartPay.Exec('decl_id;currency_id;kbkcode_Id;kbkcode_Id_in',[Params.ParamByName('ID').Value,dsRestList['currency_id'],dsRestList['kbkcode_id'],dsRestList['kbkcode_id_in']]);

       if not ShowPaymentWizard(sqlStartPay['result'], dsRestList['currency_id']
                  ,False, dsRestList['rate_date'], FSubjectId, False, dsRestList['kbkcode_id_in'],1,Params.ParamByName('ID').AsString) then
          begin
           dsRestList.Session.Rollback;
           Exit;
          end;
         end
        else
         begin
          sqlStartPay['result'] := 0.0;
          sqlStartPay.Exec('decl_id;currency_id;kbkcode_Id',[Params.ParamByName('ID').Value,dsRestList['currency_id'],dsRestList['kbkcode_id']]);
          if not ShowPaymentWizard(sqlStartPay['result'], dsRestList['currency_id']
                  ,False, dsRestList['rate_date'], FSubjectId, False, dsRestList['kbkcode_id'],1,Params.ParamByName('ID').AsString ) then
          begin
           dsRestList.Session.Rollback;
           Exit;
          end;
         end;
        dsRestList.Next;
      end;
      sqlCheckPayments.Exec;
      //-- проведение ТР
      sqlActivateTR.ParamValues['tr_id'] := Params.ParamByName('ID').Value;
      sqlActivateTR.Exec;
      //--
      RefreshData;
      RefreshWaiters;
    except
      dsRestList.Session.Rollback;
      raise;
    end;
  finally
    dsRestList.Close;
  end;
end;

procedure TTPOErrorGridForm.actExecuteExecute(Sender: TObject);
begin
  inherited;
  //-- проведение ТР
  sqlActivateTR.ParamValues['tr_id'] := Params.ParamByName('ID').Value;
  sqlActivateTR.Exec;
  //--
end;

initialization
     RegisterClass(TTPOErrorGridForm);

end.
