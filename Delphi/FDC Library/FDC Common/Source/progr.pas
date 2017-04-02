{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{|----------------------------------------------------------------------
 | Unit:        Progr
 |
 | Author:      Egbert van Nes
 |
 | Description: Progress bar
 |
 | Copyright (c) 2000  Egbert van Nes
 |   All rights reserved
 |   Disclaimer and licence notes: see license.txt
 |
 |----------------------------------------------------------------------
}
unit Progr;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Buttons,
  ExtCtrls, ComCtrls;

type
  TProgressDlg = class(TForm)
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    FileLabel: TLabel;
    ProgressBar1: TProgressBar;
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFileName(AFileName: string);
    { Public declarations }
  end;

var
  ProgressDlg: TProgressDlg;

implementation

{$R *.DFM}

function StrShortenFileName(Dest, Source, CurPath: PChar; MaxLen: Integer):
  PChar;
var
  Buff: array[0..Max_path] of Char;
  LenCurPath: Integer;
  P, P2: PChar;
begin
  Result := Dest;
  if CurPath = nil then
    CurPath := StrCopy(Buff, PChar(GetCurrentDir));
  LenCurPath := StrLen(CurPath);
  if (StrLIComp(Source, CurPath, LenCurPath) = 0) and (StrScan(Source +
    LenCurPath + 1, '\') = nil) then
    StrCopy(Dest, Source + LenCurPath + 1)
  else
    StrCopy(Dest, Source);
  if Integer(StrLen(Dest)) > MaxLen then
  begin
    P := StrScan(Dest, '\');
    P2 := StrRScan(Dest, '\');
    if (P <> nil) and (P2 <> nil) and (P < P2) then
      StrCat(StrCopy(P + 1, '...'), P2);
  end;
  if Integer(StrLen(Dest)) > MaxLen then
    StrCopy(PChar(@Dest[MaxLen]), '...');
end;

procedure TProgressDlg.SetFileName(AFileName: string);
var
  Buff: array[0..255] of Char;
begin
  FileLabel.Caption := string(StrShortenFileName(Buff,
    PChar(AFileName), nil, 40));
  Application.ProcessMessages;
end;

procedure TProgressDlg.CancelBtnClick(Sender: TObject);
begin
  Hide;
end;

end.
