create table tmp_dbobj 
  (name varchar2(50), 
   otype varchar2(50));
   
create table tmp_cons_log 
  (cname varchar2(50), 
   ctype varchar2(1), 
   tname varchar2(50), 
   err_text varchar2(2000), 
   cols varchar2(1000), 
   vals varchar2(1000));

   
exit
