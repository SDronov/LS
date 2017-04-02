unit FontSetter;

interface

uses
  Classes, FormMngr, Forms;

type

  TFontSetter = class(TBaseFormNotifier)
//  private
  protected
    procedure ReadFont;
    procedure SaveFont;
  protected
    procedure FormCreated(AForm: TCustomForm); override;
  end;

implementation

uses
  DictDm, fdcCustomFrm, Graphics, fdcUtils, Variants, DB, SysUtils;

{ TFontSetter }

procedure TFontSetter.FormCreated(AForm: TCustomForm);
var
  AFont: TFont;
begin
  if (Application.MainForm <> nil) and (AForm is TfdcCustomForm) then
  begin
    AFont := TFont.Create;
    try
      AFont.Assign(DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font);
      if (AForm is TfdcCustomForm) and
        (TfdcCustomForm(AForm).LayoutLookAndFeelList <> nil) then
      begin
        AForm.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutWebLookAndFeel.GroupOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutOfficeLookAndFeel.GroupOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutOfficeLookAndFeel.ItemOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutWebToolLookAndFeel.GroupOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).LayoutWebToolLookAndFeel.ItemOptions.CaptionOptions.Font.Assign(AFont);
        TfdcCustomForm(AForm).DefaultEditStyleController.Style.Font.Assign(AFont);
        TfdcCustomForm(AForm).OfficeEditStyleController.Style.Font.Assign(AFont);
        TfdcCustomForm(AForm).WebEditStyleController.Style.Font.Assign(AFont);
      end;
    finally
      AFont.Free;
    end;
  end;
end;

const
  SAppFontName = 'AppFontName';

procedure TFontSetter.ReadFont;
var
  AFont: TFont;
  S: String;
  FontStyles: TFontStyles;
  FontValue: String;
  P: Integer;
  I: Integer;
begin
  AFont := TFont.Create;
  try
    AFont.Assign(DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font);
    P := 1;
    FontValue := VarToStr(ReadRegistryValue(GetAppRegistryKey, SAppFontName, rvString));
    S := ExtractFieldName(FontValue, P);
    if S <> '' then
       AFont.Name := S;

    S := ExtractFieldName(FontValue, P);
    if TryStrToInt(S, I) then
       AFont.Size := I;

    S := ExtractFieldName(FontValue, P);
    if TryStrToInt(S, I) and (I >= 0) and (I <= 3) then
    begin
       PByte(@FontStyles)^ := I;
       AFont.Style := FontStyles;
    end;

    S := ExtractFieldName(FontValue, P);
    if TryStrToInt(S, I) then
       AFont.Charset := I;

    DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font.Assign(AFont);
  finally
    AFont.Free;
  end;
end;

procedure TFontSetter.SaveFont;
var
  AFont: TFont;
  S: String;
  FontStyles_: Integer;
  FontStyles: TFontStyles;
begin
  AFont := DictData.LayoutWebLookAndFeel.ItemOptions.CaptionOptions.Font;
  FontStyles := AFont.Style;
  FontStyles_ := PByte(@FontStyles)^;
  S := Format('%s;%d;%d;%d', [AFont.Name, AFont.Size, FontStyles_, AFont.CharSet]);
  WriteRegistryValue(GetAppRegistryKey, SAppFontName, S);
end;

initialization
    FormManager.AddNotifier(TFontSetter.Create);

end.
 