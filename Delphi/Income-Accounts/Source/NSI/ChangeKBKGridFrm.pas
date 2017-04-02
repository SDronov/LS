unit ChangeKBKGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  ObjectGridFrm, cxCalendar, Oracle, QueryList;

type
  TChangeKBKGridForm = class(TObjectGridForm)
    dxBarButton1: TdxBarButton;
    actImportExecute: TAction;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataFROM_KBKCODE: TStringField;
    dsDataTO_KBKCODE: TStringField;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    grdDataDBBandedTableViewFROM_KBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTO_KBKCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn;
    actExportExecute: TAction;
    dxBarButton2: TdxBarButton;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    qryChangeKBKAsXML: TOracleQuery;
    qryXMLToChangeKBK: TOracleQuery;
    QueryList1: TQueryList;
    sqlAddTrans: TsqlOp;
    dsDataSTATE_NAME: TStringField;
    grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn;
    sqlAddTransJob: TsqlOp;
    procedure actImportExecuteExecute(Sender: TObject);
    procedure actExportExecuteExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MainDm, fdcMessages;

{$R *.dfm}

procedure TChangeKBKGridForm.actImportExecuteExecute(Sender: TObject);
var
  LOB: TLOBLocator;
  XMLFile : TFileName;
//  l_KBKCount : Integer;
begin
  if (MainData.GetCustomsLevel = 0) then
    MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровнях РТУ или таможни','Данное действие запрещено!',mtError,[mbOk],0)
  else
  begin
    inherited;
    LOB := TLOBLocator.CreateTemporary(qryXMLToChangeKBK.Session, otCLOB, True);
    try
      if dlgOpen.Execute then
      begin
        XMLFile := dlgOpen.FileName;
        if not FileExists(XMLFile) then
          raise Exception.CreateFmt('Файл <%s> не найден!', [XMLFile]);
        LOB.LoadFromFile(XMLFile);
        if LOB.IsNull then
          raise Exception.CreateFmt('Файл <%s> не содержит данных!', [XMLFile]);
        qryXMLToChangeKBK.SetComplexVariable('XMLCLOB', LOB);
        qryXMLToChangeKBK.Execute;
        qryXMLToChangeKBK.Session.Commit;
      end;
    finally
      LOB.Free;
      actRefresh.Execute;
    end;
    sqlAddTrans.Exec;
    sqlAddTransJob.Exec;
    dsData.Session.Commit;
  end;

end;

procedure TChangeKBKGridForm.actExportExecuteExecute(Sender: TObject);
var
  LOB: TLOBLocator;
begin
  if (MainData.GetCustomsLevel = 0) then
  begin
    inherited;
    LOB := TLOBLocator.Create(qryChangeKBKAsXML.Session, otCLOB);
    try
      qryChangeKBKAsXML.SetComplexVariable('XMLCLOB', LOB);
      qryChangeKBKAsXML.Execute;
      if not LOB.IsNull and dlgSave.Execute then
        LOB.SaveToFile(dlgSave.FileName);
    finally
      LOB.Free;
      actRefresh.Execute;
    end;
    sqlAddTrans.Exec;
    sqlAddTransJob.Exec;
    dsData.Session.Commit;
  end
  else
    fdcMessages.MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровне ФТС','Данное действие запрещено!',mtError,[mbOk],0);

end;

procedure TChangeKBKGridForm.actAddExecute(Sender: TObject);
begin
  if MainData.GetCustomsLevel = 0 then
    inherited
  else
    MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровне ФТС','Данное действие запрещено!',mtError,[mbOk],0);
end;

procedure TChangeKBKGridForm.actDeleteExecute(Sender: TObject);
begin
  if MainData.GetCustomsLevel = 0 then
    inherited
  else
    MessageDlg('Ошибка выполнения операции','Данное действие разрешено только на уровне ФТС','Данное действие запрещено!',mtError,[mbOk],0);
end;

procedure TChangeKBKGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if dsData.RecordCount > 0 then grdDataDBBandedTableView.ApplyBestFit;
end;

initialization
  RegisterClass(TChangeKBKGridForm);

end.
