unit FormManager;

interface

uses
  Classes, Forms, FormMngr, Contnrs;

type
  TFormNotifierEnum = (fnCreated, fnDestroyed, fnActivated, fnDeactivated);

  TBaseFormController = class(TInterfacedObject, IFormManager)
  private
    FNotifiers: TInterfaceList;
  protected
    procedure EnumNotifiers(EventType: TFormNotifierEnum; AForm: TCustomForm); virtual;
    property Notifiers: TInterfaceList read FNotifiers;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure FormCreated(AForm: TCustomForm);
    procedure FormDestroyed(AForm: TCustomForm);
    procedure FormActivated(AForm: TCustomForm);
    procedure FormDeactivated(AForm: TCustomForm);
    procedure AddNotifier(FormNotifier: IFormNotifier);
    procedure RemoveNotifier(FormNotifier: IFormNotifier);
  end;

  implementation

uses
  SysUtils;

{ TBaseFormController }

procedure TBaseFormController.AddNotifier(FormNotifier: IFormNotifier);
begin
  if FNotifiers.IndexOf(FormNotifier) < 0 then
    FNotifiers.Add(FormNotifier);
end;

constructor TBaseFormController.Create;
begin
  FNotifiers := TInterfaceList.Create;
end;

destructor TBaseFormController.Destroy;
begin
  FreeAndNil(FNotifiers);
  inherited;
end;

procedure TBaseFormController.EnumNotifiers(EventType: TFormNotifierEnum;   AForm: TCustomForm);
var
  ANotifier: IFormNotifier;
  I: Integer;
begin
  I := 0;
  while I < FNotifiers.Count do
  begin
    ANotifier := IFormNotifier(FNotifiers[I]);
    case EventType of    //
      fnCreated: ANotifier.FormCreated(AForm);
      fnDestroyed: ANotifier.FormDestroyed(AForm);
      fnActivated: ANotifier.FormActivated(AForm);
      fnDeactivated: ANotifier.FormDeactivated(AForm);
    end;    // case
    Inc(I);
  end;    // while
end;

procedure TBaseFormController.FormActivated(AForm: TCustomForm);
begin
  EnumNotifiers(fnActivated, AForm);
end;

procedure TBaseFormController.FormCreated(AForm: TCustomForm);
begin
  EnumNotifiers(fnCreated, AForm);
end;

procedure TBaseFormController.FormDeactivated(AForm: TCustomForm);
begin
  EnumNotifiers(fnDeactivated, AForm);
end;

procedure TBaseFormController.FormDestroyed(AForm: TCustomForm);
begin
  EnumNotifiers(fnDestroyed, AForm);
end;

procedure TBaseFormController.RemoveNotifier(
  FormNotifier: IFormNotifier);
begin
  FNotifiers.Remove(FormNotifier);
end;

initialization
  SetFormManager(TBaseFormController.Create);

end.
 