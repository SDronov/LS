//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
DWORD _stdcall GetKeyContainer(char *BLog, int SizeLog, const char *ContainerName,
                                                   unsigned long *CryptProv)
{
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------
    if (!CryptAcquireContext(CryptProv,
                             ContainerName,
                             NULL,            // Использование провайдера по умолчанию
                             75,              // Тип провайдера
                             0))              // Значения флагов
            return log.Error("Не удалось получить доступ к контейнеру.");
    //--------------------------------------------------------------------
    log.Add("Контейнер получен.");
    return 0;
}

//==============================================================================
DWORD _stdcall CreateKeyContainer(char *BLog, int SizeLog, const char *ContainerName,
                                                   unsigned long *CryptProv)
{
    LogDLL log(BLog, SizeLog);

    CHAR szUserName[100]; // Буфер для хранения имени ключевого контейнера
    DWORD dwUserNameLen = 100;
    //--------------------------------------------------------------------
    if (!CryptAcquireContext(CryptProv,
                             ContainerName,
                             NULL,
                             75,
                             CRYPT_NEWKEYSET))
            return log.Error("Не удалось создать новый ключевой контейнер.");
    //--------------------------------------------------------------------
    if (!CryptGetProvParam(*CryptProv,
                           PP_CONTAINER,
                           (BYTE *)szUserName,
                           &dwUserNameLen,
                           0))
        return log.Error("Не удалось получить имя нового ключевого контейнера.");
    //--------------------------------------------------------------------
    log.Add("Контейнер создан.");
    return 0;
}

//==============================================================================
DWORD _stdcall GetKey(char *BLog, int SizeLog, unsigned long CryptProv, unsigned long *SignKey, unsigned long *ExchKey)
{
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------
    // попытка получения дескриптора ключа подписи.
    if (!CryptGetUserKey(CryptProv,     // Дескриптор CSP
                         AT_SIGNATURE,  // Спецификация ключа
                         SignKey))      // Дескриптор ключа
        log.Add("Кюч для подписи отсутсвует.");
    else
        log.Add("Ключ подписи получен.");
    //----------------------------------------------------------------
    // попытка получения дескриптора ключа обмена.
    if (!CryptGetUserKey(CryptProv,
                         AT_KEYEXCHANGE,
                         ExchKey))
        log.Add("Кюч обмена отсутсвует.");
    else
        log.Add("Ключ обмена получен.");
    return 0;
}

//==============================================================================
DWORD _stdcall CreateKey(char *BLog, int SizeLog, unsigned long CryptProv, unsigned long *SignKey, unsigned long *ExchKey)
{
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------
    if (CryptGenKey(CryptProv,
                    AT_SIGNATURE/*AT_KEYEXCHANGE*/,
                    CRYPT_EXPORTABLE,
                    SignKey))
        log.Error("Не удалось создать ключ подписи.");
    else
        log.Add("Ключ подписи создан.");
    //----------------------------------------------------------------
    if (!CryptGenKey(CryptProv,
                     AT_KEYEXCHANGE,
                     0,
                     ExchKey))
        log.Error("Не удалось создать ключ обмена.");
    else
        log.Add("Ключ обмена создан.");
    return 0;
}

//==============================================================================
DWORD _stdcall ReleaseContext(unsigned long CryptProv, HCRYPTKEY SgnKey, HCRYPTKEY ExpKey)
{
    if (ExpKey)
        CryptDestroyKey(ExpKey);
    if (SgnKey)
        CryptDestroyKey(SgnKey);
    if (CryptProv)
        CryptReleaseContext(CryptProv, 0);
    return 0;
}
//==============================================================================

