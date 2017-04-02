{
  Утилиты FDC для работы с окнами сообщений. Заменяет Borland.Dialogs

##  Copyright © Fors Development Center.
##  All rights reserved.

##  $Workfile: fdcMessages.pas $
##  $Revision: 5757 $
##  $Author: FORS\anaumenkov $
##  $Date: 2008-11-17 21:38:28 +0400 (РџРЅ, 17 РЅРѕСЏ 2008) $
}

unit fdcMessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, StdCtrls, cxLabel, cxLookAndFeelPainters, Consts, Math,
  cxLookAndFeels, cxImage;

type
  { TfdcMessageForm }
  TfdcMessageForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlText: TPanel;
    lblMessage: TLabel;
    Bevel3: TBevel;
    Panel4: TPanel;
    cxDetails: TcxLabel;
    pnlDetails: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edtDetails: TcxMemo;
    pnlCommand: TPanel;
    Shape1: TShape;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Shape2: TShape;
    imgIcon: TcxImage;
    pnlDescription: TPanel;
    lblDescription: TLabel;
    procedure cxButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
//    procedure HelpButtonClick(Sender: TObject);
  public
    { Public declarations }
    procedure ShowHideDetails;
    procedure SetMessage(Text: string; Description: string; Details: string;
      DlgType: TMsgDlgType);
  end;

