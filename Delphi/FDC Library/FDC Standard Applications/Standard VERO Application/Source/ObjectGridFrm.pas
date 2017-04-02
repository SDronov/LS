{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: ObjectGridFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit ObjectGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, FDCQuery, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxLayoutControl, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar,
  fdcParamsHolder, cxGridBandedTableView, cxGridDBBandedTableView,
  cxRadioGroup;

type
  TObjectGridForm = class(TfdcCustomObjectGridForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjectGridForm: TObjectGridForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TObjectGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
end;

initialization
  RegisterClass(TObjectGridForm);
  
end.
