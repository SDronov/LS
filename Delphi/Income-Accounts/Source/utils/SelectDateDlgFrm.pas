unit SelectDateDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TSelectDateDlgForm = class(TfdcCustomDlgForm)
    edtDate: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
  private
    { Private declarations }
    function GetDate: TDateTime;
    procedure SetDate(const Value: TDateTime);
  public
    { Public declarations }
    property Date : TDateTime read GetDate write SetDate;
  end;

var
  SelectDateDlgForm: TSelectDateDlgForm;

implementation

{$R *.dfm}

{ TSelectDateDlgForm }

function TSelectDateDlgForm.GetDate: TDateTime;
begin
  Result := edtDate.Date;
end;

procedure TSelectDateDlgForm.SetDate(const Value: TDateTime);
begin
  edtDate.Date := Value;
end;

end.
