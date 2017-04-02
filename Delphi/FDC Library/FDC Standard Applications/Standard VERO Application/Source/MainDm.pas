{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: MainDm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit MainDm;

interface

uses
  SysUtils, Classes, Oracle, FDCOracleSession, DB, FDCCustomDataset,
  FDCQuery, fdcCustomMainDm;

type
  TMainData = class(TfdcCustomMainData)
    dsObject: TFDCQuery;
    dsObjectTypeAll: TFDCQuery;
    dsObjectIs: TFDCQuery;
    dsObjectFree: TfdcQuery;
    dsCheckVersion: TfdcQuery;
    dsGetUser: TfdcQuery;
    dsUserIsAdminData: TfdcQuery;
    dsUserIsAdminTask: TfdcQuery;
    dsUserIsSchemaOwner: TfdcQuery;
    dsUserInGroupAdd: TfdcQuery;
    dsUserInGroupDel: TfdcQuery;
    dsReGrant: TfdcQuery;
    dsEvent: TfdcQuery;
    dsObjectGrantUpdate: TfdcQuery;
    dsObjectAccessLevelUpdate: TfdcQuery;
    dsTaskSysComponentAdd: TfdcQuery;
    dsTaskSysComponentDel: TfdcQuery;
    dsUserGroupTaskAdd: TfdcQuery;
    dsUserGroupTaskDel: TfdcQuery;
    dsUserGrantForExec: TfdcQuery;
    dsUserGrantForExecOBJECT_NAME: TStringField;
    dsUserGrantForExecOBJECT_TYPE: TStringField;
    dsUserGrantForExecLOGIN: TStringField;
    dsUserGrantForExecALLOWGRANTOPTION: TIntegerField;
    dsUserGrantForExecGRANTED: TFloatField;
    dsUserGrantForExecTOGRANT: TFloatField;
    dsUserGrantForExecCMD: TStringField;
    qryLobQuery: TOracleQuery;
    dsCollectionObjectAdd: TfdcQuery;
    dsCollectionObjectDel: TfdcQuery;
    dsCollectionMerge: TfdcQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckVersion(ACheckBuildNumber: boolean; var AServerVersion: string; var AVersionMigrate: boolean): boolean;

    function GetUser(ALogin: string = ''): double;
    function UserIsAdminData(AUserID: double = 0; ADoRaise: boolean = True): boolean;
    function UserIsAdminTask(AUserID: double = 0; ADoRaise: boolean = True): boolean;
    function UserIsSchemaOwner: boolean;
    procedure ReGrantUser(AUserLogin: string);

    procedure UpdateObjectAccessLevel(AObjectID, AAccessLevel: double);
    procedure UpdateObjectGrant(AObjectID, AUserID, AAccessLevel: double;
      ADoNotCheck: boolean = False; AAdminNotGrant: boolean = True;
      ANoReduction: boolean = True);

    procedure AddUserToGroup(AUserID, AUserGroupID: double);
    procedure RemoveUserFromGroup(AUserID, AUserGroupID: double);

    procedure AddSysComponentToTask(ASysComponentID, ATaskID: double);
    procedure RemoveSysComponentFromTask(ASysComponentID, ATaskID: double);

    procedure AddTaskToUserGroup(ATaskID, AUserGroupID: double);
    procedure RemoveTaskFromUserGroup(ATaskID, AUserGroupID: double);

    procedure AddObjectToCollection(AObjectID, ACollectionID: double; ARoleName: string = ''; ADescript: string = '');
    procedure RemoveObjectFromCollection(AID: double);
    procedure MergeCollection(AID, ASRCID: double; ARoleName: string);

    procedure FreeObject(AID: double);
  end;

var
  MainData: TMainData;

implementation

uses fdcUtils;

{$R *.dfm}

{ TMainData }

function TMainData.CheckVersion(ACheckBuildNumber: boolean;
  var AServerVersion: string; var AVersionMigrate: boolean): boolean;
begin
  dsCheckVersion.ParamByName('CHKVERSION').AsString := GetAppVersion;
  dsCheckVersion.ParamByName('CHKBUILDNUM').AsFloat := integer(ACheckBuildNumber);
  dsCheckVersion.ExecSQL;
  Result := dsCheckVersion.ParamByName('Result').AsFloat = 1;
  AServerVersion := dsCheckVersion.ParamByName('CURRENTVERSION').AsString;
  AVersionMigrate := dsCheckVersion.ParamByName('VERSIONMIGRATE').AsFloat = 1;
end;

function TMainData.GetUser(ALogin: string = ''): double;
begin
  dsGetUser.ParamByName('LOGIN').AsString := ALogin;
  dsGetUser.ExecSQL;
  Result := dsGetUser.ParamByName('Result').AsFloat;
end;

function TMainData.UserIsAdminData(AUserID: double = 0;
  ADoRaise: boolean = True): boolean;
begin
  dsUserIsAdminData.ParamByName('USER_ID').AsFloat := AUserID;
  dsUserIsAdminData.ParamByName('DORAISE').AsFloat := integer(ADoRaise);
  dsUserIsAdminData.ExecSQL;
  Result := dsUserIsAdminData.ParamByName('Result').AsFloat = 1;
end;

function TMainData.UserIsAdminTask(AUserID: double = 0;
  ADoRaise: boolean = True): boolean;
begin
  dsUserIsAdminTask.ParamByName('USER_ID').AsFloat := AUserID;
  dsUserIsAdminTask.ParamByName('DORAISE').AsFloat := integer(ADoRaise);
  dsUserIsAdminTask.ExecSQL;
  Result := dsUserIsAdminTask.ParamByName('Result').AsFloat = 1;
end;

function TMainData.UserIsSchemaOwner: boolean;
begin
  dsUserIsSchemaOwner.ExecSQL;
  Result := dsUserIsSchemaOwner.ParamByName('Result').AsFloat = 1;
end;

procedure TMainData.ReGrantUser(AUserLogin: string);
begin
  dsUserGrantForExec.ParamByName('LOGIN').AsString := AUserLogin;
  dsUserGrantForExec.Open;
  try
    while not dsUserGrantForExec.Eof do
    begin
      dsReGrant.SQL.Text := dsUserGrantForExecCMD.AsString;
      dsReGrant.ExecSQL;
      dsUserGrantForExec.Next;
    end;
  finally
    dsUserGrantForExec.Close;
  end;
end;

procedure TMainData.UpdateObjectAccessLevel(AObjectID,
  AAccessLevel: double);
begin
  dsObjectAccessLevelUpdate.ParamByName('ID').AsFloat := AObjectID;
  dsObjectAccessLevelUpdate.ParamByName('AccessLevel').AsFloat := AAccessLevel;
  dsObjectAccessLevelUpdate.ExecSQL;
end;

procedure TMainData.UpdateObjectGrant(AObjectID, AUserID,
  AAccessLevel: double; ADoNotCheck: boolean = False;
  AAdminNotGrant: boolean = True; ANoReduction: boolean = True);
begin
  dsObjectGrantUpdate.ParamByName('ID')           .AsFloat := AObjectID;
  dsObjectGrantUpdate.ParamByName('Grantee_ID')   .AsFloat := AUserID;
  dsObjectGrantUpdate.ParamByName('AccessLevel')  .AsFloat := AAccessLevel;
  dsObjectGrantUpdate.ParamByName('DoNotCheck')   .AsFloat := integer(ADoNotCheck);
  dsObjectGrantUpdate.ParamByName('AdminNotGrant').AsFloat := integer(AAdminNotGrant);
  dsObjectGrantUpdate.ParamByName('NoReduction')  .AsFloat := integer(ANoReduction);
  dsObjectGrantUpdate.ExecSQL;
end;

procedure TMainData.AddUserToGroup(AUserID, AUserGroupID: double);
begin
  dsUserInGroupAdd.ParamByName('USER_ID')      .AsFloat := AUserID;
  dsUserInGroupAdd.ParamByName('USER_GROUP_ID').AsFloat := AUserGroupID;
  dsUserInGroupAdd.ExecSQL;
end;

procedure TMainData.RemoveUserFromGroup(AUserID, AUserGroupID: double);
begin
  dsUserInGroupDel.ParamByName('USER_ID')      .AsFloat := AUserID;
  dsUserInGroupDel.ParamByName('USER_GROUP_ID').AsFloat := AUserGroupID;
  dsUserInGroupDel.ExecSQL;
end;

procedure TMainData.AddSysComponentToTask(ASysComponentID,
  ATaskID: double);
begin
  dsTaskSysComponentAdd.ParamByName('TASK_ID')        .AsFloat := ATaskID;
  dsTaskSysComponentAdd.ParamByName('SYSCOMPONENT_ID').AsFloat := ASysComponentID;
  dsTaskSysComponentAdd.ExecSQL;
end;

procedure TMainData.RemoveSysComponentFromTask(ASysComponentID,
  ATaskID: double);
begin
  dsTaskSysComponentDel.ParamByName('TASK_ID')        .AsFloat := ATaskID;
  dsTaskSysComponentDel.ParamByName('SYSCOMPONENT_ID').AsFloat := ASysComponentID;
  dsTaskSysComponentDel.ExecSQL;
end;

procedure TMainData.AddTaskToUserGroup(ATaskID, AUserGroupID: double);
begin
  dsUserGroupTaskAdd.ParamByName('USER_GROUP_ID').AsFloat := AUserGroupID;
  dsUserGroupTaskAdd.ParamByName('TASK_ID')      .AsFloat := ATaskID;
  dsUserGroupTaskAdd.ExecSQL;
end;

procedure TMainData.RemoveTaskFromUserGroup(ATaskID, AUserGroupID: double);
begin
  dsUserGroupTaskDel.ParamByName('USER_GROUP_ID').AsFloat := AUserGroupID;
  dsUserGroupTaskDel.ParamByName('TASK_ID')      .AsFloat := ATaskID;
  dsUserGroupTaskDel.ExecSQL;
end;

procedure TMainData.AddObjectToCollection(AObjectID, ACollectionID: double; ARoleName: string = ''; ADescript: string = '');
begin
  dsCollectionObjectAdd.ParamByName('COLLECTION_ID').AsFloat := ACollectionID;
  dsCollectionObjectAdd.ParamByName('OBJECT_ID').AsFloat := AObjectID;
  dsCollectionObjectAdd.ParamByName('ROLENAME').AsString := ARoleName;
  dsCollectionObjectAdd.ParamByName('DESCRIPT').AsString := ADescript;
  dsCollectionObjectAdd.ExecSQL;
end;

procedure TMainData.RemoveObjectFromCollection(AID: double);
begin
  dsCollectionObjectDel.ParamByName('ID').AsFloat := AID;
  dsCollectionObjectDel.ExecSQL;
end;

procedure TMainData.MergeCollection(AID, ASRCID: double; ARoleName: string);
begin
  dsCollectionMerge.ParamByName('ID').AsFloat := AID;
  dsCollectionMerge.ParamByName('SRC_ID').AsFloat := ASRCID;
  dsCollectionMerge.ParamByName('RoleName').AsString := ARoleName;
  dsCollectionMerge.ExecSQL;
end;

procedure TMainData.FreeObject(AID: double);
begin
  dsObjectFree.ParamByName('ID').AsFloat := AID;
  dsObjectFree.ExecSQL;
end;

end.
