{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 273 $
  $Author: alexvolo $
  $Date: 2005-11-03 20:04:20 +0400 (Чт, 03 ноя 2005) $
}
unit ObjServices;

interface

uses
  Classes, fdcObjectServices;

type
  { IfdcObjectServicesEx }
  IfdcObjectServicesEx = interface(IfdcObjectServices)
  end;

  function GetObjectServices: IfdcObjectServices;
  procedure SetObjectServices(Service: IfdcObjectServices);

implementation

uses
  SysUtils;

var
  FObjectService: IfdcObjectServices;

function GetObjectServices: IfdcObjectServices;
begin
  Result := FObjectService;
  if Result = nil then
     raise Exception.Create('fdcObjectService �� ������');
end;

procedure SetObjectServices(Service: IfdcObjectServices);
begin
  FObjectService := Service;
end;

end.
