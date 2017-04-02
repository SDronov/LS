unit uOptions;

interface

type
  TieOptions = class
  private
    // Common
    fInterval : Integer;
    fDebug    : Boolean;
    fCurDir   : string;

    // Database
    fDataBase   : string;
    fUserName   : string;
    fPassword   : string;
    fSchemeName : string;

    // Privileges
    fPrivilegesEnebled   : Boolean;
    fPrivilegesPackedOut : Boolean;
    fPrivilegesDirIn     : string;
    fPrivilegesDirOut    : string;
    fPrivilegesDoArc     : Boolean;
    fPrivilegesDirArc    : string;

    // Debt
    fDebtEnebled   : Boolean;
    fDebtPackedOut : Boolean;
    fDebtDirIn     : string;
    fDebtDirOut    : string;
    fDebtDoArc     : Boolean;
    fDebtDirArc    : string;

    // Fines
    fFinesEnebled   : Boolean;
    fFinesPackedOut : Boolean;
    fFinesDirIn     : string;
    fFinesDirOut    : string;
    fFinesDoArc     : Boolean;
    fFinesDirArc    : string;

    // Cost
    fCostEnebled   : Boolean;
    fCostPackedOut : Boolean;
    fCostDirIn     : string;
    fCostDirOut    : string;
    fCostDoArc     : Boolean;
    fCostDirArc    : string;

  public
    constructor Create;

    // Read all
    procedure ReadStart;
    // Read for subsystems
    procedure Read;

    // Common
    property Interval : Integer read fInterval;
    property Debug    : Boolean read fDebug;
    property CurDir   : string  read fCurDir;

    // Database
    property DataBase   : string read fDataBase;
    property UserName   : string read fUserName;
    property Password   : string read fPassword;
    property SchemeName : string read fSchemeName;

    // Privileges
    property PrivilegesEnebled   : Boolean read fPrivilegesEnebled;
    property PrivilegesPackedOut : Boolean read fPrivilegesPackedOut;
    property PrivilegesDoArc     : Boolean read fPrivilegesDoArc;
    property PrivilegesDirArc    : string  read fPrivilegesDirArc;
    property PrivilegesDirIn     : string  read fPrivilegesDirIn;
    property PrivilegesDirOut    : string  read fPrivilegesDirOut;

    // Debt
    property DebtEnebled   : Boolean read fDebtEnebled;
    property DebtPackedOut : Boolean read fDebtPackedOut;
    property DebtDoArc     : Boolean read fDebtDoArc;
    property DebtDirArc    : string  read fDebtDirArc;
    property DebtDirIn     : string  read fDebtDirIn;
    property DebtDirOut    : string  read fDebtDirOut;

    // Fines
    property FinesEnebled   : Boolean read fFinesEnebled;
    property FinesPackedOut : Boolean read fFinesPackedOut;
    property FinesDoArc     : Boolean read fFinesDoArc;
    property FinesDirArc    : string  read fFinesDirArc;
    property FinesDirIn     : string  read fFinesDirIn;
    property FinesDirOut    : string  read fFinesDirOut;

    // Cost
    property CostEnebled    : Boolean read fCostEnebled;
    property CostPackedOut  : Boolean read fCostPackedOut;
    property CostDoArc      : Boolean read fCostDoArc;
    property CostDirArc     : string  read fCostDirArc;
    property CostDirIn      : string  read fCostDirIn;
    property CostDirOut     : string  read fCostDirOut;
  end;

implementation

uses
  SvcMgr, IniFiles, SysUtils, Forms;

const
  iniSecName_Common = 'Common';
  iniParamName_Common_Interval = 'Interval';
  iniParamName_Common_Debug    = 'Debug';

  iniSecName_DataBase = 'DataBase';
  iniParamName_DataBase_DataBase   = 'DataBase';
  iniParamName_DataBase_UserName   = 'UserName';
  iniParamName_DataBase_Password   = 'Password';
  iniParamName_DataBase_SchemeName = 'SchemeName';

  iniSecName_Privileges = 'Privileges';
  iniSecName_Debt       = 'Debt';
  iniSecName_Fines      = 'Fines';
  iniSecName_Cost       = 'Cost';

  iniParamName_Enabled   = 'Enabled';
  iniParamName_PackedOut = 'PackedOut';
  iniParamName_DoArc     = 'DoArc';
  iniParamName_DirArc    = 'DirArc';
  iniParamName_DirIn     = 'DirIn';
  iniParamName_DirOut    = 'DirOut';

{ TieOptions }

