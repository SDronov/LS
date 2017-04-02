unit uConsts;

interface

var
  ServiceName, ServiceDesc: string;

const
 //cServiceName = 'mpk_service';
 cServiceName = 'iaccftp';
 cServiceDesc = '—ерсвис загрузки чеков по таможенной карте';

implementation

function getServiceName: string;
begin
 result:= cServiceName;
 if (ParamCount > 1) then
   result:= paramStr(1) ;
end;

function getServiceDesc: string;
begin
 result:= cServiceDesc;
 if (ParamCount > 2) then
   result:= paramStr(2) ;
end;

initialization


end.
