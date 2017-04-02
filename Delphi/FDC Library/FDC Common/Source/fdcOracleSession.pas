{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcOracleSession.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcOracleSession;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle;

type
  TfdcOracleSession = class(TOracleSession)
  private
    { Private declarations }
  protected
    FSchemeName :string;
    FTraceException : boolean;
  public
	 { Public declarations }
  published
    property DefSchemeName: string read FSchemeName write FSchemeName;
    property TraceException: boolean read FTraceException write FTraceException;
  end;

implementation

end.
