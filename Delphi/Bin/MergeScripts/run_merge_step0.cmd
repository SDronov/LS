@echo off
dir

set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set dest_inst=%7
set fromuser=%8

echo иру 0
cd 0.Backup
call 1$_.Export.cmd
%expimp_path%\sqlplus.exe %dest_con% @2.Drop_Jobs.pdc
cd ..

