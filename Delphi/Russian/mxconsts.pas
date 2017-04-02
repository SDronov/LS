{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{  �����������: 1998-2002 Polaris Software              }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit mxConsts;

{$R mxconsts.RES}

interface

{$IFDEF VER130}
  {$DEFINE D5_}
{$ENDIF}
{$IFDEF VER140}
  {$DEFINE D5_}
{$ENDIF}
{$IFDEF VER150}
  {$DEFINE D5_}
{$ENDIF}

{$IFDEF D5_}
const
  { DecisionCube Dialog help contexts }
  hcDDecisionCubeEditor = 30170;
  hcDDecisionCubeDimensions = 30171;
  hcDDecisionCubeMemoryControl = 30172;
  hcDDecisionCubeDesignerOptions = 30173;
  hcDDecisionCubeLimits = 30174;
  hcDDecisionQueryEditor = 30180;
  hcDDecisionQueryDimensions = 30181;
  hcDDecisionQuerySQLEditor = 30182;
{$ENDIF}

resourcestring
{$IFDEF D5_}
  sRowError             = '������ ������';
{$ENDIF}
  { Strings used in the Pivot }
  sAllValues            = 'All Values';
  sMovetoRow            = 'Move to Row Area';
  sMovetoCol            = 'Move to Column Area';
  sMakeDimOpen          = 'Open Dimension';
  sDrilled              = 'Drilled In';
  sCouldNotOpen         = '��������� ���������� �� ����� ���� ���������. ';
  sNoSumsAvailable      = '�� ���� ���������� �������� �����. ';
  sNoSumsCouldBeLoaded  = '��� �������� ����� �� ������� �����. ';
  sNoDimsAvailable      = '�� ���� ���������� ��������� ���������. ';
  sNoDimsCouldBeLoaded  = '��� �������� ��������� �� ������� �����. ';

  sTemplatePrefix       = 'Template: ';
  { Strings used in the CrossTabGrid }
  sGridCellError        = '[������]';
  sTotalCaption         = '�����';
  sActivateLabel        = 'Inactive Dimensions';
  sRowCaption           = 'R';
  sColCaption           = 'C';
  sCaptionMenu1         = '����� ������ � ��������� ������';
  sCaptionMenu2         = '����� ������ ������';
  sCaptionMenu3         = '����� ������ ��������� ������';
  sDrillIn              = 'Drill in to this value';
  sGridMenu1            = '����.����� ���/����';
  sGridMenu2            = '�������� Decision Cube..';
  sGridMenu3            = '�������� Decision Query..';
  sGridMenu4            = '����� ������� �����������..';

  { Strings used in mxarrays }
  sUnsupportedDataType  = '��� ������ �� ��������������: %s';
  sRowOutOfRange        = '������ ������ ����� �� �������: %d';
  sColOutOfRange        = '������ ������� ����� �� �������: %d';
  sDupeItem             = '�������� �������� �������';
  sArrayIndexOutOfRange = '������ ������� ����� �� �������: %d';
  sLowCapacityError     = '������� DecisionCube ���������. ��������� ��������� ��� ������� ����� ������.';
  sQryNotInitialized    = '�� ���� ��������� ������. ��������� ������������ Query, ���� SQL � �� (Database).';
  sSortedListError      = '�������� �� ��������� �� ��������������� ������ �����.';
  sDuplicateString      = '� ������ ����� ��������� �� ���������.';
  sMaxAllowedSums       = '�������� �������� ������ ��� %d.';
  sGeneralArrayError    = '����� ������ �������.';

  {String used in the DecisionSource}
  sDimIndexError        = '�������� ������ ���������';

  {String used in the DecisionCube}
  sIllegalValueForBin   = 'Initial Value - �������� ��� ����� ���� Grouping';
  sIllegalDimMap        = 'Dimension Map - ��������� �������';
  sDimMapActiveError    = '�� ���� ��������� ��� �������� �� �������� Dimension Map';
  sNotAvailable         = '�����������';
  sGetValueCounts       = '���������� ��� ��������� Maximum Cell limit �����������.  �������� ������?';
  sDateBinningNotAllowed = '����������� ��� �� ��������� ��� ����� ������ ����';
  sEmptyDataSet         = '�� ���� ��������� Decision Cube � ������ ������� ������ (data set)';

  { Strings use in Query UI}
  sNoDataSet            = '�������� Data set �� ����������';
  sNoAggs               = '����� �� ����������. ';
  sNoDims               = '���� ��������� �� ����������. ';
  sUnknownDims          = '���� ��������� ��� ����� ������ ������ �� ����� ���� ���������� �������������.  �� ������ ����������� ���� ���������� ��� ������ � ��������� Decision Cube';
  sGroupsMissing        = '��� ���� ��������� ������ ���� �������������. ';
  sDecisionQueryError   = '������ �����������, ���� ����� ����������� ��� ���� �������� ���������� ��� ������ � ��������� Decision Cube';
  sDataSetError         = '����� ������ ����� �������, ���� ����� ����������� ��� ���� �������� ���������� ��� ������ � ��������� Decision Cube';
  sQueryError           = '������ �����������, ���� ����� ����������� ��� ���� �������� ���������� ��� ������ � ��������� Decision Cube';
  sCountStar            = 'COUNTALL';  { INTL must be in upper case }
  sAddAvgWarning        = '������� ����������� ����� ����� sum � count ��� ������� ����. ��������� ����� ���� ���������.';
  sAddAvgStarWarning    = '������� ����������� ����� ���� sum � count(*).  ��������� ����� ���� ���������.';

  { Query UI Designer strings}
  sQueryLegal           = '������ ����������.';
  sAddFieldExists       = ' - ��� � �������';
  sAggTypeNotAllowed    = ' - �������� ��� �����';
  sDimTypeNotAllowed    = ' �������� ��� ���������';
  sAverageRequires      = '����� Average ���������� Sum � Count';
  sWantToExit           = '�� ������������� ������ �����?';
  sQueryIllegal         = '��������� ���� ������ �������.';
  sQueryEditIllegal     = '��������� ������ �������.  ��������� ��� ��� �����������.';
  sRemoveFieldError     = '�� ���� ������� ����';
  sAllFields            = '��� ����';
  sQueryFields          = '���� �������';
  sEditDone             = '&Edit Done';
  sEditQuery            = '&Edit Query';

  { Used by the query parser}
  sQParseRemovedField   = '���� ��� ����� ����� ������������ ��� ����������� ���� ���� ������� �� �������.';

  { used by mxstore }
  sCubeLimitsExceeded   = '������ Decision Cube �������� �������';
  sMaxAllowedDims       = '�������� �������� ���������� ����������� %d.';
  sMaxAllowedCells      = '����� ����� ����� %d ��������� �������� - %d.';
  sUnsupportedFieldType = '���� %s ����� ���������������� ��� ������: %s';
  sFetchValues          = '������������ �������� ������ ������ (data set)...';
  sUserCanceled         = '�� �������� ���������� DecisionCube.';
  sBinningValues        = '������������� �������� ...';
  sCreatingIndexes      = '�������� ������� Cube ��� %s ...';
  sCreateDerivedSummaryError = '�� ���� ������� ����������� ����.';
  sTrue                 = 'True';
  sFalse                = 'False';
  sBinTypeMismatch      = '��� ���������� �� ������������� ���� ����.';
  sFatalCacheError      = '��������� ���� ����: ���: %d';
  sStringTypeNoSupported = '��������� ��� ������ ���������� ��� ������';
  sDataSetTooLarge      = '����� ������ (dataset) ������� �����';
  sBuildingDataStore    = '���������� ��������� ������...';

  {String used in MXtables and mxcommon and mxqparse}
  sSumLabel             = '����� %s';
  sCountLabel           = '���������� %s';
  sMaxLabel             = '�������� %s';
  sMinLabel             = '������� %s';
  sAverageLabel         = '������� %s';
  sVarLabel             = '���������� %s';
  sSDLabel              = '����������� �������� %s';
  sAggLabel             = '���� %s';
  sUnsupportedVarType   = '��� ������ %d �� ��������������';
  sOtherValues          = '������ ��������';

  sSelectFromError      = '� ������� ����������� ����������� Select/From.';
  sArgumentExpected     = '��� ��������� ��� ����� �� ����� ��������';
  sGroupOnExpressionError = '��������� ������ ������������ ��� ���� �����������';

  SOutofBounds          = '����� �� �������';
  sIDAPILangID          = '0019';

implementation

end.
