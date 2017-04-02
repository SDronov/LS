{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcFormatterWizard.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcFormatterWizard;

interface

uses Classes, ActnList, Menus, ToolsAPI;

type
  { TfdcKeyboardBinding }
  TfdcKeyboardBinding = class(TNotifierObject, IOTAKeyboardBinding)
  private
    FMenuItem: TMenuItem;
    FShortCut: TShortCut;
    FIndex: integer;
  protected
    function GetBindingType: TBindingType;
    function GetDisplayName: string;
    function GetName: string;
    procedure BindKeyboard(const BindingServices: IOTAKeyBindingServices);
    procedure KeyProc(const Context: IOTAKeyContext; KeyCode: TShortCut;
      var BindingResult: TKeyBindingResult);
  public
    constructor Create(MenuItem: TMenuItem; ShortCut: TShortCut);

    property MenuItem: TMenuItem read FMenuItem;
    property BindIndex: integer read FIndex write FIndex;
  end;

  { TfdcKeyboardBinder }
  TfdcKeyboardBinder = class
  private
    FBindList: TList;
  public
    procedure AddKey(MenuItem: TMenuItem; ShortCut: TShortCut);
    procedure Clear;
    constructor Create;
    destructor Destroy; override;
  end;

  { TfdcFormatterWizard }
  TfdcFormatterWizard = class(TNotifierObject, IOTAWizard)
  private
    FMainMenuItem: TMenuItem;
    FFormatterMenuItem: TMenuItem;
    FFormatSourceMenuItem: TMenuItem;
    FFormatterAction: TAction;
    FFormatSourceAction: TAction;
    FKeyboardBinder: TfdcKeyboardBinder;

    procedure OnFormatterActionExecute(Sender: TObject);
    procedure OnFormatSourceActionExecute(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Execute;
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
  end;

implementation

uses SysUtils, Forms, Dialogs, DelExpert, Progr, fdcConsts;

const
  SMainMenuItemCaption = 'FD&C';
  SFormatterMenuItemName = 'fdcFormatterItem';
  SFormatterActionCaption = 'Formatter...';
  SFormatSourceMenuItemName = 'fdcFormatSourceItem';
  SFormatSourceActionCaption = 'Format source';

  SFormatterWizardName = 'FormatterWizard';
  SFormatterWizardIDString = SCompanyShortEng + '.' + SFormatterWizardName;
  SShortCutIDString = SCompanyShortEng + '.ShortCut';

function NTAServices: INTAServices;
begin
  Result := (BorlandIDEServices as INTAServices);
end;

function OTAKeyboardServices: IOTAKeyboardServices;
begin
  Result := (BorlandIDEServices as IOTAKeyboardServices);
end;

{ TfdcKeyboardBinding }

procedure TfdcKeyboardBinding.BindKeyboard(const BindingServices:
  IOTAKeyBindingServices);
begin
  BindingServices.AddKeyBinding([FShortCut], KeyProc,
    nil, kfImplicitShift, SShortCutIDString + '.' + FMenuItem.Name,
    FMenuItem.Name)
end;

constructor TfdcKeyboardBinding.Create(MenuItem: TMenuItem; ShortCut:
  TShortCut);
begin
  FMenuItem := MenuItem;
  FShortCut := ShortCut;
end;

function TfdcKeyboardBinding.GetBindingType: TBindingType;
begin
  Result := btPartial;
end;

function TfdcKeyboardBinding.GetDisplayName: string;
begin
  Result := FMenuItem.Caption;
end;

function TfdcKeyboardBinding.GetName: string;
begin
  Result := SShortCutIDString + '.' + FMenuItem.Name;
end;

procedure TfdcKeyboardBinding.KeyProc(const Context: IOTAKeyContext;
  KeyCode: TShortCut; var BindingResult: TKeyBindingResult);
begin
  if FMenuItem.Enabled then
    FMenuItem.Click;
  BindingResult := krHandled;
end;

{ TfdcKeyboardBinder }

procedure TfdcKeyboardBinder.AddKey(MenuItem: TMenuItem; ShortCut: TShortCut);
var
  OnceBind: TfdcKeyboardBinding;
begin
  if ShortCutToText(ShortCut) = '' then
    Exit;
  OnceBind := TfdcKeyboardBinding.Create(MenuItem, ShortCut);
  OnceBind.BindIndex := OTAKeyboardServices.AddKeyboardBinding(OnceBind);
  if OnceBind.BindIndex <> -1 then
    FBindList.Add(OnceBind)
  else
    OnceBind.Free;
end;

procedure TfdcKeyboardBinder.Clear;
var
  Index, i: integer;
begin
  for i := FBindList.Count - 1 downto 0 do
  begin
    Index := TfdcKeyboardBinding(FBindList[i]).BindIndex;
    if Index <> -1 then
      OTAKeyboardServices.RemoveKeyboardBinding(Index);
  end;
  FBindList.Clear;
end;

constructor TfdcKeyboardBinder.Create;
begin
  inherited Create;
  FBindList := TList.Create;
end;

destructor TfdcKeyboardBinder.Destroy;
begin
  FBindList.Free;
  inherited;
end;

{ TfdcFormatterWizard }

constructor TfdcFormatterWizard.Create;
var
  MainMenu: TMainMenu;
  ActionList: TCustomActionList;
  Index: integer;
begin
  inherited Create;

  { получить ссылки на MainMenu и ActionList }
  MainMenu := NTAServices.MainMenu;
  ActionList := NTAServices.ActionList;

  { создать helper для добавления "горящих клавиш" }
  FKeyboardBinder := TfdcKeyboardBinder.Create;

  { добавить пункты в меню IDE }
  if (Assigned(MainMenu)) and
    (Assigned(ActionList)) and
    (not Assigned(MainMenu.Items.Find(SMainMenuItemCaption))) then
  begin
    { добавить новый пункт в главное меню IDE перед пунктом "Tools" }
    FMainMenuItem := TMenuItem.Create(MainMenu);
    FMainMenuItem.Caption := SMainMenuItemCaption;
    Index := MainMenu.Items.Count - 2;
    if Index > -1 then
      MainMenu.Items.Insert(Index, FMainMenuItem)
    else
      MainMenu.Items.Add(FMainMenuItem);

    { добавить пункт форматирования }
    FFormatterAction := TAction.Create(ActionList);
    FFormatterAction.ActionList := ActionList;
    FFormatterAction.Caption := SFormatterActionCaption;
    FFormatterAction.OnExecute := OnFormatterActionExecute;
    FFormatterMenuItem := TMenuItem.Create(MainMenu);
    FFormatterMenuItem.Name := SFormatterMenuItemName;
    FFormatterMenuItem.Action := FFormatterAction;
    FMainMenuItem.Add(FFormatterMenuItem);
    FKeyboardBinder.AddKey(FFormatterMenuItem, TextToShortCut('Ctrl+D'));

    { добавить пункт форматирования текущего кода }
    FFormatSourceAction := TAction.Create(ActionList);
    FFormatSourceAction.ActionList := ActionList;
    FFormatSourceAction.Caption := SFormatSourceActionCaption;
    FFormatSourceAction.OnExecute := OnFormatSourceActionExecute;
    FFormatSourceMenuItem := TMenuItem.Create(MainMenu);
    FFormatSourceMenuItem.Name := SFormatSourceMenuItemName;
    FFormatSourceMenuItem.Action := FFormatSourceAction;
    FMainMenuItem.Add(FFormatSourceMenuItem);
    FKeyboardBinder.AddKey(FFormatSourceMenuItem,
      TextToShortCut('Shift+Ctrl+D'));
  end;
end;

destructor TfdcFormatterWizard.Destroy;
begin
  FKeyboardBinder.Free;
  FFormatterAction.Free;
  FFormatterMenuItem.Free;
  FFormatSourceAction.Free;
  FFormatSourceMenuItem.Free;
  FMainMenuItem.Free;

  inherited;
end;

procedure TfdcFormatterWizard.Execute;
begin
end;

function TfdcFormatterWizard.GetIDString: string;
begin
  Result := SFormatterWizardIDString;
end;

function TfdcFormatterWizard.GetName: string;
begin
  Result := SFormatterWizardName;
end;

function TfdcFormatterWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TfdcFormatterWizard.OnFormatterActionExecute(Sender: TObject);
begin
  if not Assigned(DelExpertDlg) then
    DelExpertDlg := TDelExpertDlg.Create(Application);
  try
    DelExpertDlg.ShowModal;
  finally
    FreeAndNil(DelExpertDlg);
  end;
end;

procedure TfdcFormatterWizard.OnFormatSourceActionExecute(Sender: TObject);
begin
  if not Assigned(DelExpertDlg) then
    DelExpertDlg := TDelExpertDlg.Create(Application);
  try
    Formatter.Activate;
    try
      ProgressDlg.Left := Screen.Width;
      ProgressDlg.Show;
      try
        DelExpertDlg.DoFormatFile('');
      finally
        ProgressDlg.Hide;
      end;
    finally
      Formatter.deActivate;
    end;
  finally
    FreeAndNil(DelExpertDlg);
  end;
end;

end.
