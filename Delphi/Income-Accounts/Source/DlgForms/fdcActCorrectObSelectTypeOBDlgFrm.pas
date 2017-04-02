unit fdcActCorrectObSelectTypeOBDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, Menus, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, cxGraphics, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, QueryList, DB, FDCCustomDataset, fdcQuery, fdcMessages
  ,fdcCustomObjectFrm;

type
  TfdcActCorrectObSelectTypeOBDlgForm = class(TfdcCustomDlgForm)
    lcicbTypeBalans: TdxLayoutItem;
    cbTypeBalans: TcxComboBox;
    QueryList: TQueryList;
    sqlOpGetCurDateActID: TsqlOp;
    sqlOpCreateAct: TsqlOp;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    factid: String;
  public
    { Public declarations }
    property pactid: String read factid;
  end;

  function GetActCorrOb_ID: String;

implementation

uses MainDm;

{$R *.dfm}

function GetActCorrOb_ID: String;
  var l_actcorrob_form: TfdcActCorrectObSelectTypeOBDlgForm;
      l_modal_result: Integer;
begin
  l_actcorrob_form := TfdcActCorrectObSelectTypeOBDlgForm.Create(Application);
  try
    l_modal_result := l_actcorrob_form.ShowModal;
    result := l_actcorrob_form.pactid;
  finally
    FreeAndNil(l_actcorrob_form);
  end;
end;

procedure TfdcActCorrectObSelectTypeOBDlgForm.actOkExecute(
  Sender: TObject);
begin
  //--
  sqlOpGetCurDateActID.Exec('balans_type',cbTypeBalans.ItemIndex);
  factid := sqlOpGetCurDateActID.ParamValues['lv_result'];
  if (factid <> '') then
    begin
      if (MessageDlg
           (
             'Добавить изменения в сформированный документ "Акт о внесении изменений в ОБ"?'
            ,''
            ,'Найден созданный документ "Акт о внесении изменений в ОБ" за текущую дату по балансу "'+cbTypeBalans.Text+'" в статсе "создан".'
            ,mtConfirmation
            ,[mbYes, mbCancel]
            ,0
           ) = mrCancel) then
        begin
          factid := '';
        end;
    end
  else
    begin
      sqlOpCreateAct.Exec('balans_type',cbTypeBalans.ItemIndex);
      factid := sqlOpCreateAct.ParamValues['lv_result'];
    end;
  //--
  inherited;
end;

procedure TfdcActCorrectObSelectTypeOBDlgForm.FormCreate(Sender: TObject);
begin
  inherited;
  factid := '';
  //-- Заполнение режимов отображения баланса
  //-- только для уровня РТУ и ФТС
  if (MainData.GetCustomsLevel < 2) then
    begin
      cbTypeBalans.Properties.Items.Add('Непосредственно РТУ/ФТС');
      cbTypeBalans.Properties.Items.Add('Суммарный');
    end;
end;

end.
