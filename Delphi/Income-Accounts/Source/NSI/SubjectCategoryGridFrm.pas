{
  Copyright c Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 1683 $
  $Author: alexvolo $
  $Date: 2006-05-24 15:09:32 +0400 (Ср, 24 май 2006) $
}

unit SubjectCategoryGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DictGridFrm, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, FDCCustomDataset,
  fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar;

type
  TSubjectCategoryGridForm = class(TDictGridForm)
    dxBarButton1: TdxBarButton;
    acImport: TAction;
    procedure acImportExecute(Sender: TObject);
  private
  public
  end;

var
  SubjectCategoryGridForm: TSubjectCategoryGridForm;

implementation

uses
  IaccLoader;

{$R *.dfm}

procedure TSubjectCategoryGridForm.acImportExecute(Sender: TObject);
begin
//  LoadNsiDict(Self);
end;

initialization
  RegisterClass(TSubjectCategoryGridForm);

end.
