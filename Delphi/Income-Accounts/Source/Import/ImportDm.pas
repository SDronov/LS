{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 807 $
  $Author: alexvolo $
  $Date: 2005-12-30 13:42:13 +0400 (Пт, 30 дек 2005) $
}

unit ImportDm;

interface

uses
  SysUtils, Classes, DB, FDCCustomDataset, fdcQuery, Dialogs, MainDm,
  Oracle;

  
type
  TImportData = class(TDataModule)
    dsInsertNsiDict: TfdcQuery;
    dsUpdateNsiDict: TfdcQuery;
    dsSearchPaymentType: TfdcQuery;
    dsInsertCustoms: TfdcQuery;
    dsUpdateCustoms: TfdcQuery;
    dsSearchCustoms: TfdcQuery;
    dlgOpen: TOpenDialog;
    dsInsertBroker: TfdcQuery;
    dsUpdateBroker: TfdcQuery;
    dsSearchBroker: TfdcQuery;
    dsSearchSubjectCategory: TfdcQuery;
    dsInsertNsiCurrency: TfdcQuery;
    dsSearchNsiCurrency: TfdcQuery;
    dsSearchNsiCurrRate: TfdcQuery;
    dsSearchBank: TfdcQuery;
    dsSearchDeclarant: TfdcQuery;
    dsUpdateNsiCurrency: TfdcQuery;
    dsInsertNsiCurrRate: TfdcQuery;
    dsUpdateNsiCurrRate: TfdcQuery;
    dsInsertBank: TfdcQuery;
    dsUpdateBank: TfdcQuery;
    dsInsertDeclarant: TfdcQuery;
    dsUpdateDeclarant: TfdcQuery;
    dsInsertPaymentOrder: TfdcQuery;
    dsUpdatePaymentOrder: TfdcQuery;
    dsSearchPaymentOrder: TfdcQuery;
    dsSearchSubject: TfdcQuery;
    fdcInsertDeclAccount: TfdcQuery;
    fdcSearchDeclAccount: TfdcQuery;
    dsUniInsert: TfdcQuery;
    dsUniUpdate: TfdcQuery;
    dsCurrList: TfdcQuery;
    dsInsertNsiRefinancingRate: TfdcQuery;
    dsUpdateNsiRefinancingRate: TfdcQuery;
    dsSearchNsiRefinancingRate: TfdcQuery;
    qryInsRate: TOracleQuery;
    procedure qryInsRateArrayError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: String;
      var Continue: Boolean);
  private
  public
  end;
                             
var
  ImportData: TImportData;

implementation

{$R *.dfm}

procedure TImportData.qryInsRateArrayError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: String; var Continue: Boolean);
begin
;
end;

end.
