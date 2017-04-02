{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: ObjectFrm.pas $
  $Revision: 15013 $
  $Author: adavletyarov $
  $Date: 2012-06-04 11:03:09 +0400 (РџРЅ, 04 РёСЋРЅ 2012) $
}
unit ObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomObjectFrm, DB, FDCCustomDataset, FDCQuery,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer, cxDropDownEdit,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMemo, cxDBEdit,
  cxTextEdit, cxPC, cxControls, fdcParamsHolder, cxButtonEdit;

type
  TObjectForm = class(TfdcCustomObjectForm)
    lblFake: TLabel;
    pcService: TcxPageControl;
    tabService: TcxTabSheet;
    tabHistory: TcxTabSheet;
    tabAccess: TcxTabSheet;
    tabFake: TcxTabSheet;
    tabValues: TcxTabSheet;
    tabChildObjects: TcxTabSheet;
    tabRelations: TcxTabSheet;
    dsDataOBJECTKINDLIST: TStringField;
    tabTransactions: TcxTabSheet;
    actCreateActCorrOB: TAction;
    btnCreateActCorrOB: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tabServiceShow(Sender: TObject);
    procedure tabAccessShow(Sender: TObject);
    procedure tabValuesShow(Sender: TObject);
    procedure tabChildObjectsShow(Sender: TObject);
    procedure tabHistoryShow(Sender: TObject);
    procedure tabRelationsShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure tabTransactionsShow(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actCreateActCorrOBExecute(Sender: TObject);
    procedure actCreateActCorrOBUpdate(Sender: TObject);
  private
    { ссылки на дочерние формы списков }
    FGrantGridForm: TForm;
    FValueGridForm: TForm;
    FChildObjectGridForm: TForm;
    FEventGridForm: TForm;
    FRelationGridForm: TForm;
    fTransactionsForm: TForm;
  protected
    function Validate: Boolean; virtual;
    function IsDuplicate: Boolean; virtual;
    function GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass; override;
    property ValueGridForm: TForm read FValueGridForm;
    property TransactionsForm: TForm read fTransactionsForm write fTransactionsForm;
  end;

var
  ObjectForm: TObjectForm;

implementation

uses
  MainDm, fdcUtils, fdcMessages, fdcCustomDBDataFrm,
  fdcActCorrectObSelectTypeOBDlgFrm, ActCorrectOperBalansFrm,
  ActCorrectOperBalansTranGridFrm, ActCorrectOperBalansTranGridByActFrm,
  ActCorrectOperBalansTranFrm;

{$R *.dfm}

type

  { TfdcNavigableObjectFormAdapter }
  TfdcNavigableObjectFormAdapter = class(TfdcNavigableCustomObjectFormAdapter)
  private
    function GetOwnerForm: TObjectForm;
  public
    function GetSubItemCount(AItem: TControl): integer; override;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl; override;
    //function GetActiveItem: TControl; override;
    procedure ActivateItem(AItem: TControl); override;

    property OwnerForm: TObjectForm read GetOwnerForm;
  end;

{ TfdcNavigableObjectFormAdapter }

function TfdcNavigableObjectFormAdapter.GetOwnerForm: TObjectForm;
begin
  Result := (inherited OwnerForm) as TObjectForm;
end;

function TfdcNavigableObjectFormAdapter.GetSubItemCount(
  AItem: TControl): integer;
begin
  if AItem = OwnerForm.tabService then
    Result := OwnerForm.pcService.TabCount
  else
    Result := inherited GetSubItemCount(AItem);
end;

function TfdcNavigableObjectFormAdapter.GetSubItem(
  AItem: TControl; AItemIndex: integer): TControl;
begin
  if AItem = OwnerForm.tabService then
    Result := OwnerForm.pcService.Pages[OwnerForm.pcService.Tabs[AItemIndex].Index]
  else
    Result := inherited GetSubItem(AItem, AItemIndex);
end;

{function TfdcNavigableObjectFormAdapter.GetActiveItem: TControl;
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

procedure TfdcNavigableObjectFormAdapter.ActivateItem(AItem: TControl);
begin
  inherited ActivateItem(AItem);

  if (AItem is TcxTabSheet) and
     ((AItem as TcxTabSheet).PageControl = OwnerForm.pcService) then
    OwnerForm.pcMain.ActivePage := OwnerForm.tabService;
end;

{ TObjectForm }

function TObjectForm.GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass;
begin
  Result := TfdcNavigableObjectFormAdapter;
end;

procedure TObjectForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
  fTransactionsForm:= nil;
end;

procedure TObjectForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  mr: TModalResult;
  CardName: string;
begin
  // не вызываем inherited !

  // ***** TfdcCustomCardForm
  if not Modified then
    CanClose := True
  else begin
    CardName := MakeCaption(False);
    mr := MessageDlg(
      'Сохранить изменения "' + CutRight(CardName) + '"?',
      'После закрытия окна все сделанные изменения "' +
      CardName + '" будут потеряны. ' +
      'Если Вы хотите сохранить изменения, нажмите "Да", ' +
      'если изменения сохранять не надо, нажмите "Нет", ' +
      'для отмены закрытия окна нажмите "Отмена".',
      '', mtWarning, [mbYes, mbNo, mbCancel], 0);
    CanClose := IfElse(mr <> mrCancel, True, False);
    if mr = mrYes then
      if IsDuplicate then
        CanClose := False
      else
      begin
        if not Validate then
          Exit;
        SaveData(FormStyle <> fsMDIChild);
      end;
  end;
  if not CanClose then
    Exit;

  if Assigned(FValueGridForm) and
     Assigned(FValueGridForm.OnCloseQuery) then
    FValueGridForm.OnCloseQuery(Self, CanClose);
end;

procedure TObjectForm.tabServiceShow(Sender: TObject);
var
  ActivePage: TcxTabSheet;
begin
  inherited;
  { force to show active page }
  ActivePage := pcService.ActivePage;
  pcService.ActivePage := tabFake;
  pcService.ActivePage := ActivePage;
end;

procedure TObjectForm.tabAccessShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FGrantGridForm) then
    FGrantGridForm := ShowForm('TObjectGrantGridForm', Params, tabAccess);
end;                            

procedure TObjectForm.tabValuesShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FValueGridForm) then
     FValueGridForm := ShowForm('TValueGridByObjectForm', Params, tabValues);
