unit uExample;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, Menus;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    FIconData:TNotifyIconData;
  protected
    procedure WndProc(var Msg: TMessage); Override;
    procedure ControlWindow(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; Override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


constructor TForm1.Create(AOwner: TComponent);
begin
  // ������� ������� ����� � ��������� �� �����
  inherited Create(AOwner);
  Application.ShowMainForm:=False;
  // �������������� ������ ��� System Tray
  with FIconData do begin
    cbSize:=SizeOf(FIconData);
    Wnd:=Handle;
    uID:=100;
    uFlags:=NIF_MESSAGE+NIF_ICON+NIF_TIP;
    uCallbackMessage:=WM_USER+1;
    hIcon:=Application.Icon.Handle;
    szTip:='����';
  end;
  // ��� ������ - �������� ������ � System Tray
  Shell_NotifyIcon(NIM_ADD, @FIconData);
end;

destructor TForm1.Destroy;
begin
  // ����� ����������� ����� ������� ������ �� SysTray
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  inherited Destroy;
end;

procedure TForm1.N1Click(Sender: TObject);
{�.���� �����}
begin
  Close;
end;

procedure TForm1.WndProc(var Msg: TMessage);
var
  P: TPoint;
begin
  if Msg.Msg=WM_USER+1 then begin
    case Msg.LParam of
      WM_LBUTTONDOWN:
        begin
        end;
      WM_RBUTTONDOWN:  // ������ ������ ������ ���� - ���������� pop-up ����
        begin
          SetForegroundWindow(Handle);      // ��������������� ��������� � �������� ��������� ����
          GetCursorPos(P);                  // ���������� ���������� ������� ����
          PopupMenu1.Popup(P.X,P.Y);        // ���������� pop-up ����
          PostMessage(Handle,WM_NULL,0,0)   // �������� ���������
        end;
    end;
  end;
  inherited;
end;

procedure TForm1.N2Click(Sender: TObject);
{�. ���� ����������}
begin
  ShowWindow(Handle, SW_NORMAL);
end;

procedure TForm1.ControlWindow(var Msg: TMessage);
begin
  // ���� � ��������� ���� ��������� ������ ������ ������� ��� ��������,
  // �������� �����
  case Msg.WParam of
    SC_MINIMIZE:
      ShowWindow(Handle, SW_HIDE);
    SC_CLOSE:
      ShowWindow(Handle, SW_HIDE);
    else
      inherited;
  end;
end;

end.
