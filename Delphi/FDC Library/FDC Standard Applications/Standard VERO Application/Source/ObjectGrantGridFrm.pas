unit ObjectGrantGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxButtonEdit,
  fdcObjectCore, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TObjectGrantGridForm = class(TObjectGridForm)
    dsDataOBJECT_ID: TFloatField;
    dsDataSPECIALACCESSLEVEL: TIntegerField;
    dsDataSPECIALACCESSNAME: TStringField;
    dxLayoutControl3: TdxLayoutControl;
    edtAccessLevel: TcxButtonEdit;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dsAccessLevel: TfdcQuery;
    srcAccessLevel: TDataSource;
    dxLayoutControl3Item1: TdxLayoutItem;
    imgPublicAccess: TImage;
    grdDataDBBandedTableViewSPECIALACCESSNAME: TcxGridDBBandedColumn;
    actEditGrant: TAction;
    miEditGrant: TdxBarButton;
    grdDataDBBandedTableViewSPECIALACCESSLEVEL: TcxGridDBBandedColumn;
    cmbxGrantAccessLevel: TcxLookupComboBox;
    lciGrantAccessLevel: TdxLayoutItem;
    dsGrantAccessLevel: TfdcQuery;
    srcGrantAccessLevel: TDataSource;
    dsDataTYPE_ORDER: TFloatField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure edtAccessLevelDblClick(Sender: TObject);
    procedure edtAccessLevelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditGrantUpdate(Sender: TObject);
    procedure actEditGrantExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    GrantAccessLevel: double;
    GrantNoReduction: boolean;

    procedure UpdateAccessLevelControl;
    procedure AddGrantee(AGrantee: TfdcObject; AIndex, ACount: integer;
      var ADescr: string; var ABreak: boolean);
    procedure RemoveGrantee(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoGranteeSearchFinished(const ADragObject: TfdcDragObject);
  public
    procedure AddGrantees(AGrantees: TfdcObjectList;
      AAccessLevel: double = -1; ANoReduction: boolean = True);
  end;

var
  ObjectGrantGridForm: TObjectGrantGridForm;

implementation

uses
  fdcUtils, fdcMessages, AccessLevelDlgFrm, MainDm, fdcCustomGridFrm,
  fdcCustomObjectGridFrm;

{$R *.dfm}

{ TObjectGrantGridForm }

procedure TObjectGrantGridForm.UpdateAccessLevelControl;
begin
  if dsAccessLevel.Active then
    edtAccessLevel.Text := VarToStr(dsAccessLevel.Lookup('ID',
      ParamByName('ACCESSLEVEL').AsFloat, 'NAME'));
end;

procedure TObjectGrantGridForm.AddGrantee(AGrantee: TfdcObject;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
var
  AccessLevelName: string;
  GranteeName: string;
  ObjectName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Добавление прав доступа...';
    ShowProgress(ADescr);
    if Assigned(AGrantee) and
       (
         AGrantee.IsOfType('User') or
         AGrantee.IsOfType('UserGroup')
       ) and
       (not AGrantee.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.UpdateObjectGrant(ParamByName('ID').AsFloat, AGrantee.ID,
        GrantAccessLevel, False, True, GrantNoReduction);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      AccessLevelName := VarToStr(dsAccessLevel.Lookup('ID', GrantAccessLevel, 'NAME'));
      ObjectName := ParamByName('NAME').AsString;
      GranteeName := AGrantee.ObjName;
      UserMessage := 'Ошибка добавления права доступа к объекту';
      UserHint := 'При попытке добавления права доступа ' +
        AccessLevelName + ' для ' + GranteeName + ' к объекту ' +
        ObjectName + ' произошла ошибка.';

      { показать сообщение }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'Продолжить добавление оставшихся прав доступа?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TObjectGrantGridForm.RemoveGrantee(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  AccessLevelName: string;
  GranteeName: string;
  ObjectName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Исключение прав доступа...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.UpdateObjectGrant(ParamByName('ID').AsFloat,
        dsDataID.AsFloat, 0);
  except
    on E: Exception do
    begin
      { подготовить текст сообщения }
      AccessLevelName := dsDataSPECIALACCESSNAME.AsString;
      GranteeName := dsDataNAME.AsString;
      ObjectName := ParamByName('NAME').AsString;
      UserMessage := 'Ошибка исключения права доступа к объекту';
      UserHint := 'При попытке исключения права доступа ' +
        AccessLevelName + ' для ' + GranteeName + ' к объекту ' +
        ObjectName + ' произошла ошибка.';

      { показать сообщение }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'Продолжить исключение оставшихся прав доступа?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TObjectGrantGridForm.DoGranteeSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddGrantees(ADragObject.Objects);
end;

procedure TObjectGrantGridForm.AddGrantees(AGrantees: TfdcObjectList;
  AAccessLevel: double = -1; ANoReduction: boolean = True);
begin
  { добавить доступ для пользователей/групп }
  if (not IsNewID(ParamByName('ID').AsFloat)) and
     (AccessLevelDlg(AAccessLevel, False) = mrOk) then
  begin
    GrantAccessLevel := AAccessLevel;
    GrantNoReduction := ANoReduction;
    IterateObjects(AGrantees, AddGrantee);
  end;  
end;

procedure TObjectGrantGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('GrantAccessLevel', cmbxGrantAccessLevel.EditValue);
end;

procedure TObjectGrantGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshDataset(dsAccessLevel);
  RefreshDataset(dsGrantAccessLevel);
  UpdateAccessLevelControl;
end;

procedure TObjectGrantGridForm.edtAccessLevelDblClick(Sender: TObject);
var
  AccessLevel: double;
begin
  inherited;
  { show access level dialog }
  AccessLevel := ParamByName('ACCESSLEVEL').AsFloat;
  if (not IsNewID(ParamByName('ID').AsFloat)) and
     (AccessLevelDlg(AccessLevel, True) = mrOk) then
  begin
    ParamByName('ACCESSLEVEL').AsFloat := AccessLevel;
    MainData.UpdateObjectAccessLevel(ParamByName('ID').AsFloat,
      ParamByName('ACCESSLEVEL').AsFloat);
    UpdateAccessLevelControl;
  end;
end;

procedure TObjectGrantGridForm.edtAccessLevelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  edtAccessLevelDblClick(Self);
end;

procedure TObjectGrantGridForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить выбранные права?',
       'Сейчас будет проведено исключение прав доступа к объекту ' +
       ParamByName('NAME').AsString + ' у выделенных пользователей/групп.'#10 +
       'Исключить права?') = mrYes then
  begin
    { исключить права доступа к объекту у выделенных пользователей/групп }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveGrantee, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

procedure TObjectGrantGridForm.grdDataDBBandedTableViewDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    (
      (Source as TfdcDragObject).HasMultipleObjectsOfType('User') or
      (Source as TfdcDragObject).HasMultipleObjectsOfType('UserGroup')
    );
end;

procedure TObjectGrantGridForm.grdDataDBBandedTableViewDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  AddGrantees((Source as TfdcDragObject).Objects);
end;

procedure TObjectGrantGridForm.actEditGrantUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0);
end;

procedure TObjectGrantGridForm.actEditGrantExecute(Sender: TObject);
var
  i: integer;
  AccessLevel: double;
  AccessLevelColumn: TcxGridColumn;
begin
  inherited;
  { взять существующий уровень доступа если он
    одинаков для всех выбранных пользователей/групп }
  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do
  begin
    AccessLevelColumn := grdDataDBBandedTableViewSPECIALACCESSLEVEL;
    AccessLevel := Values[SelectedRecords[0].Index,
                          AccessLevelColumn .Index];
    for i:=1 to SelectedRecordCount-1 do
      if Values[SelectedRecords[i].Index,
                AccessLevelColumn .Index] <> AccessLevel then
      begin
        AccessLevel := -1;
        Break;
      end;
  end;
  { обновить уровень доступа }
  AddGrantees(GetDragObject(Sender).Objects, AccessLevel, False);
end;

procedure TObjectGrantGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  if ActiveGridTableView.Controller.FocusedColumn = grdDataDBBandedTableViewSPECIALACCESSNAME then
    actEditGrant.Execute
  else
    inherited;
end;

procedure TObjectGrantGridForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TGranteeGridForm', 'Object', 0,
    Params, Self, True, DoGranteeSearchFinished);
end;

initialization
  RegisterClass(TObjectGrantGridForm);

end.
