@echo off

set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set dest_inst=%7
set fromuser=%8

echo иру 1
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

