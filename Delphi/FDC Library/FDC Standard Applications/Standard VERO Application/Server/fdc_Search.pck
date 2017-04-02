create or replace package fdc_search is
-- Общий пакет для реализации поисков 
-- с использованием временной таблицы fdc_Buffer
-- реализует поиск по основным реквизитам (и/или) И поиск по дополнительным параметрам
-- в основном реализация универсальная и может использоваться для произвольного типа объектов
-- Непосредственно с клиента не используется!
-- Интерфейсными являются процедура FDC_BUFFER_ADD_SEARCHCONDITION 
--                          функция FDC_..._SEARCH
-- Сейчас пример такой реализации - fdc_Person_Search
----------------------------------------------------------------------------------
-- Управляющие поиском типы и структуры
type TNumberList is table of number;

-- Поисковый критерий (тип)
-- Имеет флаг активности
-- и одно из типизированных значений,
-- причем для дополнительных критериев
-- числовые значения всегда обрабатываются и как отдельные переменные, и как элементы списка
type TSearch_Criteria is record
 (Is_Active boolean,
  Str_Value varchar2(1500),
  Num_Value number,
  Bool_Value boolean,
  List_Value TNumberList := TNumberList()
 );
 
-- Список критериев (тип)
-- Проиндексирован именем критерия (например, REG_DOC_NUM)
type TSearch_Criteria_Lst is table of TSearch_Criteria index by varchar2(100);

-- Список указателей на какое-либо подмножество критериев
type TAdd_Criteria_Index is table of varchar2(100);

-- Структура поисковых критериев
-- В ней:
--   Список критериев,
--   Флаг И-ИЛИ
--   Максимальное количество записей
type TSearch is record
  (Search_Criteria_Lst TSearch_Criteria_Lst,
   Req_Conditions boolean := false,
   Add_Conditions boolean := false,
   RequsitesSearchOR boolean := null,
   AddSearchOR boolean := null,
   MaxRows number);

-- Переменная - указатель на структуру поисковых критериев
Search TSearch;

-- Структуры, управляющие универсальным поиском по отдельным полям
-- Поле реквизита (тип)
-- Устанавливает соответствие поискового критерия и поля
type TSearch_Field is record
  (Name varchar2(100),
   Descr varchar2(100),
   Field_Name varchar2(30)
  );
  
-- Список полей реквизитов  
type TSearch_Field_Lst is table of TSearch_Field;
Search_Field_Lst TSearch_Field_Lst := TSearch_Field_Lst();

-- Список запросов (для использования в общих процедурах поиска)
type TSQL_Lst is table of varchar2(4000);


-- Список задействованных в процессе поиска сеансов (в контексте fdc_Buffer)
type TSearch_Sess_Lst is table of varchar2(1500);
Search_Sess_Lst TSearch_Sess_Lst := TSearch_Sess_Lst();

----------------------------------------------------------------------------------
-- Переменные

----------------------------------------------------------------------------------
-- Получение нового pSess
-- Если pAdd_To_List = true,
-- созданная сессия добавляется к списку сессий сеанса поиска
function New_Search_Sess (pAdd_To_List boolean := true) return varchar2;
----------------------------------------------------------------------------------
-- Добавление поискового поля в список полей реквизитов
procedure Search_Field_Add(pName varchar2,
                           pDescr varchar2,
                           pField varchar2);
----------------------------------------------------------------------------------
-- Заполнение массива критериев
procedure Fill_Search_Criteria (pSess varchar2);
----------------------------------------------------------------------------------
-- Активен ли критерий?
function Criteria_Active (pCriteria varchar2) return boolean;
----------------------------------------------------------------------------------
-- Строковое значение критерия
function Criteria_Str (pCriteria varchar2) return varchar2;
----------------------------------------------------------------------------------
-- Числовое значение критерия
function Criteria_Num (pCriteria varchar2) return number;
----------------------------------------------------------------------------------
-- Логическое значение критерия
function Criteria_Bool (pCriteria varchar2) return boolean;

---------------------------------------------------------------------
-- Процедура поиска по реквизитам
-- запускает динамический SQL по заданным условиям
procedure Exec_Req_Search_Step (pSearch_Value varchar2,
                            pDescr varchar2,
                            pSQL_And in out nocopy TSQL_Lst,
                            pSQL_Or in out nocopy TSQL_Lst,
                            pCurSess in out varchar2,
                            pPrevSess in out varchar2,
                            pResSess in out varchar2);

