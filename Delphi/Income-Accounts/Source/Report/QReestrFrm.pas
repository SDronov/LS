{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 880 $
  $Author: charushin $
  $Date: 2006-01-25 14:54:58 +0400 (РЎСЂ, 25 СЏРЅРІ 2006) $
}
unit QReestrFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxLookAndFeelPainters, DB, xlcClasses,
  xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxLookAndFeels, dxLayoutLookAndFeels,
  ActnList, dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle,
  dxmdaset, fdcObjectCore, Grids, DBGrids;

type
  TQReestrForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Item2: TdxLayoutItem;
    cmbxedtCurrID: TfdcObjectLookupEdit;
    edtFrom: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    srcMain: TDataSource;
    xlrDeclarant: TxlReport;
    dsDeclMain: TfdcQuery;
    fdcQuery2: TfdcQuery;
    DataSource3: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1FROM_DATE: TDateField;
    dxMemData1TO_DATE: TDateField;
    dxMemData1CURR_ID: TFloatField;
    DataSource1: TDataSource;
    fdcQuery1: TfdcQuery;
    dxMemData1Make_Date: TDateField;
    procedure actOkExecute(Sender: TObject);
  private
  public
  end;


  function  ExecReport(Session: TOracleSession): Boolean; overload;

implementation

uses
  qReportUtil, 
  fdcObjectServices,
  fdcCustomObjectGridFrm;

{$R *.dfm}


function  ExecReport(Session: TOracleSession): Boolean;
begin
  with TQReestrForm.Create(nil) do
  try
    dsDeclMain.Session := Session;
    fdcQuery2.Session := Session;
    fdcQuery1.Session := Session;
    dxMemData1.Open;
    dxMemData1.Insert;
    dxMemData1Make_Date.Value := Now;
    xlrDeclarant.XLSTemplate := ExtractFilePath(Application.ExeName) + '\report\' +
                                ExtractFileName(xlrDeclarant.XLSTemplate);
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;


procedure TQReestrForm.actOkExecute(Sender: TObject);
begin
  dxMemData1.UpdateRecord;
  // --- check input params
  CheckDate(dxMemData1Make_Date);
  if dxMemData1Curr_Id.IsNull then
    raise exception.Create('Необходимо выбрать валюту');
  // --- generate report
  dsDeclMain.Open;
  fdcQuery2.Open;
  fdcQuery1.Open;
  try
    xlrDeclarant.Report(True);
    ModalResult := mrOk;
  finally
    dsDeclMain.Close;
    fdcQuery2.Close;
    fdcQuery1.Close;
  end;
end;


End.

