create or replace function fdc_Person_Search (pConditionSess	varchar2)
-- Процедура поиска субъекта из специализировааной поисковой формы 
-- с использованием временной таблицы fdc_Buffer
-- Подразумевается, что предварительно из той же поисковой формы 
-- посредством процедуры fdc_buffer_add_searchcondition
-- помещается список поисковых критериев с одним идентификатором сеанса (fdc_Buffer.Sess)
-- Этот идентификатор сеанса передается в данную функцию (fdc_Person_Search)
-- в качестве входного параметра pConditionSess
-- Поиск по заданному массиву критериев производится с использованием 
-- универсального пакета fdc_Search
-- Результат выборки помещается в fdc_Buffer с новым идентификатором сеанса,
-- возвращаемого как результат данной функции (fdc_Person_Search)
-- После осуществления поиска его результат может быть получен на клиента
-- с использованием представления fdc_person_lst_bysearchbuf

-- Подразумевается, что поисковые критерии условно делятся на две группы:
-- 1. Условия на реквизиты (названия критериев имеют префикс REQ_)
-- 2. Дополнительные условия, например, на связи с другими объектами (названия критериев имеют префикс ADD_)
-- Условия этих групп объединяются по "И"
-- В рамках каждой группы условия могут объединяться как по "И", так и по "ИЛИ"
-- Это регулируется параметрами PARAM_RequsitesSearchOR и PARAM_AddSearchOR
-- ('1' - "ИЛИ", '0' - "И")

-- Параметры, задающие условия на поля, задаются и интерпретируются как строки,
-- Параметры, имеющие логический смысл: true, false передаются соответственно как 1, 0
-- Для дополнительных параметров допустима последовательная передача нескольких (числовых!) значений,
-- они интерпретируются как списки, например, списки идентификаторов
-- Дополнительные комментарии про передачу параметров см. в комментарии к fdc_buffer_add_searchcondition

-- Дополнительные условия, обрабатываемые данной функцией в качестве примера:
-- 1. Наличие пометки определенного типа
-- 2. Наличие связки с регистрационным документом определенного типа 

-- Обрабатываются следующие критерии:
-- Обязательные:
-- PARAM_MAXROWS - максимальное количество записей в результате
-- PARAM_REQ_SEARCH_OR - как объединяются условия на реквизиты: 0 - "И", 1 - "ИЛИ"
-- PARAM_ADD_SEARCH_OR - как объединяются дополнительные условия: 0 - "И", 1 - "ИЛИ"
-- Необязательные:
-- REQ_FULLNAME - поисковая строка для наименования
-- REQ_ADDRESS - поисковая строка для адреса
-- REQ_BIC - поисковая строка для БИК
-- REQ_DOCNUMBER - поисковая строка для номера документа
-- REQ_INN - поисковая строка для ИНН
-- REQ_KPP - поисковая строка для КПП
-- REQ_OKPO - поисковая строка для ОКПО
-- REQ_OGRN - поисковая строка для ОГРН
-- ADD_KIND_ID - идентификатор пометки, по которой производится поиск
-- ADD_REG_DOC_TYPE_ID - идентификатор типа регистрационного документа

 
return varchar2 is

pCurSess			varchar2(1500);
pPrevSess     varchar2(1500) := null;
pResSess			varchar2(1500) := null;
pFinalSess  	varchar2(1500) := null;

pCnt number;

pCurrent_Criteria varchar2(100);
pObjectTypesList varchar2(2000);

-- Переменные идентификаторов типов, используемых при поиске
PersonTypeID number;
RegDocumentTypeID number;
AddressTypeID number;

-- Переменные поиска по регистрационным реквизитам
lAndSqlLst Fdc_Search.Tsql_Lst := Fdc_Search.Tsql_Lst();
lOrSqlLst Fdc_Search.Tsql_Lst := Fdc_Search.Tsql_Lst();

