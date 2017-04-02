create or replace package fdc_Service as
-- � ������ ������� ��� ��������� �����������, ������������ ��� ����������������� �������,
-- �� �� ������������ � ������� ������ ������ �������������
-- ���� ������ ��������� ������������ �����,
-- ��������� ������������� ������,
-- � ����� ��������� ����������� �����������, �������� ����� � ��.
-- ����� �� ���������� ������ �� �������������

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ����������� �������� � ���������
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register
-- ����������� ��������� ���������� � ������� 
-- (�� ������������ ��������� ��� �������������)
-- �������� ��� commit!!!
procedure Server_Component_Register
	(
	  pSysName varchar2,          -- ��������� ��� ����������    
    pName    varchar2 := null   -- �������� ����������, ���� �� ������, �� ������� �������������
	);

-------------------------------------------------------------------------------------------
-- Server_Component_Register_All
-- ����������� ���� �������������������� ��������� ��������� � ������� 
-- �������������� ��� ���������� �� user_Objects ���������, ������� � �������������
-- !!!�������� ��� commit
procedure Server_Component_Register_All;

-------------------------------------------------------------------------------------------
-- Base_Object_Type_Register
-- ��������� ����������� ������� ����� Object, ObjectType
-- ���������� 1 ��� ��� ������������� ����� �� Erwin (Model-level post script Register_Base_Object_Types)
procedure Base_Object_Type_Register;

-------------------------------------------------------------------------------------------
-- Object_Type_Register_By_Table
-- ����������� ���������� ���� VERO �� �������� �������
-- ��������������, ��� 2 �������� ����: 'Object', 'ObjectType' ��� ���������� 
-- (��� �������������� ���������� ���������� fdc_Object_Type_Base_Register)
procedure Object_Type_Register_By_Table
	(
  pTableName varchar2               -- �������� ������� � ��
	);

-------------------------------------------------------------------------------------------
-- Additional_Type_Register
-- ����������� �������������� ��������� ����� ���� �������
-- ����� �������������� ����, �������� � ���� �������, �� �� ������������������� �� Erwin 
-- (���������� ���� ����� �� ���� ��� �� ������)
-- !!!�������� ��� commit
procedure Additional_Type_Register;


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ��������� ������������� ������
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ������������� ����������� ��� ���������������� �������� �����
-- ����������� �����, ������������ ������� ����������
-- !!!�������� ��� commit
procedure Init_Service_Data;

-------------------------------------------------------------------------------------------
-- ������������� ����������� ��� ���������������� �������� �����
-- � ����������� ��������� - � ����� �������
-- ��� ������������� ��������� �������������
-- ������� ������������ ����� �����:
-- 1. ��������� ����� �� Erwin (�������, �������, �����)
-- 2. �������� ��������� ��������, ������� � �������������
-- 3. ����������� ����� �� ������������ �������� (post-schema � post_table �������� � Erwin)
-- 4. ����������� �������������� ����� (Additional_Type_Register)
-- 5. ��� ��������� ������������� ����������� ������ � ���������� 
-- !!!�������� ��� commit
procedure Primary_Init;

-------------------------------------------------------------------------------------------
-- ����������� ��� �������� � ����� �����
-- �������� fdc_File, ���� �� ������� ������������� ��� ��-�� ������� ���������� ������������
-- ��������������� ����������� ��� ���������������� ��������
-- recompile
procedure New_Location;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ��������� �������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Exist
-- ��������, ��� ��� ������������������ ������� ������������ � ��
procedure Chk_Tables_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Registered
-- ��������, ��� ��� �������, ������������ � �����, ���������������� � fdc_Tables
procedure Chk_Tables_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Exist
-- ��������, ��� ��� ������������������ ������� ������������ � ��
procedure Chk_Columns_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Registered
-- ��������, ��� ��� �������, ������������ � �����, ���������������� � fdc_Column
procedure Chk_Columns_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Exist
-- ��������, ��� ��� ������������������ ��������� ���������� ������������ � ��
procedure Chk_SysComp_Not_Exist;

-------------------------------------------------------------------------------------------
-- Chk_SysComp_Not_Registered
-- ��������, ��� ��� ���������, ������� � ������������� 
-- ���������������� � ������� ��� ��������� �������
procedure Chk_SysComp_Not_Registered;

-------------------------------------------------------------------------------------------
-- Chk_Object_Child_Type_Foreigns
-- ��������, ��� � �� ���������� ��� �� ����������� � Erwin ������� �����,
-- ����������� ������������ ����� (������) �� ������� fdc_Object
procedure Chk_Object_Child_Type_Foreigns;

-------------------------------------------------------------------------------------------
-- Chk_Syscomponent_No_Task
-- �������� ��������� ���������, �� �������� � ������
procedure Chk_Syscomponent_No_Task;

-------------------------------------------------------------------------------------------
-- All_Metrics
-- ���������������� ������ ���� ��������
procedure All_Metrics;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ��������� ������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ������� ���� ���������� ������
-- ����������� ����� ���������� ������ ��������� ���������� "������" �����,
-- ���������� ������ ����������� ����������
procedure Clear_Data;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ������������� ��������� ������������ ����� ��
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Recompile
-- �������������� (���������) �������� �����
-- ������ (����� dbms_output) ������ ��������, ������� �� ������� ������������
procedure Recompile
  (
  p_recompile_All boolean := false   -- �������, ����������������� ��� ��� ������ ���������� �������
                                     -- �� ��������� (false) - ������ ����������
  );

-------------------------------------------------------------------------------------------
-- SessionTrace
-- �������� ��� ��������� ����������� ������ �� ������� Oracle
procedure SessionTrace
	(
	pSwitchOn boolean := true             -- �������� ��� ��������� �����������:
                                        -- true - ��������, false - ���������
	);

-------------------------------------------------------------------------------------------
-- Drop_All_Synonyms
-- �������� ���� ��������� (����� �������������� � �������� �����������)
procedure Drop_All_Synonyms;

-------------------------------------------------------------------------------------------
-- Drop_All_Jobs
-- �������� ���� job-�� (����� �������������� � �������� �����������)
procedure Drop_All_Jobs;

-------------------------------------------------------------------------------------------
-- Analyze_Table
-- ������������� ������� ������ � ���������
procedure Analyze_Table
  (
  pTableName varchar2    -- ��� �������, ������� ���� ����������������
  );

