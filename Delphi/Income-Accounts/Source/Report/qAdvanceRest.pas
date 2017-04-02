unit qAdvanceRest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, Oracle, xlcClasses,
  xlEngine, xlReport, DB, dxmdaset, cxGraphics, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fdcObjectLookupEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, cxCheckBox,
  FDCCustomDataset, fdcQuery, fdcObjectCore, fdcCustomObjectGridFrm,
  MainDM;

type
  TqAdvanceRestForm = class(TfdcCustomDlgForm)
    xlReport: TxlReport;
    dsMemData: TdxMemData;
    cxDBButtonEdit1: TcxDBButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    fdcObjectLookupEdit1: TfdcObjectLookupEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    dsMemDataONLY_DIFF: TIntegerField;
    dsReport: TfdcQuery;
    srcMemData: TDataSource;
    dsMemDataSUBJECT_NAME: TStringField;
    dsMemDataSUBJECT_ID: TFloatField;
    dsMemDataCURRENCY_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actOkExecute(Sender: TObject);
  private
    procedure OnSearchSubjFinished(const ADragObject: TfdcDragObject);
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ExecReport(Session: TOracleSession): Boolean;

implementation
uses
  QReportUtil, fdcObjectServices, DictDm;
{$R *.dfm}

function  ExecReport(Session: TOracleSession): Boolean;
var
  F: TqAdvanceRestForm;
begin
  F := TqAdvanceRestForm.Create(nil);
  with F do
  try
    // --- init Sessions
    dsReport.Session := Session;
    // --- prepare Template
    xlReport.XLSTemplate := ExtractFilePath(Application.ExeName) + 'Report\' +
                            ExtractFileName(F.xlReport.XLSTemplate);
    LoadReportQueryEx(F, xlReport.XLSTemplate);
    Result := (F.ShowModal = mrOk);
  finally
    F.Free;
  end;
end;


procedure TqAdvanceRestForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsMemData.Open;
  dsMemData.Insert;
  dsMemDataONLY_DIFF.Value := 0;
  //--
  dsMemDataCURRENCY_ID.Value := DictData.dsCurrency.Lookup( 'CODE', '643', 'ID' );
  //--
end;

procedure TqAdvanceRestForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  F: TfdcCustomObjectGridForm;
  FC: TFormClass;
begin
  inherited;
  FC := TFormClass(FindClass('TSubjectFindGridForm'));
  F := FC.Create(cxDBButtonEdit1) as TfdcCustomObjectGridForm;
  F.SearchMode := True;
  F.SearchMultiple := False;
  F.SearchComponent := cxDBButtonEdit1;
  F.SearchTypeSysName := 'Declarant;Person;Bank;Subject';
  F.ObjectServices := GetObjectServices;
  F.OnSearchFinished := OnSearchSubjFinished;
  F.actOpen.Visible := False;
  F.actAdd.Visible := False;
  F.actDelete.Visible := False;
  F.ShowModal;
end;

procedure TqAdvanceRestForm.OnSearchSubjFinished(const ADragObject: TfdcDragObject);
begin
  dsMemDataSUBJECT_ID.Value   := ADragObject.SingleObject.id;
  dsMemDataSUBJECT_NAME.Value := ADragObject.SingleObject.ObjName;
end;



procedure TqAdvanceRestForm.actOkExecute(Sender: TObject);
begin
  inherited;
  dsReport.Open;

  MainData.RegisterEvent('REP','00005');

  xlReport.Report(True);
  dsReport.Close;
end;

end.
