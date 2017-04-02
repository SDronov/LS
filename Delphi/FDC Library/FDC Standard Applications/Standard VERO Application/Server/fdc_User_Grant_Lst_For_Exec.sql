create or replace view fdc_User_Grant_Lst_For_Exec as
select	G.*,
	case
    -- ���� ��������� ������ ������� ��� ������������� � �� ������ ���� ������������ ����� �� 'select'
    when G.Object_Type in ('VIEW','TABLE') and (ToGrant > 0)
      then 'begin ' || 
           -- ���� ������������ ��� ���� ����� ����� � ������ ��� � � GrantOption, �� ������
           -- ������� ������� Revoke, ����� GrantOption ��������   
           case when (Granted = 2) then fdc_util.schema || '.fdc_Revoke(''select' ||
                       ''', ''' || fdc_util.schema || '.' || G.Object_Name || 
                       ''', ''' || G.Login || '''); ' else '' end ||    
           -- ������ ���� ����� �� 'select'  
           fdc_util.schema || '.fdc_Grant(''select' ||
                       ''', ''' || fdc_util.schema || '.' || G.Object_Name || 
                       ''', ''' || G.Login || '''' || 
           -- ���� ��������� GrantOption            
           case when ToGrant = 2 then ', 1' else '' end || '); end;'
    -- ���� ��������� ������ ������� ��� ������������� � �� ������ �������� � ������������ ����� �� 'select'           
		when G.Object_Type in ('VIEW','TABLE') and (ToGrant = 0)
      then 'begin ' || fdc_util.schema || '.fdc_Revoke(''select' ||
                       ''', ''' || fdc_util.schema || '.' || G.Object_Name || 
                       ''', ''' || G.Login || '''); end;'
    -- ���� ��������� ������ ���������, ������� ��� ����� � �� ������ ���� ������������ ����� �� 'execute'       
		when G.Object_Type in ('PROCEDURE','FUNCTION','PACKAGE') and (ToGrant > 0) 
      then 'begin ' || 
           -- ���� ������������ ��� ���� ����� ����� � ������ ��� � � GrantOption, �� ������
           -- ������� ������� Revoke, ����� GrantOption ��������       
           case when (Granted = 2) then fdc_util.schema || '.' ||
                -- FDC_REVOKE ������ ���������� ��������, ���� �� ������� �� ������
                case when G.Object_Name = 'FDC_REVOKE' then
                    'fdc_Revoke_to_Revoke(''execute'         
                  else
                    'fdc_Revoke(''execute'', ''' || fdc_util.schema || '.' || G.Object_Name end || 
                             ''', ''' || G.Login || '''); ' else '' end ||   
           -- ������ ���� ����� �� 'execute'
           fdc_util.schema || '.' || 
           -- FDC_GRANT ������ ���������� ��������, ���� �� ������� �� ������
           case when G.Object_Name = 'FDC_GRANT' then
               'fdc_Grant_to_Grant(''execute'         
            else
               'fdc_Grant(''execute'', ''' || fdc_util.schema || '.' || G.Object_Name end || 
                             ''', ''' || G.Login || '''' ||
           -- ���� ��������� GrantOption 
           case when (ToGrant = 2) then ', 1' else '' end || '); end;' 
    -- ���� ��������� ������ ���������, ������� ��� ����� � �� ������ �������� � ������������ ����� �� 'execute'        
		when G.Object_Type in ('PROCEDURE','FUNCTION','PACKAGE') and ToGrant = 0 
      then 'begin ' || fdc_util.schema || '.' || 
         -- FDC_REVOKE ������ ���������� ��������, ���� �� ������� �� ������
         case when G.Object_Name = 'FDC_REVOKE' then
             'fdc_Revoke_to_Revoke(''execute'         
           else
             'fdc_Revoke(''execute'', ''' || fdc_util.schema || '.' || G.Object_Name end || 
                             ''', ''' || G.Login || '''); end;'
	end as Cmd
from	(
	select O.Object_Name,
		     O.Object_Type,
		     U.Login,
		     U.AllowGrantOption,
		     fdc_Syscomponent_Is_Granted(fdc_util.schema,U.Login,O.Object_Name) Granted,
		     case when (fdc_Syscomponent_Is_ToGrant(U.Login,O.Object_Name) = 1) then
             case when (U.AllowGrantOption = 1) then 2 else 1 end
                 else 0 end ToGrant
	 from All_Objects O,
		    fdc_User U
	where O.Owner = upper(fdc_util.schema) and
        O.Object_Type in ('PROCEDURE','FUNCTION','PACKAGE','VIEW','TABLE') and
		    O.Object_Name not in ('FDC_FILE') and
		    upper(U.Login) <> user and
		    upper(U.Login) <> upper(fdc_util.schema)) G
where	Granted <> ToGrant;

