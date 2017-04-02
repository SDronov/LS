@@Define_Variables.sql
spool &&INSTALL_LOG_PATH\01_Create_Owner.log
 
-- Создание пользователя - владельца схемы ВЕРО
-- Исполняется от имени пользователя с правами DBA

PROMPT **************************************************************************
PROMPT Подключение к серверу &&SERVER_NAME от имени пользователя с правами DBA...
PROMPT
ACCEPT DBA_USER CHAR PROMPT 'Введите имя пользователя с правами DBA => '
ACCEPT DBA_USER_PASSWORD CHAR PROMPT 'Введите пароль => ' HIDE
PROMPT

connect &&DBA_USER/&&DBA_USER_PASSWORD@&&SERVER_NAME as sysdba

PROMPT
PROMPT Внимание!
PROMPT Если пользователь &&VERO_USER существует, то он будет удален.
ACCEPT DO_DROP_USER CHAR PROMPT 'Продолжить установку (y/n)? => '
begin
  if upper('&&DO_DROP_USER') = 'Y' then
    begin
      execute immediate 'drop user &&VERO_USER cascade';
    exception
      when others then
        if sqlcode = -01918 then
          null;
        else  
          raise_application_error(-20001,
            'Ошибка удаления пользователя &&VERO_USER. ' || chr(10) || sqlerrm);
        end if;    
    end;
  else
    raise_application_error(-20001, 'Процесс установки схемы ВЕРО прерван пользователем.');
  end if;
end;
/

create user &&VERO_USER  
    identified by &&VERO_USER_PASSWORD
    default tablespace &&VERO_USER_DEFAULT_TABLESPACE
    quota unlimited on &&VERO_USER_DEFAULT_TABLESPACE
    account unlock;
grant create procedure to &&VERO_USER;
grant create sequence to &&VERO_USER;
grant create synonym to &&VERO_USER;
grant create table to &&VERO_USER;
grant create trigger to &&VERO_USER;
grant create type to &&VERO_USER;
grant create user to &&VERO_USER;
grant create view to &&VERO_USER;
grant connect to &&VERO_USER;

exit