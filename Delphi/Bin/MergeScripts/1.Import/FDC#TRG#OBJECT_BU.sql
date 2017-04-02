create or replace
 TRIGGER FDC#TRG#OBJECT_BU
  
BEFORE UPDATE ON fdc_object
  
FOR EACH ROW
 
-- Запретим сброс альтернативного ключа

when ( (New.Ext_id IS NULL and Old.Ext_id is not null) OR
 
     (New.Ext_Source IS NULL and Old.Ext_Source is not null) OR

     (New.Ext_TypeSysName IS NULL and Old.Ext_TypeSysName is not null))

BEGIN
  
  fdc_util.Abort('Удаление альтернативного ключа объекта запрещено!');

/*  :NEW.Ext_Id          := :OLD.Ext_Id;
  :NEW.Ext_Source      := :OLD.Ext_Source;
  :NEW.Ext_TypeSysName := :OLD.Ext_TypeSysName;*/

END FDC#TRG#OBJECT_BU;
/

exit