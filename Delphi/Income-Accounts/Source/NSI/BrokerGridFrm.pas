{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 15466 $
  $Author: adavletyarov $
  $Date: 2012-09-25 15:32:02 +0400 (Р’С‚, 25 СЃРµРЅ 2012) $
}

unit BrokerGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SubjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus,
  QueryList,ObjectFrm, cxDropDownEdit, cxCalendar;

type
  TBrokerGridForm = class(TSubjectGridForm)
    dxBarButton1: TdxBarButton;
    acImport: TAction;
    grdDataDBBandedTableViewADDRESS: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn;
    dsDataLICENSE_NO: TStringField;
    dsDataBEG_DATE: TDateTimeField;
    dsDataEND_DATE: TDateTimeField;
    dsDataREESTR_NO: TStringField;
    grdDataDBBandedTableViewLICENSE_NO: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewREESTR_NO: TcxGridDBBandedColumn;
    QueryList1: TQueryList;
    sqlCreateBroker: TsqlOp;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtReestrNo: TcxTextEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    edtLicenseNO: TcxTextEdit;
    lcSearchCriteriaGroup2: TdxLayoutGroup;
    lcSearchCriteriaGroup3: TdxLayoutGroup;
    lcSearchCriteriaItem5: TdxLayoutItem;
    edtFrom: TcxDateEdit;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtTo: TcxDateEdit;
    sqlUpdateBroker: TsqlOp;
    sqlGetSubject: TsqlOp;
    dsDataBKTLIC: TStringField;
    dsDataBNPPLIC: TFloatField;
    dsDataBSKOLTOI: TFloatField;
    dsDataBSKOLTOII: TFloatField;
    dsDataSUBJECT_ID: TFloatField;
    dsDataPARENT_ID: TFloatField;
    dsDataST: TStringField;
    dsDataADROWN: TStringField;
    procedure acImportExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  BrokerGridForm: TBrokerGridForm;

implementation

uses
  IaccLoader, LoaderWizardFrm, ObjServices, BrokerFrm;

{$R *.dfm}

procedure TBrokerGridForm.acImportExecute(Sender: TObject);
begin
  ExecuteLoader(TBrokerLoader, 'Справочник брокеров');
end;

procedure TBrokerGridForm.actAddExecute(Sender: TObject);
var
    lv_Form :TForm;
    i : Integer;
 // fBrokerForm   : TForm;
begin
  if ParamsHolder.Params[0].Value <> 0 then
  begin
     lv_Form := GetObjectServices.CreateObject( 'Broker', False, nil );
     with lv_Form as TBrokerForm do
       begin
           RegisterWaiter( Self );
           sqlGetSubject.Exec('pId',self.ParamsHolder.Params[0].Value);
           dsData.FieldByName('NAME').Value       := self.sqlGetSubject.ParamValues['NAME'];
           dsData.FieldByName('INN').Value        := self.sqlGetSubject.ParamValues['INN'];
           dsData.FieldByName('KPP').Value        := self.sqlGetSubject.ParamValues['KPP'];
           dsData.FieldByName('OGRN').Value       := self.sqlGetSubject.ParamValues['OGRN'];
           dsData.FieldByName('OKPO').Value       := self.sqlGetSubject.ParamValues['OKPO'];
           dsData.FieldByName('ADDRESS').Value    := self.sqlGetSubject.ParamValues['ADDRESS'];
           dsData.FieldByName('PHONE').Value      := self.sqlGetSubject.ParamValues['PHONE'];
           dsData.FieldByName('TELEX').Value      := self.sqlGetSubject.ParamValues['TELEX'];
           dsData.FieldByName('TELETYPE').Value   := self.sqlGetSubject.ParamValues['TELETYPE'];
           dsData.FieldByName('FAX').Value        := self.sqlGetSubject.ParamValues['FAX'];
           dsData.FieldByName('TELEGRAPH').Value  := self.sqlGetSubject.ParamValues['TELEGRAPH'];
           dsData.FieldByName('SOATO').Value      := self.sqlGetSubject.ParamValues['SOATO'];
           dsData.FieldByName('SUBJECT_ID').Value := self.ParamsHolder.Params[0].Value;
           dsData.FieldByName('NAME').ReadOnly         := True;
           dsData.FieldByName('INN').ReadOnly          := True;;
           dsData.FieldByName('KPP').ReadOnly          := True;;
           dsData.FieldByName('OGRN').ReadOnly         := True;;
           dsData.FieldByName('OKPO').ReadOnly         := True;;
           dsData.FieldByName('ADDRESS').ReadOnly      := True;;
           dsData.FieldByName('PHONE').ReadOnly        := True;;
           dsData.FieldByName('TELEX').ReadOnly        := True;;
           dsData.FieldByName('TELETYPE').ReadOnly     := True;;
           dsData.FieldByName('FAX').ReadOnly          := True;;
           dsData.FieldByName('TELEGRAPH').ReadOnly    := True;;
           dsData.FieldByName('SOATO').ReadOnly        := True;;
           dsData.FieldByName('SUBJECT_ID').ReadOnly   := True;;
       end;
     {sqlCreateBroker.ParamValues['pSubId'] := ParamsHolder.Params[0].Value;
     sqlCreateBroker.Exec;
     fBrokerForm :=  TObjectForm(GetObjectServices.OpenObject( sqlCreateBroker.ParamValues['pId'], nil ));
     (fBrokerForm as TBrokerForm).RefreshData;
     ;
     exit;}
     RefreshData;
  end;
end;

procedure TBrokerGridForm.actAddUpdate(Sender: TObject);
begin
  inherited;
   (Sender as TAction).Enabled :=  dsData.IsEmpty
                               and dsData.Active
                               and (ParamsHolder.Params[0].Value <> 0);
end;

procedure TBrokerGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('REESTR_NO', Trim(edtReestrNo.Text));
  SetSearchParam('LICENSE_NO', Trim(edtLicenseNO.Text));
  SetSearchParam('FROM_DATE', edtFrom.EditValue);
  SetSearchParam('TO_DATE', edtTo.EditValue);
end;

procedure TBrokerGridForm.FormShow(Sender: TObject);
begin
  inherited;
   FTypeSysName := 'Subject';
end;

initialization
  RegisterClass(TBrokerGridForm);

end.
