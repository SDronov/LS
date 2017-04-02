// ������� "����������� ���������" ������ �� ����
// ����� �� ������������. ��������� �� ������ ������ (04.12.2008)
// ����� ����� ������������ � ��������� ������������ (24.03.2011)
unit SubjectMergeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, DB, dxmdaset,
  FDCCustomDataset, fdcQuery, Oracle, fdcObjectCore, fdcObjectServices,
  fdcCustomObjectGridFrm, cxCheckBox, dxBar, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  ImgList, cxImage;

type
  TSubjectMergeForm = class(TfdcCustomDlgForm)
    dsSubjects: TdxMemData;
    srcData: TDataSource;
    lcgGrid: TdxLayoutGroup;
    cxLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    dxLayoutControl1Item2: TdxLayoutItem;
    dsSubjectsFIRST_NAME: TStringField;
    dsSubjectsMIDDLE_NAME: TStringField;
    dsSubjectsLAST_NAME: TStringField;
    dsSubjectsINN: TStringField;
    dsSubjectsADDRESS: TStringField;
    dsSubjectsID: TIntegerField;
    cxView: TcxGridDBBandedTableView;
    cxViewID: TcxGridDBBandedColumn;
    cxViewFIRST_NAME: TcxGridDBBandedColumn;
    cxViewMIDDLE_NAME: TcxGridDBBandedColumn;
    cxViewLAST_NAME: TcxGridDBBandedColumn;
    cxViewINN: TcxGridDBBandedColumn;
    cxViewADDRESS: TcxGridDBBandedColumn;
    cxViewCheck: TcxGridDBBandedColumn;
    imglCheck: TImageList;
    imglAction: TImageList;
    actAdd: TAction;
    actOpen: TAction;
    actDelete: TAction;
    BarManager: TdxBarManager;
    btnAdd: TdxBarButton;
    btnOpen: TdxBarButton;
    btnDelete: TdxBarButton;
    qryMerge: TOracleQuery;
    dsSubjectsPRIVATE_OWNER: TStringField;
    cxViewPRIVATE_OWNER: TcxGridDBBandedColumn;
    qryGetAccountState: TfdcQuery;
    dsSubjectsACCOUNT_STATE: TStringField;
    cxViewACCOUNT_STATE: TcxGridDBBandedColumn;
    procedure OnSearchSrcSubjFinished(const ADragObject: TfdcDragObject);
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxViewCheckCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure dsSubjectsBeforeDelete(DataSet: TDataSet);
    procedure actOkUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actOpenUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure cxViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actAddUpdate(Sender: TObject);
  private
    FSelSubjID: Integer;
  public
  end;

  function ShowDialogForm(Session: TOracleSession): boolean;

implementation

{$R *.dfm}

uses
  fdcMessages, PersonGridFrm, Math, MainDm;
const
  cMaxSubj = 50;
  accNone = '';
  accActive = '�������';
  accClosed = '������';

function ShowDialogForm(Session: TOracleSession): boolean;
begin
  with TSubjectMergeForm.Create(nil) do
  try
    qryMerge.Session := Session;
    ModalResult := mrNone;
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TSubjectMergeForm.FormCreate(Sender: TObject);
begin
  inherited;
  FSelSubjID := 0;
  dsSubjects.Open;
end;

procedure TSubjectMergeForm.OnSearchSrcSubjFinished(const ADragObject: TfdcDragObject);
var
  vID, i: Integer;
  AccountState: string;