{
Функция для работы с окнами сообщений.
  Parameters:
    AUserMessage - Сообщение пользователю
    AUserHint - Подсказка пользователю
    ADetails - Подробности
    DlgType - Тип диалога
    DlgType - Допустимые типы: mtWarning, mtError, mtInformation
    Buttons - Набор кнопок, показываемых пользователю
    HelpCtx - Номер раздела в справочной подсистеме
  Returns:
    TModalResult.
  Remarks:
    Является базовой для других функций/процедур работы с окнами сообщений.<p>
    Кнопка mbHelp не может быть использована.
}
function MessageDlg(AUserMessage, AUserHint, ADetails: string; DlgType:
  TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

{
Информационное сообщение.
  Parameters:
    AUserMessage - Сообщение пользователю
    AUserHint - Подсказка пользователю
    ADetails - Подробности
  Remarks:
    Является оболочкой над MessageDlg.
}
procedure InfoDlg(AUserMessage: string; AUserHint: string = ''; ADetails: string
  = '');

{
Сообщение - предупреждение.
  Parameters:
    AUserMessage - Сообщение пользователю.
    AUserHint - Подсказка пользователю.
    ADetails - Подробности.
  Returns:
    TModalResult. Возможные варианты - mrYes, mrNo.
  Remarks:
    Является оболочкой над MessageDlg.
}
function WarningDlg(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;

{
Сообщение - вопрос.
  Parameters:
    AUserMessage - Сообщение пользователю.
    AUserHint - Подсказка пользователю.
    ADetails - Подробности.
  Returns:
    TModalResult. Возможные варианты - mrYes, mrNo, mrCancel.
  Remarks:
    Является оболочкой над MessageDlg.
}
function ConfirmDlg(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;

function ConfirmDlgEx(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;
  
{
Cообщение об ошибке.
  Parameters:
    E - Исключительная ситуация
  Remarks:
    Является оболочкой над MessageDlg.<p>
    Умеет обрабатывать EfdcException и Exception.
}
procedure ErrorDlg(E: Exception);

{
Информационное сообщение (аналог InfoDlg).
  Parameters:
    AUserMessage - Сообщение пользователю
    AUserHint - Подсказка пользователю
    ADetails - Подробности
  Remarks:
    Является оболочкой над MessageDlg.<p>
    Реализована для совместимости. Использование не рекомендуется.
}
procedure ShowMessage(UserMessage: string; AUserHint: string = ''; ADetails:
  string = '');

  {
procedure ShowMessageFmt(const Msg: string; Params: array of const;
  Description: string = ''; Details: string = '');
}

implementation

{$R *.dfm}

uses fdcExceptions, fdcUtils;

const
  DetailBtnCaptons: array[boolean] of string =
  ('&Подробно >>',
    '<< &Подробно');
  IconIDs: array[TMsgDlgType] of PChar =
  (IDI_EXCLAMATION,
    IDI_HAND,
    IDI_ASTERISK,
    IDI_QUESTION,
    nil);

procedure TfdcMessageForm.SetMessage(Text: string; Description: string; Details:
  string;
  DlgType: TMsgDlgType);
var
  tWidth: Integer;
  ARect: TRect;
begin
  { update form caption }
  Caption := Application.Title;

  { update icon }
  if IconIDs[DlgType] <> nil then
    imgIcon.Picture.Icon.Handle := LoadIcon(0, IconIDs[DlgType]);

  { update text label }
  lblMessage.Caption := Text;
  tWidth := Width - lblMessage.Width + lblMessage.Canvas.TextWidth(Text);
  if Width <> tWidth then
    Width := tWidth;

  { update description label }
  lblDescription.Caption := Description;
  lblDescription.Visible := (Description <> '');
  if lblDescription.Visible then
  begin
    lblDescription.Align := alNone;
    lblDescription.AutoSize := False;
    ARect := Rect(0, 0, lblMessage.Width, lblMessage.Height);
    DrawTextEx(lblDescription.Canvas.Handle,  PChar(Description),
      Length(Description),	ARect, DT_CALCRECT or DT_WORDBREAK,	 nil);
    lblDescription.BoundsRect := ARect;
  end
  else
  begin
    Height := Height - lblDescription.Height;
  end;

  { update details button }
  cxDetails.Visible := (Details <> '');
  if not cxDetails.Visible then
  begin
    Panel4.Align := alNone;
    Height := Height - Panel4.Height;
  end;

  { update details memo }
  edtDetails.Lines.Text := Details;
end;

procedure TfdcMessageForm.ShowHideDetails;
begin
  pnlDetails.Visible := not pnlDetails.Visible;
  if pnlDetails.Visible then
  begin
    Height := Height + pnlDetails.Height;
    pnlDetails.Align := alBottom;
    pnlDetails.Top := pnlCommand.Top - pnlDetails.Height;
  end else begin
    pnlDetails.Align := alNone;
    Height := Height - pnlDetails.Height;
  end;
end;

procedure TfdcMessageForm.cxButton4Click(Sender: TObject);
begin
  ShowHideDetails;
end;

procedure TfdcMessageForm.FormCreate(Sender: TObject);
begin
  if assigned(Application.MainForm) then
    edtDetails.Style.Font.Assign(Application.MainForm.Font);
  ShowHideDetails;
end;

procedure TfdcMessageForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { destroy after closing }
  Action := caFree;
end;

(*
procedure TfdcMessageForm.HelpButtonClick(Sender: TObject);
begin
  if HelpContext = 0 then
    ShowHelpContents('')
  else
    ShowHelpContent('', HelpContext);
end;
*)

function MessageDlg(AUserMessage, AUserHint, ADetails: string; DlgType:
  TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
var
  Dlg: TfdcMessageForm;
  Frm: TForm;
  Btn: TButton;
  cxBtn: TcxButton;
  i: Integer;
  j: Integer;
  Btns: array[0..2] of TButton;
  Shift: Integer;
  Wid: Integer;
  Delta: Integer;
  MaxLeft: Integer;
  MinLeft: Integer;
begin
  { create and init dialog form }
  Dlg := TfdcMessageForm.Create(nil);
  Dlg.HelpContext := HelpCtx;
  Dlg.HelpFile := ''; // make more clear (may be incorrect)
  Dlg.SetMessage(AUserMessage, AUserHint, ADetails, DlgType);

  // Next fragment is for determing standard dialog parameters
  // Shift and Gap only.
  Frm := CreateMessageDialog('', DlgType, [mbYes, mbNo, mbIgnore]);
  try
    j := 0;
    for i := 0 to Frm.ComponentCount - 1 do
    begin
      if Frm.Components[i] is TButton then
      begin
        Btns[j] := Frm.Components[i] as TButton;
        Inc(j);
      end;
    end;

    Wid := Btns[0].Width;
    Shift := Btns[0].Left;
    if Btns[1].Left < Btns[0].Left then
    begin
      Shift := Btns[1].Left;
    end;
  finally
    FreeAndNil(Frm);
  end;

  // Modelling the dialog in question and using the resulting
  // Buttons layout in our form TfrmMessageDialog.
  Frm := CreateMessageDialog(AUserMessage, DlgType, Buttons);
  try
    MaxLeft := -1000000;
    for i := Frm.ComponentCount - 1 downto 0 do
    begin
      if Frm.Components[i] is TButton then
      begin
        Btn := Frm.Components[i] as TButton;
        cxBtn := TcxButton.Create(Dlg);
        cxBtn.LookAndFeel.AssignedValues := [lfvKind, lfvNativeStyle];
        cxBtn.LookAndFeel.Kind := lfStandard;
        cxBtn.LookAndFeel.NativeStyle := True;
        cxBtn.Name := Btn.Name;
        cxBtn.Caption := Btn.Caption;
        cxBtn.Cancel := Btn.Cancel;
        cxBtn.Default := Btn.Default;
        cxBtn.ModalResult := Btn.ModalResult;
        cxBtn.LookAndFeel.Kind := lfStandard;
        cxBtn.Parent := Dlg.pnlCommand;
        cxBtn.SetBounds(Btn.Left, 0, Btn.Width, MulDiv(23, Screen.PixelsPerInch, 96)); //23 {cxBtn.Height});
        MaxLeft := Max(MaxLeft, Btn.Left);
        {        if Assigned(Btn.OnClick) then
                  cxBtn.OnClick := Dlg.HelpButtonClick; }
      end;
    end;
    Delta := Dlg.pnlCommand.Width - 1 - MaxLeft - Wid;
  finally
    FreeAndNil(Frm);
  end;

  // Final Buttons right alignment according 
  MinLeft := 1000000;
  for i := 0 to Dlg.ComponentCount - 1 do
  begin
    if Dlg.Components[i] is TcxButton then
    begin
      cxBtn := Dlg.Components[i] as TcxButton;
      cxBtn.LookAndFeel.AssignedValues := [lfvKind, lfvNativeStyle];
      cxBtn.LookAndFeel.Kind := lfStandard;
      cxBtn.LookAndFeel.NativeStyle := True;
      if cxBtn.Tag <> 1 then
      begin
        cxBtn.Left := cxBtn.Left + Delta;
        // Next statement is only for design suggestion support
        cxBtn.Anchors := [akRight, akBottom];
        MinLeft := Min(MinLeft, cxBtn.Left);
        if cxBtn.Default then
          Dlg.SetFocusedControl(cxBtn);
      end
      else
      begin
        cxBtn.Visible := False;
      end;
    end;
  end;

  { adjust dialog size }
  if MinLeft < Shift then
  begin
    Dlg.Width := Dlg.Width - MinLeft + Shift;
  end;
  Dlg.pnlCommand.AutoSize := True;
  Dlg.Height := Dlg.Height + Dlg.lblDescription.Height - Dlg.pnlDescription.Height;

  { show dialog }
  { dialog must destroy himself immediately after closing }
  Result := Dlg.ShowModal;
end;

procedure InfoDlg(AUserMessage: string; AUserHint: string = ''; ADetails: string
  = '');
begin
  MessageDlg(AUserMessage, AUserHint, ADetails, mtInformation, [mbOK], 0);
end;

function WarningDlg(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;
begin
  Result := MessageDlg(AUserMessage, AUserHint, ADetails, mtWarning, [mbYes,
    mbNo], 0);
end;

function ConfirmDlg(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;
begin
  Result := MessageDlg(AUserMessage, AUserHint, ADetails, mtConfirmation, [mbYes,
    mbNo], 0);
end;

function ConfirmDlgEx(AUserMessage, AUserHint: string; ADetails: string = ''):
  TModalResult;
begin
  Result := MessageDlg(AUserMessage, AUserHint, ADetails, mtConfirmation, [mbYes,
    mbNo, mbIgnore], 0);
end;

procedure ErrorDlg(E: Exception);
var
  UserMessage, {TrimmedUserMessage,} UserHint: string;
begin
  if E is EfdcException then
  begin
    UserMessage := (E as EfdcException).UserMessage;
    UserHint    := (E as EfdcException).UserHint;
    {TrimmedUserMessage := RTrim(UserMessage, 50);
    if UserMessage <> TrimmedUserMessage then
    begin
      UserHint := UserMessage + '. ' + UserHint;
      UserMessage := TrimmedUserMessage;
    end;}
    MessageDlg(UserMessage, UserHint,
      EfdcException(E).GetDetailsString,
      mtError, [mbOK], 0)
  end
  else
    try
      HandleError(E);
    except
      on E: Exception do
        ErrorDlg(E);
    end;
end;

procedure ShowMessage(UserMessage: string; AUserHint: string = '';
  ADetails: string = '');
begin
  InfoDlg(UserMessage, AUserHint, ADetails);
end;

(*
procedure ShowMessageFmt(const Msg: string; Params: array of const;
  Description: string = ''; Details: string = '');
begin
  ShowMessage(Format(Msg, Params), Description, Details);
end;
*)
end.

