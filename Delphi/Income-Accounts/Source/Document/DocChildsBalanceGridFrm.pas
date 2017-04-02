unit DocChildsBalanceGridFrm;

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
  cxLabel, dxStatusBar, JvSimpleXml, JvDialogs, Oracle;

type
  TDocChildsBalanceGridForm = class(TDocumentGridForm)
    dsDataCUSTOMS_ID: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataDATE_FROM: TDateTimeField;
    dsDataDATE_TO: TDateTimeField;
    dsDataCURRENCY_CODE: TStringField;
    dsDataCURRENCY_NAME: TStringField;
    dsDataCUSTOMS_CODE: TStringField;
    dsDataCUSTOMS_NAME: TStringField;
    grdDataDBBandedTableViewDATE_FROM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_TO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOMS_NAME: TcxGridDBBandedColumn;
    xmlBalance: TJvSimpleXML;
    openDlgBalance: TJvOpenDialog;
    qryAddChildBalance: TOracleQuery;
    qryAddTmpTransaction: TOracleQuery;
    qryDoLoad: TOracleQuery;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocChildsBalanceGridForm: TDocChildsBalanceGridForm;

implementation

{$R *.dfm}

uses
  MainDm, fdcCustomDBDataFrm;

procedure TDocChildsBalanceGridForm.actAddExecute(Sender: TObject);
  var
    xmlNode      : TJvSimpleXMLElem;
    nodeIndex    : Integer;

    lv_BalanceID : Double;
    lv_Errors    : TLOBLocator;
    i            : Integer;
    idx          : Integer;
    lv_Formats   : TFormatSettings;

    sum_010101 : Double;

    account_code
   ,currency_code
   ,pay_type_code
   ,kbk
   ,is_debit
   ,operation_date
   ,operation_sum
   ,exch_rate
   ,sum_rur
   ,is_ts      : Variant;

    OldCursor : TCursor;

  const
    recInsert : Integer = 1000;
