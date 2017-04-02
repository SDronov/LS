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
    log.Add((AnsiString("Проверяется сертификат '") + Subject + "'").c_str());

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
        return log.Error("Ошибка при выделении памяти.");
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
//Проверка СОС    
//CERT_CHAIN_REVOCATION_CHECK_END_CERT Revocation checking is done on the end certificate and only the end certificate.
//CERT_CHAIN_REVOCATION_CHECK_CHAIN Revocation checking is done on all of the certificates in every chain.
//или
//CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT Revocation checking in done on all certificates in all of the chains except the root certificate.

    ChainConfig.dwUrlRetrievalTimeout= 0 ;
    ChainConfig.MaximumCachedCertificates=0 ;
    ChainConfig.CycleDetectionModulus = 0;

    //---------------------------------------------------------
    if (!CertCreateCertificateChainEngine(&ChainConfig,
                                         &hChainEngine))
    {
        return log.Error("Ошибка при вызове CertCreateCertificateChainEngine.");
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
        return log.Error("Ошибка при вызове CertGetNameString.");
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
        return log.Error("Не удалось создать цепочку сертификатов.");
    }
    //---------------------------------------------------------------
    //size of the chain context: pChainContext->cbSize
    //count chains: pChainContext->cChain
    switch(pChainContext->TrustStatus.dwErrorStatus)
    {
    case CERT_TRUST_NO_ERROR :
        log.Add("Для этого сертификата или цепи сертификатов ошибок не обнаружено");
        break;
    case CERT_TRUST_IS_NOT_TIME_VALID:
        log.Add("Этот сертификат или один из сертификатов цепи имеет не верное время.");
        break;
    case CERT_TRUST_IS_NOT_TIME_NESTED:
        log.Add("Сертификаты в цепи не правильно time-nested.");
        break;
    case CERT_TRUST_IS_REVOKED:
        log.Add("Доверие для этого сертификата или одного из сертификатов цепи отменено.");
        break;
    case CERT_TRUST_IS_NOT_SIGNATURE_VALID:
        log.Add("Этот сертификат или один из сертификатов цепи не имеет верной подписи.");
        break;
    case CERT_TRUST_IS_NOT_VALID_FOR_USAGE:
        log.Add("Этот сертификат или один из сертификатов цепи не правильно используется.");
        break;
    case CERT_TRUST_IS_UNTRUSTED_ROOT:
        log.Add("Сертификат или цепь сертификатов основано на недоверенном корне.");
        break;
    case CERT_TRUST_REVOCATION_STATUS_UNKNOWN:
        log.Add("Для этот сертификат или одного из сертификатов цепи не определен статус отозванности.");
        break;
    case CERT_TRUST_IS_CYCLIC:
        log.Add("Один из сертификатов цепи был выпущен и удостоверен автором.");
        break;
    case CERT_TRUST_IS_PARTIAL_CHAIN:
        log.Add("Цепь сертификата не завершена.");
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
        log.Add("Информационный статус пустой.");
        break;
    case CERT_TRUST_HAS_EXACT_MATCH_ISSUER :
        log.Add("Для этого сертификата найдено точное совпадение сертификата издателя.");
        break;
    case CERT_TRUST_HAS_KEY_MATCH_ISSUER:
        log.Add("Для этого сертификата найдено совпадение сертификата издателя.");
        break;
    case CERT_TRUST_HAS_NAME_MATCH_ISSUER:
        log.Add("Для этого сертификата найдено совпадение имени сертификата издателя.");
        break;
    case CERT_TRUST_IS_SELF_SIGNED:
        log.Add("Это сертификат самоподписанный.");
        break;
    case CERT_TRUST_IS_COMPLEX_CHAIN:
        log.Add("Созданная цепь сертификата является сложной цепью.");
        break;
    };
    //-------------------------------------------------------------------
    // Duplicate the original chain.
    pDupContext = CertDuplicateCertificateChain(pChainContext);
    if (!pDupContext)
    {
        return  log.Error("Ошибка при дублировании указателя на цепь сертификата.");
    }
    //-------------------------------------------------------------------
    CertFreeCertificateChain(pDupContext);
    CertFreeCertificateChain(pChainContext);
    //---------------------------------------------------------
    CertFreeCertificateChainEngine(hChainEngine);
    if(pszNameString)
        delete [] pszNameString;
    log.Add("Проверена цепочка сертификатов");
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
      Log->Add("Сертификат для проверки отсутствует");
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
      Log->Error("Ошибка при выделении памяти.");
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
        Log->Error("Ошибка при вызове CertGetNameString.");
        l_result = MY_C_EXEC_IS_ERROR;
     }
    };
    //-------------------------------------------------------------------
    Log->Add((AnsiString("Проверяется сертификат '") + AnsiString((char *)pszNameString) + "'").c_str());
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
       Log->Error("Ошибка при вызове CertCreateCertificateChainEngine.");
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
       Log->Error("Не удалось создать цепочку сертификатов.");
       l_result = MY_C_EXEC_IS_ERROR;
     }
    };
    //---------------------------------------------------------------
    if (l_result == MY_C_EXEC_IS_SUCCESS)
    {
     l_result = MY_C_EXEC_IS_WARNING; 
     if (pChainContext->TrustStatus.dwErrorStatus == CERT_TRUST_NO_ERROR)
     {
       Log->Add("Для этого сертификата или цепи сертификатов ошибок не обнаружено");
       l_result = MY_C_EXEC_IS_SUCCESS;
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_TIME_VALID) != 0)
     {
       Log->Add("Этот сертификат или один из сертификатов цепи имеет не верное время.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_TIME_NESTED) != 0)
     {
       Log->Add("Сертификаты в цепи не правильно time-nested.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_REVOKED) != 0)
     {
       Log->Add("Доверие для этого сертификата отменено.");
       l_result = MY_C_EXEC_IS_ERROR;
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_SIGNATURE_VALID) != 0)
     {
       Log->Add("Этот сертификат или один из сертификатов цепи не имеет верной подписи.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_NOT_VALID_FOR_USAGE) != 0)
     {
       Log->Add("Этот сертификат или один из сертификатов цепи не правильно используется.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_UNTRUSTED_ROOT) != 0)
     {
       Log->Add("Сертификат или цепь сертификатов основаны на недоверенном корне.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_REVOCATION_STATUS_UNKNOWN) != 0)
     {
       Log->Add("Для этого сертификата не определен статус отозванности.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_CYCLIC) != 0)
     {
       Log->Add("Один из сертификатов цепи был выпущен и удостоверен автором.");
     };
     if ((pChainContext->TrustStatus.dwErrorStatus & CERT_TRUST_IS_PARTIAL_CHAIN) != 0)
     {
       Log->Add("Цепь сертификата не завершена.");
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
       Log->Add("Информационный статус пустой.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_EXACT_MATCH_ISSUER) != 0)
     {
       Log->Add("Для этого сертификата найдено точное совпадение сертификата издателя.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_KEY_MATCH_ISSUER) != 0)
     {
       Log->Add("Для этого сертификата найдено совпадение сертификата издателя.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_HAS_NAME_MATCH_ISSUER) != 0)
     {
       Log->Add("Для этого сертификата найдено совпадение имени сертификата издателя.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_IS_SELF_SIGNED) != 0)
     {
       Log->Add("Это сертификат самоподписанный.");
     };
     if ((pChainContext->TrustStatus.dwInfoStatus & CERT_TRUST_IS_COMPLEX_CHAIN) != 0)
     {
       Log->Add("Созданная цепь сертификата является сложной цепью.");
     };
    };
    //-------------------------------------------------------------------
    if (pChainContext) CertFreeCertificateChain(pChainContext);
    //---------------------------------------------------------
    if (hChainEngine) CertFreeCertificateChainEngine(hChainEngine);
    if(pszNameString)
        delete [] pszNameString;
    Log->Add("Проверка завершена.");
    return l_result;
}
