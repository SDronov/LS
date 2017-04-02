unit DeclTempAdmStopHistFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, cxSplitter, cxMemo, cxDBEdit;

type
  TDeclTempAdmStopHistForm = class(TfdcCustomGridForm)
    dsDataDATE_SET: TDateTimeField;
    dsDataDATE_CANCEL: TDateTimeField;
    dsDataREASON_SET: TStringField;
    dsDataREASON_CANCEL: TStringField;
    colDateStop: TcxGridDBBandedColumn;
    colReasonStop: TcxGridDBBandedColumn;
    colDateProlong: TcxGridDBBandedColumn;
    colReasonProlong: TcxGridDBBandedColumn;
    dxLayoutControl1: TdxLayoutControl;
    cxSplitter1: TcxSplitter;
    cxButton1: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxDBMemo1: TcxDBMemo;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBMemo2: TcxDBMemo;
    dxLayoutControl1Item2: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TDeclTempAdmStopHistForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TDeclTempAdmStopHistForm);

end.
