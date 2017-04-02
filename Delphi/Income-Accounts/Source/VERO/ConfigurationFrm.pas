unit ConfigurationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomDlgFrm, cxSplitter, ComCtrls, ExtCtrls, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, cxControls, ImgList;

type
  TConfigurationForm = class(TfdcCustomDlgForm)
    Panel1: TPanel;
    dxLayoutControl1Item2: TdxLayoutItem;
    tvOptions: TTreeView;
    cxSplitter1: TcxSplitter;
    pnlOptions: TPanel;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigurationForm: TConfigurationForm;

implementation

{$R *.dfm}

initialization
   RegisterClass(TConfigurationForm);

end.
