create or replace function fdc_Check_Version
-- �������� ������� ������ ��������� ����� �������
-- �� ���� �������� �������������� ������ (4 ����� ����������� �������)
-- �������� ������������ ������������ ��������� ��������� 'Version'
-- � ������ ���������� ���������� 1
-- ��� ������������ ���������� 0
-- �������� pChkBuildNum ����������, �������� �� � �������� ��������� ����� - ����� ������ (build)?
-- ���� ��������� ����� ��������� � �������� �������� ������ (patch, upgrade) - ������ ���������� 0
-- ������������ ���������:
--    ������� ������ ��������� ����� (SysValue 'Version')
--    �������� ����� �������� ������ (SysValue 'VersionMigrate')
	(
	pChkVersion varchar2,                 -- �������������� ������ �������
  pChkBuildNum number,                  -- ��������� �� ������������ ������ ������ (build)?
                                        -- 1 - ���������, 0 - �� ��������� 
  pCurrentVersion out varchar2,         -- ������� �������� ������ ��������� ����� ������� (SysValue 'Version')
  pVersionMigrate out number            -- �������� ����� �������� ������ (SysValue 'VersionMigrate')
	)
return number  
is
  pVersionMigrateVal number;
  pCurrentVersionVal varchar2(1500);
  pChkVersionStr varchar2(1500);
begin
  -- ���������, �� ��������� �� ������ ������
  pVersionMigrateVal := fdc_valuebool_sys_get('VersionMigrate');
  
  -- �������� ������� �������� ������ ��������� �����
  pCurrentVersionVal := fdc_valuestring_sys_get('Version');
  
  -- ���� ������ ��������� ����� ��������� - ����� ���������� 0
  if nvl(pVersionMigrateVal, 0) <> 0 then
    pCurrentVersion := pCurrentVersionVal||'->???';
    pVersionMigrate := 1;
    return 0;
  end if;

  -- ����������� ������������ ������������ ������ ������
  pChkVersionStr := upper(trim(pChkVersion));

  -- ������������ ��������
  pCurrentVersion := pCurrentVersionVal;
  pVersionMigrate := 0;
  
  -- ���� �������� ��� ������ ������
  if pChkBuildNum = 0 then
    pChkVersionStr := substr(pChkVersion, 1, instr(pChkVersion, '.', -1, 1));
    pCurrentVersionVal := substr(pCurrentVersionVal, 1, instr(pCurrentVersionVal, '.', -1, 1));
  end if;  

  -- ������� ����������
  if nvl(pChkVersionStr, '----') = nvl(pCurrentVersionVal, '----') then
    return 1;
  else  
    return 0;
  end if;
  
end fdc_Check_Version;
/
