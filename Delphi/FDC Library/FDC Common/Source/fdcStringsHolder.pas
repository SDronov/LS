{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcStringsHolder.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcStringsHolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TfdcStringsHolder = class(TComponent)
  protected
    fLines: TStrings;
    fOnChange: TNotifyEvent;
    procedure Changed(Sender: TObject);
  public
    procedure setLines(s: TStrings);
    procedure setText(s: string);
    function getText: string;
  published
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    property Items: TStrings read fLines write setLines;
    property Text: string read getText write setText;
    property OnChange: TNotifyEvent read fOnChange write fOnChange;
  end;

implementation

constructor TfdcStringsHolder.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  fLines := TStringList.create;
  TStringList(Items).OnChange := Changed;
end;

destructor TfdcStringsHolder.Destroy;
begin
  fLines.free;
  inherited Destroy;
end;

procedure TfdcStringsHolder.setLines(s: TStrings);
begin
  Items.BeginUpdate;
  try
    Items.Assign(s);
  finally Items.EndUpdate;
  end;
end;

procedure TfdcStringsHolder.setText(s: string);
begin
  Items.text := s;
end;

function TfdcStringsHolder.getText: string;
begin
  result := Items.text;
end;

procedure TfdcStringsHolder.Changed(Sender: TObject);
begin
  if Assigned(fOnChange) then
    fOnChange(self);
end;

end.