-------------------------------------------------------------------------------------------
-- Analyze_All
-- ������������� ��� �����
procedure Analyze_All;

-------------------------------------------------------------------------------------------
-- Rebuild_All
-- ����������� ��� �������
procedure Rebuild_All;

-------------------------------------------------------------------------------------------
-- Disable_FKeys
-- ��������� ��� ������� �����
procedure Disable_FKeys;

-------------------------------------------------------------------------------------------
-- Enable_FKeys
-- �������� ��� ������� �����
procedure Enable_FKeys;

-------------------------------------------------------------------------------------------
-- Disable_Triggers
-- ��������� ��� ��������
procedure Disable_Triggers;

-------------------------------------------------------------------------------------------
-- Enable_Triggers
-- ��������� ��� ��������
procedure Enable_Triggers;

-------------------------------------------------------------------------------------------
-- Set_Object_Type_DelProc
-- ������������� ��������� �������� ��� �������� ����
-- ���� ��������� ��� ��������� �� ������ ��� null, �� ��������
-- ��������� ��� ��������� �������� �������������, ���
-- "<��� ������� ����>_del"
-- �������� pDoRaise ���������� ��������� �� ����������, ���� ��� �� ���
-- ���� �� ����� 0, �� ���������. �� ��������� �� ���������.
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
--      ����������� �������� � ���������
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register
-- ����������� ��������� ���������� � ������� 
-- (�� ������������ ��������� ��� �������������)
-- �������� ��� commit!!!
procedure Server_Component_Register
	(
	  pSysName varchar2,          -- ��������� ��� ����������    
    pName    varchar2 := null   -- �������� ����������, ���� �� ������, �� ������� �������������
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
  -- ��������� ������������ ����� ����������
  if upper(substr(trim(pSysName), 1, 4)) <> 'FDC_' then
     Fdc_Util.Abort('��� ����������� � VERO ��������� ���������� ������ ����� ������� <fdc_>');
  end if;

  -- ���������� ��� ��������� ���������� �� User_Objects
  begin
    select Object_Type
      into pProcType
      from User_Objects
     where Object_Name = upper(pSysName) and
           Object_Type in ('VIEW', 'PROCEDURE','FUNCTION', 'PACKAGE');
  exception 
    when NO_DATA_FOUND then fdc_util.Abort('�� ������� ��������� ���������� '||pSysName||' � User_Objects');
  	when others then fdc_util.Abort('������ ��������� ���� ��������� ��������� '||pSysName, 1);
  end;

  -- ���������� �������� ��� ��������� ���������� � ����������� �� �� ���������� ����
  if pProcType = 'VIEW' then
	   pTypeSysName := 'View';
  elsif pProcType in ('PROCEDURE','FUNCTION','PACKAGE') then
	   pTypeSysName := 'Procedure';
  else
     fdc_util.Abort('�� ��������� ��� ��������� ��������� � VERO '||pSysName);        
  end if;
  
  -- ����������� �� ���� �� ��������� ���������� ��� ����������������
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
    when others then fdc_util.Abort('������ ��� ������ ��������� ��������� '||pSysName||' � VERO', 1);
  end;

  -- ���� ��� ����������������, �� �������
  if (pOldName is not null) then
     return;
  end if;

  -- �������� ���������� ������������� ��������� ���� 'Object'
  -- ���� �� �����, �� ��������� ����������
  begin
    pRootType_ID := fdc_Object_Get_BySysName('ObjectType','Object');
  exception  
    when others then
	    fdc_util.Abort('�� ������ �������� ��� Object', 1);
  end;

  -- �������� ������ 4 ������� � ������� �������������   
  pSrcType := upper(replace(trim(substr(pSysName,5,1500)),'_',''));

  -- ������ �������� ���������� ��������� ��� �� ����� ��������� ����������
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
    when others then fdc_util.Abort('������ ��� ������ ����������� ���������� ���� ��� ���������� '||pSysName, 1);
  end;
   
  pCompName := pName;

  -- ���� ���������� ��������� ��� �� �����, �� � �������� �������� ����� ��� 'Object',
  if (pObject_Type_ID is null) then
     pObject_Type_ID := pRootType_ID; 
      
     -- ���� �������� ���������� �� ���� ������� ��� ������, �� � �������� �������� ����� ��� ��������� ���
     if (pCompName is null) then 
        pCompName := pSysName;
     end if;   
   else   
     -- ���� �������� ���������� �� ���� ������� ��� ������, �� � ������� ��� �������������
     if (pCompName is null) then 
        -- ��������� ��������� ��� ���� �� pSrcType
	      pActStr := trim(substr(pSrcType, length(pUpperSysName) + 1, 1500));
         
        -- ������ � ����������� �� �������� ������� ���
	      if InStr(upper(pActStr),'LST') = 1 then 
           pCompName := '������ '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'ADD') = 1 then 
           pCompName := '�������� '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'UPD') = 1 then 
           pCompName := '�������� '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'DEL') = 1 then 
           pCompName := '������� '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'GET') = 1 then 
           pCompName := '����� '	||pTypeName || ' ' || trim(substr(pActStr,4,1500));
        elsif InStr(upper(pActStr),'CLEAR') = 1 then 
           pCompName := '�������� '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));
        elsif InStr(upper(pActStr),'CHECK') = 1 then 
           pCompName := '��������� '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));
        elsif InStr(upper(pActStr),'REGISTER') = 1 then 
           pCompName := '���������������� '	||pTypeName || ' ' || trim(substr(pActStr,6,1500));   
        else
           pCompName := pTypeName||' '||pActStr;   
        end if;
     end if;   
  end if;      
   
  -- ������������ ���������� � VERO
  if pTypeSysName = 'View' then
	   pNewID := fdc_View_Add(pTypeSysName, pCompName, pObject_Type_ID, pSysName);
  elsif pTypeSysName = 'Procedure' then   
     pNewID := fdc_Procedure_Add(pTypeSysName, pCompName, pObject_Type_ID, pSysName);
  end if;

  -- ������� ��������� � �����������
  dbms_output.put_line(pSysName||' ���������������� ��� '||pCompName);
