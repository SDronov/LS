unit EventFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit, cxDropDownEdit, cxCalendar;

type
  TEventForm = class(TObjectForm)
    dsDataOBJECT_ID: TFloatField;
    dsDataMOMENT: TDateTimeField;
    dsDataLOGIN: TStringField;
    dsDataPROGRAM: TStringField;
    dsDataMACHINE: TStringField;
    dsDataUSER_ID: TFloatField;
    dsDataUSERNAME: TStringField;
    dsDataOBJECTNAME: TStringField;
    dsDataOBJECTTYPEID: TFloatField;
    dsDataREFTYPENAME: TStringField;
    dsDataREFTYPESYSNAME: TStringField;
    edtUser: TfdcObjectLinkEdit;
    lciUser: TdxLayoutItem;
    edtObject: TfdcObjectLinkEdit;
    lciObject: TdxLayoutItem;
    edtProgram: TcxDBTextEdit;
    lciProgram: TdxLayoutItem;
    edtMachine: TcxDBTextEdit;
    lciMachine: TdxLayoutItem;
    edtMoment: TcxDBDateEdit;
    lciMoment: TdxLayoutItem;
    lcGeneralGroup2: TdxLayoutGroup;
    lcGeneralGroup1: TdxLayoutGroup;
    lcGeneralGroup3: TdxLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventForm: TEventForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TEventForm);

end.
