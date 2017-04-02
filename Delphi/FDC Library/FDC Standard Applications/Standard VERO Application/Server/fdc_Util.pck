create or replace package FDC_UTIL as
-- ����� ��������� ������� � ���������,
-- ������������ � ���� ��������� �������� � �������
-- �� ����������� � ������ ������ �� ������� �������� �� ���������, ������� � �������������
-- ����� �������� ����������� ������

--------------------------------------------------------------------------------------------------------------
-- Abort
-- ����������� ����������� ��������� �� ������
-- ����������� ��� ������������� ������ � � ������������ ������
procedure Abort (
	pMessage 	varchar2,       -- pMessage - ���������� ��������� �� ������
	pAddSQLErrM	number := 0,  -- pAddSQLErrM - �������� �� � ��������� ������� ������ �� ������� ��
  pCode number := null      -- pCode - ��� ��������� �� ������, �� ��������� -20001 ���� ��� ��������� ������
  );
  
--------------------------------------------------------------------------------------------------------------
-- Schema
-- �������� ����� ������ �������
function Schema return varchar2;

--------------------------------------------------------------------------------------------------------------
-- Exec
-- ������������ ���������� ������� ��� SQL-���������, ��� �����
procedure Exec
	(
	pSQL varchar2             -- ��������� ��� ������������� ����������
	);
  
end FDC_UTIL;
/
create or replace package body fdc_Util as

--------------------------------------------------------------------------------------------------------------
-- Foreign_Key_Message 
-- ������ ��������� �� �������� ����� () "� ������"
-- ����������� �� �� ���������� ����� ������, ��������� ������� ������
-- ���������� ��������������� ���������
function Foreign_Key_Message (	
  pConstraintName varchar2, -- ������������ �������� ����� � ��
	pDelete number := 1       -- ��������� �� ��������� �� ������ �������� ������������ ������
  )      
  return varchar2 is 
Result varchar2(4000);

pName	varchar2(4000);
pRName	varchar2(4000);
begin
  pName  := '?';
  pRName := '?';
  begin
    select case when PT.Name is null then C.Table_Name else PT.Name end as Name,
    	     case when RT.Name is null then CC.Table_Name else RT.Name end as RName
    into	pName,pRName
    from 	All_Constraints C,
    	    All_Constraints CC,
    	    fdc_Table PT,
          fdc_Table RT
    where	C.Owner = Schema and
    	    C.Constraint_Type = 'R' and
          C.Constraint_Name = pConstraintName and
          CC.Constraint_Name = C.R_Constraint_Name and
          CC.Owner = Schema and
          upper(PT.TableName(+)) = C.Table_Name and
    	    upper(RT.TableName(+)) = CC.Table_Name;
  exception when others then null;
  end;
  Result := '"'||pName||'" ��������� ��  "'||pRName||'".';
  if pDelete = 1 then
  	Result := '������ ������� ������ "'||pRName||'" �.�. ���������� ������ "'||pName||'", ������� �� ��� ���������.';
  end if;
  return Result;
end Foreign_Key_Message;

--------------------------------------------------------------------------------------------------------------
-- ConstraintNameBySQLErrm 
-- ��������� ����� �������� ����� �� ��������� �� ������ ��������� ����������� ORA-02292
function ConstraintNameBySQLErrm 
  (
  pSqlerrm  varchar2                          -- ��������� �� ������ ORA-02292
  )
return varchar2 is
  pSubstr varchar2(1500);
  pStartPos number;
  pStopPos number;
  Result varchar2(4000) := null;
begin
  -- ���������� ������������ �� ���, ��� � ������ ��������� �� ������ ��������� �����������
  -- ������������ ��������� ���� '(VERO.DICT_ID)', ��� 
  -- VERO - ��� ����� ����������,
  -- DICT_ID - ������������ �����
  pSubstr := '('||Schema||'.';
  -- ��������� ������� ������ ����� ����� � ������ ��������� �� ������
  pStartPos := instr(pSqlerrm,pSubstr);
  -- ���� ��� ��������� ���� '(<�����>.' - ������ � ��������� ��� � ����� �����, 
  -- ���������� null
  if pStartPos = 0 then 
    return null;
  end if;
  -- ������� ��������� ����� ����� � ������ ��������� �� ������
  -- (��� ������� ����������� ������)
  pStopPos := instr(pSqlerrm,')',pStartPos+length(pSubstr));
  -- ��������� ���������, ���������� ��� �����
  Result := substr(pSqlerrm,pStartPos+length(pSubstr),pStopPos - (pStartPos+length(pSubstr)));
  return Result;
end; 
  
  
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- Abort
-- ����������� ����������� ��������� �� ������
-- ����������� ��� ������������� ������ � � ������������ ������
procedure Abort (
	pMessage 	varchar2,       -- pMessage - ���������� ��������� �� ������
	pAddSQLErrM	number := 0,  -- pAddSQLErrM - �������� �� � ��������� ������� ������ �� ������� ��
                            -- 1 - ��������,
                            -- 0 - �� ��������
  pCode number := null      -- pCode - ��� ��������� �� ������, �� ��������� -20001 ���� ��� ��������� ������
  ) is
pMess	varchar2(4000);
pResCode	number := null;
pPref	varchar2(1500);
pConsName varchar2(1500);
begin
  pMess := pMessage;
  if sqlcode <> 0 then
    if pAddSQLErrM = 1 then
    	pMess := pMess ||chr(10)||sqlerrm;
      -- ��������� ��������� ��������� �����������
      if sqlcode = -2292 then
      	pMess :=  pMess||chr(10)||Foreign_Key_Message(ConstraintNameBySQLErrm(sqlerrm),1);
      end if;
    end if;
  end if; -- sqlcode <> 0 
  pResCode := nvl(pCode, -20201);
  Raise_application_error(pResCode,pMess);
end Abort;

--------------------------------------------------------------------------------------------------------------
-- Schema
-- �������� ����� ������ �������
function Schema return varchar2 is
begin
  return sys_context('USERENV', 'CURRENT_USER');
end;

--------------------------------------------------------------------------------------------------------------
-- Exec
-- ������������ ���������� ������� ��� SQL-���������, ��� �����
procedure Exec
	(
	pSQL varchar2             -- ��������� ��� ������������� ����������
	)
is
begin
  execute immediate pSQL;
exception 
  when others then 
    Abort('������ ������������� ���������� ���������'||chr(10)||pSQL||chr(10), 1);
end;

end FDC_UTIL;
/
