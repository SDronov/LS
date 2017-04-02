unit fMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, ComCtrls, cxControls, cxPC;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ListView1: TListView;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    DataSource1: TDataSource;
    cxTabControl1: TcxTabControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
