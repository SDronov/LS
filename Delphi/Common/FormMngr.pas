unit FormMngr;

interface

uses  Classes, Forms;

type

  IFormNotifier = interface
  ['{4ED10845-3308-4236-A911-3D0D315D31D2}']
    procedure FormCreated(AForm: TCustomForm);
    procedure FormDestroyed(AForm: TCustomForm);
    procedure FormActivated(AForm: TCustomForm);
    procedure FormDeactivated(AForm: TCustomForm);
  end;

  IFormManager = interface
  ['{290AF43B-72CE-4AE3-89A3-EADCD6B0725D}']
    procedure FormCreated(AForm: TCustomForm);
    procedure FormDestroyed(AForm: TCustomForm);
    procedure FormActivated(AForm: TCustomForm);
    procedure FormDeactivated(AForm: TCustomForm);
    procedure AddNotifier(FormNotifier: IFormNotifier);
    procedure RemoveNotifier(FormNotifier: IFormNotifier);
  end;

  TBaseFormNotifier = class(TInterfacedObject, IFormNotifier)
  protected
    procedure FormCreated(AForm: TCustomForm); virtual;
    procedure FormDestroyed(AForm: TCustomForm); virtual;
    procedure FormActivated(AForm: TCustomForm); virtual;
    procedure FormDeactivated(AForm: TCustomForm); virtual;
  public
    constructor Create; virtual;
  end;

  function FormManager: IFormManager;
  function SetFormManager(const AFormManager: IFormManager): IFormManager;

implementation

var
  FFormManager: IFormManager;

function FormManager: IFormManager;
begin
  Result := FFormManager;
end;

function SetFormManager(const AFormManager: IFormManager): IFormManager;
begin
  Result := FFormManager;
  FFormManager := AFormManager;
end;

{ TBaseFormNotifier }

constructor TBaseFormNotifier.Create;
begin

end;

procedure TBaseFormNotifier.FormActivated(AForm: TCustomForm);
begin

end;

procedure TBaseFormNotifier.FormCreated(AForm: TCustomForm);
begin

end;

procedure TBaseFormNotifier.FormDeactivated(AForm: TCustomForm);
begin

end;

procedure TBaseFormNotifier.FormDestroyed(AForm: TCustomForm);
begin

end;

end.
 