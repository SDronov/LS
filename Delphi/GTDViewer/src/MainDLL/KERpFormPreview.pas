unit KERpFormPreview;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, Menus, ActnList, ImgList, ComCtrls, ToolWin,
  SysUtils, Classes, RpBase, RpFiler, RpRenderPrinter, RpRenderPreview,
  RpDefine, RpSystem, RpFormSetup;

type
  TKERavePreviewForm = class(TForm)
    ScrollBox1: TScrollBox;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    PopupMenu1: TPopupMenu;
    actnFile_Print: TAction;
    actnFile_Save: TAction;
    actnFile_Exit: TAction;
    actnFile_Open: TAction;
    sbarMain: TStatusBar;
    actnPage_First: TAction;
    actnPage_Next: TAction;
    actnPage_Previous: TAction;
    actnPage_Last: TAction;
    actnZoom_In: TAction;
    actnZoom_Out: TAction;
    actnZoom_PageWidth: TAction;
    actnZoom_Page: TAction;
    Page1: TMenuItem;
    Zoom1: TMenuItem;
    First1: TMenuItem;
    Next1: TMenuItem;
    Previous1: TMenuItem;
    Last1: TMenuItem;
    N2: TMenuItem;
    GotoPage1: TMenuItem;
    In1: TMenuItem;
    Out1: TMenuItem;
    N3: TMenuItem;
    Page2: TMenuItem;
    PageWidth1: TMenuItem;
    In2: TMenuItem;
    Out2: TMenuItem;
    ilstActions: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    dlogOpen: TOpenDialog;
    dlogSave: TSaveDialog;
    File1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ZoomEdit: TEdit;
    PageEdit: TEdit;
    PageLabel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolButton9: TToolButton;
    ToolButton15: TToolButton;
    Panel3: TPanel;
    PreviewTimer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NDRPreviewPageChange(Sender: TObject);
    procedure NDRPreviewZoomChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actnFile_ExitExecute(Sender: TObject);
    procedure actnPage_GotoPageExecute(Sender: TObject);
    procedure actnZoom_InExecute(Sender: TObject);
    procedure actnZoom_OutExecute(Sender: TObject);
    procedure actnPage_PreviousExecute(Sender: TObject);
    procedure actnPage_NextExecute(Sender: TObject);
    procedure actnZoom_PageWidthExecute(Sender: TObject);
    procedure actnZoom_PageExecute(Sender: TObject);
    procedure actnFile_PrintExecute(Sender: TObject);
    procedure actnPage_FirstExecute(Sender: TObject);
    procedure actnPage_LastExecute(Sender: TObject);
    procedure actnPage_FirstUpdate(Sender: TObject);
    procedure actnPage_PreviousUpdate(Sender: TObject);
    procedure actnPage_NextUpdate(Sender: TObject);
    procedure actnPage_LastUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actnFile_SaveExecute(Sender: TObject);
    procedure actnFile_OpenExecute(Sender: TObject);
    procedure actnFile_PrintUpdate(Sender: TObject);
    procedure actnFile_SaveUpdate(Sender: TObject);
    procedure actnZoom_InUpdate(Sender: TObject);
    procedure actnZoom_OutUpdate(Sender: TObject);
    procedure actnZoom_PageWidthUpdate(Sender: TObject);
    procedure actnZoom_PageUpdate(Sender: TObject);
    procedure ZoomEditKeyPress(Sender: TObject; var Key: Char);
    procedure ZoomEditExit(Sender: TObject);
    procedure PageEditExit(Sender: TObject);
    procedure PageEditKeyPress(Sender: TObject; var Key: Char);
    procedure PreviewTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    FPageNum: integer;
    FOnGenerate: TNotifyEvent;
    FInputFileName: string;
    FInputStream: TStream;
    FOnAfterPreviewPrint: TNotifyEvent;

    procedure AfterPreviewPrintEvent; virtual;
    procedure SetSaveOptions(SaveDialog: TSaveDialog);
    procedure NewRenderPage(Sender: TObject);
    procedure SetButtonState;
    function PageInRange(APageNum: Integer): boolean;
  public
    ReportSystem: TRvSystem;
    FormClosed: boolean;
    RvRenderPrinter: TRvRenderPrinter;
    RvRenderPreview: TRvRenderPreview;
    //
    procedure InitFromRPSystem;
    procedure OpenFile(const AFileName: string);
    class procedure PreviewFile(const AFileName: string);

    property PageNum: integer read FPageNum write FPageNum;
    property OnGenerate: TNotifyEvent read FOnGenerate write FOnGenerate;
    property OnAfterPreviewPrint: TNotifyEvent read FOnAfterPreviewPrint write FOnAfterPreviewPrint;
    property InputFileName: string read FInputFileName write FInputFileName;
    property InputStream: TStream read FInputStream write FInputStream;
  end;

