unit StateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, cxContainer,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, ActnList,
  dxLayoutLookAndFeels, StdCtrls, cxMaskEdit, cxDropDownEdit,  cxPC,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  cxMemo, cxDBEdit, cxTextEdit, cxControls, cxButtonEdit, cxButtons,
  fdcObjectLinkEdit, cxColorComboBox, cxDBColorComboBox, cxCheckBox,
  Buttons, ExtCtrls, cxLookAndFeelPainters;

type
  TStateForm = class(TObjectForm)
    edtStateScheme: TfdcObjectLinkEdit;
    lciStateScheme: TdxLayoutItem;
    dsDataSTATE_SCHEME_ID: TFloatField;
    dsDataALLOWUPDATES: TIntegerField;
    dsDataALLOWDELETE: TIntegerField;
    dsDataACTIVE: TIntegerField;
    dsDataCOLOR: TFloatField;
    dsDataSTATE_SCHEMENAME: TStringField;
    dsDataSTATE_SCHEMESYSNAME: TStringField;
    edtSysName: TcxDBTextEdit;
    lciSysName: TdxLayoutItem;
    chbxActive: TcxDBCheckBox;
    lciActive: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    chbxAllowUpdates: TcxDBCheckBox;
    lciAllowUpdates: TdxLayoutItem;
    chbxAllowDelete: TcxDBCheckBox;
    lciAllowDelete: TdxLayoutItem;
    lciColor: TdxLayoutItem;
    shpColor: TShape;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
    dlgColor: TColorDialog;
    tabStateTransit: TcxTabSheet;
    actSelectColor: TAction;
    btnSelectColor: TcxButton;
    lcGeneralItem1: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actSelectColorExecute(Sender: TObject);
    procedure shpColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabStateTransitShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FStateTransitGridForm: TForm;
  public
    { Public declarations }
  end;

var
  StateForm: TStateForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TStateForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if IsNew then
     begin
       dsDataState_Scheme_ID.AsFloat := Params.ParamByName('OMasterID').AsFloat;
       dsDataState_SchemeName.AsString := Params.ParamByName('OMasterName').AsString;
       dsDataActive.AsInteger := 1;
       dsDataAllowUpdates.AsInteger := 1;
       dsDataAllowDelete.AsInteger := 1;
       dsDataColor.asInteger := clWhite;
     end;

  shpColor.Brush.Color := dsDataColor.asInteger;
end;

procedure TStateForm.FormShow(Sender: TObject);
begin
  inherited;

  chbxActive.Properties.Alignment := taLeftJustify;
  chbxAllowUpdates.Properties.Alignment := taLeftJustify;
  chbxAllowDelete.Properties.Alignment := taLeftJustify;
end;

procedure TStateForm.actSelectColorExecute(Sender: TObject);
begin
  inherited;
  
  dlgColor.Color := dsDataColor.asInteger;
  if dlgColor.Execute then
     begin
       dsDataColor.asInteger := dlgColor.Color;
       shpColor.Brush.Color := dlgColor.Color;
       Modify(Self);
     end;
end;

procedure TStateForm.shpColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if (ssDouble in Shift) then
     actSelectColorExecute(Self);
end;

procedure TStateForm.tabStateTransitShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FStateTransitGridForm) then
     FStateTransitGridForm := ShowForm('TStateTransitGridByStateForm', Params, tabStateTransit);
end;

initialization
  RegisterClass(TStateForm);

end.
