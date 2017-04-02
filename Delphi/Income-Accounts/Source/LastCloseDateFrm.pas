unit LastCloseDateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomCardFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxPC, cxControls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TLastCloseDayGridForm = class(TfdcCustomCardForm)
    cxDBDateEdit1: TcxDBDateEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataDATETIMEVALUE: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
  protected
    function MakeCaption(AUseModifiedFlag: Boolean = True): String;
      override;
    function GetIsNew: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LastCloseDayGridForm: TLastCloseDayGridForm;

implementation

uses MainDm;

{$R *.dfm}

{ TLastCloseDayGridForm }

function TLastCloseDayGridForm.MakeCaption(
  AUseModifiedFlag: Boolean): String;
begin
  Result := '';
  if AUseModifiedFlag and Modified then
       Result := '* ';
  Result := Result + 'Закрыть день';
end;

procedure TLastCloseDayGridForm.FormShow(Sender: TObject);
begin
  if MainData.CheckTask('TSK_MainBook_CloseDay') then
  begin
    dsData.Active := True;
    inherited;
    Modified := False;
  end;
end;

function TLastCloseDayGridForm.GetIsNew: Boolean;
begin
  Result := False;
end;

procedure TLastCloseDayGridForm.actSaveExecute(Sender: TObject);
begin
//  inherited;
  SaveData(False);
  Modified := False;
end;

initialization
   RegisterClass(TLastCloseDayGridForm);

end.