var
  KERavePreviewForm: TKERavePreviewForm;

implementation

{$R *.dfm}

uses
  RpRender;

procedure TKERavePreviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormClosed := true;
end;

procedure TKERavePreviewForm.NDRPreviewPageChange(Sender: TObject);
begin
  with RvRenderPreview do begin
    PageEdit.Text := IntToStr(CurrentPage);
    PageLabel.Caption := Trans('of') + ' ' + IntToStr(Pages);
    PageLabel.Width := self.canvas.TextWidth(PageLabel.Caption) + 8;
    sbarMain.SimpleText := Trans('Page') + ' ' + IntToStr(CurrentPage) +
     ' ' + Trans('of') + ' ' + IntToStr(Pages);
  end; { with }
end;

procedure TKERavePreviewForm.NDRPreviewZoomChange(Sender: TObject);
var
  S1: string[10];
begin
  Str(RvRenderPreview.ZoomFactor:1:1,S1);
  ZoomEdit.Text := S1;
  if Assigned(RvRenderPreview.Image) then begin
    RvRenderPreview.RedrawPage;
  end; { if }
end;

procedure TKERavePreviewForm.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  I1: integer;
begin
  case Key of
    vk_Up: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          I1 := Position - Increment;
          if I1 < 0 then begin
            if RvRenderPreview.CurrentPage > 1 then begin
              RvRenderPreview.PrevPage;
              I1 := Range;
            end else begin
              I1 := 0;
            end; { else }
          end; { if }
          Position := I1;
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_Down: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          I1 := Position + Increment;
          if I1 >= Range then begin
            I1 := Range - 1;
          end; { if }
          Position := I1;
          if (I1 > Position) and (RvRenderPreview.CurrentPage < RvRenderPreview.Pages) then begin
            RvRenderPreview.NextPage;
            Position := 0;
          end; { if }
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_Home: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          Position := 0;
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_End: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          Position := Range - 1;
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_Prior: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          if (Position = 0) and (RvRenderPreview.CurrentPage > 1) then begin
            RvRenderPreview.PrevPage;
            SetButtonState;
            I1 := Range - 1;
          end else begin
            I1 := Position - ScrollBox1.Height;
            if I1 < 0 then begin
              I1 := 0;
            end; { if }
          end; { else }
          Position := I1;
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_Next: begin
      if (Shift = []) or (Shift = [ssCtrl]) then begin
        with ScrollBox1.VertScrollBar do begin
          I1 := Position + ScrollBox1.Height;
          if I1 >= Range then begin
            if RvRenderPreview.CurrentPage < RvRenderPreview.Pages then begin
              RvRenderPreview.NextPage;
              SetButtonState;
              I1 := 0;
            end else begin
              I1 := Range - 1;
            end; { else }
          end; { if }
          Position := I1;
          Key := 0;
        end; { with }
      end; { if }
    end;
    vk_Left: begin
      with ScrollBox1.HorzScrollBar do begin
        if Shift = [ssCtrl] then begin
          I1 := Position - Increment;
          if I1 < 0 then begin
            I1 := 0;
          end; { if }
          Position := I1;
          Key := 0;
        end else if Shift = [ssCtrl,ssShift] then begin
          I1 := Position - ScrollBox1.Width;
          if I1 < 0 then begin
            I1 := 0;
          end; { if }
          Position := I1;
          Key := 0;
        end; { else }
      end; { with }
    end;
    vk_Right: begin
      with ScrollBox1.HorzScrollBar do begin
        if Shift = [ssCtrl] then begin
          I1 := Position + Increment;
          if I1 >= Range then begin
            I1 := Range - 1;
          end; { if }
          Position := I1;
          Key := 0;
        end else if Shift = [ssCtrl,ssShift] then begin
          I1 := Position + ScrollBox1.Width;
          if I1 >= Range then begin
            I1 := Range - 1;
          end; { if }
          Position := I1;
          Key := 0;
        end; { else }
      end; { with }
    end;
  end; { case }
