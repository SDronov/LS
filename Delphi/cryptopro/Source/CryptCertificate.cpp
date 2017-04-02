//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
PCCERT_CONTEXT GetCertificate(LogDLL *Log, unsigned long CryptProv, HCERTSTORE &StoreHandle,
                                    const char *CertStoreName, const char *Subject, const bool is_cert_from_sender)
{
    PCCERT_CONTEXT  recipient_cert;
    //--------------------------------------------------------------------
    // Открытие системного хранилища сертификатов.
    StoreHandle = CertOpenSystemStore(CryptProv, CertStoreName);
    if (!StoreHandle)
    {
        Log->Error("Не удалось открыть хранилище сертификатов.");
        return 0;
    }
    //--------------------------------------------------------------------
    // Получение указателя на сертификат
    recipient_cert = GetRecipientCert(Log, StoreHandle, Subject, is_cert_from_sender);
    if (!recipient_cert)
    {
// протокол прописан в GetRecipientCert
//        Log->Error("Не найден сертификат с ключом обмена.");
        return 0;
    }
    DWORD dwKeySpec;
//    if (CryptAcquireCertificatePrivateKey(recipient_cert, 0, NULL, &CryptProv, &dwKeySpec, NULL))
//    {
//        Log->Error("Не найден сертификат с ключом обмена.");
//        return 0;
//    }
    return recipient_cert;
}

//==============================================================================
PCCERT_CONTEXT GetRecipientCert(LogDLL *Log, HCERTSTORE CertStore, const char *RecName, const bool is_cert_from_sender)
{
    PCCERT_CONTEXT pCertContext = NULL;
    DWORD dwSize = 0;
    BOOL fMore = TRUE;
    CRYPT_KEY_PROV_INFO* pKeyInfo = NULL;
//    DWORD PropId = CERT_KEY_PROV_INFO_PROP_ID;
    AnsiString ansi_str = AnsiString(RecName);
    wchar_t *subject_sub_str = new wchar_t[ansi_str.WideCharBufSize()];
    ansi_str.WideChar(subject_sub_str, ansi_str.WideCharBufSize());
    //--------------------------------------------------------------------
    // Поиск сертификата в хранилище
    pCertContext = CertFindCertificateInStore(CertStore,                                 // Дескриптор хранилища
                                             MY_ENCODING_TYPE,//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,   // Тип зашифрования (в этом поиске не используется).
                                             0,                                         // dwFindFlags. Специальный критерий поиска.
                                             CERT_FIND_SUBJECT_STR,
                                             subject_sub_str,
                                             NULL);
    delete subject_sub_str;
    if (pCertContext)
    {
      return (pCertContext);
    }
    else
    {
      Log->Error((AnsiString("Не удалось найти сертификат для ") + RecName).c_str());
    }
/*
    // Поиск сертификатов в хранилище с ключем AT_KEYEXCHANGE.
    while(fMore &&
          (pCertContext = CertFindCertificateInStore(CertStore,                                 // Дескриптор хранилища
                                             MY_ENCODING_TYPE,//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,   // Тип зашифрования (в этом поиске не используется).
                                             0,                                         // dwFindFlags. Специальный критерий поиска.
                                             CERT_FIND_SUBJECT_STR,
                                             subject_sub_str,
                                             pCertContext))
         )
    {
        //--------------------------------------------------------------
        if (!(CertGetCertificateContextProperty(pCertContext,
                                                CERT_KEY_PROV_INFO_PROP_ID,
                                                NULL, &dwSize)))
        {
            Log->Error("Не удалось получить размер сертификата.");
            return 0;
        }
        //--------------------------------------------------------------
        if (pKeyInfo)
            free(pKeyInfo);
        pKeyInfo = (CRYPT_KEY_PROV_INFO*)malloc(dwSize);
        if (!pKeyInfo)
        {
            Log->Error("Не удалось выделить память для сертификата.");
            return 0;
        }
        //--------------------------------------------------------------
        if (!(CertGetCertificateContextProperty(pCertContext,
                                                CERT_KEY_PROV_INFO_PROP_ID,
                                                pKeyInfo, &dwSize)))
        {
            Log->Error("Не удалось получить сертификат.");
            return 0;
        }
        //-------------------------------------------
        if (pKeyInfo->dwKeySpec == AT_KEYEXCHANGE || is_cert_from_sender)
        {
          fMore = FALSE;
        }
    }; // конец цыкла
    delete subject_sub_str;
    if (pKeyInfo)
    {
        free(pKeyInfo);
        return (pCertContext);
    }
    else
    {
        if (!pCertContext)
            Log->Error((AnsiString("Не удалось найти сертификат для ") + RecName).c_str());
        if ((pKeyInfo && pKeyInfo->dwKeySpec != AT_KEYEXCHANGE)||(!pKeyInfo))
            Log->Error("В найденном сертификате отсутствует ключ обмена.");
    }
*/
    return 0;
}

//==============================================================================

