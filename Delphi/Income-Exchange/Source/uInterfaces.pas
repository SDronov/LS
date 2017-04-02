unit uInterfaces;

interface

uses
  Classes;

type
  IService = interface( IUnknown )
     ['{5B2FAEB6-6132-4AD6-903E-68993F918277}']
    procedure ExecRequests;
  end;

  IDBService = interface( IService )
    ['{791BF3EA-D8FD-4FB9-922E-9FACFAA78B5E}']
    procedure SaveMessage(AStream : TStream; const ATag : string );
  end;

  IFileService = interface( IService )
    ['{C611C8C7-1B58-4319-B70C-B8BE4B2DC9DD}']
    procedure SendStream(
       AStream : TStream;
       ACustomsCode : string;
       ACustomsName, ASrcCustomsName : string;
       ACustomsCodeTTT : string;
       ASoftCode : string;
       AEnvelopID : Integer
      );
  end;

implementation

end.
