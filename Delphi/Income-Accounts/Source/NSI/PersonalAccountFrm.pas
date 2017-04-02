unit PersonalAccountFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxButtonEdit,
  cxDBEdit, fdcObjectLinkEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxPC, cxControls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  dxDockControl, dxDockPanel, NSIDictFrm, QueryList, cxCurrencyEdit,
  cxCheckBox;

type
  TPersonalAccountForm = class(TObjectForm)
    dsDataSUBJECT_ID: TFloatField;
    dsDataPARENT_ID: TFloatField;
    lciSubject: TdxLayoutItem;
    edtSubject: TfdcObjectLinkEdit;
    dsDataSUBJECT_NAME: TStringField;
    dsDataINN: TStringField;
    dsDataKPP: TStringField;
    tabJoin: TcxTabSheet;
    tabPart1: TcxTabSheet;
    tabPart2: TcxTabSheet;
    pPart1: TcxPageControl;
    tabOperationPart1: TcxTabSheet;
    tabSvodDataPart1: TcxTabSheet;
    tabTurnoverPart1: TcxTabSheet;
    tabSvodOstPart1: TcxTabSheet;
    tabZalogPart1: TcxTabSheet;
    tabPayDrivePart1: TcxTabSheet;
    tabVozvratPart1: TcxTabSheet;
    pPart2: TcxPageControl;
    tabOperationPart2: TcxTabSheet;
    tabSvodDataPart2: TcxTabSheet;
    tabTurnoverPart2: TcxTabSheet;
    tabNotStopOperationPart2: TcxTabSheet;
    tabNotIncludePart2: TcxTabSheet;
    grdData: TcxGrid;
    grdDataDBTableView: TcxGridDBTableView;
    grdDataDBTableViewID: TcxGridDBColumn;
    grdDataDBTableViewTYPESYSNAME: TcxGridDBColumn;
    grdDataDBTableViewTYPENAME: TcxGridDBColumn;
    grdDataDBTableViewNAME: TcxGridDBColumn;
    grdDataDBTableViewDESCRIPT: TcxGridDBColumn;
    grdDataDBBandedTableView: TcxGridDBBandedTableView;
    grdDataLevel: TcxGridLevel;
    dsSvodOstPart1: TDataSource;
    odsSvodOstPart1: TfdcQuery;
    odsSvodOstPart1DOC_NUMBER: TStringField;
    odsSvodOstPart1DOC_DATE: TDateTimeField;
    odsSvodOstPart1DOC_SUMMA: TFloatField;
    odsSvodOstPart1KBK: TStringField;
    odsSvodOstPart1OST_SUM: TFloatField;
    odsSvodOstPart1BLOCK_SUMMA: TFloatField;
    GridPopupMenu: TcxGridPopupMenu;
    odsZalogPart1: TfdcQuery;
    dsZalogPart1: TDataSource;
    odsZalogPart1DOC_NUMBER: TStringField;
    odsZalogPart1DOC_DATE: TDateTimeField;
    odsZalogPart1DOC_SUMMA: TFloatField;
    odsZalogPart1KBK: TStringField;
    odsZalogPart1SUMMA: TFloatField;
    odsPayDrivePart1: TfdcQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    dsPayDrivePart1: TDataSource;
    odsPayDrivePart1SP: TStringField;
    odsPayDrivePart1OU: TStringField;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBBandedTableView2DOC_NUMBER: TcxGridDBBandedColumn;
    cxGridDBBandedTableView2DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView2DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView2KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView2SP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView2OU: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewOST_SUM: TcxGridDBBandedColumn;
    grdDataDBBandedTableViewBLOCK_SUMMA: TcxGridDBBandedColumn;
    odsVozvratPart1: TfdcQuery;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField3: TFloatField;
    StringField6: TStringField;
    dsVozvratPart1: TDataSource;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBBandedTableView3: TcxGridDBBandedTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBBandedTableView3DOC_NUMBER: TcxGridDBBandedColumn;
    cxGridDBBandedTableView3DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView3DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView3OU: TcxGridDBBandedColumn;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBBandedTableView4: TcxGridDBBandedTableView;
    cxGridLevel4: TcxGridLevel;
    odsTurnoverPart1: TfdcQuery;
    dsTurnoverPart1: TDataSource;
    odsTurnoverPart1KBK: TStringField;
    odsTurnoverPart1SUM_OST_IN: TFloatField;
    odsTurnoverPart1SUM_IN: TFloatField;
    odsTurnoverPart1SUM_R: TFloatField;
    odsTurnoverPart1SUM_DED: TFloatField;
    odsTurnoverPart1SUM_VZ: TFloatField;
    odsTurnoverPart1SUM_OUT: TFloatField;
    cxGridDBBandedTableView4KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_OST_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_R: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_DED: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_VZ: TcxGridDBBandedColumn;
    cxGridDBBandedTableView4SUM_OUT: TcxGridDBBandedColumn;
    dcBeginDate: TdxBarDateCombo;
    dcEndDate: TdxBarDateCombo;
    dxBarButton1: TdxBarButton;
    actRefreshPart: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedTableView1DOC_NUMBER: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    Splitter3: TSplitter;
    Splitter5: TSplitter;
    Panel5: TPanel;
    Panel7: TPanel;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    cxGrid5: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBBandedTableView5: TcxGridDBBandedTableView;
    cxGridLevel5: TcxGridLevel;
    cxGrid6: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBBandedTableView6: TcxGridDBBandedTableView;
    cxGridLevel6: TcxGridLevel;
    cxGrid7: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBBandedTableView7: TcxGridDBBandedTableView;
    cxGridLevel7: TcxGridLevel;
    cxGrid8: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridDBColumn40: TcxGridDBColumn;
    cxGridDBBandedTableView8: TcxGridDBBandedTableView;
    cxGridLevel8: TcxGridLevel;
    cxGrid9: TcxGrid;
    cxGridDBTableView9: TcxGridDBTableView;
    cxGridDBColumn41: TcxGridDBColumn;
    cxGridDBColumn42: TcxGridDBColumn;
    cxGridDBColumn43: TcxGridDBColumn;
    cxGridDBColumn44: TcxGridDBColumn;
    cxGridDBColumn45: TcxGridDBColumn;
    cxGridDBBandedTableView9: TcxGridDBBandedTableView;
    cxGridLevel9: TcxGridLevel;
    dsSvodOstPart1_SV: TDataSource;
    odsSvodOstPart1_SV: TfdcQuery;
    StringField5: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    odsZalogPart1_SV: TfdcQuery;
    StringField7: TStringField;
    FloatField6: TFloatField;
    dsZalogPart1_SV: TDataSource;
    odsSvodOstPart1_SVDOC_SUMMA: TFloatField;
    odsPayDrivePart1_SV: TfdcQuery;
    FloatField2: TFloatField;
    StringField8: TStringField;
    dsPayDrivePart1_SV: TDataSource;
    odsVozvratPart1_SV: TfdcQuery;
    FloatField7: TFloatField;
    dsVozvratPart1_SV: TDataSource;
    dxBarDockControlPart1Top: TdxBarDockControl;
    dsDataSDATE: TDateTimeField;
    dsDataEDATE: TDateTimeField;
    edtSDate: TcxDBDateEdit;
    lciSDate: TdxLayoutItem;
    edtEDate: TcxDBDateEdit;
    lciEDate: TdxLayoutItem;
    odsOperationPart1: TfdcQuery;
    dsOperationPart1: TDataSource;
    odsOperationPart1TYPESYSNAME: TStringField;
    odsOperationPart1ACTIVATION_DATE: TDateTimeField;
    odsOperationPart1DOC_NUMBER: TStringField;
    odsOperationPart1DOC_DATE: TDateTimeField;
    odsOperationPart1PAYER_INN: TStringField;
    odsOperationPart1PAYER_KPP: TStringField;
    odsOperationPart1SUM_IN: TFloatField;
    odsOperationPart1OU_IN: TStringField;
    odsOperationPart1DOC_DATE_DP: TDateTimeField;
    odsOperationPart1DOC_NUMBER_DP: TStringField;
    odsOperationPart1SUM_DR_IN: TFloatField;
    odsOperationPart1SUM_DP: TFloatField;
    odsOperationPart1DOC_NUMBER_TR: TStringField;
    odsOperationPart1DOC_DATE_TR: TDateTimeField;
    odsOperationPart1SUM_TR: TFloatField;
    odsOperationPart1SUM_TR_PG: TFloatField;
    odsOperationPart1DOC_DATE_DC: TDateTimeField;
    odsOperationPart1DOC_NUMBER_DC: TStringField;
    odsOperationPart1KBKCODE_DC: TStringField;
    odsOperationPart1SUM_DED_DC: TFloatField;
    odsOperationPart1OU_DED_DC: TStringField;
    odsOperationPart1DOC_DATE_PB: TDateTimeField;
    odsOperationPart1DOC_NUMBER_PB: TStringField;
    odsOperationPart1SUM_PB: TFloatField;
    odsOperationPart1SUM_DR_OUT: TFloatField;
    odsOperationPart1DOC_SUMMA: TFloatField;
    odsOperationPart1KBK: TStringField;
    odsOperationPart1SP_IN: TStringField;
    odsOperationPart1CUSTOMS_CODE_DC: TStringField;
    cxGrid10: TcxGrid;
    cxGridDBTableView10: TcxGridDBTableView;
    cxGridDBColumn46: TcxGridDBColumn;
    cxGridDBColumn47: TcxGridDBColumn;
    cxGridDBColumn48: TcxGridDBColumn;
    cxGridDBColumn49: TcxGridDBColumn;
    cxGridDBColumn50: TcxGridDBColumn;
    cxGridDBBandedTableView10: TcxGridDBBandedTableView;
    cxGridLevel10: TcxGridLevel;
    cxGridDBBandedTableView10TYPESYSNAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10ACTIVATION_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NUMBER: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10PAYER_INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10PAYER_KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SP_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10OU_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_DATE_DP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NUMBER_DP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_DR_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_DP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NUMBER_TR: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_DATE_TR: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_TR: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_TR_PG: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10CUSTOMS_CODE_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_DATE_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NUMBER_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10KBKCODE_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_DED_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10OU_DED_DC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_DATE_PB: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10DOC_NUMBER_PB: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_PB: TcxGridDBBandedColumn;
    cxGridDBBandedTableView10SUM_DR_OUT: TcxGridDBBandedColumn;
    odsOperationPart2: TfdcQuery;
    dsOperationPart2: TDataSource;
    cxGrid11: TcxGrid;
    cxGridDBTableView11: TcxGridDBTableView;
    cxGridDBColumn51: TcxGridDBColumn;
    cxGridDBColumn52: TcxGridDBColumn;
    cxGridDBColumn53: TcxGridDBColumn;
    cxGridDBColumn54: TcxGridDBColumn;
    cxGridDBColumn55: TcxGridDBColumn;
    cxGridDBBandedTableView11: TcxGridDBBandedTableView;
    cxGridLevel11: TcxGridLevel;
    odsOperationPart2TYPESYSNAME: TStringField;
    odsOperationPart2ACTIVATION_DATE: TDateTimeField;
    odsOperationPart2TYPE_CH: TStringField;
    odsOperationPart2PROC: TStringField;
    odsOperationPart2CUSTOMS_CODE: TStringField;
    odsOperationPart2DECL_NO: TStringField;
    odsOperationPart2DOC_DATE: TDateTimeField;
    odsOperationPart2KBKCODE: TStringField;
    odsOperationPart2SUM_CH: TFloatField;
    odsOperationPart2OU_CH: TStringField;
    odsOperationPart2SUM_IU: TFloatField;
    odsOperationPart2SUM_DE: TFloatField;
    odsOperationPart2SUM_Z: TFloatField;
    odsOperationPart2SUM_PB: TFloatField;
    odsOperationPart2OSN_OT: TStringField;
    odsOperationPart2SUM_OT: TFloatField;
    odsOperationPart2OU_OT: TStringField;
    cxGridDBBandedTableView11TYPESYSNAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11ACTIVATION_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11TYPE_CH: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11PROC: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11CUSTOMS_CODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11DECL_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_CH: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_IU: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_DE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11OU_DE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_Z: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_PB: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11OSN_OT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11SUM_OT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView11OU_OT: TcxGridDBBandedColumn;
    dxBarDockControlPart2Top: TdxBarDockControl;
    odsNonPaysPart2: TfdcQuery;
    dsNonPaysPart2: TDataSource;
    odsNonPaysPart2TYPESYSNAME: TStringField;
    odsNonPaysPart2CUSTOMS_CODE: TStringField;
    odsNonPaysPart2DECL_NO: TStringField;
    odsNonPaysPart2DOC_DATE: TDateTimeField;
    odsNonPaysPart2KBKCODE: TStringField;
    odsNonPaysPart2SUM_IU: TFloatField;
    odsNonPaysPart2SUM_OT: TFloatField;
    cxGrid12: TcxGrid;
    cxGridDBTableView12: TcxGridDBTableView;
    cxGridDBColumn56: TcxGridDBColumn;
    cxGridDBColumn57: TcxGridDBColumn;
    cxGridDBColumn58: TcxGridDBColumn;
    cxGridDBColumn59: TcxGridDBColumn;
    cxGridDBColumn60: TcxGridDBColumn;
    cxGridDBBandedTableView12: TcxGridDBBandedTableView;
    cxGridLevel12: TcxGridLevel;
    cxGridDBBandedTableView12TYPESYSNAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12CUSTOMS_CODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12DECL_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12SUM_IU: TcxGridDBBandedColumn;
    cxGridDBBandedTableView12SUM_OT: TcxGridDBBandedColumn;
    odsNotReestrPart2: TfdcQuery;
    dsNotReestrPart2: TDataSource;
    odsNotReestrPart2CUSTOMS_CODE: TStringField;
    odsNotReestrPart2DOC_NUMBER: TStringField;
    odsNotReestrPart2DOC_DATE: TDateTimeField;
    odsNotReestrPart2KBKCODE: TStringField;
    odsNotReestrPart2SUMMA: TFloatField;
    cxGrid13: TcxGrid;
    cxGridDBTableView13: TcxGridDBTableView;
    cxGridDBColumn61: TcxGridDBColumn;
    cxGridDBColumn62: TcxGridDBColumn;
    cxGridDBColumn63: TcxGridDBColumn;
    cxGridDBColumn64: TcxGridDBColumn;
    cxGridDBColumn65: TcxGridDBColumn;
    cxGridDBBandedTableView13: TcxGridDBBandedTableView;
    cxGridLevel13: TcxGridLevel;
    cxGrid14: TcxGrid;
    cxGridDBTableView14: TcxGridDBTableView;
    cxGridDBColumn66: TcxGridDBColumn;
    cxGridDBColumn67: TcxGridDBColumn;
    cxGridDBColumn68: TcxGridDBColumn;
    cxGridDBColumn69: TcxGridDBColumn;
    cxGridDBColumn70: TcxGridDBColumn;
    cxGridDBBandedTableView14: TcxGridDBBandedTableView;
    cxGridLevel14: TcxGridLevel;
    odsTurnoverPart2: TfdcQuery;
    dsTurnoverPart2: TDataSource;
    odsTurnoverPart2KBKCODE: TStringField;
    odsTurnoverPart2SUM_IN: TFloatField;
    odsTurnoverPart2SUM_CH: TFloatField;
    odsTurnoverPart2SUM_DE: TFloatField;
    odsTurnoverPart2SUM_OT: TFloatField;
    odsTurnoverPart2SUM_OUT: TFloatField;
    cxGridDBBandedTableView14KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView14SUM_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView14SUM_CH: TcxGridDBBandedColumn;
    cxGridDBBandedTableView14SUM_DE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView14SUM_OT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView14SUM_OUT: TcxGridDBBandedColumn;
    Panel8: TPanel;
    Splitter4: TSplitter;
    Panel9: TPanel;
    Splitter6: TSplitter;
    Panel10: TPanel;
    cxGrid15: TcxGrid;
    cxGridDBTableView15: TcxGridDBTableView;
    cxGridDBColumn71: TcxGridDBColumn;
    cxGridDBColumn72: TcxGridDBColumn;
    cxGridDBColumn73: TcxGridDBColumn;
    cxGridDBColumn74: TcxGridDBColumn;
    cxGridDBColumn75: TcxGridDBColumn;
    cxGridDBBandedTableView15: TcxGridDBBandedTableView;
    cxGridLevel15: TcxGridLevel;
    cxGrid16: TcxGrid;
    cxGridDBTableView16: TcxGridDBTableView;
    cxGridDBColumn76: TcxGridDBColumn;
    cxGridDBColumn77: TcxGridDBColumn;
    cxGridDBColumn78: TcxGridDBColumn;
    cxGridDBColumn79: TcxGridDBColumn;
    cxGridDBColumn80: TcxGridDBColumn;
    cxGridDBBandedTableView16: TcxGridDBBandedTableView;
    cxGridLevel16: TcxGridLevel;
    cxGrid17: TcxGrid;
    cxGridDBTableView17: TcxGridDBTableView;
    cxGridDBColumn81: TcxGridDBColumn;
    cxGridDBColumn82: TcxGridDBColumn;
    cxGridDBColumn83: TcxGridDBColumn;
    cxGridDBColumn84: TcxGridDBColumn;
    cxGridDBColumn85: TcxGridDBColumn;
    cxGridDBBandedTableView17: TcxGridDBBandedTableView;
    cxGridLevel17: TcxGridLevel;
    cxGridDBBandedTableView15KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView15SUM_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView15SUM_CH: TcxGridDBBandedColumn;
    cxGridDBBandedTableView15SUM_DE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView15SUM_OT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView15SUM_OUT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView16KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView16SUM_IU: TcxGridDBBandedColumn;
    cxGridDBBandedTableView16SUM_OT: TcxGridDBBandedColumn;
    odsNonPaysPart2_SV: TfdcQuery;
    StringField11: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    dsNonPaysPart2_SV: TDataSource;
    odsNotReestrPart2_SV: TfdcQuery;
    StringField10: TStringField;
    FloatField10: TFloatField;
    dsNotReestrPart2_SV: TDataSource;
    QueryList: TQueryList;
    sqlGetTypeSysname: TsqlOp;
    cxGridDBBandedTableView5KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_OST_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_IN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_R: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_DED: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_VZ: TcxGridDBBandedColumn;
    cxGridDBBandedTableView5SUM_OUT: TcxGridDBBandedColumn;
    cxGridDBBandedTableView6KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView6DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView6OST_SUM: TcxGridDBBandedColumn;
    cxGridDBBandedTableView6BLOCK_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView7KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView7SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView8DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView8KBK: TcxGridDBBandedColumn;
    cxGridDBBandedTableView9DOC_SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView13CUSTOMS_CODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView13DOC_NUMBER: TcxGridDBBandedColumn;
    cxGridDBBandedTableView13DOC_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView13KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView13SUMMA: TcxGridDBBandedColumn;
    cxGridDBBandedTableView17KBKCODE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView17SUMMA: TcxGridDBBandedColumn;
    dxBarCombo1: TdxBarCombo;
    odsOperationPart1CUSTOMS_CODE_TR: TStringField;
    cxGridDBBandedTableView10CUSTOMS_CODE_TR: TcxGridDBBandedColumn;
    odsTurnoverPart2SUM_IU: TFloatField;
    cxGridDBBandedTableView14SUM_IU: TcxGridDBBandedColumn;
    odsBrokerContractPart1: TfdcQuery;
    odsBrokerContractPart1CONTRACT_NO: TStringField;
    odsBrokerContractPart1CONTRACT_DATE: TDateTimeField;
    odsBrokerContractPart1BEGIN_DATE: TDateTimeField;
    odsBrokerContractPart1END_DATE: TDateTimeField;
    odsBrokerContractPart1IS_AUTHORIZE: TStringField;
    odsBrokerContractPart1SUB_TYPE: TStringField;
    odsBrokerContractPart1SUBJECT_INN: TStringField;
    odsBrokerContractPart1SUBJECT_KPP: TStringField;
    odsBrokerContractPart1SUBJECT_NAME: TStringField;
    odsBrokerContractPart1DOC_NO: TStringField;
    odsBrokerContractPart1LAST_NAME: TStringField;
    odsBrokerContractPart1FIRST_NAME: TStringField;
    odsBrokerContractPart1MIDDLE_NAME: TStringField;
    dsBrokerContractPart1: TDataSource;
    tabBrokerContractPart1: TcxTabSheet;
    cxGrid18: TcxGrid;
    cxGridDBTableView18: TcxGridDBTableView;
    cxGridDBColumn86: TcxGridDBColumn;
    cxGridDBColumn87: TcxGridDBColumn;
    cxGridDBColumn88: TcxGridDBColumn;
    cxGridDBColumn89: TcxGridDBColumn;
    cxGridDBColumn90: TcxGridDBColumn;
    cxGridDBBandedTableView18: TcxGridDBBandedTableView;
    cxGridDBBandedTableView18CONTRACT_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18CONTRACT_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18BEGIN_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18END_DATE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18IS_AUTHORIZE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18SUB_TYPE: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18SUBJECT_INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18SUBJECT_KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18SUBJECT_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18DOC_NO: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18LAST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18FIRST_NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView18MIDDLE_NAME: TcxGridDBBandedColumn;
    cxGridLevel18: TcxGridLevel;
    tabFilialPart1: TcxTabSheet;
    odsFilialPart1: TfdcQuery;
    cxGrid19: TcxGrid;
    cxGridDBTableView19: TcxGridDBTableView;
    cxGridDBColumn91: TcxGridDBColumn;
    cxGridDBColumn92: TcxGridDBColumn;
    cxGridDBColumn93: TcxGridDBColumn;
    cxGridDBColumn94: TcxGridDBColumn;
    cxGridDBColumn95: TcxGridDBColumn;
    cxGridDBBandedTableView19: TcxGridDBBandedTableView;
    cxGridLevel19: TcxGridLevel;
    dsFilialPart1: TDataSource;
    odsFilialPart1NAME: TStringField;
    odsFilialPart1INN: TStringField;
    odsFilialPart1KPP: TStringField;
    odsFilialPart1SUBJECT_NAME: TStringField;
    cxGridDBBandedTableView19NAME: TcxGridDBBandedColumn;
    cxGridDBBandedTableView19INN: TcxGridDBBandedColumn;
    cxGridDBBandedTableView19KPP: TcxGridDBBandedColumn;
    cxGridDBBandedTableView19SUBJECT_NAME: TcxGridDBBandedColumn;
    dsDataIS_FILIAL: TStringField;
    Panel11: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleFooter: TcxStyle;
    cxStyleBandHeader: TcxStyle;
    Panel12: TPanel;
    odsSvodOstPart1PO_KBK: TStringField;
    grdDataDBBandedTableViewPO_KBK: TcxGridDBBandedColumn;
    plCaptionSubjectPart1: TPanel;
    plCaptionSubjectPart2: TPanel;
    procedure tabJoinShow(Sender: TObject);
    procedure tabSvodOstPart1Show(Sender: TObject);
    procedure tabZalogPart1Show(Sender: TObject);
    procedure tabPayDrivePart1Show(Sender: TObject);
    procedure tabVozvratPart1Show(Sender: TObject);
    procedure tabTurnoverPart1Show(Sender: TObject);
    procedure actRefreshPartExecute(Sender: TObject);
    procedure tabSvodDataPart1Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPropertiesChange(Sender: TObject);
    procedure tabOperationPart1Show(Sender: TObject);
    procedure tabOperationPart2Show(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure tabNotStopOperationPart2Show(Sender: TObject);
    procedure tabNotIncludePart2Show(Sender: TObject);
    procedure tabTurnoverPart2Show(Sender: TObject);
    procedure tabSvodDataPart2Show(Sender: TObject);
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure odsOperationPart1BeforeOpen(DataSet: TDataSet);
    procedure tabBrokerContractPart1Show(Sender: TObject);
    procedure tabFilialPart1Show(Sender: TObject);
    procedure odsOperationPart1AfterOpen(DataSet: TDataSet);
    procedure odsPayDrivePart1AfterOpen(DataSet: TDataSet);
    procedure odsVozvratPart1AfterOpen(DataSet: TDataSet);
    procedure odsOperationPart2AfterOpen(DataSet: TDataSet);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  protected
    FPersonalAccountJoinGridForm : TForm;
  public
    { Public declarations }
  end;

var
  PersonalAccountForm: TPersonalAccountForm;

implementation

uses PersonalAccountJoinGridFrm, fdcCustomObjectGridFrm, MainDm;

{$R *.dfm}

procedure TPersonalAccountForm.tabJoinShow(Sender: TObject);
begin
  if not Assigned(FPersonalAccountJoinGridForm) then begin
      FPersonalAccountJoinGridForm := ShowForm('TPersonalAccountJoinGridForm', Params, tabJoin);
      TObjectForm(FPersonalAccountJoinGridForm).RegisterWaiter(Self);
      Self.RegisterWaiter(TObjectForm(FPersonalAccountJoinGridForm));
  end;
  (FPersonalAccountJoinGridForm as TfdcCustomObjectGridForm).actAdd.Visible := (self.dsDataPARENT_ID.Value = 0);
  (FPersonalAccountJoinGridForm as TfdcCustomObjectGridForm).RefreshData;

end;

procedure TPersonalAccountForm.tabSvodOstPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := grdData;
    odsSvodOstPart1.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsSvodOstPart1.Active Then odsSvodOstPart1.Close;
    odsSvodOstPart1.Open;
end;

procedure TPersonalAccountForm.tabZalogPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid1;
    odsZalogPart1.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsZalogPart1.Active Then odsZalogPart1.Close;
    odsZalogPart1.Open;
end;

procedure TPersonalAccountForm.tabPayDrivePart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid2;
    odsPayDrivePart1.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsPayDrivePart1.Active Then odsPayDrivePart1.Close;
    odsPayDrivePart1.Open;
end;

procedure TPersonalAccountForm.tabVozvratPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid3;
    odsVozvratPart1.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsVozvratPart1.Active Then odsVozvratPart1.Close;
    odsVozvratPart1.Open;
end;

procedure TPersonalAccountForm.tabTurnoverPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    GridPopupMenu.Grid := cxGrid4;
    odsTurnoverPart1.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsTurnoverPart1.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsTurnoverPart1.ParamByName('ID').AsInteger      := dsDataID.AsInteger;
    if odsTurnoverPart1.Active Then odsTurnoverPart1.Close;
    odsTurnoverPart1.Open;
end;

procedure TPersonalAccountForm.actRefreshPartExecute(Sender: TObject);
begin
  inherited;
    //
    // Part1
    if pcMain.ActivePage.Name = tabPart1.Name  then
    begin

    if pPart1.ActivePage.Name = tabBrokerContractPart1.Name  then
       begin
        odsBrokerContractPart1.ParamByName('ID').AsInteger    := dsDataID.AsInteger;
        if odsBrokerContractPart1.Active Then odsBrokerContractPart1.Close;
        odsBrokerContractPart1.Open;
       end;

    if pPart1.ActivePage.Name = tabFilialPart1.Name  then
       begin
        odsFilialPart1.ParamByName('ID').AsInteger    := dsDataSUBJECT_ID.AsInteger;
        if odsFilialPart1.Active Then odsFilialPart1.Close;
        odsFilialPart1.Open;
       end;

    if      (pPart1.ActivePage.Name = tabOperationPart1.Name) then
       begin
        odsOperationPart1.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
        odsOperationPart1.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
        if odsOperationPart1.Active Then odsOperationPart1.Close;
        odsOperationPart1.Open;
       end;

    if      (pPart1.ActivePage.Name = tabSvodDataPart1.Name)
         or (pPart1.ActivePage.Name = tabTurnoverPart1.Name) then
       begin
        odsTurnoverPart1.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
        odsTurnoverPart1.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
        if odsTurnoverPart1.Active Then odsTurnoverPart1.Close;
        odsTurnoverPart1.Open;
       end;
    if      (pPart1.ActivePage.Name = tabSvodDataPart1.Name) then
       begin
        if odsSvodOstPart1_SV.Active Then odsSvodOstPart1_SV.Close;
        odsSvodOstPart1_SV.Open;
        if odsZalogPart1_SV.Active Then odsZalogPart1_SV.Close;
        odsZalogPart1_SV.Open;
        if odsPayDrivePart1_SV.Active Then odsPayDrivePart1_SV.Close;
        odsPayDrivePart1_SV.Open;
        if odsVozvratPart1_SV.Active Then odsVozvratPart1_SV.Close;
        odsVozvratPart1_SV.Open;
       end;
    if      (pPart1.ActivePage.Name = tabSvodOstPart1.Name) then
       begin
        if odsSvodOstPart1.Active Then odsSvodOstPart1.Close;
        odsSvodOstPart1.Open;
       end;
    if      (pPart1.ActivePage.Name = tabZalogPart1.Name) then
       begin
        if odsZalogPart1.Active Then odsZalogPart1.Close;
        odsZalogPart1.Open;
       end;
     if      (pPart1.ActivePage.Name = tabPayDrivePart1.Name) then
       begin
        if odsPayDrivePart1.Active Then odsPayDrivePart1.Close;
        odsPayDrivePart1.Open;
       end;
     if      (pPart1.ActivePage.Name = tabVozvratPart1.Name) then
       begin
        if odsVozvratPart1.Active Then odsVozvratPart1.Close;
        odsVozvratPart1.Open;
       end;
    end;
    // Part2
    if pcMain.ActivePage.Name = tabPart2.Name then
    begin
    if      (pPart2.ActivePage.Name = tabOperationPart2.Name) then
       begin
        odsOperationPart2.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
        odsOperationPart2.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
        if odsOperationPart2.Active Then odsOperationPart2.Close;
        odsOperationPart2.Open;
       end;

    if      (pPart2.ActivePage.Name = tabSvodDataPart2.Name)
         or (pPart2.ActivePage.Name = tabTurnoverPart2.Name) then
       begin
        odsTurnoverPart2.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
        odsTurnoverPart2.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
        if odsTurnoverPart2.Active Then odsTurnoverPart2.Close;
        odsTurnoverPart2.Open;
       end;
    if      (pPart2.ActivePage.Name = tabSvodDataPart2.Name) then
       begin
        if odsNonPaysPart2_SV.Active Then odsNonPaysPart2_SV.Close;
        odsNonPaysPart2_SV.Open;
        if odsNotReestrPart2_SV.Active Then odsNotReestrPart2_SV.Close;
        odsNotReestrPart2_SV.Open;
       end;
    if      (pPart1.ActivePage.Name = tabNotStopOperationPart2.Name) then
       begin
        if odsNonPaysPart2.Active Then odsNonPaysPart2.Close;
        odsNonPaysPart2.Open;
       end;
    if      (pPart1.ActivePage.Name = tabNotIncludePart2.Name) then
       begin
        if odsNotReestrPart2.Active Then odsNotReestrPart2.Close;
        odsNotReestrPart2.Open;
       end;
    end;   
end;

procedure TPersonalAccountForm.tabSvodDataPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    // обороты
    odsTurnoverPart1.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsTurnoverPart1.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsTurnoverPart1.ParamByName('ID').AsInteger      := dsDataID.AsInteger;
    if odsTurnoverPart1.Active Then odsTurnoverPart1.Close;
    odsTurnoverPart1.Open;
    // остатки
    odsSvodOstPart1_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsSvodOstPart1_SV.Active Then odsSvodOstPart1_SV.Close;
    odsSvodOstPart1_SV.Open;
    // залоги
    odsZalogPart1_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsZalogPart1_SV.Active Then odsZalogPart1_SV.Close;
    odsZalogPart1_SV.Open;
    // деньги в пути
    odsPayDrivePart1_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsPayDrivePart1_SV.Active Then odsPayDrivePart1_SV.Close;
    odsPayDrivePart1_SV.Open;
    // возврат
    odsVozvratPart1_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsVozvratPart1_SV.Active Then odsVozvratPart1_SV.Close;
    odsVozvratPart1_SV.Open;
end;

procedure TPersonalAccountForm.FormShow(Sender: TObject);
begin
  inherited;
    BarManager.Bars[1].DockControl := dxBarDockControlPart1Top;
end;

procedure TPersonalAccountForm.edtPropertiesChange(Sender: TObject);
begin
  Modified := True;
end;

procedure TPersonalAccountForm.tabOperationPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    GridPopupMenu.Grid := cxGrid10;
    odsOperationPart1.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsOperationPart1.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsOperationPart1.ParamByName('ID').AsInteger          := dsDataID.AsInteger;
    if odsOperationPart1.Active Then odsOperationPart1.Close;
    odsOperationPart1.Open;
end;

procedure TPersonalAccountForm.tabOperationPart2Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    GridPopupMenu.Grid := cxGrid11;
    odsOperationPart2.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsOperationPart2.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsOperationPart2.ParamByName('ID').AsInteger          := dsDataID.AsInteger;
    if odsOperationPart2.Active Then odsOperationPart2.Close;
    odsOperationPart2.Open;
end;

procedure TPersonalAccountForm.pcMainChange(Sender: TObject);
begin
  inherited;
     if  pcMain.ActivePage = tabPart1 then
         BarManager.Bars[1].DockControl := dxBarDockControlPart1Top;
     if  pcMain.ActivePage = tabPart2 then
         BarManager.Bars[1].DockControl := dxBarDockControlPart2Top;
end;

procedure TPersonalAccountForm.tabNotStopOperationPart2Show(
  Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid12;
    odsNonPaysPart2.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsNonPaysPart2.Active Then odsNonPaysPart2.Close;
    odsNonPaysPart2.Open;
end;

procedure TPersonalAccountForm.tabNotIncludePart2Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid13;
    odsNotReestrPart2.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsNotReestrPart2.Active Then odsNotReestrPart2.Close;
    odsNotReestrPart2.Open;
end;

procedure TPersonalAccountForm.tabTurnoverPart2Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    GridPopupMenu.Grid := cxGrid14;
    odsTurnoverPart2.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsTurnoverPart2.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsTurnoverPart2.ParamByName('ID').AsInteger          := dsDataID.AsInteger;
    if odsTurnoverPart2.Active Then odsTurnoverPart2.Close;
    odsTurnoverPart2.Open;
end;

procedure TPersonalAccountForm.tabSvodDataPart2Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := True;
    dcEndDate.Enabled   := True;
    GridPopupMenu.Grid := cxGrid15;
    odsTurnoverPart2.ParamByName('pDateBegin').AsDateTime := dcBeginDate.Date;
    odsTurnoverPart2.ParamByName('pDateEnd').AsDateTime   := dcEndDate.Date;
    odsTurnoverPart2.ParamByName('ID').AsInteger          := dsDataID.AsInteger;
    if odsTurnoverPart2.Active Then odsTurnoverPart2.Close;
    odsTurnoverPart2.Open;

    odsNotReestrPart2_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsNotReestrPart2_SV.Active Then odsNotReestrPart2_SV.Close;
    odsNotReestrPart2_SV.Open;

    odsNonPaysPart2_SV.ParamByName('ID').AsInteger := dsDataID.AsInteger;
    if odsNonPaysPart2_SV.Active Then odsNonPaysPart2_SV.Close;
    odsNonPaysPart2_SV.Open;
end;

procedure TPersonalAccountForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sqlGetTypeSysname.ParamValues['result'] := '';
    sqlGetTypeSysname.Exec('id',dsData.FieldValues['subject_id']);
    tabPart2.TabVisible               := (sqlGetTypeSysname.ParamValues['result'] <> 'Subject');
    tabBrokerContractPart1.TabVisible := (sqlGetTypeSysname.ParamValues['result'] = 'Subject');
    tabFilialPart1.TabVisible         := ( dsDataIS_FILIAL.AsString = 'Y' );
    plCaptionSubjectPart1.Caption :=
                                'ИНН: ' + dsDataINN.asString +
                                '     КПП: ' + dsDataKPP.asString +
                                '     Наименование: ' + dsDataSUBJECT_NAME.asString;
    plCaptionSubjectPart2.Caption := plCaptionSubjectPart1.Caption;
end;

procedure TPersonalAccountForm.odsOperationPart1BeforeOpen(
  DataSet: TDataSet);
  var st :string;
begin
  inherited;
      st := (DataSet as TfdcQuery).SQL.Text;
      if dxBarCombo1.ItemIndex = 1 then
        st := StringReplace(st,'--_for_replace_0*/','/*_for_replace_1*/',[rfReplaceAll, rfIgnoreCase])
      else
        st := StringReplace(st,'/*_for_replace_1*/','--_for_replace_0*/',[rfReplaceAll, rfIgnoreCase]);
      (DataSet as TfdcQuery).SQL.Text := st;
      if     (sqlGetTypeSysname.ParamValues['result'] = 'Subject')
         and (DataSet.Name = odsTurnoverPart1.Name)
      then
      begin
          cxGridDBBandedTableView4SUM_R.Hidden    := True;
          cxGridDBBandedTableView4SUM_R.Visible   := False;
          cxGridDBBandedTableView4SUM_DED.Caption := 'Списано';
      end
      else
      begin
          cxGridDBBandedTableView4SUM_R.Hidden    := False;
          cxGridDBBandedTableView4SUM_R.Visible   := True;
          cxGridDBBandedTableView4SUM_DED.Caption := 'Оплачено';
      end;
end;

procedure TPersonalAccountForm.tabBrokerContractPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid18;
    odsBrokerContractPart1.ParamByName('ID').AsInteger    := dsDataID.AsInteger;
    if odsBrokerContractPart1.Active Then odsBrokerContractPart1.Close;
    odsBrokerContractPart1.Open;
end;

procedure TPersonalAccountForm.tabFilialPart1Show(Sender: TObject);
begin
  inherited;
    dcBeginDate.Enabled := False;
    dcEndDate.Enabled   := False;
    GridPopupMenu.Grid := cxGrid19;
    odsFilialPart1.ParamByName('ID').AsInteger    := dsDataSUBJECT_ID.AsInteger;
    if odsFilialPart1.Active Then odsFilialPart1.Close;
    odsFilialPart1.Open;
end;

procedure TPersonalAccountForm.odsOperationPart1AfterOpen(
  DataSet: TDataSet);
begin
  cxGridDBBandedTableView10.ApplyBestFit;
end;

procedure TPersonalAccountForm.odsPayDrivePart1AfterOpen(
  DataSet: TDataSet);
begin
  cxGridDBBandedTableView2.ApplyBestFit;
end;

procedure TPersonalAccountForm.odsVozvratPart1AfterOpen(DataSet: TDataSet);
begin
  cxGridDBBandedTableView3.ApplyBestFit;
end;

procedure TPersonalAccountForm.odsOperationPart2AfterOpen(
  DataSet: TDataSet);
begin
  cxGridDBBandedTableView11.ApplyBestFit;
end;

procedure TPersonalAccountForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if   (AViewInfo.GridRecord.Values[grdDataDBBandedTableViewPO_KBK.Index] <>
        AViewInfo.GridRecord.Values[grdDataDBBandedTableViewKBK.Index]) then
  begin
    ACanvas.Canvas.Brush.Style := bsSolid;
    ACanvas.Canvas.Brush.Color := clBlueLight;
    if AViewInfo.RecordViewInfo.Selected or AViewInfo.RecordViewInfo.Focused
      then
      ACanvas.Canvas.Brush.Color := clBlueSky;
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end;
end;

initialization
    RegisterClass(TPersonalAccountForm);

end.
