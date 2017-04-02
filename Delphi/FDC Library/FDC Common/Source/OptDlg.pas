{|----------------------------------------------------------------------
 | Unit:        OptDlg
 |
 | Author:      Egbert van Nes
 |
 | Description: Dialog box with options of DelForExp
 |
 | Copyright (c) 2000  Egbert van Nes
 |   All rights reserved
 |   Disclaimer and licence notes: see license.txt
 |
 |----------------------------------------------------------------------
}
unit OptDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Delfor1, Dialogs, Grids, DelForTypes;

type
  TOptionsDlg = class(TForm)
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    PageControl1: TPageControl;
    Indent: TTabSheet;
    Label1: TLabel;
    Label6: TLabel;
    SpacePerIndentEdit: TEdit;
    SpacePerIndentUpDown: TUpDown;
    IndentBeginCheck: TCheckBox;
    IndentTryCheck: TCheckBox;
    IndentTryElseCheck: TCheckBox;
    IndentCommentsCheck: TCheckBox;
    IndentCompDirectivesCheck: TCheckBox;
    NoIndentElseIfCheck: TCheckBox;
    IndentCaseElseCheck: TCheckBox;
    Spaces: TTabSheet;
    SpaceGrid: TStringGrid;
    SpacingCombo: TComboBox;
    Blanklines: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    BlankProcCheck: TCheckBox;
    BlankSubProcCheck: TCheckBox;
    FeedAfterSemiColonCheck: TCheckBox;
    FeedAfterThenCheck: TCheckBox;
    FeedRoundBeginCombo: TComboBox;
    FeedBeforeEndCheck: TCheckBox;
    WrapLinesCheck: TCheckBox;
    WrapPositionEdit: TEdit;
    WrapPositionUpDown: TUpDown;
    FeedAfterVarCheck: TCheckBox;
    FeedElseIfCheck: TCheckBox;
    NoFeedBeforeThenCheck: TCheckBox;
    RemoveDoubleBlankCheck: TCheckBox;
    FeedEachUnitCheck: TCheckBox;
    ExceptSingleCheck: TCheckBox;
    Capitals: TTabSheet;
    Label7: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    UpperCompDirectivesCheck: TCheckBox;
    UpperNumbersCheck: TCheckBox;
    CapFileNameButton: TButton;
    CapFileNameEdit: TEdit;
    ReservedCaseCombo: TComboBox;
    StandDirectivesCombo: TComboBox;
    FillNewWordsCombo: TComboBox;
    EditButton: TButton;
    TabSheet1: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    AlignCommentsCheck: TCheckBox;
    AlignCommentPosEdit: TEdit;
    AlignCommentPosUpDown: TUpDown;
    AlignVarCheck: TCheckBox;
    AlignVarPosEdit: TEdit;
    AlignVarPosUpDown: TUpDown;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    StartCommentOutEdit: TEdit;
    EndCommentOutEdit: TEdit;
    ShortCutEdit: TEdit;
    TabSheet3: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    BeforeMemo: TMemo;
    AfterMemo: TMemo;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DefaultBtn: TButton;
    BorlandButton: TButton;
    HelpButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DefaultBtnClick(Sender: TObject);
    procedure CapFileNameButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure ShortCutEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditButtonClick(Sender: TObject);
    procedure CapFileNameEditChange(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BeforeMemoClick(Sender: TObject);
    procedure BeforeMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BeforeMemoKeyPress(Sender: TObject; var Key: Char);
    procedure BeforeMemoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpacingComboExit(Sender: TObject);
    procedure SpaceGridClick(Sender: TObject);
    procedure SpaceGridTopLeftChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BorlandButtonClick(Sender: TObject);
    procedure FeedAfterThenCheckClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateButtons;
    procedure FillPreview;
    procedure UpdateFormatter;
    procedure SetFormatterSettings(OldSettings: TSettings; OldCapFileName:
      PChar);
    function GetFormatterSettings(OldCapFileName: PChar): TSettings;
    procedure FillSpaceCombo(ACombo: TComboBox);
    procedure AddSpaceRow(RowNo: Integer; StrCol1, StrCol2: string;
      Space: TSpaceBefore);
    function GetSpaceItem(I: Integer): TSpaceBefore;
    procedure SetDefault(BorlandStyle: boolean);
  public
    HelpFile: PChar;
    Formatter: TPascalParser;
    { Public declarations }
  end;

var
  OptionsDlg: TOptionsDlg = nil;

implementation
uses Menus, EditFile, Messages;
{$R *.DFM}
const
  str_None = 'None';
  str_Before = 'Before only';
  str_after = 'After only';
  str_BeforeAfter = 'Before and after';

function StrTrim(Dest: PChar): PChar;
var
  P: PChar;
begin
  if Dest^ <> #0 then
  begin
    P := StrEnd(Dest) - 1;
    while (P > Dest) and (P^ = ' ') do
      Dec(P);
    if P^ <> ' ' then
      inc(P);
    P^ := #0;
  end;
  StrTrim := Dest;
end;

function StrLTrim(Dest: PChar): PChar;
var
  P: PChar;
begin
  P := Dest;
  while (P^ = ' ') and (P^ <> #0) do
    inc(P);
  StrLTrim := StrCopy(Dest, P);
end;

procedure TOptionsDlg.FillSpaceCombo(ACombo: TComboBox);
begin
  with ACombo.Items do
  begin
    Clear;
    Add(str_None);
    Add(str_Before);
    Add(str_after);
    Add(str_BeforeAfter);
  end;
end;

function TOptionsDlg.GetSpaceItem(I: Integer): TSpaceBefore;
var
  S: string;
begin
  S := SpaceGrid.Cells[2, I];
  Result := spNone;
  if S = str_Before then
    Result := spBefore
  else if S = str_after then
    Result := spAfter
  else if S = str_BeforeAfter then
    Result := spBoth;
end;

procedure TOptionsDlg.UpdateFormatter;
begin
  with Formatter do
    if Formatter <> nil then
    begin
      SpacePerIndent := SpacePerIndentUpDown.Position;
      CapFileName := PChar(CapFileNameEdit.Text);
      ShortCutText := ShortCutEdit.Text;
      indentBegin := IndentBeginCheck.Checked;
      IndentComments := IndentCommentsCheck.Checked;
      IndentCompDirectives := IndentCompDirectivesCheck.Checked;
      IndentTry := IndentTryCheck.Checked;
      IndentTryElse := IndentTryElseCheck.Checked;
      IndentCaseElse := IndentCaseElseCheck.Checked;
      UpperCompDirectives := UpperCompDirectivesCheck.Checked;
      UpperNumbers := UpperNumbersCheck.Checked;
      ReservedCase := TCase(ReservedCaseCombo.ItemIndex);
      StandDirectivesCase := TCase(StandDirectivesCombo.ItemIndex);
      BlankProc := BlankProcCheck.Checked;
      BlankSubProc := BlankSubProcCheck.Checked;
      RemoveDoubleBlank := RemoveDoubleBlankCheck.Checked;
      WrapLines := WrapLinesCheck.Checked;
      WrapPosition := WrapPositionUpDown.Position;
      AlignComments := AlignCommentsCheck.Checked;
      AlignCommentPos := AlignCommentPosUpDown.Position;
      AlignVar := AlignVarCheck.Checked;
      AlignVarPos := AlignVarPosUpDown.Position;
      SpaceEqualOper := GetSpaceItem(1);
      SpaceOperators := GetSpaceItem(2);
      SpaceColon := GetSpaceItem(3);
      SpaceSemiColon := GetSpaceItem(4);
      SpaceComma := GetSpaceItem(5);
      SpaceLeftBr := GetSpaceItem(6);
      SpaceRightBr := GetSpaceItem(7);
      SpaceLeftHook := GetSpaceItem(8);
      SpaceRightHook := GetSpaceItem(9);
      FeedAfterThen := FeedAfterThenCheck.Checked;
      ExceptSingle := ExceptSingleCheck.Checked;
      FeedEachUnit := FeedEachUnitCheck.Checked;
      NoFeedBeforeThen := NoFeedBeforeThenCheck.Checked;
      FeedAfterVar := FeedAfterVarCheck.Checked;
      FeedElseIf := FeedElseIfCheck.Checked;
      NoIndentElseIf := NoIndentElseIfCheck.Checked;
      FeedBeforeEnd := FeedBeforeEndCheck.Checked;
      FeedAfterSemiColon := FeedAfterSemiColonCheck.Checked;
      FillNewWords := TFillMode(FillNewWordsCombo.ItemIndex);
      StrLCopy(StartCommentOut, PChar(StartCommentOutEdit.Text), 20);
      StrLTrim(StrTrim(StartCommentOut));
      StrLCopy(EndCommentOut, PChar(EndCommentOutEdit.Text), 20);
      StrLTrim(StrTrim(EndCommentOut));
      FeedRoundBegin := TFeedBegin(FeedRoundBeginCombo.ItemIndex);
    end;
end;

procedure TOptionsDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrCancel then
  begin
    UpdateFormatter;
    //    Formatter.Config(False);
  end;
end;

procedure TOptionsDlg.AddSpaceRow(RowNo: Integer; StrCol1, StrCol2: string;
  Space: TSpaceBefore);
begin
  with SpaceGrid do
  begin
    Cells[0, RowNo] := StrCol1;
    Cells[1, RowNo] := StrCol2;
    case Space of
      spNone: Cells[2, RowNo] := str_None;
      spBefore: Cells[2, RowNo] := str_Before;
      spAfter: Cells[2, RowNo] := str_after;
      spBoth: Cells[2, RowNo] := str_BeforeAfter;
    end;
  end;
end;

procedure TOptionsDlg.FillPreview;
var
  S: string;
begin
  S := Formatter.RootDir + 'preview.pas';
  if FileExists(S) then
    with BeforeMemo do
    begin
      Clear;
      Lines.LoadFromFile(S);
    end
end;

procedure TOptionsDlg.UpdateButtons;
begin
  with Formatter do
    if Formatter <> nil then
    begin
      CapFileNameEdit.Text := string(CapFileName);
      ShortCutEdit.Text := ShortCutText;
      SpacePerIndentUpDown.Position := SpacePerIndent;
      IndentBeginCheck.Checked := indentBegin;
      IndentCommentsCheck.Checked := IndentComments;
      IndentCompDirectivesCheck.Checked := IndentCompDirectives;
      IndentTryCheck.Checked := IndentTry;
      IndentTryElseCheck.Checked := IndentTryElse;
      IndentCaseElseCheck.Checked := IndentCaseElse;
      UpperCompDirectivesCheck.Checked := UpperCompDirectives;
      UpperNumbersCheck.Checked := UpperNumbers;
      ReservedCaseCombo.ItemIndex := Byte(ReservedCase);
      StandDirectivesCombo.ItemIndex := Byte(StandDirectivesCase);
      BlankProcCheck.Checked := BlankProc;
      BlankSubProcCheck.Checked := BlankSubProc;
      RemoveDoubleBlankCheck.Checked := RemoveDoubleBlank;
      with SpaceGrid do
      begin
        RowCount := 10;
        Cells[0, 0] := 'Description';
        Cells[1, 0] := 'Operators';
        Cells[2, 0] := 'Spacing';
        AddSpaceRow(1, 'Equals', ':=', SpaceEqualOper);
        AddSpaceRow(2, 'Math. operators', '< > = + - / * etc.', SpaceOperators);
        AddSpaceRow(3, 'Colon', ':', SpaceColon);
        AddSpaceRow(4, 'Semicolon', ';', SpaceSemiColon);
        AddSpaceRow(5, 'Comma', ',', SpaceComma);
        AddSpaceRow(6, 'Left parenthesis', '(', SpaceLeftBr);
        AddSpaceRow(7, 'Right parenthesis', ')', SpaceRightBr);
        AddSpaceRow(8, 'Left bracket', '[', SpaceLeftHook);
        AddSpaceRow(9, 'Right bracket', ']', SpaceRightHook);
      end;
      FeedAfterSemiColonCheck.Checked := FeedAfterSemiColon;
      FeedEachUnitCheck.Checked := FeedEachUnit;
      FeedAfterThenCheck.Checked := FeedAfterThen;
      ExceptSingleCheck.Checked := ExceptSingle;
      NoFeedBeforeThenCheck.Checked := NoFeedBeforeThen;
      FeedAfterVarCheck.Checked := FeedAfterVar;
      FeedElseIfCheck.Checked := FeedElseIf;
      NoIndentElseIfCheck.Checked := NoIndentElseIf;
      FeedBeforeEndCheck.Checked := FeedBeforeEnd;
      WrapLinesCheck.Checked := WrapLines;
      WrapPositionUpDown.Position := WrapPosition;
      AlignCommentsCheck.Checked := AlignComments;
      AlignCommentPosUpDown.Position := AlignCommentPos;
      AlignVarCheck.Checked := AlignVar;
      AlignVarPosUpDown.Position := AlignVarPos;
      FillNewWordsCombo.ItemIndex := Byte(FillNewWords);
      StartCommentOutEdit.Text := string(StartCommentOut);
      EndCommentOutEdit.Text := string(EndCommentOut);
      FeedRoundBeginCombo.ItemIndex := Integer(FeedRoundBegin);
      SpacePerIndentUpDown.Associate := SpacePerIndentEdit;
      WrapPositionUpDown.Associate := WrapPositionEdit;
      AlignCommentPosUpDown.Associate := AlignCommentPosEdit;
      AlignVarPosUpDown.Associate := AlignVarPosEdit;
      EditButton.Enabled := CapFileNameEdit.Text <> '';
      FeedAfterThenCheckClick(nil)
    end;
end;

function TOptionsDlg.GetFormatterSettings(OldCapFileName: PChar): TSettings;
begin
  with Formatter do
  begin
    Result := Formatter.Settings;
    if CapFileName <> nil then
      StrCopy(OldCapFileName, Formatter.CapFileName)
    else
      OldCapFileName^ := #0;
  end;
end;

procedure TOptionsDlg.SetFormatterSettings(OldSettings: TSettings;
  OldCapFileName: PChar);
begin
  with Formatter do
  begin
    Settings := OldSettings;
    if OldCapFileName^ <> #0 then
      CapFileName := OldCapFileName
    else
      CapFileName := nil;
    CapFileNameEdit.Text := string(OldCapFileName);
  end;
end;

procedure TOptionsDlg.SetDefault(BorlandStyle: Boolean);
var
  OldSettings: TSettings;
  OldCapFileName: array[0..Max_path] of Char;
begin
  with Formatter do
    if Formatter <> nil then
    begin
      SpacingCombo.Hide;
      OldSettings := GetFormatterSettings(OldCapFileName);
      if BorlandStyle then
        Formatter.SetBorland
      else
        Formatter.SetDefault;
      UpdateButtons;
      SetFormatterSettings(OldSettings, OldCapFileName);
      if PageControl1.ActivePage = TabSheet3 then
        TabSheet3Show(nil);
    end;
end;

procedure TOptionsDlg.DefaultBtnClick(Sender: TObject);
begin
  SetDefault(False);
end;

procedure TOptionsDlg.CapFileNameButtonClick(Sender: TObject);
begin
  OpenDialog.FileName := CapFileNameEdit.Text;
  if OpenDialog.Execute then
    CapFileNameEdit.Text := OpenDialog.FileName;
  CapFileNameEditChange(Sender);
end;

procedure TOptionsDlg.HelpButtonClick(Sender: TObject);
begin
  if HelpFile <> nil then
  begin
    WinHelp(0, PChar(HelpFile), HELP_KEY,
      Integer(PageControl1.ActivePage.Caption));
  end;
end;

procedure TOptionsDlg.ShortCutEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  AShortCut: TShortCut;
  S: string;
begin
  if (Shift = [ssAlt, ssCtrl]) or (Shift = [ssCtrl])
    or (Shift = [ssAlt]) or (Key in [VK_F1..vk_f12]) then
  begin
    AShortCut := Menus.ShortCut(Key, Shift);
    S := ShortCutToText(AShortCut);
    if Length(S) > 1 then
      ShortCutEdit.Text := S;
  end;
end;

procedure TOptionsDlg.EditButtonClick(Sender: TObject);
var
  FileEditDlg: TFileEditDlg;
  Cur: TCursor;
begin
  Cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  if Formatter <> nil then
    with Formatter do
      if FillNewWords in [fmAddNewWord, fmAddUse, fmAddUseExcept] then
        SaveCapFile(PChar(CapFileNameEdit.Text));
  FileEditDlg := TFileEditDlg.Create(Self);
  try
    FileEditDlg.LoadFile(CapFileNameEdit.Text);
    Screen.Cursor := Cur;
    FileEditDlg.ShowModal;
    if FileEditDlg.IsChanged then
      Formatter.LoadCapFile(PChar(CapFileNameEdit.Text));
  finally
    Screen.Cursor := Cur;
    FileEditDlg.Free;
  end;
end;

procedure TOptionsDlg.CapFileNameEditChange(Sender: TObject);
begin
  EditButton.Enabled := CapFileNameEdit.Text <> '';
end;

procedure TOptionsDlg.TabSheet3Show(Sender: TObject);
var
  OldSettings: TSettings;
  OldCapFileName: array[0..Max_path] of Char;
begin
  with Formatter do
    if Formatter <> nil then
    begin
      OldSettings := GetFormatterSettings(OldCapFileName);
      UpdateFormatter;
      Formatter.Clear;
      Formatter.Text := PChar(BeforeMemo.Text);
      if Formatter.Parse then
      begin
        AfterMemo.Lines.BeginUpdate;
        AfterMemo.Lines.Clear;
        AfterMemo.Text := Formatter.Text;
        AfterMemo.Lines.EndUpdate;
        BeforeMemoClick(nil);
      end;
      SetFormatterSettings(OldSettings, OldCapFileName);
    end;
end;

procedure TOptionsDlg.BeforeMemoClick(Sender: TObject);
var
  CurLine2, CurLine: Integer;
begin
  CurLine := SendMessage(BeforeMemo.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
  CurLine2 := SendMessage(AfterMemo.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
  SendMessage(AfterMemo.Handle, EM_LINESCROLL, 0, CurLine - CurLine2);
  AfterMemo.SelStart := BeforeMemo.SelStart;
end;

procedure TOptionsDlg.BeforeMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BeforeMemoClick(nil);
end;

procedure TOptionsDlg.BeforeMemoKeyPress(Sender: TObject; var Key: Char);
begin
  BeforeMemoClick(nil);
end;

procedure TOptionsDlg.BeforeMemoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  BeforeMemoClick(nil);
end;

procedure TOptionsDlg.SpacingComboExit(Sender: TObject);
begin
  with SpaceGrid do
    Cells[Col, Row] := SpacingCombo.Text;
end;

procedure TOptionsDlg.SpaceGridClick(Sender: TObject);
var
  Rect: TRect;
  Pnt: TPoint;
begin
  with SpaceGrid do
    if Col = 2 then
    begin
      with SpacingCombo do
        ItemIndex := Items.IndexOf(Cells[2, Row]);
      Rect := CellRect(2, Row);
      with Rect do
      begin
        Pnt :=
          SpacingCombo.Parent.ScreenToClient((SpaceGrid.ClientToScreen(Point(Left,
          Top))));
        SpacingCombo.SetBounds(Pnt.X, Pnt.Y, Right - Left, Bottom - Top);
        SpacingCombo.Show;
      end;
    end;

end;

procedure TOptionsDlg.SpaceGridTopLeftChanged(Sender: TObject);
begin
  SpacingCombo.Hide;
end;

procedure TOptionsDlg.FormShow(Sender: TObject);
begin
  FillSpaceCombo(SpacingCombo);
  UpdateButtons;
  FillPreview;
  PageControl1.ActivePage := Indent;
  CapFileNameButton.Height := CapFileNameEdit.Height;
  CapFileNameButton.Left := CapFileNameEdit.Left + CapFileNameEdit.Width + 3;
  CapFileNameButton.Top := CapFileNameEdit.Top;
end;

procedure TOptionsDlg.BorlandButtonClick(Sender: TObject);
begin
  SetDefault(True);
end;

procedure TOptionsDlg.FeedAfterThenCheckClick(Sender: TObject);
begin
  ExceptSingleCheck.Enabled := FeedAfterThenCheck.Checked;
end;

end.