---------------------------------------------------------------------
-- Процедура поиска по доп условиям, например, связям
-- запускает динамический SQL по заданным условиям
-- возвращает количество найденных записей
procedure Exec_Add_Search_Step (
                            pDescr varchar2,
                            pSQL_WithPrev_And varchar2,
                            pSQL_WithPrev_Or varchar2,
                            pSQL_WithoutPrev_And varchar2,
                            pSQL_WithoutPrev_Or varchar2,
                            pCheckSearchExit boolean,
                            pCurSess in out varchar2,
                            pPrevSess in out varchar2,
                            pResSess in out varchar2);

end;
/
create or replace package body fdc_Search is

----------------------------------------------------------------------------------
-- Константы
  REQ_Prefix       constant varchar2(100) := 'REQ_';
  ADD_Prefix       constant varchar2(100) := 'ADD_';

  PARAM_REQ_SEARCH_OR       constant varchar2(100) := 'PARAM_REQ_SEARCH_OR';
  PARAM_ADD_SEARCH_OR       constant varchar2(100) := 'PARAM_ADD_SEARCH_OR';
  PARAM_MAXROWS             constant varchar2(100) := 'PARAM_MAXROWS';


----------------------------------------------------------------------------------
-- Добавить поисковую сессию в протокол
procedure Search_Sess_Add (pSess varchar2) is
i number;
begin
  i := Search_Sess_Lst.count + 1;
  Search_Sess_Lst.extend;
  Search_Sess_Lst(i) := pSess;
end;

----------------------------------------------------------------------------------
-- Получение нового pSess
-- Если pAdd_To_List = true,
-- созданная сессия добавляется к списку сессий сеанса поиска
function New_Search_Sess (pAdd_To_List boolean := true) return varchar2 is
lSess varchar2(100);
begin
  select to_char(fdc_Buffer_key_sq.nextval) into lSess from dual;
  if pAdd_To_List then
    Search_Sess_Add(lSess);
  end if;  
  return lSess;
end;

----------------------------------------------------------------------------------
-- Добавление поискового поля в список полей реквизитов
procedure Search_Field_Add(pName varchar2,
                           pDescr varchar2,
                           pField varchar2) is
i number;
begin
  i := Search_Field_Lst.count;
  i := i + 1;
  Search_Field_Lst.extend;
  Search_Field_Lst(i).Name := pName;
  Search_Field_Lst(i).Descr := pDescr;
  Search_Field_Lst(i).Field_Name := pField;
end;

----------------------------------------------------------------------------------
-- Заполнение записи критерия
procedure Criteria_Ins(p_Criteria varchar2,
                        p_Value varchar2) is
lNumValue number;                       
lIs_Add_Value boolean;
begin
  -- Проверка, не пустой ли параметр
  if trim(replace(p_Value, '%')) is null then
    return;
  end if;
  
  -- Получение числового значения критерия
  begin
    lNumValue := to_number(p_Value);
  exception
    when others then lNumValue := null;
  end;
  
  -- Является ли дополнительным критерием?
  lIs_Add_Value := instr(p_Criteria, Add_Prefix) = 1;
  
  -- Проверка, не повторяется ли критерий? 
  -- Это допустимо только для дополнительных числовых критериев
  -- там есть списочные значения
  if Search.Search_Criteria_Lst.exists(p_Criteria) and
    (not (lIs_Add_Value and lNumValue is not null)) then
      raise_application_error(-20096, 'Повторно задан поисковый критерий: '||p_Criteria);
  end if;  
    
  -- Добавление критерия в общий список
  Search.Search_Criteria_Lst(p_Criteria).Is_Active := true;
  Search.Search_Criteria_Lst(p_Criteria).Str_Value := upper(p_Value);
  if p_Value in ('0', '1') then
    Search.Search_Criteria_Lst(p_Criteria).Bool_Value := (p_Value = '1');
  end if;  
  
  -- Числовое значение может быть как единственным, так и элементом списка
  -- В последнем случае значение Num_Value остается пустым
  if lNumValue is not null then
    if lIs_Add_Value then
      Search.Search_Criteria_Lst(p_Criteria).List_Value.extend;
      Search.Search_Criteria_Lst(p_Criteria).List_Value(Search.Search_Criteria_Lst(p_Criteria).List_Value.count) := lNumValue;
    end if;
    if Search.Search_Criteria_Lst(p_Criteria).List_Value.count <= 1 then
      Search.Search_Criteria_Lst(p_Criteria).Num_Value := lNumValue;
    else
      Search.Search_Criteria_Lst(p_Criteria).Num_Value := null;
    end if;  
  end if;
  
  -- Действия, специфичные для типа критерия
  if instr(p_Criteria, Req_Prefix) = 1 then
    Search.Req_Conditions := true;
  elsif instr(p_Criteria, Add_Prefix) = 1 then
    Search.Add_Conditions := true;
  elsif p_Criteria = PARAM_MaxRows then
    Search.MaxRows := to_number(p_Value);
  elsif p_Criteria = PARAM_REQ_SEARCH_OR then
    Search.RequsitesSearchOR := (p_Value = '1');
  elsif p_Criteria = PARAM_ADD_SEARCH_OR then
    Search.AddSearchOR := (p_Value = '1');
  end if;
