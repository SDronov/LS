{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 270 $
  $Author: alexvolo $
  $Date: 2005-11-02 10:54:11 +0400 (Ср, 02 ноя 2005) $
}
unit RepIntf;

interface

uses
  Classes;

type
   IReport = interface
     ['{9A850366-E760-4B7E-B3A6-82C6C08A6174}']
   end;

   procedure RegisterReport(AClass: TClass);
   procedure UnRegisterReport(AClass: TClass);
   procedure GetReportList(List: TStrings);
   function ExecuteReport(const RepCode: String): Boolean;

implementation

uses
  SysUtils;

var
  AReportList: TStrings;

procedure RegisterReport(AClass: TClass);
begin
  if AClass.GetInterfaceEntry(IReport) <> nil then
      AReportList.AddObject(AClass.ClassName, TObject(AClass));
end;

procedure UnRegisterReport(AClass: TClass);
var
  I: Integer;
begin
  I := AReportList.IndexOfObject(TObject(AClass));
  if I >= 0 then
     AReportList.Delete(I);
end;

function ExecuteReport(const RepCode: String): Boolean;
var
  I: Integer;

begin
  Result := False;
  I := AReportList.IndexOfName(RepCode);
  if I >= 0 then
  begin

  end;
end;

procedure GetReportList(List: TStrings);
begin
  List.Assign(AReportList);
end;

initialization
   AReportList := TStringList.Create;
   TStringList(AReportList).Duplicates := dupError;

finalization
   FreeAndNil(AReportList);

end.
 