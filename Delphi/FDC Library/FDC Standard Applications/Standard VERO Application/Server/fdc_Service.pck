create or replace package fdc_Service as
-- В пакете собраны все сервисные возможности, используемые при администрировании системы,
-- но не используемые в штатном режиме работы пользователей
-- Сюда входят процедуры обслуживания схемы,
-- процедуры инициализации данных,
-- а также процедуры регистрации компонентов, объектов схемы и пр.
-- Пакет НЕ ГРАНТУЕТСЯ никому из пользователей

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Регистрация объектов и компонент
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register
-- Регистрация серверной компоненты в системе 
-- (по наименованию процедуры или представления)
-- Работает без commit!!!
procedure Server_Component_Register
	(
	  pSysName varchar2,          -- системное имя компоненты    
    pName    varchar2 := null   -- название компонента, если не задано, то генерим автоматически
	);

-------------------------------------------------------------------------------------------
-- Server_Component_Register_All
-- Регистрация всех незарегичтрированных серверных компонент в системе 
-- регистрируются все получаемые из user_Objects процедуры, функции и представления
-- !!!Работает без commit
procedure Server_Component_Register_All;

-------------------------------------------------------------------------------------------
-- Base_Object_Type_Register
-- Процедура регистрации базовых типов Object, ObjectType
-- Вызывается 1 раз при инициализации схемы из Erwin (Model-level post script Register_Base_Object_Types)
procedure Base_Object_Type_Register;

-------------------------------------------------------------------------------------------
-- Object_Type_Register_By_Table
-- Регистрация объектного типа VERO по заданной таблице
-- Предполагается, что 2 основных типа: 'Object', 'ObjectType' уже существуют 
-- (они регистрируются изначально процедурой fdc_Object_Type_Base_Register)
procedure Object_Type_Register_By_Table
	(
  pTableName varchar2               -- название таблицы в БД
	);

-------------------------------------------------------------------------------------------
-- Additional_Type_Register
-- Регистрация дополнительных объектных типов ядра системы
-- Здесь регистрируются типы, входящие в ядро системы, но не зарегиситрированные из Erwin 
-- (наследники эитх типов на базе тех же таблиц)
-- !!!Работает без commit
procedure Additional_Type_Register;


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры инициализации данных
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Инициализация необходимых для функционирования объектов схемы
-- Стандартных групп, пользователя хозяина приложения
-- !!!Работает без commit
procedure Init_Service_Data;

-------------------------------------------------------------------------------------------
-- Инициализация необходимых для функционирования объектов схемы
-- и регистрация компонент - в одном флаконе
-- Это действительно ПЕРВИЧНАЯ инициализация
-- Порядок формирования схемы таков:
-- 1. Генерация схемы из Erwin (таблицы, индексы, ключи)
-- 2. Создание серверных процедур, функций и представлений
-- 3. Регистрация типов по генерируемым таблицам (post-schema и post_table триггеры в Erwin)
-- 4. Регистрация дополнительных типов (Additional_Type_Register)
-- 5. ЭТА процедура инициализации необходимых данных и метаданных 
-- !!!Работает без commit
procedure Primary_Init;

-------------------------------------------------------------------------------------------
-- Запускается при переносе в новую схему
-- Создание fdc_File, если не удалось импортировать его из-за другого табличного пространства
-- Переопределение необходимых для функционирования объектов
-- recompile
procedure New_Location;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры проверки схемы
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Exist
-- Проверка, что все зарегистрированные таблицы присутствуют в БД
procedure Chk_Tables_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Registered
-- Проверка, что все таблицы, существующие в схеме, зарегистрированы в fdc_Tables
procedure Chk_Tables_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Exist
-- Проверка, что все зарегистрированные колонки присутствуют в БД
procedure Chk_Columns_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Registered
-- Проверка, что все колонки, существующие в схеме, зарегистрированы в fdc_Column
procedure Chk_Columns_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Exist
-- Проверка, что все зарегистрированные системные компоненты присутствуют в БД
procedure Chk_SysComp_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Registered
-- Проверка, что все процедуры, функции и представления 
-- зарегистрированы в системе как серверные объекты
procedure Chk_SysComp_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_Object_Child_Type_Foreigns
-- Проверка, что в БД существуют все не объявленные в Erwin внешние ключи,
-- реализующие наследование типов (таблиц) от таблицы fdc_Object
procedure Chk_Object_Child_Type_Foreigns;

-------------------------------------------------------------------------------------------
-- Chk_Syscomponent_No_Task
-- Проверка системных компонент, не входящих в задачи
procedure Chk_Syscomponent_No_Task;

-------------------------------------------------------------------------------------------
-- All_Metrics
-- Последовательный запуск всех проверок
procedure All_Metrics;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры очистки схемы
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Очистка всех прикладных данных
-- Практически после исполнения данной процедуры получается "чистая" схема,
-- содержащая только необходимые метаданные
procedure Clear_Data;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Универсальные процедуры обслуживания схемы БД
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Recompile
-- Перекомпиляция (валидация) объектов схемы
-- Выдает (через dbms_output) список объектов, которые не удалось валидировать
procedure Recompile
  (
  p_recompile_All boolean := false   -- Признак, перекомпилировать всх или только инвалидные объекты
                                     -- по умолчанию (false) - только инвалидные
  );

-------------------------------------------------------------------------------------------
-- SessionTrace
-- Включить или выключить трассировку сессии на сервере Oracle
procedure SessionTrace
	(
	pSwitchOn boolean := true             -- Включить или отключить трассировку:
                                        -- true - включить, false - отключить
	);

-------------------------------------------------------------------------------------------
-- Drop_All_Synonyms
-- Удаление всех синонимов (может использоваться в процессе инсталляции)
procedure Drop_All_Synonyms;

-------------------------------------------------------------------------------------------
-- Drop_All_Jobs
-- Удаление всех job-ов (может использоваться в процессе инсталляции)
procedure Drop_All_Jobs;

-------------------------------------------------------------------------------------------
-- Analyze_Table
-- Анализировать таблицу вместе с индексами
procedure Analyze_Table
  (
  pTableName varchar2    -- Имя таблицы, которую надо проанализировать
  );

-------------------------------------------------------------------------------------------
-- Analyze_All
-- Анализировать всю схему
procedure Analyze_All;

-------------------------------------------------------------------------------------------
-- Rebuild_All
-- Перестроить все индексы
procedure Rebuild_All;

-------------------------------------------------------------------------------------------
-- Disable_FKeys
-- Отключить все внешние ключи
procedure Disable_FKeys;

-------------------------------------------------------------------------------------------
-- Enable_FKeys
-- Включить все внешние ключи
procedure Enable_FKeys;

-------------------------------------------------------------------------------------------
-- Disable_Triggers
-- Отключить все триггеры
procedure Disable_Triggers;

-------------------------------------------------------------------------------------------
-- Enable_Triggers
-- Отключить все триггеры
procedure Enable_Triggers;

-------------------------------------------------------------------------------------------
-- Set_Object_Type_DelProc
-- Устанавливает процедуру удаления для объектов типа
-- Если системное имя процедуры не задано или null, то пытается
-- сгенерить имя процедуры удаления автоматически, как
-- "<имя таблицы типа>_del"
-- Параметр pDoRaise определяет поднимать ли исключение, если что не так
-- Если не равно 0, то поднимать. По умолчанию не поднимать.
procedure Set_Object_Type_DelProc
    (
      pTypeID number,
      pProcSysName varchar2 := null,
      pDoRaise number := 0
    );

end fdc_Service;
/
create or replace package body fdc_Service as

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Регистрация объектов и компонент
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register
-- Регистрация серверной компоненты в системе 
-- (по наименованию процедуры или представления)
-- Работает без commit!!!
procedure Server_Component_Register
	(
	  pSysName varchar2,          -- системное имя компоненты    
    pName    varchar2 := null   -- название компонента, если не задано, то генерим автоматически
	)
is
  pProcType	varchar2(30);
  pObject_Type_ID	number(15) := null;
  pTypeName	varchar2(1500);
  pRootType_ID	number(15);
  pActStr		varchar2(4000);
  pSrcType		varchar2(1500);
  pUpperSysName	varchar2(1500);
  pCompName		varchar2(1500);
  pNewID		number;
  pTypeSysName	varchar2(1500) := null;
  pOldName	varchar2(1500) := null;
