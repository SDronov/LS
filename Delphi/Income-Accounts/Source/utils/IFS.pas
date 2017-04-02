{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source: MainFrm.pas $
  $Revision: 1.49 $
  $Author: pkruglov $
  $Date: 2007/03/28 11:46:53 $
}
unit IFS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ztvregister, ztvBase, ztvUnZip;

type
  IFileStorage = interface(IInterface)
                   ['{83306405-39E3-472F-9D33-2D7310497EE3}']
    procedure GetFileList(List: TStrings);
    function  GetFileCount: integer;
    function  GetFileName(AnIndex: integer): string;
    function  FileExists(const AFileName: string): boolean;
    function  GetFileStream(const AFileName: string): TStream; overload;
    function  GetStorageName: string;
  end;

  TFolderStorage = class(TInterfacedObject, IFileStorage)
  private
    FFolderName: string;
    FList: TStrings;
    procedure BuildFileList;
  public
    constructor Create(AFolderName: string);
    function FileExists(const AFileName: String): Boolean;
    function GetFileCount: Integer;
    procedure GetFileList(List: TStrings);
    function GetFileName(AnIndex: Integer): String;
    function GetStorageName: String;
    function GetFileStream(const AFileName: String): TStream; overload;
    destructor Destroy; override;
  end;


implementation

{ TFolderStorage }

procedure TFolderStorage.BuildFileList;
begin
  if FList = nil then
  begin
    FLIst := TStringList.Create;
  end;
end;

constructor TFolderStorage.Create(AFolderName: string);
begin
  if not DirectoryExists(AFolderName) then
    raise Exception.CreateFmt('Каталог "%s" не существует', [AFolderName]);
  FFolderName := IncludeTrailingPathDelimiter(AFolderName);
end;

destructor TFolderStorage.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFolderStorage.FileExists(const AFileName: String): Boolean;
begin
  Result := SysUtils.FileExists(FFolderName + AFileName);
end;

function TFolderStorage.GetFileCount: Integer;
begin
  BuildFileList;
  Result := FList.Count;
end;

procedure TFolderStorage.GetFileList(List: TStrings);
begin
  BuildFileList;
  List.Assign(FList);
end;

function TFolderStorage.GetFileName(AnIndex: Integer): String;
begin
  Result := FList[AnIndex];
end;

function TFolderStorage.GetStorageName: String;
begin
  Result := FFolderName;
end;

function TFolderStorage.GetFileStream(const AFileName: String): TStream;
begin
  BuildFileList;
  Result := TFileStream.Create(FFolderName + AFileName, fmOpenRead + fmShareDenyWrite);
end;

end.

