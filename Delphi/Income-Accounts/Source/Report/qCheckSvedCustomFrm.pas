unit qCheckSvedCustomFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qCustomReportFrm, Menus, cxLookAndFeelPainters, cxGraphics,
  FDCCustomDataset, fdcQuery, Oracle, OracleData, xlcClasses, xlEngine,
  xlReport, DB, dxmdaset, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  fdcObjectLookupEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  StdCtrls, cxButtons, cxControls;

type
  TqCheckSvedCustomForm = class(TqCustomReportForm)
    edtINN: TcxDBMaskEdit;
    lciINN: TdxLayoutItem;
    edtKPP: TcxDBMaskEdit;
    lciKPP: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    cmbxPaytype: TfdcObjectLookupEdit;
    lciPayType: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dsMemDataPaytypeID: TIntegerField;
    dsMemDataINN: TStringField;
    dsMemDataKPP: TStringField;
    procedure dsMemDataDateFromChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function  GetEvtNumber: string; override;
  public
    { Public declarations }
  end;

const
  cReportDir    = 'Report\';
  cFldSysPrefix = 'Sys';
  cFldSysName   = 'SysName';
  cFldStrValue  = 'StringValue';
  cFldDefSize   = 400;
  cXMLRow       = 'xml_row';
  cXMLext       = '.xml';
  
var
  qCheckSvedCustomForm: TqCheckSvedCustomForm;

implementation

{$R *.dfm}

function TqCheckSvedCustomForm.GetEvtNumber: string;
begin
  Result := '00019';
end;

procedure TqCheckSvedCustomForm.dsMemDataDateFromChange(Sender: TField);
begin
  inherited;
  if (dsMemDataDateFrom.Value > dsMemDataDateTo.Value) then
    begin
      dsMemDataDateTo.Value := dsMemDataDateFrom.Value;
    end;
end;

procedure TqCheckSvedCustomForm.FormCreate(Sender: TObject);
begin
  inherited;
  // прописывается в дочерней форме
 // SetTemplateName( 'Факты объединения ЛС' );
//  dsMemData.Open;
//  dsMemData.Append;
end;

end.
