
#ifndef CRYPTO_COMMON_H
#define CRYPTO_COMMON_H

#include <vcl.h>
#include <windows.h>
#include <stdio.h>

#define DECLSPECIFIER __declspec(dllexport)
//---------------------------------------------------------------------------
#ifdef _WIN32
  #include <windows.h>
  #include <wincrypt.h>
  #include "wincryptex.h"
#else
  #include<string.h>
  #include<CSP_WinDef.h>
  #include<CSP_WinCrypt.h>
  #include<WinCryptEx.h>
#endif

#define ARRAY_LENGTH(x) (sizeof(x)/sizeof(x[0]))
#define MY_ENCODING_TYPE  (PKCS_7_ASN_ENCODING | X509_ASN_ENCODING)
//---------------------------------------------------------------------------
#define MY_C_EXEC_IS_SUCCESS 0
#define MY_C_EXEC_IS_ERROR   1
#define MY_C_EXEC_IS_WARNING 2
//---------------------------------------------------------------------------
struct LogDLL;
DWORD LastError(LogDLL *Log);
void ByteToStr(DWORD cb, void* pv, LPSTR sz);

//---------------------------------------------------------------------------
struct LogDLL
{
    char    *Buf;
    int     Size;
    LogDLL(char *aBuf, int aSize) : Buf(aBuf), Size(aSize) {memset(Buf, 0, Size);};
    void Append(const char *Msg)
    {
        if ((Size - strlen(Buf)) > (strlen(Msg) + 1))
            strcat(Buf, Msg);
    };
    void Add(const char *Msg)
    {
        Append("\r\n");
        Append(Msg);
    };
    DWORD Error(const char *Msg)
    {
        Add(Msg);
        return LastError(this);
    };
};
//---------------------------------------------------------------------------
PCCERT_CONTEXT GetCertificate(LogDLL *Log, unsigned long CryptProv, HCERTSTORE &StoreHandle, const char *CertStoreName, const char *Subject, const bool is_cert_from_sender);
PCCERT_CONTEXT GetRecipientCert(LogDLL *Log, HCERTSTORE CertStore, const char *RecName, const bool is_cert_from_sender);

//--------------------------------------------------------------------
//  �� ������� ����������� ������ ���� ���������� ���������� � �������� ������
//  �� ������� ���������� ������ ���� ����������, ��������� � �������� �����������,
//  � ������� �������� �������� ����  
//--------------------------------------------------------------------
//� ������ ������ ������������ ��� ������, ����� - 0
// ��������� ��������� ��������� ���������� � �������� ������
extern "C" DWORD DECLSPECIFIER _stdcall GetKeyContainer(char *Log, int SizeLog, const char *ContainerName, unsigned long *CryptProv);
// �������� ��������� ���������� � �������� ������
extern "C" DWORD DECLSPECIFIER _stdcall CreateKeyContainer(char *Log, int SizeLog, const char *ContainerName, unsigned long *CryptProv);
// ��������� ��������� ��� ���� ������ (��� ������� � ��� ������)
extern "C" DWORD DECLSPECIFIER _stdcall GetKey(char *Log, int SizeLog, unsigned long CryptProv, unsigned long *SignKey, unsigned long *ExchKey);
// �������� ���� ������ (��� ������� � ��� ������)
extern "C" DWORD DECLSPECIFIER _stdcall CreateKey(char *Log, int SizeLog, unsigned long CryptProv, unsigned long *SignKey, unsigned long *ExchKey);
//���������� ��������� (����� ������)
extern "C" DWORD DECLSPECIFIER _stdcall EncryptMessage(char *Log, int SizeLog, unsigned long CryptProv,
                                                       BYTE *Msg, DWORD MsgLen,
                                                       BYTE *pbEncryptedBlob, DWORD *cbEncryptedBlob,
                                                       const char *CertStoreName,
                                                       const int CountSubject,
                                                       char *Subject,
                                                       const char *Signer,
                                                       bool WithSign, const char *Password);
//
extern "C" DWORD DECLSPECIFIER _stdcall DecryptMessage(char *Log, int SizeLog, unsigned long CryptProv,
                                                       BYTE *pbDecryptedMessage, DWORD *cbDecryptedMessage,
                                                       BYTE *pbEncryptedBlob, DWORD cbEncryptedBlob,
                                                       const char *CertStoreName,
                                                       bool WithSign, const char *Password,
                                                       const int CountSigner, char *Signer);

extern "C" DWORD DECLSPECIFIER _stdcall CheckCertificateChain(char *BLog, int SizeLog, unsigned long CryptProv,
                                                              const char *CertStoreName, const char *Subject);
extern "C" DWORD _stdcall CheckCertChain(
                                         LogDLL *Log,
                                         PCCERT_CONTEXT pCertContext
                                        );

DWORD CreateCertificate(char *BLog, int SizeLog, const char *CerName, DWORD *dwSize);
DWORD ExportingCertificate(char *Log, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr, BYTE *KeyBlobSimple);
DWORD ImportingCertificate(char *BLog, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr, BYTE *KeyBlobSimple);


// ������������ ����������
extern "C" DWORD DECLSPECIFIER _stdcall ReleaseContext(unsigned long CryptProv, HCRYPTKEY SgnKey, HCRYPTKEY ExpKey);


#endif