end;

procedure TKERavePreviewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  ValidKeys: string;
begin
  if (Key = #27) or (Key = 'x') then begin
    actnFile_Exit.Execute;
    Key := #0;
  end else begin
    ValidKeys := {Trans-}'eEbBwWfFnNpP+-01234567890.'#13#8;
    if Pos(Key, ValidKeys) > 0 then begin
      case Key of
        'b','B': begin
          RvRenderPreview.RenderPage(1);
          SetButtonState;
          Key := #0;
        end;
        'e','E': begin
          RvRenderPreview.RenderPage(RvRenderPreview.Pages);
          SetButtonState;
          Key := #0;
        end;
        '-': begin
          RvRenderPreview.ZoomOut;
          SetButtonState;
          Key := #0;
        end;
        '+': begin
          RvRenderPreview.ZoomIn;
          SetButtonState;
          Key := #0;
        end;
        'w','W': begin
          RvRenderPreview.ZoomFactor := RvRenderPreview.ZoomPageWidthFactor;
          SetButtonState;
          Key := #0;
        end;
        'f','F': begin
          RvRenderPreview.ZoomFactor := RvRenderPreview.ZoomPageFactor;
          SetButtonState;
          Key := #0;
        end;
        'n','N': begin
          if RvRenderPreview.CurrentPage < RvRenderPreview.Pages then begin
            RvRenderPreview.NextPage;
            SetButtonState;
          end; { if }
          Key := #0;
        end;
        'p','P': begin
          if RvRenderPreview.CurrentPage > 1 then begin
            RvRenderPreview.PrevPage;
            SetButtonState;
          end; { if }
          Key := #0;
        end;
      end; { case }
    end else begin
      Key := #0;
    end; { else }
  end; { else }
  if Key = #0 then begin
    PageEdit.SelStart := 0;
    PageEdit.SelLength := Length(PageEdit.Text);
    ZoomEdit.SelStart := 0;
    ZoomEdit.SelLength := Length(ZoomEdit.Text);
  end; { if }
end;

procedure TKERavePreviewForm.actnFile_ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TKERavePreviewForm.actnPage_GotoPageExecute(Sender: TObject);
var
  I1: integer;
begin
  I1 := StrToIntDef(Inputbox(Trans('Go to Page'),Trans('Enter page to move to:'),
   IntToStr(RvRenderPreview.CurrentPage)), -1);
  if (I1 > -1) and (RvRenderPreview.CurrentPage <> I1) then begin
    RvRenderPreview.RenderPage(I1);
  end; { if }
  SetButtonState;
end;

procedure TKERavePreviewForm.actnZoom_InExecute(Sender: TObject);
begin
  RvRenderPreview.ZoomIn;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnZoom_OutExecute(Sender: TObject);
begin
  RvRenderPreview.ZoomOut;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnPage_PreviousExecute(Sender: TObject);
begin
  RvRenderPreview.PrevPage;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnPage_NextExecute(Sender: TObject);
begin
  RvRenderPreview.NextPage;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnZoom_PageWidthExecute(Sender: TObject);
begin
  RvRenderPreview.ZoomFactor := RvRenderPreview.ZoomPageWidthFactor;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnZoom_PageExecute(Sender: TObject);
begin
  RvRenderPreview.ZoomFactor := RvRenderPreview.ZoomPageFactor;
  SetButtonState;
end;

procedure TKERavePreviewForm.actnFile_PrintExecute(Sender: TObject);
var
  DoPrint: boolean;
  I1,j: integer;
  ForceCopies: integer;
begin
  if soAllowPrintFromPreview in ReportSystem.SystemOptions then begin
    RvRenderPrinter.NDRStream := RvRenderPreview.NDRStream;
    RvRenderPrinter.Pages := RvRenderPreview.Pages;
    if ssAllowPreviewSetup in ReportSystem.SystemSetups then begin
    //  Self.ReportSystem.BaseReport.FirstPage  := 3;
    //  Self.ReportSystem.BaseReport.LastPage := 3;
      with TRpSetupForm.Create(self) do try
        PreviewSetup := true;
        ReportSystem := Self.ReportSystem;
        FilePrinter := RvRenderPrinter;
        DoPrint := (ShowModal = mrOK);
        RvRenderPrinter.IgnoreFileSettings := true;
      finally
        Free;
      end;
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
          //RvRenderPrinter.Render(RvRenderPrinter.NDRStream);
          for j:=1 to RvRenderPreview.Pages do
            if PageInRange(j) then RvRenderPrinter.RenderPage(j);
        end else begin
          RvRenderPrinter.Render(InputStream);
        end; { else }
      end; { for }
      AfterPreviewPrintEvent;
      RvRenderPrinter.NDRStream := nil
    end; { if }
  end; { if }
  SetButtonState;
end;

procedure TKERavePreviewForm.actnPage_FirstExecute(Sender: TObject);
begin
  RvRenderPreview.RenderPage(1);
  SetButtonState;
end;

procedure TKERavePreviewForm.actnPage_LastExecute(Sender: TObject);
begin
  RvRenderPreview.RenderPage(RvRenderPreview.Pages);
  SetButtonState;
end;

procedure TKERavePreviewForm.actnPage_FirstUpdate(Sender: TObject);
begin
  actnPage_First.Enabled := RvRenderPreview.CurrentPage > 1;
end;

procedure TKERavePreviewForm.actnPage_PreviousUpdate(Sender: TObject);
begin
  actnPage_Previous.Enabled := RvRenderPreview.CurrentPage > 1;
end;

procedure TKERavePreviewForm.actnPage_NextUpdate(Sender: TObject);
begin
  actnPage_Next.Enabled := RvRenderPreview.CurrentPage < RvRenderPreview.Pages;
end;

procedure TKERavePreviewForm.actnPage_LastUpdate(Sender: TObject);
begin
  actnPage_Last.Enabled := RvRenderPreview.CurrentPage < RvRenderPreview.Pages;
end;

procedure TKERavePreviewForm.FormCreate(Sender: TObject);
begin
  FPageNum := 1;

  RvRenderPreview := TRvRenderPreview.Create(self);
  with RvRenderPreview do begin
    OnZoomChange := NDRPreviewZoomChange;
    OnPageChange := NDRPreviewPageChange;
    ShadowDepth := 2;
    MarginPercent := 5;
    ZoomFactor := 100;
    ScrollBox := ScrollBox1;
  end; { with }

  RvRenderPrinter := TRvRenderPrinter.Create(self);
  with RvRenderPrinter do begin
  end; { with }
end;

procedure TKERavePreviewForm.OpenFile(const AFileName: string);
begin
  with RvRenderPreview do begin
    InputFileName := AFileName;
    NDRStream.Free;
    Render(InputFileName);
    Caption := Application.Title + {Trans-}' - [ ' + ExtractFileName(InputFileName) + {Trans-}' ]';
  end; { with }
end;

procedure TKERavePreviewForm.actnFile_SaveExecute(Sender: TObject);
var
  LDestStream: TFileStream;
  LRender: TRpRenderStream;
  LStreamPos: integer;
  LRenderList: TStrings;
begin
{ TODO: Allow user to select a single page or page range to save/export }
  SetSaveOptions(dlogSave);
  if dlogSave.Execute then begin
    Screen.Cursor := crHourGlass;
    try
      LStreamPos := RvRenderPreview.NDRStream.Position; // Save this before messing with its stream
      try
        RvRenderPreview.NDRStream.Position := 0;

        if dlogSave.FilterIndex > 1 then begin // Do Render
          LRenderList := TStringList.Create;
          try
            RpRender.GetRenderList(LRenderList);
            LRender := TRpRenderStream(LRenderList.Objects[dlogSave.FilterIndex - 2]);
            LRender.OutputFileName := dlogSave.FileName;
            LRender.Render(RvRenderPreview.NDRStream);
          finally
            LRenderList.Free;
          end; { tryf }
        end else begin // Do NDR
          LDestStream := TFileStream.Create(dlogSave.Filename, fmCreate);
          try
            LDestStream.CopyFrom(RvRenderPreview.NDRStream,RvRenderPreview.NDRStream.Size);
          finally
            FreeAndNil(LDestStream);
          end; { tryf }
        end; { else }
      finally
        RvRenderPreview.NDRStream.Position := LStreamPos;
      end; { tryf }
    finally
      Screen.Cursor := crDefault;
    end; { tryf }
  end; { if }
  SetButtonState;
end;

procedure TKERavePreviewForm.actnFile_OpenExecute(Sender: TObject);
begin
  if dlogOpen.Execute then begin
    OpenFile(dlogOpen.Filename);
  end; { if }
  SetButtonState;
end;

procedure TKERavePreviewForm.actnFile_PrintUpdate(Sender: TObject);
begin
  actnFile_Print.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.actnFile_SaveUpdate(Sender: TObject);
begin
  actnFile_Save.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.actnZoom_InUpdate(Sender: TObject);
begin
  actnZoom_In.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.actnZoom_OutUpdate(Sender: TObject);
begin
  actnZoom_Out.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.actnZoom_PageWidthUpdate(Sender: TObject);
begin
  actnZoom_PageWidth.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.actnZoom_PageUpdate(Sender: TObject);
begin
  actnZoom_Page.Enabled := true;//RvRenderPreview.Rendering;
end;

procedure TKERavePreviewForm.InitFromRPSystem;
begin
  if InputFileName <> '' then begin
    RvRenderPreview.NDRStream := TFileStream.Create(InputFileName,fmOpenRead or fmShareDenyWrite);
  end else begin
    RvRenderPreview.NDRStream := InputStream;
  end; { else }
  RvRenderPreview.Render;
  ReportSystem.PreviewShowEvent(RvRenderPreview);
end;

class procedure TKERavePreviewForm.PreviewFile(const AFileName: string);
begin
  with TKERavePreviewForm.Create(Application) do begin
    OpenFile(AFileName);
    Visible := true;
  end; { with }
end;

procedure TKERavePreviewForm.ZoomEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Pos(Key,{Trans-}'01234567890') > 0 then begin
    with Sender as TEdit do begin
      if (SelLength = 0) and (Pos('.',Text) > 0) and (Length(Text) > Pos('.',Text)) then begin
        Key := #0;
      end; { if }
    end; { with }
  end else if Key = #13 then begin
    ZoomEditExit(Sender);
    with Sender as TEdit do begin
      SelStart := 0;
      SelLength := Length(Text);
    end; { with }
    Key := #0;
  end; { else }
end;

procedure TKERavePreviewForm.ZoomEditExit(Sender: TObject);
var
  F1: double;
  ErrCode: integer;
begin
  Val(ZoomEdit.Text,F1,ErrCode);
  if (ErrCode = 0) and (RvRenderPreview.ZoomFactor <> F1) then begin
    RvRenderPreview.ZoomFactor := F1;
  end; { if }
end;

procedure TKERavePreviewForm.PageEditExit(Sender: TObject);
var
  I1: integer;
  ErrCode: integer;
begin
  Val(PageEdit.Text,I1,ErrCode);
  if (ErrCode = 0) and (RvRenderPreview.CurrentPage <> I1) then begin
    RvRenderPreview.RenderPage(I1);
  end; { if }
end;

procedure TKERavePreviewForm.PageEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then begin
    Key := #0;
  end else if Key = #13 then begin
    PageEditExit(Sender);
    with Sender as TEdit do begin
      SelStart := 0;
      SelLength := Length(Text);
    end; { with }
    Key := #0;
  end; { if }
end;

procedure TKERavePreviewForm.SetSaveOptions(SaveDialog: TSaveDialog);
begin
  dlogSave.Filter := Trans('Rave Snapshot Files (*.ndr)|*.ndr');
  if RpRender.GetRenderFilter <> '' then begin
    dlogSave.Filter := dlogSave.Filter + '|' + RpRender.GetRenderFilter;
  end; { if }
end;

procedure TKERavePreviewForm.PreviewTimerTimer(Sender: TObject);
begin
  PreviewTimer.Enabled := false;

//ReportSystem.OnRenderPage := NewRenderPage;
//ReportSystem.OnRenderData := nil; //!!!
//ReportSystem.Generate;
end;

procedure TKERavePreviewForm.NewRenderPage(Sender: TObject);
begin
// Called when a new render page is available

// Update page count
  PageLabel.Caption := Trans('of') + ' ' + IntToStr((Sender as TRvNDRWriter).JobPages);

  if PageNum = 1 {(Sender.Pages = PageNum)} then begin
  // Draw page content

  end; { if }

// Make sure everything is refreshed
  Application.ProcessMessages;
end;

procedure TKERavePreviewForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(RvRenderPreview);
  FreeAndNil(RvRenderPrinter);
end;

procedure TKERavePreviewForm.AfterPreviewPrintEvent;
begin
  if Assigned(FOnAfterPreviewPrint) then begin
    OnAfterPreviewPrint(RvRenderPrinter);
  end; { if }
end;

procedure TKERavePreviewForm.SetButtonState;
begin
  // actions don't update correctly with modeless dialogs
  if not (fsModal in FormState) then begin
    actnPage_First.Enabled := RvRenderPreview.CurrentPage > 1;
    actnPage_Previous.Enabled := RvRenderPreview.CurrentPage > 1;
    actnPage_Next.Enabled := RvRenderPreview.CurrentPage < RvRenderPreview.Pages;
    actnPage_Last.Enabled := RvRenderPreview.CurrentPage < RvRenderPreview.Pages;
    actnFile_Print.Enabled := true;//RvRenderPreview.Rendering;
    actnFile_Save.Enabled := true;//RvRenderPreview.Rendering;
    actnZoom_In.Enabled := true;//RvRenderPreview.Rendering;
    actnZoom_Out.Enabled := true;//RvRenderPreview.Rendering;
    actnZoom_PageWidth.Enabled := true;//RvRenderPreview.Rendering;
    actnZoom_Page.Enabled := true;//RvRenderPreview.Rendering;
  end;
end;

procedure TKERavePreviewForm.FormShow(Sender: TObject);
begin
  SetButtonState;
end;

function TKERavePreviewForm.PageInRange(APageNum: Integer): boolean;
var
  LSelection: TFormatString;
  Sel: TFormatString;
  First: integer;
  Last: integer;
  I1: integer;
begin { PageInRange }
  LSelection := RvRenderPrinter.Selection;
  if LSelection = '' then begin
    Result := (APageNum >= RvRenderPrinter.FirstPage) and (APageNum <= RvRenderPrinter.LastPage);
  end else begin
  { Handle formats like 1-3,5,7,11-,12,even,odd,all or -20 }
    I1 := 0;
    First := -1;
    Sel := '';
    Result := false;
    repeat
      Inc(I1);
      if (I1 > Length(LSelection)) or (LSelection[I1] = ',') then begin
        Sel := UpperCase(Sel);
        if Sel = '' then begin
          if First > -1 then begin
            Result := (APageNum >= First);
          end; { if }
        end else if (Sel = 'E') or (Sel = {Trans-}'EVEN') then begin { Even }
          Result := not Odd(APageNum);
        end else if (Sel = 'R') then begin { Reverse Print }
        end else if (Sel = 'O') or (Sel = {Trans-}'ODD') then begin { Odd }
          Result := Odd(APageNum);
        end else if (Sel = 'A') or (Sel = {Trans-}'ALL') then begin { All }
          Result := true;
        end else begin { Check numeric range }
          Last := StrToInt(Sel);
          if First > -1 then begin
            Result := (APageNum >= First) and (APageNum <= Last);
          end else begin
            Result := (APageNum = Last);
          end; { else }
        end; { else }
        First := -1;
        Sel := '';
      end else if LSelection[I1] = '-' then begin
        if Sel = '' then begin
          First := 1;
        end else begin
          First := StrToInt(Sel);
        end; { else }
        Sel := '';
      end else begin
        Sel := Sel + LSelection[I1];
      end; { else }
    until (I1 > Length(LSelection)) or Result;
  end; { else }
end;  { PageInRange }

end.