begin
  -- Проверяем правильность имени компоненты
  if upper(substr(trim(pSysName), 1, 4)) <> 'FDC_' then
     Fdc_Util.Abort('Для регистрации в VERO системная компонента должна иметь префикс <fdc_>');
  end if;

  -- Определяем тип системной компоненты по User_Objects
  begin
    select Object_Type
      into pProcType
      from User_Objects
     where Object_Name = upper(pSysName) and
           Object_Type in ('VIEW', 'PROCEDURE','FUNCTION', 'PACKAGE');
  exception 
    when NO_DATA_FOUND then fdc_util.Abort('Не найдена системная компонента '||pSysName||' в User_Objects');
  	when others then fdc_util.Abort('Ошибка получения типа системной компонеты '||pSysName, 1);
  end;

  -- Определяем объектый тип системной компоненты в зависимости от ее ораклового типа
  if pProcType = 'VIEW' then
	   pTypeSysName := 'View';
  elsif pProcType in ('PROCEDURE','FUNCTION','PACKAGE') then
	   pTypeSysName := 'Procedure';
  else
     fdc_util.Abort('Не определен тип системной компонеты в VERO '||pSysName);        
  end if;
  
  -- Определение не была ли системная компонента уже зарегестрирована
  begin
    select O.Name
      into pOldName
      from fdc_Object T,
           fdc_Object O
     where T.SysName = pTypeSysName and
	         (T.SysName is not null) and
	         O.Object_Type_ID = T.ID and
	         (O.SysName is not null) and
	         upper(O.SysName) = upper(pSysName);
  exception 
    when NO_DATA_FOUND then null;
    when others then fdc_util.Abort('Ошибка при поиске системной компонеты '||pSysName||' в VERO', 1);
  end;

  -- Если уже зарегестрирована, то выходим
  if (pOldName is not null) then
     return;
  end if;

  -- Пытаемся определить идентификатор корневого типа 'Object'
  -- Если не нашли, то поднимаем исключение
  begin
    pRootType_ID := fdc_Object_Get_BySysName('ObjectType','Object');
  exception  
    when others then
	    fdc_util.Abort('Не найден корневой тип Object', 1);
  end;

  -- Отрезаем первые 4 символа и убираем подчеркивания   
  pSrcType := upper(replace(trim(substr(pSysName,5,1500)),'_',''));

  -- Теперь пытаемся определить объектный тип по имени системной компоненты
  begin
    select SS.ID, SS.Name, SS.SysName
      into pObject_Type_ID, pTypeName, pUpperSysName
      from (select T.ID, T.Name, upper(T.SysName) as SysName
              from fdc_Object_Type T
             where pSrcType like (trim(upper(T.SysName)) || '%')
             order by length(T.SysName) desc) SS
     where rownum <= 1;
  exception 
    when NO_DATA_FOUND then null;
    when others then fdc_util.Abort('Ошибка при поиске подходящего объектного типа для компоненты '||pSysName, 1);
  end;
   
  pCompName := pName;

  -- Если подходящий объектный тип не нашли, то в качестве базового берем тип 'Object',
  if (pObject_Type_ID is null) then
     pObject_Type_ID := pRootType_ID; 
      
     -- Если название компоненты не было указано при вызове, то в качестве названия берем его системное имя
     if (pCompName is null) then 
        pCompName := pSysName;
     end if;   
   else   
     -- Если название компоненты не было указано при вызове, то в генерим его автоматически
     if (pCompName is null) then 
        -- Вычленяем системное имя типа из pSrcType
	      pActStr := trim(substr(pSrcType, length(pUpperSysName) + 1, 1500));
         
        -- Теперь в зависимости от суффикса генерим имя
	      if InStr(upper(pActStr),'LST') = 1 then 
           pCompName := 'Список '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'ADD') = 1 then 
           pCompName := 'Добавить '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'UPD') = 1 then 
           pCompName := 'Изменить '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'DEL') = 1 then 
           pCompName := 'Удалить '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'GET') = 1 then 
           pCompName := 'Взять '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'CLEAR') = 1 then 
           pCompName := 'Очистить '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));
        elsif InStr(upper(pActStr),'CHECK') = 1 then 
           pCompName := 'Проверить '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));
        elsif InStr(upper(pActStr),'REGISTER') = 1 then 
           pCompName := 'Зарегистрировать '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));   
        else
           pCompName := pTypeName||' '||pActStr;   
        end if;
     end if;   
  end if;      
   
  -- Регистрируем компоненту в VERO
  if pTypeSysName = 'View' then
	   pNewID := fdc_View_Add(pTypeSysName, pCompName, pObject_Type_ID, pSysName);
  elsif pTypeSysName = 'Procedure' then   
     pNewID := fdc_Procedure_Add(pTypeSysName, pCompName, pObject_Type_ID, pSysName);
  end if;

  -- Выводим сообщение о регистрации
  dbms_output.put_line(pSysName||' зарегистрирована как '||pCompName);
end Server_Component_Register;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register_All
-- Регистрация всех незарегистрированных серверных компонент в системе 
-- регистрируются все получаемые из user_Objects процедуры, функции и представления
-- !!!Работает без commit
procedure Server_Component_Register_All is
begin
  for rec in (
    select * 
    from user_Objects 
    where object_Name like ('FDC%') and
          object_Type in ('PROCEDURE', 'FUNCTION', 'VIEW')) loop
    Server_Component_Register(rec.Object_Name);        
  end loop;        
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Base_Object_Type_Register
-- Процедура регистрации базовых типов Object, ObjectType
-- Вызывается 1 раз при инициализации схемы из Erwin (Model-level post script Register_Base_Object_Types)
procedure Base_Object_Type_Register
is
  pNewID_Object number(15);
  pNewID_Object_Type number(15);
  pObjectIcon varchar2(4000);
  pObjectTypeIcon varchar2(4000);
begin
  -- Назначение иконок для типов
  pObjectIcon := 
          '424D3603000000000000360000002800000010000000100000000100180000000000000300000000'||
          '0000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2EAEDDAE5E9'||
          'FF00FFFF00FFE5ECED9FC6A53A8C3C187B1997C19CFF00FFFF00FFFF00FFFF00FFFF00FFD4E3EA75'||
          'AFCC1577A50976A976AED487C48B1F8820007E00008700078F0C006E0068A86BE4EBECFF00FFFF00'||
          'FF83BDD6087BAE0082B50091C30D84B30064AC008110008F00019701049E0819AC27007200006E00'||
          '67A26AFF00FFFF00FF2C9AC1009BCE00A0D400AADD1B90BA0065AE0594170CA81512AB2618B13230'||
          'C752007500007600418F43FF00FFFF00FF22A0CE00AFE300B3E609C3F4249BC2006BB2129C3720BB'||
          '3D25BE4A28C25644DE75007700007B00308932FF00FFFF00FF18AADA00C2F800C9FD0DE5FF29A0C7'||
          '0070B614A24F32DB6C3FDB7652EB886AFFA309930C007B00208421FF00FFFF00FF0EC2E501F9FF27'||
          'FFFF36FFFF29E2FF007ABA476A2B8195425FFF9855FF9251F07E53EE7D26B93A128012FF00FFFF00'||
          'FF31C6DA12DCFD00D6FF3D979C9B591CCB4600CC5100BA4100A827007672232CC5431BB52E42BE4C'||
          '88C88EFF00FFFF00FFE5ECEEB1D7E660BCE2C36607DC6800D56D00D97200BE6118A94000AA3300A3'||
          '3F17DEE9E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3D2C8DF6F00E17900E07A00E67F00CB70'||
          '24AD4600A94200B7450FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1D1C3E78000EC8600'||
          'ED8700F38B00D47F30B24B00AE4800B44505E6ECEEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2'||
          'CFC0F58C00FD9300FD9400FF9B00DE8D3BB84D00B44E00AB4300E3E4E6FF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFE3CFBEFFB654FFC776FFCA86FFCF95F6BB7FD47F2EBF5C08B34A00E2DEDCFF00FF'||
          'FF00FFFF00FFFF00FFFF00FFFF00FFE6EAEADCB28BDBA776D8965BD2853DCF803BCE8546CE8E5CD0'||
          '956FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF';  

  
