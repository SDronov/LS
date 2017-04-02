//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
DWORD ExportingCertificate(char *BLog, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr,
                           BYTE *pbKeyBlobSimple)
{
    LogDLL log(BLog, SizeLog);

//  Объявление и инициализация переменных.
HCERTSTORE hStoreHandle;       // Дескриптор хранилища сертификатов
PCCERT_CONTEXT pCertSender;	   // Контекст сертификата отправителя
PCCERT_CONTEXT pCertResponder; // Контекст сертификата получателя
HCRYPTPROV hProvResponder;     // Дескриптор CSP получателя
HCRYPTPROV hProvSender;        // Дескриптор CSP отправителя
HCRYPTKEY hSenderKey;          // Дескриптор открытого ключа отправителя
HCRYPTKEY hResponderKey;       // Дескриптор открытого ключа получателя
HCRYPTKEY hSessionKey;         // Дескриптор сессионного ключа
HCRYPTKEY hAgreeKey;           // Дескриптор ключа согласования
//BYTE *pbKeyBlobSimple;         // Указатель на сессионный ключевой BLOB
DWORD dwBlobLenSimple;         // Длина сессионного ключевого BLOBа
BYTE *pbKeyBlobSender;         // Указатель на ключевой BLOB отправителя
DWORD dwBlobLenSender;         // Длина ключевого BLOBа отправителя
BYTE *pbKeyBlobResponder;      // Указатель на ключевой BLOB получателя
DWORD dwBlobLenResponder;      // Длина ключевого BLOBа получателя
DWORD dwKeySpecSender;
DWORD dwKeySpecResponder;

wchar_t cert_sub_str[100];

    //--------------------------------------------------------------------
    // Открытие системного хранилища сертификатов.
    hStoreHandle = CertOpenSystemStore(0, "MY");
    if (!hStoreHandle)
        return log.Error("Error getting store handle.");
    //--------------------------------------------------------------------
    // Получение контекста сертифика, в названии которого содержится "Sender",
    // находящегося в хранилище сертификатов "MY".
    AnsiString(SenderSubStr).WideChar(cert_sub_str, 99);
    pCertSender = CertFindCertificateInStore(hStoreHandle,
                                            X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                            0,
                                            CERT_FIND_SUBJECT_STR,
                                            cert_sub_str,
                                            NULL);
    if (!pCertSender)
        return log.Error("Error finding certificate.");
    //--------------------------------------------------------------------
    // Получение дескриптора CSP, включая доступ к связанному с ним ключевому
    // контейнеру для контекста сертификата pCertSender.
    if (!CryptAcquireCertificatePrivateKey(pCertSender,
                                           0,
                                           NULL,
                                           &hProvSender,
                                           &dwKeySpecSender,
                                           NULL))
        return log.Error("Error during CryptAcquireCertificatePrivateKey.");
    //--------------------------------------------------------------------
    // Поиск сертифика, в названии которого содержится "Responder",
    // находящегося в хранилище сертификатов "MY".
    AnsiString(ResponderSubStr).WideChar(cert_sub_str, 99);
    pCertResponder = CertFindCertificateInStore(hStoreHandle,
                                                X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                                0,
                                                CERT_FIND_SUBJECT_STR,
                                                cert_sub_str,
                                                NULL);
    if (!pCertResponder)
        return log.Error("Error finding certificate.");
    //--------------------------------------------------------------------
    // Получение дескриптора открытого ключа получателя.
    if (!CryptImportPublicKeyInfoEx(hProvSender,
                                    X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                    &(pCertResponder->pCertInfo->SubjectPublicKeyInfo),
                                    0,
                                    0,
                                    NULL,
                                    &hResponderKey))
        log.Add("Error during CryptImportPublicKeyInfoEx public key.");
    //--------------------------------------------------------------------
    // Определение размера BLOBа открытого ключа и распределение памяти.
    if (!CryptExportKey(hResponderKey,
                       0,
                       PUBLICKEYBLOB,
                       0,
                       NULL,
                       &dwBlobLenResponder))
        return log.Error("Error computing BLOB length.");
    pbKeyBlobResponder = (BYTE*)malloc(dwBlobLenResponder);
    if (!pbKeyBlobResponder)
        return log.Error("Out of memory.");
    //--------------------------------------------------------------------
    // Экспортирование открытого ключа получателя в BLOB открытого ключа.
    if (!CryptExportKey(hResponderKey,
                        0,
                        PUBLICKEYBLOB,
                        0,
                        pbKeyBlobResponder,
                        &dwBlobLenResponder))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // Получение дескриптора закрытого ключа отправителя.
    if (!CryptGetUserKey(hProvSender,
                         dwKeySpecSender,
                         &hSenderKey))
        log.Add("Error during CryptGetUserKey private key.");
    //--------------------------------------------------------------------
    // Получение ключа согласования импортом открытого ключа получателя из BLOBа
    // на закрытом ключе отправителя.
    if (!CryptImportKey(hProvSender,
                        pbKeyBlobResponder,
                        dwBlobLenResponder,
                        hSenderKey,
                        0,
                        &hAgreeKey))
        log.Add("Error during CryptImportKey public key.");
    //--------------------------------------------------------------------
    // Генерация сессионного ключа.
    if (!CryptGenKey(hProvSender,
                     CALG_G28147,
                     CRYPT_EXPORTABLE,
                     &hSessionKey))
        return log.Error("ERROR -- CryptGenKey.");
    //--------------------------------------------------------------------
    // pbKeyBlobSimple - зашифрованный сессионный ключ, передаем его получателю
    //--------------------------------------------------------------------
    // Определение размера BLOBа сессионного ключа и распределение памяти.
    if (!CryptExportKey(hSessionKey,
                        hAgreeKey,
                        SIMPLEBLOB,
                        0,
                        NULL,
                        &dwBlobLenSimple))
        return log.Error("Error computing BLOB length.");
//    pbKeyBlobSimple = (BYTE*)malloc(dwBlobLenSimple);
//    if (!pbKeyBlobSimple)
//        return log.Error("Out of memory.");
    //--------------------------------------------------------------------
    // Шифрование сессионного ключа на ключе Agree.
    if (!CryptExportKey(hSessionKey,
                        hAgreeKey,
                        SIMPLEBLOB,
                        0,
                        pbKeyBlobSimple,
                        &dwBlobLenSimple))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // Закрытие системного хранилища сертификатов.
    if (!CertCloseStore(hStoreHandle, 0))
        return log.Error("Error closing store handle.");
    //--------------------------------------------------------------------
    // Уничтожение сессионного ключа.
    if (hSessionKey)
        CryptDestroyKey(hSessionKey);
    // Уничтожение ключа согласования.
    if (hAgreeKey)
        CryptDestroyKey(hAgreeKey);
    // Уничтожение дескриптора открытого ключа получателя.
    if (hResponderKey)
        CryptDestroyKey(hResponderKey);
    // Уничтожение дескриптора закрытого ключа отправителя.
    if (hSenderKey)
        CryptDestroyKey(hSenderKey);
    // Освобождение дескриптора провайдера.
    if (hProvSender)
        CryptReleaseContext(hProvSender, 0);
    // Освобождение контекста сертификата.
    if (pCertSender)
        CertFreeCertificateContext(pCertSender);
    if (pCertResponder)
        CertFreeCertificateContext(pCertResponder);
    // Освобождение памяти, используемой ключевым BLOBом.
    free(pbKeyBlobResponder);
}

