{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomObjectGridFrm.pas $
  $Revision: 11367 $
  $Author: anaumenkov $
  $Date: 2010-10-15 22:03:43 +0400 (РџС‚, 15 РѕРєС‚ 2010) $
}
unit fdcCustomObjectGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomGridFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FDCCustomDataset,
  FDCQuery, Menus, cxGridCustomPopupMenu, cxGridPopupMenu, ImgList,
  cxContainer, dxLayoutLookAndFeels, ActnList, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, fdcObjectCore, fdcObjectServices, Oracle,
  FDCOracleSession, fdcCustomDBDataFrm, dxBar, cxProgressBar, cxDBEdit,
  fdcObjectLinkEdit, dxLayoutControl, cxSplitter, StdCtrls, dxBarDBNav,
  fdcCustomDataFrm, ComCtrls, cxLookAndFeelPainters, cxLookAndFeels,
  cxButtons, fdcParamsHolder, cxGridDBDataDefinitions, cxGridDBBandedTableView,
  cxGridBandedTableView;

type

  { базовая форма списка объектов }
  TIterateObjectsProc = procedure (AObject: TfdcObject; AIndex, ACount: integer; var ADescr: string; var ABreak: boolean) of object;
  TfdcCustomObjectGridForm = class(TfdcCustomGridForm, IfdcNavigableForm)
    actOpen: TAction;
    actDelete: TAction;
    actAdd: TAction;
    btnAdd: TdxBarButton;
    btnOpen: TdxBarButton;
    btnDelete: TdxBarButton;
    dsDataID: TFloatField;
    dsDataNAME: TStringField;
    dsDataSHORTNAME: TStringField;
    dsDataOBJECT_TYPE_ID: TFloatField;
    dsDataSTATE_ID: TFloatField;
    dsDataSYSNAME: TStringField;
    dsDataDESCRIPT: TStringField;
    dsDataOWNER_OBJECT_ID: TFloatField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    grdDataDBTableViewID: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME: TcxGridDBColumn;
    grdDataDBBandedTableViewID: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn;
    dsDataACCESSLEVEL: TFloatField;
    edtName: TcxTextEdit;
    lciName: TdxLayoutItem;
    procedure FormActivate(Sender: TObject);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewDblClick(Sender: TObject);
    procedure grdDataDBBandedTableViewTYPENAMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdDataTableViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actSearchOkUpdate(Sender: TObject);
    procedure actSearchOkExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { ссылка на IfdcObjectServices }
    FObjectServices: IfdcObjectServices;
    { реализация IfdcNavigableForm }
    FNavigableFormAdapter: IfdcNavigableForm;
    { внутренний объект drag object }
    FInternalDragObject: TfdcDragObject;
    { системное имя типа объекта который ищется }
    FSearchTypeSysName: string;
    { процедура-обработчик завершения поиска }
    FOnSearchFinished: TOnSearchFinishedEvent;
    { ID выбранного объекта при открытии формы }
    FSelectedObjectID: double;

    FDeleting: Boolean;

    { открыть выделенные объекты }
    procedure OpenObject(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    { удалить выделенне объекты }
    procedure DeleteObject(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    { добывить текущий объект к списку внутреннего объекта drag object }
    procedure FillDragObject(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    { получить системное имя текущего объекта }
    function GetCurrentObjectTypeSysName: string;
    { получить идентификатор текущего объекта }
    function GetCurrentObjectID: double;
    { обновить пиктограмму формы }
    procedure UpdateFormIcon;
    { перейти к объекту по его ID }
    procedure LocateObject(AID: double);
    { обновить навигатор }
    procedure Navigate;
  protected
    { получить инициализированный экземпляр объекта drag object }
    function GetDragObject(Sender: TObject): TfdcDragObject;
    {
      Возвращает системное имя объектного типа,
      поддерживаемого формой.

      Переопределите (override) этом метод, чтобы
      указать системное имя объектов для форм с
      нестандартным именем класса. Стандартное имя
      класса для форм реализующих список объектов
      формируется по шаблону:

        T<TypeSysName>Grid[Suffix]Form

      <TypeSysName> - системное имя типа объекта,
      [Suffix] - необязательный суффикс.

      Примеры:
        TPersonGridForm,
        TPersonGridByMentionForm.
    }
    function GetSupportedTypeSysName: string; virtual;
    {
      Зарегистрировать форму в механизме связанных форм.

      Переопределите (override) этот метод для регистрации
      дополнительных связанных форм.
    }
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;

    procedure DoDeleteObject; virtual;
    function  DoOpenObject(AID: double; AParams: TParams = nil): TForm; virtual;

    { завершить поиск }
    procedure DoSearchFinished;

    { зарегистририроваться в механизме связанных форм }
    procedure RegisterAsWaiterFor(AForm: TForm);

    { итеративная обработка списка объектов, например при DragDrop }
    procedure IterateObjects(AObjects: TfdcObjectList; AIterateObjectsProc: TIterateObjectsProc);

    property NavigableFormAdapter: IfdcNavigableForm read FNavigableFormAdapter implements IfdcNavigableForm;
    procedure HandleRefresh; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ObjectServices: IfdcObjectServices read FObjectServices write FObjectServices;
    property SupportedTypeSysName: string read GetSupportedTypeSysName;
    property CurrentObjectID: double read GetCurrentObjectID;
    property CurrentObjectTypeSysName: string read GetCurrentObjectTypeSysName;
    property SelectedObjectID: double read FSelectedObjectID write FSelectedObjectID;
    property SearchTypeSysName: string read FSearchTypeSysName write FSearchTypeSysName;
    property OnSearchFinished: TOnSearchFinishedEvent read FOnSearchFinished write FOnSearchFinished;
  end;

implementation

uses
  fdcUtils, fdcMessages, fdcCustomObjectFrm;

{$R *.dfm}

type

  { TfdcNavigableCustomObjectGridFormAdapter }
  TfdcNavigableCustomObjectGridFormAdapter = class(TfdcNavigableFormAdapter)
  private
    function GetOwnerForm: TfdcCustomObjectGridForm;
  public
    function GetItemImageIndex(AItem: TControl): integer; override;
    property OwnerForm: TfdcCustomObjectGridForm read GetOwnerForm;
  end;

{ TfdcNavigableCustomObjectGridFormAdapter }

function TfdcNavigableCustomObjectGridFormAdapter.GetOwnerForm: TfdcCustomObjectGridForm;
begin
  Result := (inherited OwnerForm) as TfdcCustomObjectGridForm;
end;

function TfdcNavigableCustomObjectGridFormAdapter.GetItemImageIndex(AItem: TControl): integer;
begin
  if AItem = OwnerForm then
    Result := OwnerForm.ObjectServices.GetObjectTypeFactory.
      GetImageIndex(OwnerForm.SupportedTypeSysName)
  else
    Result := inherited GetItemImageIndex(AItem);
end;

{ TfdcObjectGridForm }

constructor TfdcCustomObjectGridForm.Create(AOwner: TComponent);
begin
  inherited;
  FInternalDragObject := TfdcDragObject.Create;
  FNavigableFormAdapter := TfdcNavigableCustomObjectGridFormAdapter.Create(Self);
end;

destructor TfdcCustomObjectGridForm.Destroy;
begin
  FreeAndNil(FInternalDragObject);
  FNavigableFormAdapter := nil;
  inherited;
end;

function TfdcCustomObjectGridForm.GetSupportedTypeSysName: string;
var
  FormClass: TClass;

  function ExtractTypeSysName(AFormClassName: string): string;
  var
    PrefixLen,
    SuffixPos: integer;
  begin
    { grid form class name prefix must be 'T' }
    PrefixLen := Length(SFormPrefix);
    { grid form suffix pos must like 'Grid*' }
    SuffixPos := Pos(SGridFormSuffix, AFormClassName);
    { extract type sys name }
    Result := Copy(AFormClassName, PrefixLen + 1, SuffixPos - PrefixLen - 1);
  end;

begin
  Result := '';
  FormClass := Self.ClassType;
  while
    (Assigned(FormClass)) and
    (Assigned(ObjectServices)) and
    (ObjectServices.GetObjectTypeFactory.Find(Result) = nil) do
  begin
    Result := ExtractTypeSysName(FormClass.ClassName);
    FormClass := FormClass.ClassParent;
  end;
end;

function TfdcCustomObjectGridForm.IsWaiter(AForm: TfdcCustomDataForm): boolean;
begin
  Result :=
    (Assigned(AForm)) and
    (AForm is TfdcCustomObjectGridForm) and
    (AForm <> Self) and
    (Assigned(ObjectServices)) and
    (ObjectServices.GetObjectTypeFactory.TypeIsKindOf(
       SupportedTypeSysName,
       (AForm as TfdcCustomObjectGridForm).SupportedTypeSysName));
end;

procedure TfdcCustomObjectGridForm.DoSearchFinished;
begin
  if Assigned(FOnSearchFinished) then
    FOnSearchFinished(GetDragObject(Self));
end;

procedure TfdcCustomObjectGridForm.RegisterAsWaiterFor(AForm: TForm);
begin
  if Assigned(AForm) and
    (AForm is TfdcCustomDBDataForm) then
    (AForm as TfdcCustomDBDataForm).RegisterWaiter(Self);
end;

procedure TfdcCustomObjectGridForm.IterateObjects(
  AObjects: TfdcObjectList; AIterateObjectsProc: TIterateObjectsProc);
var
  i: integer;
  BreakProcess: boolean;
  ProgressDescr: string;
  ProgressShow: boolean;
  RecCount: integer;
begin
  { iterate object list }
  RecCount := AObjects.Count;
  ProgressShow := RecCount > 1;
  try
    { show progress }
    BreakProcess := False;
    ProgressDescr := '';
    if ProgressShow then
      ShowProgressEx;
    for i:=0 to RecCount-1 do
    begin
      { call processing proc }
      AIterateObjectsProc(AObjects[i], i,
        RecCount, ProgressDescr, BreakProcess);
      { break process }
      if BreakProcess then
        Break;
      { update progress }
      if ProgressShow then
        SetProgressEx(ProgressDescr, (i+1)*100 div RecCount);
    end;
  finally
    { hide progress }
    HideProgressEx;
    { refresh data }  
    RefreshData;
  end;

  { refresh waiters }
  RefreshWaiters;
end;

procedure TfdcCustomObjectGridForm.OpenObject(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
  try
    ADescr := 'Открытие объектов...';
    ShowProgress(ADescr);
    if not dsDataID.IsNull then
      RegisterAsWaiterFor(DoOpenObject(dsDataID.AsFloat, Params));
  except
    on E: Exception do
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          if WarningDlg(
               'Ошибка открытия формы объекта',
               'При попытке открытия формы объекта ' +
               SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index] + ' ' +
               'произошла ошибка. Если вы хотите продолжить открытие ' +
               'форм оставшихся объектов нажмите "Да", иначе нажмите "Нет".',
               E.Message) <> mrYes
          then
            ABreak := True;
        end else
          MessageDlg(
            'Ошибка открытия формы объекта',
            'При попытке открытия формы объекта ' +
            VarToStr(SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index]) + ' ' +
            'произошла ошибка',
            E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TfdcCustomObjectGridForm.DoDeleteObject;
begin
  if not dsDataID.IsNull then
      ObjectServices.FreeObject(dsDataID.AsFloat);
end;

procedure TfdcCustomObjectGridForm.DeleteObject(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
begin
  try
    ADescr := 'Удаление объектов...';
    ShowProgress(ADescr);
    DoDeleteObject;
  except
    on E: Exception do
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          if WarningDlg(
               'Ошибка удаления объекта',
               'При попытке удаления объекта ' +
               VarToStr(SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index]) + ' ' +
               'произошла ошибка. Если вы хотите продолжить удаление ' +
               'оставшихся объектов нажмите "Да", иначе нажмите "Нет".',
               E.Message) <> mrYes
          then
            ABreak := True;
        end else if ACount = 1 then
             Application.HandleException(Self)
        else
          MessageDlg(
            'Ошибка удаления объекта',
            'При попытке удаления объекта ' +
            VarToStr(SelectedRecords[AIndex].Values[grdDataDBBandedTableViewNAME.Index]) + ' ' +
            'произошла ошибка',
            E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TfdcCustomObjectGridForm.FillDragObject(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  Obj: TfdcObject;
begin
  if Assigned(ObjectServices) and
     Assigned(ObjectServices.GetObjectFactory) then begin
    Obj := ObjectServices.GetObjectFactory.GetObject(dsData);
    if Assigned(Obj) then
      FInternalDragObject.Objects.Add(Obj);
  end;
end;

function TfdcCustomObjectGridForm.GetCurrentObjectTypeSysName: string;
begin
  if dsData.Active and
     (not dsData.Eof) then
    Result := Trim(dsDataTYPESYSNAME.AsString);
  if Result = '' then
    Result := GetSupportedTypeSysName;
end;

function TfdcCustomObjectGridForm.GetCurrentObjectID: double;
begin
  if dsData.Active and
     (not dsData.Eof) then
    Result := dsDataID.AsFloat
  else
    Result := cNewIDNexus;
end;

procedure TfdcCustomObjectGridForm.UpdateFormIcon;
var
  TypeBitmap: TBitmap;
begin
  if not Assigned(ObjectServices) then Exit;

  TypeBitmap := ObjectServices.GetObjectTypeFactory.GetIconBySysName(SupportedTypeSysName);
  if not Assigned(TypeBitmap) then
    TypeBitmap := ObjectServices.GetObjectTypeFactory.GetRootTypeIcon;
  if Assigned(TypeBitmap) then
    BitmapToIcon(TypeBitmap, Icon);
end;

function TfdcCustomObjectGridForm.GetDragObject(Sender: TObject): TfdcDragObject;
begin
  FInternalDragObject.Objects.Clear;
  FInternalDragObject.Sender := Sender;
  IterateRecords(FillDragObject, True, False);
  Result := FInternalDragObject;
end;

procedure TfdcCustomObjectGridForm.LocateObject(AID: double);
var
  DataController: TcxGridDBDataController;
begin
  { get DBDataController }
  if ActiveGridTableView is TcxGridDBBandedTableView then
    DataController := (ActiveGridTableView as TcxGridDBBandedTableView).DataController
  else
  if ActiveGridTableView is TcxGridDBTableView then
    DataController := (ActiveGridTableView as TcxGridDBTableView).DataController
  else
    DataController := nil;

  { locate dataset to ID }  
  if Assigned(DataController) then
    DataController.LocateByKey(AID);
end;

procedure TfdcCustomObjectGridForm.Navigate;
begin
  if Visible and
     Assigned(ObjectServices) and
     (FormStyle = fsMDIChild) then
    ObjectServices.NavigateForm(Self, False);
end;

procedure TfdcCustomObjectGridForm.FormActivate(Sender: TObject);
begin
  inherited;
  Navigate;
end;

procedure TfdcCustomObjectGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetSearchParam('Name', Trim(edtName.Text));
end;

procedure TfdcCustomObjectGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if FSelectedObjectID <> -1 then
    LocateObject(SelectedObjectID);
  UpdateFormIcon;
end;

procedure TfdcCustomObjectGridForm.grdDataDBBandedTableViewDblClick(
  Sender: TObject);
begin
  //if IsCursorUnderData and
  //   not SearchMode then

  if grdData.ActiveView.GetHitTest(grdData.ScreenToClient(Mouse.CursorPos)).HitTestCode = htCell then
  begin
    if SearchMode then
    begin
      if actSearchOk.Update then
         actSearchOk.Execute
    end
    else
    begin
      if actOpen.Update then
         actOpen.Execute
    end;
  end;
  //else
  //  inherited;
end;

procedure TfdcCustomObjectGridForm.grdDataDBBandedTableViewTYPENAMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ObjectType: TfdcObjectType;
  ObjectTypeSysName: string;
begin
  inherited;
  ADone := False;
  if Assigned(ObjectServices) then begin
    ObjectTypeSysName := VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[
      grdDataDBBandedTableViewTYPESYSNAME.Index]);
    ObjectType := ObjectServices.GetObjectTypeFactory.Find(ObjectTypeSysName);
    if Assigned(ObjectType) then
      ADone := ObjectType.DrawGridCell(ACanvas.Canvas, AViewInfo.Bounds);
  end;
end;

procedure TfdcCustomObjectGridForm.grdDataTableViewStartDrag(
  Sender: TObject; var DragObject: TDragObject);
begin
  inherited;
  DragObject := GetDragObject(Sender);
end;

procedure TfdcCustomObjectGridForm.actOpenUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0);
end;

procedure TfdcCustomObjectGridForm.actOpenExecute(Sender: TObject);
begin
  inherited;

  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do begin
    { если количество выбранных объектов
      превышает 20, то выдать предупреждение }
    if (SelectedRecordCount > 20) and
       (WarningDlg(
          'Открытие форм выделенных объектов. Продолжить?',
          Format('Открытие форм всех выделенных объектов (%d из %d) может занять некоторое время. ' +
            'Открыть формы выделенных объектов?', [SelectedRecordCount, RecordCount])
        ) <> mrYes)
    then
      Exit;

    { открыть формы выбранных объектов }
    Refresh;
    IterateRecords(OpenObject, True, SelectedRecordCount > 1);
  end;
end;

procedure TfdcCustomObjectGridForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices) and
    (ActiveGridTableView.Controller.SelectedRecordCount > 0);
end;

procedure TfdcCustomObjectGridForm.actDeleteExecute(Sender: TObject);
begin
  inherited;

  with ActiveGridTableView.Controller,
       ActiveGridTableView.DataController do begin
    { показать предупреждение }
    if (
         (SelectedRecordCount > 1) and
         (WarningDlg(
           'Удаление выделенных объектов. Продолжить?',
           Format('Все выделенные объекты (%d из %d) будут удалены. ' +
             'Удаление выделенных объектов невозможно будет отменить. ' +
             'Удалить выделенные объекты?', [SelectedRecordCount, RecordCount])
          ) <> mrYes)
       ) or
       (
         (SelectedRecordCount = 1) and
         (WarningDlg(
            'Удаление объекта. Продолжить?',
            dsDataTYPENAME.asString + ' ' + dsDataNAME.asString + ' будет удален. ' +
            'Удаление объекта невозможно будет отменить. ' +
            'Удалить объект?'
          ) <> mrYes)
       )
    then
      Exit;

    { удалить выделенные объекты и перечитать данные }
    FDeleting := True;
    try
      Refresh;
      IterateRecords(DeleteObject, True, SelectedRecordCount > 1);
    finally
      FDeleting := False;
      RefreshData;
    end;

    { обновить ожидающие формы }
    RefreshWaiters;
  end;
end;

procedure TfdcCustomObjectGridForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices); 
end;

procedure TfdcCustomObjectGridForm.actAddExecute(Sender: TObject);
begin
  inherited;
  RegisterAsWaiterFor(ObjectServices.CreateObject(SupportedTypeSysName, True, Params));
end;

procedure TfdcCustomObjectGridForm.actSearchOkUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled :=
    (Sender as TAction).Visible and
    (Sender as TAction).Enabled and
//    (Assigned(ActiveControl)) and 
//    (ActiveControl.Owner = grdData) and
    (ObjectServices.GetObjectTypeFactory.TypeIsKindOf(
       dsDataTYPESYSNAME.AsString, SearchTypeSysName));
end;

procedure TfdcCustomObjectGridForm.actSearchOkExecute(Sender: TObject);
begin
  ActivateSearchSourceForm;
  DoSearchFinished;
  Close;
end;

procedure TfdcCustomObjectGridForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not AutoSaveLayout then
  begin
    for I := 0 to grdData.ViewCount -1 do
       TcxGridDBTableView(grdData.Views[I]).OptionsView.ColumnAutoWidth := False;  
  end;
  FSelectedObjectID := -1;
end;

procedure TfdcCustomObjectGridForm.HandleRefresh;
begin
  if not FDeleting then
     inherited;
end;

function TfdcCustomObjectGridForm.DoOpenObject(AID: double;
  AParams: TParams): TForm;
begin
  Result := ObjectServices.OpenObject(AID, AParams);
end;

end.
