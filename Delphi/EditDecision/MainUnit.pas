unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  OracleData, Oracle, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxCheckBox, cxCalendar, ActnList, ImgList, dxBar, DBClient,
  cxPropertiesStore;

type
  TMainForm = class(TForm)
    OracleLogon: TOracleLogon;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    OracleSession: TOracleSession;
    odsGetDecision: TOracleDataSet;
    dsGetDecision: TDataSource;
    odsGetDecisionID: TFloatField;
    odsGetDecisionNAME: TStringField;
    odsGetDecisionSHORTNAME: TStringField;
    odsGetDecisionOBJECT_TYPE_ID: TFloatField;
    odsGetDecisionSTATE_ID: TFloatField;
    odsGetDecisionACCESSLEVEL: TFloatField;
    odsGetDecisionSYSNAME: TStringField;
    odsGetDecisionDESCRIPT: TStringField;
    odsGetDecisionOWNER_OBJECT_ID: TFloatField;
    odsGetDecisionTYPENAME: TStringField;
    odsGetDecisionTYPESYSNAME: TStringField;
    odsGetDecisionOBJECTKINDLIST: TStringField;
    odsGetDecisionDOC_DATE: TDateTimeField;
    odsGetDecisionDOC_NUMBER: TStringField;
    odsGetDecisionIS_ACTIVE: TStringField;
    odsGetDecisionACTIVATION_DATE: TDateTimeField;
    odsGetDecisionEXT_SOURCE: TStringField;
    odsGetDecisionEXT_TYPESYSNAME: TStringField;
    odsGetDecisionEXT_ID: TFloatField;
    odsGetDecisionREASON_ID: TFloatField;
    odsGetDecisionREASON_NAME: TStringField;
    odsGetDecisionSUBJECT_ID: TFloatField;
    odsGetDecisionAPP_NUMBER: TStringField;
    odsGetDecisionAPP_DATE: TDateTimeField;
    odsGetDecisionAPP_NUMBER_INCOME: TStringField;
    odsGetDecisionAPP_DATE_INCOME: TDateTimeField;
    odsGetDecisionSIGN_DATE: TDateTimeField;
    odsGetDecisionSIGNED_BY: TStringField;
    odsGetDecisionSIGNED_BY_CHIEF: TStringField;
    odsGetDecisionSIGNED_BY_CHIEF_UDF: TStringField;
    odsGetDecisionSUMMA: TFloatField;
    odsGetDecisionBANK_DATE: TDateTimeField;
    odsGetDecisionCURRENCY_ID: TFloatField;
    odsGetDecisionDESTSUB_ID: TFloatField;
    odsGetDecisionACCOUNT: TStringField;
    odsGetDecisionBANK_ID: TFloatField;
    odsGetDecisionBANK_NAME: TStringField;
    odsGetDecisionBANK_BIC: TStringField;
    odsGetDecisionDECL_NAME: TStringField;
    odsGetDecisionDECL_INN: TStringField;
    odsGetDecisionDECL_KPP: TStringField;
    odsGetDecisionDECL_OKPO: TStringField;
    odsGetDecisionDECL_ADDRESS: TStringField;
    odsGetDecisionDECL_NAME_DEST: TStringField;
    odsGetDecisionDECL_INN_DEST: TStringField;
    odsGetDecisionDECL_KPP_DEST: TStringField;
    odsGetDecisionDECL_OKPO_DEST: TStringField;
    odsGetDecisionDECL_ADDRESS_DEST: TStringField;
    odsGetDecisionDECL_BANK_DEST: TStringField;
    odsGetDecisionDECL_ADR_BANK_DEST: TStringField;
    odsGetDecisionDECL_NAME_BANK_DEST: TStringField;
    odsGetDecisionBIC: TStringField;
    odsGetDecisionCORR_ACCOUNT: TStringField;
    odsGetDecisionKBKCODE_ID: TFloatField;
    odsGetDecisionKBKCODE: TStringField;
    odsGetDecisionPERSONAL_ACCOUNT: TStringField;
    odsGetDecisionDATE_LAST_DOC: TDateTimeField;
    odsGetDecisionCUSTOMSFULLNAME: TStringField;
    odsGetDecisionDECISION_COURT: TStringField;
    odsGetDecisionDATE_COURT: TDateTimeField;
    cxGridDBTableViewID: TcxGridDBColumn;
    cxGridDBTableViewNAME: TcxGridDBColumn;
    cxGridDBTableViewSHORTNAME: TcxGridDBColumn;
    cxGridDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn;
    cxGridDBTableViewSTATE_ID: TcxGridDBColumn;
    cxGridDBTableViewACCESSLEVEL: TcxGridDBColumn;
    cxGridDBTableViewSYSNAME: TcxGridDBColumn;
    cxGridDBTableViewDESCRIPT: TcxGridDBColumn;
    cxGridDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn;
    cxGridDBTableViewTYPENAME: TcxGridDBColumn;
    cxGridDBTableViewTYPESYSNAME: TcxGridDBColumn;
    cxGridDBTableViewOBJECTKINDLIST: TcxGridDBColumn;
    cxGridDBTableViewDOC_DATE: TcxGridDBColumn;
    cxGridDBTableViewDOC_NUMBER: TcxGridDBColumn;
    cxGridDBTableViewIS_ACTIVE: TcxGridDBColumn;
    cxGridDBTableViewACTIVATION_DATE: TcxGridDBColumn;
    cxGridDBTableViewEXT_SOURCE: TcxGridDBColumn;
    cxGridDBTableViewEXT_TYPESYSNAME: TcxGridDBColumn;
    cxGridDBTableViewEXT_ID: TcxGridDBColumn;
    cxGridDBTableViewREASON_ID: TcxGridDBColumn;
    cxGridDBTableViewREASON_NAME: TcxGridDBColumn;
    cxGridDBTableViewSUBJECT_ID: TcxGridDBColumn;
    cxGridDBTableViewAPP_NUMBER: TcxGridDBColumn;
    cxGridDBTableViewAPP_DATE: TcxGridDBColumn;
    cxGridDBTableViewAPP_NUMBER_INCOME: TcxGridDBColumn;
    cxGridDBTableViewAPP_DATE_INCOME: TcxGridDBColumn;
    cxGridDBTableViewSIGN_DATE: TcxGridDBColumn;
    cxGridDBTableViewSIGNED_BY: TcxGridDBColumn;
    cxGridDBTableViewSIGNED_BY_CHIEF: TcxGridDBColumn;
    cxGridDBTableViewSIGNED_BY_CHIEF_UDF: TcxGridDBColumn;
    cxGridDBTableViewSUMMA: TcxGridDBColumn;
    cxGridDBTableViewBANK_DATE: TcxGridDBColumn;
    cxGridDBTableViewCURRENCY_ID: TcxGridDBColumn;
    cxGridDBTableViewDESTSUB_ID: TcxGridDBColumn;
    cxGridDBTableViewACCOUNT: TcxGridDBColumn;
    cxGridDBTableViewBANK_ID: TcxGridDBColumn;
    cxGridDBTableViewBANK_NAME: TcxGridDBColumn;
    cxGridDBTableViewBANK_BIC: TcxGridDBColumn;
    cxGridDBTableViewDECL_NAME: TcxGridDBColumn;
    cxGridDBTableViewDECL_INN: TcxGridDBColumn;
    cxGridDBTableViewDECL_KPP: TcxGridDBColumn;
    cxGridDBTableViewDECL_OKPO: TcxGridDBColumn;
    cxGridDBTableViewDECL_ADDRESS: TcxGridDBColumn;
    cxGridDBTableViewDECL_NAME_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_INN_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_KPP_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_OKPO_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_ADDRESS_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_BANK_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_ADR_BANK_DEST: TcxGridDBColumn;
    cxGridDBTableViewDECL_NAME_BANK_DEST: TcxGridDBColumn;
    cxGridDBTableViewBIC: TcxGridDBColumn;
    cxGridDBTableViewCORR_ACCOUNT: TcxGridDBColumn;
    cxGridDBTableViewKBKCODE_ID: TcxGridDBColumn;
    cxGridDBTableViewKBKCODE: TcxGridDBColumn;
    cxGridDBTableViewPERSONAL_ACCOUNT: TcxGridDBColumn;
    cxGridDBTableViewDATE_LAST_DOC: TcxGridDBColumn;
    cxGridDBTableViewCUSTOMSFULLNAME: TcxGridDBColumn;
    cxGridDBTableViewDECISION_COURT: TcxGridDBColumn;
    cxGridDBTableViewDATE_COURT: TcxGridDBColumn;
    oqUpdateDecision: TOracleQuery;
    dxBarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ActionList: TActionList;
    ImageList: TImageList;
    aRefresh: TAction;
    aLoad: TAction;
    aSave: TAction;
    cxGridPopupMenu: TcxGridPopupMenu;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    oqLoad: TOracleQuery;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure odsGetDecisionApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure aRefreshExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if date >= StrToDate('01.03.2011')  then
    begin
     showmessage('Использовать програмный продукт ЗАПРЕЩЕНО!!!!' );
     exit;
    end;
  if OracleLogon.Execute then
     {odsGetDecision.Open};