end;

----------------------------------------------------------------------------------
-- Заполнение массива критериев
procedure Fill_Search_Criteria (pSess varchar2) is
l_EqualPos number;
l_Criteria varchar2(100);
l_Value varchar2(1500);
begin
  Search.Search_Criteria_Lst.delete;
  Search.Req_Conditions := false;
  for rec in (select txt from fdc_buffer where sess = pSess) loop
    l_EqualPos := instr(rec.txt, '=');
    if l_EqualPos <= 1 then
      raise_application_error(-20089, 'Неверно задан поисковый критерий: '||rec.txt);
    end if;
    l_Criteria := substr(rec.txt, 1, l_EqualPos - 1);
    l_Value := substr(rec.txt, l_EqualPos + 1, length (rec.txt) - l_EqualPos);
    Criteria_Ins(l_Criteria, l_Value);
  end loop;
  if Search.RequsitesSearchOR is null then
    raise_application_error(-20100, 'Не задан поисковый критерий: '||PARAM_REQ_SEARCH_OR);
  end if;
  if Search.AddSearchOR is null then
    raise_application_error(-20100, 'Не задан поисковый критерий: '||PARAM_ADD_SEARCH_OR);
  end if;
  Search_Sess_Lst.delete;
end;

----------------------------------------------------------------------------------
-- Активен ли критерий?
function Criteria_Active (pCriteria varchar2) return boolean is
begin
  return Search.Search_Criteria_Lst.Exists(pCriteria) and
         Search.Search_Criteria_Lst(pCriteria).Is_Active;
end;

----------------------------------------------------------------------------------
-- Строковое значение критерия
function Criteria_Str (pCriteria varchar2) return varchar2 is
begin
  if not Criteria_Active(pCriteria) then
    raise_application_error(-20126, 'Запрос значения по неактивному критерию: '||pCriteria);
  end if;
  return Search.Search_Criteria_Lst(pCriteria).Str_Value;
end;

----------------------------------------------------------------------------------
-- Числовое значение критерия
function Criteria_Num (pCriteria varchar2) return number is
begin
  if not Criteria_Active(pCriteria) then
    raise_application_error(-20126, 'Запрос значения по неактивному критерию: '||pCriteria);
  end if;
  return Search.Search_Criteria_Lst(pCriteria).Num_Value;
end;

----------------------------------------------------------------------------------
-- Логическое значение критерия
function Criteria_Bool (pCriteria varchar2) return boolean is
begin
  if not Criteria_Active(pCriteria) then
    raise_application_error(-20126, 'Запрос значения по неактивному критерию: '||pCriteria);
  end if;
  return Search.Search_Criteria_Lst(pCriteria).Bool_Value;
end;

---------------------------------------------------------------------
-- Процедура поиска по реквизитам,
-- запускает динамический SQL по заданным условиям
procedure Exec_Req_Search_Step (pSearch_Value varchar2,
                            pDescr varchar2,
                            pSQL_And in out nocopy TSQL_Lst,
                            pSQL_Or in out nocopy TSQL_Lst,
                            pCurSess in out varchar2,
                            pPrevSess in out varchar2,
                            pResSess in out varchar2) is
