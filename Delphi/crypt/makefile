#  Copyright © Fors Development Center. 
#  All rights reserved.
#
#  $Source$
#  $Revision: 1370 $
#  $Author: alexvolo $
#  $Date: 2006-04-05 12:52:04 +0400 (РЎСЂ, 05 Р°РїСЂ 2006) $
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

XL_LIB = $(ROOT)\..\..\AfalinaSoft\XL Report 4\d7units\

SEARCHDIR = $(ROOT)\Projects\Bpl;$(DX_LIB);$(DOA_LIB);$(XL_LIB)


MAKE = "$(ROOT)\bin\make.exe" -$(MAKEFLAGS) -f$**
DCC = "$(ROOT)\bin\dcc32.exe" $(DCCFLAGS) -N.\Out -U"$(SEARCHDIR: ;=;)" -LE$(TARGETDIR) -LN$(TARGETDIR) $(**F)
BRCC = $(ROOT)\bin\brcc32.exe $**


#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
PROJECTS = $(TARGETDIR)\crypt.exe
#------------------------------------------------------------------------------
default: $(PROJECTS)
#------------------------------------------------------------------------------

$(TARGETDIR)\crypt.exe: crypt.dpr
  $(DCC)

clean:
 $(SILENT)-$(CMD) del .\Out\*.* /s /q > nul
 $(SILENT)-$(CMD) del *.*~* /s > nul
 $(SILENT)-$(CMD) del "*.*#*" /s > nul
 $(SILENT)-$(CMD) del *.dcu /s > nul
 $(SILENT)-$(CMD) del *.ddp /s > nul
 $(SILENT)-$(CMD) del *.tds /s > nul
 $(SILENT)-$(CMD) del *.obj /s > nul

run:  $(TARGETDIR)\crypt.exe
  $(CMD) start $(TARGETDIR)\crypt.exe
