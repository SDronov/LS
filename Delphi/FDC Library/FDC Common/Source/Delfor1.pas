{|----------------------------------------------------------------------
 | Class:       TPascalParser
 |
 | Author:      Egbert van Nes
 |
 | Description: Format pascal code
 |
 | Copyright (c) 2000  Egbert van Nes
 |
 | Redistribution and use in source and binary form, with or without
 | modification, are permitted provided that the following conditions
 | are met:
 |
 | 1. Redistributions of source code must retain the above copyright
 |    notice, this list of conditions and the following disclaimer.
 |    If the source is modified, the complete original and unmodified
 |    source code has to distributed with the modified version.
 |
 | 2. Redistributions in binary form must reproduce the above
 |    copyright notice, these licence conditions and the disclaimer
 |    found at the end of this licence agreement in the documentation
 |    and/or other materials provided with the distribution.
 |
 | 3. Software using this code must contain a visible line of credit.
 |
 | 4. If my code is used in a "for profit" product, you have to donate
 |    to a registered charity in an amount that you feel is fair.
 |    You may use it in as many of your products as you like.
 |    Proof of this donation must be provided to the author of
 |    this software.
 |
 | 5. If you for some reasons don't want to give public credit to the
 |    author, you have to donate three times the price of your software
 |    product, or any other product including this component in any way,
 |    but no more than $500 US and not less than $200 US, or the
 |    equivalent thereof in other currency, to a registered charity.
 |    You have to do this for every of your products, which uses this
 |    code separately.
 |    Proof of this donations must be provided to the author of
 |    this software.
 |
 | DISCLAIMER:
 |
 | THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS'.
 |
 | ALL EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 | THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 | PARTICULAR PURPOSE ARE DISCLAIMED.
 |
 | IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 | INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 | (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 | OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 | INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 | WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 | NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 | THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 |
 |---------------------------------------------------------------------- |----------------------------------------------------------------------}

unit Delfor1;

interface

uses SysUtils, OObjects, Classes, ExtCtrls, Menus, DelForTypes, DelforEng;

{
  Main interface methods:

  TPascalParser = class(TObject)
  public
    constructor Create(ARootdir: PChar);
    procedure SetDefault;
    procedure LoadFromFile(AFileName: PChar);
    procedure LoadFromList(AList: TStringList);
    function Parse: Boolean;
    procedure WriteToFile(AFileName: PChar);
    destructor Destroy; override;
    property Text: PChar read GetTextStr write SetTextStr;
    property Settings: TSettings read FSettings write FSettings;
  end;
}
type
  TPascalParser = class(TObject)
  private
    //Timer: TTimer;
    FSettings: TSettings;
    FCapFileName: PChar;
    CapFileTime: Integer;
    FOnProgress: TProgressEvent;
    //    FCfgFile: string;
    FRootDir: string;
    procedure SetFillNewWords(AFillNewWords: TFillMode);
    procedure SetCapFileName(AFileName: PChar);
    //    procedure TimerTimer(Sender: TObject);
    function GetNewCapFileTime: Integer;
    procedure SetTextStr(AText: PChar);
    function GetShortCut: TShortCut;
    procedure SetShortCut(AShortCut: TShortCut);
    procedure SetShortCutText(AShortCut: string);
    function GetShortCutText: string;
    function GetTextStr: PChar;
    function GetRootDir: string;
    procedure SetRootdir(const Value: string);
    procedure SetOnProgress(const Value: TProgressEvent);
  public
    procedure Activate;
    procedure deActivate;
    procedure SaveCapFile(AFileName: PChar);
    procedure LoadCapFile(AFileName: PChar);
    constructor Create(ARootdir: PChar);
    procedure Clear;
    procedure SetDefault;
    procedure SetBorland;
    procedure LoadFromFile(AFileName: PChar);
    procedure LoadFromList(AList: TStringList);
    function Parse: Boolean;
    //    procedure Config(DoRead: Boolean);
    procedure WriteToFile(AFileName: PChar);
    destructor Destroy; override;
    property SpacePerIndent: Integer read FSettings.SpacePerIndent write
      FSettings.SpacePerIndent;
    property SpaceOperators: TSpaceBefore read FSettings.SpaceOperators write
      FSettings.SpaceOperators;
    property SpaceEqualOper: TSpaceBefore read FSettings.SpaceEqualOper write
      FSettings.SpaceEqualOper;
    property SpaceColon: TSpaceBefore read FSettings.SpaceColon write
      FSettings.SpaceColon;
    property SpaceComma: TSpaceBefore read FSettings.SpaceComma write
      FSettings.SpaceComma;
    property SpaceSemiColon: TSpaceBefore read FSettings.SpaceSemiColon write
      FSettings.SpaceSemiColon;
    property SpaceLeftBr: TSpaceBefore read FSettings.SpaceLeftBr write
      FSettings.SpaceLeftBr;
    property SpaceRightBr: TSpaceBefore read FSettings.SpaceRightBr write
      FSettings.SpaceRightBr;
    property SpaceLeftHook: TSpaceBefore read FSettings.SpaceLeftHook write
      FSettings.SpaceLeftHook;
    property SpaceRightHook: TSpaceBefore read FSettings.SpaceRightHook write
      FSettings.SpaceRightHook;
    property UpperCompDirectives: Boolean read FSettings.UpperCompDirectives
      write FSettings.UpperCompDirectives;
    property UpperNumbers: Boolean read FSettings.UpperNumbers write
      FSettings.UpperNumbers;
    property ReservedCase: TCase read FSettings.ReservedCase write
      FSettings.ReservedCase;
    property StandDirectivesCase: TCase read FSettings.StandDirectivesCase write
      FSettings.StandDirectivesCase;
    property ChangeIndent: Boolean read FSettings.ChangeIndent write
      FSettings.ChangeIndent;
    property indentBegin: Boolean read FSettings.indentBegin write
      FSettings.indentBegin;
    property NoIndentElseIf: Boolean read FSettings.NoIndentElseIf write
      FSettings.NoIndentElseIf;
    property IndentComments: Boolean read FSettings.IndentComments write
      FSettings.IndentComments;
    property IndentCompDirectives: Boolean read FSettings.IndentCompDirectives
      write FSettings.IndentCompDirectives;
    property IndentTry: Boolean read FSettings.IndentTry write
      FSettings.IndentTry;
    property IndentTryElse: Boolean read FSettings.IndentTryElse write
      FSettings.IndentTryElse;
    property IndentCaseElse: Boolean read FSettings.IndentCaseElse write
      FSettings.IndentCaseElse;
    property BlankProc: Boolean read FSettings.BlankProc write
      FSettings.BlankProc;
    property RemoveDoubleBlank: Boolean read FSettings.RemoveDoubleBlank write
      FSettings.RemoveDoubleBlank;
    property FeedRoundBegin: TFeedBegin read FSettings.FeedRoundBegin write
      FSettings.FeedRoundBegin;
    property FeedAfterThen: Boolean read FSettings.FeedAfterThen write
      FSettings.FeedAfterThen;
    property ExceptSingle: Boolean read FSettings.ExceptSingle write
      FSettings.ExceptSingle;
    property NoFeedBeforeThen: Boolean read FSettings.NoFeedBeforeThen write
      FSettings.NoFeedBeforeThen;
    property FeedElseIf: Boolean read FSettings.FeedElseIf write
      FSettings.FeedElseIf;
    property FeedEachUnit: Boolean read FSettings.FeedEachUnit write
      FSettings.FeedEachUnit;
    property FeedAfterVar: Boolean read FSettings.FeedAfterVar write
      FSettings.FeedAfterVar;
    property WrapLines: Boolean read FSettings.WrapLines write
      FSettings.WrapLines;
    property WrapPosition: Byte read FSettings.WrapPosition write
      FSettings.WrapPosition;
    property AlignCommentPos: Byte read FSettings.AlignCommentPos write
      FSettings.AlignCommentPos;
    property AlignComments: Boolean read FSettings.AlignComments write
      FSettings.AlignComments;
    property AlignVarPos: Byte read FSettings.AlignVarPos write
      FSettings.AlignVarPos;
    property AlignVar: Boolean read FSettings.AlignVar write
      FSettings.AlignVar;
    property FeedBeforeEnd: Boolean read FSettings.FeedBeforeEnd write
      FSettings.FeedBeforeEnd;
    property FillNewWords: TFillMode read FSettings.FillNewWords write
      SetFillNewWords;
    property FeedAfterSemiColon: Boolean read FSettings.FeedAfterSemiColon write
      FSettings.FeedAfterSemiColon;
    property BlankSubProc: Boolean read FSettings.BlankSubProc write
      FSettings.BlankSubProc;
    property CommentFunction: Boolean read FSettings.CommentFunction write
      FSettings.CommentFunction;
    property CommentUnit: Boolean read FSettings.CommentUnit write
      FSettings.CommentUnit;
    property StartCommentOut: TCommentArray read FSettings.StartCommentOut write
      FSettings.StartCommentOut;
    property EndCommentOut: TCommentArray read FSettings.EndCommentOut write
      FSettings.EndCommentOut;
    property CapFileName: PChar read FCapFileName write SetCapFileName;
    property Text: PChar read GetTextStr write SetTextStr;
    property OnProgress: TProgressEvent read FOnProgress write SetOnProgress;
    property ShortCutText: string read GetShortCutText write SetShortCutText;
    property ShortCut: TShortCut read GetShortCut write SetShortCut;
    //    property CfgFile: string read FCfgFile write FCfgFile;
    property RootDir: string read GetRootDir write SetRootdir;
    property Settings: TSettings read FSettings write FSettings;
  end;

  //var
  //  Formatter: TPascalParser;

implementation

uses
  Windows, Dialogs,
  {$WARN UNIT_PLATFORM OFF}
  FileCtrl;
  {$WARN UNIT_PLATFORM ON}

constructor TPascalParser.Create(ARootdir: PChar);
begin
  //Formatter := Self;
  CapFileTime := -1;
  SetDefault;

  //Timer := TTimer.Create(nil); xxx
  //Timer.Interval := 1000;
  //Timer.OnTimer := TimerTimer;

  RootDir := ARootdir;
  Activate;
end;

procedure TPascalParser.Activate;
begin
  LoadDll {(PChar(RootDir))};
end;

procedure TPascalParser.deActivate;
begin
  FreeDll;
end;

procedure TPascalParser.SetDefault;
begin
  CapFileName := nil;
  WrapLines := False;
  WrapPosition := 81;
  AlignCommentPos := 40;
  AlignComments := False;
  AlignVarPos := 20;
  AlignVar := False;
  SpaceEqualOper := spBoth;
  SpaceOperators := spBoth;
  SpaceColon := spAfter;
  SpaceComma := spAfter;
  SpaceSemiColon := spAfter;
  SpaceLeftBr := spNone;
  SpaceRightBr := spNone;
  SpaceLeftHook := spNone;
  SpaceRightHook := spNone;
  ReservedCase := rfLowerCase;
  StandDirectivesCase := rfLowerCase;
  ChangeIndent := True;
  indentBegin := False;
  IndentComments := False;
  IndentCompDirectives := False;
  IndentTryElse := False;
  IndentCaseElse := False;
  FeedAfterThen := False;
  ExceptSingle := False;
  FeedElseIf := False;
  FeedEachUnit := False;
  NoFeedBeforeThen := False;
  NoIndentElseIf := False;
  FeedAfterVar := False;
  FeedBeforeEnd := False;
  FeedRoundBegin := UnChanged;
  FeedAfterSemiColon := False;
  FillNewWords := fmUnchanged;
  IndentTry := False;
  UpperCompDirectives := True;
  UpperNumbers := True;
  SpacePerIndent := 2;
  BlankProc := True;
  RemoveDoubleBlank := False;
  BlankSubProc := False;
  CommentFunction := False;
  CommentUnit := False;
  StrCopy(StartCommentOut, '{(*}');
  StrCopy(EndCommentOut, '{*)}');
  ShortCut := Menus.ShortCut(Word('D'), [ssCtrl]);
end;

procedure TPascalParser.SetBorland;
begin
  SetDefault;
  IndentTry := True;
  IndentTryElse := True;
  IndentCaseElse := True;
  WrapLines := True;
  IndentComments := True;
  FeedAfterThen := True;
  ExceptSingle := False;
  NoFeedBeforeThen := True;
  FeedAfterVar := True;
  FeedBeforeEnd := True;
  FeedRoundBegin := NewLine;
  FeedAfterSemiColon := True;
  RemoveDoubleBlank := True;
end;

function TPascalParser.GetNewCapFileTime: Integer;
var
  Handle: Integer;
begin
  Handle := FileOpen(FCapFileName, fmOpenRead);
  Result := FileGetDate(Handle);
  FileClose(Handle);
end;

procedure TPascalParser.SetCapFileName(AFileName: PChar);
var
  P: PChar;
  S: array[0..400] of Char;
  TimeStamp: Integer;
begin
  if AFileName <> FCapFileName then
  begin
    StrDispose(FCapFileName);
    if AFileName <> nil then
    begin
      while AFileName^ = ' ' do
        inc(AFileName);
      P := StrEnd(StrCopy(S, AFileName)) - 1;
      while P^ = ' ' do
        Dec(P);
      (P + 1)^ := #0;
      FCapFileName := StrNew(S);
    end
    else
      FCapFileName := nil;

    if (FCapFileName <> nil) and FileExists(FCapFileName) then
    begin
      TimeStamp := GetNewCapFileTime;
      if (TimeStamp <> CapFileTime) then
        LoadCapFile(FCapFileName);
    end
    else
    begin
      Formatter_LoadCapFile(nil);
      CapFileTime := -1;
    end;
  end;
end;

procedure TPascalParser.SetShortCutText(AShortCut: string);
begin
  ShortCut := TextToShortCut(AShortCut);
end;

function TPascalParser.GetShortCutText: string;
begin
  Result := ShortCutToText(ShortCut);
end;

procedure TPascalParser.SaveCapFile(AFileName: PChar);
var
  Path: string;
begin
  Path := ExtractFilePath(ExpandFileName(AFileName));
  if not DirectoryExists(Path) then
    ForceDirectories(Path);
  Formatter_SaveCapFile(AFileName);
end;

procedure TPascalParser.Clear;
begin
  if CurrentDllVersion <> Formatter_Version then
    Exception.Create('Wrong version of DELFORDLL');
  Formatter_clear;
end;

procedure TPascalParser.LoadFromFile(AFileName: PChar);
begin
  Formatter_LoadFromFile(AFileName, @FSettings, SizeOf(TSettings));
end;

procedure TPascalParser.LoadFromList(AList: TStringList);
begin
  Formatter_LoadFromList(AList, @FSettings, SizeOf(TSettings));
end;

function TPascalParser.Parse: Boolean;
begin
  Result := Formatter_Parse(@FSettings, SizeOf(TSettings));
end;

(*procedure TPascalParser.Config(DoRead: Boolean);
{$IFDEF ver100}
type
  Cardinal = Integer;
{$ENDIF}
const
  Sign: Cardinal = $623DFE51;
var
  Signature: Cardinal;
  Err, Size: Integer;
  Cfg: file;
  S: array[0..260] of Char;
begin
  if CfgFile = '' then
    CfgFile := 'DelForExp.cfg';
  CfgFile := ChangeFileExt(CfgFile, '.cfg');
  if DoRead then
  begin
    if not FileExists(CfgFile) then
      CapFileName := nil
    else
    begin
      if FillNewWords in [fmAddNewWord, fmAddUse, fmAddUseExcept] then
        SaveCapFile(CapFileName);
      AssignFile(Cfg, CfgFile);
      try
        Reset(Cfg, 1);
        BlockRead(Cfg, Signature, SizeOf(Signature), Err);
        if (Err = SizeOf(Signature)) and (Signature = Sign) then
        begin
          BlockRead(Cfg, FSettings, SizeOf(Settings), Err);
          BlockRead(Cfg, Size, SizeOf(Integer));
          if Size > 0 then
          begin
            BlockRead(Cfg, S, Size);
            CapFileName := S;
          end
          else
            CapFileName := nil;
          ShortCut := Settings.ShortCut;
        end;
      finally
        CloseFile(Cfg);
      end;
    end;
  end
  else
  begin
    AssignFile(Cfg, CfgFile);
    try
      Rewrite(Cfg, 1);
      Signature := Sign;
      BlockWrite(Cfg, Signature, SizeOf(Signature));
      BlockWrite(Cfg, Settings, SizeOf(Settings));
      if CapFileName = nil then
      begin
        Size := 0;
        BlockWrite(Cfg, Size, SizeOf(Integer));
      end
      else
      begin
        Size := StrLen(CapFileName) + 1;
        BlockWrite(Cfg, Size, SizeOf(Integer));
        StrCopy(S, CapFileName);
        BlockWrite(Cfg, S, Size);
      end;
    finally
      CloseFile(Cfg);
    end;
  end;
end;
 *)

procedure TPascalParser.WriteToFile(AFileName: PChar);
begin
  Formatter_writeToFile(AFileName);
end;

procedure TPascalParser.SetTextStr(AText: PChar);
begin
  Formatter_SetTextStr(AText);
end;

function TPascalParser.GetTextStr: PChar;
begin
  Result := Formatter_GetTextStr;
end;

destructor TPascalParser.Destroy;
begin
  inherited Destroy;
  if @Formatter_Destroy <> nil then
  begin
    if FillNewWords in [fmAddNewWord, fmAddUse, fmAddUseExcept] then
      SaveCapFile(CapFileName);
    CapFileName := nil;
    Formatter_Destroy;
  end;
end;

procedure TPascalParser.SetShortCut(AShortCut: TShortCut);
begin
  FSettings.ShortCut := AShortCut;
  //if IDETextExpert <> nil then xxx
  //  IDETextExpert.MenuShortCut := AShortCut;
end;

{procedure TPascalParser.TimerTimer(Sender: TObject);
begin
  ShortCut := Settings.ShortCut;
  Timer.Free;
  Timer := nil;
end;}

procedure TPascalParser.SetFillNewWords(AFillNewWords: TFillMode);
begin
  if Settings.FillNewWords in [fmAddNewWord, fmAddUse, fmAddUseExcept] then
    SaveCapFile(CapFileName);
  FSettings.FillNewWords := AFillNewWords;
end;

function TPascalParser.GetRootDir: string;
begin
  if FRootDir = '' then
    FRootDir := ExtractFilePath(ParamStr(0));
  Result := FRootDir;
end;

procedure TPascalParser.SetRootdir(const Value: string);
begin
  FRootDir := Value;
  if (FRootDir <> '') and
    (FRootDir[Length(FRootDir)] <> '\') then
    FRootDir := FRootDir + '\';
end;

function TPascalParser.GetShortCut: TShortCut;
begin
  Result := TShortCut(Settings.ShortCut);
end;

procedure TPascalParser.LoadCapFile(AFileName: PChar);
begin
  Formatter_LoadCapFile(AFileName);
end;

procedure TPascalParser.SetOnProgress(const Value: TProgressEvent);
begin
  FOnProgress := Value;
  Formatter_SetOnProgress(Value);
end;

end.

