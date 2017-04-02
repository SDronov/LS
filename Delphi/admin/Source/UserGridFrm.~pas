unit UserGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus;

type
  TUserGridForm = class(TObjectGridForm)
    dsDataLOGIN: TStringField;
    dsDataLASTNAME: TStringField;
    dsDataFIRSTNAME: TStringField;
    dsDataMIDDLENAME: TStringField;
    dsDataALLOWGRANTOPTION: TIntegerField;
    grdDataDBBandedTableViewLOGIN: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewLASTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewFIRSTNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewMIDDLENAME: TcxGridDBBandedColumn;
    edtLogin: TcxTextEdit;
    lcSearchCriteriaItem1: TdxLayoutItem;
    actReGrant: TAction;
    btnReGrant: TdxBarButton;
    dsDataOBJECTKINDLIST: TStringField;
    dsDataCRYPTCONTAINER: TStringField;
    dsDataCERT_SUBJECT: TStringField;
    dsDataCUSTOM_ID: TFloatField;
    dsDataCUSTOMS_CODE_8: TStringField;
    dsDataCUSTOM_NAME: TStringField;
    grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn;
    dsDataEXP_DATE: TDateTimeField;
    grdDataDBBandedTableViewEXP_DATE: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actReGrantUpdate(Sender: TObject);
    procedure actReGrantExecute(Sender: TObject);
  private
    { Private declarations }
    procedure DoReGrant(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
  public
    { Public declarations }
  end;

var
  UserGridForm: TUserGridForm;

implementation

uses fdcMessages, MainDm, fdcCustomGridFrm, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TUserGridForm.DoReGrant(AGridTableView: TcxGridTableView; AIndex,
  ACount: integer; var ADescr: string; var ABreak: boolean);
var
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Выдача прав пользователю ' + dsDataNAME.AsString + '...';
    ShowProgress(ADescr);
    if not dsDataLOGIN.IsNull then
      MainData.ReGrantUser(dsDataLOGIN.AsString);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      UserName := dsDataNAME.AsString;
      UserMessage := 'Ошибка выдачи прав пользователю';
      UserHint := 'При попытке выдачи прав пользователю ' +
        UserName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить выдачу прав оставшимся пользователям?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Login', Trim(edtLogin.Text));
end;

procedure TUserGridForm.actReGrantUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0);
end;

procedure TUserGridForm.actReGrantExecute(Sender: TObject);
begin
  inherited;
  Refresh;
  IterateRecords(DoReGrant, True, True);
end;

initialization
  RegisterClass(TUserGridForm);

end.
