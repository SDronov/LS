unit FileFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, cxContainer,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxControls,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxLookAndFeelPainters, cxButtons,
  fdcObjectCore, ComCtrls, ShlObj, cxShellCommon, cxShellListView;

type
  TFileForm = class(TObjectForm)
    edtSourceName: TcxDBTextEdit;
    lciSourceName: TdxLayoutItem;
    dsDataSOURCENAME: TStringField;
    actImportFile: TAction;
    actOpenFile: TAction;
    dlgOpenFile: TOpenDialog;
    actExportFile: TAction;
    dlgSaveFile: TSaveDialog;
    btnImportFile: TdxBarButton;
    btnExportFile: TdxBarButton;
    btnOpenFile: TdxBarButton;
    btnSaveFile: TdxBarButton;
    cxButton1: TcxButton;
    lcGeneralItem1: TdxLayoutItem;
    cxButton2: TcxButton;
    lcGeneralItem2: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    cxButton3: TcxButton;
    lcGeneralItem3: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure actOpenFileUpdate(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure actImportFileUpdate(Sender: TObject);
    procedure actImportFileExecute(Sender: TObject);
    procedure actExportFileUpdate(Sender: TObject);
    procedure actExportFileExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure UpdateFileIcon;
    procedure SaveLocalFile;
    procedure DeleteLocalFile;
  public
    { Public declarations }
  end;

var
  FileForm: TFileForm;

implementation

uses fdcMessages, fdcCustomObjectFrm, fdcCustomCardFrm, fdcCustomDataFrm;

{$R *.dfm}

procedure TFileForm.UpdateFileIcon;
//var
//  fi: TfdcFileInfo;
begin
  //fi := ObjectServices.GetFileFactory.FindByID(ID);
  //if Assigned(fi) then
  //  imglAction.ReplaceMasked(5, fi.Icon, fi.Icon.TransparentColor);
end;

procedure TFileForm.SaveLocalFile;
begin
  if not dsDataSOURCENAME.IsNull then
    with ObjectServices.GetFileFactory do
    begin
      UpdateFileInfo(ID, dsDataSOURCENAME.asString);
      if Assigned(FindByID(ID)) then
        SaveFileFromDirectory(ID, dsDataSOURCENAME.asString);
    end;    
end;

procedure TFileForm.DeleteLocalFile;
begin
  if Assigned(ObjectServices) then
    ObjectServices.GetFileFactory.DeleteFile(ID);
end;

procedure TFileForm.FormShow(Sender: TObject);
begin
  inherited;

  { import new file }
  if IsNew then
  begin
    actImportFile.Execute;
    if dsDataSOURCENAME.IsNull then
      Close;
  end;
end;

procedure TFileForm.actOpenFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not dsDataSourceName.IsNull);
end;

procedure TFileForm.actOpenFileExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.GetFileFactory.OpenFile(ID, dsDataSourceName.asString);
end;

procedure TFileForm.actImportFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible;
end;

procedure TFileForm.actImportFileExecute(Sender: TObject);
var
  fname: string;
begin
  inherited;

  { select file to import }
  if not dlgOpenFile.Execute then
    Exit;

  { warn user }  
  fname := ExtractFileName(dlgOpenFile.FileName);
  if (not dsDataSourceName.IsNull) and
     (ConfirmDlg('Импорт файла. Заменить?',
        'Заменить существующий файл ' + dsDataSourceName.asString + ' ' +
        'файлом ' + fname + '?') <> mrYes) then
    Exit;

  { copy selected file to directory }
  dsDataSOURCENAME.AsString := fname;
  if (Trim(dsDataNAME.AsString) = '') then
     dsDataNAME.AsString := fname;
  ObjectServices.GetFileFactory.CopyFileToDirectory(dlgOpenFile.FileName);
  UpdateFileIcon;
  Modified := True;
end;

procedure TFileForm.actExportFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    (not dsDataSOURCENAME.IsNull);
end;

procedure TFileForm.actExportFileExecute(Sender: TObject);
begin
  inherited;

  { select file to export }
  dlgSaveFile.FileName := dsDataSOURCENAME.AsString;
  dlgSaveFile.DefaultExt := Copy(ExtractFileExt(dlgSaveFile.FileName), 2, 255);
  if not dlgSaveFile.Execute then
    Exit;

  { export file }  
  ObjectServices.GetFileFactory.ExportFile(ID, dlgSaveFile.FileName);
end;

procedure TFileForm.actSaveUpdate(Sender: TObject);
begin
  { look for file modifications }
  if Assigned(ObjectServices) and
     (not Modified) then
    Modified := ObjectServices.GetFileFactory.IsFileChanged(ID);

  { update action }
  inherited;
end;

procedure TFileForm.actSaveExecute(Sender: TObject);
begin
  { save the object }
  inherited;

  { save local file }
  SaveLocalFile;

  { delete local file }
  DeleteLocalFile;
end;

procedure TFileForm.actDeleteExecute(Sender: TObject);
begin
  { delete local file }
  DeleteLocalFile;

  { delete the object }
  inherited;
end;

procedure TFileForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not dsDataSOURCENAME.IsNull then
    with ObjectServices.GetFileFactory do
      ObjectServices.GetFileFactory.ExportFile(ID,
        IncludeTrailingPathDelimiter(Directory) +
        dsDataSOURCENAME.AsString);
end;

initialization
  RegisterClass(TFileForm);

end.
