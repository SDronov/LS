{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{   Copyright (c) 2001 Borland Software Corporation     }
{                                                       }
{  �����������: 2001-02 Polaris Software                }
{               http://polesoft.da.ru                   }
{*******************************************************}

unit SiteConst;

interface

resourcestring

  // Adapter errors
  sFieldRequiresAValue = '���� %s ������� ��������';
  sFieldDoesNotAllowMultipleValues = '%s �� ��������� ������������� ��������';
  sFieldDoesNotAllowMultipleFiles = '%s �� ��������� ������������� �����';
  sFieldRequiresAFile = '%s ������� ����';
  sFieldModificationNotPermitted = '��������� %s �� ���������';
  sActionExecutionNotPermitted = '���������� �������� %s �� ���������';
  sFieldViewNotPermitted = '�������� ���� �� ��������';
  sAdapterModificationNotPermitted = '��������� ������ �� ���������';
  sFileUploadNotSupported = '%s �� ������������ ������� ������';
  sNoLoginPage = '�������� ����� �� ����������';
  sPageNotFound = 'Web-�������� �� �������: %s';
  sPageContentNotProvided = 'Web-�������� �� ������������� �����������';
  sImageNotProvided = '���� %s �� ������������� �����������';

  // DataSetAdapter errors
  sUnknownAdapterMode = '����������� ����� ��������: %s';
  sNilAdapterDataSet = 'DataSet ����� nil';
  sAdapterRowNotFound = '������ �� ������� � %s';
  sFieldChangedByAnotherUser = '���� %s �������� ������ �������������';
  sAdapterFieldNotFound = '���� �� �������: %s';
  sDataSetPropertyIsNil = '%s: �������� DataSet ����� nil';
  sDataSetUnknownKeyFields = '%0:s: Dataset %1:s �����. �������� ����';
  sDataSetNotActive = '%0:s: Dataset %1:s �� �������';
  sValueFieldIsBlank = '%0:s: �������� �������� ValueField - ������';

  // XSLPageProducer errors
  SNoXMLData = '����������� ��������� ������ XML';
  SNoXMLDocument = '�� ���� ������� XMLDocument';

  // Add Adapter Fields Editor
  sAddAdapterData = '�������� ����...';
  sAddAllAdapterData = '�������� ��� ����';
  sAddAdapterDataDlgCaption = '���������� �����';
  sAddAdapterActions = '�������� ��������...';
  sAddAllAdapterActions = '�������� ��� ��������';
  sAddAdapterActionsDlgCaption = '���������� ��������';
  sAdapterActionsPrefix = 'Action'; // Do not location
  sAddCommands = '�������� �������...';
  sAddAllCommands = '�������� ��� �������';
  sAddCommandsDlgCaption = '���������� ������';
  sAddColumns = '�������� �������...';
  sAddAllColumns = '�������� ��� �������';
  sAddColumnsDlgCaption = '���������� �������';
  sAddFieldItems = '�������� ����...';
  sAddAllFieldItems = '�������� ��� ����';
  sAddFieldItemsDlgCaption = '���������� �����';


  // SitePageProducer errors
  sAdapterPropertyIsNil =  '%s: �������� Adapter ����� nil';
  sAdapterFieldNameIsBlank = '%s: ������ ��� ����';
  sCantFindAdapterField = '%0:s: ���� %1:s �� ������� � ��������� Adapter';    // 0 - Component name, 1 - Adapter Field name
  sAdapterActionNameIsBlank = '%s: ������ ��� ��������';
  sCantFindAdapterAction = '%0:s: �������� %1:s �� ������� � ��������� Adapter';   // 0 - Component name, 1 - Adapter Action name
  sDisplayComponentPropertyIsNil = '%s: �������� DisplayComponent ����� nil';


  sNoHandler = '��� ������������ �������� �������������� ���� ������. ' +
    '�������� WebAppComponents PageDispatcher, AdapterDispatcher ��� DispatchActions ������ ���� �����������.';


  // LoginAdapter validation
  sBlankPassword = '������ �� ������ ���� ������';
  sBlankUserName = '��� ������������ �� ������ ���� ������';

  // Dispatcher errors
  sAdapterRequestNotHandled = '������ �������� �� ���������: %0:s, %1:s';    // 0 - Request identifier, 1 - object identifier
  sDispatchBlankPageName = 'Dispatching blank page name';
  sPageAccessDenied = '������ � �������� ������';
  sPageDoesNotSupportRedirect = 'Web-�������� �� ������������ ���������������';

  // Include errors
  sCantFindIncludePage = '�� ���� ����� ���������� ��������: %s';
  sInclusionNotSupported = '�������� %s �� ������������ ��������';
  sRecursiveIncludeFile = '���������� ���� %s �������� ��� ����';

  // DB Image errors
{$IFNDEF VER140}
  sIncorrectImageFormat = '������������ ������ ����������� (%0:s) ��� ���� %1:s';
{$ELSE}
  sIncorrectImageFormat = '������������ ������ ����������� (%s) ��� ���� %s';
{$ENDIF}
  sFileExpected = '���������� ���� ��������� ��� ���� %s';

  // WebUserList names - must be valid identifiers
  sWebUserName = 'UserName';
  sWebUserPassword = 'Password';
  sWebUserAccessRights = 'AccessRights';

  // WebUserList errors
  sUserIDNotFound = 'UserID �� ������';
  sInvalidPassword = '�������� ������';
  sMissingPassword = '����������� ������';
  sUnknownUserName = '����������� ��� ������������';
  sMissingUserName = '����������� ��� ������������';


  // Script errors
  sCannotCreateScriptEngine = '�� ���� ������� script engine: %s.  ������: %x'; 
  sCannotInitializeScriptEngine = '�� ���� ���������������� script engine';
  sScriptEngineNotFound = 'Script engine �� ������: %s.';
  sObjectParameterExpected = 'Script Object ���������';
  sIntegerParameterExpected = '������������� �������� ���������';
  sUnexpectedParameterType = '����������� ��� ���������';
  sUnexpectedResultType = '����������� ������������ ���';
  sDuplicatePrototypeName = '������������ ��� ���������';
  sBooleanParameterExpected = '�������� ����������� ���� ���������';
  sDoubleParameterExpected = '�������� ���� Double ���������';
  sUnexpectedScriptError = '����������� ������ �������';


  // 0 - Error index number
  // 1 - Error description
  // 2 - Line number
  // 3 - character position number
  // 4 - source line text
  sScriptErrorTemplate =
{$IFNDEF VER140}
      '<table width="95%%" border="1" cellspacing="0" bordercolor="#C0C0C0">' + SLineBreak +
        '<tr>' + SLineBreak +
          '<td colspan=2>' + SLineBreak +
            '<font color="#727272"><b>������[' +  '%0:d' + ']:</b> ' + SLineBreak +
            '%1:s' + SLineBreak +
            '</font>' + SLineBreak +
          '</td>' + SLineBreak +
        '</tr>' + SLineBreak +
        '<tr>' + SLineBreak +
          '<td>' + SLineBreak +
            '<font color="#727272"><b>������:</b> ' + SLineBreak +
            '%2:d' + SLineBreak +
            '</font>' + SLineBreak +
          '</td>' + SLineBreak +
          '<td>' + SLineBreak +
            '<font color="#727272"><b>�������:</b> ' + SLineBreak +
            '%3:d' + SLineBreak +
            '</font>' + SLineBreak +
          '</td>' + SLineBreak +
        '</tr>' + SLineBreak +
        (* Don't display source text 
        '<tr>' + SLineBreak +
          '<td colspan=2>' + SLineBreak +
            '<font color="#727272"><b>Source Text:</b> ' + SLineBreak +
        '%4:s' + SLineBreak +
            '</font>' + SLineBreak +
          '</td>' + SLineBreak +
        '</tr>' + SLineBreak +
        *)
        '</table>' + SLineBreak;
{$ELSE}
      '<table width="95%%" border="1" cellspacing="0" bordercolor="#C0C0C0">'#13#10 +
        '<tr>'#13#10 +
          '<td colspan=2>'#13#10 +
            '<font color="#727272"><b>������[' +  '%0:d' + ']:</b> '#13#10 +
            '%1:s'#13#10 +
            '</font>'#13#10 +
          '</td>'#13#10 +
        '</tr>'#13#10 +
        '<tr>'#13#10 +
          '<td>'#13#10 +
            '<font color="#727272"><b>������:</b> '#13#10 +
            '%2:d'#13#10 +
            '</font>'#13#10 +
          '</td>'#13#10 +
          '<td>'#13#10 +
            '<font color="#727272"><b>�������:</b> '#13#10 +
            '%3:d'#13#10 +
            '</font>'#13#10 +
          '</td>'#13#10 +
        '</tr>'#13#10 +
        (* Don't display source text 
        '<tr>'#13#10 +
          '<td colspan=2>'#13#10 +
            '<font color="#727272"><b>Source Text:</b> '#13#10 +
        '%4:s'#13#10 +
            '</font>'#13#10 +
          '</td>'#13#10 +
        '</tr>'#13#10 +
        *)
        '</table>'#13#10;
{$ENDIF}

  sMaximumSessionsExceeded = '��������� ������������ ���������� ������';
  sVariableNotFound = '���������� �� �������: %s';
  sComponentDoesNotSupportScripting = '��������� �� ������������ scripting. �����: %0:s, ���: %1:s';
  sClassDoesNotSupportScripting = '������ �� ������������ scripting. �����: %0:s';
  sParameterExpected = '�������� ���������';
  sStringParameterExpected = '��������� �������� ���������';
  sInvalidImageSize = '�������� ����������� (������ ������ 4 ����).';


  // File include errors 
  sIncDblQuoteError = '������ ��������� ����� (include) � ������ %d: ��������� "';
  sIncEqualsError = '������ ��������� ����� (include) � ������ %d: ��������� =';
  sIncTypeError = '������ ��������� ����� (include) � ������ %d: ��������� virtual, ����, ��� ��������, �� ������� %s.';

{$IFNDEF VER140}
  sUnknownImageType = '�����������';

  // WebSnapObjs.pas scripting errors
  sComponentNotFound = '��������� %s �� ������';
  sCountFromComponentsNotSupported = '����� Count � ������� TComponentsEnumerator �� ��������������';
  sInterfaceCompRefExpected = '��������� ��������� ��� ���������� IInterfaceComponentReference ��� ��������� ValuesList';
  sErrorsObjectNeedsIntf = '������ ������ ������ ������������ ��������� IIterateIntfSupport';
{$ENDIF}

implementation

end.