end Server_Component_Register;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Server_Component_Register_All
-- ����������� ���� �������������������� ��������� ��������� � ������� 
-- �������������� ��� ���������� �� user_Objects ���������, ������� � �������������
-- !!!�������� ��� commit
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
-- ��������� ����������� ������� ����� Object, ObjectType
-- ���������� 1 ��� ��� ������������� ����� �� Erwin (Model-level post script Register_Base_Object_Types)
procedure Base_Object_Type_Register
is
  pNewID_Object number(15);
  pNewID_Object_Type number(15);
  pObjectIcon varchar2(4000);
  pObjectTypeIcon varchar2(4000);
begin
  -- ���������� ������ ��� �����
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

  -- �������� ����, ��� Object, ObjectType ��� �� ����������������
  begin
    select ID
    into pNewID_Object
    from fdc_Object
    where sysname in ('Object', 'ObjectType') and
          rownum <= 1;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ �������� ����������� ������� �����', 1);
  end;
  
  -- ���� ������� ���� ��� ���������������� - ������������ � �������
  if pNewID_Object is not null then
    fdc_util.Abort('������� ���� ��� ���������������� � �������!');
  end if;
          
  -- �������� �������� ����� � fdc_Object_Type �� fdc_Object, ���� �� ����  
  begin        
    execute immediate 'alter table fdc_Object_Type drop constraint Object_Type_ID';
  exception
    when others then
      if sqlcode = -2443 then null;
      else raise;
      end if;
  end;  
  
  -- ��������� ��������������� ��� Object �ObjectType
  pNewID_Object := Fdc_Object_Get_Newkey;
  pNewID_Object_Type := Fdc_Object_Get_Newkey;
  
  -- �������� ������� � fdc_Object_Type
  insert into fdc_Object_Type (Id, Name, Shortname, Sysname, Tablename, Icon, State_Scheme_Id, 
                               Parent_Object_Type_Id, Del_Procedure_Id, Objecttableinstance)
  values                       (pNewID_Object, '������', '������', 'Object', 'FDC_OBJECT', pObjectIcon, null,
                                null, null, 1);
  insert into fdc_Object_Type (Id, Name, Shortname, Sysname, Tablename, Icon, State_Scheme_Id, 
                               Parent_Object_Type_Id, Del_Procedure_Id, Objecttableinstance)
  values                       (pNewID_Object_Type, '��� �������', '��� �������', 'ObjectType', 'FDC_OBJECT_TYPE', pObjectTypeIcon, null,
                                pNewID_Object, null, 1);
  
  -- �������� ������� � fdc_Object
  insert into fdc_Object (Id, Object_Type_Id, State_Id, Name, Shortname, Sysname, 
                          Descript, Accesslevel, Owner_Object_Id)
  values                 (pNewID_Object, pNewID_Object_Type, null, '������', '������', 'Object',
                          '����� ���������� ������ �������. ��� ������� ������� ����������� �� �������.', 1, null);                        
  insert into fdc_Object (Id, Object_Type_Id, State_Id, Name, Shortname, Sysname, 
                          Descript, Accesslevel, Owner_Object_Id)
  values                 (pNewID_Object_Type, pNewID_Object_Type, null, '��� �������', '��� �������', 'ObjectType', 
                          '������������� ����� ��������� ������ �������, ���������� �������� � ���, ����� ��������� � �.�.', 1, null);                        
                          
  -- �������� ������� � fdc_Child_Object_Type
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object, pNewID_Object);                 
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object, pNewID_Object_Type);                 
  insert into fdc_Child_Object_Type(Object_Type_Id, Child_Object_Type_Id)
  values                           (pNewID_Object_Type, pNewID_Object_Type);                 
                            
  -- �������� �������� ����� � fdc_Object_Type �� fdc_Object
  execute immediate 'alter table fdc_Object_Type add constraint Object_Type_ID '||
                    'foreign key (ID) references fdc_Object on delete cascade';
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Object_Type_Register_By_Table
-- ����������� ���������� ���� VERO �� �������� �������
-- ��������������, ��� 2 �������� ����: 'Object', 'ObjectType' ��� ���������� 
-- (��� �������������� ���������� ���������� fdc_Object_Type_Base_Register)
procedure Object_Type_Register_By_Table
	(
  pTableName varchar2               -- �������� ������� � ��
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
  -- �������� ���������� �������
  if upper(substr(trim(pTableName), 1, 4)) <> 'FDC_' then
    Fdc_Util.Abort('��� ����������� ���������� ���� ������� ������ ����� ������� <fdc_>');
  end if;

  -- ��������� SysName ����: ������� ������� 'fdc_' � ������� ������������� � �������� �������.
  pSysName := replace(substr(trim(pTableName),5,30),'_','');
  
  -- ��������, ��� �������������� �� Object � �� ObjectType
  if upper(pSysName) in ('OBJECT', 'OBJECTTYPE') then
    Fdc_Util.Abort('��������� fdc_Object_Type_Register �� ������������� ��� ����������� ���� '||pName||' ('||pSysName||')');
  end if;

  -- ��������� �� ������� �� ��� ����� ��������� ���. ������� - ������ �� ������.
  begin
    select	1
    into	pChk
    from	fdc_Object_Type_Lst
    where	upper(SysName) = upper(pSysName);
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.abort('������ ������ �� ���������� ����� ���� '||pSysName, 1);
  end;
  -- ������� - ������ �� ������.
  if pChk > 0 then 
     return;
  end if;
  
  -- ������������ ����� �������
  ppTableName := upper(Trim(pTableName));
  
  --�������� ���������� ��� ������� � �� ��������
  begin
    select Name, Descript
    into pName, pDescript
    from fdc_Table
    where TableName = ppTableName;
  exception when others then 
     fdc_Util.Abort('������ ����������� ������� ������� ������ '||ppTableName, 1);
  end;

  -- ��������� ������������ ������� 
  -- ��� ��, �� ������� ��������� ��������� ���� �������������� �������, 
  -- ��� ��������������� fdc_Object
  pParentTableName := fdc_Table_Get_BaseTableName(ppTableName);
  
  -- �����: pParentTableName
  --     ���� NULL (��� ������� fdc_Object), 
  --     ���� ��� ����������������� ��������, 
  --     ���� 'FDC_OBJECT'
  if pParentTableName is null then
    Fdc_Util.Abort('��������� fdc_Object_Type_Register �� ������������� ��� ����������� ���� �� ������� fdc_Object');   
  end if;  

  -- ����������� ������������� ����
  begin
    -- ����� ��������� ��� ��������� ��� �� ������ �������� ���� � ��������� ��������
    -- (� � ������ ��� ��� ������������ ��� ��������������� ����),
    -- ��� �������� �������� �������� ������ ��� ��������� ���� ������������ ������� pParentTableName 
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
      Fdc_Util.Abort('�� ������ ������������ ��� ��� ������� '||ppTableName||' - parent table '||pParentTableName);
  	when others then 
      fdc_util.abort('������ ����������� ������������� ���� ��� ������� '||ppTableName||' - parent table '||pParentTableName, 1);
  end;

  -- ������ - �� �������, � ����������� �� ����, ��� ���: ������� ��� �������
  if pSysName = 'Event' or fdc_Object_Type_Is_Subtype(Fdc_Object_Get_Sysname(pParentObjectTypeID), 'Event', 0) = 1 then
    -- ��� ������� - ������ ����������� ����
    pObjectTypeID := fdc_Event_Type_Add('EventType', pName, pSysName, pName, ppTableName, 
                                        null, pParentObjectTypeID, pDescript);
                          
    -- �������� ���������� ��������� �������� �������� ����� ����                                    
    Set_Object_Type_DelProc(pObjectTypeID);                                    
  else
    -- ��� �������� - ����������� ���� � ��������� �������� ����� �� fdc_Object 
    -- �������� ���������� ����
    pObjectTypeID := fdc_Object_Type_Add('ObjectType', pName, pSysName, pName, ppTableName,
                                          null, null, pParentObjectTypeID, 1, pDescript);
                                          
    -- �������� ���������� ��������� �������� �������� ����� ����                                    
    Set_Object_Type_DelProc(pObjectTypeID);                                       
                                          
    -- ���� ������������ ������� - fdc_Object, �� ����� ��������� ������� ���� � �� � � fdc_Column
    if (pParentTableName = 'FDC_OBJECT') then
      -- ������� - ������� foreign �� ���� ID, ���� �� ���� (�� ������ ������)
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
      
      -- � ������ - �������� �������� �����
      pConstraint := substr(ppTableName,5,27)||'_ID';
      pSQL := 'alter table '||ppTableName||' add constraint '||pConstraint||
              ' foreign key (ID) references fdc_Object on delete cascade';
      begin
        execute immediate pSQL;
      exception when others then fdc_Util.Abort('������ �������� �������� �����', 1);
      end;
      -- � �������� ���������� � ������� fdc_Column
      fdc_Column_Upd_FK(ppTableName, 'ID', 'FDC_OBJECT', 'ID', pConstraint);
    end if; -- pParentTableName = 'FDC_OBJECT'
  end if;   -- pSysName = 'Event' or fdc_Object_Type_Is_Subtype(pSysName, 'Event', 0) = 1

end Object_Type_Register_By_Table;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Additional_Type_Register
-- ����������� �������������� ��������� ����� ���� �������
-- ����� �������������� ����, �������� � ���� �������, �� �� ������������������� �� Erwin 
-- (���������� ���� ����� �� ���� ��� �� ������)
-- !!!�������� ��� commit
procedure Additional_Type_Register is
  pNewID number;
begin
  -- �������
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '������� �������� �������',
                                 psysname => 'EventAdd',
                                 pshortname => '������� �������� �������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '����������� ��� ������� ��� ����������� �������� ��������');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID); 
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '������� �������� �������',
                                 psysname => 'EventDel',
                                 pshortname => '������� �������� �������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '����������� ��� ������� ��� ����������� �������� ��������');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '������� ��������� �������',
                                 psysname => 'EventUpd',
                                 pshortname => '������� ��������� �������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '����������� ��� ������� ��� ����������� ��������� ��������');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '������� ������� ��������',
                                 psysname => 'EventMerge',
                                 pshortname => '������� ������� ��������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '����������� ��� ������� ��� ����������� ������� ��������');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '������� ��������� ���� �������',
                                 psysname => 'EventAccessUpd',
                                 pshortname => '��������� ���� �������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '����������� ��� ������� ��� ����������� ��������� ���� �������');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                               
                                 
  pNewID := fdc_event_type_add(  pobject_type_sysname => 'EventType',
                                 pname => '��������� ��������� ����������� �� ���������',
                                 psysname => 'EventGenNotifications',
                                 pshortname => '��������� ����������� �� ���������',
                                 pTableName => null,
                                 picon => null,
                                 pparent_event_type_id => Fdc_Object_Type_Get_Bysysname('Event'),
                                 pdescript => '������� ��������� ����������� �� ���������. ���������, ����� ��������� ������������ ����� ������� � ��������� �������� � ���������� �����������.');
                                 
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                               

  
  -- �����������                              
  pNewID := fdc_object_type_add('ObjectType', '������������ � ��������� ����������� ���',
                                'Dict.LegalNameAcro', '������������ � ��������� ����������� ���',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                '������������ � ��������� ����������� ���, ��������, OOO, ��� � ������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '��� �������� ������������ ��� ������� � �������',
                                'Dict.AccessAction', '��� �������� ������������',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                '��� ����������� �������� ������������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '��������������-�������� ����� ������������ ����',
                                'Dict.OKOPF', '��������������-�������� �����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                '��������������-�������� ����� ������������ ����, �������������� �� ����������� ����� �����������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '������ ���� �� ����',
                                'Dict.OKSM', '������',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Dict'), 1,
                                '������ ���� �� ����������� ���� �����������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);
                                

  -- ��������                              
  pNewID := fdc_object_type_add('ObjectType', '�������� ��������',
                                'ValueNumber', '�����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                '��������� ���� "��������" ��� �������� ��������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '�������� �� / ���',
                                'ValueBool', '�� / ���',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                '��������� ���� "��������" ��� �������� ����������� ����');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '��������� ��������',
                                'ValueString', '�����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                '��������� ���� "��������" ��� ��������� ��������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '�������� ���� � �������',
                                'ValueDateTime', '���� � �����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                '��������� ���� "��������" ��� �������� ���� � �������');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                              
                                
  pNewID := fdc_object_type_add('ObjectType', '�������� ������',
                                'ValueRef', '������',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Value'), 1,
                                '��������� ���� "��������" ��� ������ ����-��-������. �������� ���������� �������� ��������� �� ������ � ��������������� ref_object_ID');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', '�������� ������ �� ����',
                                'ValueRefFile', '������ �� ����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('ValueRef'), 1,
                                '��������� ���� "�������� ������", ��� � �������� ���������� ������� ��������� ������ ���� ����');
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID); 
                                

  -- ��������                              
  pNewID := fdc_object_type_add('ObjectType', '�������',
                                'Contact', '�������',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Object'), 1,
                                '���������� ���������� ��� ����-���� (��� ����-����)');

  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                 
                                
  pNewID := fdc_object_type_add('ObjectType', '�������',
                                'Phone', '���',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                '��������� ���� "�������" ��� ������� ���������');  
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', '��������',
                                'Fax', '����',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                '��������� ���� "�������" ��� ������� ������');             
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                               
                                
  pNewID := fdc_object_type_add('ObjectType', '����� ����������� �����',
                                'Email', 'Email',
                                null, null, null, Fdc_Object_Type_Get_Bysysname('Contact'), 1,
                                '��������� ���� "�������" ��� ������� ����������� �����');    
                                
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID); 
                                

  -- ������
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => '������ ����������',
                                  psysname => 'SessionDispatch',
                                  pshortname => '������ ����������',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => '������� ����������. ����������, ����� �������� ���� ���������. ��� ����������� �� ���������� � ����������� �� ��������� ��������� Dispatch.DispatchInterval');                              
                                  
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID); 
                                  
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => '��������� ����������� �� ���������',
                                  psysname => 'SessionGenNotifications',
                                  pshortname => '��������� ����������� �� ���������',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => '������ ��������� ����������� �� ���������. ������������� ����� �������, ��������� �� �� ������� ���������� �������� � ���������� ����������� ���������.');                              
                                  
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                 
                                  
  pNewID := fdc_object_type_add(pobject_type_sysname => 'ObjectType',
                                  pname => '��������� ����� ���������� ��������',
                                  psysname => 'SessionSubscriptionCheck',
                                  pshortname => '������������ ��������',
                                  ptablename => null,
                                  picon => null,
                                  pstate_scheme_id => null,
                                  pparent_object_type_id => Fdc_Object_Type_Get_Bysysname('Session'),
                                  pobjecttableinstance => 1,
                                  pdescript => '��������� ����� ������������ �������� � ����������� �� �� ������� ������ � ���������');                              
                                  
  -- �������� ���������� ��������� �������� �������� ����� ����                                    
  Set_Object_Type_DelProc(pNewID);                                 
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ��������� ������������� ������
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ������������� ����������� ��� ���������������� �������� �����
-- ����������� �����, ������������ ������� ����������
-- !!!�������� ��� commit
procedure Init_Service_Data is
  pAdminTask_ID number;
  pAdminData_ID number;
  pOwner_ID number;
  pNewID number;