begin
  for i:= 0 to ADragObject.Objects.Count-1 do
    with ADragObject.Objects[i] do
    begin
      vID := FieldValues['ID'];
      AccountState := accNone;
      if VarIsNull(dsSubjects.Lookup('ID', vID, 'ID')) then
      begin
        if dsSubjects.RecordCount < cMaxSubj then
        begin
          if FieldValues['PRIVATE_OWNER'] = 'Y' then
          begin
            // ��������� ��������� �������� ����� � ��
            with qryGetAccountState do
            begin
              Close;
              Params[0].Value := vID;
              Open;
              AccountState := accClosed;
              if RecordCount = 0 then
                AccountState := accActive;
              Close;
            end;
            if not VarIsNull(dsSubjects.Lookup('PRIVATE_OWNER;ID', VarArrayOf(['N',FSelSubjID]) , 'ID')) then
              FSelSubjID := 0;
            if (AccountState = accActive) and (FSelSubjID = 0) then
              FSelSubjID := vID;
          end;

          dsSubjects.AppendRecord([
            dsSubjects.RecordCount,
            vID,
            FieldValues['FIRST_NAME'],
            FieldValues['MIDDLE_NAME'],
            FieldValues['LAST_NAME'],
            FieldValues['INN'],
            FieldValues['ADDRESS'],
            FieldValues['PRIVATE_OWNER'],
            AccountState
            ]);
        end
        else
        begin
          MessageDlg(Format('������� ����������� ��������� ���������� [%d]'+#13#10+'��������� ��� �������� �����������!'+#13#10, [cMaxSubj]),
            '��������� �������� ����� ������������� ���������� ����� ���������.', '', mtWarning, [mbOK], 0);
          Break;
        end;
      end;
    end;
  cxView.BeginUpdate;
  try
    cxView.ViewChanged;
  finally
    cxView.EndUpdate;
  end;
end;

procedure TSubjectMergeForm.actOkExecute(Sender: TObject);
var
  vDropList: Variant;
  vParentSubj, vSubjList: String;
  chkINN: Integer;

  procedure FillDropList;
   var
     vBM: TBookmark;
     i: Integer;
  begin
    vBM := dsSubjects.GetBookmark;
    dsSubjects.DisableControls;
    Try
      dsSubjects.First;
      i:=0;
      while not dsSubjects.Eof do
      begin
        if dsSubjectsID.Value <> FSelSubjID then
          begin
            vDropList[i]:= dsSubjectsID.AsFloat;
            inc(i);
          end;
        dsSubjects.Next;
      end;
    finally
      Try
        dsSubjects.GotoBookmark(vBM);
      except
      end;
      dsSubjects.EnableControls;
    end;
  end;
  // �������� ��� �������� ��� ����������� �� ��
  // 0 - ��� � ���� ������
  // 1 - ��� � �� ������
  // 2 - ��� � ���.��� ������� � ��
  // ���� ������ ��� � ��, �� 
  function CheckINN(): Integer;
  var
    PrivateINN: String;
  begin
    Result := 0;
    // �������� ��� � ��    
    dsSubjects.First;
    while not dsSubjects.Eof do
    begin
      if (dsSubjectsPRIVATE_OWNER.Value = 'Y') then
        begin
          if (PrivateINN = '') then
            begin
              PrivateINN := dsSubjectsINN.Value;
            end
          else if (PrivateINN <> dsSubjectsINN.Value) then
            begin
              Result := 1;
              Break;
            end;
        end;
      dsSubjects.Next;
    end;
    // �������� ��� � ���.���
    if Result = 0 then
      begin
        dsSubjects.First;
        while not dsSubjects.Eof do
        begin
          if (dsSubjectsPRIVATE_OWNER.Value = 'N') then
            begin
              if (PrivateINN <> '') and (PrivateINN <> dsSubjectsINN.Value) then
                begin
                  Result := 2;
                  Break;
                end;
            end;
          dsSubjects.Next;
        end;
      end;
  end;
begin
  chkINN := CheckINN();
  if chkINN = 1 then
    begin
      MessageDlg('���������� �������� � ������������� ���!','����������� ����������!','',mtInformation,[mbOk],0);
      Exit;  
    end;
    
  if (chkINN = 2) and (ConfirmDlg('���������� �������� � ������������� ���!','�� �������, ��� ������ ��������� �����������?'+chr(10)+chr(13)+chr(10)+chr(13)+
                                 '��������! ���������� ������ �������� �������� ����������!') <> mrYes) then
    Exit;
      
  if (chkINN = 2) or (ConfirmDlg('��������� ����������� ���������?','��������! ���������� ������ �������� �������� ����������!') = mrYes) then
  try
    try
      vDropList := VarArrayCreate([0, dsSubjects.RecordCount - 2], varVariant);
      FillDropList;
      MainData.pkgCommon.PackageName := 'p_Params';
      MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['N'] );
      qryMerge.SetVariable('ID', FSelSubjID);
      qryMerge.DimPLSQLTable('DROPLIST', dsSubjects.RecordCount - 1, 0);
      qryMerge.SetVariable('DROPLIST', vDropList);
      qryMerge.Execute;
      qryMerge.Session.Commit;
      MessageDlg('����������� ��������� ���������!', '', '', mtInformation, [mbOK], 0);      
      ModalResult := mrOk;
    except
      ModalResult := mrNone;
      qryMerge.Session.Rollback;
      raise;
    end;
  finally
    MainData.pkgCommon.PackageName := 'p_Params';
    MainData.pkgCommon.CallProcedure( 'Set_cRefreshMV_SubjectByLS', ['Y'] );
  end;
