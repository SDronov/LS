unit qCustomTurnoverSheetFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridLevel, cxGrid, OracleData,
  cxGridCustomPopupMenu, cxGridPopupMenu, ExtCtrls;

type
  TCustomTurnoverSheetForm = class(TForm)
    grdTurnoverSheetLevel: TcxGridLevel;
    grdTurnoverSheet: TcxGrid;
    grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView;
    dsetData: TOracleDataSet;
    dsData: TDataSource;
    dsetAccount: TOracleDataSet;
    GridPopupMenu: TcxGridPopupMenu;
    PanelHeading: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure dsetDataBeforeQuery(Sender: TOracleDataSet);
    procedure dsetAccountBeforeQuery(Sender: TOracleDataSet);
    procedure dsetDataAfterOpen(DataSet: TDataSet);
  private
    fDSetParams   : TDataSet;
    fAccountID    : Integer;
    fAccountName  : string;
    fTemplateName : string;
    fvisible_detail  : boolean;
    function GetEnableDetailReport: Boolean;
  protected
    function GetAccountCode: string;   virtual;
    function GetAppendixNo: string;    virtual;
    function GetFormNo: string;        virtual;
    function GetXLSName: string;       virtual;
    function GetXLSDetailName: string; virtual;
    function GetMacroAfter: string;    virtual;
    function GetMacroBefore: string;   virtual;
  public
    function GetAccountID ( AAccountCode : string ) : Integer;
    function GetAddAccountID : Integer; virtual;
    property AccountCode  : string read GetAccountCode;
    property AccountName  : string read fAccountName;
    property AppendixNo   : string read GetAppendixNo;
    property FormNo       : string read GetFormNo;
    property XLSName      : string read GetXLSName;
    property XLSDetailName: string read GetXLSDetailName;
    property EnableDetailReport: Boolean read GetEnableDetailReport;
    property MacroAfter   : string read GetMacroAfter;
    property MacroBefore  : string read GetMacroBefore;
    property dsetParams   : TDataSet read fDSetParams write fDSetParams;
    property TemplateName : string read fTemplateName write fTemplateName;
    property pvisible_detail : boolean read fvisible_detail write fvisible_detail;

    procedure ParamsChanged;
    procedure RefreshData;
  end;

  TTurnoverSheetFormClass = class of TCustomTurnoverSheetForm;

var
  TurnoverSheetClassList : TList;
  TurnoverSheetTemplates : TStrings;

//procedure RegisterTurnoverSheetClass( AClass : TPersistentClass );
procedure RegisterTurnoverSheetClass( AClass : TPersistentClass; aTemplateName: string = '' );

const
  cNsiCurr = 'nsi_curr';

implementation

uses
  qTurnoverSheetsGridFrm,
  MainDm, Math, StrUtils;

{$R *.dfm}


procedure RegisterTurnoverSheetClass( AClass : TPersistentClass; aTemplateName: string = '' );
begin
  if not AClass.InheritsFrom( TCustomTurnoverSheetForm ) then
    raise Exception.CreateFmt( 'Класс %s не является наследником %s!', [ AClass.ClassName, TCustomTurnoverSheetForm.ClassName ] );

  if TurnoverSheetClassList.IndexOf( AClass ) = -1 then
  begin
    TurnoverSheetClassList.Add( AClass );
    TurnoverSheetTemplates.Add( aTemplateName );
  end;
  RegisterClass( AClass );
end;

{ TCustomTurnoverSheetForm }

function TCustomTurnoverSheetForm.GetAccountCode: string;
begin
  Result := '00.00.00';
end;

function TCustomTurnoverSheetForm.GetAppendixNo: string;
begin
  Result := '0';
end;

function TCustomTurnoverSheetForm.GetFormNo: string;
begin
  Result := '0';
end;

procedure TCustomTurnoverSheetForm.FormCreate(Sender: TObject);
begin
  fDSetParams   := nil;
  fAccountID    := -1;
  fAccountName  := '';
  fTemplateName := '';
  dsetAccount.SetVariable('DateFrom', Trunc(Now));
  fvisible_detail := false;
end;

procedure TCustomTurnoverSheetForm.ParamsChanged;
begin
  if dsetData.Active then
    dsetData.CloseAll;
end;

procedure TCustomTurnoverSheetForm.RefreshData;
begin
  if not Assigned( fDSetParams ) then
    raise Exception.Create( 'Не указан набор данных с параметрами!' );

  if dsetData.Active then
    dsetData.Refresh
  else
    dsetData.Open;
