unit fdcObjectsReg;

interface                                                 

procedure Register;

implementation
                                     
uses fdcConsts, Classes, fdcObjectLinkEdit, DBReg, DesignIntf, cxEdit,
  fdcObjectLookupEdit;

procedure Register;
begin
  RegisterComponents(SCompanyComponentsPage, [TfdcObjectLinkEdit,
                      TfdcObjectLookupEdit]);

  RegisterPropertyEditor(TypeInfo(string), TfdcObjectLinkEditDataBinding,
    'DataKeyField', TDataFieldProperty);
end;

end.
