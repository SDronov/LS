unit DocPackReuseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DocPackFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  cxPC, cxControls, VKDBFDataSet, OracleData, JvBaseDlg, JvSelectDirectory,
  Oracle, cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxButtonEdit, fdcObjectLinkEdit, xlcClasses, xlEngine, xlReport,
  cxCurrencyEdit;

type
  TDocPackReuseForm = class(TDocPackForm)
    dsDataDATE_SEND: TDateTimeField;
    edtDateSend: TcxDBDateEdit;
    itemDateSend: TdxLayoutItem;
    dsetForDBF: TOracleDataSet;
    selDirectoryDlg: TJvSelectDirectory;
    pkgDocPackReuse: TOraclePackage;
    dsDataDESTINATION: TStringField;
    dsDataEXT_SOURCE: TStringField;
    dsDataEXT_TYPESYSNAME: TStringField;
    dsDataEXT_ID: TFloatField;
    lcbCustomsName: TcxDBLookupComboBox;
    itemDestination: TdxLayoutItem;
    dsetCustoms: TOracleDataSet;
    dsetCustomsCUSTOMS_CODE_8: TStringField;
    dsetCustomsNAME: TStringField;
    dsCustoms: TDataSource;
    edtDestinationName: TcxDBTextEdit;
    lciDestinationName: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    dsDataDESTINATION_NAME: TStringField;
    dxBarButton1: TdxBarButton;
    dsHeader: TfdcQuery;
    dsBody: TfdcQuery;
    xlrReestrReuse: TxlReport;
    dsDataSOURCE_NAME: TStringField;
    itemeditCustomSource: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    dsDataAMOUNT: TFloatField;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lcGeneralItem3: TdxLayoutItem;
    editCustomSource: TcxDBTextEdit;
    procedure tabDocsShow(Sender: TObject);
    procedure dsDataAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsStateAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsUpdateStateBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure lcbCustomsNamePropertiesCloseUp(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
  private
    { Private declarations }
    //fStateID_Formed : Integer;
    fStateTrasit_FormedForm : integer;
    function IncludeToTransport: boolean;
    function GetTransitIdByName(const AName: string):integer;
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

var
  DocPackReuseForm: TDocPackReuseForm;

implementation

uses
  fdcCustomDataFrm
 ,fdcCustomCardFrm
 ,MainDM
 ,fdcCustomDBDataFrm, fdcCustomObjectFrm, fdcMessages
 ,IniFiles;

{$R *.dfm}

{ TDocPackReuseForm }

function TDocPackReuseForm.GetDocsFormClassName: string;
begin
  Result := 'TDocReuseGridForm';
end;

procedure TDocPackReuseForm.tabDocsShow(Sender: TObject);
begin
  if not Assigned( Params.FindParam( 'Content' ) ) then
    Params.CreateParam( ftInteger, 'Content', ptInput ).AsInteger := 1;

  if not Assigned( Params.FindParam( 'pack_id' ) ) then
    begin
      Params.CreateParam( ftFloat, 'pack_id', ptInput ).AsFloat := Params.ParamByName( 'ID' ).AsFloat;
    end
  else
    begin
      Params.ParamByName( 'pack_id' ).AsFloat := Params.ParamByName( 'ID' ).AsFloat;
    end;
  inherited;
end;

procedure TDocPackReuseForm.dsDataAfterInsert(DataSet: TDataSet);
begin
  inherited;

  Modify( edtDocDate );
end;

procedure TDocPackReuseForm.FormCreate(Sender: TObject);
begin
  inherited;

  //fStateID_Formed := -1;
  dsetCustoms.Open;
  fStateTrasit_FormedForm := -1;
end;

procedure TDocPackReuseForm.dsStateAfterOpen(DataSet: TDataSet);
  var
     vReadOnly : boolean;
     vQuery : TOracleQuery;
begin
  vReadOnly := not (
                     (AnsiUpperCase(dsStateSYSNAME.Value) = 'STATE.PACKREUSE.CREATED') or
                     (AnsiUpperCase(dsStateSYSNAME.Value) = 'STATE.PACKREUSE.FORM')
                   );
  Params.ParamByName('TabDocsReadOnly').AsBoolean := vReadOnly;
  if Assigned(tabDocsForm) then
    (tabDocsForm as TfdcCustomDataForm).ParamByName('TabDocsReadOnly').AsBoolean := vReadOnly;

  fStateTrasit_FormedForm := GetTransitIdByName('StateTransit.PackReuse.Formed->Form');
{  dsState.First;
  while not dsState.Eof do
    begin
      if dsState.FieldByName( 'SysName' ).AsString = 'State.PackReuse.Formed' then
        begin
          fStateID_Formed := dsState.FieldByName( 'ID' ).AsInteger;
          break;
        end;

      dsState.Next;
    end;}
end;

procedure TDocPackReuseForm.FormShow(Sender: TObject);
begin
  inherited;
  if GetIsNew then
    begin
      edtDocDate.Date := Date;
      edtDocDate.PostEditValue;
    end;
end;

function TDocPackReuseForm.GetTransitIdByName(
  const AName: string): integer;
  var
   vQuery : TOracleQuery;
begin
  vQuery := TOracleQuery.Create(Self);
  with vQuery do
    Try
      Session := dsData.Session;
      SQL.Text := 'SELECT ID FROM Fdc_State_Transit_Lst t WHERE Upper(t.SYSNAME) = Upper(:TransName)';
      DeclareAndSet('TransName', otString , AName);
      Execute;
      if not Eof then
        Result := FieldAsInteger('ID')
      else
        Result := -1;
    finally
      vQuery.Free;
    end;
end;

function TDocPackReuseForm.IncludeToTransport: boolean;
  var
   vQuery : TOracleQuery;
begin
  vQuery := TOracleQuery.Create(Self);
  with vQuery do
    Try
      Session := dsData.Session;
      SQL.Text := 'SELECT 1 FROM fdc_rel_pack_docs_lst r WHERE r.rel_object_id = :DocID AND fdc_object_type_is_subtype(r.ObjTypeSysName, ''DocPackTransfer'') = 1';
      DeclareAndSet('DOCID', otInteger, ID);
      Execute;
      Result := not EoF;
    finally
      vQuery.Free;
    end;
end;

procedure TDocPackReuseForm.dsUpdateStateBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if (dsUpdateState.ParamByName('STATE_TRANSIT_ID').AsInteger = fStateTrasit_FormedForm) and
     IncludeToTransport then
    //ErrorDlg(Exception.Create('Реестр нельзя перевести в статус <Формируется>, т.к. он включен в конверт!'))
  Raise Exception.Create('Реестр нельзя перевести в статус <Формируется>, т.к. он включен в конверт!')
end;


procedure TDocPackReuseForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  if     not IsNew
     and ( MainData.GetSoftCustomsCode <> DataSet.FieldByName( 'EXT_SOURCE' ).AsString ) then
    begin
      itemDocDate.Tag     := 33;
      itemDestination.Tag := 33;
      itemSrcAppName.Tag  := 33;
      itemDstAppName.Tag  := 33;

      lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackAlien.Color
    end;

  if MainData.GetCustomsLevel in [2, 3, 4] then  // таможня, КНП-РТУ, КНП-ФТС
    begin
      itemDstAppName.Tag  := 33;
      itemDestination.Tag := 33;
    end
    else
      actNew.Visible      := False;

  if dsState.Active then
    dsState.Refresh
  else
    dsState.Open;

  if     not IsNew
     and ( dsState.FieldByName( 'SysName' ).AsString <> 'State.PackReuse.Created' ) then
    begin
      itemDstAppName.Tag  := 33;
      itemDestination.Tag := 33;
    end;

  inherited;

  if     not IsNew
     and ( dsState.FieldByName( 'SysName' ).AsString = 'State.PackReuse.Sended' ) then
    lcGeneral.LookAndFeel.GroupOptions.Color := MainData.stlDocPackSended.Color;
end;

procedure TDocPackReuseForm.lcbCustomsNamePropertiesCloseUp(
  Sender: TObject);
begin
  dsData.FieldByName( 'DESTINATION_NAME' ).Value := dsetCustoms.Lookup(
      'CUSTOMS_CODE_8', lcbCustomsName.EditValue, 'NAME'
    );
end;

procedure TDocPackReuseForm.dxBarButton1Click(Sender: TObject);
  procedure LoadReportQueryEx(aFileName: string);
    var
      IniFile: TMemIniFile;
      Strings: TStrings;
  begin
    Strings := nil;
    IniFile := TMemIniFile.Create(ChangeFileExt(aFileName, '.sql'));
    try
      Strings := TStringList.Create;
      IniFile.ReadSections(Strings);
      if (Strings.IndexOf('dsBody') > -1) then
          IniFile.ReadSectionValues('dsBody',
          dsBody.SQL);
      if (Strings.IndexOf('dsHeader') > -1) then
          IniFile.ReadSectionValues('dsHeader',
          dsHeader.SQL);
    finally
      IniFile.Free;
      Strings.Free;
    end;
  end;
begin
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
  // --- prepare template
  xlrReestrReuse.XLSTemplate :=ExtractFilePath(Application.ExeName) + 'Report\' +
                           'ReestrReuse.xls';
  LoadReportQueryEx(xlrReestrReuse.XLSTemplate);
  // --- open Query`s
  dsHeader.ParamByName( 'reestr_id' ).AsInteger := dsDataID.AsInteger;
  dsHeader.Open;

  dsBody.ParamByName( 'reestr_id' ).AsInteger := dsDataID.AsInteger;
  dsBody.Open;
  // --- generate report
  try
    xlrReestrReuse.Report(True);
  except on e:exception do
    begin
      raise;
    end;
  end;
  // --- close Query`s
  dsHeader.Close;
  dsBody.Close;
end;

procedure TDocPackReuseForm.actNewExecute(Sender: TObject);
begin
  if Assigned( Params.FindParam( 'Content' ) ) then
     Params.Delete(Params.FindParam( 'Content' ).Index);
  if Assigned( Params.FindParam( 'pack_id' ) ) then
     Params.Delete(Params.FindParam( 'pack_id' ).Index);
  inherited;
end;

initialization
  RegisterClass( TDocPackReuseForm );

end.
