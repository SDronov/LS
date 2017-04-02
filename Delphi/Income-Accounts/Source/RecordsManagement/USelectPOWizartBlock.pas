unit USelectPOWizartBlock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxPC, StdCtrls,
  cxButtons, cxContainer, cxImage, ExtCtrls, OracleData, DBCtrls, cxCalc,
  cxDBEdit, Oracle, cxLabel, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit;

type
  TFSelectPOWizartBlock = class(TForm)
    Panel1: TPanel;
    cxImage2: TcxImage;
    dxLayoutControl1: TdxLayoutControl;
    btnCancel: TcxButton;
    btnOk: TcxButton;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutControl1Group8: TdxLayoutGroup;
    dxLayoutControl1Item10: TdxLayoutItem;
    dxLayoutControl1Item8: TdxLayoutItem;
    odsGetBlockPO: TOracleDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsGetBlockPO: TDataSource;
    odsGetBlockPOID: TFloatField;
    odsGetBlockPONAME: TStringField;
    odsGetBlockPOSUMMA_REZ: TFloatField;
    odsGetBlockPOSUMMA_OST: TFloatField;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_REZ: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_OST: TcxGridDBColumn;
    odsGetPO: TOracleDataSet;
    dsGetPO: TDataSource;
    odsGetPONAME: TStringField;
    odsGetPOSUMMA_OST: TFloatField;
    odsGetPOID: TFloatField;
    dxLayoutControl1Group1: TdxLayoutGroup;
    cxDateEdit1: TcxDateEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    oqSetBlockPO: TOracleQuery;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxStyleRepository1: TcxStyleRepository;
    cxCalcEdit1: TcxCalcEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item7: TdxLayoutItem;
    oqSetUnBlockPO: TOracleQuery;
    odsGetBlockPOKBKCODE: TStringField;
    cxGrid1DBTableView1KBKCODE: TcxGridDBColumn;
    odsGetOstKbk: TOracleDataSet;
    dsGetOstKbk: TDataSource;
    odsGetOstKbkKBKCODE: TStringField;
    odsGetOstKbkREG_SUM: TCurrencyField;
    odsGetOstKbkPAYMENT_ID: TFloatField;
    DefaultEditStyleController: TcxDefaultEditStyleController;
    WebEditStyleController: TcxEditStyleController;
    OfficeEditStyleController: TcxEditStyleController;
    DBLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Item2: TdxLayoutItem;
    DBLookupComboBox2: TcxLookupComboBox;
    dxLayoutControl1Item9: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure DBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure cxCalcEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FPOMaxSumma :Double;
  public
    { Public declarations }
    pDocId  : Double;
    pDocSub : Integer;
    pDocSum : Double;
    pDocCur : Integer;
  end;

var
  FSelectPOWizartBlock: TFSelectPOWizartBlock;

implementation

uses
  MainDm
 ,Math;

{$R *.dfm}

procedure TFSelectPOWizartBlock.cxButton1Click(Sender: TObject);
  var
    lv_CurSumma : Double;
begin
  lv_CurSumma := Round( cxCalcEdit1.Value * 100 ) / 100;
{  if PDocSum < lv_CurSumma then
    begin
      MessageDlg( Format( 'Указанная сумма для блокирования %n превышает необходимую %n.', [lv_CurSumma, PDocSum] ),  mtError, [mbOk], 0);
      exit;
    end;}
  if lv_CurSumma < 0 then
    begin
      MessageDlg('Указанная сумма для блокирования не может быть отрицательной.',  mtError, [mbOk], 0);
      exit;
    end;
  if lv_CurSumma = 0 then
    begin
      MessageDlg('Указанная сумма для блокирования не может быть равной нулю.',  mtError, [mbOk], 0);
      exit;
    end;
  if lv_CurSumma > odsGetPO.FieldByName('summa_ost').AsFloat then
    begin
      MessageDlg('Указанная сумма для блокирования не может быть больше доступной на п/п ('+odsGetPO.FieldByName('summa_ost').AsString+'р.).',  mtError, [mbOk], 0);
      exit;
    end;
 	oqSetBlockPO.SetVariable('pSumma', lv_CurSumma);
 	oqSetBlockPO.SetVariable('pDocId', pDocId);
 	oqSetBlockPO.SetVariable('pPoId',  DBLookupComboBox1.EditValue);
 	oqSetBlockPO.SetVariable('pDate',  cxDateEdit1.Date);
 	oqSetBlockPO.SetVariable('pCode',  DBLookupComboBox2.EditValue);

	oqSetBlockPO.Execute;
	odsGetBlockPO.Refresh;
  odsGetPO.Refresh;
  if odsGetOStKbk.Active then odsGetOStKbk.Close;
