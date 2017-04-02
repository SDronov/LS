unit SubjIntf;

interface

type
  ISubjectHolder = interface(IInterface)
   ['{D6F037AF-1593-42BB-8164-9E06750F1D2A}']
   function GetSubjectId: double;
   function GetSubjectINN: string;
   function GetSubjectKPP: string;
   function GetSubjectName: string;
  end;

  IDocumentHolder = interface(IInterface)
   ['{7A821D9E-26B0-4E59-BAA5-C363AF96C659}']
   function GetDocumentDate: TDateTime;
  end;

  function  GetActiveSubjectId: double;
  function  GetActiveSubjectName: string;
  function  GetActiveSubjectINN: string;
  function  GetActiveSubjectKPP: string;
  function  GetActiveDocumentDate: TDateTime;

implementation

uses
  Forms, SysUtils;

function  GetActiveSubjectId: double;
var
  AForm: TForm;
  SubjectHolder: ISubjectHolder;
begin
  Result := 0;
  AForm := Application.MainForm.ActiveMDIChild;
  if assigned(AForm) and Supports(AForm, ISubjectHolder, SubjectHolder) then
    Result := SubjectHolder.GetSubjectId;
end;

function  GetActiveSubjectName: string;
var
  AForm: TForm;
  SubjectHolder: ISubjectHolder;
begin
  Result := '';
  AForm := Application.MainForm.ActiveMDIChild;
  if assigned(AForm) and Supports(AForm, ISubjectHolder, SubjectHolder) then
    Result := SubjectHolder.GetSubjectName;
end;

function  GetActiveSubjectINN: string;
var
  AForm: TForm;
  SubjectHolder: ISubjectHolder;
begin
  Result := '';
  AForm := Application.MainForm.ActiveMDIChild;
  if assigned(AForm) and Supports(AForm, ISubjectHolder, SubjectHolder) then
    Result := SubjectHolder.GetSubjectINN;
end;

function  GetActiveSubjectKPP: string;
var
  AForm: TForm;
  SubjectHolder: ISubjectHolder;
begin
  Result := '';
  AForm := Application.MainForm.ActiveMDIChild;
  if assigned(AForm) and Supports(AForm, ISubjectHolder, SubjectHolder) then
    Result := SubjectHolder.GetSubjectKPP;
end;

function  GetActiveDocumentDate: TDateTime;
var
  AForm: TForm;
  DocumentHolder: IDocumentHolder;
begin
  Result := Date;
  AForm := Application.MainForm.ActiveMDIChild;
  if assigned(AForm) and Supports(AForm, IDocumentHolder, DocumentHolder) then
    Result := DocumentHolder.GetDocumentDate;
end;


end.
