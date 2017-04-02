{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 22 $
  $Author: alexvolo $
  $Date: 2005-07-25 19:48:11 +0400 (РџРЅ, 25 РёСЋР» 2005) $
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
     raise Exception.Create('fdcObjectService не задана');
end;

procedure SetObjectServices(Service: IfdcObjectServices);
begin
  FObjectService := Service;
end;

end.
