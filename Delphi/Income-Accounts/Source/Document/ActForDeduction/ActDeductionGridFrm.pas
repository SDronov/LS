unit ActDeductionGridFrm;

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
  cxLabel, dxStatusBar, cxCurrencyEdit, QueryList, OracleData;

type
  TActDeductionGridForm = class(TDocumentGridForm)
    dsDataSIGN_DATE: TDateTimeField;
    dsDataCURRENCYCODE: TStringField;
    dsDataSUMMA: TFloatField;
    grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCYCODE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn;
    QueryList: TQueryList;
    sqlGetActPays: TsqlOp;
    sqlCreateNewActPays: TsqlOp;
    sqlAddInActPays: TsqlOp;
    ds3yearReserv: TOracleDataSet;
    sqlGetActDeposit: TsqlOp;
    dsDeposit: TOracleDataSet;
    sqlCreateNewActDeposit: TsqlOp;
    sqlAddInActDeposits: TsqlOp;
    dsOverPay: TOracleDataSet;
    sqlGetActOverPay: TsqlOp;
    sqlCreateNewActOverPay: TsqlOp;
    sqlAddInActOverPays: TsqlOp;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataSUBJECTNAME: TStringField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSubjectName: TcxGridDBBandedColumn;
    dsDataSTATENAME: TStringField;
    grdDataDBBandedTableViewStateName: TcxGridDBBandedColumn;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    procedure actAddExecute(Sender: TObject);
  private
  protected
    procedure ProcessActPays;
    procedure ProcessActOverPay;
    procedure ProcessActDeposit;
  public
    { Public declarations }
  end;

implementation

uses fdcMessages, fdcCustomDBDataFrm, MainDm;

{$R *.dfm}

procedure TActDeductionGridForm.actAddExecute(Sender: TObject);
begin
 // inherited;
 ProcessActPays;
 ProcessActOverPay;
 ProcessActDeposit;

 RefreshData;
end;

procedure TActDeductionGridForm.ProcessActDeposit;
  var
    vActId : integer;
begin
 try
  dsDeposit.Open;
  dsDeposit.First;
  with dsDeposit do
    while not Eof do
    // ��� ������ ���� ����������, ������ ��������� ������� ����
      begin
        vActId := -1;
        sqlGetActDeposit.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'], FieldValues['is_ts']]);
        vActId := sqlGetActDeposit[ 'act_id' ];
        if vActId = -1 then // ���� ��� ����, �� �������
          vActId := sqlCreateNewActDeposit.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'], FieldValues['Is_ts']])
        else // ���� ��� ����, ��������� ������
          begin
            if sqlGetActDeposit['State'] <> 'State.ActDeduction.Created' then
              begin
                WarningDlg(
                    '���������� ������������ ��� �� �������� ���������������� �������� �������!'
                   ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� �������������� ���!'
                           ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                   ,''
                  );
                vActId := -1;
              end
            else // ���� ��� � ������� ������, �������� ������������
              if ConfirmDlg(
                     '�������� ������� � ������������ ���?'
                    ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� ���.'
                            ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                    ,''
                   ) <> mrYes then
                vActId := -1;

          end;
        if vActId <> -1 then
          begin
            sqlAddInActDeposits.Exec( 'ActId', [ vActId ]);
            dsData.Session.Commit;
          end;
        Next;
      end;
  //-- �������� ���������
  MainData.Session.Commit;
 except
   on e:Exception do
     begin
       MainData.Session.Rollback;
       fdcMessages.MessageDlg('������ ������������/�������������� ����� �� �������� ���������������� �������� �������','',e.Message, mtError,[mbOK],0);
     end;
 end;
end;

procedure TActDeductionGridForm.ProcessActOverPay;
  var
    vActId : integer;
begin
 try
  dsOverPay.Open;
  dsOverPay.First;
  with dsOverPay do
    while not Eof do
    // ��� ������ ���� ����������, ������ ��������� ������� ����
      begin
        vActId := -1;
        sqlGetActOverPay.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'],FieldValues['is_ts']]);
        vActId := sqlGetActOverPay[ 'act_id' ];
        if vActId = -1 then // ���� ��� ����, �� �������
          vActId := sqlCreateNewActOverPay.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'],FieldValues['is_ts']])
        else // ���� ��� ����, ��������� ������
          begin
            if sqlGetActOverPay['State'] <> 'State.ActDeduction.Created' then
              begin
                WarningDlg(
                    '���������� ������������ ��� �� �������� ���������������� �������� ������/���������!'
                   ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� �������������� ���!'
                           ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                   ,''
                  );
                vActId := -1;
              end
            else // ���� ��� � ������� ������, �������� ������������
              if ConfirmDlg(
                     '�������� ����������� � ������������ ���?'
                    ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� ���.'
                            ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                    ,''
                   ) <> mrYes then
                vActId := -1;

          end;
        if vActId <> -1 then
          begin
            sqlAddInActOverPays.Exec( 'ActId', [ vActId ]);
            dsData.Session.Commit;
          end;
        Next;
      end;
  //-- �������� ���������
  MainData.Session.Commit;
 except
   on e:Exception do
     begin
       MainData.Session.Rollback;
       fdcMessages.MessageDlg('������ ������������/�������������� ����� �� �������� ���������������� �������� ������/���������','',e.Message, mtError,[mbOK],0);
     end;
 end;
end;

procedure TActDeductionGridForm.ProcessActPays;
  var
    vActId : integer;
begin
 try
  ds3yearReserv.Open;
  ds3yearReserv.First;
  with ds3yearReserv do
    while not Eof do
    // ��� ������ ���� ����������, ������ ��������� ������� ����
      begin
        vActId := -1;
        sqlGetActPays.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'],FieldValues['is_ts']]);
        vActId := sqlGetActPays[ 'act_id' ];
        if vActId = -1 then // ���� ��� ����, �� �������
          vActId := sqlCreateNewActPays.Exec('CurrencyId;SubjectId;IsTS', [FieldValues['currency_id'], FieldValues['payer_id'], FieldValues['is_ts']])
        else // ���� ��� ����, ��������� ������
          begin
            if sqlGetActPays['State'] <> 'State.ActDeduction.Created' then
              begin
                WarningDlg(
                    '���������� ������������ ��� �� �������� ���������������� ��������!'
                   ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� �������������� ���!'
                           ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                   ,''
                  );
                vActId := -1;
              end
            else // ���� ��� � ������� ������, �������� ������������
              if ConfirmDlg(
                     '�������� ������� � ������������ ���?'
                    ,format( '�� ������� ���� ��� ��������� ��� <%s> � ������ <%s> ��� ���� ���.'
                            ,[FieldValues['PayerName'], FieldValues['curr_code']] )
                    ,''
                   ) <> mrYes then
                vActId := -1;

          end;
        if vActId <> -1 then
          begin
            sqlAddInActPays.Exec( 'ActId', [ vActId ]);
            dsData.Session.Commit;
          end;
        Next;
      end;
  //-- �������� ���������
  MainData.Session.Commit;
 except
   on e:Exception do
     begin
       MainData.Session.Rollback;
       fdcMessages.MessageDlg('������ ������������/�������������� ����� �� �������� ���������������� ��������','',e.Message, mtError,[mbOK],0);
     end;
 end;
end;

initialization
  RegisterClass(TActDeductionGridForm);
end.
