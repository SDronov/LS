{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 249 $
  $Author: alexglad $
  $Date: 2005-09-30 10:58:28 +0400 (РџС‚, 30 СЃРµРЅ 2005) $
}

unit LhaDll;
   // описание используемых функций
interface

uses
  Windows;

const
  FNAME_MAX32	 =	1024;     // обязательно не мкеньше а то некорр раб при удалении

    //  iMode для UnlhaCheckArchive
  CHECKARCHIVE_RAPID    =	0;
  CHECKARCHIVE_BASIC    =	1;
  CHECKARCHIVE_FULLCRC  =	2;
  CHECKARCHIVE_RECOVERY	= 4;
  CHECKARCHIVE_SFX	    =	8;
  CHECKARCHIVE_ALL	    =	16;

    //
// MODE (for UnarjOpenArchive) */

 M_INIT_FILE_USE		    = $00000001;  // Use Registry file settings
 M_REGARDLESS_INIT_FILE	= $00000002;  // Do not use Registry file settings.
                                      // Same as specifying  "-+" option.
 M_CHECK_ALL_PATH		    = $00000100;  // Use full pathname. Same as
                                      // specifying "-p" option.
 M_CHECK_FILENAME_ONLY	= $00000200;  // Use only file name. Same as
                                      // specifying "-p-" option.

 M_USE_DRIVE_LETTER		  = $00001000;  // Include drive in pathname
                                      // inside archive file. Same as
                                      // "-jf" option.

 M_NOT_USE_DRIVE_LETTER	= $00002000;  // Do not include drive in
                                      // pathname inside archive file.

 M_ERROR_MESSAGE_ON		  = $00400000;  // Display error message. Same as
                                      // "-gm-" option.

 M_ERROR_MESSAGE_OFF		= $00800000;  // Do not display error message.
                                      // Same as "-gm" option.

 M_RECOVERY_ON			    = $08000000;  //

 EXTRACT_FOUND_FILE		  = $40000000;
 EXTRACT_NAMED_FILE		  = $80000000;


type
  INDIVIDUALINFO = record
    dwOriginalSize   : DWORD;
    dwCompressedSize : DWORD;
    dwCRC            : DWORD;
    uFlag		         : UINT;
    uOSType	      	 : UINT;
    wRatio	         : WORD;
    wDate	           : WORD;
    wTime	           : WORD;
    szFileName	     : array[0..FNAME_MAX32] of char;
    dummy1	         : array[0..2] of char;
    szAttribute	     : array[0..7] of char;
    szMode	         : array[0..7] of char;
  end;
  PINDIVIDUALINFO = ^INDIVIDUALINFO;
  HARC = HWND;
//-----------------------------
function UnlhaGetVersion (): WORD;  stdcall; external 'UNLHA32.DLL' name 'UnlhaGetVersion';
function UnlhaGetBackGroundMode(): BOOL; stdcall; external 'UNLHA32.DLL' name 'UnlhaGetBackGroundMode';
function UnlhaCheckArchive (szFileName:PAnsiChar;const iMode:Integer ): BOOL; stdcall; external 'UNLHA32.DLL' name 'UnlhaCheckArchive';
function UnlhaGetFileCount( szArcFile:PAnsiChar):Integer; stdcall; external 'UNLHA32.DLL' name 'UnlhaGetFileCount';

function UnlhaExtractMem(const hwnd: HWND; szCmdLine :  PAnsiChar ; szOutput:PAnsiChar; const  dwSize:LongInt):Integer; stdcall; external 'UNLHA32.DLL' name 'UnlhaExtractMem';

// в szOutput идет подобие console stdout messages from lha.exe
function Unlha(const hwnd: HWND; szCmdLine :  PAnsiChar ; szOutput:PAnsiChar; const  dwSize:DWORD):Integer; stdcall; external 'UNLHA32.DLL' name 'Unlha';

function UnlhaOpenArchive(const hwnd: HWND; szFileName :  PAnsiChar ;const  dwMode : DWORD):HARC; stdcall; external 'UNLHA32.DLL' name 'UnlhaOpenArchive';
function UnlhaCloseArchive(Uarc: HARC ): Integer; stdcall; external 'UNLHA32.DLL' name 'UnlhaCloseArchive';

function UnlhaFindFirst( Uarc:HARC; szWildName :  PAnsiChar ;var lpSubInfo: INDIVIDUALINFO):Integer;far; stdcall; external 'UNLHA32.DLL' name 'UnlhaFindFirst';
function UnlhaFindNext( Uarc:HARC;var lpSubInfo:INDIVIDUALINFO):Integer; stdcall; external 'UNLHA32.DLL' name 'UnlhaFindNext';
//-----------------------------
function UnlhaGetFileName(Uarc: HARC; lpBuffer:PAnsiChar; const nSize:Integer):Integer;
		stdcall; external 'UNLHA32.DLL';

function UnlhaCompressMem(_hwnd: HWND; _szCmdLine: PChar;
		_szBuffer: PChar; _dwSize: DWORD; _lpTime: PDWORD; _lpwAttr: PDWORD;
		_lpdwWriteSize: PDWORD): Integer; stdcall; external 'UNLHA32.DLL';
    
implementation

end.
