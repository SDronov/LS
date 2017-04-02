
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       XML RTL Constants                               }
{                                                       }
{ Copyright (c) 2002 Borland Software Corporation       }
{                                                       }
{  �����������: 2002 Polaris Software                   }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit XMLConst;

interface

resourcestring
  { xmldom.pas }
  SDuplicateRegistration = '"%s" DOMImplementation ��� ���������������';
  SNoMatchingDOMVendor = '��� ����������� DOM Vendor: "%s"';
  SNoDOMNodeEx = '��������� DOM Vendor �� ������������ ��� �������� ��� �����';
  SDOMNotSupported = '�������� ��� ����� "%s" �� �������������� DOM Vendor "%s"';

  { msxmldom.pas }
  SNodeExpected = '���� �� ����� ���� ������ (null)';
  SMSDOMNotInstalled = 'Microsoft MSXML �� ����������';

  { oxmldom.pas }
  {$IFDEF MSWINDOWS}
  SErrorDownloadingURL = '������ �������� URL: %s';
  SUrlMonDllMissing = '�� ���� ��������� %s';
  {$ENDIF}
  SNotImplemented = '��� �������� ��� ����� �� ���������� � Open XML Parser';

  { xercesxmldom.pas }
  SINDEX_SIZE_ERR = '�������� �������� � ������';
  SDOMSTRING_SIZE_ERR = '�������� ������ DOMString';
  SHIERARCHY_REQUEST_ERR = '�� ���� �������� �������� ����';
  SWRONG_DOCUMENT_ERR = '����� ������� ������ ��������';
  SINVALID_CHARACTER_ERR = '�������� ������ � �����';
  SNO_DATA_ALLOWED_ERR = 'No data allowed'; // not used
  SNO_MODIFICATION_ALLOWED_ERR = '��������� �� ��������� (������ ������ ��� ������)';
  SNOT_FOUND_ERR = '���� �� ������';
  SNOT_SUPPORTED_ERR = '�� ��������������';
  SINUSE_ATTRIBUTE_ERR = '������� ��� ������ � ������ ���������';
  SINVALID_STATE_ERR = '�������� ���������';
  SSYNTAX_ERR = '�������� ���������';
  SINVALID_MODIFICATION_ERR = 'Invalid modification';  // not used
  SNAMESPACE_ERR = '�������� ������ namespace';
  SINVALID_ACCESS_ERR = 'Invalid access'; // not used

  SBadTransformArgs = 'TransformNode ������ ���� ������, ��������� ���� ��������� (�� ������� ���������) ��� ��������� � stylesheet.';
  SErrorWritingFile = '������ �������� ����� "%s"';
  SUnhandledXercesErr = 'Unhandled Xerces DOM ������ (��������� �� ��������): %d';
  SDOMError = '������ DOM: ';
  {$IFDEF LINUX}
  SErrorLoadingLib = '������ �������� ���������� "%s": "%s"';
  {$ENDIF}

  { XMLDoc.pas }
  SNotActive = '��� ��������� ���������';
  SNodeNotFound = '���� "%s" �� ������';
  SMissingNode = 'IDOMNode ���������';
  SNoAttributes = '�������� �� �������������� �� ���� ���� ����';
  SInvalidNodeType = '�������� ��� ����';
  SMismatchedRegItems = '������������� ��������� � RegisterChildNodes';
  SNotSingleTextNode = '������� �� �������� ������������ ��������� ����';
  SNoDOMParseOptions = '���������� DOM �� ������������ IDOMParseOptions';
  SNotOnHostedNode = '�������� �������� �� hosted ����';
  SMissingItemTag = '�������� ItemTag �� ����������������';
  SNodeReadOnly = '���� ������ ��� ������';
  SUnsupportedEncoding = '����������� ����������������� ������� "%s", ��������� � �������������� LoadFromFile';
  SNoRefresh = 'Refresh �������������� ������, ���� ����������� �������� FileName ��� XML';
  SMissingFileName = 'FileName �� ����� ���� ������';
  SLine = 'Line';
  SUnknown = '����������';

  { XMLSchema.pas }
  SInvalidSchema = '�������� ��� ���������������� �������� XML Schema';
  SNoLocalTypeName = '���������� ���������� ���� �� ����� ����� ���.  �������: %s';
  SUnknownDataType = '����������� ��� ������ "%s"';
  SInvalidValue = '�������� %s ��������: "%s"';
  SInvalidGroupDecl = '�������� group ���������� � "%s"';
  SMissingName = '�������� ��� ����';
  SInvalidDerivation = '�������� ������� ������������ ����: %s';
  SNoNameOnRef = '��� �� ����������� �� ref item';
  SNoGlobalRef = '������ ���������� ����� �� ����� ��������� ref';
  SNoRefPropSet = '%s �� ����� ���� ����������� �� ref item';
  SSetGroupRefProp = '���������� �������� GroupRef ��� cmGroupRef content model';
  SNoContentModel = 'ContentModel �� �����������';
  SNoFacetsAllowed = 'Facets � Enumeration �� ��������� �� ���� ���� ������ "%s"';
  SNotBuiltInType = '�������� ��� ����������� ���� "%s"';
  SBuiltInType = '���������� ���';

  { XMLDataToSchema.pas }
  SXMLDataTransDesc = '���������� XMLData � XML Schema (.xml -> .xsd)';

  { XMLSchema99.pas }
  S99TransDesc = '���������� 1999 XML Schema (.xsd <-> .xsd)';

  { DTDSchema.pas }
  SDTDTransDesc = '���������� DTD � XML Schema (.dtd <-> .xsd)';

  { XDRSchema.pas }
  SXDRTransDesc = '���������� XDR � XML Schema (.xdr <-> .xsd)';

  
implementation

end.