//--------------------------------------------------------------------
// На стороне получателя: получили зашифрованный сессионный ключ
// pbKeyBlobSimple.
//--------------------------------------------------------------------
DWORD ImportingCertificate(char *BLog, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr,
                           BYTE *pbKeyBlobSimple)
{
    LogDLL log(BLog, SizeLog);
//  Объявление и инициализация переменных.
HCERTSTORE hStoreHandle;         // Дескриптор хранилища сертификатов
PCCERT_CONTEXT pCertSender;	 // Контекст сертификата отправителя
PCCERT_CONTEXT pCertResponder;	 // Контекст сертификата получателя
HCRYPTPROV hProvResponder;       // Дескриптор CSP получателя
HCRYPTPROV hProvSender;          // Дескриптор CSP отправителя
HCRYPTKEY hSenderKey;          // Дескриптор открытого ключа отправителя
HCRYPTKEY hResponderKey;       // Дескриптор открытого ключа получателя
HCRYPTKEY hSessionKey;         // Дескриптор сессионного ключа
HCRYPTKEY hAgreeKey;           // Дескриптор ключа согласования
//BYTE *pbKeyBlobSimple;         // Указатель на сессионный ключевой BLOB
DWORD dwBlobLenSimple;         // Длина сессионного ключевого BLOBа
BYTE *pbKeyBlobSender;         // Указатель на ключевой BLOB отправителя
DWORD dwBlobLenSender;         // Длина ключевого BLOBа отправителя
BYTE *pbKeyBlobResponder;      // Указатель на ключевой BLOB получателя
DWORD dwBlobLenResponder;      // Длина ключевого BLOBа получателя
DWORD dwKeySpecSender;
DWORD dwKeySpecResponder;

wchar_t cert_sub_str[100];
    //--------------------------------------------------------------------
    // Открытие системного хранилища сертификатов.
    hStoreHandle = CertOpenSystemStore(0, "MY");
    if (!hStoreHandle)
        return log.Error("Error getting store handle.");
    //--------------------------------------------------------------------
    // Получение контекста сертифика, в названии которого содержится "Responder",
    // находящегося в хранилище сертификатов "MY".
    AnsiString(ResponderSubStr).WideChar(cert_sub_str, 99);
    pCertResponder = CertFindCertificateInStore(hStoreHandle,
                                                X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                                0,
                                                CERT_FIND_SUBJECT_STR,
                                                cert_sub_str,
                                                NULL);
    if (!pCertResponder)
        return log.Error("Error finding certificate.");
    //--------------------------------------------------------------------
    // Получение дескриптора CSP, включая доступ к связанному с ним ключевому
    // контейнеру для контекста сертификата pCertResponder.
    if (!CryptAcquireCertificatePrivateKey(pCertResponder,
                                           0,
                                           NULL,
                                           &hProvResponder,
                                           &dwKeySpecResponder,
                                           NULL))
        return log.Error("Error during CryptAcquireCertificatePrivateKey.");
    //--------------------------------------------------------------------
    // Поиск сертифика, в названии которого содержится "Sender",
    // находящегося в хранилище сертификатов "MY".
    AnsiString(SenderSubStr).WideChar(cert_sub_str, 99);
    pCertSender = CertFindCertificateInStore(hStoreHandle,
                                            X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                            0,
                                            CERT_FIND_SUBJECT_STR,
                                            cert_sub_str,
                                            NULL);
    if (!pCertSender)
        return log.Error("Error finding certificate.");
    //--------------------------------------------------------------------
    // Получение дескриптора открытого ключа отправителя.
/////////////////////
// Получение дескриптора CSP, включая доступ к связанному с ним ключевому
// контейнеру для контекста сертификата pCertSender.
    if (!CryptAcquireCertificatePrivateKey(pCertSender,
                                          0,
                                          NULL,
                                          &hProvSender,
                                          &dwKeySpecSender,
                                          NULL))
        log.Add("Не удалось получить CSP.");
//////////////////////
    if (!CryptImportPublicKeyInfoEx(hProvSender,
                                    X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                    &(pCertSender->pCertInfo->SubjectPublicKeyInfo),
                                    0,
                                    0,
                                    NULL,
                                    &hSenderKey))
        log.Add("Error during CryptImportPublicKeyInfoEx public key.");
    //--------------------------------------------------------------------
    // Определение размера BLOBа открытого ключа и распределение памяти.
    if (!CryptExportKey(hSenderKey,
                       0,
                       PUBLICKEYBLOB,
                       0,
                       NULL,
                       &dwBlobLenSender))
        return log.Error("Error computing BLOB length.");
    pbKeyBlobSender = (BYTE*)malloc(dwBlobLenSender);
    if (!pbKeyBlobSender)
        return log.Error("Out of memory.");
    //--------------------------------------------------------------------
    // Экспортирование открытого ключа отправителя в BLOB открытого ключа.
    if (!CryptExportKey(hSenderKey,
                        0,
                        PUBLICKEYBLOB,
                        0,
                        pbKeyBlobSender,
                        &dwBlobLenSender))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // Получение дескриптора закрытого ключа получателя.
    if (!CryptGetUserKey(hProvResponder,
                         dwKeySpecResponder,
                         &hResponderKey))
        log.Add("Error during CryptGetUserKey private key.");
    //--------------------------------------------------------------------
    // Получение ключа согласования импортом открытого ключа отправителя из BLOBа
    // на закрытом ключе получателя.
    if (!CryptImportKey(hProvResponder,
                        pbKeyBlobSender,
                        dwBlobLenSender,
                        hResponderKey,
                        0,
                        &hAgreeKey))
        log.Add("Error during CryptImportKey public key.");
    // Получение сессионного ключа импортом зашифрованного сессионного ключа
    // на ключе Agree.
    if (!CryptImportKey(hProvResponder,
                        pbKeyBlobSimple,
                        dwBlobLenSimple,
                        hAgreeKey,
                        0,
                        &hSessionKey))
        log.Add("Error during CryptImportKey session key.");
    //--------------------------------------------------------------------
    // Закрытие системного хранилища сертификатов.
    if (!CertCloseStore(hStoreHandle, 0))
        return log.Error("Error closing store handle.");
    //--------------------------------------------------------------------
    //  Освобождение памяти, используемой ключевыми BLOBами.
    free(pbKeyBlobSimple);
    free(pbKeyBlobSender);
    // Уничтожение дескриптора закрытого ключа получателя.
    if (hResponderKey)
        CryptDestroyKey(hResponderKey);
    // Уничтожение дескриптора открытого ключа отправителя.
    if( hSenderKey)
        CryptDestroyKey(hSenderKey);
    // Уничтожение сессионного ключа.
    if (hSessionKey)
        CryptDestroyKey(hSessionKey);
    // Уничтожение ключа согласования.
    if (hAgreeKey)
        CryptDestroyKey(hAgreeKey);
    // Освобождение дескриптора провайдера.
    if (hProvResponder)
        CryptReleaseContext(hProvResponder, 0);
    // Освобождение контекста сертификата.
    if (pCertSender)
        CertFreeCertificateContext(pCertSender);
    if( pCertResponder)
        CertFreeCertificateContext(pCertResponder);
    log.Add("The program ran to completion without error.");
    return 0;
}







//CertGetCertificateChain
//CertCreateCertificateChainEngine

//Как проверить подпись сертификата?
//CryptVerifyCertificateSignatureEx


