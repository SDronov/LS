unit BPLicenceBrokerGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  DB, FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, QueryList, fdcObjectCore, cxGraphics, Menus,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData;

type
  TBPLicenceBrokerGridForm = class(TObjectGridForm)
    QueryList1: TQueryList;
    sqlAdd: TsqlOp;
    sqlDel: TsqlOp;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    dsDataLICENCE_ID: TFloatField;
    dsDataFROM_DATE: TDateTimeField;
    dsDataTO_DATE: TDateTimeField;
    grdDataDBBandedTableViewINN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFROM_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTO_DATE: TcxGridDBBandedColumn;
    sqlModify: TsqlOp;
    dsDataBROKER_ID: TFloatField;
    procedure actAddExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    //function GetSupportedTypeSysName: string; override;
    procedure DoDeleteObject; override;
  public
    { Public declarations }
  end;

var
  BPLicenceBrokerGridForm: TBPLicenceBrokerGridForm;

implementation

uses fdcCustomObjectGridFrm, fdcCustomObjectFrm, fdcCustomDBDataFrm, MainDm,
MainFrm, fdcMessages, fdcCustomMainFrm, fdcCustomDataFrm;

{$R *.dfm}


Type
   TFakeForm = class(TfdcCustomMainForm);


procedure TBPLicenceBrokerGridForm.DoDeleteObject;
begin
  sqlDel.Exec;
end;

procedure TBPLicenceBrokerGridForm.actAddExecute(Sender: TObject);
  var
    vParams : TfdcParams;
    vObj : TfdcObject;
    F: TfdcCustomObjectForm;

begin
  vParams := TfdcParams.Create(nil);
  Try
    vParams.FillBy(dsData);
    vParams.ParamByName('LICENCE_ID').AsInteger := ParamByName('ID').AsInteger;
    vObj := TfdcObject.Create(MainForm.ObjectFactory);
    vObj.Read(dsData);
//    vObj.TypeSysName := 'Broker';
    vObj.TypeSysName := 'Subject';
    vObj.ID := -1;
    vObj.ObjName := '';
    F := TFakeForm(MainForm).CreateComponent('TBPLicenceBrokerForm', MainForm) as TfdcCustomObjectForm;
    F.EditObject := vObj;
    MainForm.ShowForm(F, vParams);
  finally
    vParams.Free;
  end;
end;

procedure TBPLicenceBrokerGridForm.actOpenExecute(Sender: TObject);
  var
    vParams : TfdcParams;
    vObj : TfdcObject;
    F: TfdcCustomObjectForm;

begin
  vParams := TfdcParams.Create(nil);
  Try
    vParams.FillBy(dsData);
    vObj := TfdcObject.Create(MainForm.ObjectFactory);
    vObj.Read(dsData);
    F := TFakeForm(MainForm).CreateComponent('TBPLicenceBrokerForm', MainForm) as TfdcCustomObjectForm;
    F.EditObject := vObj;
    MainForm.ShowForm(F, vParams);
  finally
    vParams.Free;
  end;
end;

initialization
   RegisterClass(TBPLicenceBrokerGridForm);

end.
