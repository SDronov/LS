unit NSIDeclarantELSFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TNSIDeclarantELSForm = class(TObjectForm)
    cxDBDateBegin: TcxDBDateEdit;
    lcGeneralItem2: TdxLayoutItem;
    cxDBDateEnd: TcxDBDateEdit;
    lcGeneralItem3: TdxLayoutItem;
    cxDBMemoNote: TcxDBMemo;
    lcGeneralItem4: TdxLayoutItem;
    dsDataINN: TStringField;
    dsDataDECLARANT_NAME: TStringField;
    dsDataDATE_BEGIN: TDateTimeField;
    dsDataDATE_END: TDateTimeField;
    dsDataNOTE: TStringField;
    lcGeneralGroup1: TdxLayoutGroup;
    cxDBTextEditINN: TcxDBMaskEdit;
    lcGeneralItem5: TdxLayoutItem;
    cxDBDeclarantName: TcxDBMemo;
    lciDeclarantNameEdit: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NSIDeclarantELSForm: TNSIDeclarantELSForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TNSIDeclarantELSForm);

end.
