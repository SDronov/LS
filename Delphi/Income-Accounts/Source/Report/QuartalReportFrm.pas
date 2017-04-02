unit QuartalReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReportFrm, Menus, cxLookAndFeelPainters, DB, dxmdaset,
  xlcClasses, xlEngine, xlReport, FDCCustomDataset, fdcQuery, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxRadioGroup, cxGroupBox, DateUtils, Types;

type
  TQuartalReportForm = class(TXLSReportForm)
    seYear: TcxSpinEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    rgQuarts: TcxRadioGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsParamDATE_FROM: TDateField;
    dsParamDATE_TO: TDateField;
    procedure FormShow(Sender: TObject);
  private
    procedure setControls;
  protected
   function getQStart: TDate;
   function getQEnd: TDate;
  public
    procedure TransferParams; override;
  end;

implementation

uses qReportUtil;

{$R *.dfm}

function quartBegins(const aDate:TDate):TDate;
//возвращает дату начала квартала для произвольной aDate
var Y, M, D: word;
begin
 decodeDate(aDate, Y, M, D);
 result:= encodeDate(Y, 1+3*((M-1) div 3), 1);
end;

procedure TQuartalReportForm.setControls;
var
 d, minDate: TDate;
 Y, M, Dy: word;
begin
 inherited;
 minDate:= encodeDate(2014, 1, 1);
 {Устанавливаем квартал предыдущий к текущему }
 d:= quartBegins( incDay( quartBegins( date ), -1 ) ); // дата начала предыдущего кв.

 if ( CompareDate(d, minDate) <> GreaterThanValue ) then
   d:= minDate;

 decodeDate(d, Y, M, Dy);
 seYear.Value := Y;
 rgQuarts.ItemIndex:= ((M-1) div 3);
end;

function TQuartalReportForm.getQStart: TDate;
begin
 result:= encodeDate( seYear.Value, 1+(3*rgQuarts.Properties.Items[ rgQuarts.ItemIndex ].Value), 1 );
end;

function TQuartalReportForm.getQEnd: TDate;
begin
 result:= incDay(incMonth( getQStart, 3 ), -1);
end;

procedure TQuartalReportForm.FormShow(Sender: TObject);
begin
 inherited;
 setControls;
end;

procedure TQuartalReportForm.TransferParams;
//var inEditode: boolean;;
begin
  dsParam.Edit;
  dsParamDATE_FROM.AsDateTime:= getQStart;
  dsParamDATE_TO.AsDateTime:= getQEnd;
  dsParam.Post;
  inherited;
  with xlReport.Params.Add do
  begin
    Name := 'DATE_FROM_TEXT';
    Value := DateAsText( dsParamDATE_FROM.Value );
  end;

  with xlReport.Params.Add do
  begin
    Name := 'DATE_TO_TEXT';
    Value := DateAsText( dsParamDATE_TO.Value );
  end;

end;

initialization
 RegisterClass(TQuartalReportForm);
end.
