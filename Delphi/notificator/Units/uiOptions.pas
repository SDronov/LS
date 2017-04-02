unit uiOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ActnList,
  uOptions, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit;

type
  TFormOptions = class(TForm)
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    acSave: TAction;
    acClose: TAction;
    procedure FormCreate(Sender: TObject);
    procedure edServerChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
   private
    fOptions: TOptions;
    procedure saveOptions;
    procedure setEditors;

   public
    constructor create(aOptions: TOptions); reintroduce;
  end;

implementation
uses
 uConsts;
{$R *.dfm}

constructor TFormOptions.create(aOptions: TOptions);
begin
 inherited Create(Application);
 fOptions:= aOptions;
end;

procedure TFormOptions.saveOptions;
begin
(*
 if ( not assigned(fOptions) ) then exit;

 fOptions.FtpHost   := edServer.Text;
 fOptions.ftpUser     := edUser.Text;
 fOptions.ftpPassword := edPassword.Text;
 fOptions.ftpPort     := edPort.Value;
 fOptions.intervalSeconds:= edInterval.Value;
 fOptions.ftpDirectory:= edDirectory.Text;

 fOptions.loadFromRegistry:= intAsBool( cbIniRegistry.ItemIndex );
 fOptions.ftpPassiveMode:= intAsBool( cbPassive.ItemIndex );
 fOptions.autoStart:= intAsBool(cbAutoStart.ItemIndex);
 *)
end;

procedure TFormOptions.setEditors;
begin
 if ( not assigned(fOptions) ) then exit;
 (*
 edServer.Text:=  fOptions.FtpHost;
 edUser.Text   :=  fOptions.ftpUser;
 edPassword.Text:= fOptions.ftpPassword;
 edPort.Value:= fOptions.ftpPort;
 edInterval.Value:= fOptions.intervalSeconds;
 edDirectory.Text:= fOptions.ftpDirectory;

 cbIniRegistry.ItemIndex:= boolAsInt(fOptions.LoadFromRegistry);
 cbPassive.ItemIndex:= boolAsInt(fOptions.FtpPassiveMode);
 cbAutoStart.ItemIndex:= boolAsInt(fOptions.autoStart);

 acSave.Enabled:= false;
 *)
end;

procedure TFormOptions.FormCreate(Sender: TObject);
begin
  setEditors;
end;

procedure TFormOptions.edServerChange(Sender: TObject);
begin
 if (not acSave.Enabled) then
   acSave.Enabled:= true;
end;

procedure TFormOptions.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TFormOptions.acSaveExecute(Sender: TObject);
begin
 saveOptions;
end;

end.