-- Переменные поиска ролевым функциям
lAndSqlStr varchar2(4000);
lOrSqlStr varchar2(4000);
lLinkedObjID number;

-- Константы
REQ_FullName             constant varchar2(100) := 'REQ_FULLNAME';
REQ_Address              constant varchar2(100) := 'REQ_ADDRESS';
REQ_BIC                  constant varchar2(100) := 'REQ_BIC';
REQ_DocNumber            constant varchar2(100) := 'REQ_DOCNUMBER';
REQ_INN                  constant varchar2(100) := 'REQ_INN';
REQ_KPP                  constant varchar2(100) := 'REQ_KPP';
REQ_OKPO                 constant varchar2(100) := 'REQ_OKPO';
REQ_OGRN                 constant varchar2(100) := 'REQ_OGRN';
ADD_KIND_ID              constant varchar2(100) := 'ADD_KIND_ID';
ADD_REG_DOC_TYPE_ID      constant varchar2(100) := 'ADD_REG_DOC_TYPE_ID';
--------------------------------------------------------------------------------
---  Внутренние процедуры
--------------------------------------------------------------------------------
  -- Внутренняя процедура инициализации списка полей
  -- !! Логическое имя поискового поля соответствует имени критерия,
  -- на это завязана логика обработки
  procedure Init_Search_Fields is
  begin
    fdc_Search.Search_Field_Lst.delete;
    fdc_Search.Search_Field_Add(REQ_OGRN, 'ОГРН', 'OGRN');
    fdc_Search.Search_Field_Add(REQ_INN, 'ИНН', 'INN');
    fdc_Search.Search_Field_Add(REQ_KPP, 'КПП', 'KPP');
    fdc_Search.Search_Field_Add(REQ_OKPO, 'ОКПО', 'OKPO');
    fdc_Search.Search_Field_Add(REQ_BIC, 'БИК', 'BIC');
  end;

  ------------------------------------
  -- Внутренняя процедура возвращает идентификатор типа по системному имени
  function SetIDByType (pObjectTypeSysName varchar2) return number is
    lTypeID number;
  begin
    lTypeID := fdc_Object_Get_BySysName('ObjectType',pObjectTypeSysName);
    if lTypeID is null then
      raise_application_error(-20270, 'Ошибка определения идентификатора типа объекта: '||pObjectTypeSysName);
    end if;
    return lTypeID;
  end;

  ------------------------------------
  -- Внутренняя процедура подготовки массивов SQL
  procedure InitSQLLst  (pAndSqlLst_Cnt number,
                         pOrSqlLst_Cnt number) is
    begin
    lAndSqlLst.delete;
    lOrSqlLst.delete;
    for i in 1..pAndSqlLst_Cnt loop
      lAndSqlLst.extend;
    end loop;
    for i in 1..pOrSqlLst_Cnt loop
      lOrSqlLst.extend;
    end loop;
    end;
  ------------------------------------
  ------------------------------------
  -- Внутренняя процедура формирования строки с SQL (для отладок)
  function Get_Debug_SQL return varchar2 is
    lDEbugStr varchar2(4000);
    begin
      for i in 1..lAndSqlLst.count loop
        lDEbugStr := lDEbugStr || '*****AND'||i||':'||chr(10)||lAndSqlLst(i)||chr(10);
      end loop;
      for i in 1..lOrSqlLst.count loop
        lDEbugStr := lDEbugStr || '*****OR'||i||':'||chr(10)||lOrSqlLst(i)||chr(10);
      end loop;
      return lDEbugStr;
    end;
  ------------------------------------
  ------------------------------------
  -- Внутренняя процедура запуска поиска по регистрационным данным
  procedure Exec_Reg_Search_Step  (pSearch_Value varchar2,
                                   pDescr varchar2) is
    begin
      fdc_Search.Exec_Req_Search_Step (
        pSearch_Value => pSearch_Value,
        pDescr => pDescr,
        pSQL_And => lAndSqlLst,
        pSQL_Or => lOrSqlLst,
        pCurSess => pCurSess,
        pPrevSess => pPrevSess,
        pResSess => pResSess);
    end;
  ------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Собственно начало поиска
