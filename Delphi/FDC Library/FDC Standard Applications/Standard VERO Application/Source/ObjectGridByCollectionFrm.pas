unit ObjectGridByCollectionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, fdcObjectCore;

type
  TObjectGridByCollectionForm = class(TObjectGridForm)
    dsDataCOLLECTION_OBJECT_ID: TFloatField;
    dsDataCOLLECTION_ID: TFloatField;
    dsDataOBJECT_ID: TFloatField;
    dsDataROLENAME: TStringField;
    dsDataCODESCRIPT: TStringField;
    dsDataFILESOURCENAME: TStringField;
    grdDataDBBandedTableViewROLENAME: TcxGridDBBandedColumn;
    actAddFile: TAction;
    actOpenFile: TAction;
    actSaveEditFile: TAction;
    actSaveDisk: TAction;
    btnFiles: TdxBarSubItem;
    btnAddFile: TdxBarButton;
    btnSaveEditFile: TdxBarButton;
    btnOpenFile: TdxBarButton;
    btnSaveDisk: TdxBarButton;
    dlgSaveFile: TSaveDialog;
    dlgOpenFile: TOpenDialog;
    dsAddFile: TfdcQuery;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveDiskExecute(Sender: TObject);
    procedure actSaveEditFileExecute(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure actAddFileExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fRoleName: string;

    procedure DoObjectSearchFinished(const ADragObject: TfdcDragObject);

    procedure AddObject(AObject: TfdcObject; AIndex, ACount: integer;
                    var ADescr: string; var ABreak: boolean);
    procedure RemoveObject(AGridTableView: TcxGridTableView; AIndex, ACount: integer;
                    var ADescr: string; var ABreak: boolean);
  public
    { Public declarations }
    procedure AddObjects(AObjects: TfdcObjectList);
  end;

var
  ObjectGridByCollectionForm: TObjectGridByCollectionForm;

implementation

uses fdcUtils, fdcMessages, MainDm;
{$R *.dfm}

procedure TObjectGridByCollectionForm.AddObject(AObject: TfdcObject; AIndex, ACount: integer;
    var ADescr: string; var ABreak: boolean);
var
  CollectionName: string;
  ObjectName: string;
  UserMessage: string;
  UserHint: string;
  MR: TModalResult;
begin
  try
    ADescr := 'Добавление объектов в подборку...';
    ShowProgress(ADescr);
    if Assigned(AObject)
         and AObject.IsOfType('Object')
         and (not AObject.IsNew)
         and (not IsNewID(ParamByName('ID').AsFloat)) then
       begin
         MR := mrYes;

         if AObject.IsOfType('Collection') then
            MR := MessageDlg('Помещение подборки в подборку',
               'Включить подборку как объект (Да) или объединить содержание с удалением присоединяемой подборки (Нет)?',
               '', mtConfirmation, [mbYes, mbNo, mbCancel], 0);

         case MR of
           mrYes:
             MainData.AddObjectToCollection(AObject.ID, ParamByName('ID').AsFloat, fRoleName);
           mrNo:
             MainData.MergeCollection(ParamByName('ID').AsFloat, AObject.ID, fRoleName);
         end;
       end;
  except
    on E: Exception do
       begin
         { подготовить текст сообщения }
         CollectionName := ParamByName('NAME').AsString;
         ObjectName := AObject.ObjName;
         UserMessage := 'Ошибка добавления объекта в подборку';
         UserHint := 'При попытке добавления объекта ' +
               ObjectName + ' в подборку ' + CollectionName + ' произошла ошибка.';

         { показать сообщение }
         if AIndex < (ACount - 1) then
            begin
              UserHint := UserHint + #10'Продолжить добавление оставшихся объектов в подборку?';
              if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
                 ABreak := True;
            end
          else
            MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
       end;
  end;
end;

procedure TObjectGridByCollectionForm.RemoveObject(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  CollectionName: string;
  ObjectName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := 'Исключение объекта из подборки...';
    ShowProgress(ADescr);
    if (not dsDataCollection_Object_ID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat)) then
          MainData.RemoveObjectFromCollection(dsDataCollection_Object_ID.AsFloat);
  except
    on E: Exception do
       begin
         { подготовить текст сообщения }
         ObjectName := dsDataNAME.AsString;
         CollectionName := ParamByName('NAME').AsString;
         UserMessage := 'Ошибка исключения объекта из подборки';
         UserHint := 'При попытке исключения объекта ' +
             ObjectName + ' из подборки ' + CollectionName + ' произошла ошибка.';

         { показать сообщение }
         with AGridTableView.Controller do
            if AIndex < (SelectedRecordCount - 1) then
               begin
                 UserHint := UserHint + #10'Продолжить исключение оставшихся объектов из подборки?';
                 if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
                    ABreak := True;
               end
             else
               MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
       end;
  end;
end;

procedure TObjectGridByCollectionForm.DoObjectSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddObjects(ADragObject.Objects);
end;

procedure TObjectGridByCollectionForm.AddObjects(
  AObjects: TfdcObjectList);
begin
  fRoleName := '';
  if not InputQuery('Укажите роль', 'Роль', fRoleName) then exit;

  IterateObjects(AObjects, AddObject);
end;

procedure TObjectGridByCollectionForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TObjectGridForm', 'Object', 0,
      Params, Self, True, DoObjectSearchFinished);
