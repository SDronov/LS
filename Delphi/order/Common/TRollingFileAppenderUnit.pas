{
   Copyright 2005-2006 Log4Delphi Project

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
}
{*----------------------------------------------------------------------------
   Contains the TRollingFileAppender class.
   @version 0.5
   @author <a href="mailto:tcmiller@users.sourceforge.net">Trevor Miller</a>
  ----------------------------------------------------------------------------}
unit TRollingFileAppenderUnit;

interface

uses
   Classes, Log4D;

type
{*----------------------------------------------------------------------------
   RollingFileAppender appends log events to a file, occasionally rotating
   the log file.
  ----------------------------------------------------------------------------}
   TRollingFileAppender = class (TLogFileAppender)
   private
   protected
     FMaxBackupIndex : Integer;
     FMaxFileSize : Int64;
  protected
    procedure SetOption(const Name, Value: string); override;
   public
//      constructor Create(); Overload;
      constructor Create(const Name, FileName: string;
      const Layout: ILogLayout = nil; const Append: Boolean = True;
      AMaxBackupIndex : Integer = 0 ; AMaxFileSize : Integer = 10*1024*1024);
      overload;  virtual;

     procedure SetMaxBackupIndex(AIndex : Integer); Virtual;
     procedure SetMaxFileSize(ASize : Int64); Overload; Virtual;
     procedure SetMaxFileSize(ASize : String); Overload; Virtual;
     procedure DoAppend(const Message: string); override;
//     procedure Append(AEvent : TLoggingEvent); Override;
     procedure RollOver(); Virtual;
     function GetMaxBackupIndex() : Integer; Virtual;
     function GetMaxFileSize() : Int64; Virtual;
   end;

implementation

uses
  SysUtils;

const ONE_KB = 1024;
const ONE_MB = 1024 * ONE_KB;
const ONE_GB = 1024 * ONE_MB;

//constructor TRollingFileAppender.Create();
//begin
//  inherited Create;
//  Self.FMaxBackupIndex := 1;
//  Self.FMaxFileSize := 10*1024*1024;
//end;

constructor TRollingFileAppender.Create(const Name, FileName: string;
      const Layout: ILogLayout = nil; const Append: Boolean = True;
      AMaxBackupIndex : Integer = 0 ; AMaxFileSize : Integer = 10*1024*1024);
begin
  inherited Create(Name, FileName, Layout, Append);
  Self.FMaxBackupIndex := AMaxBackupIndex;
  Self.FMaxFileSize := AMaxFileSize;
end;                


procedure TRollingFileAppender.SetMaxBackupIndex(AIndex : Integer);
begin
  if AIndex >= 0 then
   Self.FMaxBackupIndex := AIndex;
end;

procedure TRollingFileAppender.SetMaxFileSize(ASize : Int64);
begin
  if ASize > 0 then
    Self.FMaxFileSize := ASize;
end;

procedure TRollingFileAppender.SetMaxFileSize(ASize : String);
var
  MaxFileSize: Int64;
begin
  MaxFileSize := 0;
  if ASize <> '' then
  begin
    case ASize[Length(ASize)] of
     'K': begin
      MaxFileSize := StrToInt(Copy(ASize, 0, Length(ASize)-1)) * ONE_KB;
  //    TLogLog.debug('Set max file size to KB');
    end;
    'M': begin
      MaxFileSize := StrToInt(Copy(ASize, 0, Length(ASize)-1)) * ONE_MB;
  //    TLogLog.debug('Set max file size to MB');
    end;
    'G': begin
      MaxFileSize := StrToInt(Copy(ASize, 0, Length(ASize)-1)) * ONE_GB;
  //    TLogLog.debug('Set max file size to BB');
    end;
    else begin
      MaxFileSize := StrToInt(ASize);
  //    TLogLog.debug('Set max file size to BB');
    end;
    end;
  end;
  if MaxFileSize > 0 then
    SetMaxFileSize(MaxFileSize);
end;

//procedure TRollingFileAppender.Append(AEvent : TLoggingEvent);
//begin
//  inherited Append(AEvent);
//  if (Self.FFileStream.Position >= Self.FMaxFileSize) then
//    Self.RollOver;
//  TLogLog.debug('TRollingFileAppender#Append');
//end;

procedure TRollingFileAppender.RollOver();
var
  i : Integer;
  AfileName : String;
begin
//  TLogLog.debug('TRollingFileAppender#RollOver: Start');
  if (Self.FMaxBackupIndex > 0) then
   begin
//    TLogLog.debug('TRollingFileAppender#RollOver: max index > 0');
    // Delete the oldest file if it exists
    if (FileExists(FileName + '.' + IntToStr(FMaxBackupIndex))) then begin
      DeleteFile(FileName + '.' + IntToStr(FMaxBackupIndex));
//      TLogLog.debug('TRollingFileAppender#RollOver: deleted old file');
    end;

    // Map {(maxBackupIndex - 1), ..., 2, 1} to {maxBackupIndex, ..., 3, 2}
    for i := Self.FMaxBackupIndex-1 downto 1 do
    begin
      AfileName := Self.FileName + '.' + IntToStr(i);
//      TLogLog.debug('TRollingFileAppender#RollOver: renaming ' + fileName);
      if (FileExists(AfileName)) then
      begin
        RenameFile(AfileName, Self.FileName + '.' + IntToStr(i + 1));
//        TLogLog.debug('TRollingFileAppender#RollOver: renamed ' + fileName);
      end;
    end;

    // Rename fileName to fileName.1
    Self.FStream.Free;
    Self.FStream := Nil;
//    TLogLog.debug('TRollingFileAppender#RollOver: freed the filestream');
    RenameFile(Self.FileName, Self.FileName + '.1');
  end
  else
  begin
    Self.FStream.Size := 0;
    Self.FStream.Free;
    Self.FStream := Nil;
  end;
  // reinitialize the file.
//  Self.SetFile(Self.FileName);
   SetOption(FileNameOpt, FileName);
//  TLogLog.debug('TRollingFileAppender#RollOver: End');
end;

function TRollingFileAppender.GetMaxBackupIndex() : Integer;
begin
  Result := Self.FMaxBackupIndex;
end;

function TRollingFileAppender.GetMaxFileSize() : Int64;
begin
  Result := Self.FMaxFileSize;
end;


//<appender name="RollingFileAppender" type="log4net.Appender.RollingFileAppender" >
//      <file value="log.txt" />
//      <appendToFile value="true" />
//      <rollingStyle value="Size" />
//      <maxSizeRollBackups value="10" />
//      <maximumFileSize value="100KB" />
//      <staticLogFileName value="true" />
//      <layout type="log4net.Layout.PatternLayout">
//        <conversionPattern value="%date [%thread] %-5level - %message%newline" />
//      </layout>
//    </appender>

procedure TRollingFileAppender.SetOption(const Name, Value: string);
begin
  inherited SetOption(Name, Value);
//  EnterCriticalSection(FCriticalAppender);
  try
    if Value <> '' then
    begin
      if SameText(Name, 'maximumFileSize')   then
         SetMaxFileSize(Value)
      else if SameText(Name, 'maxSizeRollBackups')  then
            SetMaxBackupIndex(StrToIntDef(Value, 0));
    end;
  finally
//    LeaveCriticalSection(FCriticalAppender);
  end;
end;

procedure TRollingFileAppender.DoAppend(const Message: string);
begin
  inherited DoAppend(Message);
  if (Self.FStream.Position >= Self.FMaxFileSize) then
    Self.RollOver;

end;

initialization
    RegisterAppender(TRollingFileAppender);


end.