begin

  -----------------------------------
  -- Инициализация служебных данных
  -----------------------------------
  Init_Search_Fields;
  PersonTypeID := SetIDByType('Person');
  RegDocumentTypeID := SetIDByType('RegDocument');
  AddressTypeID := SetIDByType('Address');
  
  -----------------------------------
  -- Инициализация массива критериев
  -----------------------------------
  fdc_Search.Fill_Search_Criteria(pConditionSess);
  if not fdc_Search.Search.REQ_Conditions and
     not fdc_Search.Search.ADD_Conditions then
  	Raise_application_error(-20001,'Нужно задать критерии поиска!');
  end if;
  
  
  -----------------------------------
  -- Проверки критериев
  -----------------------------------
  if not fdc_search.criteria_active(REQ_INN) and
     fdc_search.criteria_active(REQ_KPP) then
  	fdc_Util.Abort('КПП может быть задан только если задан ИНН');
  end if;

  -------------------------------------------------------------------------
  -------------------------------------------------------------------------
  -----------------------------------
  -- Поиски по регистрационным данным
  -----------------------------------
  if fdc_Search.Search.REQ_Conditions then
    pCurSess := fdc_search.new_search_sess;

    -----------------------------------------
    -- Универсальный поиск
    -- по основным регистрационным реквизитам
    -- (ОГРН, ИНН, КПП, ОКПО, БИК)
    -----------------------------------------
    InitSQLLst(1, 1);
    for i in 1..fdc_Search.Search_Field_Lst.count loop
      pCurrent_Criteria := fdc_Search.Search_Field_Lst(i).Name;
      if fdc_search.criteria_active(pCurrent_Criteria) then
        lAndSqlLst(1) :=
              'select	/*+FIRST_ROWS*/ distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
    	        'from	fdc_Person P, fdc_Buffer B'||chr(10)||
    	        'where P.'||fdc_Search.Search_Field_Lst(i).Field_Name || ' like :pSearch_Value and'||chr(10)||
              'B.Sess = :pPrevSess and B.ID = P.ID';
        lOrSqlLst(1) :=
              'select	/*+FIRST_ROWS*/ P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
    	        'from	fdc_Person P'||chr(10)||
    	        'where	P.' || fdc_Search.Search_Field_Lst(i).Field_Name || ' like :pSearch_Value';
        Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                              'По '||fdc_Search.Search_Field_Lst(i).Descr);
        if pResSess is not null then
          exit;
        end if;
      end if; -- fdc_search.criteria_active(pCurrent_Criteria)
    end loop;
    -----------------------------------------
    -- Завершен универсальный поиск
    -- по основным регистрационным реквизитам
    -----------------------------------------

    -----------------------------------------
    -- Поиск по наименованию
    -----------------------------------------
    pCurrent_Criteria := REQ_FullName;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
      pObjectTypesList := PersonTypeID || ', ' ||
                          RegDocumentTypeID;
      InitSQLLst(2, 2);
      -- AND---
      -- По полному имени субъекта и именах в подчиненных сущностях
      lAndSqlLst(1) :=
          'select /*+RULE*/ distinct'||chr(10)||
          'case when COT.Object_Type_ID = ' || PersonTypeID ||' then O.ID '||chr(10)||
          '     else O.Owner_Object_ID end ID, '||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID in (' || pObjectTypesList ||') and'||chr(10)||
          'O.Object_Type_ID is not null and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.Owner_Object_ID';
      -- По краткому имени субъекта
      lAndSqlLst(2) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'O.ID as ID,'||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.ShortName) is not null and'||chr(10)||
          'upper(O.ShortName) like :pSearch_Value and'||chr(10)||
          'O.Object_Type_ID = ' || PersonTypeID || ' and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.ID';

      -- OR ---
      -- По полному имени субъекта и именах в подчиненных сущностях
      lOrSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'case when COT.Object_Type_ID = ' || PersonTypeID ||' then O.ID '||chr(10)||
          '     else O.Owner_Object_ID end ID, '||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID in (' || pObjectTypesList ||') and'||chr(10)||
          'O.Object_Type_ID is not null and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID';
      -- По краткому имени субъекта
      lOrSqlLst(2) :=
          'select /*+FIRST_ROWS*/ distinct'||chr(10)||
          'O.ID as ID,'||chr(10)||
          ':pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Object O, fdc_Buffer B'||chr(10)||
          'where upper(O.ShortName) is not null and'||chr(10)||
          'upper(O.ShortName) like :pSearch_Value and'||chr(10)||
          'O.Object_Type_ID = ' || PersonTypeID;

      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            'По наименованию');
    end if; -- Поиск по наименованию

    -----------------------------------------
    -- Поиск по адресу
    -----------------------------------------
    pCurrent_Criteria := REQ_Address;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
        -- В запросах ниже необходимо использование Address,
        -- т.к. просто взять Owner_object_ID с объекта типа Address - некорректно:
        -- во многих случаях владельцами адресов являются не субъекты а, например,
        -- их объекты недвижимости.
        -- При этом ссылка Person_ID идет с адреса на субъекта, что дает нам корректный результат
      InitSQLLst(1, 1);
      lAndSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct P.ID, :pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Person P, fdc_Buffer B'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID = ' || AddressTypeID ||' and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'O.Owner_Object_Id = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID';
      lOrSqlLst(1) :=
          'select /*+FIRST_ROWS*/ distinct P.ID, :pCurSess, O.ID, :pDescr'||chr(10)||
          'from	fdc_Child_Object_Type COT, fdc_Object O, fdc_Person P'||chr(10)||
          'where upper(O.Name) is not null and'||chr(10)||
          'upper(O.Name) like :pSearch_Value and'||chr(10)||
          'COT.Object_Type_ID = ' || AddressTypeID ||' and'||chr(10)||
          'O.Object_Type_ID = COT.Child_Object_Type_ID and'||chr(10)||
          'O.Owner_Object_Id = P.ID';
      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            'По адресу');
    end if; -- Поиск по адресу

    -----------------------------------------
    -- Поиск по рег. документу
    -----------------------------------------
    pCurrent_Criteria := REQ_DocNumber;
    if fdc_Search.Criteria_Active(pCurrent_Criteria) and pResSess is null then
      InitSQLLst(1, 1);
      lAndSqlLst(1) :=
          'select /*+RULE*/ distinct P.ID, :pCurSess, D.ID, :pDescr'||chr(10)||
          'from	fdc_Reg_Document D, fdc_Object_Lst O, fdc_Buffer B, fdc_Person P'||chr(10)||
          'where D.Docnumber like :pSearch_Value and'||chr(10)||
          '      D.ID = O.ID and'||chr(10)||
          '      O.OWNER_OBJECT_ID = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID';
      lOrSqlLst(1) :=
          'select /*+RULE*/ distinct P.ID, :pCurSess, D.ID, :pDescr'||chr(10)||
          'from	fdc_Reg_Document D, fdc_Object_Lst O, fdc_Person P'||chr(10)||
          'where D.Docnumber like :pSearch_Value and'||chr(10)||
          '      D.ID = O.ID and'||chr(10)||
          '      O.OWNER_OBJECT_ID = P.ID';

      Exec_Reg_Search_Step (fdc_search.criteria_Str(pCurrent_Criteria),
                            'По рег. документу');
    end if; -- Поиск по рег. документу

    pPrevSess := pCurSess;
  end if; -- fdc_Search.Search.REG_Conditions
  -----------------------------------
  -- Завершены поиски по регистрационным данным
  -----------------------------------
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------

  ---------------------------------------------------
  -- Поиски по дополнительным условиям
  ---------------------------------------------------
  ---------------------------------------------------
  -- Поиск по пометкам
  ---------------------------------------------------
  if fdc_Search.Criteria_Active(ADD_KIND_ID) then
    pCurSess := fdc_search.new_search_sess;
    lOrSqlStr := null;
    lAndSqlStr := null;
    for i in 1..fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value.count loop
      lLinkedObjID := fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value(i);
      lOrSqlStr := lOrSqlStr || to_char(lLinkedObjID);
      lAndSqlStr := lAndSqlStr||
                    'select /*+FIRST_ROWS*/ O.Owner_Object_ID ID'||chr(10)||
                    'from fdc_Object_Kind K, '||chr(10)||
                    '     fdc_Object_Lst O '||chr(10)||
                    'where K.Kind_ID = '|| to_char(lLinkedObjID) || ' and ' ||chr(10)||
                    '      K.ID = O.ID';
      if i < fdc_Search.Search.Search_Criteria_Lst(ADD_KIND_ID).List_Value.count then
        lOrSqlStr := lOrSqlStr || ',';
        lAndSqlStr := lAndSqlStr || chr(10) || 'intersect' || chr(10);
      end if;
    end loop;
    fdc_Search.Exec_Add_Search_Step(
          pDescr => 'По пометке',
          pSQL_WithPrev_And =>
          'select distinct ID, :pCurSess, ID, :pDescr'||chr(10)||
          'from fdc_Buffer B'||chr(10)||
          'where B.Sess = :pPrevSess and ID in ('||lAndSqlStr||')',
          pSQL_WithPrev_Or =>
          'select distinct O.Owner_Object_ID, :pCurSess, O.Owner_Object_ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Object_Kind K, fdc_Buffer B'||chr(10)||
          'where K.Kind_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.ID = K.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = O.Owner_Object_ID',
          pSQL_WithoutPrev_And =>
          'select ID, :pCurSess, ID, :pDescr from (' || lAndSqlStr || ')',
          pSQL_WithoutPrev_Or =>
          'select distinct O.Owner_Object_ID, :pCurSess, O.Owner_Object_ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Object_Kind K'||chr(10)||
          'where K.Kind_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.ID = K.ID',
          pCheckSearchExit => true,
          pCurSess => pCurSess,
          pPrevSess => pPrevSess,
          pResSess => pResSess);
  end if; -- fdc_Search.Criteria_Active(ADD_KIND_ID)

  ---------------------------------------------------
  -- Поиск по связанным регистрационным документам
  ---------------------------------------------------
  if fdc_Search.Criteria_Active(ADD_REG_DOC_TYPE_ID) then
    if (not fdc_Search.Criteria_Active(ADD_KIND_ID)) or
       not fdc_Search.Search.AddSearchOR then
      pCurSess := fdc_search.new_search_sess;
    end if;
    lOrSqlStr := null;
    lAndSqlStr := null;

    for i in 1..fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value.count loop
      lLinkedObjID := fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value(i);
      lOrSqlStr := lOrSqlStr || to_char(lLinkedObjID);
      lAndSqlStr := lAndSqlStr||
                    'select /*+FIRST_ROWS*/ P.ID'||chr(10)||
                    'from fdc_Object_Lst O, fdc_Person P '||chr(10)||
                    'where O.Object_Type_ID = '|| to_char(lLinkedObjID) || ' and '||
                    'O.Owner_Object_ID = P.ID';
      if i < fdc_Search.Search.Search_Criteria_Lst(ADD_REG_DOC_TYPE_ID).List_Value.count then
        lOrSqlStr := lOrSqlStr || ',';
        lAndSqlStr := lAndSqlStr || chr(10) || 'intersect' || chr(10);
      end if;
    end loop;

    fdc_Search.Exec_Add_Search_Step(
          pDescr => 'По типу связанного документа',
          pSQL_WithPrev_And =>
          'select distinct ID, :pCurSess, ID, :pDescr'||chr(10)||
          'from fdc_Buffer B'||chr(10)||
          'where B.Sess = :pPrevSess and ID in ('||lAndSqlStr||')',
          pSQL_WithPrev_Or =>
          'select distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Person P, fdc_Buffer B'||chr(10)||
          'where O.Object_Type_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.Owner_Object_ID = P.ID and'||chr(10)||
          'B.Sess = :pPrevSess and B.ID = P.ID',
          pSQL_WithoutPrev_And =>
          'select ID, :pCurSess, ID, :pDescr from (' || lAndSqlStr || ')',
          pSQL_WithoutPrev_Or =>
          'select distinct P.ID, :pCurSess, P.ID, :pDescr'||chr(10)||
          'from fdc_Object_Lst O, fdc_Person P'||chr(10)||
          'where O.Object_Type_ID in ('||lOrSqlStr||') and'||chr(10)||
          'O.Owner_Object_ID = P.ID',
          pCheckSearchExit => false,
          pCurSess => pCurSess,
          pPrevSess => pPrevSess,
          pResSess => pResSess);
  end if; -- fdc_Search.Criteria_Active(ADD_REG_DOC_TYPE_ID)

  ---------------------------------------------------
  -- Завершены поиски по дополнительным условиям
  ---------------------------------------------------
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------
  -- Получена результирующая сессия
  if pResSess is null then
    pResSess := pCurSess;
  end if;
  
  -------------------------------------------------------------------------
  -- Если найдено больше чем надо, отволочь в следующую сессию
  -------------------------------------------------------------------------
  select /*+RULE*/ count(distinct ID)
  into pCnt
  from Fdc_Buffer
  where Sess is not null and Sess = pResSess;
  
  -- Если записей больше чем нужно, переносим их в следующую сессию
  if pCnt > fdc_Search.Search.MaxRows + 1 then
    pFinalSess := fdc_Search.New_Search_Sess(false);
    insert into fdc_Buffer(ID,Sess,Mark1,Txt)
    select /*+RULE*/ B.ID, pFinalSess, B.Mark1, B.Txt
    from Fdc_Buffer B
    where Sess = pResSess and
          ID in (select * from 
                  (select distinct ID from fdc_Buffer where sess = pResSess)
                 where rownum <= fdc_Search.Search.MaxRows + 1); 
  else
    pFinalSess := pResSess;  
  end if;
  
  -------------------------------------------------------------------------
  -- Присоединение объяснений к результирующей сессии
  -------------------------------------------------------------------------
  if pPrevSess is not null then
    -- Формирование в fdc_Buffer списка промежуточных сессий, задействованных при поиске
    pCurSess := fdc_Search.New_Search_Sess(false);
    for i in 1..fdc_Search.Search_Sess_Lst.count loop
      if fdc_Search.Search_Sess_Lst(i) <> pResSess then
        insert into fdc_Buffer(Sess, Txt)
        values (pCurSess, fdc_Search.Search_Sess_Lst(i));
      end if;
    end loop;
    -- Обновление кода сессии на субъектах из других сессий
    update Fdc_Buffer
    set Sess = pFinalSess
    where rowid in (
      select B.rowid
      from fdc_Buffer B, 
           fdc_Buffer Fin,
           fdc_Buffer S
      where S.Sess = pCurSess and
            B.SESS = S.Txt and
            B.ID = Fin.Id and
            Fin.Sess = pFinalSess);
    -- Вычистка из буфера промежуточных сессий, задействованных при поиске        
    delete from fdc_buffer
    where Sess in 
      (select Txt from fdc_Buffer where Sess = pCurSess);

  end if; -- pPrevSess is not null

  commit;

  return pFinalSess;
end;
/
