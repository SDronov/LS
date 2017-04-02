{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 12254 $
  $Author: anaumenkov $
  $Date: 2011-01-18 22:32:29 +0400 (Вт, 18 янв 2011) $
}
                                                                         
unit SubjectCategoryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NSIDictFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls;

type
  TSubjectCategoryForm = class(TNSIDictForm)
  private
  protected
    function IsReadOnly: Boolean; override;
  public
  end;

var
  SubjectCategoryForm: TSubjectCategoryForm;

implementation

{$R *.dfm}

{ TSubjectCategoryForm }

function TSubjectCategoryForm.IsReadOnly: Boolean;
begin
  Result := False;
end;

initialization
  RegisterClass(TSubjectCategoryForm);
  
end.
