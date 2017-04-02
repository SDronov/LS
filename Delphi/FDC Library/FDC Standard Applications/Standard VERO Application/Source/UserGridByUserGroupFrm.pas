unit UserGridByUserGroupFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, UserGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls, cxLabel,
  cxProgressBar, cxMaskEdit, cxSpinEdit, dxStatusBar, fdcObjectCore,
  fdcCustomDataFrm;

type
  TUserGridByUserGroupForm = class(TUserGridForm)
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdDataDBBandedTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
  private
    { Private declarations }
    procedure AddUser(AUser: TfdcObject;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure RemoveUser(AGridTableView: TcxGridTableView;
      AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
    procedure DoUserSearchFinished(const ADragObject: TfdcDragObject);
  protected
    function IsWaiter(AForm: TfdcCustomDataForm): boolean; override;
  public
    { Public declarations }
    procedure AddUsers(AUsers: TfdcObjectList);
  end;

var
  UserGridByUserGroupForm: TUserGridByUserGroupForm;

implementation

uses fdcUtils, fdcMessages, MainDm, fdcCustomObjectGridFrm;

{$R *.dfm}

procedure TUserGridByUserGroupForm.AddUser(AUser: TfdcObject;
  AIndex, ACount: integer; var ADescr: string; var ABreak: boolean);
var
  GroupName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := '���������� ������������� � ������...';
    ShowProgress(ADescr);
    if Assigned(AUser) and
       AUser.IsOfType('User') and
       (not AUser.IsNew) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.AddUserToGroup(AUser.ID, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { ����������� ����� ��������� }
      GroupName := ParamByName('NAME').AsString;
      UserName := AUser.ObjName;
      UserMessage := '������ ���������� ������������ � ������';
      UserHint := '��� ������� ���������� ������������ ' +
        UserName + ' � ������ ' + GroupName + ' ��������� ������.';

      { �������� ��������� }
      if AIndex < ACount - 1 then
      begin
        UserHint := UserHint + #10'���������� ���������� ���������� ������������� � ������?';
        if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
          ABreak := True;
      end
      else
        MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGridByUserGroupForm.RemoveUser(
  AGridTableView: TcxGridTableView; AIndex, ACount: integer;
  var ADescr: string; var ABreak: boolean);
var
  GroupName: string;
  UserName: string;
  UserMessage: string;
  UserHint: string;
begin
  try
    ADescr := '���������� ������������� �� ������...';
    ShowProgress(ADescr);
    if (not dsDataID.IsNull) and
       (not IsNewID(ParamByName('ID').AsFloat))
    then
      MainData.RemoveUserFromGroup(dsDataID.AsFloat, ParamByName('ID').AsFloat);
  except
    on E: Exception do
    begin
      { ����������� ����� ��������� }
      UserName := dsDataNAME.AsString;
      GroupName := ParamByName('NAME').AsString;
      UserMessage := '������ ���������� ������������ �� ������';
      UserHint := '��� ������� ���������� ������������ ' +
        UserName + ' �� ������ ' + GroupName + ' ��������� ������.';

      { �������� ��������� }
      with AGridTableView.Controller do
        if AIndex < SelectedRecordCount-1 then begin
          UserHint := UserHint + #10'���������� ���������� ���������� ������������� �� ������?';
          if WarningDlg(UserMessage, UserHint, E.Message) <> mrYes then
            ABreak := True;
        end
        else
          MessageDlg(UserMessage, UserHint, E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TUserGridByUserGroupForm.DoUserSearchFinished(
  const ADragObject: TfdcDragObject);
begin
  AddUsers(ADragObject.Objects);
end;

function TUserGridByUserGroupForm.IsWaiter(
  AForm: TfdcCustomDataForm): boolean;
begin
  Result := inherited IsWaiter(AForm) or
    (AForm.ClassName = 'TUserGroupGridByUserForm') or
    (AForm.ClassName = 'TTaskGridByUserForm');
end;

procedure TUserGridByUserGroupForm.AddUsers(AUsers: TfdcObjectList);
begin
  { �������� ������������� � ������ }
  IterateObjects(AUsers, AddUser);
end;

procedure TUserGridByUserGroupForm.actAddExecute(Sender: TObject);
begin
  ObjectServices.SearchObject('TUserGridForm', 'User', 0,
    Params, Self, True, DoUserSearchFinished);
end;

procedure TUserGridByUserGroupForm.actDeleteExecute(Sender: TObject);
begin
  if WarningDlg('��������� ��������� ������������� �� ������?',
       '������ ����� ��������� ���������� ��������� ������������� �� ������ ' +
       ParamByName('NAME').AsString + '.'#10 +
       '��������� ������������� �� ������?') = mrYes then
  begin
    { ������� ������������ �� ��������� ����� }
    try
      Refresh;
      with ActiveGridTableView.Controller do
        IterateRecords(RemoveUser, True, SelectedRecordCount > 1);
    finally
      RefreshData;
    end;

    { �������� ��������� ����� }
    RefreshWaiters;
  end;
end;

procedure TUserGridByUserGroupForm.grdDataDBBandedTableViewDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('User'));
end;

procedure TUserGridByUserGroupForm.grdDataDBBandedTableViewDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  AddUsers((Source as TfdcDragObject).Objects);
end;

initialization
  RegisterClass(TUserGridByUserGroupForm);

end.
