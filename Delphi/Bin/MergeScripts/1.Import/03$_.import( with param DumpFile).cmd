imp.exe userid=%dba_con% file=%dumps_path%\source_%DATE%.dmp log=%dumps_path%\imp_src_%DATE%.log fromuser=%fromuser% touser=LS_SRC_MERGE ignore=Y grants=N
imp.exe userid=%dba_con% file=.\mrg_template\mrg_template.dmp log=%dumps_path%\mrg_template_import.log fromuser=ls_ul touser=LS_SRC_MERGE
