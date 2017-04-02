{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (Пн, 18 июл 2005) $
}
unit fdcCustomTreeListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomDBDataFrm, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL, DB, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, dxBar, ImgList, cxEdit, dxStatusBar,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList, StdCtrls,
  cxLookAndFeelPainters, dxLayoutControl, cxButtons, ExtCtrls, cxLabel,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TfdcCustomTreeListForm = class(TfdcCustomDBDataForm)
    dxBarDockControl1: TdxBarDockControl;
    StatusBar: TdxStatusBar;
    StatusBarContainer0: TdxStatusBarContainerControl;
    lblRecordCount: TcxLabel;
    edtMaxRecordCount: TcxSpinEdit;
    StatusBarContainer1: TdxStatusBarContainerControl;
    lblQueryTime: TcxLabel;
    StatusBarContainer2: TdxStatusBarContainerControl;
    pnlMaxRecordCoundExceeded: TPanel;
    imgMaxRecordCoundExceeded: TImage;
    lblMaxRecordCoundExceeded: TcxLabel;
    pnlProgress: TPanel;
    lblProgress: TcxLabel;
    StatusBarContainer3: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    pnlWorkspace: TPanel;
    splSearchCriteria: TSplitter;
    pnlSearchCriteria: TPanel;
    lcSearchCriteria: TdxLayoutControl;
    btnSearch: TcxButton;
    dxLayoutGroup1: TdxLayoutGroup;
    lciSearchBtn: TdxLayoutItem;
    pnlSearchCriteriaCaption: TPanel;
    lblSearchCriteriaCaption: TLabel;
    imgSearchCriteriaCaption: TImage;
    pnlGrid: TPanel;
    tlData: TcxDBTreeList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdcCustomTreeListForm: TfdcCustomTreeListForm;

implementation

{$R *.dfm}

end.
