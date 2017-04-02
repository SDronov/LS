{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: fdcCustomWindowFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcCustomWindowFrm;

interface

uses
  Windows, Forms, Classes, XPMan, Controls, StdCtrls, AppEvnts,
  ActnList, SysUtils, ImgList, cxGraphics, dxBar, cxControls,
  dxStatusBar, cxContainer, cxEdit, dxLayoutLookAndFeels,
  fdcCustomDataFrm, cxLookAndFeels, cxLabel, StdActns, dxDockControl,
  fdcCustomFrm, fdcParamsHolder;

type
  { базовая форма окна с меню }
  TfdcCustomWindowForm = class(TfdcCustomDataForm)
    StatusBar: TdxStatusBar;
    miFile: TdxBarSubItem;
    miEdit: TdxBarSubItem;
    miHelp: TdxBarSubItem;
    miHelpContents: TdxBarButton;
    miAbout: TdxBarButton;
    miView: TdxBarSubItem;
    ApplicationEvents: TApplicationEvents;
    miShowStatusBar: TdxBarButton;
    miClose: TdxBarButton;
    actHelp: TAction;
    actAbout: TAction;
    actShowStatusBar: TAction;
    actClose: TAction;
    StatusBarContainer0: TdxStatusBarContainerControl;
    lblHint: TcxLabel;
    actEditCut: TEditCut;
    actEditCopy: TEditCopy;
    actEditPaste: TEditPaste;
    actEditSelectAll: TEditSelectAll;
    actEditDelete: TEditDelete;
    miEditCut: TdxBarButton;
    miEditCopy: TdxBarButton;
    miEditPaste: TdxBarButton;
    miEditSelectAll: TdxBarButton;
    miEditDelete: TdxBarButton;
    actEditUndo: TEditUndo;
    miEditUndo: TdxBarButton;
    DockingManager: TdxDockingManager;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actShowStatusBarUpdate(Sender: TObject);
    procedure actShowStatusBarExecute(Sender: TObject);
  private
    { отобразить информацию о подсказке }
    procedure ShowHintInfo(AHintInfo: string);
  protected
    { Краткое название приложения.
      Загружается из информации о версии приложения. }
    InternalName: string;

    { Показать окно "О программе". По умолчанию выводится
      стандартное окно "О программе".

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    procedure ShowAbout; virtual;

    { Вывести справку по приложению. По умолчанию выводится
      стандартная справка в формате CHM. Файл справки должен
      иметь имя, совпадающее с именем исполняемого файла
      приложения.

      Переопределите данную функцию чтобы реализовать
      ваше собственное поведение. }
    procedure ShowHelp; virtual;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  fdcUtils, fdcSplashFrm;

procedure TfdcCustomWindowForm.ShowHintInfo(AHintInfo: string);
begin
  { отобразить информацию о подсказке в строке состояния }
  lblHint.Caption := AHintInfo;
end;

procedure TfdcCustomWindowForm.ShowAbout;
begin
  { показать стандартное окно "О программе" }
  ShowAboutBox;
end;

procedure TfdcCustomWindowForm.ShowHelp;
begin
  { вывести системное окно справки }
  ShowHelpContents('..\Help\' +
    ChangeFileExt(ExtractFileName(Application.ExeName), '.chm'));
end;

procedure TfdcCustomWindowForm.FormCreate(Sender: TObject);
begin
  inherited;
  
  { получить краткое название приложения }
  GetAppVersion(['InternalName'], [@InternalName]);

  { обновить заголовок пункта меню "Справка" }
  actHelp.Caption := Format('&Справка: %s', [InternalName]);
end;

procedure TfdcCustomWindowForm.ApplicationEventsHint(Sender: TObject);
begin
  { вывести информацию о текущей подсказке }
  ShowHintInfo(TApplication(Sender).Hint);
end;

procedure TfdcCustomWindowForm.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfdcCustomWindowForm.actAboutExecute(Sender: TObject);
begin
  ShowAbout;
end;

procedure TfdcCustomWindowForm.actHelpExecute(Sender: TObject);
begin
  ShowHelp;
end;

procedure TfdcCustomWindowForm.actShowStatusBarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := StatusBar.Visible;
end;

procedure TfdcCustomWindowForm.actShowStatusBarExecute(Sender: TObject);
begin
  StatusBar.Visible := not StatusBar.Visible;
end;

end.

