{
  Copyright � Fors Development Center. 
  All rights reserved.

  $Workfile: fdcNamePropertyFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}

unit fdcNamePropertyFrm;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls, ActnList, ExtCtrls;

type
  TfdcNamePropertyForm = class(TForm)
    panel3: TPanel;
    Label1: TLabel;
    lblClassName: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    edtName: TEdit;
    edtNamePreview: TEdit;
    Panel2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    ActionList: TActionList;
    actOk: TAction;
    actCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }
    FPrefix: TCaption;
    FSuffix: TCaption;
    procedure SetPreviewText;
  public
    { Public declarations }
    property Prefix: TCaption read FPrefix write FPrefix;
    property Suffix: TCaption read FSuffix write FSuffix;
  end;

var
  fdcNamePropertyForm: TfdcNamePropertyForm;

implementation

{$R *.DFM}

function CleanStr(const SourceStr: string): string;
const
  AllowedChars: set of char = ['0'..'9', 'a'..'z', 'A'..'Z', '_'];
var
  s: string;
begin
  s := SourceStr;

  while length(s) <> 0 do
    if s[1] in AllowedChars then
    begin
      result := result + s[1];
      delete(s, 1, 1)
    end
    else
      delete(s, 1, 1);
end;

procedure TfdcNamePropertyForm.SetPreviewText;
begin
  edtNamePreview.Text := Prefix + edtName.Text + Suffix;
end;

procedure TfdcNamePropertyForm.FormCreate(Sender: TObject);
begin
  Prefix := '';
  Suffix := '';
end;

procedure TfdcNamePropertyForm.FormShow(Sender: TObject);
begin
  SetPreviewText;
end;

procedure TfdcNamePropertyForm.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfdcNamePropertyForm.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfdcNamePropertyForm.actOkUpdate(Sender: TObject);
var
  s: string;
begin
  s := CleanStr(edtNamePreview.Text);
  TAction(Sender).Enabled := (edtNamePreview.Text = s) and
    (Length(s) >= 1) and
    (not (s[1] in ['0'..'9']));
end;

procedure TfdcNamePropertyForm.edtNameChange(Sender: TObject);
begin
  SetPreviewText;
end;

end.

