unit ObjectTypeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, Buttons, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxLookAndFeelPainters, cxButtons,
  cxCheckBox, ExtDlgs;

type
  TObjectTypeForm = class(TObjectForm)
    edtShortName: TcxDBTextEdit;
    lciShortName: TdxLayoutItem;
    edtSysName: TcxDBTextEdit;
    lciSysName: TdxLayoutItem;
    edtParentObjectTypeID: TfdcObjectLinkEdit;
    lciParentObjectTypeID: TdxLayoutItem;
    edtTableName: TcxDBTextEdit;
    lciTableName: TdxLayoutItem;
    edtStateSchemeID: TfdcObjectLinkEdit;
    lciStateSchemeID: TdxLayoutItem;
    lcGeneralGroup1: TdxLayoutGroup;
    actSetIcon: TAction;
    dsDataTABLENAME: TStringField;
    dsDataICON: TStringField;
    dsDataSTATE_SCHEME_ID: TFloatField;
    dsDataPARENT_OBJECT_TYPE_ID: TFloatField;
    dsDataDEL_PROCEDURE_ID: TFloatField;
    dsDataOBJECTTABLEINSTANCE: TIntegerField;
    dsDataPARENTTYPENAME: TStringField;
    dsDataPARENTTYPESYSNAME: TStringField;
    dsDataSTATE_SCHEMENAME: TStringField;
    btnSetIcon: TcxButton;
    lcGeneralItem1: TdxLayoutItem;
    chbxObjectTableInstance: TcxDBCheckBox;
    lciObjectTableInstance: TdxLayoutItem;
    dlgSelectPicture: TOpenPictureDialog;
    tabSysComponent: TcxTabSheet;
    lcGeneralGroup3: TdxLayoutGroup;
    procedure actSetIconExecute(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
    procedure tabSysComponentShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FSysComponentGridForm: TForm;
  public
    { Public declarations }
  end;

var
  ObjectTypeForm: TObjectTypeForm;

implementation

uses fdcUtils;
{$R *.dfm}

procedure TObjectTypeForm.actSetIconExecute(Sender: TObject);
var ms: TMemoryStream;
begin
  inherited;

  if not dlgSelectPicture.Execute then exit;

  ms := TMemoryStream.create;
  try
	  ms.LoadFromFile(dlgSelectPicture.FileName);
	  btnSetIcon.Glyph.LoadFromStream(ms);
    dsDataIcon.asString := ReadHexString(ms);
	  Modify(Self);
	finally
    ms.free;
	end;
end;

procedure TObjectTypeForm.dsDataAfterOpen(DataSet: TDataSet);
var ms: TMemoryStream;
begin
  inherited;

  if IsNew then
	   dsDataObjectTableInstance.asInteger := 1
   else
	   begin
       ms := TMemoryStream.Create;

	     try
		     WriteHexString(dsDataIcon.asString,ms);
		     btnSetIcon.Glyph.LoadFromStream(ms);
		   finally
         ms.free;
		   end;
	   end;
end;

procedure TObjectTypeForm.actSaveExecute(Sender: TObject);
begin
  inherited;

  ObjectServices.GetObjectTypeFactory.Load;
end;

procedure TObjectTypeForm.tabSysComponentShow(Sender: TObject);
begin
  inherited;

  if not Assigned(FSysComponentGridForm) then
     FSysComponentGridForm := ShowForm('TSysComponentGridByObjectTypeForm', Params, tabSysComponent);
end;

initialization
  RegisterClass(TObjectTypeForm);

end.
