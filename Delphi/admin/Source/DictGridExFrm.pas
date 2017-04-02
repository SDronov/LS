{
  Copyright � Fors Development Center.
  All rights reserved.

  $Source$
  $Revision: 103 $
  $Author: alexvolo $
  $Date: 2005-08-05 14:47:44 +0400 (Пт, 05 авг 2005) $
}
unit DictGridExFrm;

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
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, Menus;

type
  TDictGridExForm = class(TDictGridForm)
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictGridExForm: TDictGridExForm;

implementation

{$R *.dfm}

procedure TDictGridExForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dsData.ParamByName('sysname').AsString := SearchTypeSysName;
end;

initialization
   RegisterClass(TDictGridExForm);

end.