/*          '424D360500000000000036040000280000001000000010000000010008000000000000010000130B'||
          '0000130B00000001000000010000004A0000CE630000CE6B0000E76B00007B390800007B0800009C'||
          '080008731000F794100042C673003131A5003131C6003131E700FF00FF003139FF006363FF009C9C'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0D'||
          '0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0B0B0A0A0D0D0D0D0D0D0D0D0D0D0D0E0E0E0C'||
          '0C0A0D0D0D0D0D0D0D0D0D0E0E0E0E0E0C0C0A0D0D0D0D0D0D0D0D0E0F0E0E0E0E0C0A0D0D0D0204'||
          '0404040F0F0E0E0E0E0E0A0D0D0D02080101010F100F0E0E0E0E0A0000000D02080303030F100F0E'||
          '0E0B050505000D0D02080301040F0E0E0E06060605000D0D0D0208040D0709060606060605000D0D'||
          '0D0D020D0D0709060606060605000D0D0D0D0D0D0D0709060606060605000D0D0D0D0D0D0D070906'||
          '0606060605000D0D0D0D0D0D0D0709090909090909000D0D0D0D0D0D0D0707070707070707070D0D'||
          '0D0D0D0D0D0D0D0D0D0D0D0D0D0D'; */
  pObjectTypeIcon := 
          '424D3603000000000000360000002800000010000000100000000100180000000000000300000000'||
          '0000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5E9EAE2E1E1'||
          'FF00FFFF00FFE6EBEDD3B8A5B0673CA94E19D0AD9CFF00FFFF00FFFF00FFFF00FFFF00FFE2DEDCC8'||
          '9379A44916A94509C7927AD9AC8BBA6220B24C00BB5400BD5E0DA03B00C48B6BE6EAECFF00FFFF00'||
          'FFD2A587AE4A08B54F00C35E00B3520D983100B44F00C35D00CA6400D36B00D47A1BA63F00A13C00'||
          'BB876AFF00FFFF00FFC06F2DCE6800D46D00DD7800BA5E1B9B3200BB5F00DC7500DE7800E57E00EB'||
          '942DA94200A94200B16A43FF00FFFF00FFCD7623E37C00E68000F49005C26823A13800B86500F289'||
          '00F28B00FA8F00FDAB3AAD4400AE4800B06232FF00FFFF00FFD97C19F88F00FD9600FFB237C76D24'||
          'A53D00B36700FFA608FFA823FFB856FFD298C1600FB14800B15821FF00FFFF00FFE49132FFC676FF'||
          'CD97FFCB84FBA9419D41008A4814D17D3AFECD9DFFCC99F6BD81F7BB7ED6863AAF5112FF00FFFF00'||
          'FFD8A45DFCAB32FFA002E07600BC5500B54D00C05700AC4501982E00B85E23E19143D9812EE0924C'||
          'DCAF8EFF00FFFF00FFE6EBEDDECBB7D69B63CB6400D06A00D46E00D97200BE6118A740009E36009F'||
          '4017E6E6E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0D3C8D87200E07A00E07A00E67F00CB70'||
          '24AD4600A84200B0460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1D1C3E78000EC8600'||
          'ED8700F38B00D47F30B24B00AE4800B44505E6ECEEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2'||
          'CFC0F58C00FD9300FD9400FF9B00DE8D3BB84D00B44E00AB4300E3E4E6FF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFE3CFBEFFB654FFC776FFCA86FFCF95F6BB7FD47F2EBF5C08B34A00E2DEDCFF00FF'||
          'FF00FFFF00FFFF00FFFF00FFFF00FFE6EAEADCB28BDBA776D8965BD2853DCF803BCE8546CE8E5CD0'||
          '956FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00'||
          'FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF';
   
  
/*          '424D360500000000000036040000280000001000000010000000010008000000000000010000130B'||
          '0000130B00000000000000000000004A0000CE630000CE6B0000E76B00007B390800007B0800009C'||
          '080008731000F794100042C673003131A5003131C6003131E700FF00FF003139FF006363FF009C9C'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF'||
          'FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0D'||
          '0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0B0B0A0A0D0D0D0D0D0D0D0D0D0D0D0E0E0E0C'||
          '0C0A0D0D0D0D0D0D0D0D0D0E0E0E0D0D0C0C0A0D0D0D0D0D0D0D0D0E0F0D0D0D0D0C0A0D0D0D0204'||
          '0404040F0F0D0D0D0D0E0A0D0D0D02080D0D0D0F100F0D0D0E0E0A0000000D02080D0D0D0F100F0E'||
          '0E0B050505000D0D02080D01040F0E0E0E0D0D0D05000D0D0D0208040D07090D0D0D0D0D05000D0D'||
          '0D0D020D0D07090D0D0D0D0D05000D0D0D0D0D0D0D07090D0D0D0D0D05000D0D0D0D0D0D0D07090D'||
          '0D0D0D0D05000D0D0D0D0D0D0D0709090909090909000D0D0D0D0D0D0D0707070707070707070D0D'||
          '0D0D0D0D0D0D0D0D0D0D0D0D0D0D';  */

  -- Проверка того, что Object, ObjectType еще не зарегистрированы
  begin
    select ID
    into pNewID_Object
    from fdc_Object
    where sysname in ('Object', 'ObjectType') and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('Ошибка проверки регистрации базовых типов', 1);
  end;
  
  -- Если базовые типы уже зарегистрированы - отваливаемся с ошибкой
  if pNewID_Object is not null then
    fdc_util.Abort('Базовые типы уже зарегистрированы в системе!');
  end if;
          
  -- Удаление внешнего ключа с fdc_Object_Type на fdc_Object, если он есть  
  begin        
    execute immediate 'alter table fdc_Object_Type drop constraint Object_Type_ID';
  exception
    when others then
      if sqlcode = -2443 then null;
      else raise;
      end if;
  end;  
  
  -- Получение идентификаторов для Object иObjectType
  pNewID_Object := Fdc_Object_Get_Newkey;
  pNewID_Object_Type := Fdc_Object_Get_Newkey;
  
  -- Создание записей в fdc_Object_Type
  insert into fdc_Object_Type (Id, Name, Shortname, Sysname, Tablename, Icon, State_Scheme_Id, 
                               Parent_Object_Type_Id, Del_Procedure_Id, Objecttableinstance)
  values                       (pNewID_Object, 'Объект', 'Объект', 'Object', 'FDC_OBJECT', pObjectIcon, null,
                                null, null, 1);
  insert into fdc_Object_Type (Id, Name, Shortname, Sysname, Tablename, Icon, State_Scheme_Id, 
                               Parent_Object_Type_Id, Del_Procedure_Id, Objecttableinstance)
  values                       (pNewID_Object_Type, 'Тип объекта', 'Тип объекта', 'ObjectType', 'FDC_OBJECT_TYPE', pObjectTypeIcon, null,
                                pNewID_Object, null, 1);
  
  -- Создание записей с fdc_Object
  insert into fdc_Object (Id, Object_Type_Id, State_Id, Name, Shortname, Sysname, 
                          Descript, Accesslevel, Owner_Object_Id)
  values                 (pNewID_Object, pNewID_Object_Type, null, 'Объект', 'Объект', 'Object',
                          'Любой прикладной объект системы. Все объекты системы наследуются от Объекта.', 1, null);                        
  insert into fdc_Object (Id, Object_Type_Id, State_Id, Name, Shortname, Sysname, 
                          Descript, Accesslevel, Owner_Object_Id)
  values                 (pNewID_Object_Type, pNewID_Object_Type, null, 'Тип объекта', 'Тип объекта', 'ObjectType', 
                          'Характеризует любой прикадной объект системы, допустимые действия с ним, схему состояний и т.д.', 1, null);                        
                          
  -- Создание записей в fdc_Child_Object_Type
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object, pNewID_Object);                 
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object, pNewID_Object_Type);                 
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object_Type, pNewID_Object_Type);                 
                            
  -- Создание внешнего ключа с fdc_Object_Type на fdc_Object
  execute immediate 'alter table fdc_Object_Type add constraint Object_Type_ID '||
                    'foreign key (ID) references fdc_Object on delete cascade';
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Object_Type_Register_By_Table
-- Регистрация объектного типа VERO по заданной таблице
-- Предполагается, что 2 основных типа: 'Object', 'ObjectType' уже существуют 
-- (они регистрируются изначально процедурой fdc_Object_Type_Base_Register)
procedure Object_Type_Register_By_Table
	(
  pTableName varchar2               -- название таблицы в БД
	)
is
  ppTableName varchar2(1500);
  pName			varchar2(1500);
  pSysName		varchar2(1500);
  pDescript		varchar2(1500);
  pParentObjectTypeID	number(15);
  pParentTableName	varchar2(1500);
  pObjectTypeID		number(15);
  pChk			number := 0;
  pConstraint 	varchar2(1500);
  pSQL	varchar2(1500);
