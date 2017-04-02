{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomObjectFrm.pas $
  $Revision: 12967 $
  $Author: dkligunov $
  $Date: 2011-03-30 20:58:48 +0400 (РЎСЂ, 30 РјР°СЂ 2011) $
}
unit fdcCustomObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, dxBar, ImgList, DB, FDCCustomDataset, FDCQuery,
  cxContainer, cxEdit, dxLayoutLookAndFeels, ActnList, cxPC, cxControls,
  Oracle, FDCOracleSession, ComCtrls, fdcObjectCore, dxLayoutControl,
  cxTextEdit, cxDBEdit, cxMemo, StdCtrls, fdcCustomDBDataFrm, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,  OracleData,
  cxDBLookupComboBox, DBCtrls, fdcCustomCardFrm, Mask, fdcCustomDataFrm,
  fdcObjectServices, fdcMessages, fdcObjectLinkEdit, cxLookAndFeels,
  fdcParamsHolder, cxButtonEdit;

type
  { базовая форма карточки объекта }
  TfdcNavigableFormAdapterClass = class of TfdcNavigableFormAdapter;
  TfdcCustomObjectForm = class(TfdcCustomCardForm, IfdcNavigableForm)
    btnStateTransit: TdxBarSubItem;
    actChangeState: TAction;
    dsTransit: TFDCQuery;
    dsTransitID: TFloatField;
    dsTransitNAME: TStringField;
    dsTransitDESCRIPT: TStringField;
    dsState: TFDCQuery;
    dsStateID: TFloatField;
    dsStateNAME: TStringField;
    dsStateDESCRIPT: TStringField;
    dsStateSYSNAME: TStringField;
    dsStateSTATE_SCHEME_ID: TFloatField;
    dsStateOBJECT_ID: TFloatField;
    dsStateISUPDATABLE: TFloatField;
    dsUpdateState: TFDCQuery;
    edtName: TcxDBTextEdit;
    edtDescript: TcxDBMemo;
    srcState: TDataSource;
    srcTransit: TDataSource;
    actDelete: TAction;
    btnDelete: TdxBarButton;
    dsAccessLevelUpdate: TFDCQuery;
    actNew: TAction;
    btnNew: TdxBarButton;
    lciNameEdit: TdxLayoutItem;
    lciDescriptEdit: TdxLayoutItem;
    dsDataNAME: TStringField;
    dsDataSHORTNAME: TStringField;
    dsDataOBJECT_TYPE_ID: TFloatField;
    dsDataSTATE_ID: TFloatField;
    dsDataSYSNAME: TStringField;
    dsDataDESCRIPT: TStringField;
    dsDataOWNER_OBJECT_ID: TFloatField;
    dsDataTYPENAME: TStringField;
    dsDataTYPESYSNAME: TStringField;
    dsDataACCESSLEVEL: TFloatField;
    srcAccessLevel: TDataSource;
    dsAccessLevel: TfdcQuery;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actChangeStateUpdate(Sender: TObject);
    procedure actChangeStateExecute(Sender: TObject); virtual;
    procedure actNewUpdate(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabGeneralStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure FormCreate(Sender: TObject);
  private
    { ссылка на IfdcObjectServices }
    FObjectServices: IfdcObjectServices;
    { реализация IfdcNavigableForm }
    FNavigableFormAdapter: IfdcNavigableForm;
    { внутренний объект drag object }
    FInternalDragObject: TfdcDragObject;

    FAutoMarkingRequiredField: boolean;

    //procedure AssertEditObject;
    procedure AssertEditObjectType;

    procedure ReopenDatasets;
    procedure UpdateFormIcon;
    procedure UpdatePageControl;
    procedure UpdateStateTransitItem;
    procedure Navigate(AUpdateChilds: boolean = True);

    function GetCurrentObjectID: double;
    function GetDragObject(ASender: TObject): TfdcDragObject;
    function GetEditObject: TfdcObject;
    function GetEditObjectType: TfdcObjectType;
    procedure SetEditObject(const Value: TfdcObject);
    //function GetTypeSysName: string;
    procedure SetObjectServices(const Value: IfdcObjectServices);
  protected
    {
      Возвращает системное имя объектного типа,
      поддерживаемого формой.

      Переопределите (override) этом метод, чтобы
      указать системное имя объектов для форм с
      нестандартным именем класса. Стандартное имя
      класса для форм реализующих карточку объекта
      формируется по шаблону:

        T<TypeSysName>Form

      <TypeSysName> - системное имя типа объекта.

      Примеры:
        TPersonForm,
    }
    function GetSupportedTypeSysName: string; virtual;
    {
      Зарегистрировать форму в механизме связанных форм.

      Переопределите (override) этот метод для регистрации
      дополнительных связанных форм.
    }
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;

    { установить признак наличия модификации данных }
    procedure SetModified(const Value: boolean); override;

    { установить в TcxLayoutItem.caption * - признак обязательного атрибута}
    procedure SetRequireMark (ARootComp : TComponent);

    { сформировать строку заголовка }
    function MakeCaption(AUseModifiedFlag: boolean = True): string; override;

    { возвратить признак нового объекта }
    function GetIsNew: boolean; override;

    function GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass; virtual;
    property NavigableFormAdapter: IfdcNavigableForm read FNavigableFormAdapter implements IfdcNavigableForm;

    { разрешить автоматически добавлять *(звездочку) к заголовкам полей, обязательных для ввода,
      устанавливается в конструкторе формы(по умолчанию TRUE) и опрашивается в OnCreate формы   }
    property AutoMarkingRequiredField : boolean read FAutoMarkingRequiredField write FAutoMarkingRequiredField;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ShowForm(AClassName: string; AParams: TParams = nil; ADockSite: TWinControl = nil): TForm;

    property ObjectServices: IfdcObjectServices read FObjectServices write SetObjectServices;
    property EditObject: TfdcObject read GetEditObject write SetEditObject;
    property EditObjectType: TfdcObjectType read GetEditObjectType;
    property CurrentObjectID: double read GetCurrentObjectID;
  end;

  { TfdcNavigableCustomObjectFormAdapter }
  TfdcNavigableCustomObjectFormAdapter = class(TfdcNavigableFormAdapter)
  private
    function GetOwnerForm: TfdcCustomObjectForm;
  public
    function GetSubItemCount(AItem: TControl): integer; override;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl; override;
    function GetItemCaption(AItem: TControl): string; override;
    function GetItemImageIndex(AItem: TControl): integer; override;
    //function GetActiveItem: TControl; override;
    procedure ActivateItem(AItem: TControl); override;
    function GetObject: TfdcObject; override;

    property OwnerForm: TfdcCustomObjectForm read GetOwnerForm;
  end;

  TFakeClass = class (TcxCustomTextEdit)
  end;

implementation

uses
  fdcUtils, fdcCustomObjectGridFrm, FormUtils;

{$R *.dfm}

{ TfdcNavigableCustomObjectFormAdapter }

function TfdcNavigableCustomObjectFormAdapter.GetOwnerForm: TfdcCustomObjectForm;
begin
  Result := (inherited OwnerForm) as TfdcCustomObjectForm;
end;

function TfdcNavigableCustomObjectFormAdapter.GetSubItemCount(
  AItem: TControl): integer;
var
  I: Integer;
begin
  if AItem = OwnerForm then
    begin
      Result := 0;
      for I := 0 to OwnerForm.pcMain.PageCount - 1 do
       if OwnerForm.pcMain.Pages[I].TabVisible then
          Inc(Result);
    end
  else
    Result := inherited GetSubItemCount(AItem);
end;

function TfdcNavigableCustomObjectFormAdapter.GetSubItem(
  AItem: TControl; AItemIndex: integer): TControl;
begin
  if AItem = OwnerForm then
    Result := OwnerForm.pcMain.Pages[OwnerForm.pcMain.Tabs[AItemIndex].Index]
  else
    Result := inherited GetSubItem(AItem, AItemIndex);
end;

function TfdcNavigableCustomObjectFormAdapter.GetItemCaption(AItem: TControl): string;
begin
  if AItem = OwnerForm then
    Result := OwnerForm.MakeCaption
  else
  if AItem is TcxTabSheet then
    Result := (AItem as TcxTabSheet).Caption
  else
    Result := inherited GetItemCaption(AItem);
end;

function TfdcNavigableCustomObjectFormAdapter.GetItemImageIndex(AItem: TControl): integer;
begin
  if AItem = OwnerForm then
  begin
    OwnerForm.AssertEditObjectType;
    Result := OwnerForm.EditObjectType.ImageIndex;
  end
  else
  if AItem is TcxTabSheet then
    Result := OwnerForm.ObjectServices.GetObjectTypeFactory.GetImageIndex('TabSheet')
  else
    Result := inherited GetItemImageIndex(AItem);
end;

{function TfdcNavigableCustomObjectFormAdapter.GetActiveItem: TControl;
begin
  if Assigned(OwnerForm.pcService.ActivePage) and
     OwnerForm.pcService.ActivePage.TabShowing then
    Result := OwnerForm.pcService.ActivePage
  else
  if Assigned(OwnerForm.pcMain.ActivePage) and
     OwnerForm.pcMain.ActivePage.TabShowing then
    Result := OwnerForm.pcMain.ActivePage
  else
    Result := inherited GetActiveItem;
end;}

procedure TfdcNavigableCustomObjectFormAdapter.ActivateItem(
  AItem: TControl);
begin
  if AItem is TcxTabSheet then
  begin
    (AItem as TcxTabSheet).PageControl.ActivePage := (AItem as TcxTabSheet);
    ActivateItem(OwnerForm);
  end
  else
    inherited ActivateItem(AItem);
end;

function TfdcNavigableCustomObjectFormAdapter.GetObject: TfdcObject;
begin
  Result := OwnerForm.EditObject;
end;

{ TfdcCustomObjectForm }

constructor TfdcCustomObjectForm.Create(AOwner: TComponent);
begin
  FAutoMarkingRequiredField := True;
  inherited;
  FInternalDragObject := TfdcDragObject.Create;
  FNavigableFormAdapter := GetNavigableFormAdapterClass.Create(Self);
end;

destructor TfdcCustomObjectForm.Destroy;
begin
  FreeAndNil(FInternalDragObject);
  FNavigableFormAdapter := nil;
  inherited;
end;

{procedure TfdcCustomObjectForm.AssertEditObject;
begin
  if not Assigned(EditObject) then
    raise Exception.Create('Не определен редактируемый объект');
end;}

procedure TfdcCustomObjectForm.AssertEditObjectType;
begin
  if not Assigned(EditObjectType) then
    raise Exception.Create('Не определен тип редактируемого объекта');
end;

procedure TfdcCustomObjectForm.ReopenDatasets;
begin
  if not Assigned(EditObject) then Exit;

  if EditObject.IsNew then
    EditObject.Write(dsData)
  else begin
    dsState.ReQuery;
    dsTransit.ReQuery;
    dsAccessLevel.ReQuery;
  end;
  EditObject.Read(dsData);
end;

procedure TfdcCustomObjectForm.UpdateFormIcon;
var
  TypeBitmap: TBitmap;
begin
  if not Assigned(ObjectServices) then Exit;

  if Assigned(EditObject) then
    TypeBitmap := ObjectServices.GetObjectTypeFactory.GetIconBySysName(EditObject.TypeSysName)
  else
    TypeBitmap := nil;
  if not Assigned(TypeBitmap) then
    TypeBitmap := ObjectServices.GetObjectTypeFactory.GetRootTypeIcon;
  if Assigned(TypeBitmap) then
    BitmapToIcon(TypeBitmap, Icon);
end;

procedure TfdcCustomObjectForm.UpdatePageControl;
var
  i: integer;
  vis: boolean;
begin
  if (not Assigned(EditObject)) or
     (not Assigned(EditObjectType)) then Exit;

  { update general page }
  //pcMain.Images := ObjectServices.GetObjectTypeFactory.ImageList;
  //tabGeneral.ImageIndex := ObjectServices.GetObjectTypeFactory.GetImageIndex(EditObjectType.ID);
  tabGeneral.Caption := EditObjectType.TypeName;

  { show only attributes page if object is new }
//  for i := 0 to pcMain.PageCount - 1 do begin
//    vis := (pcMain.Pages[i] = tabGeneral) or (not EditObject.IsNew);
//    pcMain.Pages[i].Enabled := vis;
//    pcMain.Pages[i].TabVisible := vis;
//  end;
  pcMain.HideTabs := EditObject.IsNew;
end;

procedure TfdcCustomObjectForm.UpdateStateTransitItem;
const
  cTransitItemTag = -1000; // used to indicate transit menu items
var
  i, j, k: integer;
  Item: TdxBarButton;
begin
  if not Assigned(EditObjectType) then Exit;

  { update current state }
  btnStateTransit.Visible := IfElse(
    EditObjectType.HasStateScheme and
    (dsState.Active) and (not dsState.IsEmpty),
    ivAlways, ivNever);
  if btnStateTransit.Visible = ivAlways then begin
    btnStateTransit.Caption := dsStateNAME.AsString;
    btnStateTransit.Hint := dsStateDESCRIPT.AsString;
    dsData.ReadOnly :=
      (not dsStateISUPDATABLE.IsNull) and
      (dsStateISUPDATABLE.AsInteger = 0);
  end;

  { clear old transit menu items }
  i := 0;
  k := ComponentCount;
  btnStateTransit.ItemLinks.Clear;
  for j:=0 to k-1 do
    if Components[i].Tag = cTransitItemTag then
      Components[i].Free
    else
      Inc(i);

  { add new state transit items }
  btnStateTransit.Hint := btnStateTransit.Hint +
    IfElse(not dsTransit.IsEmpty, '|Нажмите чтобы изменить состояние',
      '|Конечное состояние');
  if dsTransit.Active then begin
    dsTransit.First;
    while not dsTransit.Eof do begin
      Item := TdxBarButton.Create(Self);
      Item.Name := btnStateTransit.Name + '_' + dsTransitID.asString;
      Item.Data := Pointer(dsTransitID.AsInteger);
      Item.Tag := cTransitItemTag;
      Item.Caption := dsTransitNAME.AsString;
      Item.Hint := dsTransitDESCRIPT.AsString;
      Item.OnClick := actChangeStateExecute;
      btnStateTransit.ItemLinks.Add.Item := Item;
      dsTransit.Next;
    end;
  end;
end;

procedure TfdcCustomObjectForm.Navigate(AUpdateChilds: boolean = True);
begin
  if Visible and
     Assigned(ObjectServices) and
     (FormStyle = fsMDIChild) then
    ObjectServices.NavigateForm(Self, AUpdateChilds);
end;

function TfdcCustomObjectForm.GetCurrentObjectID: double;
begin
  { owner's sequence: TcxGridSite-TcxGrid-TForm }
  if ActiveControl.Owner.Owner is TfdcCustomObjectGridForm then
    Result := (ActiveControl.Owner.Owner as TfdcCustomObjectGridForm).CurrentObjectID
  else
    Result := ID;
end;

function TfdcCustomObjectForm.GetDragObject(ASender: TObject): TfdcDragObject;
begin
  if Assigned(EditObject) and
     (not EditObject.IsNew) then
  begin
    FInternalDragObject.Objects.Clear;
    FInternalDragObject.Sender := ASender;
    FInternalDragObject.Objects.Add(EditObject);
    Result := FInternalDragObject;
  end else
    Result := nil;  
end;

function TfdcCustomObjectForm.GetEditObject: TfdcObject;
begin
  Result := nil;
  if Assigned(ObjectServices) then
    Result := ObjectServices.GetObjectFactory.GetObject(ID);
end;

procedure TfdcCustomObjectForm.SetEditObject(const Value: TfdcObject);
begin
  if not Assigned(Value) then
    raise Exception.Create('Не определен редактируемый объект');

  if not Value.IsOfType(GetSupportedTypeSysName) then
    raise Exception.Create('Несоответствие типов редактируемого объекта и формы');

  ID := Value.ID;
end;

function TfdcCustomObjectForm.GetEditObjectType: TfdcObjectType;
begin
  if Assigned(EditObject) then
    Result := EditObject.ObjectType
  else
    Result := nil;
end;

{function TfdcCustomObjectForm.GetTypeSysName: string;
begin
  if Assigned(EditObject) then
    Result := EditObject.TypeSysName
  else
    Result := GetSupportedTypeSysName;
end;}

function TfdcCustomObjectForm.GetSupportedTypeSysName: string;
var
  PrefixLen,
  SuffixPos: integer;
begin
  { card form class name prefix must be 'T'}
  PrefixLen := Length(SFormPrefix);
  { card form suffix pos must like 'Form' }
  SuffixPos := Pos(SObjectFormSuffix, ClassName);
  { extract type sys name }
  Result := Copy(ClassName, PrefixLen + 1, SuffixPos - PrefixLen - 1);
end;

procedure TfdcCustomObjectForm.SetObjectServices(const Value: IfdcObjectServices);
var
  i: integer;
begin
  FObjectServices := Value;
  { init object link editors }
  for i:=0 to ComponentCount-1 do
    if Components[i] is TfdcObjectLinkEdit then
    begin
      (Components[i] as TfdcObjectLinkEdit).ObjectServices := FObjectServices;
      (Components[i] as TfdcObjectLinkEdit).ParamsHolder   := ParamsHolder;
    end;
end;

function TfdcCustomObjectForm.IsWaiter(AForm: TfdcCustomDataForm): boolean;
begin
  Result :=
    (Assigned(AForm)) and
    (AForm is TfdcCustomObjectGridForm) and
    (AForm <> Self) and
    (Assigned(EditObjectType)) and
    (EditObjectType.IsKindOf((AForm as TfdcCustomObjectGridForm).SupportedTypeSysName));
end;

procedure TfdcCustomObjectForm.SetModified(const Value: boolean);
var
  OldModified: boolean;
begin
  OldModified := Modified;

  { update edit object name }
  if Assigned(EditObject) then
    EditObject.ObjName := Trim(edtName.Text);

  { set modified flag }
  inherited;

  { update navigator }
  if OldModified <> Modified then
    Navigate(False);
end;

function TfdcCustomObjectForm.MakeCaption(AUseModifiedFlag: boolean = True): string;
begin
  Result := inherited MakeCaption(AUseModifiedFlag);
  
  { check edit object }
  if (not Assigned(EditObject)) or
     (not Assigned(EditObjectType)) then Exit;

  { make caption string }
  Result := EditObject.Caption;
  if Modified and AUseModifiedFlag then
    Result := SModifiedFlag + Result;
end;

function TfdcCustomObjectForm.GetIsNew: boolean;
begin
  Result :=
    (not Assigned(EditObject)) or
    (EditObject.IsNew);
end;

function TfdcCustomObjectForm.GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass;
begin
  Result := TfdcNavigableCustomObjectFormAdapter;
end;

function TfdcCustomObjectForm.ShowForm(AClassName: string;
  AParams: TParams; ADockSite: TWinControl): TForm;
begin
  Result := nil;
  if Assigned(ObjectServices) then
    Result := ObjectServices.ShowForm(AClassName, Params, ADockSite);
end;

procedure TfdcCustomObjectForm.FormShow(Sender: TObject);
begin
  inherited;
  Navigate(True);
end;

procedure TfdcCustomObjectForm.FormActivate(Sender: TObject);
begin
  inherited;
  Navigate(False); 
end;

procedure TfdcCustomObjectForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  { free new unsaved object }
  if Assigned(EditObject) and
     EditObject.IsNew then
    EditObject.Free;
end;

procedure TfdcCustomObjectForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ReopenDatasets;
  UpdateFormIcon;
  UpdatePageControl;
  UpdateStateTransitItem;
  UpdateLayoutControl(IsNew, lcGeneral, GetReadOnly);
end;

procedure TfdcCustomObjectForm.actChangeStateUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(EditObjectType) and
    EditObjectType.HasStateScheme and
    dsState.Active and
    (not dsState.IsEmpty);
end;

procedure TfdcCustomObjectForm.actChangeStateExecute(Sender: TObject);
var
  TransitID: double;
begin
  inherited;

  { warn user }
  if (not (Sender is TdxBarButton)) or
     (WarningDlg(
        TdxBarButton(Sender).Caption + '. Продолжить?',
        'Если Вы хотите выполнить данное действие, нажмите "Да", иначе нажмите "Нет"'
      ) <> mrYes)
  then
    Exit;

  { remind about saving }
  if Modified and
    (WarningDlg(
         'Данные не были сохранены. Сохранить?',
         'Для выполнения выбранного действия желательно сохранить внесенные изменения. ' +
         'Если Вы хотите сохранить изменения, нажмите "Да", иначе нажмите "Нет".'
       ) = mrYes)
  then
    SaveData(False);

  { extract transit id from menu item's Data property }
  TransitID := Integer((Sender as TdxBarButton).Data);

  { update state }  
  dsUpdateState.ParamByName('ID').AsFloat := ID;
  dsUpdateState.ParamByName('STATE_TRANSIT_ID').AsFloat := TransitID;
  dsUpdateState.ExecSQL;

  { refresh data }
  RefreshData;
end;

procedure TfdcCustomObjectForm.actNewUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(ObjectServices);
end;

procedure TfdcCustomObjectForm.actNewExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.CreateObject(EditObject.TypeSysName, True, Params);
end;

procedure TfdcCustomObjectForm.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (Assigned(ObjectServices)) and
    (Assigned(EditObject)) and
    (not EditObject.IsNew);
end;

procedure TfdcCustomObjectForm.actDeleteExecute(Sender: TObject);
begin
  inherited;

  { warn user }
  if WarningDlg(
       'Удаление объекта. Продолжить?',
       dsDataTYPENAME.asString + ' ' + dsDataNAME.asString + ' будет удален. ' +
         'Удаление объекта невозможно будет отменить. '#10 +
         'Удалить объект?'
     ) <> mrYes then
   Exit;

  { free object }
  Modified := False;
  ObjectServices.FreeObject(ID);
  { notify waiters refreshing }
  RefreshWaiters;
end;

procedure TfdcCustomObjectForm.actRefreshExecute(Sender: TObject);
var
  UserChoice: TModalResult;
begin
  { warn user }
  if Modified then
    UserChoice := MessageDlg(
      'Обновление представления. Сохранить изменения?',
      'Если Вы хотите сохранить сделанные изменения и обновить представление, нажмите "Да", ' +
      'если хотите обновить представление не сохраняя изменений, нажмите "Нет", иначе нажмите "Отмена".',
      '', mtWarning, mbYesNoCancel, 0)
  else
    UserChoice := mrNo;

  { process user choice }
  case UserChoice of

    { save and refresh data }
    mrYes: SaveData;

    { refresh data without saving }
    mrNo: inherited;

    { cancel and do nothing }
    else Exit;
  end;
end;

procedure TfdcCustomObjectForm.actSaveExecute(Sender: TObject);
var
  WasNew: boolean;
begin
  { save is new state }
  WasNew := IsNew;
  { save changes }
  inherited;
  { force to navigate opened tab pages }
  if WasNew then
    Navigate(True);
end;

procedure TfdcCustomObjectForm.PageControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (not IsNew) and
     (pcMain.ActivePage = tabGeneral) then
    pcMain.BeginDrag(False);
end;

procedure TfdcCustomObjectForm.tabGeneralStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  if not IsNew then
    DragObject := GetDragObject(Sender);
end;

procedure TfdcCustomObjectForm.SetRequireMark(ARootComp: TComponent);

  procedure SetCaption(AItem: TdxLayoutItem);
    var
     str : string;
     fld : TField;
  begin
    str := Trim(AItem.Caption);

    if ((Length(str) = 0) or ( str[Length(str)] <> '*') ) and
       Assigned(AItem.Control) and (AItem.Control is TcxCustomTextEdit) and
       Assigned( TFakeClass(AItem.Control).DataBinding) and
       (TFakeClass(AItem.Control).DataBinding is TcxDBEditDataBinding) then
      with TcxDBEditDataBinding(TFakeClass(AItem.Control).DataBinding) do
        if Assigned(DataSource) and Assigned(DataSource.DataSet) and
           Assigned(DataSource.DataSet.FindField(DataField))then
          begin
            fld := DataSource.DataSet.FindField(DataField);
            if fld.Required and not fld.ReadOnly then
              AItem.Caption := AItem.Caption + ' *';
          end;
  end;

var
  i : integer;
begin
  if Assigned(ARootComp) then
  for i:=0 to ARootComp.ComponentCount - 1 do
    begin
      if ARootComp.Components[i].ComponentCount > 0 then
        SetRequireMark(ARootComp.Components[i]);

      if ARootComp.Components[i] is TdxLayoutItem then
        SetCaption(ARootComp.Components[i] as TdxLayoutItem);
    end;
end;

procedure TfdcCustomObjectForm.FormCreate(Sender: TObject);
begin
  inherited;
  if FAutoMarkingRequiredField then SetRequireMark(Self);
end;

end.
