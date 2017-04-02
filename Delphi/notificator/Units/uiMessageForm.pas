unit uiMessageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uConsts, Grids;

type
  TMsgForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbRecol: TCheckBox;
    LB: TListBox;
    procedure btOkClick(Sender: TObject);
  private
    function getIn5Minutes: boolean;

  public
    constructor create(aOwner: TComponent; aStrings: TStrings = nil); reintroduce; overload;
    property NotifyIn5Minutes: boolean read getIn5Minutes;
  end;


implementation

{$R *.dfm}

constructor TMsgForm.create(aOwner: TComponent; aStrings: TStrings = nil);
begin
 inherited create(aOwner);

 if assigned(aStrings) then
   LB.items := aStrings
 else LB.items.clear;

end;

procedure TMsgForm.btOkClick(Sender: TObject);
begin
 inherited;
 {if (not assigned(Owner)) then
   close
 else
   windows.SendMessage( (owner as TForm).Handle, confirm_notification, 0, 0 ); }
end;


function TMsgForm.getIn5Minutes: boolean;
begin
 result:= cbRecol.Checked;
end;

end.
