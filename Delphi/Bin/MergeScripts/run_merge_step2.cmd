@echo off

set source_con=%1
set dest_con=%2
set dba_con=%3
set dumps_path=%4
set expimp_path=%5
set date=%6
set dest_inst=%7
set fromuser=%8


echo иру 2
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

