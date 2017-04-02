create or replace function fdc_Object_Type_Add
-- Создание типа объекта
-- Предполагается, что 2 основных типа: 'Object' и 'ObjectType' уже существуют
-- Возвращает идентификатор типа
	(
	pObject_Type_SysName	varchar2,    -- Системное имя типа "тип объекта"('ObjectType', 'EventType') 
	pName			varchar2 := null,        -- Полное наименование создаваемого типа
	pSysName		varchar2,              -- Системное имя создаваемого типа
  pShortName	varchar2,              -- Краткое наименование создаваемого типа (практически нигде не используется, стандартов на него нет)  
	pTableName	varchar2,              -- Наименование таблицы для данных этого типа (если null, берется с родительского типа)  
	pIcon			varchar2,                -- Иконка типа в виде строки (Если null, берется с родительского типа)                  
	pState_Scheme_ID	number,          -- Схема состояний объекта данного типа   
	pParent_Object_Type_ID	number,    -- Родительский тип (всегда not null!)
  pObjectTableInstance number := 1,  -- Хранятся ли экземпляры типа в таблице fdc_object 
                                     -- для всех объектных типов - 1
                                     -- для событий (и в перспективе других необъектных типов) - 0
	pDescript		varchar2 := null       -- Комментарий к типу объекта
	)
return number
is
  pNewID number(15);
  ppTableName varchar2(1500);
  pParentType fdc_Object_Type%rowtype;
  ppIcon varchar2(4000);
  ppState_Scheme_ID	number;
  ppObjectTableInstance number(1);
  pChk number;
begin
  -- Проверка, что pObject_Type_SysName - потомок 'ObjectType'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectType');
  
  -- Создание экземпляра объекта
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, pSysName, pShortName, pDescript);
  
  -- Получение записи родительского типа. Она в любом случае понадобится
  if pParent_Object_Type_ID is not null then
    begin
      select *
      into pParentType
      from fdc_Object_Type T
      where ID = pParent_Object_Type_ID; 
    exception
    	when others then fdc_util.abort('Ошибка получения родительского типа ID='||pParent_Object_Type_ID, 1);
    end;
  end if;  

  -- Определение таблицы типа
  ppTableName := upper(trim(pTableName));
  if ppTableName is not null then
    -- Таблица получена из параметров. Проверяем, не противоречит ли иерархии типов
    -- Ограничения следующие: если таблица уже обслуживает какие либо типы, одним из них должен быть родительский тип
    -- Иначе говоря: если таблица родительского типа не та же самая, что таблица создаваемого типа,
    --               значит эта таблица (создаваемого типа) не используется для обслуживания каких-либо других объектных типов
    if ppTableName <> pParentType.Tablename then
      pChk := 0;
      begin
        select 1
        into pChk
        from fdc_Object_Type T
        where T.Tablename = ppTableName and
              rownum <= 1;
      exception
    	  when NO_DATA_FOUND then null;
      	when others then fdc_util.abort('Ошибка проверки корректности таблицы типа', 1);
      end;
      if pChk > 0 then
        fdc_Util.Abort('Некорректное использование таблицы для типа. Данная таблица используется в другой иерархии.');
      end if;
    end if;
  else
    -- Если таблица не получена из параметров, берем ее из родительского типа
    ppTableName := pParentType.Tablename;
  end if;
  
  -- Определение иконки типа
  ppIcon := nvl(pIcon, pParentType.Icon);
  
  -- Определение флага инстанцирования типа в таблице объектов
  ppObjectTableInstance := nvl(pObjectTableInstance, pParentType.Objecttableinstance);
  
  -- Определение схемы состояний
  if ppObjectTableInstance = 0 then
    if pState_Scheme_ID is not null then
      fdc_Util.Abort('Неинстанцируемый в объектах тип не может иметь схемы состояний!');
    end if;  
  else
    ppState_Scheme_ID := nvl(pState_Scheme_ID, pParentType.State_Scheme_Id);
  end if;
  
  -- Добавление записи в таблицу ObjectType
  insert into fdc_Object_Type(ID,Name, ShortName, SysName, TableName, 
                              Icon, State_Scheme_ID, Parent_Object_Type_ID, ObjectTableInstance)
  values(pNewID,pName, pShortName, pSysName, ppTableName, 
         ppIcon, ppState_Scheme_ID, pParent_Object_Type_ID, ppObjectTableInstance);
  
  -- Копирование иерархии наследования с родительского типа
  insert into fdc_Child_Object_Type(Object_Type_ID,Child_Object_Type_ID)
  (select Object_Type_ID,pNewID
  from	fdc_Child_Object_Type
  where	Child_Object_Type_ID = pParent_Object_Type_ID);
  
  -- Добавление связки сам-к-себе в иерархию наследования
  insert into fdc_Child_Object_Type(Object_Type_ID,Child_Object_Type_ID) values (pNewID,pNewID);
  
  -- Возврат нового ID
  return pNewID;
exception
  when others then
    Fdc_Util.Abort('Не прошло добавление объектного типа '||pName||':', 1);
end fdc_Object_Type_Add;
/
