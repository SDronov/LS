{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: ObjectGridFrm.pas $
  $Revision: 7184 $
  $Author: FORS\anaumenkov $
  $Date: 2009-07-08 01:13:16 +0400 (Ср, 08 июл 2009) $
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
  cxRadioGroup, Menus;

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
