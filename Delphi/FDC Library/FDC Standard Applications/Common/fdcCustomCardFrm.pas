{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomCardFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomCardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fdcCustomDBDataFrm, ImgList, DB,
  FDCCustomDataset, FDCQuery, cxContainer, cxEdit, dxBar,
  dxLayoutControl, cxPC, cxControls, dxLayoutLookAndFeels,
  ActnList, ExtCtrls, StdCtrls, dxBarExtItems, Oracle,
  StrUtils, FDCOracleSession, ComCtrls, cxLookAndFeels, fdcParamsHolder;

const
  SModifiedFlag = '* ';

type

  { базовая форма карточки }
  TfdcCustomCardForm = class(TfdcCustomDBDataForm)
    actSave: TAction;
    dsDataID: TFloatField;
    dsInsert: TFDCQuery;
    dsUpdate: TFDCQuery;
    pcMain: TcxPageControl;
    tabGeneral: TcxTabSheet;
    lcGeneral: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    btnSave: TdxBarButton;
    dxBarDockControlTop: TdxBarDockControl;
    dxBarDockControlLeft: TdxBarDockControl;
    dxBarDockControlBottom: TdxBarDockControl;
    dxBarDockControlRight: TdxBarDockControl;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure Modify(Sender: TObject);
  private
    FModified: boolean;

    function GetID: double;
    procedure SetID(const Value: double);
    function GetModified: boolean;
  protected
    function GetIsNew: boolean; virtual;
    procedure SetModified(const Value: boolean); virtual;
    function MakeCaption(AUseModifiedFlag: boolean = True): string; virtual;
  public
    procedure RefreshData; override;
    procedure SaveData(AReopenAfterSave: boolean = True);

    property ID: double read GetID write SetID;
    property IsNew: boolean read GetIsNew;
    property Modified: boolean read GetModified write SetModified;
  end;

implementation

uses
  fdcUtils, fdcMessages, fdcCustomDataFrm;

{$R *.dfm}

function TfdcCustomCardForm.GetID: double;
begin
  { it is important to get ID from ParamsHolder not from Dataset }
  Result := ParamByName('ID').AsFloat;
end;

procedure TfdcCustomCardForm.SetID(const Value: double);
begin
  ParamByName('ID').AsFloat := Value;
  if Visible then
    RefreshData;
end;

function TfdcCustomCardForm.GetModified: boolean;
begin
  Result := FModified;
end;

function TfdcCustomCardForm.GetIsNew: boolean;
begin
  Result := IsNewID(ID);
end;

procedure TfdcCustomCardForm.SetModified(const Value: boolean);
begin
  { set modifications flag }
  FModified := Value and (not ReadOnly);

  { update form caption }
  Caption := MakeCaption;
end;

function TfdcCustomCardForm.MakeCaption(AUseModifiedFlag: boolean = True): string;
var
  ModifiedFlagPos: integer;
begin
  if IsNew then
    Result := 'Новая крточка'
  else
    Result := 'Карточка';  

  { get '*' pos }
  ModifiedFlagPos := Pos(SModifiedFlag, Result);

  { make caption string }
  if AUseModifiedFlag then begin
    if ModifiedFlagPos = 0 then
      Result := SModifiedFlag + Result;
  end else begin
    if ModifiedFlagPos = 1 then
      Result := Copy(Result, ModifiedFlagPos + 1, Length(Result) - Length(SModifiedFlag));
  end;
end;

procedure TfdcCustomCardForm.RefreshData;
begin
  inherited;
  Modified := False;
end;

procedure TfdcCustomCardForm.SaveData(AReopenAfterSave: boolean);
var
  SaveQuery: TfdcQuery;
begin
  if not Modified then Exit;

  { drop virtual ID value }
  if IsNew then
    dsDataID.Clear;

  { save data }  
  dsData.Post;
  try
    { get saving query }
    if IsNew then
      SaveQuery := dsInsert
    else
      SaveQuery := dsUpdate;

    { save data }
    SaveQuery.ExecSQL;

    { open object with correct new/same ID }
    if AReopenAfterSave then
      ID := SaveQuery.ParamByName('ID').AsFloat;

    { notify waiters refreshing }
    RefreshWaiters;
  finally
    dsData.Edit;
  end;
end;

procedure TfdcCustomCardForm.FormCreate(Sender: TObject);
begin
  inherited;
  { activate general page by default }
  pcMain.ActivePage := tabGeneral;
end;

procedure TfdcCustomCardForm.FormShow(Sender: TObject);
var
  i: integer;
  BarDockControl: TdxBarDockControl;
begin
  inherited;

  { hide single tab }
  if pcMain.PageCount <= 1 then begin
    pcMain.Style := 2; // flat style
    pcMain.HideTabs := True;
  end;

  { force toolbars to dock onto allowed dock sites
    cause in some cases BarManager does not do that }
  for i:=0 to BarManager.Bars.Count-1 do
    with BarManager.Bars[i] do
      if Visible then begin
        case DockedDockingStyle of
          dsLeft  : BarDockControl := dxBarDockControlLeft;
          dsTop   : BarDockControl := dxBarDockControlTop;
          dsRight : BarDockControl := dxBarDockControlRight;
          dsBottom: BarDockControl := dxBarDockControlBottom;
          else      BarDockControl := nil;
        end;
        ChangeDockingStyle(DockedDockingStyle, BarDockControl);
      end;
end;

procedure TfdcCustomCardForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  mr: TModalResult;
  CardName: string;
begin
  inherited;

  { warn user about unsaved changes presence }
  if not Modified then
    CanClose := True
  else begin
    CardName := MakeCaption(False);
    mr := MessageDlg(
      'Сохранить изменения "' + CutRight(CardName) + '"?',
      'После закрытия окна все сделанные изменения "' +
      CardName + '" будут потеряны. ' +
      'Если Вы хотите сохранить изменения нажмите "Да", ' +
      'если изменения сохранять не надо нажмите "Нет", ' +
      'для отмены закрытия окна нажмите "Отмена".',
      '', mtWarning, [mbYes, mbNo, mbCancel], 0);
    CanClose := IfElse(mr <> mrCancel, True, False);
    if mr = mrYes then
      SaveData(False);
  end;
end;

procedure TfdcCustomCardForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  { add new record for the new card }
  if (IsNew) and (not ReadOnly) then
    dsData.Insert;
end;

procedure TfdcCustomCardForm.actSaveUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Modified;
end;

procedure TfdcCustomCardForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  { save data changes }
  SaveData;
end;

procedure TfdcCustomCardForm.Modify(Sender: TObject);
begin
  inherited;
  { set modification flag }
  Modified := True;
end;

end.
