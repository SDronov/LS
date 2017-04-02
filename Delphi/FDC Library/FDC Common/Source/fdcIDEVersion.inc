{ Borland Delphi 3.0 }
{$IFNDEF VER80}
 {$IFNDEF VER90}
  {$IFNDEF VER93}
    {$DEFINE DELPHI3}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{ Borland C++Builder 3.0 }
{$IFDEF VER110}
  {$DEFINE CBUILDER3}
  {$ObjExportAll On}
{$ENDIF}

{ Borland Delphi 4.0 }
{$IFDEF VER120}
  {$DEFINE DELPHI4}
{$ENDIF}

{ Borland C++Builder 4.0 }
{$IFDEF VER125}
  {$DEFINE CBUILDER4}
  {$ObjExportAll On}
{$ENDIF}

{$IFDEF VER130}
  { Borland C++Builder 5.0 }
  {$IFDEF BCB}
    {$DEFINE CBUILDER5}
    {$ObjExportAll On}
  { Borland Delphi 5.0 }
  {$ELSE}
    {$DEFINE DELPHI5}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER140}
  { Borland C++Builder 6.0 }
  {$IFDEF BCB}
    {$DEFINE CBUILDER6}
    {$ObjExportAll On}
  { Borland Delphi 6.0 }
  {$ELSE}
    {$DEFINE DELPHI6}
  {$ENDIF}
{$ENDIF}

{ Borland Delphi 7.0 }
{$IFDEF VER150}
  {$DEFINE DELPHI7}
{$ENDIF}
