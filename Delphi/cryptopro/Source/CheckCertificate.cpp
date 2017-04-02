//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
DWORD _stdcall CheckCertificateChain(char *BLog, int SizeLog,
                                     unsigned long CryptProv,
                                     const char *CertStoreName, const char *Subject)
{
    LogDLL log(BLog, SizeLog);
    log.Add((AnsiString("����������� ���������� '") + Subject + "'").c_str());

    //---------------------------------------------------------
    HCERTCHAINENGINE         hChainEngine;
    CERT_CHAIN_ENGINE_CONFIG ChainConfig;
    PCCERT_CHAIN_CONTEXT     pChainContext;
    PCCERT_CHAIN_CONTEXT     pDupContext;
    HCERTSTORE               hCertStore = 0;
    PCCERT_CONTEXT           pCertContext = NULL;
    CERT_ENHKEY_USAGE        EnhkeyUsage;
    CERT_USAGE_MATCH         CertUsage;
    CERT_CHAIN_PARA          ChainPara;
    DWORD                    dwFlags=0;
    BYTE                     *pszNameString;

    //---------------------------------------------------------
    pszNameString = new BYTE[256];
    if(!pszNameString)
        return log.Error("������ ��� ��������� ������.");
    EnhkeyUsage.cUsageIdentifier = 0;
    EnhkeyUsage.rgpszUsageIdentifier=NULL;
    CertUsage.dwType = USAGE_MATCH_TYPE_AND;
    CertUsage.Usage  = EnhkeyUsage;
    ChainPara.cbSize = sizeof(CERT_CHAIN_PARA);
    ChainPara.RequestedUsage=CertUsage;

    ChainConfig.cbSize = sizeof(CERT_CHAIN_ENGINE_CONFIG);
    ChainConfig.hRestrictedRoot= NULL ;
    ChainConfig.hRestrictedTrust= NULL ;
    ChainConfig.hRestrictedOther= NULL ;
    ChainConfig.cAdditionalStore=0 ;
    ChainConfig.rghAdditionalStore = NULL ;
    ChainConfig.dwFlags = CERT_CHAIN_CACHE_END_CERT | CERT_CHAIN_REVOCATION_CHECK_CHAIN;
//�������� ���    
//CERT_CHAIN_REVOCATION_CHECK_END_CERT Revocation checking is done on the end certificate and only the end certificate.
//CERT_CHAIN_REVOCATION_CHECK_CHAIN Revocation checking is done on all of the certificates in every chain.
//���
//CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT Revocation checking in done on all certificates in all of the chains except the root certificate.

    ChainConfig.dwUrlRetrievalTimeout= 0 ;
    ChainConfig.MaximumCachedCertificates=0 ;
    ChainConfig.CycleDetectionModulus = 0;

    //---------------------------------------------------------
    if (!CertCreateCertificateChainEngine(&ChainConfig,
                                         &hChainEngine))
    {
        return log.Error("������ ��� ������ CertCreateCertificateChainEngine.");
    }
    //-------------------------------------------------------
    pCertContext = GetCertificate(&log, CryptProv, hCertStore, CertStoreName, Subject, true);
    if (!pCertContext)
        return 1;
    if (!CertGetNameString(pCertContext,
                           CERT_NAME_SIMPLE_DISPLAY_TYPE,
                           0,
                           NULL,
                           (char *)pszNameString,
                           128))
    {
        return log.Error("������ ��� ������ CertGetNameString.");
    }
    //-------------------------------------------------------------------
    if (!CertGetCertificateChain(NULL,                  // use the default chain engine
                                 pCertContext,          // pointer to the end certificate
                                 NULL,                  // use the default time
                                 NULL,                  // search no additional stores
                                 &ChainPara,            // use AND logic and enhanced key usage
                                                        //  as indicated in the ChainPara
                                                        //  data structure
                                 dwFlags,
                                 NULL,                  // currently reserved
                                 &pChainContext))       // return a pointer to the chain created
    {
        return log.Error("�� ������� ������� ������� ������������.");
    }
    //---------------------------------------------------------------
    //size of the chain context: pChainContext->cbSize
    //count chains: pChainContext->cChain
    switch(pChainContext->TrustStatus.dwErrorStatus)
    {
    case CERT_TRUST_NO_ERROR :
        log.Add("��� ����� ����������� ��� ���� ������������ ������ �� ����������");
        break;
    case CERT_TRUST_IS_NOT_TIME_VALID:
        log.Add("���� ���������� ��� ���� �� ������������ ���� ����� �� ������ �����.");
        break;
    case CERT_TRUST_IS_NOT_TIME_NESTED:
        log.Add("����������� � ���� �� ��������� time-nested.");
        break;
    case CERT_TRUST_IS_REVOKED:
        log.Add("������� ��� ����� ����������� ��� ������ �� ������������ ���� ��������.");
        break;
    case CERT_TRUST_IS_NOT_SIGNATURE_VALID:
        log.Add("���� ���������� ��� ���� �� ������������ ���� �� ����� ������ �������.");
        break;
    case CERT_TRUST_IS_NOT_VALID_FOR_USAGE:
        log.Add("���� ���������� ��� ���� �� ������������ ���� �� ��������� ������������.");
        break;
    case CERT_TRUST_IS_UNTRUSTED_ROOT:
        log.Add("���������� ��� ���� ������������ �������� �� ������������ �����.");
        break;
    case CERT_TRUST_REVOCATION_STATUS_UNKNOWN:
        log.Add("��� ���� ���������� ��� ������ �� ������������ ���� �� ��������� ������ ������������.");
        break;
    case CERT_TRUST_IS_CYCLIC:
        log.Add("���� �� ������������ ���� ��� ������� � ����������� �������.");
        break;
    case CERT_TRUST_IS_PARTIAL_CHAIN:
        log.Add("���� ����������� �� ���������.");
        break;
    case CERT_TRUST_CTL_IS_NOT_TIME_VALID:
        log.Add("A CTL used to create this chain was not time-valid.");
        break;
    case CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID:
        log.Add("A CTL used to create this chain did not have a valid signature.");
        break;
    case CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE:
        log.Add("A CTL used to create this chain is not valid for this usage.");
    };

    switch(pChainContext->TrustStatus.dwInfoStatus)
    {
    case 0:
        log.Add("�������������� ������ ������.");
        break;
    case CERT_TRUST_HAS_EXACT_MATCH_ISSUER :
        log.Add("��� ����� ����������� ������� ������ ���������� ����������� ��������.");
        break;
    case CERT_TRUST_HAS_KEY_MATCH_ISSUER:
        log.Add("��� ����� ����������� ������� ���������� ����������� ��������.");
        break;
    case CERT_TRUST_HAS_NAME_MATCH_ISSUER:
        log.Add("��� ����� ����������� ������� ���������� ����� ����������� ��������.");
        break;
    case CERT_TRUST_IS_SELF_SIGNED:
        log.Add("��� ���������� ���������������.");
        break;
    case CERT_TRUST_IS_COMPLEX_CHAIN:
        log.Add("��������� ���� ����������� �������� ������� �����.");
        break;
    };
    //-------------------------------------------------------------------
    // Duplicate the original chain.
    pDupContext = CertDuplicateCertificateChain(pChainContext);
    if (!pDupContext)
    {
        return  log.Error("������ ��� ������������ ��������� �� ���� �����������.");
    }
    //-------------------------------------------------------------------
    CertFreeCertificateChain(pDupContext);
    CertFreeCertificateChain(pChainContext);
    //---------------------------------------------------------
    CertFreeCertificateChainEngine(hChainEngine);
    if(pszNameString)
        delete [] pszNameString;
    log.Add("��������� ������� ������������");
    return 0;
}
//==============================================================================
DWORD _stdcall CheckCertChain(
                              LogDLL *Log,
                              PCCERT_CONTEXT pCertContext
                             )
{
    if (!pCertContext)
    {
      Log->Add("���������� ��� �������� �����������");
      return MY_C_EXEC_IS_ERROR;
    }
    //---------------------------------------------------------
    HCERTCHAINENGINE         hChainEngine;
    CERT_CHAIN_ENGINE_CONFIG ChainConfig;
    PCCERT_CHAIN_CONTEXT     pChainContext;
    HCERTSTORE               hCertStore = 0;
    CERT_ENHKEY_USAGE        EnhkeyUsage;
    CERT_USAGE_MATCH         CertUsage;
    CERT_CHAIN_PARA          ChainPara;
    DWORD                    dwFlags=CERT_CHAIN_REVOCATION_CHECK_END_CERT;
    BYTE                     *pszNameString;
    DWORD                    l_result = MY_C_EXEC_IS_SUCCESS;
    //---------------------------------------------------------
    pszNameString = new BYTE[256];
    if(!pszNameString)
    {
      Log->Error("������ ��� ��������� ������.");
      return MY_C_EXEC_IS_ERROR;
    };
    if (l_result == MY_C_EXEC_IS_SUCCESS)
    {
     if (!CertGetNameString(pCertContext,
                            CERT_NAME_SIMPLE_DISPLAY_TYPE,
                            0,
                            NULL,
                            (char *)pszNameString,
                            128))
     {
        Log->Error("������ ��� ������ CertGetNameString.");
        l_result = MY_C_EXEC_IS_ERROR;
     }
    };
    //-------------------------------------------------------------------
    Log->Add((AnsiString("����������� ���������� '") + AnsiString((char *)pszNameString) + "'").c_str());
    //---------------------------------------------------------
    EnhkeyUsage.cUsageIdentifier = 0;
    EnhkeyUsage.rgpszUsageIdentifier=NULL;
    CertUsage.dwType = USAGE_MATCH_TYPE_AND;
    CertUsage.Usage  = EnhkeyUsage;
    ChainPara.cbSize = sizeof(CERT_CHAIN_PARA);
    ChainPara.RequestedUsage=CertUsage;
    //--
    ChainConfig.cbSize = sizeof(CERT_CHAIN_ENGINE_CONFIG);
    ChainConfig.hRestrictedRoot= NULL ;
    ChainConfig.hRestrictedTrust= NULL ;
    ChainConfig.hRestrictedOther= NULL ;
    ChainConfig.cAdditionalStore=0 ;
    ChainConfig.rghAdditionalStore = NULL ;
    ChainConfig.dwFlags = CERT_CHAIN_CACHE_END_CERT;
    ChainConfig.dwUrlRetrievalTimeout= 0 ;
    ChainConfig.MaximumCachedCertificates=0 ;
    ChainConfig.CycleDetectionModulus = 0;
    //---------------------------------------------------------
    if (l_result == MY_C_EXEC_IS_SUCCESS)
    {
     if (!CertCreateCertificateChainEngine(&ChainConfig,
                                           &hChainEngine))
     {
       Log->Error("������ ��� ������ CertCreateCertificateChainEngine.");
       l_result = MY_C_EXEC_IS_ERROR;
     }
    };
    //-------------------------------------------------------
    if (l_result == MY_C_EXEC_IS_SUCCESS)
    {
     if (!CertGetCertificateChain(NULL,                  // use the default chain engine
                                  pCertContext,          // pointer to the end certificate
                                  NULL,                  // use the default time
                                  NULL,                  // search no additional stores
                                  &ChainPara,            // use AND logic and enhanced key usage
                                                         //  as indicated in the ChainPara
                                                         //  data structure
                                  dwFlags,
                                  NULL,                  // currently reserved
                                  &pChainContext))       // return a pointer to the chain created
     {
       Log->Error("�� ������� ������� ������� ������������.");
       l_result = MY_C_EXEC_IS_ERROR;
     }
    };
    //---------------------------------------------------------------
    if (l_result == MY_C_EXEC_IS_SUCCESS)
    {
     l_result = MY_C_EXEC_IS_WARNING; 
     if (pChainContext->TrustStatus.dwErrorStatus == CERT_TRUST_NO_ERROR)
     {
       Log->Add("��� ����� ����������� ��� ���� ������������ ������ �� ����������");
       l_result = MY_C_EXEC_IS_SUCCESS;
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_TIME_VALID) != 0)
     {
       Log->Add("���� ���������� ��� ���� �� ������������ ���� ����� �� ������ �����.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_TIME_NESTED) != 0)
     {
       Log->Add("����������� � ���� �� ��������� time-nested.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_REVOKED) != 0)
     {
       Log->Add("������� ��� ����� ����������� ��������.");
       l_result = MY_C_EXEC_IS_ERROR;
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_SIGNATURE_VALID) != 0)
     {
       Log->Add("���� ���������� ��� ���� �� ������������ ���� �� ����� ������ �������.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_VALID_FOR_USAGE) != 0)
     {
       Log->Add("���� ���������� ��� ���� �� ������������ ���� �� ��������� ������������.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_UNTRUSTED_ROOT) != 0)
     {
       Log->Add("���������� ��� ���� ������������ �������� �� ������������ �����.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_REVOCATION_STATUS_UNKNOWN) != 0)
     {
       Log->Add("��� ����� ����������� �� ��������� ������ ������������.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_CYCLIC) != 0)
     {
       Log->Add("���� �� ������������ ���� ��� ������� � ����������� �������.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_PARTIAL_CHAIN) != 0)
     {
       Log->Add("���� ����������� �� ���������.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_CTL_IS_NOT_TIME_VALID) != 0)
     {
       Log->Add("A CTL used to create this chain was not time-valid.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID) != 0)
     {
       Log->Add("A CTL used to create this chain did not have a valid signature.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE) != 0)
     {
       Log->Add("A CTL used to create this chain is not valid for this usage.");
     };
     //-- InfoStatus
     if ( pChainContext->TrustStatus.dwInfoStatus == 0 )
     {
       Log->Add("�������������� ������ ������.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_EXACT_MATCH_ISSUER) != 0)
     {
       Log->Add("��� ����� ����������� ������� ������ ���������� ����������� ��������.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_KEY_MATCH_ISSUER) != 0)
     {
       Log->Add("��� ����� ����������� ������� ���������� ����������� ��������.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_NAME_MATCH_ISSUER) != 0)
     {
       Log->Add("��� ����� ����������� ������� ���������� ����� ����������� ��������.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_IS_SELF_SIGNED) != 0)
     {
       Log->Add("��� ���������� ���������������.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_IS_COMPLEX_CHAIN) != 0)
     {
       Log->Add("��������� ���� ����������� �������� ������� �����.");
     };
    };
    //-------------------------------------------------------------------
    if (pChainContext) CertFreeCertificateChain(pChainContext);
    //---------------------------------------------------------
    if (hChainEngine) CertFreeCertificateChainEngine(hChainEngine);
    if(pszNameString)
        delete [] pszNameString;
    Log->Add("�������� ���������.");
    return l_result;
}
