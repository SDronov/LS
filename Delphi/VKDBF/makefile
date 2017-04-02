#
#  Copyright c Fors Development Center. 
#  All rights reserved.
#
#  $Workfile: fdcCommon.bpg $
#  $Revision: 106 $
#  $Author: alexvolo $
#  $Date: 2005-08-05 14:51:16 +0400 (РџС‚, 05 Р°РІРі 2005) $
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
TARGETDIR=$(ROOT)\Projects\Bpl
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

SEARCHDIR=$(ROOT)\Projects\Bpl;$(DX_LIB)


MAKE = "$(ROOT)\bin\make.exe" -$(MAKEFLAGS) -f$**
DCC = "$(ROOT)\bin\dcc32.exe" -B $(DCCFLAGS) -U"$(SEARCHDIR: ;=;)" $(**F)
# -LE$(TARGETDIR) -LN$(TARGETDIR) $(**F)
BRCC = $(ROOT)\bin\brcc32.exe $**


#------------------------------------------------------------------------------
#clean:
# $(SILENT)-$(CMD) del *.*~* /s
# $(SILENT)-$(CMD) del "*.*#*" /s
# $(SILENT)-$(CMD) del *.dcu /s
# $(SILENT)-$(CMD) del *.ddp /s
# $(SILENT)-$(CMD) del *.tds /s  
# $(SILENT)-$(CMD) del *.obj /s

#------------------------------------------------------------------------------
PROJECTS = $(TARGETDIR)\vkdbf7.bpl
#------------------------------------------------------------------------------
default: $(PROJECTS)
#------------------------------------------------------------------------------

$(TARGETDIR)\vkdbf7.bpl: vkdbf7.dpk
  $(DCC)


install: $(TARGETDIR)\vkdbf7.bpl
 $(SILENT)$(REG) import  &&!
REGEDIT4

[HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Known Packages]
"$(**:\=\\)"="$(DESCRIPTION)"
!

uninstall: 
 $(SILENT)$(REG) import &&!
REGEDIT4

[HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Known Packages]
"$(**:\=\\)"=-
!