constructor TieOptions.Create;
begin
  fInterval := 5;
  fDebug    := False;
  fCurDir   := ExtractFilePath( Application.ExeName );

  // Database
  fDataBase   := '';
  fUserName   := '';
  fPassword   := '';
  fSchemeName := '';

  // Privileges
  fPrivilegesEnebled   := False;
  fPrivilegesPackedOut := False;
  fPrivilegesDoArc     := False;
  fPrivilegesDirArc    := '';
  fPrivilegesDirIn     := '';
  fPrivilegesDirOut    := '';

  // Debt
  fDebtEnebled   := False;
  fDebtPackedOut := False;
  fDebtDoArc     := False;
  fDebtDirArc    := '';
  fDebtDirIn     := '';
  fDebtDirOut    := '';

  // Fines
  fFinesEnebled   := False;
  fFinesPackedOut := False;
  fFinesDoArc     := False;
  fFinesDirArc    := '';
  fFinesDirIn     := '';
  fFinesDirOut    := '';

  // Cost
  fCostEnebled   := False;
  fCostPackedOut := False;
  fCostDoArc     := False;
  fCostDirArc    := '';
  fCostDirIn     := '';
  fCostDirOut    := '';
end;

procedure TieOptions.Read;
  var
    IniFile : TMemIniFile;
begin
  IniFile := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    fPrivilegesEnebled   := IniFile.ReadInteger( iniSecName_Privileges, iniParamName_Enabled, 0  ) = 1;
    fPrivilegesPackedOut := IniFile.ReadInteger( iniSecName_Privileges, iniParamName_PackedOut, 0  ) = 1;
    fPrivilegesDoArc     := IniFile.ReadInteger( iniSecName_Privileges, iniParamName_DoArc, 0  ) = 1;
    fPrivilegesDirArc    := IniFile.ReadString( iniSecName_Privileges, iniParamName_DirArc,   '' );
    fPrivilegesDirIn     := IniFile.ReadString( iniSecName_Privileges, iniParamName_DirIn,    '' );
    fPrivilegesDirOut    := IniFile.ReadString( iniSecName_Privileges, iniParamName_DirOut,   '' );

    fDebtEnebled   := IniFile.ReadInteger( iniSecName_Debt, iniParamName_Enabled, 0  ) = 1;
    fDebtPackedOut := IniFile.ReadInteger( iniSecName_Debt, iniParamName_PackedOut, 0  ) = 1;
    fDebtDoArc     := IniFile.ReadInteger( iniSecName_Debt, iniParamName_DoArc, 0  ) = 1;
    fDebtDirArc    := IniFile.ReadString( iniSecName_Debt, iniParamName_DirArc,   '' );
    fDebtDirIn     := IniFile.ReadString( iniSecName_Debt, iniParamName_DirIn,    '' );
    fDebtDirOut    := IniFile.ReadString( iniSecName_Debt, iniParamName_DirOut,   '' );

    fFinesEnebled   := IniFile.ReadInteger( iniSecName_Fines, iniParamName_Enabled, 0  ) = 1;
    fFinesPackedOut := IniFile.ReadInteger( iniSecName_Fines, iniParamName_PackedOut, 0  ) = 1;
    fFinesDoArc     := IniFile.ReadInteger( iniSecName_Fines, iniParamName_DoArc, 0  ) = 1;
    fFinesDirArc    := IniFile.ReadString( iniSecName_Fines, iniParamName_DirArc,   '' );
    fFinesDirIn     := IniFile.ReadString( iniSecName_Fines, iniParamName_DirIn,    '' );
    fFinesDirOut    := IniFile.ReadString( iniSecName_Fines, iniParamName_DirOut,   '' );

    fCostEnebled   := IniFile.ReadInteger( iniSecName_Cost, iniParamName_Enabled, 0  ) = 1;
    fCostPackedOut := IniFile.ReadInteger( iniSecName_Cost, iniParamName_PackedOut, 0  ) = 1;
    fCostDoArc     := IniFile.ReadInteger( iniSecName_Cost, iniParamName_DoArc, 0  ) = 1;
    fCostDirArc    := IniFile.ReadString( iniSecName_Cost, iniParamName_DirArc,   '' );
    fCostDirIn     := IniFile.ReadString( iniSecName_Cost, iniParamName_DirIn,    '' );
    fCostDirOut    := IniFile.ReadString( iniSecName_Cost, iniParamName_DirOut,   '' );
  finally
    IniFile.Free;
  end;
end;

procedure TieOptions.ReadStart;
  var
    IniFile : TMemIniFile;
begin
  IniFile := TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    fInterval := IniFile.ReadInteger( iniSecName_Common, iniParamName_Common_Interval, 5 );
    fDebug    := IniFile.ReadInteger( iniSecName_Common, iniParamName_Common_Debug,    0 ) = 1;

    fDataBase   := IniFile.ReadString( iniSecName_DataBase, iniParamName_DataBase_DataBase,   '' );
    fUserName   := IniFile.ReadString( iniSecName_DataBase, iniParamName_DataBase_UserName,   '' );
    fPassword   := IniFile.ReadString( iniSecName_DataBase, iniParamName_DataBase_Password,   '' );
    fSchemeName := IniFile.ReadString( iniSecName_DataBase, iniParamName_DataBase_SchemeName, '' );
  finally
    IniFile.Free;
  end;

  Read;
end;

end.
