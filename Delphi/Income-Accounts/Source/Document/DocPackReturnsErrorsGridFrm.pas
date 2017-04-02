unit DocPackReturnsErrorsGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, dxLayoutControl, cxTextEdit,
  cxButtons, ExtCtrls, cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, fdcDBUtils;

type
  TDocPackRetsErrorGridForm = class(TObjectGridForm)
    dsDataADDITIONMESSAGE: TStringField;
    dsDataERRORMESSAGE: TStringField;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function errors_present(aIS_TS: char): boolean;

implementation



{$R *.dfm}

function errors_present(aIS_TS: char): boolean;
const
 cSQL =
 ' select count(1) cnt from fdc_po_errors_lst e join fdc_document d on e.OWNER_OBJECT_ID = d.id ' +
 '   where e.TypeSYSNAME = ''PO_PaybackIllegalChars'' and d.is_ts = ''%s'' ';
begin
 result:= (fdcDBUtils.GetQryFldVal( format( cSQL, [aIS_TS] ) ) > 0);
end;

procedure TDocPackRetsErrorGridForm.dsDataBeforeOpen(DataSet: TDataSet);

begin
// inherited;
 dsData.sql.text := 
 ' select *  from fdc_po_errors_lst e join fdc_document d on e.OWNER_OBJECT_ID = d.id  '+
 ' where 1 = 1 ' +
 '   and e.TypeSYSNAME = ''PO_PaybackIllegalChars''  ' +
 '   and d.is_ts = :is_ts ' ;

 dsData.ParamByName('is_ts').Value := params.ParamValues['is_ts'] ;
end;

procedure TDocPackRetsErrorGridForm.dsDataAfterScroll(DataSet: TDataSet);
begin
  inherited;
 { with actAdd do begin
     Enabled:= false;
     Visible:= false;
  end;           }
//  actSwitchSearchCriteria.Enabled:= false;
end;

initialization
  RegisterClass(TDocPackRetsErrorGridForm);

end.

