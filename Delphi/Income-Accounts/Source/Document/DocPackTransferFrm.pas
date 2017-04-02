unit DocPackTransferFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer, fdcUtils,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, cxButtonEdit, fdcObjectLinkEdit, Oracle, fdcMessages,
  QueryList;

type
  TDocPackTransferForm = class(TDocPackForm)
    IcGrpAdr: TdxLayoutGroup;
    lciReciever: TdxLayoutItem;
    fdcCustomNameIN: TfdcObjectLinkEdit;
    lciSender: TdxLayoutItem;
    fdcCustomNameOUT: TfdcObjectLinkEdit;
    dsDataCUSTOMS_OUT_ID: TFloatField;
    dsDataCUSTOMS_IN_ID: TFloatField;
    dsDataSEND_DATE: TDateTimeField;
    dsDataINCOME_DATE: TDateTimeField;
    dsDataCUSTOMS_OUT_NAME: TStringField;
    dsDataCUSTOMS_IN_NAME: TStringField;
    barBtnSend: TdxBarButton;
    actSend: TAction;
    SaveXML: TSaveDialog;
    pkgDocPackTransfer: TOraclePackage;
    dsDataStateSysName: TStringField;
    dsDataFILE_NAME: TStringField;
    edtFileName: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    edtLOAD_DATE: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    dsDataLOAD_DATE: TDateTimeField;
    actUnSend: TAction;
    barBtnUnSend: TdxBarButton;
    qlSQLResult: TQueryList;
    sqlSendTTP: TsqlOp;
    barBtnSendTTP: TdxBarSubItem;
    btnSendTTP: TdxBarButton;
    btnSendFile: TdxBarButton;
    actSendTTP: TAction;
    procedure actSendExecute(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actUnSendExecute(Sender: TObject);
    procedure actUnSendUpdate(Sender: TObject);
    procedure actSendTTPExecute(Sender: TObject);
  private
    CustomsLevel: integer;
    Exch_OnOffTTP: Variant;
  protected
      function GetDocsFormClassName : string; override;
  public
  end;

implementation

uses
  MainDm
 ,uWizSendFile
 ,fdcCustomCardFrm
  {$ifdef _DEBUG_}
 ,uDebug
  {$endif}
 , fdcCustomObjectFrm;

{$R *.dfm}

function TDocPackTransferForm.GetDocsFormClassName: string;
begin
  Result := 'TDocPackTransferByPackGridForm';
end;

procedure TDocPackTransferForm.actSendExecute(Sender: TObject);
{var
  str  :string;
  F: TextFile;}
var
  wizSendFile: TwizSendFile;
begin
  {$ifdef _DEBUG_}
  WriteDebug( 'Выгрузка конверта...' );
  {$endif}
  if MainData.AppParamExists('DBFUpload') then
    MainData.ConvertTransferPackToDBF(dsData.FieldByName( 'ID' ).AsInteger)
  else
  begin
   wizSendFile:= TwizSendFile.Create(Self,dsData.FieldByName( 'ID' ).AsInteger);
   Try
     if wizSendFile.ShowModal = mrOk  then
       begin
         dsData.Session.commit;
         RefreshData;
       end
       else
         dsData.Session.Rollback;
    finally
      wizSendFile.Free;
    end;
  end;
{  if MainData.AppParamExists('DBFUpload') then
    MainData.ConvertTransferPackToDBF(dsData.FieldByName( 'ID' ).AsInteger)
  else
  if SaveXML.Execute then
   begin
    try
    pkgDocPackTransfer.CallProcedure('Send',[dsData.FieldByName( 'ID' ).AsInteger]);
    except
      on E: Exception do
       begin
       E.Message:='<<Ошибка передачи конверта!>>'+'<<Статус конверта должен быть - "Сформирован".>>>'+E.Message;
       pkgDocPackTransfer.Session.Rollback;
       ErrorDlg(E);
       exit;
       end;
    end;
    pkgDocPackTransfer.Session.Commit;
    AssignFile(F, SaveXML.FileName);
    Rewrite(F);
    str:=pkgDocPackTransfer.CallStringFunction( 'Srlz', [dsData.FieldByName( 'ID' ).AsInteger] );
    Writeln(F, str);
    CloseFile(F);
    RefreshData;
   end;}

  {$ifdef _DEBUG_}
  WriteDebug( 'Выгрузка конверта завершена.' );
  {$endif}
end;

procedure TDocPackTransferForm.actSendUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (dsStateSysName.AsString = 'State.DocPackTransferOUT.Formed') or
                             (dsStateSysName.AsString = 'State.DocPackTransferOUT.Sended');

//  ( Sender as TAction ).Visible := (dsData.FieldByName( 'RECEIVER_SOFT_CODE' ).AsString <> 'EXCH');
end;

procedure TDocPackTransferForm.FormCreate(Sender: TObject);
begin
  inherited;
  CustomsLevel := MainData.GetCustomsLevel;
  dsDataCustoms_In_Id.ReadOnly := (CustomsLevel = 2);
  dsDataCustoms_In_Id.Required := not dsDataCustoms_In_Id.ReadOnly;
  if (CustomsLevel = 2) then
    fdcCustomNameIn.Style.Color := clSilver; //clInactiveCaptionText;
  if CustomsLevel in [ 2, 3, 4 ] then
    itemDstAppName.Tag := 23
  else
    itemDstAppName.Tag := 13;
end;

procedure TDocPackTransferForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  if     not IsNew
     and ( DataSet.FieldByName( 'TypeSysName' ).AsString = 'DocPackTransferIn' ) then
    begin
      lciReciever.Tag   := 33;
      itemDocNumber.Tag := 33;
      itemDocDate.Tag   := 33;

      lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackAlien.Color;
    end;

  if     not IsNew
     and ( DataSet.FieldByName( 'TypeSysName' ).AsString  = 'DocPackTransferOut' )
     and ( DataSet.FieldByName( 'StateSysName' ).AsString <> 'State.DocPackTransferOUT.Created' ) then
    lciReciever.Tag   := 33;

  if     not IsNew
     and ( DataSet.FieldByName( 'TypeSysName' ).AsString  = 'DocPackTransferOut' )
     and ( DataSet.FieldByName( 'StateSysName' ).AsString = 'State.DocPackTransferOUT.Sended' ) then
    begin
      itemDocNumber.Tag := 33;
      itemDocDate.Tag   := 33;

      lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackSended.Color;
    end;
  //--
  inherited;
  //--
  if (Exch_OnOffTTP = 1)and(DataSet.FieldByName( 'TypeSysName' ).AsString = 'DocPackTransferOut') then
    begin
      barBtnSendTTP.Visible := ivAlways;
    end
  else
    begin
      barBtnSendTTP.Visible := ivNever;
    end;
end;

procedure TDocPackTransferForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dsDataDOC_DATE.Value := MainData.GetServerDate;
end;

procedure TDocPackTransferForm.FormShow(Sender: TObject);
begin
  inherited;
  if Self.IsNew then
    Modify(nil);
  //-- Определение состояния переключателя "Взаимодействие с ТТП"
  Exch_OnOffTTP := MainData.GetSystemValue('Exch.OnOffTTP',rvInteger);
  actSendTTP.Visible := (Exch_OnOffTTP = 1);
  if (Exch_OnOffTTP = 1) then
    begin
      btnSendTTP.Visible := ivAlways;
      barBtnSendTTP.Visible := ivAlways;
      barBtnSend.Visible := ivNever;
    end
  else
    begin
      btnSendTTP.Visible := ivNever;
      barBtnSendTTP.Visible := ivNever;
      barBtnSend.Visible := ivAlways;
    end;
end;

procedure TDocPackTransferForm.actUnSendExecute(Sender: TObject);
begin
  if    ( dsData.FieldByName( 'SENDER_SOFT_CODE' ).AsString   <> 'LSFTS' )
     or ( dsData.FieldByName( 'RECEIVER_SOFT_CODE' ).AsString <> 'EXCH'  )
     or ( dsState.FieldByName( 'SysName' ).AsString <> 'State.DocPackTransferOUT.Sended' ) then
    Exit;

  pkgDocPackTransfer.CallProcedure( 'UnSend', [dsData['ID']] );
  pkgDocPackTransfer.Session.Commit;

  RefreshData;
end;

procedure TDocPackTransferForm.actUnSendUpdate(Sender: TObject);
begin
  ( Sender as TAction ).Visible := ( dsData.FieldByName( 'SENDER_SOFT_CODE' ).AsString   = 'LSFTS' )
                               and ( dsData.FieldByName( 'RECEIVER_SOFT_CODE' ).AsString = 'EXCH'  )
                               and ( dsState.FieldByName( 'SysName' ).AsString = 'State.DocPackTransferOUT.Sended' );
end;

procedure TDocPackTransferForm.actSendTTPExecute(Sender: TObject);
begin
  sqlSendTTP.Exec('packid',[dsDataID.AsFloat]);
end;

initialization
  RegisterClass( TDocPackTransferForm );

end.