end;

procedure TSubjectMergeForm.cxViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo.Item = cxViewCheck then
  begin
    if (Sender.DataController.Values[ACellViewInfo.GridRecord.RecordIndex, cxViewACCOUNT_STATE.Index] = accClosed) or
       ((not VarIsNull(dsSubjects.Lookup('PRIVATE_OWNER', 'Y', 'ID'))) and
       (Sender.DataController.Values[ACellViewInfo.GridRecord.RecordIndex, cxViewPRIVATE_OWNER.Index] = 'N')) then
      Exit;

    cxView.BeginUpdate;
    try
      FSelSubjID := Sender.DataController.Values[ACellViewInfo.GridRecord.RecordIndex, cxViewID.Index];
      cxView.ViewChanged;
    finally
      cxView.EndUpdate;
    end;
  end;
end;

procedure TSubjectMergeForm.dsSubjectsBeforeDelete(DataSet: TDataSet);
begin
  if dsSubjectsID.Value = FSelSubjID then
    FSelSubjID := 0;
end;

procedure TSubjectMergeForm.cxViewCheckCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  x,y: integer;
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  x:= AViewInfo.Bounds.Left+Ceil((AViewInfo.Bounds.Right-AViewInfo.Bounds.Left)/2)-8;
  y:= AViewInfo.Bounds.Top+Ceil((AViewInfo.Bounds.Bottom-AViewInfo.Bounds.Top)/2)-8;
  if Sender.DataController.Values[AViewInfo.GridRecord.RecordIndex, cxViewID.Index] = FSelSubjID then
    ACanvas.DrawImage(imglCheck, x, y, 0)
  else
    ACanvas.DrawImage(imglCheck, x, y, 1);
  ADone:= True;
end;

procedure TSubjectMergeForm.actAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (dsSubjects.RecordCount < cMaxSubj );
end;

procedure TSubjectMergeForm.actOkUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (dsSubjects.RecordCount > 1) and (FSelSubjID > 0);
end;

procedure TSubjectMergeForm.actDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not dsSubjects.IsEmpty;
end;

procedure TSubjectMergeForm.actOpenUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not dsSubjects.IsEmpty;
end;

procedure TSubjectMergeForm.actDeleteExecute(Sender: TObject);
begin
  dsSubjects.Delete;
end;

procedure TSubjectMergeForm.actOpenExecute(Sender: TObject);
begin
  GetObjectServices.OpenObject(dsSubjectsID.AsFloat, nil);
end;

procedure TSubjectMergeForm.actAddExecute(Sender: TObject);
var
  F: TPersonGridForm;
begin
  F := TPersonGridForm.Create(btnAdd);
  Try
    F.SearchMode := True;
    F.SearchTypeSysName := 'Person';
    F.SearchMultiple := True;
    F.SearchComponent := btnAdd;
    F.ObjectServices := GetObjectServices;
    F.OnSearchFinished := OnSearchSrcSubjFinished;
    F.actAdd.Visible := False;
    F.actDelete.Visible := False;
    F.cbPrivateOwner.EditValue := '';
    F.btnSwitchSearchCriteria.Visible := ivNever;
    F.ShowModal;
  finally
    F.Free;
  end;
  cxGrid.SetFocus;
end;

procedure TSubjectMergeForm.cxViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if (ACellViewInfo.Item <> cxViewCheck) and actOpen.Enabled then
    actOpen.Execute;
end;

    

end.