begin
  -- Проверка именования таблицы
  if upper(substr(trim(pTableName), 1, 4)) <> 'FDC_' then
    Fdc_Util.Abort('Для регистрации объектного типа таблица должна иметь префикс <fdc_>');
  end if;

  -- Получение SysName типа: убираем префикс 'fdc_' и символы подчеркивания в названии таблицы.
  pSysName := replace(substr(trim(pTableName),5,30),'_','');
  
  -- Проверка, что регистрируется не Object и не ObjectType
  if upper(pSysName) in ('OBJECT', 'OBJECTTYPE') then
    Fdc_Util.Abort('Процедура fdc_Object_Type_Register не предназначена для регистрации типа '||pName||' ('||pSysName||')');
  end if;

  -- Проверяем не имеется ли уже такой объектный тип. Имеется - ничего не делаем.
  begin
    select	1
    into	pChk
    from	fdc_Object_Type_Lst
    where	upper(SysName) = upper(pSysName);
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('Ошибка поиска по системному имени типа '||pSysName, 1);
  end;
  -- Имеется - ничего не делаем.
  if pChk > 0 then 
     return;
  end if;
  
  -- Нормализация имени таблицы
  ppTableName := upper(Trim(pTableName));
  
  --Получаем логическое имя таблицы и ее описание
  begin
    select Name, Descript
    into pName, pDescript
    from fdc_Table
    where TableName = ppTableName;
  exception when others then 
     fdc_Util.Abort('Ошибка определения базовой таблицы класса '||ppTableName, 1);
  end;

  -- Получение родительской таблицы 
  -- эта та, на которую ссылается первичный ключ регистрируемой таблицы, 
  -- или непосредственно fdc_Object
  pParentTableName := fdc_Table_Get_BaseTableName(ppTableName);
  
  -- Имеем: pParentTableName
  --     либо NULL (для таблицы fdc_Object), 
  --     либо имя непосредственного родителя, 
  --     либо 'FDC_OBJECT'
  if pParentTableName is null then
    Fdc_Util.Abort('Процедура fdc_Object_Type_Register не предназначена для регистрации типа по таблице fdc_Object');   
  end if;  

  -- Определение родительского типа
  begin
    -- Хотим отрастить наш объектный тип от самого верхнего типа в объектной иерархии
    -- (т е задать его как родительский для регистрируемого типа),
    -- для которого таблицей является только что найденная нами родительская таблица pParentTableName 
	  select	ID
    into	pParentObjectTypeID
    from	fdc_Object_Type T
    where TableName = pParentTableName and
          not exists (
           select * 
           from fdc_Object_Type
           where	ID = T.Parent_Object_Type_ID and
                  TableName = pParentTableName);
  exception
    when NO_DATA_FOUND then 
      Fdc_Util.Abort('Не найден родительский тип для таблицы '||ppTableName||' - parent table '||pParentTableName);
  	when others then 
      fdc_util.abort('Ошибка определения родительского типа для таблицы '||ppTableName||' - parent table '||pParentTableName, 1);
  end;

  -- Дальше - по разному, в зависимости от того, чей тип: объекта или события
  if pSysName = 'Event' or fdc_Object_Type_Is_Subtype(Fdc_Object_Get_Sysname(pParentObjectTypeID), 'Event', 0) = 1 then
    -- Для событий - только регистрация типа
    pObjectTypeID := fdc_Event_Type_Add('EventType', pName, pSysName, pName, ppTableName, 
                                        null, pParentObjectTypeID, pDescript);
                          
    -- Пытаемся определить процедуру удаления объектов этого типа                                    
    Set_Object_Type_DelProc(pObjectTypeID);                                    
  else
    -- Для объектов - регистрация типа и генерация внешнего ключа на fdc_Object 
    -- Создание экземпляра типа
    pObjectTypeID := fdc_Object_Type_Add('ObjectType', pName, pSysName, pName, ppTableName,
                                          null, null, pParentObjectTypeID, 1, pDescript);
                                          
    -- Пытаемся определить процедуру удаления объектов этого типа                                    
    Set_Object_Type_DelProc(pObjectTypeID);                                       
                                          
    -- Если родительская таблица - fdc_Object, то нужно проложить внешний ключ в БД и в fdc_Column
    if (pParentTableName = 'FDC_OBJECT') then
      -- Сначала - удалить foreign по полю ID, если он есть (на всякий случай)
      for Cons in (
        select 	C.*
      	from	User_Constraints C,
      		    User_Cons_Columns CC
      	where	C.Table_Name = ppTableName and
      		    C.Constraint_Type = 'R' and
      		    CC.Constraint_Name = C.Constraint_Name and
      		    CC.Column_Name = 'ID' and
              C.R_Constraint_Name = 'FDC_OBJECT_PK')
      loop
      	execute immediate 'alter table '||ppTableName||' drop constraint '||Cons.Constraint_Name;
      end loop;
      
      -- А теперь - создание внешнего ключа
      pConstraint := substr(ppTableName,5,27)||'_ID';
      pSQL := 'alter table '||ppTableName||' add constraint '||pConstraint||
              ' foreign key (ID) references fdc_Object on delete cascade';
      begin
        execute immediate pSQL;
      exception when others then fdc_Util.Abort('Ошибка создания внешнего ключа', 1);
      end;
      -- И внесение информации в таблицу fdc_Column
      fdc_Column_Upd_FK(ppTableName, 'ID', 'FDC_OBJECT', 'ID', pConstraint);
    end if; -- pParentTableName = 'FDC_OBJECT'
  end if;   -- pSysName = 'Event' or fdc_Object_Type_Is_Subtype(pSysName, 'Event', 0) = 1

end Object_Type_Register_By_Table;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Additional_Type_Register
-- Регистрация дополнительных объектных типов ядра системы
-- Здесь регистрируются типы, входящие в ядро системы, но не зарегиситрированные из Erwin 
-- (наследники эитх типов на базе тех же таблиц)
-- !!!Работает без commit
procedure Additional_Type_Register is
  pNewID number;
begin
  -- События
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Событие создания объекта',
                                 psysname => 'EventAdd',
                                 pshortname => 'Событие создания объекта',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Стандартный тип событий для логирования создания объектов');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID); 
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Событие удаления объекта',
                                 psysname => 'EventDel',
                                 pshortname => 'Событие удаления объекта',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Стандартный тип событий для логирования удаления объектов');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Событие изменения объекта',
                                 psysname => 'EventUpd',
                                 pshortname => 'Событие изменения объекта',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Стандартный тип событий для логирования изменения объектов');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Событие слияния объектов',
                                 psysname => 'EventMerge',
                                 pshortname => 'Событие слияния объектов',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Стандартный тип событий для логирования слияния объектов');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Событие изменения прав доступа',
                                 psysname => 'EventAccessUpd',
                                 pshortname => 'Изменение прав доступа',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Стандартный тип событий для логирования изменения прав доступа');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                               
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => 'Проведена генерация уведомлений по подпискам',
                                 psysname => 'EventGenNotifications',
                                 pshortname => 'Генерация уведомлений по подпискам',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => 'Событие генерации уведомлений по подпискам. Создается, когда завершено сканирование новых событий с проверкой подписок и генерацией уведомлений.');
                                 
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                               

  
  -- Справочники                              
  pNewID := fdc_object_type_add('ObjectType', 'Аббревиатура в названиях юридических лиц',
                                'Dict.LegalNameAcro', 'Аббревиатура в названиях юридических лиц',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                'Аббревиатура в названиях юридических лиц, например, OOO, ГУП и прочее');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Тип действия пользователя при доступе к объекту',
                                'Dict.AccessAction', 'Тип действия пользователя',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                'Тип логируемого действия пользователя');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Организационно-правовая форма юридического лица',
                                'Dict.OKOPF', 'Организационно-правовая форма',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                'Организационно-правовая форма юридического лица, закодированная по справочнику ОКОПФ Госкомстата');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Страна мира по ОКСМ',
                                'Dict.OKSM', 'Страна',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                'Страна мира по справочнику ОКСМ Госкомстата');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);
                                

  -- Значения                              
  pNewID := fdc_object_type_add('ObjectType', 'Числовое значение',
                                'ValueNumber', 'Число',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                'Наследник типа "Значение" для числовых значений');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Значение Да / Нет',
                                'ValueBool', 'Да / Нет',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                'Наследник типа "Значение" для значений логического типа');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Текстовое значение',
                                'ValueString', 'Текст',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                'Наследник типа "Значение" для строковых значений');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Значение даты и времени',
                                'ValueDateTime', 'Дата и время',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                'Наследник типа "Значение" для значений даты и времени');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', 'Значение ссылки',
                                'ValueRef', 'Ссылка',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                'Наследник типа "Значение" для ссылок один-ко-многим. Владелец экземпляра значения ссылается на объект с идентификатором ref_object_ID');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', 'Значение ссылки на файл',
                                'ValueRefFile', 'Ссылка на файл',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('ValueRef'), 1,
                                'Наследник типа "Значение ссылки", где в качестве связанного объекта выступает объект типа Файл');
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID); 
                                

  -- Контакты                              
  pNewID := fdc_object_type_add('ObjectType', 'Контакт',
                                'Contact', 'Контакт',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Object'), 1,
                                'Контактная информация для чего-либо (или кого-либо)');

  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                 
                                
  pNewID := fdc_object_type_add('ObjectType', 'Телефон',
                                'Phone', 'Тел',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                'Наследник типа "Контакт" для номеров телефонов');  
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', 'Телефакс',
                                'Fax', 'Факс',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                'Наследник типа "Контакт" для номеров факсов');             
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', 'Адрес электронной почты',
                                'Email', 'Email',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                'Наследник типа "Контакт" для адресов электронной почты');    
                                
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID); 
                                

  -- Сессии
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => 'Сессия диспетчера',
                                  psysname => 'SessionDispatch',
                                  pshortname => 'Сессия диспетчера',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => 'Процесс диспетчера. Определяет, какие процессы надо запустить. Сам запускается по регламенту в зависимости от системной константы Dispatch.DispatchInterval');                              
                                  
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID); 
                                  
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => 'Генерация уведомлений по подпискам',
                                  psysname => 'SessionGenNotifications',
                                  pshortname => 'Генерация уведомлений по подпискам',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => 'Сессия генерации уведомлений по подпискам. Просматривает новые события, проверяет их на предмет подходящих подписок и генерирует уведомления адресатам.');                              
                                  
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                 
                                  
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => 'Установка флага активности подписок',
                                  psysname => 'SessionSubscriptionCheck',
                                  pshortname => 'Актуализация подписок',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => 'Установка флага актуальности подписок в зависимости от их момента начала и окончания');                              
                                  
  -- Пытаемся определить процедуру удаления объектов этого типа                                    
  Set_Object_Type_DelProc(pNewID);                                 
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры инициализации данных
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Инициализация необходимых для функционирования объектов схемы
-- Стандартных групп, пользователя хозяина приложения
-- !!!Работает без commit
procedure Init_Service_Data is
  pAdminTask_ID number;
  pAdminData_ID number;
  pOwner_ID number;
  pNewID number;