begin
  -------------------------------------------------
  -- ����������� ������ �������������
  pAdminTask_ID := Fdc_User_Group_Add('UserGroup', 
                     '������������� ���� �������������', 
                     'AdminTask', 
                     '������������� ����', 
                     '������������, ���������� � ������ ������, ����� ���������� �� ���������� ������������, ��������, �������� ������������� � ����� �������������, � ����� �� ������ ���� ������������� �� ������� �� �������� ���������� �������');
  pAdminData_ID := Fdc_User_Group_Add('UserGroup', 
                     '������������� ������', 
                     'AdminData', 
                     '������������� ������', 
                     '������������, ���������� � ������ ������, ����� �������������� ������ �� ���� ���������� �������� ������� � ���������� �� ���������� ������� ������� �� ��� ���������� �������');

  -------------------------------------------------
  -- �������� ����� ��� ���������������� ������������ (������ ����������)                    
  -- SysName ��� ������� ���������� ����� ������������� ��� ��������� ����������� ���������� � ����� �����                       
  pOwner_ID := fdc_User_Add('User', fdc_Util.Schema, '������ ����������', '', '', '������ ����������', 
                         '�������� ������������ - �������� ����� ����������, �������� ��������������� ������� � �������');                   
  Fdc_Object_Upd_Sysname(pOwner_ID, 'SchemaOwner');                      
  Fdc_User_In_Group_Add(pOwner_ID, pAdminTask_ID);                       
  Fdc_User_In_Group_Add(pOwner_ID, pAdminData_ID);     
  
  -------------------------------------------------
  -- ��������� ���������
  pNewID := fdc_ValueString_Add ('ValueString', '������ �������',
                            'Version', 1, null,
                            '1.1.1.1', '������ �������',
                            '������� ������ ��������� ����� �������. ������� �� 4 ���� ����������� �������)');                
  pNewID := fdc_ValueBool_Add ('ValueBool', '������� ��������� � �������� ����� ������',
                           'VersionMigrate', 1, null,
                            0, '���� ����� ������ �������',
                           '������� ����, ��� ������� ��������� � �������� ����� ������ (patch, update): 0 - �� ���������, 1 - ���� ����� ������');                
  pNewID := fdc_valuebool_add('ValueBool', '��������� �������',
                           'Dispatch.DispatchIsActive', 1, null,
                            0, '��������� �������', 
                           '1: ��������� �������������� � �������� ���������� �������, ���� ���������� �� ������ �������������� ���������; 0: ��������� ���� �� ������� ����������');
  pNewID := fdc_valuenumber_add('ValueNumber', '�������� ����������� ����������',
                           'Dispatch.DispatchInterval', 1, null,
                            1, '�������� ����������� ����������',
                           '�������� ����������� ����������. �������� � �������');                                  
  pNewID := fdc_valuenumber_add('ValueNumber', '������������ ���������� ������ ��� ������� ������� ������',
                           'Dispatch.MaxErrorsStartingSession', 1, null,
                           10, '������������ ���������� ������ �������',
                           '������������ ���������� ������ ��� ������� ������, ����� ������� ��������� ���������� ������� ��������� ������.'); 
  pNewID := fdc_valuenumber_add('ValueNumber', '������������ ���������� ����������� ���������� ������',
                           'Dispatch.MaxSessions', 1, null,
                           6, '������������ ���������� ����������� ���������� ������',
                           '������������ ���������� ������, ����������� ����������� ������������.');                                  
  pNewID := fdc_valuenumber_add('ValueNumber', '�������� ��������� ����� ���������� ��������',
                           'Dispatch.SubscriptionCheckInterval', 1, null,
                           120, '�������� ��������� ����� ���������� ��������',
                           '�������� ������� ������ ��������� ����� ���������� ��������. �������� � �������');  
  pNewID := fdc_valuenumber_add('ValueNumber', '����������� �������� ��������� ����������� �� ���������',
                           'Dispatch.GenNotificationsMinInterval', 1, null,
                           30, '����������� �������� ��������� ����������� �� ���������',
                           '����������� �������� ��������� ����������� �� ���������. �������� � �������');                                  
                                    
  -------------------------------------------------
  -- �������� ���������� �����������                                  
  pNewID := fdc_dict_add('Dict.AccessAction', null, '�������� ��������', '�������� ��������', null, null, '���������� ������� �������� �������� � ���������� ����������');                         
  Fdc_Object_Upd_Sysname(pNewID, 'Dict_AccessAction_Open');
  
  -------------------------------------------------
  -- ����� ��������� ��� ������
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
                                     pname => '��������� �������� ��������� ������',
                                     pshortname => null,
                                     pdescript => '����� ��������� ��� �������� ��������� ������');
    SessionStateCreated_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => '������ ����������� � ������� ������ ������',
                                                        psysname => 'SessionStateCreated',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateProgress_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => '� �������� ������',
                                                        psysname => 'SessionStateProgress',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 1,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateSuccess_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => '������� ��������',
                                                        psysname => 'SessionStateSuccess',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 1,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateError_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => '�������� �� ������',
                                                        psysname => 'SessionStateError',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 0,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null);                                 
    SessionStateHung_ID := fdc_state_add(pobject_type_sysname => 'State',
                                                        pname => '�� ��������, ������������� ��������',
                                                        psysname => 'SessionStateHung',
                                                        pstate_scheme_id => pScheme_ID,
                                                        pactive => 0,
                                                        pallowupdates => 0,
                                                        pallowdelete => 1,
                                                        pcolor => 16777215,
                                                        pshortname => null,
                                                        pdescript => null); 
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '���������������� ������',
                                      psysname => 'SessionTransitCreate',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => null,
                                      pdst_state_id => SessionStateCreated_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '������ ������ ������',
                                      psysname => 'SessionTransitStart',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateCreated_ID,
                                      pdst_state_id => SessionStateProgress_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '��������� ���������',
                                      psysname => 'SessionTransitFinish',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateSuccess_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '��������� ��������� �� ������',
                                      psysname => 'SessionTransitError',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateError_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '�������� ��� "��������"',
                                      psysname => 'SessionTransitCheckHung',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateProgress_ID,
                                      pdst_state_id => SessionStateHung_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '�������� ��� "��������"',
                                      psysname => 'SessionTransitCheckHung',
                                      pstate_scheme_id => pScheme_ID,
                                      psrc_state_id => SessionStateCreated_ID,
                                      pdst_state_id => SessionStateHung_ID,
                                      pbefore_procedure_id => null,
                                      pafter_procedure_id => null,
                                      pshortname => null,
                                      pdescript => null);                                                                                      
    pTransit_ID := fdc_state_transit_add(pobject_type_sysname => 'StateTransit',
                                      pname => '��������� ��������� �� ������',
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
-- ������������� ����������� ��� ���������������� �������� �����
-- � ����������� ��������� - � ����� �������
-- ��� ������������� ��������� �������������
-- ������� ������������ ����� �����:
-- 1. ��������� ����� �� Erwin (�������, �������, �����)
-- 2. �������� ��������� ��������, ������� � �������������
-- 3. ����������� ����� �� ������������ �������� (post-schema � post_table �������� � Erwin)
-- 4. ����������� �������������� ����� (Additional_Type_Register)
-- 5. ��� ��������� ������������� ����������� ������ � ���������� 
-- !!!�������� ��� commit
procedure Primary_Init is
begin
  Init_Service_Data;
  Server_Component_Register_All;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ����������� ��� �������� � ����� �����
-- �������� fdc_File, ���� �� ������� ������������� ��� ��-�� ������� ���������� ������������
-- ��������������� ����������� ��� ���������������� ��������
-- recompile
procedure New_Location is
  pChk varchar2(1500);
begin
  -- ��������, ���� �� fdc_file?
  begin
    select table_name
    into pChk
    from user_Tables
    where table_name = 'FDC_FILE';
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_Util.Abort('������ ��������� ����� ������� FDC_FILE ��� �������� ������� � ����� �����', 1);
  end;
  
  -- ���� ������� fdc_file ��� - �� ��������
  if pChk is null then
    execute immediate 'create table FDC_FILE (ID NUMBER(15) not null, SOURCENAME VARCHAR2(1500) not null, BODY BLOB)';
    execute immediate 'comment on table FDC_FILE is ''������������ ��� �������� ��������� ������''';
    execute immediate 'alter table FDC_FILE add constraint FDC_FILE_PK primary key (ID)';
    execute immediate 'alter table FDC_FILE add constraint FILE_ID foreign key (ID) references FDC_OBJECT (ID) on delete cascade';
  end if;
  
  -- ��������� ��������
  dbms_output.put_line('------------------------------------------------------');
  dbms_output.put_line('��������� ��������. ����� - ������ ���������� ��������');
  recompile;
  dbms_output.put_line('------------------------------------------------------');
  
  -- �������� ������������ "������ ����������"
  update fdc_User 
     set LOGIN = fdc_Util.schema
     where ID = fdc_Object_Get_BySysName('User', 'SchemaOwner');
  commit; 
end;



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ��������� �������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ������������� ��������� �������� ���������
-- �� ���� �������� ������, ���������� � ��������� (��� ���������)
-- � SQL-������ �� ������ ���������
-- ��� ��������� - ���� ��������� ����
procedure Chk_Any_Violation
  (
  pViolationStr varchar2,           -- ��� ��������
  pViolationSQL varchar2            -- ������ �� ���������
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
    dbms_output.put_line('���������:');
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
-- ��������, ��� ��� ������������������ ������� ������������ � ��
procedure Chk_Tables_Not_Exist is
begin
  Chk_Any_Violation('��� ������������������ ������� ������������ � ��?',
                    'select upper(TableName) from fdc_Table '||
                    'minus '||
                    'select TABLE_NAME Tab from user_Tables t  ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Tables_Not_Registered
-- ��������, ��� ��� �������, ������������ � �����, ���������������� � fdc_Tables
procedure Chk_Tables_Not_Registered is
begin
  Chk_Any_Violation('��� ������� ���������������� � fdc_Tables?',
                    'select TABLE_NAME Tab from user_Tables t  '||
                    'minus '||
                    'select upper(TableName) from fdc_Table '||
                    'minus '||
                    'select ''PLAN_TABLE'' from dual ');
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Chk_Columns_Not_Exist
-- ��������, ��� ��� ������������������ ������� ������������ � ��
procedure Chk_Columns_Not_Exist is
begin
  Chk_Any_Violation('��� ������������������ ������� ������������ � ��?',
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
-- ��������, ��� ��� �������, ������������ � �����, ���������������� � fdc_Column
procedure Chk_Columns_Not_Registered is
begin
  Chk_Any_Violation('��� ������� ���������������� � fdc_Column?',
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
-- ��������, ��� ��� ������������������ ��������� ���������� ������������ � ��
procedure Chk_SysComp_Not_Exist is
begin
  Chk_Any_Violation('��� ������������������ ��������� ���������� ������������ � ��?',
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
-- ��������, ��� ��� ���������, ������� � ������������� 
-- ���������������� � ������� ��� ��������� �������
procedure Chk_SysComp_Not_Registered is
begin
  Chk_Any_Violation('��� ��������� ������� ����������������?',
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
-- ��������, ��� � �� ���������� ��� �� ����������� � Erwin ������� �����,
-- ����������� ������������ ����� (������) �� ������� fdc_Object
procedure Chk_Object_Child_Type_Foreigns is
begin
  Chk_Any_Violation('���� ��� ������� ����� �� FDC_OBJECT?',
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
-- �������� ��������� ���������, �� �������� � ������
procedure Chk_Syscomponent_No_Task is
begin
  Chk_Any_Violation('��������� ����������, �� �������� � ������?',
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
-- ���������������� ������ ���� ��������
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
--      ��������� ������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- ������� ���� ���������� ������
-- ����������� ����� ���������� ������ ��������� ���������� "������" �����,
-- ���������� ������ ����������� ����������
procedure Clear_Data 
is
  type TLogRec is record  
    (Moment date,
     Event varchar2(1500));       
  type TLog is table of TLogRec;
  pLog TLog := TLog();
  pCnt number;
  -- ��������� ��������� ����������������
  procedure Log_Add(pStr varchar2) is
  begin
    pLog.extend;
    pLog(pLog.last).Moment := sysdate;
    pLog(pLog.last).Event := pStr;
  end;  
  -- ��������� ��������� ���������������� ��������� ���������� ����
  procedure Log_Add_Ok is
  begin
    Log_Add('Ok');
  end;  
  -- ��������� ��������� ���������� ���������
  procedure Log_Output is
  begin
    for i in 1..pLog.Count loop
      dbms_output.put_line(to_char(pLog(i).Moment, 'HH24-MI-SS')||' '||pLog(i).Event);
    end loop;
  end;  
  
begin
  Log_Add ('�������� ������� �����');
  
  -- ��������, ��� ������� ������������ � ������ ��������� �����
  if user <> upper(fdc_Util.Schema) then
  	fdc_Util.Abort('�� �� �� �������� �����!');
  end if;
    
  -- ������� ����������
  Log_Add('������� ����������� ��������� ����������� ����������...');
  -- ����� ���������� �������� ����� �������� �����������, ��������:
  -- fdc_repmanager.stoplogging;
  Log_Add_Ok;
  commit;

  -- ���������� � fdc_Buffer ��������������� ��������� �����
  -- ���������� ������ �������� ���� � �� ����������!
  -- ������� ���, ����� �� ����������� ��� ����, � ���������� ������ ���� �������� ������
  -- � ������ ���������, ��� ��� ������������ � ���������� ����� ��������� ���
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

  -- ������ ������
  Log_Add('���������� ������� ������...');
  Disable_FKeys;
  Log_Add_Ok;
  
  -- ���������� ���������
  Log_Add('���������� ���������...');
  Disable_Triggers;
  Log_Add_Ok;
  
  -- Drop ������ ������
  Log_Add('�������� ������ ������...');
  for rec in (select table_name from user_tables
              minus
              select upper(tablename) from Fdc_Column
              minus
              select table_name from user_tables
              where table_name like 'PLSQL_PROFILER_%') loop
    execute immediate 'drop table '||rec.table_name||' cascade constraints';
  end loop;
  Log_Add_Ok;
  
  -- ������� ����������� ������
  -- ����� ���, ��� �������� ������������
  Log_Add('������� ����������� ������...');
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

  -- ������� ��������� ������
  -- ���������� ������ ������� ��� �������� ����� � �� �����������!
  Log_Add('������� ��������� ������...');
  for rec in (
  	select	distinct T.TableName
  	from	fdc_Object_Type T,
          fdc_Buffer B
    where B.ID = T.ID) loop
    Log_Add('    Truncate '||rec.TableName||'...');   
	  execute immediate 'truncate table '||rec.TableName;
 	end loop;
  Log_Add_Ok;

  -- �������� ������� �� ������� �������� � ��������� � ��� ������
  -- ���������� ������ ������ �� ��������������� �����
  Log_Add('�������� ������� �� ������� �������� � ��������� � ��� ������...');
  for rec in (
  	select	distinct B.ID, T.SYSNAME
  	from	fdc_Object_Type T,
          fdc_Buffer B
    where B.ID = T.ID) loop
    Log_Add('    Delete '||rec.SysName||'...');   
    -- �������� ���������������� ��������� �������
  	delete from	fdc_User_Grant G
  	where Object_ID in
     (select ID
  		from	fdc_Object
  		where	Object_Type_ID = rec.ID);

    -- �������� ��������� ��������� �������
  	delete from	fdc_User_Group_Grant G
  	where Object_ID in
     (select ID
  		from	fdc_Object
  		where	Object_Type_ID = rec.ID);

    -- �������� ��������
  	delete from fdc_Object
  	where Object_Type_ID = rec.ID;
    pCnt := sql%rowcount;
  	commit;
  	Log_Add('    Deleted '||rec.SysName||': '||pCnt);
 	end loop;
  Log_Add_Ok;

  -- ��������� ������� ������
  Log_Add('��������� ������� ������...');
  Enable_FKeys;
  Log_Add_Ok;
  
  -- ��������� ���������
  Log_Add('��������� ���������...');
  Enable_Triggers;
  Log_Add_Ok;

  -- ����������, ���������� ���������
  delete from fdc_Buffer;
  commit;
  Log_Add('������� ������� ���������!');
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
--      ������������� ��������� ������������ ����� ��
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Recompile
-- �������������� (���������) �������� �����
-- ������ (����� dbms_output) ������ ��������, ������� �� ������� ������������
procedure Recompile
  (
  p_recompile_All boolean := false   -- �������, ����������������� ��� ��� ������ ���������� �������
                                     -- �� ��������� (false) - ������ ����������
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
    /* ������� ���������� ���������� �������� */
    SELECT COUNT(*)
      INTO bad_count
      FROM user_objects
     WHERE status = 'INVALID';
    /* ����� �� ����� ����� �� ��������� ���������� ��������
       ��� ���������� �������� ���������� �����������, ��
       ������������ ��������� ������
     */
    EXIT WHEN  bad_count = last_bad_count OR bad_count = 0;
    /* ���������� ����� ���������� �������� */
    last_bad_count := bad_count;
    FOR bad IN bad_objects LOOP
      BEGIN
      	dbms_sql.parse(cursor_name, bad.compile_string, dbms_sql.native);
        -- ret_val := dbms_sql.execute(cursor_name);
        /* exception ���������, �.�. �� ������ ORACLE8 ���� ���������� ���������
           � �������� ��������� ���������� � ��������� ������������.
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
-- �������� ��� ��������� ����������� ������ �� ������� Oracle
procedure SessionTrace
	(
	pSwitchOn boolean := true             -- �������� ��� ��������� �����������:
                                        -- true - ��������, false - ���������
	)
is
begin
  DBMS_SESSION.SET_SQL_TRACE(pSwitchOn);
end SessionTrace;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Drop_All_Synonyms
-- �������� ���� ��������� (����� �������������� � �������� �����������)
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
        dbms_output.put_Line('������� '|| rec.synonym_Name|| ' �� ����� ���� ������: '||sqlerrm);
    end;
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Drop_All_Jobs
-- �������� ���� job-�� (����� �������������� � �������� �����������)
procedure Drop_All_Jobs is
begin
  for rec in (select Job from user_jobs) loop
    begin
      dbms_job.remove(rec.job);
    exception
      when others then
        dbms_output.put_Line('������� (job) '|| rec.Job|| ' �� ����� ���� �������: '||sqlerrm);
    end;
  end loop;
  commit;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Analyze_Table
-- ������������� ������� ������ � ���������
procedure Analyze_Table
  (
  pTableName varchar2    -- ��� �������, ������� ���� ����������������
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
-- ������������� ��� �����
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
-- ����������� ��� �������
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
-- ��������� ��� ������� �����
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
-- �������� ��� ������� �����
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
-- ��������� ��� ��������
procedure Disable_Triggers as
begin
  for CC in (select * from user_triggers) loop
  		execute immediate 'alter trigger '||CC.Trigger_Name||' disable';
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Enable_Triggers
-- ��������� ��� ��������
procedure Enable_Triggers as
begin
  for CC in (select * from user_triggers) loop
  		execute immediate 'alter trigger '||CC.Trigger_Name||' enable';
  end loop;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Set_Object_Type_DelProc
-- ������������� ��������� �������� ��� �������� ����
-- ���� ��������� ��� ��������� �� ������ ��� null, �� ��������
-- ��������� ��� ��������� �������� �������������, ���
-- "<��� ������� ����>_del"
-- �������� pDoRaise ���������� ��������� �� ����������, ���� ��� �� ���
-- ���� �� ����� 0, �� ���������. �� ��������� �� ���������.
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
  -- ���������� ������� � �������� ��������� �������� ����
  begin
    select TableName, Del_Procedure_ID
       into ppTableName, ppDelProcID 
      from fdc_Object_Type_Lst 
     where ID = pTypeID;
  exception
 	   when NO_DATA_FOUND then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('�� ������ ��� �� ID = '||pTypeID);
         else
           return;
        end if;     
  	when others then 
        if (pDoRaise <> 0) then
           fdc_util.Abort('������ ��������� �������� ���� �� ID = '||pTypeID, 1);
         else
           return;
        end if;  
  end;
  
  -- ���������� ��� ��������� ��������
  if (pProcSysName is null) then
     if (ppTableName is null) then
        if (pDoRaise <> 0) then
           fdc_util.Abort('�� ������ ������� ���� � ID = '||pTypeID);
         else
           return;
        end if;   
      else
        ppProcSysName := trim(ppTableName) || '_Del';
     end if;
   else
     ppProcSysName := pProcSysName;  
  end if;   
  
  -- ���� ID ����� ��������� ��������
  begin
    ppNewDelProcID := fdc_Object_Get_BySysName('Procedure', ppProcSysName, 1);
  exception
    when others then
      if (pDoRaise <> 0) then
         fdc_util.Abort('������ ��������� ��������� �������� ' ||ppProcSysName, 1);
       else
         return;
      end if;
  end;
  
  -- ���� �����, �� �������� ��������� �������� ����
  if (NVL(ppDelProcID, -1) <> ppNewDelProcID) then
     begin
       update fdc_Object_Type
          set Del_Procedure_ID = ppNewDelProcID
        where ID = pTypeID;
     exception
       when others then
         if (pDoRaise <> 0) then
            fdc_util.Abort('������ ��������� ��������� �������� ���� � ID =  ' ||pTypeID, 1);   
         end if;   
     end; 
  end if;   
end;  

end fdc_Service;
/