end;

procedure TObjectGridByCollectionForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('Исключить выбранные объекты из подборки?',
        'Сейчас будет проведено исключение выбранных объектов из подборки ' +
        ParamByName('NAME').AsString + '.'#10 +
        'Исключить объекты из подборки?') = mrYes then
     begin
       { удалить объект из подборки }
       try
         Refresh;
         with ActiveGridTableView.Controller do
             IterateRecords(RemoveObject, True, SelectedRecordCount > 1);
       finally
         RefreshData;
       end;

       { обновить ожидающие формы }
       RefreshWaiters;
     end;
end;

procedure TObjectGridByCollectionForm.grdDataDBBandedTableViewDragOver(
  Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  inherited;

  Accept :=
      (Source is TfdcDragObject) and
      ((Source as TfdcDragObject).Sender <> Sender) and
      ((Source as TfdcDragObject).HasMultipleObjectsOfType('Object'));
end;

procedure TObjectGridByCollectionForm.grdDataDBBandedTableViewDragDrop(
  Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  AddObjects((Source as TfdcDragObject).Objects);
end;

procedure TObjectGridByCollectionForm.actOpenExecute(Sender: TObject);
begin
  if (dsDataObject_ID.AsFloat > 0) then
     ObjectServices.OpenObject(dsDataObject_ID.AsFloat, nil);
end;

procedure TObjectGridByCollectionForm.actSaveDiskExecute(Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;

  dlgSaveFile.DefaultExt := copy(ExtractFileExt(dsDataFileSourceName.asString), 2, 255);
  dlgSaveFile.FileName := dsDataFileSourceName.asString;

  if not dlgSaveFile.Execute then exit;

  ObjectServices.GetFileFactory.ExportFile(dsDataObject_ID.asFloat, dlgSaveFile.FileName);
end;

procedure TObjectGridByCollectionForm.actSaveEditFileExecute(
  Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;
  if not Assigned(ObjectServices.GetFileFactory.FindByID(dsDataObject_ID.asFloat)) then
     raise Exception.Create('Сохранение редактирования возможно только для открывавшихся приложением файлов.');

  ObjectServices.GetFileFactory.SaveFileFromDirectory(dsDataObject_ID.asFloat, dsDataFileSourceName.asString);
end;

procedure TObjectGridByCollectionForm.actOpenFileExecute(Sender: TObject);
begin
  inherited;

  if dsDataFileSourceName.isNull then exit;
  ObjectServices.GetFileFactory.OpenFile(dsDataObject_ID.asFloat, dsDataFileSourceName.asString);
end;

procedure TObjectGridByCollectionForm.actAddFileExecute(Sender: TObject);
var
  sName, sFileName, sDescr: string;
  i: integer;
begin
  inherited;

  if not dlgOpenFile.Execute then exit;
  if (dlgOpenFile.Files.Count = 0) then exit;

  sName := '';
  if not InputQuery('Укажите роль', 'Роль', sName) then exit;

  sDescr := 'Добавление файлов в подборку...';
  ShowProgress(sDescr);

  try
    for i := 0 to (dlgOpenFile.Files.Count - 1) do
      begin
        sFileName := ExtractFileName(dlgOpenFile.Files[i]);

        with dsAddFile do
          begin
            ParamByName('Collection_ID').asFloat := Self.ParamByName('ID').asFloat;
            ParamByName('FileName').asString := sFileName;
            ParamByName('RoleName').asString := sName;
            ParamByName('Descript').asString := '';
            ExecSQL;
          end;

        ShowProgress('Идет загрузка файла...');
        ObjectServices.GetFileFactory.ImportFile(dsAddFile.ParamByName('ID').asFloat, dlgOpenFile.Files[i]);

        SetProgressEx(sDescr, (i+1)*100 div dlgOpenFile.Files.Count);
      end;
  finally
    HideProgressEx;
    actRefreshExecute(Self);
  end;
end;

procedure TObjectGridByCollectionForm.FormCreate(Sender: TObject);
begin
  inherited;

  btnFiles.Visible := ivNever;
end;

initialization
  RegisterClass(TObjectGridByCollectionForm);

end.
