{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12254 $
  $Author: anaumenkov $
  $Date: 2011-01-18 22:32:29 +0400 (Р’С‚, 18 СЏРЅРІ 2011) $
}

unit NSIDictFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictFrm, cxDropDownEdit, cxCalendar, cxDBEdit, DB,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, dxBar, ImgList, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  dxLayoutControl, cxMaskEdit, cxButtonEdit, fdcObjectLinkEdit, cxMemo,
  cxTextEdit, cxPC, cxControls;

type
  TNSIDictForm = class(TDictForm)
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem1: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    lcGeneralItem4: TdxLayoutItem;
    edtDatBegDoc: TcxDBDateEdit;
    lcGeneralItem5: TdxLayoutItem;
    edtSDate: TcxDBDateEdit;
    lcGeneralItem6: TdxLayoutItem;
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    dsDataDATBEGDOC: TDateTimeField;
    dsDataNUMBEGDOC: TStringField;
    dsDataDATENDDOC: TDateTimeField;
    dsDataNUMENDDOC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edtPropertiesChange(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private
  protected
    function IsDuplicate: Boolean; override;
    function IsReadOnly: Boolean; virtual;
  public
    ReadOnly : Boolean;
  end;

var
  NSIDictForm: TNSIDictForm;

implementation

uses
  fdcDbUtils, fdcMessages, fdcCustomCardFrm, MainDm;

{$R *.dfm}

procedure TNSIDictForm.FormCreate(Sender: TObject);
begin
//  ClientHeight := ClientHeight - edtFullCode.Height * 3
//    - lcGeneral.LookAndFeel.Offsets.ControlOffsetVert * 2;
  inherited;
  ReadOnly := false;
end;

procedure TNSIDictForm.edtPropertiesChange(Sender: TObject);
begin
  Modified := True;
end;

function TNSIDictForm.IsDuplicate: Boolean;
var
  aWasSDateFocused: Boolean;
begin
  // force Date prop setting
  aWasSDateFocused := edtSDate.Focused;
  if aWasSDateFocused then
    edtCode.SetFocus;

  Result := GetQryFldVal('SELECT COUNT(*) FROM fdc_nsi_dict_lst WHERE '
    + ' UPPER(code) = :code AND sdate = TO_DATE(:sdate, ''dd.mm.yyyy'') AND id <> :id',
    Format('code,%s,sdate,%s,id,%d', [edtCode.Text,
      FormatDateTime('dd.mm.yyyy', edtSDate.Date), Round(ID)])) > 0;
  if Result then
  begin
    if aWasSDateFocused then
      edtCode.SetFocus;
    edtCode.SetFocus;
    MessageDlg('Дублирование не разрешено', Format('Объект с кодом %s и датой начала действия %s уже существует',
      [edtCode.Text, edtSDate.Text]) + #13#10'Измените код или дату', '', mtError, [mbOK], 0);
  end;
end;

procedure TNSIDictForm.actSaveExecute(Sender: TObject);
begin
//  if IsDuplicate then
//    Exit;
  inherited;
end;

procedure TNSIDictForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tabPositions.TabVisible := False;
end;

procedure TNSIDictForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  //inherited;
  if ReadOnly = true then
  begin
    actNew.Visible :=false;
    actSave.Visible := false;
  end;
end;

function TNSIDictForm.IsReadOnly: Boolean;
begin
  Result := not MainData.AccessModifyNSI;
end;

procedure TNSIDictForm.FormShow(Sender: TObject);
  var
    vTag : Integer;
    i    : Integer;
begin
  if not IsReadOnly then
    vTag := 00
  else
    vTag := 33;
  for i := 0 to dxLayoutGroup1.Count - 1 do
    if     (dxLayoutGroup1.Items[i] is TdxLayoutItem)
       and TdxLayoutItem( dxLayoutGroup1.Items[i] ).Visible then
      TdxLayoutItem( dxLayoutGroup1.Items[i] ).Tag := vTag;

  inherited;
end;

end.
