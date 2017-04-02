unit uAistConsts;

interface

uses
  Classes;

const
  cResOK           =  0;
  cResAlreadyConn  = -1;
  cResConnError    = -2;
  cResNoConnection = -3;
  cResNoKey        = -4;
  cResQueryError   = -5;

var
  sTableNames  : TStringList;
  sTableNamesO : TStringList;

implementation

initialization

  sTableNames := TStringList.Create;
  sTableNames.Delimiter     := ',';
  sTableNames.DelimitedText :=
      'DCLHEAD' +
     ',DCLDOG' +
     ',DCLKMP' +
     ',DCLPLATR' +
     ',DCLPLATV' +
     ',DCLPREDD' +
     ',DCLSLOTM' +
     ',DCLSUMPP' +
     ',DCLTECHD' +
     ',DCLTOVAR' +
     ',DCLTOVG' +
     ',DCLTRANS' +
     ',DK1' +
     ',DKISCH' +
     ',DKKUPL' +
     ',DKOPRP' +
     ',DK_PP' +
     ',KTCHEAD' +
     ',KTCPLTIZ' +
     ',KTCTOVIZ' +
     ',KTDHEAD' +
     ',KTDPLBIZ' +
     ',KTDPLTIZ' +
     ',KTDSUMPP' +
     ',KTDTOVAR' +
     ',KTDTOVG';

  sTableNamesO := TStringList.Create;
  sTableNamesO.Delimiter     := ',';
  sTableNamesO.DelimitedText :=
      'DCLHEAD' +
     ',DCLDOG' +
     ',DCLKMP' +
     ',DCLPLATR' +
     ',DCLPLATV' +
     ',DCLPREDD' +
     ',DCLSLOTM' +
     ',DCLSUMPP' +
     ',DCLTECHD' +
     ',DCLTOVAR' +
     ',DCLTOVG' +
     ',DCLTRANS';

end.
