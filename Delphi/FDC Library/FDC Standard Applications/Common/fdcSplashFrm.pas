{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcSplashFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}

unit fdcSplashFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Jpeg, ActnList, fdcCustomFrm, cxContainer, cxEdit,
  dxLayoutLookAndFeels, fdcUtils, cxLookAndFeels;

type

  { ����������� ���� "� ���������" � ���� �������� ���������� }
  TfdcSplashForm = class(TfdcCustomForm)
    pnlMain: TPanel;
    imgMain: TImage;
    lblDetails: TLabel;
    lblInternalName: TLabel;
    lblLegalCopyright: TLabel;
    lblFileDescription: TLabel;
    lblFileVersionCap: TLabel;
    lblFileVersion: TLabel;
    lblCompanyWebLink: TLabel;
    actClose: TAction;
    procedure FormShow(Sender: TObject);
    procedure lblCompanyWebLinkClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure lblFileVersionClick(Sender: TObject);
  protected
    procedure ShowModulesInfo;
  public
    { Public declarations }
  end;


{ �������� ����������� ���� "� ���������" }
procedure ShowAboutBox;
{ �������� ����������� ���� �������� ���������� }
procedure ShowSplashScreen;
{ ������� ������ � �������������� ����������� � ���� �������� }
procedure SetSplashScreenDetails(ADetails: string);
{ ������ ����������� ���� �������� ���������� }
procedure HideSplashScreen;

implementation

{$R *.DFM}

uses
  fdcModulesInfoFrm;

var
  fdcSplashForm: TfdcSplashForm;

procedure ShowAboutBox;
begin
  fdcSplashForm := TfdcSplashForm.Create(nil);
  try
    fdcSplashForm.ShowModal;
  finally
    FreeAndNil(fdcSplashForm);
  end;
end;

procedure ShowSplashScreen;
begin
  if not Assigned(fdcSplashForm) then
    fdcSplashForm := TfdcSplashForm.Create(nil);
  fdcSplashForm.Show;
  fdcSplashForm.Update;
end;

procedure HideSplashScreen;
begin
  if Assigned(fdcSplashForm) then
    FreeAndNil(fdcSplashForm);
end;

procedure SetSplashScreenDetails(ADetails: string);
begin
  { ������� �������������� ���������� � ������ ������ }
  if Assigned(fdcSplashForm) then
  begin
    fdcSplashForm.lblDetails.Caption := ADetails;
    fdcSplashForm.Update;
  end;
end;

{ TfdcSplashForm }

procedure TfdcSplashForm.ShowModulesInfo;
var
  ModulesInfoForm: TfdcModulesInfoForm;
begin
  ModulesInfoForm := TfdcModulesInfoForm.Create(nil);
  try
    ModulesInfoForm.ShowModal;
  finally
    ModulesInfoForm.Free;
  end;
end;

procedure TfdcSplashForm.FormShow(Sender: TObject);
var
  InternalName, FileDescription,
  FileVersion, LegalCopyright: string;
begin
  inherited;

  { ��������� ���������� � ������ }
  GetAppVersion(
    ['InternalName', 'FileDescription', 'FileVersion', 'LegalCopyright'],
    [@InternalName,  @FileDescription,  @FileVersion,  @LegalCopyright]);

  { �������� ����� }
  fdcSplashForm.lblInternalName.Caption := InternalName;
  fdcSplashForm.lblFileDescription.Caption := FileDescription;
  fdcSplashForm.lblFileVersion.Caption := FileVersion;
  fdcSplashForm.lblLegalCopyright.Caption := LegalCopyright;

  {
    ���� ����� ������������ ��� ���������, �� ���������
    ��� ��� ���� "� ���������", ����� - ���� ��������.
  }
  if fsModal in FormState then begin
    pnlMain.Enabled := True;
    lblDetails.Caption := '';
    actClose.Enabled := True;
    lblFileVersion.Cursor := crHandPoint;
    lblFileVersion.Hint := '������� ����� �������� �������������� ����������';
    lblFileVersion.ShowHint := True;
    lblFileVersion.OnClick := lblFileVersionClick;
  end else begin
    pnlMain.Enabled := False;
    lblDetails.Caption := '�������� �������...';
    actClose.Enabled := False;
    lblFileVersion.Cursor := crDefault;
    lblFileVersion.Hint := '';
    lblFileVersion.ShowHint := False;
    lblFileVersion.OnClick := nil;
  end;
  lblFileVersionCap.Cursor := lblFileVersion.Cursor;
  lblFileVersionCap.Hint := lblFileVersion.Hint;
  lblFileVersionCap.ShowHint := lblFileVersion.ShowHint;
  lblFileVersionCap.OnClick := lblFileVersion.OnClick;
end;

procedure TfdcSplashForm.lblCompanyWebLinkClick(Sender: TObject);
begin
  { ������� �������� �������� �������� }
  ShellOpen(lblCompanyWebLink.Caption);
end;

procedure TfdcSplashForm.actCloseExecute(Sender: TObject);
begin
  { ������� ����� }
  Close;
end;

procedure TfdcSplashForm.lblFileVersionClick(Sender: TObject);
begin
  inherited;
  { �������� ���������� � ����������� ������� }
  ShowModulesInfo;
end;

end.