pRowCount number;
lInsSQL varchar2(4000) := 'insert into fdc_Buffer(ID,Sess,Mark1,Txt)';
lSQL varchar2(4000);
lFoundCount number;
begin
  if pPrevSess is not null then
    -- Если поиск по "И" и уже есть промежуточный результат - новый ID сессии
    pCurSess := new_search_sess;
  end if;
  pRowCount := 0;
  if pPrevSess is not null then
    -- Если поиск по "И" и уже есть промежуточный результат
    for i in 1..pSQL_And.count loop
      lSQL := lInsSQL || chr(10) || pSQL_And(i);
      execute immediate lSQL using pCurSess, pDescr, pSearch_Value, pPrevSess;
      pRowCount := pRowCount + sql%rowcount;
    end loop;
  else
    -- Если поиск по "ИЛИ" или нет промежуточного результата
    for i in 1..pSQL_Or.count loop
      lSQL := lInsSQL || chr(10) || pSQL_Or(i);
      execute immediate lSQL using pCurSess, pDescr, pSearch_Value;
      pRowCount := pRowCount + sql%rowcount;
    end loop;
  end if;

  -- Поиск по заданному запросу (запросам) проведен
  -- А теперь не пора ли закончить весь сеанс поиска?
  if not Search.RequsitesSearchOR then
    -- Если поиск по "И"
    if pRowCount > 0 then
      -- Это сессия возможно не последняя!
      pPrevSess := pCurSess;
    else
      -- Это была последняя сессия, результат пустой, к нему уже ничего не приджойнится
      pResSess := pCurSess;
    end if;
  else
   -- Если поиск по "ИЛИ"
   if not Search.Add_Conditions then
     -- Если не задано дополнительных условий, проверить количество записей
     select count(distinct ID)
     into lFoundCount
     from Fdc_Buffer
     where sess = pCurSess;
     if lFoundCount > Search.MaxRows then
       -- Если уже набрали записей больше лимита, прекращаем поиск
       pResSess := pCurSess;
     end if;
   end if;
  end if;
exception
  when others then
    raise_application_error(-20211, sqlerrm||chr(10)||lSQL);
end;

---------------------------------------------------------------------
-- Процедура поиска по доп условиям, например, связям
-- запускает динамический SQL по заданным условиям
-- возвращает количество найденных записей
procedure Exec_Add_Search_Step (
                            pDescr varchar2,
                            
                            pSQL_WithPrev_And varchar2,
                            pSQL_WithPrev_Or varchar2,
                            pSQL_WithoutPrev_And varchar2,
                            pSQL_WithoutPrev_Or varchar2,
                            pCheckSearchExit boolean,
                            pCurSess in out varchar2,
                            pPrevSess in out varchar2,
                            pResSess in out varchar2) is
pRowCount number;
lInsSQL varchar2(4000) := 'insert into fdc_Buffer(ID,Sess,Mark1,Txt)';
lSQL varchar2(4000);
lFoundCount number;
begin
  pRowCount := 0;
  if pPrevSess is not null then
    -- Если был предыдущий поиск
    if not Search.AddSearchOR then
      -- Если условие "И"
      lSQL := lInsSQL||chr(10)||pSQL_WithPrev_And;
    else
      -- Если условие "ИЛИ"
      lSQL := lInsSQL||chr(10)||pSQL_WithPrev_Or;
    end if;
    execute immediate lSQL using pCurSess, pDescr, pPrevSess;
  else
    -- Если не было предыдущего поиска
    if not Search.AddSearchOR then
      -- Если условие "И"
      lSQL := lInsSQL||chr(10)||pSQL_WithoutPrev_And;
    else
      -- Если условие "ИЛИ"
      lSQL := lInsSQL||chr(10)||pSQL_WithoutPrev_Or;
    end if;
    execute immediate lSQL using pCurSess, pDescr;
  end if;

  -- Поиск по заданному запросу (запросам) проведен
  -- А теперь не пора ли закончить весь сеанс поиска?
  if pCheckSearchExit then
    pRowCount := sql%rowcount;
    if not Search.AddSearchOR then
      -- Если поиск по "И"
      if pRowCount > 0 then
        -- Это сессия возможно не последняя!
        pPrevSess := pCurSess;
      else
        -- Это была последняя сессия, результат пустой, к нему уже ничего не приджойнится
        pResSess := pCurSess;
      end if;
    else
      -- Если поиск по "ИЛИ"
      select count(distinct ID)
      into lFoundCount
      from Fdc_Buffer
      where sess = pCurSess;
      if lFoundCount > Search.MaxRows then
        -- Если уже набрали записей больше лимита, прекращаем поиск
        pResSess := pCurSess;
      end if;
    end if;
  end if;
exception
  when others then
    raise_application_error(-20211, sqlerrm||chr(10)||lSQL);
end;

end;
/