//	pDocSum          := Round( ( PDocSum - lv_CurSumma ) * 100 ) / 100;
	pDocSum          := Round( ( PDocSum + lv_CurSumma ) * 100 ) / 100;
  cxLabel1.Caption := FloatToStr( pDocSum );
//  DBLookupComboBox1.Clear;
  cxCalcEdit1.Value := 0;
  odsGetOStKbk.Open;

end;

procedure TFSelectPOWizartBlock.FormShow(Sender: TObject);
begin
  cxLabel1.Caption:=FloatToStr(round(pDocSum*100)/100);
  cxDateEdit1.Date:=date;
  cxCalcEdit1.Value:=0;

  odsGetBlockPO.SetVariable('pId',pDocId);
  if odsGetBlockPO.Active then odsGetBlockPO.Close;
  odsGetBlockPO.Open;

  odsGetPO.SetVariable('pId',pDocSub);
  odsGetPO.SetVariable('pDocId',pDocId);
  odsGetPO.SetVariable('pCURRENCY_ID',pDocCur);
  if odsGetPO.Active then odsGetPO.Close;
    odsGetPO.Open;

  odsGetOstKbk.SetVariable('pId',odsGetPO.FieldValues['ID']);
  odsGetOStKbk.SetVariable('pDocId',pDocId);
  if odsGetOstKbk.Active then odsGetOstKbk.Close;
    odsGetOstKbk.Open;
end;

procedure TFSelectPOWizartBlock.cxButton2Click(Sender: TObject);
begin
  if not odsGetBlockPO.IsEmpty then
  if MessageDlg('Заблокированные средства на платежном документе будут разблокированы. Продолжить?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    pDocSum:=PDocSum - round(odsGetBlockPOSUMMA_REZ.Value*100)/100;
    cxLabel1.Caption:=FloatToStr(round(pDocSum*100)/100);
    oqSetUnBlockPO.SetVariable('pId',odsGetBlockPOID.Value);
    oqSetUnBlockPO.Execute;
 	  odsGetBlockPO.Refresh;
    odsGetPO.Refresh;
    if odsGetOStKbk.Active then odsGetOStKbk.Close;
    odsGetOStKbk.Open;
  end;
end;

procedure TFSelectPOWizartBlock.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  if odsGetOStKbk.FieldByName('reg_sum').IsNull then
    cxCalcEdit1.Value := 0
  else
    begin
//    if pDocSum < odsGetOStKbk.FieldValues['reg_sum'] then
//      cxCalcEdit1.Value := pDocSum
//    else
      cxCalcEdit1.Value := odsGetOStKbk.FieldValues['reg_sum'];
      FPOMaxSumma := odsGetOStKbk.FieldValues['reg_sum'];
    end;
end;

procedure TFSelectPOWizartBlock.DBLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  if odsGetOStKbk.Active then odsGetOStKbk.Close;
  odsGetOStKbk.SetVariable('pId',DBLookupComboBox1.EditValue);
  odsGetOStKbk.SetVariable('pDocId',pDocId);
  odsGetOStKbk.Open;
end;

procedure TFSelectPOWizartBlock.cxCalcEdit1PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  lv_MaxSumma : Double;
  lv_CurrentSumma : Double;
begin
  inherited;
  lv_MaxSumma := odsGetOStKbk.FieldValues['reg_sum'];
  lv_CurrentSumma := DisplayValue;
  if lv_CurrentSumma > lv_MaxSumma then
  begin
    ErrorText:= Format( 'Указанная сумма для блокирования %n больше доступной %n.', [lv_CurrentSumma, lv_MaxSumma] );
    cxCalcEdit1.Value := lv_MaxSumma;
    Error:= True;
  end;
end;

procedure TFSelectPOWizartBlock.btnOkClick(Sender: TObject);
begin
  cxCalcEdit1.Clear;
  if odsGetOStKbk.Active then odsGetOStKbk.Close;
  if odsGetPO.Active then odsGetPO.Close;
  if odsGetBlockPO.Active then odsGetBlockPO.Close;
end;

end.