begin
  -------------------------------------------------
  -- Стандартные группы пользователей
  pAdminTask_ID := Fdc_User_Group_Add('UserGroup', 
                     'Администратор прав пользователей', 
                     'AdminTask', 
                     'Администратор прав', 
                     'Пользователи, включенные в данную группу, имеют привилегии по управлению компонентами, задачами, списками пользователей и групп пользователей, а также по выдаче прав пользователям на объекты БД штатными средствами системы');
  pAdminData_ID := Fdc_User_Group_Add('UserGroup', 
                     'Администратор данных', 
                     'AdminData', 
                     'Администратор данных', 
                     'Пользователи, включенные в данную группу, имеют неограниченный доступ ко всем прикладным объектам системы и полномочия на управление правами доступа на все прикладные объекты');

  -------------------------------------------------
  -- Владелец схемы это предопределенный пользователь (Хозяин приложения)                    
  -- SysName для Хозяина приложения нужен исключительно для обработки перенесения приложения в новую схему                       
  pOwner_ID := fdc_User_Add('User', fdc_Util.Schema, 'Хозяин приложения', '', '', 'Хозяин приложения', 
                         'Условный пользователь - владелец схемы приложения, обладает неограниченными правами в системе');                   
  Fdc_Object_Upd_Sysname(pOwner_ID, 'SchemaOwner');                      
  Fdc_User_In_Group_Add(pOwner_ID, pAdminTask_ID);                       
  Fdc_User_In_Group_Add(pOwner_ID, pAdminData_ID);     
  
  -------------------------------------------------
  -- Системные константы
  pNewID := fdc_ValueString_Add ('ValueString', 'Версия системы',
                            'Version', 1, null,
                            '1.1.1.1', 'Версия системы',
                            'Текущая версия серверной части системы. Состоит из 4 цифр разделенных точками)');                
  pNewID := fdc_ValueBool_Add ('ValueBool', 'Система находится в процессе смены версии',
                           'VersionMigrate', 1, null,
                            0, 'Флаг смены версии системы',
                           'Признак того, что система находится в процессе смены версии (patch, update): 0 - не находится, 1 - идет смена версии');                
  pNewID := fdc_valuebool_add('ValueBool', 'Диспетчер включен',
                           'Dispatch.DispatchIsActive', 1, null,
                            0, 'Диспетчер включен', 
                           '1: Диспетчер активизируется с заданным интервалом времени, есть разрешение на запуск автоматических процессов; 0: диспетчер даже не пробует стартовать');
  pNewID := fdc_valuenumber_add('ValueNumber', 'Интервал активизации диспетчера',
                           'Dispatch.DispatchInterval', 1, null,
                            1, 'Интервал активизации диспетчера',
                           'Интервал активизации диспетчера. Задается в минутах');                                  
  pNewID := fdc_valuenumber_add('ValueNumber', 'Максимальное количество ошибок при попытке запуска сессии',
                           'Dispatch.MaxErrorsStartingSession', 1, null,
                           10, 'Максимальное количество ошибок запуска',
                           'Максимальное количество ошибок при запуске сессии, после которых диспетчер прекращает попытки запустить сессию.'); 
  pNewID := fdc_valuenumber_add('ValueNumber', 'Максимальное количество параллельно работающих сессий',
                           'Dispatch.MaxSessions', 1, null,
                           6, 'Максимальное количество параллельно работающих сессий',
                           'Максимальное количество сессий, запускаемых диспетчером одновременно.');                                  
  pNewID := fdc_valuenumber_add('ValueNumber', 'Интервал установки флага активности подписок',
                           'Dispatch.SubscriptionCheckInterval', 1, null,
                           120, 'Интервал установки флага активности подписок',
                           'Интервал запуска сессии установки флага активности подписок. Задается в минутах');  
  pNewID := fdc_valuenumber_add('ValueNumber', 'Минимальный интервал генерации уведомлений по подпискам',
                           'Dispatch.GenNotificationsMinInterval', 1, null,
                           30, 'Минимальный интервал генерации уведомлений по подпискам',
                           'Минимальный интервал генерации уведомлений по подпискам. Задается в минутах');                                  
                                    
  -------------------------------------------------
  -- Прозиции системного вправочника                                  
  pNewID := fdc_dict_add('Dict.AccessAction', null, 'Открытие карточки', 'Открытие карточки', null, null, 'Логируемое событие открытия карточки в клиентском приложении');                         
  Fdc_Object_Upd_Sysname(pNewID, 'Dict_AccessAction_Open');
  
  -------------------------------------------------
  -- Схема состояний для сессии
  declare
  pScheme_ID number;
  SessionStateCreated_ID number;
  SessionStateProgress_ID number;
  SessionStateSuccess_ID number;
  SessionStateError_ID number;
  SessionStateHung_ID number;
  pTransit_ID number;
  begin
    pScheme_ID := fdc_state_scheme_add(pobject_type_sysname => 'StateScheme',
                                     pname => 'Состояния процесса обработки данных',
                                     pshortname => null,
                                     pdescript => 'Схема состояний для процесса обработки данных');
    SessionStateCreated_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => 'Создан диспетчером и ожидает начала работы',
                                                        psysname => 'SessionStateCreated',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateProgress_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => 'В процессе работы',
                                                        psysname => 'SessionStateProgress',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 1,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateSuccess_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => 'Успешно завершен',
                                                        psysname => 'SessionStateSuccess',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateError_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => 'Завершен по ошибке',
                                                        psysname => 'SessionStateError',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 0,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateHung_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => 'Не отвечает, принудительно завершен',
                                                        psysname => 'SessionStateHung',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 0,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null); 
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Инициализировать сессию',
                                      psysname => 'SessionTransitCreate',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => null,
                                      pdst_state_id => SessionStateCreated_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Начать работу сессии',
                                      psysname => 'SessionTransitStart',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateCreated_ID,
                                      pdst_state_id => SessionStateProgress_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Завершить обработку',
                                      psysname => 'SessionTransitFinish',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateSuccess_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Завершить обработку по ошибке',
                                      psysname => 'SessionTransitError',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateError_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Пометить как "зависшую"',
                                      psysname => 'SessionTransitCheckHung',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateHung_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Пометить как "зависшую"',
                                      psysname => 'SessionTransitCheckHung',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateCreated_ID,
                                      pdst_state_id => SessionStateHung_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => 'Завершить обработку по ошибке',
                                      psysname => 'SessionTransitError',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateCreated_ID,
                                      pdst_state_id => SessionStateError_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);    
    for rec in (
      select COT.CHILD_OBJECT_TYPE_ID
      from fdc_Object_Type OT, fdc_Child_Object_Type COT
      where OT.SYSNAME = 'Session' and
            COT.OBJECT_TYPE_ID = OT.ID) loop
      update fdc_Object_Type OT
      set OT.STATE_SCHEME_ID = pScheme_ID
      where ID = rec.CHILD_OBJECT_TYPE_ID;
    end loop;        
  end;
  -------------------------------------------------
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Инициализация необходимых для функционирования объектов схемы
-- и регистрация компонент - в одном флаконе
-- Это действительно ПЕРВИЧНАЯ инициализация
-- Порядок формирования схемы таков:
-- 1. Генерация схемы из Erwin (таблицы, индексы, ключи)
-- 2. Создание серверных процедур, функций и представлений
-- 3. Регистрация типов по генерируемым таблицам (post-schema и post_table триггеры в Erwin)
-- 4. Регистрация дополнительных типов (Additional_Type_Register)
-- 5. ЭТА процедура инициализации необходимых данных и метаданных 
-- !!!Работает без commit
procedure Primary_Init is
begin
  Init_Service_Data;
  Server_Component_Register_All;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Запускается при переносе в новую схему
