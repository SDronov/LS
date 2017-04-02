@echo off

echo Начало процесса слияния...

set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set dest_inst=%7
set fromuser=%8

echo Шаг 0
cd 0.Backup
call 1$_.Export.cmd
%expimp_path%\sqlplus.exe %dest_con% @2.Drop_Jobs.pdc
cd ..

echo Шаг 1
cd 1.Import
%expimp_path%\sqlplus.exe %dba_con% as SYSDBA @"01$_.Create_User_With_Grants(DBA connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"02.create_types(Src connect).pdc"
call "03$_.import( with param DumpFile).cmd"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"FDC#TRG#OBJECT_BU.sql"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"04.0.create_tables_if_nessesary(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"05.Add_Mrg_Columns(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"06.Create_Functions(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"07.Grant_To_Merge_Role(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"08.Recompile_and_GatherStats(Src connect).pdc"
cd ..

echo Шаг 2
cd 2.DataMove
%expimp_path%\sqlplus.exe %dest_con% @"00$_.AddSrcUser(DestOwner connect).pdc"
%expimp_path%\sqlplus.exe %dest_con% @"01.Grant_To_Merge_Role(DestOwner connect).pdc"
cd 02.DictSync
%expimp_path%\sqlplus.exe %dest_con% @"1.SyncKBK(Src and Dest connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"1.SyncKBK(Src and Dest connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"2.SyncDicts(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"3.FillDictLinks(Src connect).pdc"
cd ..
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"03.SyncTypes(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"04.ChangeKeys(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_src_merge/w@%dest_inst% @"05.MoveTabsToTemp(Src connect).pdc"
%expimp_path%\sqlplus.exe ls_temp_merge/w@%dest_inst% @"06$_.VerifyAndChangeData(LS_TEMP connect).pdc"
cd ..

echo Шаг 3
cd 3.Merge
%expimp_path%\exp.exe ls_temp_merge/w@%dest_inst% file=%dumps_path%\merge_%date%.dmp grants=n statistics=none log=%dumps_path%\exp_merge_%date%.log triggers=n constraints=n 
%expimp_path%\sqlplus.exe %dest_con% @"1.1.create_log_tables.sql"
%expimp_path%\sqlplus.exe %dest_con% @"1.2.disable_cons_trgs.sql"
%expimp_path%\imp.exe %dest_con% file=%dumps_path%\merge_%date%.dmp log=%dumps_path%\imp_merge_%date%.log fromuser=LS_TEMP_MERGE touser=DOXOD_LS_2 grants=N data_only=y
%expimp_path%\sqlplus.exe %dest_con% @"1.3.enable_cons_trgs.sql"
%expimp_path%\sqlplus.exe %dest_con% @"02.Seq_Fix(Dest connect).pdc"
cd ..

echo Процесс слияния завершен.