(**********************************************************************

  Copyright 1997-2010,  Microchip Data Systems / Carl Bunton

  Under license agreement, this source module may be used only on a
  single computer.

  No portion of this module may be reproduced, copied, revised, edited,
  distributed or transmitted via electronic means except in compiled
  application format.

  Web-site:  http://www.ziptv.com
  Email:     support@ziptv.com

**********************************************************************)
{$i compiler.inc}
{$E-,M-,V+,Z1}

//¤¤¤ BR ADDED!
{.$define ZTV_DEBUGLOG}

{== Debug Directives ==}
{$define ENABLE_DEBUG}  //remove the dot to allow the IDE to debug (code tracing etc.)
{$ifdef ENABLE_DEBUG}
  {$O-,D+,L+,Y+}    	//Enable debug information
  {.$define DEBUG}
{$else}
  {$O+,D-,L-,Y-}     //Disable debug information
  {.$undef DEBUG}
{$endif}

{.$define COMMON_COMPRESS_WRITEPROC}

{== Code Generation Directives ==}
{$F-}    { Force Far Calls }
{$A+}    { Word Align Data }
{$U-}    { Pentium-Save FDIV }
{$K-}    { Smart Callbacks }
{$W-}    { Windows Stack Frame }

{== Runtime Errors ==}
{$IFOPT D+}
{$else}
{$endif}

{$R-}    { Range Checking - Off }
{$S-}    { Stack Checking }
{$I+}    { I/O Checking }
{$Q-}    { Overflow Checking }

{== Syntax Options ==}
{$V+}    { Strict Var-Strings }  // v4.0... changed from $V-
{$B-}    { Complete Boolean Evaluation }
{$X+}    { Extended Syntax }
{$T-}    { Typed @ Operator }
{$P+}    { Open Parameters }
{$J+}    { Writeable Typed Constants }

{== Miscellaneous Directives ==}
{$C MOVEABLE DEMANDLOAD DISCARDABLE}    { Code Segment Attribute }  // v4.0... changed from $C-
{$G+}    { Delphi 1: 286 Instructions / Delphi 3 & later: Imported Data }
{$N+}    { Numeric Coprocessor }
{$Z-}    { Word Size Enumerated Types }	// v4.0... added
{$H+}    { Long String Support }

{.$WARN UNIT_PLATFORM OFF}
{.$WARN SYMBOL_PLATFORM OFF}
{.$WARN SYMBOL_LIBRARY OFF}
{.$WARN SYMBOL_DEPRECATED OFF}
{.$WARN UNIT_DEPRECATED OFF}
{.$WARN UNIT_LIBRARY OFF}
{$warnings off}

// for ztvLha.pas, ztvBase.pas, and demos\zipview\zptvdemo.dpr\unit1.pas
// frozen1 compression support
{.$define FROZEN1_SUPPORT}
{$define DEF64}
{$define DYNLOADUNACEDLL}
{$define DYNLOADUNRARDLL}
{$define DYNLOADSQXDLL}
{$define DYNALOAD_AES_DLL}


// ===========================
// AES - block cipher Rijndael
// ===========================
{$ifdef AES_SUPPORT}
{$define AES_PASSWORD_VERIFIER}
{$endif AES_SUPPORT}