-- Создание fdc_File, если не удалось импортировать его из-за другого табличного пространства
-- Переопределение необходимых для функционирования объектов
-- recompile
procedure New_Location is
  pChk varchar2(1500);
begin
  -- Проверка, есть ли fdc_file?
  begin
    select table_name
    into pChk
    from user_Tables
    where table_name = 'FDC_FILE';
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_Util.Abort('Ошибка получения имени таблицы FDC_FILE при переносе системы в новую схему', 1);
  end;
  
  -- Если таблицы fdc_file нет - ее создание
  if pChk is null then
    execute immediate 'create table FDC_FILE (ID NUMBER(15) not null, SOURCENAME VARCHAR2(1500) not null, BODY BLOB)';
    execute immediate 'comment on table FDC_FILE is ''Используется для хранения различных файлов''';
    execute immediate 'alter table FDC_FILE add constraint FDC_FILE_PK primary key (ID)';
    execute immediate 'alter table FDC_FILE add constraint FILE_ID foreign key (ID) references FDC_OBJECT (ID) on delete cascade';
  end if;
  
  -- Валидация объектов
  dbms_output.put_line('------------------------------------------------------');
  dbms_output.put_line('Валидация объектов. Далее - список инвалидных объектов');
  recompile;
  dbms_output.put_line('------------------------------------------------------');
  
  -- обновить пользователя "Хозяин приложения"
  update fdc_User 
     set LOGIN = fdc_Util.schema
     where ID = fdc_Object_Get_BySysName('User', 'SchemaOwner');
  commit; 
end;



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры проверки схемы
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Универсальная процедура проверки нарушений
-- На вход подается строка, выдаваемая в протоколе (тип нарушения)
-- и SQL-запрос на список нарушений
-- его результат - одно текстовое поле
procedure Chk_Any_Violation
  (
  pViolationStr varchar2,           -- Тип проверки
  pViolationSQL varchar2            -- Запрос на нарушение
  )
is
  type TChkRes is record (Str varchar2(1500));
  type TChkCur is ref cursor;
  ChkRes TChkRes;
  ChkCur TChkCur;
begin
  dbms_output.put_line(pViolationStr);
  open  ChkCur for pViolationSQL;
  fetch ChkCur into ChkRes;
  if ChkCur%found then
    dbms_output.put_line('Нарушения:');
  else
    dbms_output.put_line('Ok');
  end if;                  
  while ChkCur%found loop
    dbms_output.put_line(ChkRes.Str);
    fetch ChkCur into ChkRes;
  end loop;  