end;

procedure TObjectForm.tabChildObjectsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FChildObjectGridForm) then
     FChildObjectGridForm := ShowForm('TObjectGridByOwnerForm', Params, tabChildObjects);
end;

procedure TObjectForm.tabHistoryShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FEventGridForm) then
    FEventGridForm := ShowForm('TEventGridByObjectForm', Params, tabHistory);
end;

procedure TObjectForm.tabRelationsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRelationGridForm) then
     FRelationGridForm := ShowForm('TObjectRelationGridByObjectForm', Params, tabRelations);
end;

function TObjectForm.IsDuplicate: Boolean;
begin
  Result := False;
end;

function TObjectForm.Validate: Boolean;
begin
  Result := True;
end;

procedure TObjectForm.actSaveExecute(Sender: TObject);
begin
  if not Validate then
    Exit;
  inherited;
  if FormStyle = fsNormal then ModalResult := mrOk;
end;

procedure TObjectForm.tabTransactionsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(fTransactionsForm) then
    begin
      fTransactionsForm := ShowForm('TTransByDocumentGridForm', Params, tabTransactions);
      TObjectForm(fTransactionsForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(fTransactionsForm));
    end;
end;

procedure TObjectForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
{
  if (dsData.FindField('IS_ACTIVE') = nil) then
    begin
      tabTransactions.TabVisible := false;
    end
  else
    begin
      tabTransactions.TabVisible := (dsData.FieldByName('IS_ACTIVE').AsString = 'Y');
    end;
}
  //--
  actCreateActCorrOB.Enabled := tabTransactions.TabVisible;
  actCreateActCorrOB.Visible := actCreateActCorrOB.Enabled;
  //--
end;

procedure TObjectForm.actCreateActCorrOBExecute(Sender: TObject);
  //--
  var l_act_id: String;
      l_form_act, l_form_trans : TForm;
      l_params: TfdcParams;
  //--
  procedure setdoubleparam(aparams: TParams;aparam_name: String;avalue: Double);
  begin
    if (Assigned(aparams)) then
      begin
        if not(Assigned(aparams.FindParam(aparam_name))) then
         begin
           aparams.CreateParam(ftFloat, aparam_name, ptInput);
         end;
        aparams.ParamByName(aparam_name).AsFloat := avalue;
      end;
  end;
  //--
begin
 l_act_id := GetActCorrOb_ID;
 if (l_act_id <> '') then
   begin
     l_form_act := ObjectServices.OpenObject( StrToFloat(l_act_id), nil );
     l_params := TfdcParams.Create(self);
     try
       l_params.Fill(TActCorrectOperBalansForm(l_form_act).ParamsHolder.Params);
       //--
       setdoubleparam(TParams(l_params),'act_id',StrToFloat(l_act_id));
       setdoubleparam(TParams(l_params),'reldocid',dsDataID.AsFloat);
       setdoubleparam(TParams(l_params),'balans_type',TActCorrectOperBalansForm(l_form_act).dsDataBALANS_TYPE.AsFloat);
       //--
       l_form_trans := ObjectServices.CreateObject('ActCorrectOperBalansTran',false,TParams(l_params));
     finally
       FreeAndNil(l_params);
     end;
   end;
end;

procedure TObjectForm.actCreateActCorrOBUpdate(Sender: TObject);
begin
  if (dsData.FindField('IS_ACTIVE') <> nil) then
    begin
      (Sender as TAction).Enabled := (Sender as TAction).Visible
                                     and Assigned(ObjectServices)
                                     and (dsData.FieldByName('IS_ACTIVE').AsString = 'Y');
    end
  else
    begin
      (Sender as TAction).Enabled := false;
    end;
end;

initialization
  RegisterClass(TObjectForm);

end.
