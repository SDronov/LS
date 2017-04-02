unit uService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  uOptions, uDBService, uFileService, uInterfaces;

type
  TIncomeExchangeService = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceDestroy(Sender: TObject);
  private
    { Private declarations }
    fOptions     : TieOptions;
    fDBService   : TdmDBService;
    fFileService : TdmFileService;

    function GetOptionsString : string;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  IncomeExchangeService: TIncomeExchangeService;

implementation

{$R *.DFM}

uses
  Forms, Log4D, fdcUtils;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  IncomeExchangeService.Controller(CtrlCode);
end;

function TIncomeExchangeService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TIncomeExchangeService.ServiceCreate(Sender: TObject);
begin
  fOptions     := nil;
  fDBService   := nil;
  fFileService := nil;
end;

procedure TIncomeExchangeService.ServiceStart(Sender: TService;
  var Started: Boolean);
  var
    li_FileSvc : IFileService;
    li_DBSvc   : IDBService;
begin
  fOptions := TieOptions.Create;
  fOptions.ReadStart;

  if not Assigned( fDBService ) then
    fDBService := TdmDBService.Create( Self );
  fDBService.Options := fOptions;

  if not Assigned( fFileService ) then
    fFileService := TdmFileService.Create( Self );
  fFileService.Options := fOptions;

  if Supports( fFileService, IFileService, li_FileSvc ) then
    fDBService.FileService := li_FileSvc;

  if Supports( fDBService, IDBService, li_DBSvc ) then
    fFileService.DBService := li_DBSvc;


  Self.WaitHint := fOptions.Interval * 2000;

  LogMessage(
      '��� "�����-�����/����" ������� � �����������:'#$D#$A +
      GetOptionsString
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      '��� "�����-�����/����" ������� � �����������:'#$D#$A +
      GetOptionsString
    );
  if fOptions.Debug then
    TLogLogger.GetRootLogger.Debug(
        '������ ����������:' + fdcUtils.GetAppVersion
      );

  Started := True;
end;

procedure TIncomeExchangeService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  FreeAndNil( fOptions );

  LogMessage(
      '��� "�����-�����/����" ����������'
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      '��� "�����-�����/����" ����������'
    );

  Stopped := True;
end;

procedure TIncomeExchangeService.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  fOptions.Read;

  LogMessage(
      '��� "�����-�����/����" ���������� � �����������:'#$D#$A +
      GetOptionsString
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      '��� "�����-�����/����" ���������� � �����������:'#$D#$A +
      GetOptionsString
    );
end;

procedure TIncomeExchangeService.ServiceExecute(Sender: TService);
  var
    i : Integer;
begin
  while not Terminated do
    begin
      ServiceThread.ProcessRequests( False );
      if not Terminated then
        begin
          try
            fDBService.ExecRequests;
          except
            on E : Exception do
              TLogLogger.GetRootLogger.Error( '������ ��� ������� ��������� ������� ��������� �� ��:', E );
          end;
          try
            fFileService.ExecRequests;
          except
            on E : Exception do
              TLogLogger.GetRootLogger.Error( '������ ��� ������� ��������� ������� ��������� ��� ��:', E );
          end;

          i := 1;
          while not Terminated
            and (i <= fOptions.Interval * 10) do
            begin
              ReportStatus;
              Sleep( 100 );
              ServiceThread.ProcessRequests( False );
              inc( i );
            end;
        end
      else
        ReportStatus;
    end;
end;

function TIncomeExchangeService.GetOptionsString: string;

  function BoolToStr( ABoolVal : Boolean): string;
  begin
    if ABoolVal then
      Result := '��'
    else
      Result := '���';
  end;

begin
  Result := '  ��������        : ' + IntToStr( fOptions.Interval ) + #$D#$A +
            '  ������ ��       : ' + fOptions.DataBase + #$D#$A +
            '  ������������ �� : ' + fOptions.UserName + #$D#$A +
            '  ����� �� ��     : ' + fOptions.SchemeName + #$D#$A +
            '  �������������� � ��� "���������� �����" : ' + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.PrivilegesEnebled ) + #$D#$A +
            '    ��������  : ' + fOptions.PrivilegesDirIn + #$D#$A +
            '    ��������� : ' + fOptions.PrivilegesDirOut + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.PrivilegesPackedOut ) + #$D#$A +
            '  �������������� � ��� "�������������" : ' + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.DebtEnebled ) + #$D#$A +
            '    ��������  : ' + fOptions.DebtDirIn + #$D#$A +
            '    ��������� : ' + fOptions.DebtDirOut + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.DebtPackedOut ) + #$D#$A +
            '  �������������� � ��� "������" : ' + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.FinesEnebled ) + #$D#$A +
            '    ��������  : ' + fOptions.FinesDirIn + #$D#$A +
            '    ��������� : ' + fOptions.FinesDirOut + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.FinesPackedOut ) + #$D#$A +
            '  �������������� � ��� "���������-1" : ' + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.CostEnebled ) + #$D#$A +
            '    ��������  : ' + fOptions.CostDirIn + #$D#$A +
            '    ��������� : ' + fOptions.CostDirOut + #$D#$A +
            '    ��������  : ' + BoolToStr( fOptions.CostPackedOut );
end;

procedure TIncomeExchangeService.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  LogMessage(
      '��� "�����-�����/����" �������������'
     ,EVENTLOG_INFORMATION_TYPE
    );

  TLogLogger.GetRootLogger.Info(
      '��� "�����-�����/����" �������������'
    );

  Paused := True;
end;

procedure TIncomeExchangeService.ServiceDestroy(Sender: TObject);
begin
  if Assigned(fOptions) then
    FreeAndNil( fOptions );
  if Assigned(fDBService) then
    begin
      if Assigned(fFileService) then
        fFileService.DBService := nil;

      fDBService.FileService := nil;
       FreeAndNil( fDBService );
    end;
  if Assigned(fFileService) then
    FreeAndNil( fFileService );
end;

end.
