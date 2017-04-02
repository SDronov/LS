{  �����������: 2001-02 Polaris Software                                      }
{               http://polesoft.da.ru                                         }

unit IdResourceStrings;

interface

resourcestring
  // General
  RSAlreadyConnected = '��� ���������.';
  RSByteIndexOutOfBounds = '������ Byte ����� �� �������.';
  RSCannotAllocateSocket = '�� ���� ��������������� socket.';
  RSConnectionClosedGracefully = '���������� ��������� �������.';
  RSCouldNotBindSocket = '�� ���� ��������� socket. ����� � ���� ��� ������������.';
  RSFailedTimeZoneInfo = '������ ��� ������� �������� ���������� � ������� �����.';
  RSNoBindingsSpecified = '�������� �� ����������.';
  RSOnExecuteNotAssigned = 'OnExecute �� ���������.';
  RSNotAllBytesSent = '������� �� ��� �����.';
  RSNotEnoughDataInBuffer = '��� ������ � ������.';
  RSPackageSizeTooBig = '������ ������ ������� �������.';
  RSRawReceiveError0 = '������ ������ Raw = 0.';
  RSICMPReceiveError0 = '������ ������ ICMP = 0.';
  RSWinsockInitializationError = '������ ������������� Winsock.';
  RSCouldNotLoad = '%s �� ����� ���� ��������.';
  RSSetSizeExceeded = '������������� ������ ��������.';
  RSThreadClassNotSpecified = '�� ��������� ����� ������ (thread).';
  RSFileNotFound = '���� "%s" �� ������';
  RSCannotChangeDebugTargetAtWhileActive = '�� ���� �������� ��������, ����� �� �������.';
  RSOnlyOneAntiFreeze = '����� ���� ������ ������ ���� TIdAntiFreeze � ����������.';
  RSInterceptCircularLink = '%d: ����������� ������ �� ���������';
  RSInterceptPropIsNil = 'InterceptEnabled �� ����� ���� ���������� � true ����� Intercept ����� nil.';
  RSIOHandlerPropInvalid = '�������� IOHandler - ��������';
  RSNotConnected         = '�� ���������';
  RSInterceptPropInvalid = '�������� Intercept - ��������' {$IFDEF VER150}deprecated{$ENDIF}; 
  RSObjectTypeNotSupported = '��� ������� �� ��������������.';
  RSAcceptWaitCannotBeModifiedWhileServerIsActive
    = '�������� AcceptWait �� ����� ���� ��������, ����� ������ �������.';
  RSTerminateThreadTimeout = '��������� ����-��� ������';
  RSNoExecuteSpecified = '�� ������� execute ������������.';
  RSIdNoDataToRead = '��� ������ ��� ������.';
  RSCanNotBindRange = '�� ���� ������� � ��������� ������ (%d - %d)';
  RSInvalidPortRange = '�������� �������� ������ (%d - %d)';
  RSReadTimeout = '����-��� ������';
  RSReadLnMaxLineLengthExceeded = '��������� ����. ����� ������.';
  RSUDPReceiveError0 = '������ ������ UDP = 0.';
  RSNoCommandHandlerFound = '������������ ������� �� �������.';
  RSCannotPerformTaskWhileServerIsActive = '�� ���� ��������� ������, ���� ������ �������.';
  //  TIdEMailAddress 
  RSEMailSymbolOutsideAddress = '@ ������� �����';
  //ZLIB Intercept
  RSZLCompressorInitializeFailure = '�� ���� ���������������� ����������';
  RSZLDecompressorInitializeFailure = '�� ���� ���������������� ������������';
  RSZLCompressionError = '������ ������';
  RSZLDecompressionError = '������ ����������';
  //Winsock 2 Stub
  RSWS2CallError = '������ ������ ������ %s ���������� Winsock2';
  RSWS2LoadError = '������ �������� ���������� Winsock2 (%s)';
  //MIME Types
  RSMIMEExtensionEmpty = '���������� - ������';
  RSMIMEMIMETypeEmpty = 'Mimetype - ������';
  RSMIMEMIMEExtAlreadyExists = '���������� ��� ����������';
  // IdRegister
  RSRegIndyClients = 'Indy Clients';
  RSRegIndyServers = 'Indy Servers';
  RSRegIndyIntercepts = 'Indy Intercepts';
  RSRegIndyIOHandlers = 'Indy I/O Handlers';
  RSRegIndyMisc = 'Indy Misc';
  // Status Strings
  RSStatusResolving = '����� ����� %s.';
  RSStatusConnecting = '����������� � %s.';
  RSStatusConnected = '���������.';
  RSStatusDisconnecting = '������������ �� %s.';
  RSStatusDisconnected = '�����������.';
  RSStatusText = '%s';
  // TIdTCPClient
  RSConnectTimeout = '��������� ����� �������� ����������.';
  //IdCoder3To4
  RSCoderNoTableEntryNotFound = '������� ������� ��������� �� ������.' {$IFDEF VER150}deprecated{$ENDIF};
  // MessageClient Strings
  RSMsgClientEncodingText = '����������� ������';
  RSMsgClientEncodingAttachment = '����������� ��������';
  RSMsgClientUnkownMessagePartType = '����������� Message Part Type.';
  RSMsgClientInvalidEncoding = '�������� �����������. UU ��������� ������ � ����� � ����������';
  // NNTP Exceptions
  RSNNTPConnectionRefused = '� ���������� ���� �������� NNTP ��������.';
  RSNNTPStringListNotInitialized = 'Stringlist �� ������������������!';
  RSNNTPNoOnNewsgroupList = '�� ���������� ������� OnNewsgroupList.';
  RSNNTPNoOnNewGroupsList = '�� ���������� ������� OnNewGroupsList.';
  RSNNTPNoOnNewNewsList = '�� ���������� ������� OnNewNewsList.';
  // Log strings
  RSLogConnected = '���������.';
  RSLogDisconnected = '�����������.';
  RSLogEOL = '<EOL>'; //End of Line
  RSLogCR  = '<CR>'; //Carriage Return
  RSLogLF  = '<LF>'; //Line feed
  RSLogRecv = '���� '; //Receive
  RSLogSent = '���� '; //Send
  RSLogStat = '���� '; //Status
  // HTTP Status
  RSHTTPChunkStarted = '����� ���������';
  RSHTTPContinue = '�����������';
  RSHTTPSwitchingProtocols = '������������ ����������';
  RSHTTPOK = 'OK';
  RSHTTPCreated = '������';
  RSHTTPAccepted = '������';
  RSHTTPNonAuthoritativeInformation = '���������� ����������';
  RSHTTPNoContent = '��� �����������';
  RSHTTPResetContent = '����� �����������';
  RSHTTPPartialContent = '��������� ����������';
  RSHTTPMovedPermanently = '��������� ���������';
  RSHTTPMovedTemporarily = '��������� ��������';
  RSHTTPSeeOther = '������ ������';
  RSHTTPNotModified = '�� �������';
  RSHTTPUseProxy = '���. ������';
  RSHTTPBadRequest = '�������� ������';
  RSHTTPUnauthorized = '�� ������������';
  RSHTTPForbidden = '���������';
  RSHTTPNotFound = '�� �������';
  RSHTTPMethodeNotallowed = '����� �� ��������';
  RSHTTPNotAcceptable = '������������';
  RSHTTPProxyAuthenticationRequired = '����������� �� ������ ���������';
  RSHTTPRequestTimeout = 'Request Timeout';
  RSHTTPConflict = '��������';
  RSHTTPGone = '������';
  RSHTTPLengthRequired = 'Length ���������';
  RSHTTPPreconditionFailed = '������ Precondition';
  RSHTTPRequestEntityToLong = 'Request Entity To Long';
  RSHTTPRequestURITooLong = 'Request-URI ������� �������. �������� 256 ��������';
  RSHTTPUnsupportedMediaType = '���������������� ��� �����������';
  RSHTTPInternalServerError = '���������� ������ �������';
  RSHTTPNotImplemented = '�������������';
  RSHTTPBadGateway = '�������� ����';
  RSHTTPServiceUnavailable = '������ (������) �� ��������';
  RSHTTPGatewayTimeout = '������� �����';
  RSHTTPHTTPVersionNotSupported = '������ HTTP �� ��������������';
  RSHTTPUnknownResponseCode = '����������� ��� ������';
  // HTTP Other
  RSHTTPHeaderAlreadyWritten = '��������� ��� �������.';
  RSHTTPErrorParsingCommand = '������ ��� ������� �������.';
  RSHTTPUnsupportedAuthorisationScheme = '���������������� ����� �����������.';
  RSHTTPCannotSwitchSessionStateWhenActive = '�� ���� �������� ��������� ������, ����� ������ �������.';
  //HTTP Authentication
  RSHTTPAuthAlreadyRegistered = '���� ����� ����������� ��� ��������������� � ������� %s.';
  //HTTP Authentication Digeest
  RSHTTPAuthInvalidHash = '���������������� hash ��������. ��� ���������� ������������ ������ ����������� MD5.';
  //SSPI Authentication
  {
  Note: CompleteToken is an API function Name:
  }
  RSHTTPSSPISuccess = '�������� ����� API';
  RSHTTPSSPINotEnoughMem = '��� ��������� ������ ��� ���������� ����� �������';
  RSHTTPSSPIInvalidHandle = '��������� ���������� - ��������';
  RSHTTPSSPIFuncNotSupported = '��������� ������� �� ��������������';
  RSHTTPSSPIUnknownTarget = '��������� �������� (target) ���������� ��� ����������';
  RSHTTPSSPIInternalError = 'The Local Security Authority cannot be contacted';
  RSHTTPSSPISecPackageNotFound = '��������� ����� ������ �� ����������';
  RSHTTPSSPINotOwner = 'The caller is not the owner of the desired credentials';
  RSHTTPSSPIPackageCannotBeInstalled = '����� ������ ������ ���� ��� �������������, � �� ����� ���� ����������';
  RSHTTPSSPIInvalidToken = 'The token supplied to the function is invalid';
  RSHTTPSSPICannotPack = '����� ������ �� �������� ���������� ������ �����, ����� �������, ������� ����� ���� ���������';
  RSHTTPSSPIQOPNotSupported = 'The per-message Quality of Protection �� �������������� ������� ������';
  RSHTTPSSPINoImpersonation = 'The security context does not allow impersonation of the client';
  RSHTTPSSPILoginDenied = '��������� ������� �����';
  RSHTTPSSPIUnknownCredentials = '����������, ������ ������, �� ��������';
  RSHTTPSSPINoCredentials = 'No credentials are available in the security package';
  RSHTTPSSPIMessageAltered = 'The message or signature supplied for verification has been altered';
  RSHTTPSSPIOutOfSequence = 'The message supplied for verification is out of sequence';
  RSHTTPSSPINoAuthAuthority = 'No authority could be contacted for authentication.';
  RSHTTPSSPIContinueNeeded = '������� ����������� �������, �� ������ ���� ������� ����� ��� ���������� ���������';
  RSHTTPSSPICompleteNeeded = '������� ����������� �������, �� ������ ���� ������ CompleteToken';
  RSHTTPSSPICompleteContinueNeeded =  '������� ����������� �������, �� CompleteToken � ��� ������� ������ ���� ������� ��� ���������� ���������';
  RSHTTPSSPILocalLogin = '���� ��������, �� ��� ��������� ������� ����������. ���� ��� ������ � �������������� �������� ��������� ����������';
  RSHTTPSSPIBadPackageID = '��������� ����� ������ �� ����������';
  RSHTTPSSPIContextExpired = '�������� ������� ���� � �� ����� ����� ��������������.';
  RSHTTPSSPIIncompleteMessage = '������ ��������� - �������������.  ��������� �� ���� ���������.';
  RSHTTPSSPIIncompleteCredentialNotInit =  '������ ���������� - ��������, � �� ���� ���������. �������� �� ��� ���������������.';
  RSHTTPSSPIBufferTooSmall = '�������, ��������������� �������, ���� ������� ����.';
  RSHTTPSSPIIncompleteCredentialsInit = '������ ���������� - ��������, � �� ���� ���������. �������������� ���������� ����� ���� �������� �� ���������.';
  RSHTTPSSPIRengotiate = 'The context data must be renegotiated with the peer.';
  RSHTTPSSPIWrongPrincipal = 'The target principal name is incorrect.';
  RSHTTPSSPINoLSACode = 'There is no LSA mode context associated with this context.';
  RSHTTPSSPITimeScew = '����� �� ����� ���������� � ��������� ����� ����������.';
  RSHTTPSSPIUntrustedRoot = 'The certificate chain was issued by an untrusted authority.';
  RSHTTPSSPIIllegalMessage = '���������� ��������� ���� ����������� ��� ������� �����������������.';
  RSHTTPSSPICertUnknown = '����������� ������ �������� �� ����� ��������� �����������.';
  RSHTTPSSPICertExpired = '���������� ���������� ������� ����.';
  RSHTTPSSPIEncryptionFailure = '��������� ������ �� ������ ���� �����������.';
  RSHTTPSSPIDecryptionFailure = '��������� ������ �� ������ ���� ������������.';
  RSHTTPSSPIAlgorithmMismatch = '������ � ������ �� ����� ��������, ������ ��� ��� �� �������� ����� ����������.';
  RSHTTPSSPISecurityQOSFailure = '�������� ������ �� ����� ���� ������e ��-�� ���� � ��������� �������� ������� (��������, �������� ����������� ��� �������������).';
  RSHTTPSSPIUnknwonError = '����������� ������';
  {
  Note to translators - the parameters for the next message are below:

  Failed Function Name
  Error Number
  Error Number
  Error Message by Number
  }

  RSHTTPSSPIErrorMsg = 'SSPI %s ������� ������ #%d(0x%x): %s';

  RSHTTPSSPIInterfaceInitFailed = '��������� SSPI �� ���� ������������������ ���������';
  RSHTTPSSPINoPkgInfoSpecified = 'PSecPkgInfo �� ������';
  RSHTTPSSPINoCredentialHandle = 'No credential handle acquired';
  RSHTTPSSPICanNotChangeCredentials = '�� ���� �������� ���������� ����� handle aquired. ����������� ������� Release';
  RSHTTPSSPIUnknwonCredentialUse = 'Unknown credentials use';
  RSHTTPSSPIDoAuquireCredentialHandle = '�������� ������� AcquireCredentialsHandle';
  RSHTTPSSPICompleteTokenNotSupported = 'CompleteAuthToken �� ��������������';

  //Block Cipher Intercept
  RSBlockIncorrectLength = '������������ ������ � �������� �����';

  // FTP
  RSFTPUnknownHost = '����������';
  RSInvalidFTPListingFormat = '����������� ������ �������� FTP';
  RSFTPStatusReady = '���������� �����������';
  RSFTPStatusStartTransfer = '������ �������� �� FTP';
  RSFTPStatusDoneTransfer  = '�������� ���������';
  RSFTPStatusAbortTransfer = '�������� ��������';

  // Property editor exceptions
  RSCorruptServicesFile = '%s ���������.';
  RSInvalidServiceName = '%s - �������� ������.';
  // Stack Error Messages
  RSStackError = '������ socket # %d' + #13#10 + '%s';
  RSStackEINTR = '���������� ��������� �����.';
  RSStackEBADF = '�������� ����� �����.';
  RSStackEACCES = '� ������� ��������.';
  RSStackEFAULT = '�������� �����.';
  RSStackEINVAL = '�������� ��������.';
  RSStackEMFILE = '������� ����� �������� ������.';
  RSStackEWOULDBLOCK = 'Operation would block. ';
  RSStackEINPROGRESS = '�������� ������ �����������.';
  RSStackEALREADY = '�������� ��� �����������.';
  RSStackENOTSOCK = 'Socket �������� �� non-socket.';
  RSStackEDESTADDRREQ = '��������� ����� ���������.';
  RSStackEMSGSIZE = '��������� ������� �������.';
  RSStackEPROTOTYPE = '�������� ��� ��������� ��� socket.';
  RSStackENOPROTOOPT = '�������� ����� ���������.';
  RSStackEPROTONOSUPPORT = '�������� �� ��������������.';
  RSStackESOCKTNOSUPPORT = '��� socket''� �� ��������������.';
  RSStackEOPNOTSUPP = '�������� �� �������������� �� socket.';
  RSStackEPFNOSUPPORT = '��������� ���������� �� ��������������.';
  RSStackEAFNOSUPPORT = '��������� ������� �� �������������� ���������� ����������.';
  RSStackEADDRINUSE = '����� ��� ������������.';
  RSStackEADDRNOTAVAIL = '�� ���� ��������� ��������� �����.';
  RSStackENETDOWN = '���� �� ��������.';
  RSStackENETUNREACH = '���� ����������.';
  RSStackENETRESET = '���� �������� ����������.';
  RSStackECONNABORTED = '����������� ����������� ������� ��������� ����������� ������ ����������.';
  RSStackECONNRESET = '����� ���������� by peer.';
  RSStackENOBUFS = '��� ���������� ����� ��� ������.';
  RSStackEISCONN = 'Socket ��� ��������.';
  RSStackENOTCONN = 'Socket �� ��������.';
  RSStackESHUTDOWN = '�� ���� �������� � ��������� ����� �������� socket.';
  RSStackETOOMANYREFS = '������� ����� ���������, �� ���� ���������.';
  RSStackETIMEDOUT = '���������� ��������� �����.';
  RSStackECONNREFUSED = '���������� ��������.';
  RSStackELOOP = '������� ����� ������� ������������� ������.';
  RSStackENAMETOOLONG = '��� ����� ������� �������.';
  RSStackEHOSTDOWN = '���� �� ��������.';
  RSStackEHOSTUNREACH = '��� �������� � �����.';
  RSStackENOTEMPTY = '������� �� ����';
  RSStackEPROCLIM = '������� ����� ���������.';
  RSStackEUSERS = '������� ����� �������������.';
  RSStackEDQUOT = '�������� ����� ����� �� �����.';
  RSStackESTALE = '���������� ���������� (handle) NFS �����.';
  RSStackEREMOTE = '������� ����� ������� ��������� (remote) � ����.';
  RSStackSYSNOTREADY = '������� ���������� ����������.';
  RSStackVERNOTSUPPORTED = '������ WINSOCK DLL ����� �� �������.';
  RSStackNOTINITIALISED = 'Winsock ��� �� ��������.';
  RSStackHOST_NOT_FOUND = '���� �� ������.';
  RSStackTRY_AGAIN = '���������� ����� (����������� ����� ��� ��������� ��������� DNS).';
  RSStackNO_RECOVERY = '�������������� ������: FORMERR, REFUSED, NOTIMP.';
  RSStackNO_DATA = '������ ���, ��� ������ ������ (��������� ��������� DNS).';

  RSCMDNotRecognized = '������� �� ����������';

  RSGopherNotGopherPlus = '%s - �� ������ Gopher+';

  RSCodeNoError     = 'RCode ��� ������';
  RSCodeQueryFormat = 'DNS Server Reports Query Format Error';
  RSCodeQueryServer = 'DNS Server Reports Query Server Error';
  RSCodeQueryName   = 'DNS Server Reports Query Name Error';
  RSCodeQueryNotImplemented = 'DNS Server Reports Query Not Implemented Error';
  RSCodeQueryQueryRefused = 'DNS Server Reports Query Refused Error';
  RSCodeQueryUnknownError = '������ ��������� ����������� ������';

  RSDNSTimeout = 'TimedOut';
  RSDNSMFIsObsolete = 'MF - ���������� �������. ����������� MX.';
  RSDNSMDISObsolete = 'MD - ���������� �������. ����������� MX.';
  RSDNSMailAObsolete = 'MailA - ���������� �������. ����������� MX.';
  RSDNSMailBNotImplemented = '-Err 501 MailB �� ���������';

  RSQueryInvalidQueryCount = '�������� ����� �������� %d';
  RSQueryInvalidPacketSize = '�������� ������ ������ %d';
  RSQueryLessThanFour = '�������� ����� ������� ���. ����� 4 ���� %d';
  RSQueryInvalidHeaderID = '�������� Id ��������� %d';
  RSQueryLessThanTwelve = '�������� ����� ������� ���. ����� 12 ���� %d';
  RSQueryPackReceivedTooSmall = '�������� ����� ������� ���. %d';

  { LPD Client Logging event strings }
  RSLPDDataFileSaved = '���� ������ �������� � %s';
  RSLPDControlFileSaved = '����������� ���� �������� � %s';
  RSLPDDirectoryDoesNotExist = '������� %s �� ������';
  RSLPDServerStartTitle = 'Winshoes LPD Server %s ';
  RSLPDServerActive = '������ ������: �������';
  RSLPDQueueStatus = '������ ������� %s: %s';
  RSLPDClosingConnection = '�������� ����������';
  RSLPDUnknownQueue = '����������� ������� %s';
  RSLPDConnectTo = '�������� � %s';
  RSLPDAbortJob = '����� ������';
  RSLPDReceiveControlFile = '����� ������������ �����';
  RSLPDReceiveDataFile = '����� ����� ������';

  { LPD Exception Messages }
  RSLPDNoQueuesDefined = '������: ������� �� ����������';

  { Trivial FTP Exception Messages }
  RSTimeOut = '�������';
  RSTFTPUnexpectedOp = '����������� �������� �� %s:%d';
  RSTFTPUnsupportedTrxMode = '���������������� ����� ��������: "%s"';
  RSTFTPDiskFull = '�� ���� ��������� ������ �������, ������� ������� �� %d ������';
  RSTFTPFileNotFound = '�� ���� ������� %s';
  RSTFTPAccessDenied = '������ � %s ��������';

  { MESSAGE Exception messages }
  RSTIdTextInvalidCount = '�������� ���������� Text. TIdText ������ ���� ������ 1';
  RSTIdMessagePartCreate = 'TIdMessagePart �� ����� ���� ������.  ����������� ������-�������. ';
  RSTIdMessageErrorSavingAttachment = '������ ���������� ��������.';

  { POP Exception Messages }
  RSPOP3FieldNotSpecified = ' �� ���������';
  RSPOP3UnrecognizedPOP3ResponseHeader = 'Unrecognized POP3 Response Header:'#10'"%s"'; //APR: user will see Server response    {Do not Localize}
  RSPOP3ServerDoNotSupportAPOP = 'Server do not support APOP (no timestamp)';//APR    {Do not Localize}

  { IdIMAP4 Exception Messages }
  RSIMAP4ConnectionStateError = '�� ���� ��������� �������, �������� ��������� ����������;' +
                                 '������� ��������� ����������: %s.';
  RSUnrecognizedIMAP4ResponseHeader = '������������ ��������� ������ IMAP4.';

  { IdIMAP4 Connection State strings }
  RSIMAP4ConnectionStateAny = '�����';
  RSIMAP4ConnectionStateNonAuthenticated = '������������';
  RSIMAP4ConnectionStateAuthenticated = '����������';
  RSIMAP4ConnectionStateSelected = '���������';

  { Telnet Server }
  RSTELNETSRVUsernamePrompt = '���: ';
  RSTELNETSRVPasswordPrompt = '������: ';
  RSTELNETSRVInvalidLogin = '�������� ���� � �������.';
  RSTELNETSRVMaxloginAttempt = '��������� ����� ����������� ������� �����, �� ��������.';
  RSTELNETSRVNoAuthHandler = '�� ��������� ���������� �������������.';
  RSTELNETSRVWelcomeString = 'Indy Telnet Server';
  RSTELNETSRVOnDataAvailableIsNil = '������� OnDataAvailable ����� nil.';

  { Telnet Client }
  RSTELNETCLIConnectError = '������ �� ��������';
  RSTELNETCLIReadError = '������ �� �������.';

  { Network Calculator }
  RSNETCALInvalidIPString     = '������ %s �� ����������� � ���������� IP.';
  RSNETCALCInvalidNetworkMask = '�������� ����� ����.';
  RSNETCALCInvalidValueLength = '�������� ����� ��������: ������ ���� 32.';
  RSNETCALConfirmLongIPList = '������� ����� IP ������� � ��������� ��������� (%d) ����������� � design time.';
  { IdentClient}
  RSIdentReplyTimeout = '������� ����� �������� ������:  ������ �� ��������� ����� � ������ ��� ���������';
  RSIdentInvalidPort = '�������� ����:  ������� ��� ��������� ���� ����������� ��������� ��� ��������';
  RSIdentNoUser = '��� ������������:  ���� ������ �� ������������ ��� �� ������������ ���������� �������������';
  RSIdentHiddenUser = '��������� ������������:  ���������� �� ���� ���������� �� ������� ������������';
  RSIdentUnknownError = '����������� ��� ������ ������: �� ���� ���������� ���������, ���� ������, ��� �������������� ������.';
  { About Box stuff }
  RSAAboutFormCaption = '� Indy';
  RSAAboutBoxCompName = 'Internet Direct (Indy)';
  RSAAboutMenuItemName = '� Internet &Direct (Indy) %s...';
  RSAAboutBoxVersion = '������ %s';
  RSAAboutBoxCopyright = 'Copyright (c) 1993 - 2002'#13#10
   + 'Kudzu (Chad Z. Hower)'#13#10
   + '�'#13#10
   + 'Indy Pit Crew';
  RSAAboutBoxPleaseVisit = '��� ��������� ���������� � ���������� ��������, ����������:';
  RSAAboutBoxIndyWebsite = 'http://www.nevrona.com/indy/';    {Do not Localize}
  RSAAboutCreditsCoordinator = '����������� �������';
  RSAAboutCreditsCoCordinator = '������������� �������';
  RSAAboutCreditsDocumentation = '����������� ������������';
  RSAAboutCreditsDemos = '����������� ����';
  RSAAboutCreditsDistribution = '����������� �����������';
  RSAAboutCreditsRetiredPast = '�������/������� ���������';
  RSAAboutOk = 'OK';
  {Binding Editor stuff}
  {
  Note to translators - Please Read!!!

  For all the constants except RSBindingFormCaption, there may be an
  & symbol before a letter or number.  This is rendered as that chractor being
  underlined.  In addition, the charactor after the & symbol along with the ALT
  key enables a user to move to that control.  Since these are on one form, be
  careful to ensure that the same letter or number does not have a & before it
  in more than one string, otherwise an ALT key sequence will be broken.

  }
  RSBindingFormCaption = '�������� ������';
  RSBindingAddCaption = '&��������';
  RSBindingRemoveCaption = '&�������';
  RSBindingLabelBindings = '&�����';
  RSBindingHostnameLabel = '&IP �����';
  RSBindingPortLabel = '&����';
  RSBindingOkButton = 'OK';
  RSBindingCancel   = '������';
  {}
  RSBindingAll = '���'; //all IP addresses
  RSBindingAny = '�����'; //any port
 { Tunnel messages }
  RSTunnelGetByteRange = '����� � %s.GetByte [property ����] � �������� <> [0..%d]';
  RSTunnelTransformErrorBS = '������ � �������������� ����� ��������';
  RSTunnelTransformError = '������ ��������������';
  RSTunnelCRCFailed = '������ CRC';
  RSTunnelConnectMsg = '�����������';
  RSTunnelDisconnectMsg = '����������';
  RSTunnelConnectToMasterFailed = '�� ���� ������������ � Master �������';
  RSTunnelDontAllowConnections = '������ �� ��������� ����������';
  RSTunnelMessageTypeError = '������ ����������� ���� ���������';
  RSTunnelMessageHandlingError = '������ ��������� ���������';
  RSTunnelMessageInterpretError = '������ ������������� ���������';
  RSTunnelMessageCustomInterpretError = '������ ������������� ������������� ���������';

  { Socks messages }
  RSSocksRequestFailed = '������ ��������� ��� �� ��������.';
  RSSocksRequestServerFailed =
    '������ ���������, ������ ��� SOCKS ������ �� ����� �����������.';
  RSSocksRequestIdentFailed =
    '������ ���������, ������ ��� ���������-������ � identd report different user-ids.';
  RSSocksUnknownError = '����������� ������ socks.';
  RSSocksServerRespondError = 'Socks ������ �� ��������.';
  RSSocksAuthMethodError = '�������� ����� socks ��������������.';
  RSSocksAuthError = '������ �������������� �� socks �������.';
  RSSocksServerGeneralError = '����� ������ SOCKS �������.';
  RSSocksServerPermissionError = '���������� �� ��������� ������� ������ (ruleset).';
  RSSocksServerNetUnreachableError = '���� ����������.';
  RSSocksServerHostUnreachableError = '���� ����������.';
  RSSocksServerConnectionRefusedError = '���������� ��������.';
  RSSocksServerTTLExpiredError = 'TTL �������.';
  RSSocksServerCommandError = '������� �� ��������������.';
  RSSocksServerAddressError = '��� ������ �� ��������������.';

  { FTP }
  RSDestinationFileAlreadyExists = '����-�������� ��� ������.';

  { SSL messages }
  RSSSLAcceptError = '������ ������� ���������� � SSL.';
  RSSSLConnectError = '������ ���������� � SSL.';
  RSSSLSettingCipherError = '������ SetCipher.';
  RSSSLSettingChiperError = '������ SetCipher.' {$IFDEF VER150}deprecated{$ENDIF};
  RSSSLCreatingContextError = '������ �������� SSL ���������.';
  RSSSLLoadingRootCertError = '�� ���� ��������� root ����������.';
  RSSSLLoadingCertError = '�� ���� ��������� ����������.';
  RSSSLLoadingKeyError = '�� ���� ��������� ����, ��������� ������.';
  RSSSLGetMethodError = '������ ��������� SSL ������.';
  RSSSLDataBindingError = '������ �������� ������ � SSL socket.';
  {IdMessage Component Editor}
  RSMsgCmpEdtrNew = '&New Message Part...';
  RSMsgCmpEdtrExtraHead = 'Extra Headers Text Editor';
  RSMsgCmpEdtrBodyText = 'Body Text Editor';
  {IdICMPClient}
  RSICMPNotEnoughtBytes = '�������� �� ��� �����';
  RSICMPNonEchoResponse = 'Non-echo type response received';
  RSICMPWrongDestination = 'Received someone else''s packet';
  {IdNNTPServer}
  RSNNTPServerNotRecognized = '������� �� ����������';
  RSNNTPServerGoodBye = '�� ��������';
  {IdGopherServer}
  RSGopherServerNoProgramCode = '������: ��� ���� ���������, ����� ���������� ������!';

  {IdSyslog}
  RSInvalidSyslogPRI = '�������� ��������� syslog: �������� ������ PRI';
  RSInvalidSyslogPRINumber = '�������� ��������� syslog: �������� ����� PRI "%s"';
  RSInvalidSyslogTimeStamp = '�������� ��������� syslog: �������� timestamp "%s"';
  RSInvalidSyslogPacketSize = '�������� ��������� syslog: ����� ������� ������� (%d �����(��))';
  RSInvalidHostName = '�������� ��� �����. ��� ����� SYSLOG �� ����� ��������� �������� ("%s")+';

  {IdOpenSSL}
  RSOSSLModeNotSet = '����� �� ����������.';
  RSOSSLCouldNotLoadSSLLibrary = '�� ���� ��������� ���������� SSL.';
  RSOSSLStatusString = '������ SSL: "%s"';
  RSOSSLConnectionDropped = 'SSL ���������� ��������.';
  RSOSSLCertificateLookup = '������ ������� ����������� SSL.';
  RSOSSLInternal = '���������� ������ ���������� SSL.';

  {IdWinsockStack}
  RSWSockStack = 'Winsock stack';
  {IdSMTPServer}
  RSSMTPSvrCmdNotRecognized = '������� �� ����������';
  RSSMTPSvrQuit = '�����';
  RSSMTPSvrOk   = 'OK';
  RSSMTPSvrStartData = '������ ����� ������; ����� � <CRLF>.<CRLF>';
  RSSMTPSvrAddressOk = '%s ����� OK';
  RSSMTPSvrAddressError = '%s ������ ������';
  RSSMTPSvrAddressWillForward = '������������ �� ���������, ����� �������� �����';
  RSSMTPSvrWelcome = '����� ���������� � INDY SMTP ������';
  RSSMTPSvrHello = '������������, %s';
  RSSMTPSvrNoHello = '�������� ���� ������� HELO';
  RSSMTPSvrCmdGeneralError = '�������������� ������ - ������� �� ������: %s';
  RSSMTPSvrXServer = 'Indy SMTP ������';
  RSSMTPSvrReceivedHeader = 'by DNSName [127.0.0.1] running Indy SMTP';
  RSSMTPSvrAuthFailed = '� ����������� ��������';
  {IdPOP3Server}
  RSPOP3SvrNotHandled = '������� �� ����������: %s';
  // TIdCoder3to4
  RSUnevenSizeInDecodeStream = '�������� ������ � DecodeToStream.';
  RSUnevenSizeInEncodeStream = '�������� ������ � Encode.';
  // TIdMessageCoder
  RSMessageDecoderNotFound = '������� ��������� �� ������';
  RSMessageEncoderNotFound = '���������� ��������� �� ������';
  // TIdMessageCoderMIME
  RSMessageCoderMIMEUnrecognizedContentTrasnferEncoding = '������������ ����������� ���������� ��������.';
  // TIdMessageCoderUUE
  RSUnrecognizedUUEEncodingScheme = '������������ ����� UUE �����������.';
  // TIdICMPCast
  RSIPMCastInvalidMulticastAddress = '������ IP ����� - �������� ��������� ����� [224.0.0.0 - 239.255.255.255].';
  RSIPMCastNotSupportedOnWin32 = '��� ������� �� �������������� �� Win32.';
  { IdFTPServer }
  RSFTPDefaultGreeting = 'Indy FTP ������ �����.';
  RSFTPOpenDataConn = '���������� ��� ������ ��� �������; �������� ����������.';
  RSFTPDataConnToOpen = '������ ����� OK; about to open data connection.';
  RSFTPCmdSuccessful = '%s ������� ������� ���������.';
  RSFTPServiceOpen = '������ ����� ��� ������ ������������.';
  RSFTPServerClosed = '������ ��������� ����������� ����������.';
  RSFTPDataConn = '������� ���������� ��� ������; ��� ��������.';
  RSFTPDataConnClosed = '�������� ���������� ��� ������.';
  RSFTPDataConnClosedAbnormally = '���������� ��� ������ ������� ��������.';
  RSFTPPassiveMode = '���� � ��������� ����� (%s).';
  RSFTPUserLogged = '������������ �����, ����������.';
  RSFTPAnonymousUserLogged = '��������� ������������ �����, ����������.';
  RSFTPFileActionCompleted = '��������� �������� � ������ OK, ���������.';
  RSFTPDirFileCreated = '"%s" ������.';
  RSFTPUserOkay = '��� ������������ OK, ��������� ������.';
  RSFTPAnonymousUserOkay = '��������� ���� OK, ���������� e-mail ��� ������.';
  RSFTPNeedLoginWithUser = '������� � USER �������.';
  RSFTPNeedAccountForLogin = '��������� ������� ������ ��� �����.';
  RSFTPFileActionPending = '��������� �������� � ������ � �������� �������������� ����������.';
  RSFTPServiceNotAvailable = '������ �� ��������, �������� ������������ ����������.';
  RSFTPCantOpenDataConn = '�� ���� ������� ���������� ��� ������.';
  RSFTPFileActionNotTaken = '��������� �������� � ������ �� taken.';
  RSFTPFileActionAborted = '��������� �������� ��������: ��������� ������ � ��������.';
  RSFTPRequestedActionNotTaken = '��������� �������� �� taken.';
  RSFTPCmdSyntaxError = '�������������� ������, ������� �� ����������.';
  RSFTPCmdNotImplemented = '"%s" ������� �� �����������.';
  RSFTPUserNotLoggedIn = '�� �����.';
  RSFTPNeedAccForFiles = '��������� ������� ������ ��� ���������� ������.';
  RSFTPActionNotTaken = '��������� �������� �� taken.';
  RSFTPActionAborted = '��������� �������� ��������: ��� �������� ����������.';
  RSFTPRequestedFileActionAborted = '��������� �������� � ������ ��������.';
  RSFTPRequestedFileActionNotTaken = '��������� �������� �� taken.';
  RSFTPMaxConnections = '�������� ����� ���������� ����������. ���������� ����� �����.';
  //Note to translators, it may be best to leave the stuff in quotes as the very first
  //part of any phrase otherwise, a FTP client might get confused.
  RSFTPCurrentDirectoryIs = '"%s" -  - ������� �����.';
  RSFTPTYPEChanged = '��� ���������� � %s.';
  RSFTPMODEChanged = '����� ���������� � %s.';
  RSFTPSTRUChanged = 'Structure set to %s.';
  RSFTPSITECmdsSupported = '��������� SITE ������� �� ��������������:' +
                            #13 + ' HELP  DIRSTYLE';
  RSFTPDirectorySTRU = '%s ��������� ���������.';
  RSFTPCmdEndOfStat = '����� �������';
  RSFTPCmdExtsSupported = '�������������� ����������:'#13#10'SIZE'#13#10'PASV'#13#10'REST'#13#10'����� ����������.';

  RSFTPNoOnDirEvent = '�� ������� ������� OnListDirectory!';

  {SYSLog Message}
  // facility
  STR_SYSLOG_FACILITY_KERNEL     = '��������� ����';
  STR_SYSLOG_FACILITY_USER       = '��������� ������ ������������';
  STR_SYSLOG_FACILITY_MAIL       = '�������� �������';
  STR_SYSLOG_FACILITY_SYS_DAEMON = '��������� ������';
  STR_SYSLOG_FACILITY_SECURITY1  = '��������� ������/����������� (1)';
  STR_SYSLOG_FACILITY_INTERNAL   = '���������, ��������� ������ syslogd';
  STR_SYSLOG_FACILITY_LPR        = '���������� ���������� ��������';
  STR_SYSLOG_FACILITY_NNTP       = '���������� ������� ��������';
  STR_SYSLOG_FACILITY_UUCP       = '���������� UUCP';
  STR_SYSLOG_FACILITY_CLOCK1     = '����� ����� (1)';
  STR_SYSLOG_FACILITY_SECURITY2  = '��������� ������/����������� (2)';
  STR_SYSLOG_FACILITY_FTP        = '����� FTP';
  STR_SYSLOG_FACILITY_NTP        = '���������� NTP';
  STR_SYSLOG_FACILITY_AUDIT      = '��� �����';
  STR_SYSLOG_FACILITY_ALERT      = 'log alert';
  STR_SYSLOG_FACILITY_CLOCK2     = '����� ����� (2)';
  STR_SYSLOG_FACILITY_LOCAL0     = 'local use 0  (local0)';
  STR_SYSLOG_FACILITY_LOCAL1     = 'local use 1  (local1)';
  STR_SYSLOG_FACILITY_LOCAL2     = 'local use 2  (local2)';
  STR_SYSLOG_FACILITY_LOCAL3     = 'local use 3  (local3)';
  STR_SYSLOG_FACILITY_LOCAL4     = 'local use 4  (local4)';
  STR_SYSLOG_FACILITY_LOCAL5     = 'local use 5  (local5)';
  STR_SYSLOG_FACILITY_LOCAL6     = 'local use 6  (local6)';
  STR_SYSLOG_FACILITY_LOCAL7     = 'local use 7  (local7)';
  STR_SYSLOG_FACILITY_UNKNOWN    = '����������� ��� ������������ ��� ����������';

  // Severity
  STR_SYSLOG_SEVERITY_EMERGENCY     = '������: ������� ���������� ��� �������������';
  STR_SYSLOG_SEVERITY_ALERT         = '�������: �������� ������ ���� taken ����������';
  STR_SYSLOG_SEVERITY_CRITICAL      = '���������: ��������� ���������';
  STR_SYSLOG_SEVERITY_ERROR         = '������: ��������� ������';
  STR_SYSLOG_SEVERITY_WARNING       = '��������������: ��������� ��������������';
  STR_SYSLOG_SEVERITY_NOTICE        = '���������: ����������, �� ������ ���������';
  STR_SYSLOG_SEVERITY_INFORMATIONAL = '�������������: �������������� ���������';
  STR_SYSLOG_SEVERITY_DEBUG         = '�������: ��������� ������ �������';
  STR_SYSLOG_SEVERITY_UNKNOWN       = '����������� ��� ������������ ��� ������';

  {LPR Messages}
  RSLPRError = '�������� %s �� Job ID %s';
  RSLPRUnknown = '����������';

  {IRC Messages}
  RSIRCCanNotConnect = '���������� � IRC �� �����������';
  RSIRCNotConnected = '�� ���������� � �������.';
  RSIRCClientVersion =  'TIdIRC 1.061 by Steve Williams';
  RSIRCClientInfo = '%s �� ��������� ��������� ��� 32-��� Delphi.';
  RSIRCNick = 'Nick';
  RSIRCAltNick = 'OtherNick';
  RSIRCUserName = 'username';
  RSIRCRealName = '�������� ���';
  RSIRCTimeIsNow = '��������� ����� - %s';

  {HL7 Lower Layer Protocol Messages}
  RSHL7StatusStopped           = '����������';
  RSHL7StatusNotConnected      = '�� ��������';
  RSHL7StatusFailedToStart     = '������ ������: %s';
  RSHL7StatusFailedToStop      = '������ ���������: %s';
  RSHL7StatusConnected         = '��������';
  RSHL7StatusConnecting        = '����������';
  RSHL7StatusReConnect         = 'Reconnect at %s: %s';
  RSHL7NotWhileWorking         = '�� �� ������ ���������� %s, ���� ��������� HL7 ��������';
  RSHL7NotWorking              = '������� %s, ���� ��������� HL7 ��������';
  RSHL7NotFailedToStop         = '��������� �������������� ��-�� ������ ��� ���������';
  RSHL7AlreadyStarted          = '��������� ��� �������';
  RSHL7AlreadyStopped          = '��������� ��� ����������';
  RSHL7ModeNotSet              = '����� �� ���������������';
  RSHL7NoAsynEvent             = '��������� � ����������� ������, �� OnMessageArrive �� ��������';
  RSHL7NoSynEvent              = '��������� � ���������� ������, �� OnMessageReceive �� ��������';
  RSHL7InvalidPort             = '������������ �������� Port %d - ��������';
  RSHL7ImpossibleMessage       = '��������� ���� �������, �� ����� �������� ����������';
  RSHL7UnexpectedMessage       = '����������� ��������� ������� �� ���������, ������� �� ������������';
  RSHL7UnknownMode             = '����������� �����';
  RSHL7ClientThreadNotStopped  = '�� ���� ���������� ���������� �����';
  RSHL7SendMessage             = '��������� ���������';
  RSHL7NoConnectionFound       = 'Server Connection not locatable, ����� ������������ ���������';
  RSHL7WaitForAnswer           = '�� �� ������ ��������� ���������, ����� �� �������� �����';

  { MultipartFormData }
  RSMFDIvalidObjectType        = '���������������� ��� �������. �� ������ ���������� ������ ���� �� ��������� ����� ��� �� ��������: TStrings, TStream.';
  { TIdURI exceptions }
  RSURINoProto                 = '���� Protocol - ������';
  RSURINoHost                  = '���� Host - ������';
  { TIdIOHandlerThrottle}
  RSIHTChainedNotAssigned      = '�� ������ ������� ���� ��������� � ������ I/O Handler ����� ��� ��������������';
  { TIdSNPP}
  RSSNPPNoMultiLine            = 'TIdSNPP Mess ������� ������������ ������ ������������ ���������.';
  {TIdThread}
  RSThreadTerminateAndWaitFor  = '�� ���� ������� TerminateAndWaitFor �� FreeAndTerminate �������';

implementation

end.
