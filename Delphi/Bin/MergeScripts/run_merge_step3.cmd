@echo off

set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set dest_inst=%7
set fromuser=%8


echo иру 3
cd 3.Merge
%expimp_path%\exp.exe ls_temp_merge/w@%dest_inst% file=%dumps_path%\merge_%date%.dmp grants=n statistics=none log=%dumps_path%\exp_merge_%date%.log triggers=n constraints=n 
%expimp_path%\sqlplus.exe %dest_con% @"1.1.create_log_tables.sql"
%expimp_path%\sqlplus.exe %dest_con% @"1.2.disable_cons_trgs.sql"
%expimp_path%\imp.exe %dest_con% file=%dumps_path%\merge_%date%.dmp log=%dumps_path%\imp_merge_%date%.log fromuser=LS_TEMP_MERGE touser=DOXOD_LS_2 grants=N data_only=y
%expimp_path%\sqlplus.exe %dest_con% @"1.3.enable_cons_trgs.sql"
%expimp_path%\sqlplus.exe %dest_con% @"02.Seq_Fix(Dest connect).pdc"
cd ..