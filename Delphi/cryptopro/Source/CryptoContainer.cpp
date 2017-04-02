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
                             NULL,            // ������������� ���������� �� ���������
                             75,              // ��� ����������
                             0))              // �������� ������
            return log.Error("�� ������� �������� ������ � ����������.");
    //--------------------------------------------------------------------
    log.Add("��������� �������.");
    return 0;
}

//==============================================================================
DWORD _stdcall CreateKeyContainer(char *BLog, int SizeLog, const char *ContainerName,
                                                   unsigned long *CryptProv)
{
    LogDLL log(BLog, SizeLog);

    CHAR szUserName[100]; // ����� ��� �������� ����� ��������� ����������
    DWORD dwUserNameLen = 100;
    //--------------------------------------------------------------------
    if (!CryptAcquireContext(CryptProv,
                             ContainerName,
                             NULL,
                             75,
                             CRYPT_NEWKEYSET))
            return log.Error("�� ������� ������� ����� �������� ���������.");
    //--------------------------------------------------------------------
    if (!CryptGetProvParam(*CryptProv,
                           PP_CONTAINER,
                           (BYTE *)szUserName,
                           &dwUserNameLen,
                           0))
        return log.Error("�� ������� �������� ��� ������ ��������� ����������.");
    //--------------------------------------------------------------------
    log.Add("��������� ������.");
    return 0;
}

//==============================================================================
DWORD _stdcall GetKey(char *BLog, int SizeLog, unsigned long CryptProv, unsigned long *SignKey, unsigned long *ExchKey)
{
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------
    // ������� ��������� ����������� ����� �������.
    if (!CryptGetUserKey(CryptProv,     // ���������� CSP
                         AT_SIGNATURE,  // ������������ �����
                         SignKey))      // ���������� �����
        log.Add("��� ��� ������� ����������.");
    else
        log.Add("���� ������� �������.");
    //----------------------------------------------------------------
    // ������� ��������� ����������� ����� ������.
    if (!CryptGetUserKey(CryptProv,
                         AT_KEYEXCHANGE,
                         ExchKey))
        log.Add("��� ������ ����������.");
    else
        log.Add("���� ������ �������.");
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
        log.Error("�� ������� ������� ���� �������.");
    else
        log.Add("���� ������� ������.");
    //----------------------------------------------------------------
    if (!CryptGenKey(CryptProv,
                     AT_KEYEXCHANGE,
                     0,
                     ExchKey))
        log.Error("�� ������� ������� ���� ������.");
    else
        log.Add("���� ������ ������.");
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

