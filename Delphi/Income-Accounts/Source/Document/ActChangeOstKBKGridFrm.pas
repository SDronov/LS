unit ActChangeOstKBKGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocumentGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCheckBox, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxDropDownEdit,
  cxMaskEdit, cxTextEdit, cxButtons, ExtCtrls, cxProgressBar, cxSpinEdit,
  cxLabel, dxStatusBar, QueryList, OracleData, cxCurrencyEdit;

type
  TActChangeOstKBKGridForm = class(TDocumentGridForm)
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataIS_TS: TStringField;
    dsDataPERSONAL_ACCOUNT_ID: TFloatField;
    dsDataSIGNED_BY: TStringField;
    dsDataSIGNED_BY_CHIEF: TStringField;
    dsDataSIGN_DATE: TDateTimeField;
    dsDataSUMMA: TFloatField;
    grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCYCODE: TStringField;
    grdDataDBBandedTableViewCURRENCYCODE: TcxGridDBBandedColumn;
    dsCurrency: TOracleDataSet;
    QueryList: TQueryList;
    sqlGetActChangeKBK: TsqlOp;
    sqlCreateNewActChangeKBK: TsqlOp;
    sqlGetRestrictChangeKBK: TsqlOp;
    sqlAddInActPays: TsqlOp;
    procedure actAddExecute(Sender: TObject);
  private
  protected
    procedure ProcessActPays;
  public
  end;


implementation

uses fdcMessages;

{$R *.dfm}
procedure TActChangeOstKBKGridForm.ProcessActPays;
  var
    vActId : integer;
    vDocName : string;
begin
  dsCurrency.Open;
  dsCurrency.First;
  with dsCurrency do
    while not Eof do
    // для каждой Валюты проверить наличие акта
      begin
        vDocName := sqlGetRestrictChangeKBK.Exec;
        if vDocName = '-' then
        begin
          vActId := sqlGetActChangeKBK.Exec;
          if vActId = -1 then // если нет акта, то создать
            vActId := sqlCreateNewActChangeKBK.Exec
          else
          begin
            if ConfirmDlg(
                   'Добавить платежи в существующий акт?'
                  ,format( 'Для валюты <%s> уже есть акт.'
                          ,[FieldValues['curr_code']] )
                  ,''
                 ) <> mrYes then
             vActId := -1;
          end;
          // если акт создан или выбран
          if vActId <> -1 then
            sqlAddInActPays.Exec( 'ActId', [ vActId ]);
        end
        else
          MessageDlg(
              'Невозможно сформировать акт о переносе остатков с закрытых КБК!'
             ,format( 'Для валюты <%s> есть неподписанный документ:'+ #10#13 + vDocName + ' !'
                     ,[FieldValues['curr_code']] )
             ,''
             ,mtError, [mbOK], 0
             );
        Next;
      end;
  dsCurrency.Close;
end;


procedure TActChangeOstKBKGridForm.actAddExecute(Sender: TObject);
begin
//  inherited;
  ProcessActPays;

  RefreshData;
end;

initialization
  RegisterClass(TActChangeOstKBKGridForm);

end.
