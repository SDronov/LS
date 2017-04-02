unit DocumentGridFrm;

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
  dxStatusBar, cxCalendar, cxCheckBox, cxDropDownEdit;

type
  TDocumentGridForm = class(TObjectGridForm)
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataIS_ACTIVE: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn;
    edtDocDateFrom: TcxDateEdit;
    lcSearchCriteriaItem2: TdxLayoutItem;
    edtDocDateTo: TcxDateEdit;
    lcSearchCriteriaItem3: TdxLayoutItem;
    edtDocNumber: TcxMaskEdit;
    lcSearchCriteriaItem4: TdxLayoutItem;
    cbIsActive: TcxComboBox;
    lcSearchCriteriaItem6: TdxLayoutItem;
    edtActDateFrom: TcxDateEdit;
    lcSearchCriteriaItem7: TdxLayoutItem;
    edtActDateTo: TcxDateEdit;
    lcSearchCriteriaItem8: TdxLayoutItem;
    lcSearchCriteriaGroup1: TdxLayoutGroup;
    lcSearchCriteriaGroup2: TdxLayoutGroup;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocumentGridForm: TDocumentGridForm;

implementation

uses fdcCustomGridFrm;

{$R *.dfm}

procedure TDocumentGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  SetSearchParam( 'doc_number',    edtDocNumber.Text        );
  SetSearchParam( 'doc_date_from', edtDocDateFrom.EditValue );
  SetSearchParam( 'doc_date_to',   edtDocDateTo.EditValue   );
  SetSearchParam( 'act_date_from', edtActDateFrom.EditValue );
  SetSearchParam( 'act_date_to',   edtActDateTo.EditValue   );
  case cbIsActive.ItemIndex of
    0 : SetSearchParam( 'is_active', null );
    1 : SetSearchParam( 'is_active', 'Y'  );
    2 : SetSearchParam( 'is_active', 'N'  );
  end;
end;

end.
