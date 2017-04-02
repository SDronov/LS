{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{  �����������: 2001-02 Polaris Software                }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit SOAPConst;

interface

uses TypInfo, XMLSchema;

const

{$IFNDEF VER140}
  SHTTPPrefix = 'http://';                                     { Do not localize }
  SContentId = 'Content-ID';                                   { Do not localize }
  SContentLocation = 'Content-Location';                       { Do not localize }
  SContentLength = 'Content-Length';                           { Do not localize }
  SContentType = 'Content-Type';                               { Do not localize }

  SWSDLMIMENamespace = 'http://schemas.xmlsoap.org/wsdl/mime/';{ Do not location }
  SBorlandMimeBoundary = 'MIME_boundaryB0R9532143182121';
  SSoapXMLHeader = '<?xml version="1.0" encoding=''UTF-8''?>'; { Do not localize }
  SUTF8 = 'UTF-8';                                             { Do not localize }
  ContentTypeTemplate = 'Content-Type: %s';                    { Do not localize }
  ContentTypeApplicationBinary = 'application/binary';         { Do not localize }
  SBinaryEncoding = 'binary';                                  { Do not localize }
  S8BitEncoding   = '8bit';                                    { Do not localize }
  ContentTypeTextPlain = 'text/plain';                         { Do not localize }
  SCharacterEncodingFormat = 'Content-transfer-encoding: %s';  { Do not localize }
  SCharacterEncoding = 'Content-transfer-encoding';            { Do not localize }
  SBoundary = 'boundary=';                                     { Do not localize }
  SMultiPartRelated = 'multipart/related';                     { Do not localize }
  SMultiPartRelatedNoSlash = 'multipartRelated';               { Do not localize }
  ContentHeaderMime = SMultiPartRelated + '; boundary=%s';     { Do not localize }
  SStart = '; start="<%s>"';                                   { Do not localize}
  SBorlandSoapStart = 'http://www.borland.com/rootpart.xml';   { Do not localize}
  SAttachmentIdPrefix = 'cid:';                                { Do not localize }

  MimeVersion = 'MIME-Version: 1.0';
{$ELSE}
  SSoapXMLHeader = '<?xml version="1.0" encoding=''UTF-8''?>'; { do not localize}
  SUTF8 = 'UTF-8';                                             { Do not localize}
  ContentHeaderUTF8 = 'Content-Type: text/xml; charset="utf-8"';        { Do not localize }
  ContentHeaderNoUTF8 = 'Content-Type: text/xml';                       { Do not localize }
{$ENDIF}
  sTextHtml = 'text/html';                                 { Do not localize }
  sTextXML  = 'text/xml';                                  { Do not localize }

  ContentTypeUTF8 = 'text/xml; charset="utf-8"';           { Do not localize }
  ContentTypeNoUTF8 = 'text/xml';                          { Do not localize }

  SSoapNameSpace = 'http://schemas.xmlsoap.org/soap/envelope/'; { do not localize}
  SXMLNS = 'xmlns';                                        { do not localize}
  SSoapEncodingAttr = 'encodingStyle';                     { do not localize}
  SSoap11EncodingS5 = 'http://schemas.xmlsoap.org/soap/encoding/';  { do not localize}

  SSoapEncodingArray = 'Array';                            { do not localize}
  SSoapEncodingArrayType = 'arrayType';                    { do not localize}

  SSoapHTTPTransport = 'http://schemas.xmlsoap.org/soap/http';   { do not localize}
  SSoapBodyUseEncoded = 'encoded';                         { do not localize}
  SSoapBodyUseLiteral = 'literal';                         { do not localize}

  SSoapEnvelope = 'Envelope';                              { do not localize}
  SSoapHeader = 'Header';                                  { do not localize}
  SSoapBody = 'Body';                                      { do not localize}
  SSoapResponseSuff = 'Response';                          { do not localize}

{$IFNDEF VER140}
  SRequired = 'required';                                  { do not localize }
{$ELSE}
  SSoapMustUnderstand = 'mustUnderstand';                  { do not localize}
{$ENDIF}
  SSoapActor = 'actor';                                    { do not localize}
{$IFNDEF VER140}
  STrue = 'true';                                          { do not localize}
{$ENDIF}

  SSoapServerFaultCode = 'Server';                         { do not localize}
  SSoapServerFaultString = 'Server Error';                 { do not localize}
  SSoapFault = 'Fault';                                    { do not localize}
  SSoapFaultCode = 'faultcode';                            { do not localize}
  SSoapFaultString = 'faultstring';                        { do not localize}
  SSoapFaultActor = 'faultactor';                          { do not localize}
  SSoapFaultDetails =  'detail';                           { do not localize}
{$IFNDEF VER140}
  SFaultCodeMustUnderstand = 'MustUnderstand';             { do not localize}
{$ENDIF}

  SHTTPSoapAction = 'SOAPAction';                          { do not localize}

{$IFNDEF VER140}
  SHeaderMustUnderstand = 'mustUnderstand';                { do not localize}
  SHeaderActor = 'actor';                                  { do not localize}
  SActorNext= 'http://schemas.xmlsoap.org/soap/actor/next';{ do not localize}
{$ENDIF}

  SSoapType = 'type';                                      { do not localize}
  SSoapResponse = 'Response';                              { do not localize}
  SDefaultReturnName = 'return';                           { do not localize}
  SDefaultResultName = 'result';                           { do not localize}

  sNewPage = 'WebServices';                                { do not localize}  // absolete D6 Update Pack 2

  SXMLID = 'id';                                           { do not localize}
  SXMLHREF = 'href';                                       { do not localize}

  SSoapNULL = 'NULL';                                      { do not localize}
{$IFNDEF VER140}
  SSoapNIL  = 'nil';                                       { do not localize}
{$ENDIF}

  SHREFPre = '#';                                          { do not localize}
  SArrayIDPre = 'Array-';                                  { do not localize}
  SDefVariantElemName = 'V';                               { do not localize}


{$IFNDEF VER140}
  SDefaultBaseURI = 'thismessage:/';                       { do not localize}
{$ENDIF}
  SDelphiTypeNamespace = 'http://www.borland.com/namespaces/Delphi/Types';    { do not localize}
  SBorlandTypeNamespace= 'http://www.borland.com/namespaces/Types';           { do not localize}

  SOperationNameSpecifier = '%operationName%';             { Do not localize }
  SDefaultReturnParamNames= 'Result;Return';               { Do not localize }
  sReturnParamDelimiters  = ';,/:';                        { Do not localize }


  KindNameArray:  array[tkUnknown..tkDynArray] of string =
    ('Unknown', 'Integer', 'Char', 'Enumeration', 'Float',                    { do not localize }
    'String', 'Set', 'Class', 'Method', 'WChar', 'LString', 'WString',        { do not localize }
    'Variant', 'Array', 'Record', 'Interface', 'Int64', 'DynArray');          { do not localize }

  SSoapNameSpacePre = 'SOAP-ENV';            { do not localize }
  SXMLSchemaNameSpacePre = 'xsd';            { do not localize}
  SXMLSchemaInstNameSpace99Pre = 'xsi';      { do not localize}
  SSoapEncodingPre = 'SOAP-ENC';             { do not localize}

{$IFNDEF VER140}
{$IFDEF D6_STYLE_COLORS}
  sDefaultColor = '#006699';
  sIntfColor    = '#006699';
  sTblHdrColor  = '#CCCC99';
  sTblColor1    = '#FFFFCC';
  sTblColor0    = '#CCCC99';
  sBkgndColor   = '#CCCC99';
  sTipColor     = '#666666';
  sWSDLColor    = '#666699';
  sOFFColor     = '#A0A0A0';
  sNavBarColor  = '#006699';
  sNavBkColor   = '#cccccc';
{$ELSE}
  sDefaultColor = '#333333';
  sIntfColor    = '#660000';
  sTblHdrColor  = '#CCCC99';
  sTblColor1    = '#f5f5dc';
  sTblColor0    = '#d9d4aa';
  sBkgndColor   = '#d9d4aa';
  sTipColor     = '#666666';
  sWSDLColor    = '#990000';
  sOFFColor     = '#A0A0A0';
  sNavBarColor  = '#660000';
  sNavBkColor   = '#f5f5dc';
{$ENDIF}
{$ENDIF}

  HTMLStylBeg = '<style type="text/css"><!--' + sLineBreak;
  HTMLStylEnd = '--></style>'                 + sLineBreak;
  BodyStyle1  = 'body       {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; }'                                                       + sLineBreak;
  BodyStyle2  = 'body       {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; margin-left: 0px; margin-top: 0px; margin-right: 0px; }' + sLineBreak;
{$IFNDEF VER140}
  OtherStyles = 'h1         {color: '+sDefaultColor+'; font-size: 18pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                'h2         {color: '+sDefaultColor+'; font-size: 14pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                'h3         {color: '+sDefaultColor+'; font-size: 12pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                '.h1Style   {color: '+sDefaultColor+'; font-size: 18pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                '.TblRow    {color: '+sDefaultColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: normal; }' + sLineBreak +
                '.TblRow1   {color: '+sDefaultColor+'; background-color: '+sTblColor1+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: normal; }' + sLineBreak +
                '.TblRow0   {color: '+sDefaultColor+'; background-color: '+sTblColor0+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: normal; }' + sLineBreak +
                '.TblHdr    {color: '+sTblHdrColor+ '; background-color: '+sDefaultColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; text-align: center;}' + sLineBreak +
                '.IntfName  {color: '+sIntfColor  + '; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; }'                             + sLineBreak +
                '.MethName  {color: '+sDefaultColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold; text-decoration: none; }'       + sLineBreak +
                '.ParmName  {color: '+sDefaultColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; text-decoration: none; }'                          + sLineBreak +
                '.Namespace {color: '+sDefaultColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-style: italic; }'                             + sLineBreak +
                '.WSDL      {color: '+sWSDLColor+   '; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold; }'                              + sLineBreak +
                '.MainBkgnd {background-color : '+sBkgndColor+'; }'                                                                                                          + sLineBreak +
                '.Info      {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12pt; font-weight: bold; }'                                             + sLineBreak +
                '.NavBar    {color: '+sNavBarColor+'; background-color: '+sNavBkColor+'; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold;text-decoration: none; }'+ sLineBreak +
                '.Off       {color: '+sOFFColor+'; }'                                                                                                                     + sLineBreak +
                '.Tip 	    {color: '+sTipColor+'; font-family : Verdana, Arial, Helvetica, sans-serif; font-weight : normal; font-size : 9pt; }'                         + sLineBreak;
{$ELSE}
  OtherStyles = 'h1         {color: #006699; font-size: 18pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                'h2         {color: #006699; font-size: 14pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                'h3         {color: #006699; font-size: 12pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                '.h1Style   {color: #006699; font-size: 18pt; font-style: normal; font-weight: bold; }'                                                   + sLineBreak +
                '.TblRow    {color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: normal; }' + sLineBreak +
                '.TblRow1   {color: #006699; background-color: #FFFFCC; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: normal; }' + sLineBreak +
                '.TblRow0   {color: #006699; background-color: #CCCC99; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: normal; }' + sLineBreak +
                '.TblHdr    {color: #CCCC99; background-color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; text-align: center;}' + sLineBreak +
                '.IntfName  {color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; }'                             + sLineBreak +
                '.MethName  {color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold; text-decoration: none; }'       + sLineBreak +
                '.ParmName  {color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; text-decoration: none; }'                          + sLineBreak +
                '.Namespace {color: #006699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-style: italic; }'                             + sLineBreak +
                '.WSDL      {color: #666699; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold; }'                              + sLineBreak +
                '.MainBkgnd {background-color : #CCCC99; }'                                                                                                         + sLineBreak +
                '.Info      {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12pt; font-weight: bold; }'                                             + sLineBreak +
                '.NavBar    {color: #006699; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold;text-decoration: none; }'+ sLineBreak +
                '.Off       {color: #A0A0A0; }'                                                                                                                     + sLineBreak +
                '.Tip 	    {color: #666666; font-family : Verdana, Arial, Helvetica, sans-serif; font-weight : normal; font-size : 9pt; }'                         + sLineBreak;
{$ENDIF}


  HTMLStyles  = HTMLStylBeg + BodyStyle1 + OtherStyles + HTMLStylEnd;
  HTMLNoMargin= HTMLStylBeg + BodyStyle2 + OtherStyles + HTMLStylEnd;

  TableStyle  = 'border=1 cellspacing=1 cellpadding=2 ';

{$IFNDEF VER140}
resourcestring
  HTMLContentLanguage   = ''; // '<meta http-equiv="Content-Language" content="ja"><meta http-equiv="Content-Type" content="text/html; charset=shift_jis">';

const
  HTMLHead    = '<html><head>';
  HTMLServiceInspection = '<META name="serviceInspection" content="inspection.wsil">';

{resourcestring - these are getting truncated as resources currently resulting in bad HTML pages!!} 
  HTMLTopPlain              = HTMLHead + '</head><body>';
  HTMLTop                   = HTMLHead + '</head>'+HTMLStyles+'<body>';
  HTMLTopNoMargin           = HTMLHead + '</head>'+HTMLNoMargin+'<body>';
  HTMLTopTitleNoMargin      = HTMLHead + '<title>%s</title></head>'+HTMLNoMargin+'<body>';
  HTMLTopNoStyles           = HTMLHead + '</head><body>';
  HTMLTopTitle              = HTMLHead + '<title>%s</title></head>'+HTMLStyles+'<body>';
  HTMLTopTitleNoMarginWSIL  = HTMLHead + HTMLServiceInspection + '<title>%s</title></head>'+HTMLNoMargin+'<body>';

const
{$ELSE}
  HTMLTopPlain= '<html><head></head><body>';
  HTMLTop     = '<html><head></head>'+HTMLStyles+'<body>';
  HTMLTopNoM  = '<html><head></head>'+HTMLNoMargin+'<body>';
  HTMLTopTNoM = '<html><head><title>%s</title></head>'+HTMLNoMargin+'<body>';
  HTMLTopNS   = '<html><head></head><body>';
  HTMLTopTitle= '<html><head><title>%s</title></head>'+HTMLStyles+'<body>';
{$ENDIF}
  HTMLEnd     = '</body></html>';
  InfoTitle1  = '<table class="MainBkgnd" border=0 cellpadding=0 cellspacing=0 width="100%">' +
                '<tr><td>&nbsp;</td></tr>';
  InfoTitle2  = '<tr><td class="h1Style" align="center">%s - %s</td></tr>' +
                '</table>';
  TblCls: array[Boolean] of string = ('TblRow0', 'TblRow1');
  sTblRow     = 'TblRow';
  sTblHdrCls  = 'TblHdr';

  sQueryStringIntf = 'intf';                                    { Do not localize }
  sQueryStringTypes= 'types';                                   { Do not localize }
  sNBSP = '&nbsp;';                                             { Do not localize }

var

  XMLSchemaNameSpace: string = SXMLSchemaURI_2001;    { Default namespace we publish under }
  XMLSchemaInstNameSpace: string =  SXMLSchemaInstURI;

resourcestring

  SUnsupportedEncodingSyle = '���������������� SOAP encodingStyle %s';
  SInvalidSoapRequest = '�������� SOAP ������';
{$IFNDEF VER140}
  SInvalidSoapResponse = '�������� SOAP �����';
{$ENDIF}
  SMultiBodyNotSupported = '�� �������������� �������������� �������� ����';
  SUnsupportedCC = '���������������� ���������� � �������: %s';
  SUnsupportedCCIntfMeth = '��������� ����� ������: ���������������� ���������� � ������� %s ��� ������ %s ����� ��������� %s';
  SInvClassNotRegistered  = '��� ������������������� ����������� ������ ��� ����������� ���������� %s (soap action/path) %s';
  SInvInterfaceNotReg = '��� ������������������� ���������� ��� soap action ''%s''';
  SInvInterfaceNotRegURL = '��� ������������������� ���������� ��� URL ''%s''';
  SRemTypeNotRegistered  = 'Remotable Type %s �� ���������������';
  STypeMismatchInParam = '������������ ����� � ��������� %s';
  SNoSuchMethod = '��� ������ c ������ ''%s'', ��������������� ����������� ''%s''';
  SInterfaceNotReg = '��������� �� ���������������, UUID = %s';
  SInterfaceNoRTTI = '��������� �� ����� RTTI, UUID = %s';
  SNoWSDL = '��� WSDL ���������, ���������� � WSDLView';
  SWSDLError = '�������� WSDL �������� ''%s'' - ����������, ��������� ���������� � ����������!'#13#10'������: %s';
  SEmptyWSDL = '������ ��������';
  sNoWSDLURL = '�� ����������� �������� WSDL ��� URL � ���������� THTTPRIO. �� ������ ���������� �������� WSDL ��� URL ����� ������� Web Service';
  sCantGetURL= '�� ���� ���������� URL endpoint ��� Service/Port ''%s''/''%s'' �� WSDL ''%s''';
  SDataTypeNotSupported = '��� ������ TypeKind: %s �� �������������� ��� �������� ��� ���������� ������';
{$IFDEF LINUX}
  SNoMatchingDelphiType = 'C�������������� Kylix ��� �� ������ ��� ����: URI = %s, Name = %s on Node %s';
{$ENDIF}
  SUnknownSOAPAction = '����������� SOAPAction %s';
{$IFNDEF VER140}
  SScalarFromTRemotableS = '������, ������� ������������ ��������� ����, ������ ����������� �� TRemotableXS, � %s - ���';
  SNoSerializeGraphs = 'Must enable multiref output for objects when serializing a graph of objects - (%s)';
  SUnsuportedClassType = '�������������� �� ������ %s � SOAP �� �������������� - ������ SOAP ������ ����������� �� TRemotable';
{$ELSE}
  SScalarFromTRemotableS = '������, ������� ������������ ��������� ����, ������ ����������� �� TRemotable, � %s - ���';
  SNoSerializeGraphs = 'Must allow multiref output for objects when serializing a graph of objects';
  SUnsuportedClassType = '�������������� �� ������ %s � SOAP �� ��������������';
{$ENDIF}
  SUnexpectedDataType = '���������� ������: ��� ������ ���� %s �� ��������� � ���� ���������';
{$IFNDEF VER140}
  SInvalidContentType = '�������� �������� �������� ��������� Content-Type: %s - SOAP ������� "text/xml"';
{$ENDIF}

  SArrayTooManyElem = '���� �������: %s ����� ������� ����� ���������';
  SWrongDocElem = 'DocumentElement %s:%s ���������, %s:%s ������';
  STooManyParameters = '������� ����� ���������� � ������ %s';
  SArrayExpected = '��� ������ ���������. ���� %s';
{$IFDEF VER140}
  SNoMultiDimVar = '�������������� ���������� ������� �� �������������� � ������ ������';
  SNoURL = '��� ������������� URL';
{$ENDIF}

  SNoInterfaceGUID = '����� %s �� ������������ ��������� GUID %s';
  SNoArrayElemRTTI = '������� ������� ���� %s �� ����� RTTI';
  SInvalidResponse = '�������� ����� SOAP';
  SInvalidArraySpec = '�������� ������������ ������� SOAP';
  SCannotFindNodeID = '�� ���� ����� ���� �� ������ ID %s';
  SNoNativeNULL = '����� �� ����������� ��� ���������� ���� Native ���� ������������� � NULL';
  SFaultCodeOnlyAllowed = '����������� ������ ���� ������� FaultCode';
  SFaultStringOnlyAllowed = '����������� ������ ���� ������� FaultString';
  SMissingFaultValue = '����������� ������� FaultString ��� FaultCode';
  SNoInterfacesInClass = 'Invokable ����� %s �� ������������ �����������';

  SVariantCastNotSupported = '��� �� ����� ���� �������� ��� Variant';
  SVarDateNotSupported = '��� varDate �� ��������������';
  SVarDispatchNotSupported = '��� varDispatch �� ��������������';
  SVarErrorNotSupported = '��� varError �� ��������������';
  SVarVariantNotSupported = '��� varVariant �� ��������������';
{$IFNDEF VER140}
  SHeaderError = '������ ���������� ��������� (%s)%s';
{$ELSE}
  SHeaderError = '������ ���������� ��������� %s';
{$ENDIF}
  SMissingSoapReturn = '�������� ����� SOAP: ��������� �������������� �������, �������� "%s"';
  SInvalidPointer = '�������� ���������';
  SNoMessageConverter = '�� ���������� ��������� �� Native � Message';
  SNoMsgProcessingNode = '�� ���������� Message processing node';
  SHeaderAttributeError = '��������� Soap %s � ��������� ''mustUnderstand'' set to true was not handled';

  {IntfInfo}
  SNoRTTI = '��������� %s �� ����� RTTI';
  SNoRTTIParam = '�������� %s ������ %s ���������� %s �� ����� RTTI';

  {XSBuiltIns}
  SInvalidDateString        = '�������� ������ ����: %s';
  SInvalidTimeString        = '�������� ������ �������: %s';
  SInvalidHour              = '�������� ���: %d';
  SInvalidMinute            = '�������� ������: %d';
  SInvalidSecond            = '�������� �������: %d';
  SInvalidFractionSecond    = '�������� �������: %f';
  SInvalidMillisecond       = '�������� ������������: %d';
  SInvalidFractionalSecond  = '�������� ������� �������: %f';
  SInvalidHourOffset        = '�������� ����� ����: %d';
  SInvalidDay               = '�������� ����: %d';
  SInvalidMonth             = '�������� �����: %d';
  SInvalidDuration          = '�������� ������ ������������: %s';
  SMilSecRangeViolation     = '�������� ����������� ������ ���� ����� 000 - 999';
  SInvalidYearConversion    = '��� ���� ������� ������� ��� ��������������';
  SInvalidTimeOffset        = '����� ���� ������� - ��������';
  SInvalidDecimalString     = '�������� decimal ������: ''''%s''''';
  SEmptyDecimalString       = '�� ���� ������������� ������ ������ � TBcd ��������';
  SNoSciNotation            = '�� ���� ������������� ������� ������ �����  � TBcd ��������';
  SNoNAN                    = '�� ���� ������������� NAN � TBcd ��������';
  SInvalidBcd               = '�������� Bcd �������� (%d) ��� Scale (%d)';
  SBcdStringTooBig          = '�� ���� ������������� � TBcd: ������ ����� ������ ��� 64 ����: %s';
  SInvalidHexValue          = '%s - �������� ����������������� ������';
{$IFNDEF VER140}
  SInvalidHTTPRequest       = '�������� HTTP ������: ����� ����� 0';
  SInvalidHTTPResponse      = '�������� HTTP �����: ����� ����� 0';
{$ENDIF}

  {WebServExp}
  SInvalidBooleanParameter  = 'ByteBool, WordBool � LongBool �� ����� ���� exposed by WebServices. ����������, ����������� ''Boolean''';

  {WSDLIntf}
  SWideStringOutOfBounds = '������ WideString ����� �� �������';

  {WSDLPub}
  IWSDLPublishDoc = 'Lists all the PortTypes published by this Service';

  SNoServiceForURL = '��� ���������� ������� ��� URL %s';
  SNoInterfaceForURL = '��� ������������������� ���������� ��� ���������� URL %s';
  SNoClassRegisteredForURL = '��� ������������������� ������ ��� ����������� ���������� %s';
  SEmptyURL = '��� URL, ������������� ��� ''GET''';
  SInvalidURL = '�������� url ''%s'' - ������������ ������ ''http'' � ''https'' �����';
  SNoClassRegistered = '��� ������������������� ������ ��� ����������� ���������� %s';
  SNoDispatcher = '��� �������������� ����������';
  SMethNoRTTI = '����� �� ����� RTTI';
{$IFNDEF VER140}
  SUnsupportedVariant = '���������������� ���������� ��� %d';
{$ELSE}
  SUnsupportedVariant = '���������������� ���������� ���';
{$ENDIF}
  SNoVarDispatch = '��� varDispatch �� ��������������';
  SNoErrorDispatch = '��� varError �� ��������������';
  SUnknownInterface = '(Unknown)';

  SInvalidTimeZone = '�������� ��� ����������� ������� ����';
  SLocationFilter = 'WSDL ����� (*.wsdl)|*.wsdl|XML ����� (*.xml)|*.xml';

  sUnknownError = '����������� ������';
  sErrorColon   = '������: ';
{$IFNDEF VER140}
  sServiceInfo  = '%s - PortTypes:';
  sInterfaceInfo= '<a href="%s">%s</a>&nbsp;&gt;&nbsp;<span class="Off">%s</span>';
  sWSILInfo     = 'WSIL:';
  sWSILLink     = '&nbsp;&nbsp;<span class="Tip">������ �� WS-Inspection �������� of Services <a href="%s">here</a></span>';
{$ELSE}
  sServiceInfo  = '%s exposes ��������� ����������:';
  sInterfaceInfo= '<a class="NavBar" href="%s">%s</a>&nbsp;&gt;&nbsp;<span class="Off">%s</span>';
{$ENDIF}
  sRegTypes     = '������������������ ����';

  sWebServiceListing      = 'WebService Listing';
  sWebServiceListingAdmin = 'WebService Listing Administrator';
  sPortType               = '��� �����';
  sNameSpaceURI           = 'Namespace URI';
  sDocumentation          = '������������';
  sWSDL                   = 'WSDL';
  sPortName               = 'PortName';
{$IFNDEF VER140}
  sInterfaceNotFound      = HTMLHead + '</head><body>' + '<h1>���������� ������</h1><P>��������� %s �� ������</P>' +HTMLEnd;
  sForbiddenAccess        = HTMLHead + '</head><body>' + '<h1>��������� (403)</h1><P>������ ��������</P>' +HTMLEnd;
{$ELSE}
  sInterfaceNotFound      = HTMLTopPlain + '<h1>���������� ������</h1><P>��������� %s �� ������</P>' +HTMLEnd;
  sForbiddenAccess        = HTMLTopNS + '<h1>��������� (403)</h1><P>������ ��������</P>' +HTMLEnd;
{$ENDIF}
  sWSDLPortsforPortType   = 'WSDL ����� ��� PortType';
  sWSDLFor                = '';
  sServiceInfoPage        = 'Service Info Page';

{$IFNDEF VER140}
{SOAPAttach}
  SEmptyStream = '������ TAggregateStream: ��� ���������� �������';
  SMethodNotSupported = '����� �� ��������������';
  SInvalidMethod = '����� ���������� � TSoapDataList';
  SNoContentLength = '��������� Content-Length �� ������';
  SInvalidContentLength = '�������� ������ ��� Content-Length';
  SMimeReadError = '������ ������ �� Mime Request Stream';
 {$IFDEF MSWINDOWS}
  STempFileAccessError = '��� ������� � ���������� �����';
 {$ENDIF}
 {$IFDEF LINUX}
  STempFileAccessError = '��� ������� � ���������� �����: ��������� ��������� TMPDIR';
 {$ENDIF}

{SoapConn}
  SSOAPServerIIDFmt = '%s - %s';
  SNoURL = '�� ����������� �������� URL - ����������, ������� URL �������, � �������� �� ������ ������������';
  SSOAPInterfaceNotRegistered = '��������� (%s) �� ��������������� - ����������, �������� � ��� ������ ������, ������� ������������ ���� ���������';
  SSOAPInterfaceNotRemotable  = '��������� (%s) �� ����� ���� ��������� - ����������, ��������� ���������� ���������� - �������� ���������� � ������� �������!';

  SCantLoadLocation = '�� ���� ��������� WSDL ����/����������: %s.  ������ [%s]';
{$ENDIF}
implementation

end.
