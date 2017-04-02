unit ReestrSpecifyKindPayGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxDropDownEdit, cxCalendar, QueryList, Oracle,
  cxCurrencyEdit, dxBarExtItems, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, OracleData, cxCheckBox;

type
  TReestrSpecifyKindPayGridForm = class(TObjectGridForm)
    lcSearchCriteriaItem1: TdxLayoutItem;
    edtNO: TcxTextEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtFrom: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtTO: TcxDateEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtCODE: TcxTextEdit;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    dsDataDATE_INPUT: TDateTimeField;
    dsDataDATE_SEND: TDateTimeField;
    dsDataTOTAL_SUMMA: TFloatField;
    dsDataCURRENCY_ID: TFloatField;
    dsDataCURRENCY: TStringField;
    dsDataDATE_CONFIRM: TDateTimeField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTOTAL_SUMM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCURRENCY: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDATE_CONFIRM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    qlSQLCursor: TQueryList;
    sqlGetNoticeCurrency: TsqlOp;
    sqlGetGNoticeCurrency: TsqlOp;
    sqlGetConfirmCurrency: TsqlOp;
    qlSQLResult: TQueryList;
    sqlGetReestrNotice: TsqlOp;
    sqlGetReestrGNotice: TsqlOp;
    sqlGetReestrConfirm: TsqlOp;
    sqlGetReestrNoticeBuild: TsqlOp;
    sqlGetReestrGNoticeBuild: TsqlOp;
    sqlGetReestrConfirmBuild: TsqlOp;
    sqlGetCNoticeCurrency: TsqlOp;
    sqlGetReestrCNotice: TsqlOp;
    sqlGetReestrCNoticeBuild: TsqlOp;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarComboShow: TdxBarCombo;
    sqlGet_is_present_deduct_not_active: TsqlOp;
    dsDataSENDER_SOFT_CODE_ID: TFloatField;
    dsDataSENDER_SOFT_NAME: TStringField;
    dsDataSENDER_SOFT_CODE: TStringField;
    dsDataRECEIVER_SOFT_CODE_ID: TFloatField;
    dsDataRECEIVER_SOFT_NAME: TStringField;
    dsDataRECEIVER_SOFT_CODE: TStringField;
    dsDataIS_RECIEVED: TStringField;
    dsDataRECIEVE_DATE: TDateTimeField;
    dsDataDATE_LOAD: TDateTimeField;
    grdDataDBBandedTableViewDATE_LOAD: TcxGridDBBandedColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarEdit1: TdxBarEdit;
    BarBtnPrint: TdxBarButton;
    dxbcTO: TdxBarCombo;
    dsDataIS_TS: TStringField;
    grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn;
    dxBarButtonReestrPeriod: TdxBarButton;
    sqlInitGNoticeStartDate: TsqlOp;
    procedure actAddExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dxBarComboShowChange(Sender: TObject);
    procedure BarBtnPrintClick(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dxbcTOChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButtonReestrPeriodClick(Sender: TObject);
  private
    { Private declarations }
  protected
    RestoredCustoms : string;
  public
    { Public declarations }
    procedure LoadLayout; override;
    procedure SaveLayout; override;
  end;

var
  ReestrSpecifyKindPayGridForm: TReestrSpecifyKindPayGridForm;

implementation

Uses
  MainDm
 ,fdcCustomDBDataFrm
 ,fdcMessages
 ,fdcReestrSpecifyKindPayUnit
 ,fdcUtils, StrUtils
 ,qReestrSpecifyKindPayUnit;

{$R *.dfm}

const
  cRegKey_Customs = 'CurrentCustoms';

procedure TReestrSpecifyKindPayGridForm.actAddExecute(Sender: TObject);
  const lc_char :string[2] = 'NY';
  var li :integer;
      lcursor :TOracleQuery;
      lonly_today : integer;
      l_success: boolean;
  //--
  procedure create_update_reestr_notice(pcurrency_id: Integer; pists: char; ponly_today: integer);
  begin
    sqlGetReestrNoticeBuild.ParamValues['pcurrency_id'] := pcurrency_id;
    sqlGetReestrNoticeBuild.ParamValues['pists'] := pists;
    sqlGetReestrNoticeBuild.ParamValues['ponly_today'] := ponly_today;
    sqlGetReestrNoticeBuild.Exec;
  end;
  //--
  procedure create_update_reestr_gnotice(pcurrency_id: Integer; pists: char; ponly_today: integer);
  begin
    sqlGetReestrGNoticeBuild.ParamValues['pcurrency_id'] := pcurrency_id;
    sqlGetReestrGNoticeBuild.ParamValues['pists'] := pists;
    sqlGetReestrGNoticeBuild.ParamValues['ponly_today'] := ponly_today;
    sqlGetReestrGNoticeBuild.Exec;
  end;
  //--
  procedure create_update_reestr_cnotice(pcurrency_id: Integer; pists: char; ponly_today: integer);
  begin
    sqlGetReestrCNoticeBuild.ParamValues['pcurrency_id'] := pcurrency_id;
    sqlGetReestrCNoticeBuild.ParamValues['pists'] := pists;
    sqlGetReestrCNoticeBuild.ParamValues['ponly_today'] := ponly_today;
    sqlGetReestrCNoticeBuild.Exec;
  end;
  //--
  procedure create_update_reestr_confirm(pcurrency_id: Integer; pists: char; ponly_today: integer);
  begin
    sqlGetReestrconfirmBuild.ParamValues['pcurrency_id'] := pcurrency_id;
    sqlGetReestrconfirmBuild.ParamValues['pists'] := pists;
    sqlGetReestrconfirmBuild.ParamValues['ponly_today'] := ponly_today;
    sqlGetReestrconfirmBuild.Exec;
  end;
  //--
begin
  //-- запрс на включение списаний  по закрытому опер. дню - "Включить списания по закрытому опер. дню?"
  if (fdcMessages.MessageDlg('Формирование/доформирование реестров','Включить списания по закрытому опер. дню?','Включить списания по закрытому опер. дню?',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
    begin //-- Создать реестр
      lonly_today := 0;
    end
  else
    begin
      lonly_today := 1;
    end;
  //-- проверка на наличие списаний не включающихся в реестр из-за не проведённости
  sqlGet_is_present_deduct_not_active.ParamValues['ponly_today'] := lonly_today;
  sqlGet_is_present_deduct_not_active.Exec;
  if (sqlGet_is_present_deduct_not_active.ParamValues['pis_present_deduct_not_active'] = 1) then
    begin
      fdcMessages.MessageDlg('Формирования/доформирования реестров','В системе присутствуют списания, которые не могут быть включены в реестр из-за не проведённости документов!','В системе присутствуют списания, которые не могут быть включены в реестр из-за не проведённости документов!', mtInformation,[mbOK],0);
    end;
  //-- создание реестров уведомлений
  for li := 1 to 2 do
  begin
  try
    sqlGetNoticeCurrency.ParamValues['pists'] := lc_char[li];
    sqlGetNoticeCurrency.ParamValues['ponly_today'] := lonly_today;
    lcursor := sqlGetNoticeCurrency.Query;
    while not(lcursor.Eof) do
      begin
        //-- проверка наличия реестра по валюте
         sqlGetReestrNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
         sqlGetReestrNotice.ParamValues['pstatus_sysname'] := NULL;
         sqlGetReestrNotice.ParamValues['pists'] := lc_char[li];
         sqlGetReestrNotice.Exec;
        if (sqlGetReestrNotice.ParamValues['ispresent']= 0) then
          begin //-- создать реестр
            create_update_reestr_notice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
          end
        else
          begin
            //-- проверка наличия реестра по валюте и статусу
            sqlGetReestrNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
            sqlGetReestrNotice.ParamValues['pstatus_sysname'] := 'State.PackSpecifyKindPay.Formed';
            sqlGetReestrNotice.ParamValues['pists'] := lc_char[li];
            sqlGetReestrNotice.Exec;
            if (sqlGetReestrNotice.ParamValues['ispresent']= 0) then
              begin
                //-- выдать запрос на создание нового реестра
                if (fdcMessages.MessageDlg('Создать за текущей день новый реестр?','Реестр уведомлений об уточнении вида платежа на текущую дату по данной валюте существует, но не находится в статусе "Формируется"!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Создать реестр
                    create_update_reestr_notice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end
            else
              begin
                //-- выдать запрос на включение списаний в сформированный реестр
                if (fdcMessages.MessageDlg('Включить списания в сформированный реестр?','Реестр уведомлений об уточнении вида платежа существует!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Включить списания в сформированный реестр
                    create_update_reestr_notice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end;
          end;
        //--
        lcursor.Next;
      end;
    lcursor.Close;
    //-- фиксация изменений
    MainData.Session.Commit;
  except
    on e:Exception do
      begin
        MainData.Session.Rollback;
        fdcMessages.MessageDlg('Ошибка формирования/доформирования реестров','',e.Message, mtError,[mbOK],0);
      end;
  end;
  end;
  //-- создание реестров уведомлений об уточнении вида платежа обеспечения
  l_success := true;
  for li := 1 to 2 do
  begin
  try
    sqlGetGNoticeCurrency.ParamValues['pists'] := lc_char[li];
    sqlGetGNoticeCurrency.ParamValues['ponly_today'] := lonly_today;
    lcursor := sqlGetGNoticeCurrency.Query;
    while not(lcursor.Eof) do
      begin
        //-- проверка наличия реестра по валюте
         sqlGetReestrGNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
         sqlGetReestrGNotice.ParamValues['pstatus_sysname'] := NULL;
         sqlGetReestrGNotice.ParamValues['pists'] := lc_char[li];
         sqlGetReestrGNotice.Exec;
        if (sqlGetReestrGNotice.ParamValues['ispresent']= 0) then
          begin //-- создать реестр
            create_update_reestr_gnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
          end
        else
          begin
            //-- проверка наличия реестра по валюте и статусу
            sqlGetReestrGNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
            sqlGetReestrGNotice.ParamValues['pstatus_sysname'] := 'State.PackSpecifyKindPay.Formed';
            sqlGetReestrGNotice.ParamValues['pists'] := lc_char[li];
            sqlGetReestrGNotice.Exec;
            if (sqlGetReestrGNotice.ParamValues['ispresent']= 0) then
              begin
                //-- выдать запрос на создание нового реестра
                if (fdcMessages.MessageDlg('Создать за текущей день новый реестр?','Реестр уведомлений об уточнении вида платежа обеспечения на текущую дату по данной валюте существует, но не находится в статусе "Формируется"!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Создать реестр
                    create_update_reestr_gnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end
            else
              begin
                //-- выдать запрос на включение списаний в сформированный реестр
                if (fdcMessages.MessageDlg('Включить списания в сформированный реестр?','Реестр уведомлений об уточнении вида платежа обеспечения существует!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Включить списания в сформированный реестр
                    create_update_reestr_gnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end;
          end;
        //--
        lcursor.Next;
      end;
    lcursor.Close;
    //-- фиксация изменений
    MainData.Session.Commit;
  except
    on e:Exception do
      begin
        l_success := false;
        MainData.Session.Rollback;
        fdcMessages.MessageDlg('Ошибка формирования/доформирования реестров','',e.Message, mtError,[mbOK],0);
      end;
  end;
  end;
  // инициализируем дату первой загрузки (если уже была - ничего не ставится)
  if l_success then
    sqlInitGNoticeStartDate.Exec;

  //-- создание реестров уведомлений при излишней уплате
  for li := 1 to 2 do
  begin
  try
    sqlGetCNoticeCurrency.ParamValues['pists'] := lc_char[li];
    sqlGetCNoticeCurrency.ParamValues['ponly_today'] := lonly_today;
    lcursor := sqlGetCNoticeCurrency.Query;
    while not(lcursor.Eof) do
      begin
        //-- проверка наличия реестра по валюте
        sqlGetReestrCNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
        sqlGetReestrCNotice.ParamValues['pstatus_sysname'] := NULL;
        sqlGetReestrCNotice.ParamValues['pists'] := lc_char[li];
        sqlGetReestrCNotice.Exec;
        if (sqlGetReestrCNotice.ParamValues['ispresent']= 0) then
          begin //-- создать реестр
            create_update_reestr_cnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
          end
        else
          begin
            //-- проверка наличия реестра по валюте и статусу
            sqlGetReestrCNotice.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
            sqlGetReestrCNotice.ParamValues['pstatus_sysname'] := 'State.PackSpecifyKindPay.Formed';
            sqlGetReestrCNotice.ParamValues['pists'] := lc_char[li];
            sqlGetReestrCNotice.Exec;
            if (sqlGetReestrCNotice.ParamValues['ispresent']= 0) then
              begin
                //-- выдать запрос на создание нового реестра
                if (fdcMessages.MessageDlg('Создать за текущей день новый реестр?','Реестр уведомлений об уточнении вида платежа при излишней уплате на текущую дату по данной валюте существует, но не находится в статусе "Формируется"!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Создать реестр
                    create_update_reestr_cnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end
            else
              begin
                //-- выдать запрос на включение списаний в сформированный реестр
                if (fdcMessages.MessageDlg('Включить списания в сформированный реестр?','Реестр уведомлений об уточнении вида платежа при излишней уплате существует!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Включить списания в сформированный реестр
                    create_update_reestr_cnotice(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end;
          end;
        //--
        lcursor.Next;
      end;
    lcursor.Close;
    //-- фиксация изменений
    MainData.Session.Commit;
  except
    on e:Exception do
      begin
        MainData.Session.Rollback;
        fdcMessages.MessageDlg('Ошибка формирования/доформирования реестров','',e.Message, mtError,[mbOK],0);
      end;
  end;
  end;
  //-- создание реестров подтверждений
  for li := 1 to 2 do
  begin
  try
    sqlGetConfirmCurrency.ParamValues['pists'] := lc_char[li];
    sqlGetConfirmCurrency.ParamValues['ponly_today'] := lonly_today;
    lcursor := sqlGetConfirmCurrency.Query;
    while not(lcursor.Eof) do
      begin
        //-- проверка наличия реестра по валюте
        sqlGetReestrConfirm.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
        sqlGetReestrConfirm.ParamValues['pstatus_sysname'] := NULL;
        sqlGetReestrConfirm.ParamValues['pists'] := lc_char[li];
        sqlGetReestrConfirm.Exec;
        if (sqlGetReestrConfirm.ParamValues['ispresent']= 0) then
          begin //-- создать реестр
            create_update_reestr_confirm(lcursor.Field('currency_id'),lc_char[li],lonly_today);
          end
        else
          begin
            //-- проверка наличия реестра по валюте и статусу
            sqlGetReestrConfirm.ParamValues['pcurrency_id'] := lcursor.Field('currency_id');
            sqlGetReestrConfirm.ParamValues['pstatus_sysname'] := 'State.PackSpecifyKindPay.Formed';
            sqlGetReestrConfirm.ParamValues['pists'] := lc_char[li];
            sqlGetReestrConfirm.Exec;
            if (sqlGetReestrConfirm.ParamValues['ispresent']= 0) then
              begin
                //-- выдать запрос на создание нового реестра
                if (fdcMessages.MessageDlg('Создать за текущей день новый реестр?','Реестр подтверждений использования платежа на текущую дату по данной валюте существует, но не находится в статусе "Формируется"!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Создать реестр
                    create_update_reestr_confirm(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end
            else
              begin
                //-- выдать запрос на включение списаний в сформированный реестр
                if (fdcMessages.MessageDlg('Включить списания в сформированный реестр?','Реестр подтверждений использования платежа существует!','Формирование/доформирование реестров.',mtConfirmation,[mbYes, mbNo],0) = mrYes) then
                  begin //-- Включить списания в сформированный реестр
                    create_update_reestr_confirm(lcursor.Field('currency_id'),lc_char[li],lonly_today);
                  end;
              end;
          end;
        //--
        lcursor.Next;
      end;
    lcursor.Close;
    //-- фиксация изменений
    MainData.Session.Commit;
  except
    on e:Exception do
      begin
        MainData.Session.Rollback;
        fdcMessages.MessageDlg('Ошибка формирования/доформирования реестров','',e.Message, mtError,[mbOK],0);
      end;
  end;
  end;
  //-- обновление списка реестров
  dsData.ReQuery;
  //--
end;

procedure TReestrSpecifyKindPayGridForm.grdDataDBBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  SrcCust: string;
begin
  inherited;

  SrcCust := ARecord.Values[ grdDataDBBandedTableViewEXT_SOURCE.Index ];
  if (SrcCust <> MainData.GetSoftCustomsCode) and
  	 ((copy(SrcCust,1,3) = copy(MainData.GetSoftCustomsCode,1,3)) or (MainData.GetCustomsLevel = 0)) then
  begin
    if ARecord.Selected
    then AStyle := MainData.stlDocPackAlienSelected
    else AStyle := MainData.stlDocPackAlien;
  end;
end;

procedure TReestrSpecifyKindPayGridForm.dsDataBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('DOC_NO', edtNO.EditingValue);
  SetSearchParam('CURR', edtCODE.EditingValue);
  SetSearchParam('FROM_DATE', edtFrom.EditingValue);
  SetSearchParam('TO_DATE', edtTO.EditingValue);

  dsData.ParamByName('show').AsInteger := dxBarComboShow.ItemIndex;

  dsData.ParamByName('custom_from').AsString := MainData.GetChildCustomsCodeByName( dxbcTO.Text );
end;


procedure TReestrSpecifyKindPayGridForm.dxBarComboShowChange(
  Sender: TObject);
begin
  inherited;
	RefreshData;
end;

procedure TReestrSpecifyKindPayGridForm.BarBtnPrintClick(
  Sender: TObject);
begin
  fdcReestrSpecifyKindPayUnit.ExecReport( dsData.Session, MainData.GetChildCustomsCodeByName( dxbcTO.Text ) );
end;

procedure TReestrSpecifyKindPayGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //-- доступность печати отчёта по входящим реестрам
  BarBtnPrint.Enabled := (dxbcTO.Text <> '')
                     and (dsData.FieldByName('ID').AsString <> '');
  //--
end;

procedure TReestrSpecifyKindPayGridForm.FormCreate(Sender: TObject);
begin
  inherited;

  MainData.GetChildCustomsNames( dxbcTO.Items );
  if dxbcTO.Items.IndexOf( RestoredCustoms ) >= 0 then
    dxbcTO.Text := RestoredCustoms;
end;

procedure TReestrSpecifyKindPayGridForm.LoadLayout;
begin
  inherited;

  RestoredCustoms := ReadRegistryValue( FormLayoutRegistryKey, cRegKey_Customs, rvString );
end;

procedure TReestrSpecifyKindPayGridForm.SaveLayout;
begin
  inherited;

  WriteRegistryValue(FormLayoutRegistryKey, cRegKey_Customs, dxbcTO.Text);
end;

procedure TReestrSpecifyKindPayGridForm.dxbcTOChange(Sender: TObject);
  var
    i : Integer;
begin
  RefreshData;

  // Автовыравнивание для колонок с суммами
  for i := 0 to grdDataDBBandedTableView.ItemCount - 1 do
    if grdDataDBBandedTableView.Items[i].PropertiesClassName = 'TcxCurrencyEditProperties' then
      grdDataDBBandedTableView.Items[i].ApplyBestFit;
end;

procedure TReestrSpecifyKindPayGridForm.FormShow(Sender: TObject);
begin
  inherited;
  // отображаем кнопку отчёта только для уровня FTS и RTU
  if (MainData.GetCustomsLevel > 1) then
    begin
      BarBtnPrint.Visible := ivNever;
    end;
end;

procedure TReestrSpecifyKindPayGridForm.dxBarButtonReestrPeriodClick(Sender: TObject);
begin
    qReestrSpecifyKindPayUnit.ExecReport( dsData.Session);
end;

initialization
  RegisterClass(TReestrSpecifyKindPayGridForm);
end.