end;  

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Exist
-- Проверка, что все зарегистрированные таблицы присутствуют в БД
procedure Chk_Tables_Not_Exist is
begin
  Chk_Any_Violation('Все зарегистрированные таблицы присутствуют в БД?',
                    'select upper(TableName) from fdc_Table '||
                    'minus '||
                    'select TABLE_NAME Tab from user_Tables t  ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Registered
-- Проверка, что все таблицы, существующие в схеме, зарегистрированы в fdc_Tables
procedure Chk_Tables_Not_Registered is
begin
  Chk_Any_Violation('Все таблицы зарегистрированы в fdc_Tables?',
                    'select TABLE_NAME Tab from user_Tables t  '||
                    'minus '||
                    'select upper(TableName) from fdc_Table '||
                    'minus '||
                    'select ''PLAN_TABLE'' from dual ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Exist
-- Проверка, что все зарегистрированные колонки присутствуют в БД
procedure Chk_Columns_Not_Exist is
begin
  Chk_Any_Violation('Все зарегистрированные колонки присутствуют в БД?',
                    'select upper(TABLENAME)||''.''||upper(COLNAME) Col  '||
                    'from fdc_Column t  '||
                    'minus '||
                    'select upper(C.TABLE_NAME)||''.''||upper(C.COLUMN_NAME) '||
                    'from user_tab_columns C, '||
                    '     user_Objects O '||
                    'where O.Object_Type = ''TABLE'' and C.TABLE_NAME = O.OBJECT_NAME ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Registered
-- Проверка, что все колонки, существующие в схеме, зарегистрированы в fdc_Column
procedure Chk_Columns_Not_Registered is
begin
  Chk_Any_Violation('Все колонки зарегистрированы в fdc_Column?',
                    'select upper(C.TABLE_NAME)||''.''||upper(C.COLUMN_NAME) '||
                    'from user_tab_columns C, '||
                    '     user_Objects O '||
                    'where O.Object_Type = ''TABLE'' and C.TABLE_NAME = O.OBJECT_NAME '||
                    '      and C.TABLE_NAME <> ''PLAN_TABLE'' '||
                    'minus '||
                    'select upper(TABLENAME)||''.''||upper(COLNAME) Col  '||
                    'from fdc_Column t  ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Exist
-- Проверка, что все зарегистрированные системные компоненты присутствуют в БД
procedure Chk_SysComp_Not_Exist is
begin
  Chk_Any_Violation('Все зарегистрированные системные компоненты присутствуют в БД?',
                    'select upper(T.SysName) '||
                    'from fdc_SysComponent_Lst t '||
                    'where upper(TYPESYSNAME) in (''VIEW'', ''PROCEDURE'') '||
                    'minus '||
                    'select upper(OBJECT_NAME)  '||
                    'from user_objects '||
                    'where upper(OBJECT_TYPE) in ( '||
                    '      ''VIEW'', ''FUNCTION'', ''PROCEDURE'', ''PACKAGE'') ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Registered
-- Проверка, что все процедуры, функции и представления 
-- зарегистрированы в системе как серверные объекты
procedure Chk_SysComp_Not_Registered is
begin
  Chk_Any_Violation('Все серверные объекты зарегистрированы?',
                    'select upper(OBJECT_NAME)  '||
                    'from user_objects '||
                    'where upper(OBJECT_TYPE) in ( '||
                    '      ''VIEW'', ''FUNCTION'', ''PROCEDURE'') '||
                    'minus '||
                    'select upper(T.SysName) '||
                    'from fdc_SysComponent_Lst t '||
                    'where upper(TYPESYSNAME) in (''VIEW'', ''PROCEDURE'')');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Object_Child_Type_Foreigns
-- Проверка, что в БД существуют все не объявленные в Erwin внешние ключи,
-- реализующие наследование типов (таблиц) от таблицы fdc_Object
procedure Chk_Object_Child_Type_Foreigns is
begin
  Chk_Any_Violation('Есть все внешние ключи на FDC_OBJECT?',
                    'select	TT.Table_Name '||
                  	'from	fdc_Object_Type T, '||
                  	'     User_Tables TT '||
                  	'where	T.Parent_Object_Type_ID = Fdc_Object_Get_Bysysname(''Object'', ''Object'') and '||
                    '       T.Objecttableinstance = 1 and '||
                  	'	      TT.Table_Name = upper(T.TableName) and '||
                  	'	      upper(TT.Table_Name) <> ''FDC_OBJECT'' and '||
                    '      	not exists '||
                    '         (select 1 '||
                  	'          from    User_Constraints C, '||
                  	'                	 User_Cons_Columns CC '||
                  	'        	where   C.Table_Name = TT.Table_Name and '||
                  	'                	C.CONSTRAINT_TYPE = ''R'' and '||
                  	'			            C.R_CONSTRAINT_NAME = ''FDC_OBJECT_PK'' and '||
                  	'                	CC.Constraint_Name = C.Constraint_Name and '||
                  	'                	CC.COLUMN_NAME = ''ID'') '||
                    'order by TT.Table_Name');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Syscomponent_No_Task
-- Проверка системных компонент, не входящих в задачи
procedure Chk_Syscomponent_No_Task is
begin
  Chk_Any_Violation('Системные компоненты, не входящие в задачи?',
                    'select C.Sysname '||
                    'from fdc_SysComponent_Lst C '||
                    'where ID not in ( '||
                    '        select SYSCOMPONENT_ID '||
                    '        from fdc_Task_SysComponent '||
                    '        ) and '||
                    '      upper(SYSNAME) like ''FDC_%'' '||
                    'order by upper(SYSNAME)');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- All_Metrics
-- Последовательный запуск всех проверок
procedure All_Metrics is
begin
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Tables_Not_Exist;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Tables_Not_Registered;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Columns_Not_Exist;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Columns_Not_Registered;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_SysComp_Not_Exist;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_SysComp_Not_Registered;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Object_Child_Type_Foreigns;
  dbms_output.put_line('--------------------------------------------------------');
  Chk_Syscomponent_No_Task;
  dbms_output.put_line('--------------------------------------------------------');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Процедуры очистки схемы
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Очистка всех прикладных данных
-- Практически после исполнения данной процедуры получается "чистая" схема,
-- содержащая только необходимые метаданные
procedure Clear_Data 
is
  type TLogRec is record  
    (Moment date,
     Event varchar2(1500));       
  type TLog is table of TLogRec;
  pLog TLog := TLog();
  pCnt number;
  -- Локальная процедура протоколирования
  procedure Log_Add(pStr varchar2) is
  begin
    pLog.extend;
    pLog(pLog.last).Moment := sysdate;
    pLog(pLog.last).Event := pStr;
  end;  
  -- Локальная процедура протоколирования успешного завершения шага
  procedure Log_Add_Ok is
  begin
    Log_Add('Ok');
  end;  
  -- Локальная процедура распечатки протокола
  procedure Log_Output is
  begin
    for i in 1..pLog.Count loop
      dbms_output.put_line(to_char(pLog(i).Moment, 'HH24-MI-SS')||' '||pLog(i).Event);
    end loop;
  end;  
  
begin
  Log_Add ('Началась очистка схемы');
  
  -- Проверка, что очистка производится в сессии владельца схемы
  if user <> upper(fdc_Util.Schema) then
  	fdc_Util.Abort('Да ты не владелец схемы!');
  end if;
    
  -- Останов репликации
  Log_Add('Останов логирования изменений подсистемой репликации...');
  -- Здесь необходимо включить вызов останова логирования, например:
  -- fdc_repmanager.stoplogging;
  Log_Add_Ok;
  commit;

  -- Сохранение в fdc_Buffer идентификаторов очищаемых типов
  -- Вычищаются только заданные типы и их наследники!
  -- Сделано так, чтобы не перечислять все типы, а обозначить только типы верхнего уровня
  -- В буфере сохраняет, так как использовать в дальнейшем будем несколько раз
  delete from fdc_Buffer;
  insert into fdc_Buffer (ID)
  select	distinct Child_Type.ID
  from	fdc_Object_Type T,
        fdc_Child_Object_Type COT,
        fdc_Object_Type Child_Type
  where	T.SysName in ('Address', 'Collection', 'Event',
                      'ExchangePack', 'ExchangePackDelivery', 'ExchangeSite',
                      'File', 'FollowUp', 'ObjectKind',
                      'ObjectRelation','Person', 'RegDocument',
                      'Session', 'Subscription', 'Value')
		    and COT.Object_Type_ID = T.ID
        and Child_Type.ID = COT.Child_Object_Type_ID;
  commit;      

  -- Снятие ключей
  Log_Add('Отключение внешних ключей...');
  Disable_FKeys;
  Log_Add_Ok;
  
  -- Отключение триггеров
  Log_Add('Отключение триггеров...');
  Disable_Triggers;
  Log_Add_Ok;
  
  -- Drop лишних таблиц
  Log_Add('Удаление лишних таблиц...');
  for rec in (select table_name from user_tables
              minus
              select upper(tablename) from Fdc_Column
              minus
              select table_name from user_tables
              where table_name like 'PLSQL_PROFILER_%') loop
    execute immediate 'drop table '||rec.table_name||' cascade constraints';
  end loop;
  Log_Add_Ok;
  
  -- Очистка необъектных таблиц
  -- Кроме тех, что содержат конфигурацию
  Log_Add('Очистка необъектных таблиц...');
  for rec in (select table_name from user_tables
              minus
              select upper(tablename) from fdc_Object_Type
              minus
              select table_name from user_tables
              where table_name in ('FDC_BUFFER', 'FDC_CHILD_OBJECT_TYPE', 'FDC_COLUMN', 'FDC_KIND_TYPE', 
                                   'FDC_TABLE', 'FDC_TASK_SYSCOMPONENT', 'FDC_USER_GROUP_TASK', 'FDC_USER_IN_GROUP')
              ) loop
    Log_Add('    Truncate '||rec.Table_Name||'...');   
    execute immediate 'truncate table '||rec.table_name;
  end loop;
  Log_Add_Ok;

  -- Очистка объектных таблиц
  -- Вычищаются только таблицы для заданных типов и их наследников!
  Log_Add('Очистка объектных таблиц...');
  for rec in (
  	select	distinct T.TableName
  	from	fdc_Object_Type T,
          fdc_Buffer B
    where B.ID = T.ID) loop
    Log_Add('    Truncate '||rec.TableName||'...');   
	  execute immediate 'truncate table '||rec.TableName;
 	end loop;
  Log_Add_Ok;

  -- Удаление записей из таблицы объектов и связанных с ней таблиц
  -- Вычищаются только записи по соответствующим типам
  Log_Add('Удаление записей из таблицы объектов и связанных с ней таблиц...');
  for rec in (
  	select	distinct B.ID, T.SYSNAME
  	from	fdc_Object_Type T,
          fdc_Buffer B
    where B.ID = T.ID) loop
    Log_Add('    Delete '||rec.SysName||'...');   
    -- Вычистка пользовательских объектных грантов
  	delete from	fdc_User_Grant G
  	where Object_ID in
     (select ID
  		from	fdc_Object
  		where	Object_Type_ID = rec.ID);

    -- Вычистка групповых объектных грантов
  	delete from	fdc_User_Group_Grant G
  	where Object_ID in
     (select ID
  		from	fdc_Object
  		where	Object_Type_ID = rec.ID);

    -- Удаление объектов
  	delete from fdc_Object
  	where Object_Type_ID = rec.ID;
    pCnt := sql%rowcount;
  	commit;
  	Log_Add('    Deleted '||rec.SysName||': '||pCnt);
 	end loop;
  Log_Add_Ok;

  -- Включение внешних ключей
  Log_Add('Включение внешних ключей...');
  Enable_FKeys;
  Log_Add_Ok;
  
  -- Включение триггеров
  Log_Add('Включение триггеров...');
  Enable_Triggers;
  Log_Add_Ok;

  -- Завершение, распечатка протокола
  delete from fdc_Buffer;
  commit;
  Log_Add('Очистка успешно завершена!');
  Log_Output;
exception when others then
		Log_Add('Error: '||sqlerrm);
    Log_Output;
    raise;
end;


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      Универсальные процедуры обслуживания схемы БД
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Recompile
-- Перекомпиляция (валидация) объектов схемы
-- Выдает (через dbms_output) список объектов, которые не удалось валидировать
procedure Recompile
  (
  p_recompile_All boolean := false   -- Признак, перекомпилировать всх или только инвалидные объекты
                                     -- по умолчанию (false) - только инвалидные
  )
IS
-- PL/SQL Specification
CURSOR all_objects IS
  SELECT 'alter ' ||
         DECODE(object_type, 'PACKAGE BODY', 'PACKAGE ', object_type) || ' '
         ||'"'||object_name||'"' || ' compile' ||
         DECODE(object_type, 'PACKAGE BODY', ' BODY', '') compile_string
  FROM user_objects
  WHERE OBJECT_TYPE IN ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'PACKAGE BODY', 'TRIGGER') and
        OBJECT_NAME <> 'RECOMPILE'
  ORDER BY object_type;
CURSOR bad_objects IS
  SELECT 'alter ' ||
         DECODE(object_type, 'PACKAGE BODY', 'PACKAGE ', object_type) || ' '
         ||'"'||object_name||'"' || ' compile' ||
         DECODE(object_type, 'PACKAGE BODY', ' BODY', '') compile_string
  FROM user_objects
  WHERE status = 'INVALID'
ORDER BY object_type;
  CURSOR curInvalidList IS
  SELECT object_name, object_type
   FROM user_objects
  WHERE status = 'INVALID';
  last_bad_count NUMBER := 0;
  bad_count NUMBER;
  cursor_name INTEGER;
  ret_val INTEGER;

-- PL/SQL Block
BEGIN
  if p_recompile_All then
    for rec in all_objects loop
      execute immediate rec.compile_string;
    end loop;
  end if;
  cursor_name := dbms_sql.open_cursor;
  LOOP
    /* считаем количество инвалидных объектов */
    SELECT COUNT(*)
      INTO bad_count
      FROM user_objects
     WHERE status = 'INVALID';
    /* выйти из цикла когда не останется инвалидных объектов
       или количество объектов перестанет уменьшаться, те
       присутствует фатальная ошибка
     */
    EXIT WHEN  bad_count = last_bad_count OR bad_count = 0;
    /* запоминаем число инвалидных объектов */
    last_bad_count := bad_count;
    FOR bad IN bad_objects LOOP
      BEGIN
      	dbms_sql.parse(cursor_name, bad.compile_string, dbms_sql.native);
        -- ret_val := dbms_sql.execute(cursor_name);
        /* exception необходим, т.к. на версии ORACLE8 если компиляция произошла
           с ошибками возникает искличение и обработка прекращается.
         */
      EXCEPTION
        WHEN OTHERS THEN NULL;
      END;
    END LOOP;
  END LOOP;
  IF bad_count <> 0 THEN
    dbms_output.put_line('Error compiling following database objects :');
    FOR recBadObj IN curInvalidList LOOP
      dbms_output.put_line(recBadObj.object_type||' '||recBadObj.object_name);
    END LOOP;
  END IF;
  dbms_sql.close_cursor(cursor_name);
  END;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- SessionTrace
-- Включить или выключить трассировку сессии на сервере Oracle
procedure SessionTrace
	(
	pSwitchOn boolean := true             -- Включить или отключить трассировку:
                                        -- true - включить, false - отключить
	)
is
begin
  DBMS_SESSION.SET_SQL_TRACE(pSwitchOn);
end SessionTrace;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Drop_All_Synonyms
-- Удаление всех синонимов (может использоваться в процессе инсталляции)
procedure Drop_All_Synonyms is
begin
  for rec in (select synonym_Name from user_synonyms
              minus
              select synonym_Name from user_synonyms
              where db_link is null and Table_Owner = user) loop
    begin
      execute immediate 'drop synonym '||rec.synonym_Name;
    exception
      when others then
        dbms_output.put_Line('Синоним '|| rec.synonym_Name|| ' не может быть удален: '||sqlerrm);
    end;
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Drop_All_Jobs
-- Удаление всех job-ов (может использоваться в процессе инсталляции)
procedure Drop_All_Jobs is
begin
  for rec in (select Job from user_jobs) loop
    begin
      dbms_job.remove(rec.job);
    exception
      when others then
        dbms_output.put_Line('Задание (job) '|| rec.Job|| ' не может быть удалено: '||sqlerrm);
    end;
  end loop;
  commit;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Analyze_Table
-- Анализировать таблицу вместе с индексами
procedure Analyze_Table
  (
  pTableName varchar2    -- Имя таблицы, которую надо проанализировать
  ) 
is
begin
  dbms_stats.set_table_stats(null,upper(pTableName));
  for I in (select Index_Name from User_indexes where Table_Name = upper(pTableName))	loop
  	dbms_stats.set_index_stats(null,I.Index_Name);
 	end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Analyze_All
-- Анализировать всю схему
procedure Analyze_All is
begin
  DBMS_STATS.GATHER_SCHEMA_STATS(ownname => fdc_Util.Schema, 
                                 method_opt => 'FOR ALL INDEXED COLUMNS SIZE AUTO', 
                                 CASCADE => true, 
                                 ESTIMATE_PERCENT => 20);
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Rebuild_All
-- Перестроить все индексы
procedure Rebuild_All is
begin
  for rec in (select * 
              from user_Indexes 
              where table_Name <> 'FDC_BUFFER' and 
                    index_Type <> 'LOB') loop
    begin
    	execute immediate 'alter index '||rec.Index_Name||' rebuild nologging compute statistics';
    exception
      when others then
        fdc_Util.Abort('Error rebuilding index '||rec.index_Name, 1);
    end;  
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Disable_FKeys
-- Отключить все внешние ключи
procedure Disable_FKeys as
begin
  for CC in (select Table_Name,Constraint_Name
  	from User_Constraints
  	where 	Constraint_Type = 'R') loop
  	execute immediate 'alter table '||CC.Table_Name||' disable constraint '||CC.Constraint_Name;
	end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Enable_FKeys
-- Включить все внешние ключи
procedure Enable_FKeys as
begin
  for CC in (select Table_Name,Constraint_Name
  	from User_Constraints
  	where 	Constraint_Type = 'R') loop
  	execute immediate 'alter table '||CC.Table_Name||' enable constraint '||CC.Constraint_Name;
	end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Disable_Triggers
-- Отключить все триггеры
procedure Disable_Triggers as
begin
  for CC in (select * from user_triggers) loop
  		execute immediate 'alter trigger '||CC.Trigger_Name||' disable';
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Enable_Triggers
-- Отключить все триггеры
procedure Enable_Triggers as
begin
  for CC in (select * from user_triggers) loop
  		execute immediate 'alter trigger '||CC.Trigger_Name||' enable';
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Set_Object_Type_DelProc
-- Устанавливает процедуру удаления для объектов типа
-- Если системное имя процедуры не задано или null, то пытается
-- сгенерить имя процедуры удаления автоматически, как
-- "<имя таблицы типа>_del"
-- Параметр pDoRaise определяет поднимать ли исключение, если что не так
-- Если не равно 0, то поднимать. По умолчанию не поднимать.
procedure Set_Object_Type_DelProc
  (
    pTypeID number,
    pProcSysName varchar2 := null,
    pDoRaise number := 0
  )
is
  ppTableName varchar2(1500);
  ppDelProcID number(15);
  ppProcSysName varchar2(1500);
  ppNewDelProcID number(15);
begin
  -- определяем таблицу и нынешнюю процедуру удаления типа
  begin
    select TableName, Del_Procedure_ID
       into ppTableName, ppDelProcID 
      from fdc_Object_Type_Lst 
     where ID = pTypeID;
  exception
 	   when NO_DATA_FOUND then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('Не найден тип по ID = '||pTypeID);
         else
           return;
        end if;     
  	when others then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('Ошибка получения значений типа по ID = '||pTypeID, 1);
         else
           return;
        end if;  
  end;
  
  -- определяем имя процедуры удаления
  if (pProcSysName is null) then
     if (ppTableName is null) then
        if (pDoRaise <> 0) then
           fdc_util.Abort('Не задана таблица типа с ID = '||pTypeID);
         else
           return;
        end if;   
      else
        ppProcSysName := trim(ppTableName) || '_Del';
     end if;
   else
     ppProcSysName := pProcSysName;  
  end if;   
  
  -- ищем ID новой процедуры удаления
  begin
    ppNewDelProcID := fdc_Object_Get_BySysName('Procedure', ppProcSysName, 1);
  exception
    when others then
      if (pDoRaise <> 0) then
         fdc_util.Abort('Ошибка получения процедуры удаления ' ||ppProcSysName, 1);
       else
         return;
      end if;
  end;
  
  -- если нужно, то изменяем процедуру удаления типа
  if (NVL(ppDelProcID, -1) <> ppNewDelProcID) then
     begin
       update fdc_Object_Type
          set Del_Procedure_ID = ppNewDelProcID
        where ID = pTypeID;
     exception
       when others then
         if (pDoRaise <> 0) then
            fdc_util.Abort('Ошибка изменения процедуры удаления типа с ID =  ' ||pTypeID, 1);   
         end if;   
     end; 
  end if;   
end;  

end fdc_Service;
/
