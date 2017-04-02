#  Copyright © Fors Development Center. 
#  All rights reserved.
#
#  $Source$
#  $Revision: 2298 $
#  $Author: alexvolo $
#  $Date: 2007-03-06 20:28:55 +0400 (Р’С‚, 06 РјР°СЂ 2007) $
#

#------------------------------------------------------------------------------
VERSION = BWS.01
#------------------------------------------------------------------------------

#SILENT=

!ifdef LOCALSET
!include $(LOCALSET)
!endif

!ifndef ROOT
ROOT = $(MAKEDIR)\..
!endif
#------------------------------------------------------------------------------

DESCRIPTION=FDC - Object components

!ifndef CMD
CMD = $(COMSPEC) /c
!endif

!ifdef SILENT
SILENT=@
!endif

!ifndef TARGETDIR
TARGETDIR=..\bin
!endif

!ifndef REG
REG=reg.exe
!endif

#
#  Подключение библиотек Developer Express Inc
#
!ifndef DX_HOME
DX_HOME = $(ROOT)\..\..\Developer Express.VCL\\
!endif

DX_LIB = $(DX_HOME)Library\Delphi7

!ifndef DOA_LIB
DOA_LIB= $(ROOT)\DOA
!endif

!ifndef ZIPTV_LIB
ZIPTV_LIB= $(ROOT)\ZipTV7.0
!endif

XL_LIB = $(ROOT)\..\..\AfalinaSoft\XL Report 4\d7units\

SEARCHDIR = $(ROOT)\Imports;$(ROOT)\Projects\Bpl;$(DX_LIB);$(DOA_LIB);$(XL_LIB);$(ZIPTV_LIB)


MAKE = "$(ROOT)\bin\make.exe" -$(MAKEFLAGS) -f$**
DCC = "$(ROOT)\bin\dcc32.exe" $(DCCFLAGS) -N.\Out -U"$(SEARCHDIR: ;=;)" -LE$(TARGETDIR) -LN$(TARGETDIR) $(**F)
BRCC = $(ROOT)\bin\brcc32.exe $**


#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
PROJECTS = $(TARGETDIR)\iacc.exe
#------------------------------------------------------------------------------
default: $(PROJECTS)
#------------------------------------------------------------------------------

$(TARGETDIR)\iacc.exe: iacc.dpr
  $(DCC)

clean:
 $(SILENT)-$(CMD) del .\Out\*.* /s /q > nul
 $(SILENT)-$(CMD) del *.*~* /s > nul
 $(SILENT)-$(CMD) del "*.*#*" /s > nul
 $(SILENT)-$(CMD) del *.dcu /s > nul
 $(SILENT)-$(CMD) del *.ddp /s > nul
 $(SILENT)-$(CMD) del *.tds /s > nul
 $(SILENT)-$(CMD) del *.obj /s > nul

run:  $(TARGETDIR)\iacc.exe
  $(CMD) start $(TARGETDIR)\iacc.exe /ignore_version
