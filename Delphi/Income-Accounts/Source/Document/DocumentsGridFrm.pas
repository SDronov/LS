unit DocumentsGridFrm;

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
  dxStatusBar, cxCalendar, cxCheckBox, cxCurrencyEdit;

type
  TDocumentsGridForm = class(TObjectGridForm)
    columnDOC_NUMBER: TcxGridDBBandedColumn;
    columnDOC_DATE: TcxGridDBBandedColumn;
    dsDataDOC_DATE: TDateTimeField;
    dsDataDOC_NUMBER: TStringField;
    dsDataACTIVATION_DATE: TDateTimeField;
    dsDataOPERATION_SUM: TFloatField;
    columnACTIVATION_DATE: TcxGridDBBandedColumn;
    columnOPERATION_SUM: TcxGridDBBandedColumn;
    procedure dsDataBeforeOpen(DataSet: TDataSet);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure FillParams;
    procedure SetCaption;
    procedure SetGrouping;
  public
    { Public declarations }
  end;

var
  DocumentsGridForm: TDocumentsGridForm;

implementation

{$R *.dfm}

uses
  MainDM, fdcCustomDataFrm, fdcCustomObjectGridFrm;

const
  cs_Cpt_Main = 'Документы';

  cs_Prm_WhereSection = 'where_section';
  cs_Prm_OrderSection = 'order_section';
  cs_Prm_Caption      = 'caption';
  cs_Prm_Grouping     = 'grouping';


{ TDocumentsGridForm }

procedure TDocumentsGridForm.FillParams;
  var
    i, j     : Integer;
    Position : Integer;
begin
  with dsData.SQL do
    begin
      Position := -1;

      // Очистить запрос
      i := 0;
      while (i < Count)
        and (Pos( cs_Prm_WhereSection, Strings[i] ) = 0) do
        inc( i );
      if i < Count then
        Position := i;

      inc( i );
      while (i < Count)
        and (Pos( cs_Prm_OrderSection, Strings[i] ) = 0) do
        Delete( i );

      inc( i );
      while (i < Count) do
        Delete( i );

      if Position = -1 then
        Exit;

      if Assigned( Params.FindParam( cs_Prm_WhereSection ) ) then
        Insert( Position + 1, ' AND ' + ParamByName( cs_Prm_WhereSection ).AsString );

      if Assigned( Params.FindParam( cs_Prm_OrderSection ) ) then
        begin
          i := Position;
          while (i < Count)
            and (Pos( cs_Prm_OrderSection, Strings[i] ) = 0) do
            inc( i );

          if i < Count then
            Insert( i + 1, ' ORDER BY ' + ParamByName( cs_Prm_OrderSection ).AsString );
        end;
    end;
end;

procedure TDocumentsGridForm.dsDataBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  FillParams;
  SetCaption;
end;

procedure TDocumentsGridForm.SetCaption;
begin
  if not Assigned( Params.FindParam( cs_Prm_Caption ) ) then
    Exit;

  Caption := cs_Cpt_Main + ': ' + ParamByName( cs_Prm_Caption ).AsString;
end;

procedure TDocumentsGridForm.SetGrouping;
  var
    s            : string;
    lv_FieldName : string;
    lv_Column    : TcxGridDBBandedColumn;
    lv_DelimPos  : Integer;
begin
  grdDataDBBandedTableView.BeginUpdate;
  try
    grdDataDBBandedTableView.OptionsView.GroupByBox := False;
    while grdDataDBBandedTableView.GroupedColumnCount > 0 do
      grdDataDBBandedTableView.GroupedColumns[0].GroupIndex := -1;
  finally
    grdDataDBBandedTableView.EndUpdate;
  end;

  if not Assigned( Params.FindParam( cs_Prm_Grouping ) ) then
    Exit;

  grdDataDBBandedTableView.BeginUpdate;
  try
    s := Trim( ParamByName( cs_Prm_Grouping ).AsString );
    if s[1] = ';' then
      s := Copy( s, 2, Length( s ) - 1 );
    if s[Length( s )] = ';' then
      s := Copy( s, 1, Length( s ) - 1 );
    s := Trim( s );

    while s <> '' do
      begin
        lv_DelimPos := Pos( ';', s );
        if lv_DelimPos > 0 then
          lv_FieldName := Copy( s, 1, lv_DelimPos - 1 )
        else
          lv_FieldName := s;
        lv_Column := grdDataDBBandedTableView.GetColumnByFieldName( lv_FieldName );
        if Assigned( lv_Column ) then
          lv_Column.GroupBy( grdDataDBBandedTableView.GroupedColumnCount );

        if Pos( ';', s ) > 0 then
          s := Copy( s, Pos( ';', s ) + 1, Length( s ) - Pos( ';', s ) )
        else
          s := '';
      end;

    grdDataDBBandedTableView.OptionsView.GroupByBox := grdDataDBBandedTableView.GroupedColumnCount > 0;
  finally
    grdDataDBBandedTableView.EndUpdate;
  end;
end;

procedure TDocumentsGridForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  //SetGrouping;
end;

procedure TDocumentsGridForm.actDeleteUpdate(Sender: TObject);
begin
  ;
end;

procedure TDocumentsGridForm.actAddUpdate(Sender: TObject);
begin
  ;
end;

initialization
  RegisterClass( TDocumentsGridForm );

end.