end;

procedure TMainForm.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.odsGetDecisionApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
   oqUpdateDecision.SetVariable('id',odsGetDecisionID.Value);
   oqUpdateDecision.SetVariable('date_court',odsGetDecisionDate_Court.Value);
   oqUpdateDecision.SetVariable('decision_court',odsGetDecisionDecision_Court.Value);
   oqUpdateDecision.Execute;
   Applied := true;
end;

procedure TMainForm.aRefreshExecute(Sender: TObject);
begin
   odsGetDecision.Refresh;
end;

procedure TMainForm.aSaveExecute(Sender: TObject);
var F: TextFile;
    S: String;
begin
   if not SaveDialog.Execute then
      exit;
   odsGetDecision.First;
   AssignFile(F, SaveDialog.FileName);
   Rewrite(F);
   while not odsGetDecision.Eof do
   begin
      {if odsGetDecisionDATE_COURT.AsString <> '' Then
      begin}
      S := odsGetDecisionEXT_SOURCE.AsString + ';'+
           odsGetDecisionEXT_TYPESYSNAME.AsString + ';'+
           odsGetDecisionEXT_ID.AsString + ';'+
           odsGetDecisionDECISION_COURT.AsString + ';'+
           odsGetDecisionDATE_COURT.AsString + ';';
      WriteLn(f,s);
      {end;}
      odsGetDecision.Next;
   end;
   CloseFile(F);
end;

procedure TMainForm.aLoadExecute(Sender: TObject);
var
  F: TextFile;
  S: string;
begin
  if not OpenDialog.Execute then
     exit;
  AssignFile(F, OpenDialog.FileName);
  Reset(F);
  while not EOF(F) do
  begin
    Readln(F, S);
    oqLoad.SetVariable('pStr',S);
    oqLoad.Execute;
  end;
  CloseFile(F);
  //odsGetDecision.Refresh;
end;

end.
