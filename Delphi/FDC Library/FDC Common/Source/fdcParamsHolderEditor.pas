{
  Copyright � Fors Development Center. 
  All rights reserved.

  $Workfile: fdcParamsHolderEditor.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}

unit fdcParamsHolderEditor;

interface

uses
  DesignIntf,
  DesignEditors;

type
  { TfdcParamsHolderEditor }
  TfdcParamsHolderEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(const Prop: IProperty;
      var Continue: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

implementation

uses
  SysUtils;

const
  SParamsProperty = 'Params';

{ TfdcParamsHolderEditor }

procedure TfdcParamsHolderEditor.EditProperty(const Prop: IProperty;
  var Continue: Boolean);
var
  PropName: string;
begin
  inherited;
  PropName := Prop.GetName;
  if AnsiCompareText(PropName, SParamsProperty) = 0 then
  begin
    Prop.Edit;
    Continue := False;
  end;
end;

procedure TfdcParamsHolderEditor.ExecuteVerb(Index: Integer);
begin
  inherited;
  Edit;
end;

function TfdcParamsHolderEditor.GetVerb(Index: Integer): string;
begin
  Result := 'Params...'
end;

function TfdcParamsHolderEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.

 