begin
  if openDlgBalance.Execute then
    try
      OldCursor     := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      try
        xmlBalance.LoadFromFile( openDlgBalance.FileName );

        with qryAddChildBalance, xmlBalance.Root do
          begin
            SetVariable( 'customs_code',  Properties.Value( 'CustomsCode'  )  );
            SetVariable( 'currency_code', Properties.Value( 'CurrencyCode' ) );
            SetVariable( 'date_from',     Properties.Value( 'DateFrom'     ) );
            SetVariable( 'date_to',       Properties.Value( 'DateTo'       ) );
            if Properties.Value( 'BalanceType', 'blCustom' ) = 'blCustom' then
              SetVariable( 'balance_type',  0 )
            else
              SetVariable( 'balance_type',  1 );

            Execute;

            lv_BalanceID := GetVariable( 'id' );
          end;

        nodeIndex := xmlBalance.Root.Items.IndexOf( 'Transactions' );
        if (nodeIndex = -1) then
          begin
            qryAddChildBalance.Session.Rollback;
            MessageDlg('Загружаемый баланс подчинённого ТО не содержит ни одной транзакции!', mtInformation, [mbOk], 0); ;
          end
        else
          begin
            xmlNode := xmlBalance.Root.Items[ nodeIndex ];

            account_code   := VarArrayCreate( [0, recInsert - 1], varVariant );
            currency_code  := VarArrayCreate( [0, recInsert - 1], varVariant );
            pay_type_code  := VarArrayCreate( [0, recInsert - 1], varVariant );
            kbk            := VarArrayCreate( [0, recInsert - 1], varVariant );
            is_debit       := VarArrayCreate( [0, recInsert - 1], varVariant );
            operation_date := VarArrayCreate( [0, recInsert - 1], varDate    );
            operation_sum  := VarArrayCreate( [0, recInsert - 1], varDouble  );
            exch_rate      := VarArrayCreate( [0, recInsert - 1], varDouble  );
            sum_rur        := VarArrayCreate( [0, recInsert - 1], varDouble  );
            is_ts          := VarArrayCreate( [0, recInsert - 1], varVariant );

            GetLocaleFormatSettings( GetThreadLocale, lv_Formats );
            lv_Formats.DateSeparator    := '-';
            lv_Formats.ShortDateFormat  := 'YYYY-MM-DD';
            lv_Formats.LongDateFormat   := 'YYYY-MM-DD';
            lv_Formats.DecimalSeparator := '.';

            with qryAddTmpTransaction do
              begin
                DimPLSQLTable( 'account_code',   recInsert, 16 );
                DimPLSQLTable( 'currency_code',  recInsert,  3 );
                DimPLSQLTable( 'pay_type_code',  recInsert,  4 );
                DimPLSQLTable( 'kbk',            recInsert, 20 );
                DimPLSQLTable( 'is_debit',       recInsert,  1 );
                DimPLSQLTable( 'operation_date', recInsert,  0 );
                DimPLSQLTable( 'operation_sum',  recInsert,  0 );
                DimPLSQLTable( 'exch_rate',      recInsert,  0 );
                DimPLSQLTable( 'sum_rur',        recInsert,  0 );
                DimPLSQLTable( 'is_ts',          recInsert,  1 );
              end;

            sum_010101 := 0;
            for i := 0 to xmlNode.Items.Count - 1 do
              with qryAddTmpTransaction, xmlNode.Items[i] do
                begin
                  idx := i mod recInsert;
                  account_code  [ idx ] := Properties.Value( 'Account'         );
                  currency_code [ idx ] := Properties.Value( 'CurrencyCode'    );
                  pay_type_code [ idx ] := Properties.Value( 'PaymentType'     );
                  kbk           [ idx ] := Properties.Value( 'KBK'             );
                  is_debit      [ idx ] := Properties.Value( 'IsDebit'         );
                  operation_date[ idx ] := StrToDate ( Properties.Value( 'TransactionDate' ), lv_Formats );
                  operation_sum [ idx ] := StrToFloat( Properties.Value( 'TransactionSum'  ), lv_Formats );
                  exch_rate     [ idx ] := StrToFloat( Properties.Value( 'ExchRate'        ), lv_Formats );
                  sum_rur       [ idx ] := StrToFloat( Properties.Value( 'SumRUR'          ), lv_Formats );
                  is_ts         [ idx ] := Properties.Value( 'IsTs'         );

                  if i mod recInsert = recInsert - 1 then
                    begin
                      SetVariable( 'account_code',   account_code   );
                      SetVariable( 'currency_code',  currency_code  );
                      SetVariable( 'pay_type_code',  pay_type_code  );
                      SetVariable( 'kbk',            kbk            );
                      SetVariable( 'is_debit',       is_debit       );
                      SetVariable( 'operation_date', operation_date );
                      SetVariable( 'operation_sum',  operation_sum  );
                      SetVariable( 'exch_rate',      exch_rate      );
                      SetVariable( 'sum_rur',        sum_rur        );
                      SetVariable( 'is_ts',          is_ts          );

                      SetVariable( 'idx_first', 1 );
                      SetVariable( 'idx_last',  recInsert );

                      Execute;
                    end;
                end;

            with qryAddTmpTransaction do
              begin
                SetVariable( 'account_code',   account_code   );
                SetVariable( 'currency_code',  currency_code  );
                SetVariable( 'pay_type_code',  pay_type_code  );
                SetVariable( 'kbk',            kbk            );
                SetVariable( 'is_debit',       is_debit       );
                SetVariable( 'operation_date', operation_date );
                SetVariable( 'operation_sum',  operation_sum  );
                SetVariable( 'exch_rate',      exch_rate      );
                SetVariable( 'sum_rur',        sum_rur        );
                SetVariable( 'is_ts',          is_ts          );

                SetVariable( 'idx_first', 1 );
                SetVariable( 'idx_last',  xmlNode.Items.Count mod recInsert );

                Execute;
              end;

            lv_Errors := TLOBLocator.CreateTemporary( qryDoLoad.Session, otCLOB, True );
            qryDoLoad.SetVariable( 'child_balance_id', lv_BalanceID );
            qryDoLoad.SetComplexVariable( 'err_report', lv_Errors );
            qryDoLoad.Execute;

            if lv_Errors.IsNull then
              begin
                qryAddChildBalance.Session.Commit;
                MessageDlg('Баланс подчинённого ТО загружен!', mtInformation, [mbOk], 0); ;
              end
            else
              raise Exception.Create( lv_Errors.AsString );
          end;
      except
        on E : Exception do
          begin
            qryAddChildBalance.Session.Rollback;
            raise;
          end;
      end;
    finally
      xmlBalance.Root.Clear;
      Screen.Cursor := OldCursor;
      actRefresh.Execute;
    end;
end;

initialization
  RegisterClass( TDocChildsBalanceGridForm );

end.
