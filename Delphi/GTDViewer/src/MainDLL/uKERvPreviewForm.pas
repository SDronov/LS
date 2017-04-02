unit uKERvPreviewForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpFormPreview, RpSystem, RpDefine;

type
  TKERavePreviewForm = class(TRavePreviewForm)

  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);override;
    procedure ClickFile_PrintExecute(Sender: TObject);
  end;

var
  KERavePreviewForm: TKERavePreviewForm;

procedure KERvSystemOverridePreview(ReportSystem: TRvSystem;
  OverrideMode: TOverrideMode; var OverrideForm: TForm);

implementation

{$R *.dfm}

procedure KERvSystemOverridePreview(ReportSystem: TRvSystem;
  OverrideMode: TOverrideMode; var OverrideForm: TForm);
begin
  case OverrideMode of
    omCreate: begin
      OverrideForm := TKERavePreviewForm.Create(ReportSystem);
      OverrideForm.Caption := ReportSystem.TitlePreview;
      OverrideForm.Width := ReportSystem.SystemPreview.FormWidth;
      OverrideForm.Height := ReportSystem.SystemPreview.FormHeight;
      OverrideForm.WindowState := ReportSystem.SystemPreview.FormState;
      (OverrideForm as TRavePreviewForm).ReportSystem := ReportSystem;
    end;
    omShow: begin
      (OverrideForm as TRavePreviewForm).RvRenderPrinter.MacroData.Assign(ReportSystem.StorageMacroData);
      (OverrideForm as TRavePreviewForm).RvRenderPreview.MacroData.Assign(ReportSystem.StorageMacroData);

      ReportSystem.SystemPreview.InitPreview((OverrideForm as TRavePreviewForm).RvRenderPreview);

      (OverrideForm as TRavePreviewForm).InputFileName := ReportSystem.SystemFiler.Filename;
      (OverrideForm as TRavePreviewForm).InputStream := ReportSystem.SystemFiler.Stream;
      (OverrideForm as TRavePreviewForm).InitFromRPSystem;
    (* *)
       OverrideForm.ShowModal;
    end;
    omWait: begin

    end;
    omFree: begin
      if (ReportSystem.SystemFiler.StreamMode in [smTempFile,smFile]) then begin
        (OverrideForm as TRavePreviewForm).RvRenderPreview.NDRStream.Free;
        (OverrideForm as TRavePreviewForm).RvRenderPreview.NDRStream := nil;
      end; { if }
      FreeAndNil(OverrideForm);
    end;
  end; { case }
end;



{ TKERavePreviewForm }

procedure TKERavePreviewForm.ClickFile_PrintExecute(Sender: TObject);
var
  DoPrint: boolean;
  I1: integer;
  ForceCopies: integer;
begin
  RvRenderPrinter.NDRStream := RvRenderPreview.NDRStream;
  RvRenderPrinter.Pages := RvRenderPreview.Pages;
  if ssAllowPreviewSetup in ReportSystem.SystemSetups then begin

    RvRenderPrinter.FirstPage := 3;
    RvRenderPrinter.LastPage := 3;
    {with TRpSetupForm.Create(self) do try
      PreviewSetup := true;
      ReportSystem := Self.ReportSystem;
      FilePrinter := RvRenderPrinter;
      DoPrint := (ShowModal = mrOK);
      RvRenderPrinter.IgnoreFileSettings := true;
    finally
      Free;
    end; }
  end else begin
    DoPrint := true;
  end; { else }

  if DoPrint then begin
    if (RvRenderPrinter.MaxCopies <= 1) and (RvRenderPrinter.Copies > 1) then begin
      ForceCopies := RvRenderPrinter.Copies;
      RvRenderPrinter.Copies := 1;
    end else begin
      ForceCopies := 1;
    end; { else }
    for I1 := 1 to ForceCopies do begin
      if Assigned(RvRenderPrinter.NDRStream) then begin
        RvRenderPrinter.Render(RvRenderPrinter.NDRStream);
      end else begin
        RvRenderPrinter.Render(InputStream);
      end; { else }
    end; { for }
    RvRenderPrinter.NDRStream := nil
  end; { if }
end;

constructor TKERavePreviewForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.ToolButton3.OnClick:=ClickFile_PrintExecute;
end;

end.
