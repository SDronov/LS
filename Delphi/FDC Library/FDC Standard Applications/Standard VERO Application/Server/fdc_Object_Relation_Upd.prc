create or replace procedure fdc_Object_Relation_Upd
-- �������� ��������� ����� ���������
	(
    pID number,                     -- ������������� ��������� 
    pName varchar2,                 -- ��������
	  pObject_ID number,              -- ������������� ������� 
    pRel_Object_Id number,          -- ������������� �������, � ������� ��������������� ���������
    pRole varchar2,                 -- ����
    pBackwardRole varchar2,         -- �������� ����
    pShortName varchar2,            -- �������� ��������
	  pDescript	varchar2              -- ��������
  )  
is
  pNewID number;
begin
  -- ����� ������� ��������� ��������� �������
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- �������� Fdc_Object_Relation  
  update Fdc_Object_Relation
     set Object_ID = pObject_ID,
         Rel_Object_ID = pRel_Object_ID,
         Role = pRole,
         BackwardRole = pBackwardRole
   where ID = pID;  
  
end fdc_Object_Relation_Upd;
/
