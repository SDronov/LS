del /Q .\Log\*.log

sqlplusw /nolog @Scripts\01_Create_Owner.sql
if errorlevel 1 goto error1

sqlplusw /nolog @Scripts\02_Before_Import.sql
if errorlevel 1 goto error1

imp parfile=Scripts\03_Import.par
echo %errorlevel%
if errorlevel 3 goto error1

sqlplusw /nolog @Scripts\04_After_Import.sql
if errorlevel 1 goto error1

:error1
