create or replace procedure fdc_Object_Free
-- ����������� ��������� �������� ���������� ������� ������������� ����
-- � ����������� �� ���� ������� �������� ���������� ��������� ��������,
-- ������������������ ��� ������� ����
-- ��������� ����� ���������� ��� � �������, ��� � � ���� ������ ��������� ��������
	(
	pID number,                     -- ������������� ���������� �������
	pDoLog number := 1              -- ���������� �� ������� �������� ������� 
                                  -- (��������� �� Event?)
                                  -- �� ��������� ���������� (�������� 1)
                                  -- ��� �������� 0 ���������� �� ����
	)
is
  pTypeID		number(15);
  pNoObject boolean := false;
  pDelProcID	number(15);

  pTableName	varchar2(1500);
  pParTableName	varchar2(1500);
  pDelProc	varchar(1500);
  pParTypeID	number(15);
begin
  -- ��������� ���� ������� ��� �������
  -- ������� ������ � ��������
  begin
    select O.OBJECT_TYPE_ID
    into pTypeID
    from fdc_Object O
    where ID = pID;
  exception
	  when NO_DATA_FOUND then null;
  	when others then fdc_util.Abort('������ ��������� ���� ���������� ������� �� ID='||pID, 1);
  end;
  
  -- ���� � �������� �� ����� - ���� � ��������
  if pTypeID is null then
    begin
      select E.Event_Type_Id
      into pTypeID
      from fdc_Event E
      where ID = pID;
    exception
  	  when NO_DATA_FOUND then fdc_util.Abort('��������� ������ (��� �������) �� ID='||pID||' �� ������!', 0);
    	when others then fdc_util.Abort('������ ��������� ���� ���������� ������� �� ID='||pID, 1);
    end;
  end if;  

  -- ��������� ��������� �� ��������� ��������
  begin
    select T.DEL_PROCEDURE_ID
    into pDelProcID
    from fdc_Object_Type T
    where ID = pTypeID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('��� ���������� ������� (��� �������) �� ID='||pTypeID||' �� ������!', 0);
  	when others then fdc_util.Abort('������ ������ ���� ���������� ������� �� ID='||pTypeID, 1);
  end;
  
  -- ���� ��������� �������� �� ������ - �������� free �� �����!
  if pDelProcID is null then
    fdc_Util.Abort('��� ���� '||Fdc_Object_Get_Name(pTypeID)||' �� ������ ��������� ��������!', 0);
  end if;
  
  -- ��������� ���������� ����� ��������� ��������
  begin
  pDelProc := fdc_Object_Get_SysName(pDelProcID);
  exception when others then 
    fdc_Util.Abort('������ ��������� ���������� ����� ��������� �������� �� ID='||pDelProcID||' ��� ���� '||Fdc_Object_Get_Name(pTypeID), 1);
  end;
  
  -- ���� sysname ������ - ���� ������ �� ������
  if trim(pDelProc) is null then
  	fdc_Util.Abort('������ ��������� ��� ��������� �������� �� ID='||pDelProcID||' ��� ���� '||Fdc_Object_Get_Name(pTypeID), 0);
  end if;
  
  -- ���������� ����� ��������� ��������
  execute immediate 'begin '||pDelProc||'('||pID||', '||pDoLog||'); end;';
end fdc_Object_Free;
/
