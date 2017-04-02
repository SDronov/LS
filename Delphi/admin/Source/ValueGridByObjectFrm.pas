unit ValueGridByObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGrid,
  cxGridCustomView, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TValueGridByObjectForm = class(TObjectGridForm)
    dsDataSTRINGVALUE: TStringField;
    dsDataNUMVALUE: TFloatField;
    dsDataDATETIMEVALUE: TDateTimeField;
    dsDataREF_OBJECT_ID: TFloatField;
    dsDataOWNERNAME: TStringField;
    dsDataOWNERTYPENAME: TStringField;
    dsDataOWNERTYPESYSNAME: TStringField;
    dsDataREFNAME: TStringField;
    dsDataREFTYPENAME: TStringField;
    dsDataREFTYPESYSNAME: TStringField;
    dsDataFILESOURCENAME: TStringField;
    actAddFile: TAction;
    btnFiles: TdxBarSubItem;
    btnAddFile: TdxBarButton;
    btnOpenFile: TdxBarButton;
    btnSaveFile: TdxBarButton;
    actOpenFile: TAction;
    actSaveEditFile: TAction;
    dsAddFile: TfdcQuery;
    dlgOpenFile: TOpenDialog;
    actSaveDisk: TAction;
    dxBarButton1: TdxBarButton;
    dlgSaveFile: TSaveDialog;
    procedure actAddFileExecute(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure actSaveEditFileExecute(Sender: TObject);
    procedure actSaveDiskExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueGridByObjectForm: TValueGridByObjectForm;

implementation

{$R *.dfm}

procedure TValueGridByObjectForm.actAddFileExecute(Sender: TObject);
var
  sName, sFileName: string;
begin
  inherited;

  if not dlgOpenFile.Execute then exit;
  sFileName := ExtractFileName(dlgOpenFile.FileName);
  sName := sFileName;

  if not InputQuery('Укажите название', 'Название', sName) then exit;

  with dsAddFile do
    begin
      ParamByName('Object_ID').asFloat := dsData.ParamByName('ID').asFloat;
      ParamByName('Name').asString := sName;
      ParamByName('FileName').asString := sFileName;
      ExecSQL;
    end;

   ShowProgress('Импорт файла...');
   try
     ObjectServices.GetFileFactory.ImportFile(dsAddFile.ParamByName('ID').asFloat, dlgOpenFile.FileName);
   finally
     ShowProgress('');
   end;

   actRefreshExecute(Self);
end;

procedure TValueGridByObjectForm.actOpenFileExecute(Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;
  ObjectServices.GetFileFactory.OpenFile(dsDataRef_Object_ID.asFloat, dsDataFileSourceName.asString);
end;

procedure TValueGridByObjectForm.actSaveEditFileExecute(Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;
  if not Assigned(ObjectServices.GetFileFactory.FindByID(dsDataRef_Object_ID.asFloat)) then
     raise Exception.Create('Сохранение редактирования возможно только для открывавшихся приложением файлов.');

  ObjectServices.GetFileFactory.SaveFileFromDirectory(dsDataRef_Object_ID.asFloat, dsDataFileSourceName.asString);
end;

procedure TValueGridByObjectForm.actSaveDiskExecute(Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;

  dlgSaveFile.DefaultExt := copy(ExtractFileExt(dsDataFileSourceName.asString), 2, 255);
  dlgSaveFile.FileName := dsDataFileSourceName.asString;

  if not dlgSaveFile.Execute then exit;

  ObjectServices.GetFileFactory.ExportFile(dsDataRef_Object_ID.asFloat, dlgSaveFile.FileName);
end;

procedure TValueGridByObjectForm.FormCreate(Sender: TObject);
begin
  inherited;

  btnFiles.Visible := ivNever;
end;

initialization
  RegisterClass(TValueGridByObjectForm);

end.

