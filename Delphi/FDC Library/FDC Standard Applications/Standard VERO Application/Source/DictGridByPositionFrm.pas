unit DictGridByPositionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, dxdbtrel,
  ComCtrls;

const
  cnDictNotSelected = '<Не выбран>';
  cnDictNoID = -1;

type
  TDictGridByPositionForm = class(TDictGridForm)
    pnlDictSelect: TPanel;
    lcDictSelectGroup_Root: TdxLayoutGroup;
    lcDictSelect: TdxLayoutControl;
    ltvDictItem: TdxLookupTreeView;
    lciDictItem: TdxLayoutItem;
    dsDictItem: TfdcQuery;
    srcDictItem: TDataSource;
    dsDictItemID: TFloatField;
    dsDictItemNAME: TStringField;
    dsDictItemSHORTNAME: TStringField;
    dsDictItemSYSNAME: TStringField;
    dsDictItemTABLENAME: TStringField;
    dsDictItemPARENT_OBJECT_TYPE_ID: TFloatField;
    dsDictItemIMAGEINDEX: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ltvDictItemCloseUp(Sender: TObject; Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ltvDictItemGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure dsDictItemCalcFields(DataSet: TDataSet);
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure actAddUpdate(Sender: TObject);
    procedure ltvDictItemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }

    fDictItemID: double;
    procedure SetDictItemID(pDictItemID: double);
  public
    { Public declarations }

    property DictItemID: double read fDictItemID write SetDictItemID;
  end;

var
  DictGridByPositionForm: TDictGridByPositionForm;

implementation

{$R *.dfm}

procedure TDictGridByPositionForm.SetDictItemID(pDictItemID: double);
begin
  if (fDictItemID <> pDictItemID) then
     begin
       fDictItemID := pDictItemID;
       dsData.ReQuery;
     end;
end;

procedure TDictGridByPositionForm.FormShow(Sender: TObject);
begin
  inherited;

  dsDictItem.Open;
  ltvDictItem.Text := cnDictNotSelected;
  ltvDictItem.TreeViewImages := ObjectServices.GetObjectTypeFactory.ImageList;
end;

procedure TDictGridByPositionForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  dsDictItem.Close;
end;

procedure TDictGridByPositionForm.ltvDictItemCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  inherited;

  if Accept then
     DictItemID := ltvDictItem.ListSource.DataSet.FieldByName('ID').asFloat;
end;

procedure TDictGridByPositionForm.FormCreate(Sender: TObject);
begin
  inherited;

  fDictItemID := cnDictNoID;
end;

procedure TDictGridByPositionForm.ltvDictItemGetSelectedIndex(
  Sender: TObject; Node: TTreeNode);
begin
  inherited;

  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TDictGridByPositionForm.dsDictItemCalcFields(DataSet: TDataSet);
begin
  inherited;

  dsDictItemImageIndex.asInteger := ObjectServices.GetObjectTypeFactory.GetImageIndex(dsDictItemID.asFloat);
end;

procedure TDictGridByPositionForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  dsData.ParamByName('Type_ID').asFloat := DictItemID;
end;

procedure TDictGridByPositionForm.actAddUpdate(Sender: TObject);
begin
  inherited;

  (Sender as TAction).Enabled := (Sender as TAction).Visible and (DictItemID > 0);
end;

procedure TDictGridByPositionForm.ltvDictItemKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key in [VK_BACK, VK_DELETE]) then
     begin
       ltvDictItem.Text := cnDictNotSelected;
       DictItemID := cnDictNoID;
     end;
end;

procedure TDictGridByPositionForm.actAddExecute(Sender: TObject);
var lSysName: string;
begin
  if (DictItemID <= 0) then exit;

  lSysName := ObjectServices.GetObjectTypeFactory.Find(DictItemID, TRUE).SysName;
  RegisterAsWaiterFor(ObjectServices.CreateObject(lSysName, False, Params));
end;

initialization
  RegisterClass(TDictGridByPositionForm);

end.
