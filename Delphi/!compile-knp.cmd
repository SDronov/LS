@echo off
set DEL7="C:\Borland\Delphi7"
SET INNO="C:\Program Files (x86)\Inno Setup 5"
set FDC_ROOT=%CD%
SET DEL7LIB="%DEL7%\Lib";"%DEL7%\Bin";"%DEL7%\Imports";"%DEL7%\Projects\Bpl";"%DEL7%\Rave5\Lib"
SET LIB7="%FDC_ROOT%\dx-rus";"%FDC_ROOT%\Library\DOA";"%FDC_ROOT%\Library\DX";"%FDC_ROOT%\Library\VKDBF";"%FDC_ROOT%\Library\ZipTV";"%FDC_ROOT%\Library\XLReport";"%FDC_ROOT%\Library\JEDI\jcl";"%FDC_ROOT%\Library\JEDI\jvcl";"%FDC_ROOT%\Library\JEDI\Resources";"%FDC_ROOT%\FDC Library\FDC Common\Out";"%FDC_ROOT%\FDC Library\FDC Objects\Out";"%FDC_ROOT%\Common";%DEL7LIB%
SET RES7="%FDC_ROOT%\Library\JEDI\Resources"
SET PATH=%DEL7%\Bin;%INNO%;%PATH%

SET LIBGTDW=%DEL7LIB%;"%Del7%\DOA";"%Del7%\Rave5\LIB";"%FDC_ROOT%\GTDViewer\UNIT"

rem Common Library
echo .
echo ��������� ��饩 ������⥪�
echo ===========================
echo .
cd "FDC Library\FDC Common"
call !compile.cmd
cd "..\FDC Objects"
call !compile.cmd
rem pause

rem GTDViewer
echo .
echo ��������� ������⥪� ��ᬮ�� ���
echo ===================================
echo .
cd "..\..\GTDViewer\src\MainDLL"
call !compile.cmd
rem pause

rem Administrator
echo .
echo ��������� �� �����������-��
echo ==============================
echo .
cd "..\..\..\admin"
call !compile.cmd
rem pause

rem crypt
echo .
echo ��������� ������⥪� �ਯ⮧����
echo ==================================
echo .
cd "..\crypt"
call !compile.cmd
rem pause

rem Income-Accounts
echo .
echo ��������� ��� ��楢� ���-�
echo ==============================
echo .
cd "..\Income-Accounts"
call !compile.cmd
rem pause

rem Income-Exchange
echo .
echo ��������� ��� �����-��室/����
echo ===============================
echo .
cd "..\Income-Exchange"
call !compile.cmd
rem pause

rem LoadApp
echo .
echo ��������� �� ��७�� ���⪮�
echo ==============================
echo .
cd "..\LoadApp"
call !compile.cmd
rem pause

rem NOTIFICATOR
echo .
echo ��������� �ࢨ� 㢥��������
echo =========================================
echo .
cd "..\notificator"
call !compile.cmd
rem pause

rem CheckSum
echo .
echo ������� ����஫��� �㬬
echo ========================
echo .
cd "..\Bin"
call ls_sum_k.cmd 

rem create installations
echo .
echo ��������� ���⠫�樮���� ����⮢
echo =================================
echo .
cd "..\..\setup\LS-KNP"
iscc.exe iacc.iss

cd ..\..\Delphi

echo ��������� �����襭�

cd .\Bin
REM del LoadApp.exe iesvc.exe iacc.exe crypt.exe SecurityMonitor.exe lgtdviewer.dll

cd ..
rem pause