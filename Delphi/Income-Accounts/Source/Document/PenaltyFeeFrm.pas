unit PenaltyFeeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeels, dxLayoutLookAndFeels, ActnList, dxLayoutControl,
  StdCtrls, cxButtons, cxControls, DB, FDCCustomDataset, fdcQuery;

type
  TPenaltyFeeForm = class(TfdcCustomDlgForm)
    dxLayoutControl1Group1: TdxLayoutGroup;
    edtBeginDate: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    procedure actOkUpdate(Sender: TObject);
    procedure edtBeginDateExit(Sender: TObject);
    procedure edtEndDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    FBeginDate, FEndDate : TDateTime;
    procedure SetInitialBeginDate(Date : TDateTime);
    function AutoSaveLayout: Boolean; override;
  end;

var
  PenaltyFeeForm: TPenaltyFeeForm;

implementation

{$R *.dfm}

uses MainDm, DateUtils;

procedure TPenaltyFeeForm.actOkUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (edtBeginDate.Text <> '') and
                             (edtEndDate.Text <> '') and
                             (edtBeginDate.Date <= edtEndDate.Date);
end;

function TPenaltyFeeForm.AutoSaveLayout: Boolean;
begin
  Result := False;
end;

procedure TPenaltyFeeForm.edtBeginDateExit(Sender: TObject);
begin
  inherited;
  FBeginDate := edtBeginDate.Date;
end;

procedure TPenaltyFeeForm.edtEndDateExit(Sender: TObject);
begin
  inherited;
  FEndDate := edtEndDate.Date;
end;

procedure TPenaltyFeeForm.FormShow(Sender: TObject);
begin
  inherited;
  edtEndDate.Date := Today;
  FEndDate := Today;
end;

procedure TPenaltyFeeForm.SetInitialBeginDate(Date : TDateTime);
begin
  edtBeginDate.Date := Date;
  FBeginDate := Date;
end;


procedure TPenaltyFeeForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientHeight := dxLayoutControl1.ViewInfo.ContentHeight;
  ClientWidth := dxLayoutControl1.ViewInfo.ContentWidth;
end;

end.
