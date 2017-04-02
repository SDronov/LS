unit EventReportDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, cxGroupBox,
  cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxCheckBox;

type
  TEventReportDlgForm = class(TfdcCustomSimpleDlgForm)
    dxLayoutControl1Item1: TdxLayoutItem;
    rgReportType: TcxRadioGroup;
    edtDateFrom: TcxDateEdit;
    lciDateFrom: TdxLayoutItem;
    edtDateTo: TcxDateEdit;
    lciDateTo: TdxLayoutItem;
    cbUserStat: TcxCheckBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventReportDlgForm: TEventReportDlgForm;

implementation

{$R *.dfm}

procedure TEventReportDlgForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TEventReportDlgForm.FormDestroy(Sender: TObject);
begin
  inherited;
  EventReportDlgForm := nil;
end;

end.
