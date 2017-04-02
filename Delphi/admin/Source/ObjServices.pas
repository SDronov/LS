{
  Copyright © Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1098 $
  $Author: alexvolo $
  $Date: 2006-02-14 15:11:34 +0400 (Π’Ρ‚, 14 Ρ„ΠµΠ² 2006) $
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
     raise Exception.Create('fdcObjectService νε ηΰδΰνΰ');
end;

procedure SetObjectServices(Service: IfdcObjectServices);
begin
  FObjectService := Service;
end;

end.
