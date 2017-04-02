{
  Copyright © Fors Development Center. 
  All rights reserved.

  $Workfile: fdcNamePropertyEditor.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}

unit fdcNamePropertyEditor;

interface

{$I fdcIDEVersion.inc}

uses
{$IFDEF DELPHI5}
  DsgnIntf;
{$ELSE}
{$IFDEF DELPHI7}
  DesignIntf,
  DesignEditors;
{$ENDIF}
{$ENDIF}

const
  SComponentsNameINI = 'fdcComponentsName.ini';

type
  { TfdcComponentNameProperty }
  TfdcComponentNameProperty = class(TComponentNameProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

uses Windows, SysUtils, Classes, Forms, Controls, IniFiles,
  fdcStrings, fdcNamePropertyFrm;

const
  SPrefixSecName = 'Component''s Prefixes';
  SSuffixSecName = 'Component''s Suffixes';

var
  PrefixList: TStringList;
  SuffixList: TStringList;

  { TfdcComponentNameProperty }

function TfdcComponentNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

procedure TfdcComponentNameProperty.Edit;

  procedure CreateLists;
  begin
    PrefixList := TStringList.Create;
    SuffixList := TStringList.Create;
    with TIniFile.Create(SComponentsNameINI) do
      try
        ReadSectionValues(SPrefixSecName, PrefixList);
        ReadSectionValues(SSuffixSecName, SuffixList);
      finally
        Free;
      end;
  end;

  procedure FreeLists;
  begin
    if Assigned(PrefixList) then
      PrefixList.Free;
    if Assigned(SuffixList) then
      SuffixList.Free;
  end;

var
  s: string;
  ss: string;
  MComponent: TComponent;
  ComponentClass: TClass;
begin
  CreateLists;
  try
    with TfdcNamePropertyForm.Create(Application) do
      try
        { определяем компонент }
        MComponent := TComponent(GetComponent(0));

        { устанавливаем заголовок окна }
        if MComponent.Owner <> nil then
          s := MComponent.Owner.Name + '.'
        else
          s := '';
        Caption := s + MComponent.Name + '.' + GetName;

        { выбираем префикс и суффикс }
        Prefix := '';
        Suffix := '';
        lblClassName.Caption := MComponent.ClassName;
        ComponentClass := MComponent.ClassType;
        while ComponentClass.ClassName <> 'TComponent' do
        begin
          if Prefix = '' then
            Prefix := PrefixList.Values[ComponentClass.ClassName];
          if Suffix = '' then
            Suffix := SuffixList.Values[ComponentClass.ClassName];
          ComponentClass := ComponentClass.ClassParent;
        end;

        { получаем название компонента без префиксов и суффиксов }
        s := GetValue;
        ss := s;
        if IsBeginWith(s, Prefix) then
          ss := DeleteSubString(s, 1, length(Prefix));
        if IsEndWith(ss, Suffix) then
          ss := DeleteSubString(ss, length(ss) - length(Suffix) + 1,
            length(Suffix));

        { показываем форму }
        edtName.Text := ss;
        ShowModal;

        { получаем название компонента }
        if ModalResult = mrOk then
          SetValue(edtNamePreview.Text);

      finally
        Free;
      end;
  finally
    FreeLists;
  end;
end;

end.