end;

procedure TCustomTurnoverSheetForm.dsetDataBeforeQuery(
  Sender: TOracleDataSet);
var
  I: Integer;
  F: TField;
begin
  if fAccountID = -1 then
    begin
      dsetAccount.Session := Sender.Session;
      dsetAccount.SetVariable( 'acc_code', GetAccountCode );
      dsetAccount.Open;
      if dsetAccount.IsEmpty then
        raise Exception.CreateFmt( 'Счёт с кодом [%s] не найден!', [GetAccountCode] );

      fAccountID   := dsetAccount.FieldByName( 'ID'   ).AsInteger;
      fAccountName := dsetAccount.FieldByName( 'NAME' ).AsString;

      Sender.SetVariable( 'account_id', fAccountID );

      dsetAccount.CloseAll;
    end;

  for I := 0 to Sender.VariableCount - 1 do
  begin
    F := fDSetParams.FindField( Copy( Sender.VariableName(I), 2, MaxInt ) );
    if Assigned( F ) then
      Sender.SetVariable(I, F.AsVariant);
  end;

  with Sender do
    if fDSetParams.FieldByName('CURRID').AsInteger <> -1 then
      begin
        if (VariableIndex('rur') >= 0) then
          begin
            SetVariable( 'rur',          '' );
          end;
        if (VariableIndex('curr_fields') >= 0) then
          begin
            SetVariable( 'curr_fields' , '' );
          end;
        if (VariableIndex(cNsiCurr) >= 0) then
          SetVariable(cNsiCurr , 'operation_sum');
      end
    else
      begin
        if (VariableIndex('rur') >= 0) then
          begin
            SetVariable( 'rur',          '_rur' );
          end;
        if (VariableIndex('curr_fields') >= 0) then
          begin
            SetVariable( 'curr_fields' , ':currid = :currid --' );
          end;
        if VariableIndex(cNsiCurr) >= 0 then
          SetVariable(cNsiCurr , 'sum_rur');
      end;
end;

function TCustomTurnoverSheetForm.GetXLSName: string;
begin
  Result := 'template.xls';
end;

function TCustomTurnoverSheetForm.GetAccountID(
  AAccountCode: string): Integer;
begin
  dsetAccount.Session := dsetData.Session;
  dsetAccount.SetVariable( 'acc_code', AAccountCode );
  dsetAccount.Open;

  if dsetAccount.IsEmpty then
    raise Exception.CreateFmt( 'Счёт с кодом [%s] не найден!', [AAccountCode] );

  Result := dsetAccount.FieldByName( 'ID' ).AsInteger;

  dsetAccount.CloseAll;
end;

function TCustomTurnoverSheetForm.GetMacroAfter: string;
begin
  Result := '';
end;

function TCustomTurnoverSheetForm.GetMacroBefore: string;
begin
  Result := '';
end;

procedure TCustomTurnoverSheetForm.dsetAccountBeforeQuery(
  Sender: TOracleDataSet);
begin
  inherited;
  TOracleDataSet(Sender).SetVariable('DateFrom', qTurnoverSheetsGridFrm.DateFrom);
end;

procedure TCustomTurnoverSheetForm.dsetDataAfterOpen(DataSet: TDataSet);
  var li: integer;
begin
 //--
 grdTurnoverSheetDBBandedTableView.ApplyBestFit();
 for li := 0 to grdTurnoverSheetDBBandedTableView.ColumnCount-1 do
 begin
   if (grdTurnoverSheetDBBandedTableView.Columns[li].DataBinding.ValueType = 'Float') then
     begin
       grdTurnoverSheetDBBandedTableView.Columns[li].Width := grdTurnoverSheetDBBandedTableView.Columns[li].Width + 12;
     end;
 end;
 //--
end;

function TCustomTurnoverSheetForm.GetEnableDetailReport: Boolean;
begin
  Result := GetXLSDetailName <> EmptyStr;
end;

function TCustomTurnoverSheetForm.GetXLSDetailName: string;
begin
  Result := EmptyStr;
end;

function TCustomTurnoverSheetForm.GetAddAccountID: Integer;
begin
  Result := 0;
end;

initialization
  TurnoverSheetClassList := TList.Create;
  TurnoverSheetTemplates := TStringList.Create;

finalization
  TurnoverSheetClassList.Free;
  TurnoverSheetTemplates.Free;

end.
