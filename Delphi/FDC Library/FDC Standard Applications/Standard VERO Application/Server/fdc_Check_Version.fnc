create or replace function fdc_Check_Version
-- Проверка текущей версии серверной части системы
-- На вход подается предполагаемая версия (4 цифры разделенные точками)
-- Проверка производится относительно системной константы 'Version'
-- В случае совпадения возвращает 1
-- При несовпадении возвращает 0
-- Параметр pChkBuildNum регулирует, включать ли в проверку последнюю цифру - номер сборки (build)?
-- Если серверная часть находится в процессе миграции версии (patch, upgrade) - всегда возвращает 0
-- Возвращаемые параметры:
--    текущая версия серверной части (SysValue 'Version')
--    значение флага миграции версии (SysValue 'VersionMigrate')
	(
	pChkVersion varchar2,                 -- Предполагаемая версия системы
  pChkBuildNum number,                  -- Проверять ли соответствие номера сборки (build)?
                                        -- 1 - проверять, 0 - не проверять 
  pCurrentVersion out varchar2,         -- Текущее значение версии серверной части системы (SysValue 'Version')
  pVersionMigrate out number            -- значение флага миграции версии (SysValue 'VersionMigrate')
	)
return number  
is
  pVersionMigrateVal number;
  pCurrentVersionVal varchar2(1500);
  pChkVersionStr varchar2(1500);
begin
  -- проверить, не мигрирует ли сейчас версия
  pVersionMigrateVal := fdc_valuebool_sys_get('VersionMigrate');
  
  -- Получить текущее значение версии серверной части
  pCurrentVersionVal := fdc_valuestring_sys_get('Version');
  
  -- Если версия серверной части мигрирует - сразу возвращаем 0
  if nvl(pVersionMigrateVal, 0) <> 0 then
    pCurrentVersion := pCurrentVersionVal||'->???';
    pVersionMigrate := 1;
    return 0;
  end if;

  -- Минимальная нормализация проверяемого номера версии
  pChkVersionStr := upper(trim(pChkVersion));

  -- Возвращаемые значения
  pCurrentVersion := pCurrentVersionVal;
  pVersionMigrate := 0;
  
  -- Если проверка без номера сборки
  if pChkBuildNum = 0 then
    pChkVersionStr := substr(pChkVersion, 1, instr(pChkVersion, '.', -1, 1));
    pCurrentVersionVal := substr(pCurrentVersionVal, 1, instr(pCurrentVersionVal, '.', -1, 1));
  end if;  

  -- Возврат результата
  if nvl(pChkVersionStr, '----') = nvl(pCurrentVersionVal, '----') then
    return 1;
  else  
    return 0;
  end if;
  
end fdc_Check_Version;
/
