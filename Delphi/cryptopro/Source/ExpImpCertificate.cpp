//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
DWORD ExportingCertificate(char *BLog, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr,
                           BYTE *pbKeyBlobSimple)
{
    LogDLL log(BLog, SizeLog);

//  ���������� � ������������� ����������.
HCERTSTORE hStoreHandle;       // ���������� ��������� ������������
PCCERT_CONTEXT pCertSender;	   // �������� ����������� �����������
PCCERT_CONTEXT pCertResponder; // �������� ����������� ����������
HCRYPTPROV hProvResponder;     // ���������� CSP ����������
HCRYPTPROV hProvSender;        // ���������� CSP �����������
HCRYPTKEY hSenderKey;          // ���������� ��������� ����� �����������
HCRYPTKEY hResponderKey;       // ���������� ��������� ����� ����������
HCRYPTKEY hSessionKey;         // ���������� ����������� �����
HCRYPTKEY hAgreeKey;           // ���������� ����� ������������
//BYTE *pbKeyBlobSimple;         // ��������� �� ���������� �������� BLOB
DWORD dwBlobLenSimple;         // ����� ����������� ��������� BLOB�
BYTE *pbKeyBlobSender;         // ��������� �� �������� BLOB �����������
DWORD dwBlobLenSender;         // ����� ��������� BLOB� �����������
BYTE *pbKeyBlobResponder;      // ��������� �� �������� BLOB ����������
DWORD dwBlobLenResponder;      // ����� ��������� BLOB� ����������
DWORD dwKeySpecSender;
DWORD dwKeySpecResponder;

wchar_t cert_sub_str[100];

    //--------------------------------------------------------------------
    // �������� ���������� ��������� ������������.
    hStoreHandle = CertOpenSystemStore(0, "MY");
    if (!hStoreHandle)
        return log.Error("Error getting store handle.");
    //--------------------------------------------------------------------
    // ��������� ��������� ���������, � �������� �������� ���������� "Sender",
    // ������������ � ��������� ������������ "MY".
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
    // ��������� ����������� CSP, ������� ������ � ���������� � ��� ���������
    // ���������� ��� ��������� ����������� pCertSender.
    if (!CryptAcquireCertificatePrivateKey(pCertSender,
                                           0,
                                           NULL,
                                           &hProvSender,
                                           &dwKeySpecSender,
                                           NULL))
        return log.Error("Error during CryptAcquireCertificatePrivateKey.");
    //--------------------------------------------------------------------
    // ����� ���������, � �������� �������� ���������� "Responder",
    // ������������ � ��������� ������������ "MY".
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
    // ��������� ����������� ��������� ����� ����������.
    if (!CryptImportPublicKeyInfoEx(hProvSender,
                                    X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,
                                    &(pCertResponder->pCertInfo->SubjectPublicKeyInfo),
                                    0,
                                    0,
                                    NULL,
                                    &hResponderKey))
        log.Add("Error during CryptImportPublicKeyInfoEx public key.");
    //--------------------------------------------------------------------
    // ����������� ������� BLOB� ��������� ����� � ������������� ������.
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
    // ��������������� ��������� ����� ���������� � BLOB ��������� �����.
    if (!CryptExportKey(hResponderKey,
                        0,
                        PUBLICKEYBLOB,
                        0,
                        pbKeyBlobResponder,
                        &dwBlobLenResponder))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // ��������� ����������� ��������� ����� �����������.
    if (!CryptGetUserKey(hProvSender,
                         dwKeySpecSender,
                         &hSenderKey))
        log.Add("Error during CryptGetUserKey private key.");
    //--------------------------------------------------------------------
    // ��������� ����� ������������ �������� ��������� ����� ���������� �� BLOB�
    // �� �������� ����� �����������.
    if (!CryptImportKey(hProvSender,
                        pbKeyBlobResponder,
                        dwBlobLenResponder,
                        hSenderKey,
                        0,
                        &hAgreeKey))
        log.Add("Error during CryptImportKey public key.");
    //--------------------------------------------------------------------
    // ��������� ����������� �����.
    if (!CryptGenKey(hProvSender,
                     CALG_G28147,
                     CRYPT_EXPORTABLE,
                     &hSessionKey))
        return log.Error("ERROR -- CryptGenKey.");
    //--------------------------------------------------------------------
    // pbKeyBlobSimple - ������������� ���������� ����, �������� ��� ����������
    //--------------------------------------------------------------------
    // ����������� ������� BLOB� ����������� ����� � ������������� ������.
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
    // ���������� ����������� ����� �� ����� Agree.
    if (!CryptExportKey(hSessionKey,
                        hAgreeKey,
                        SIMPLEBLOB,
                        0,
                        pbKeyBlobSimple,
                        &dwBlobLenSimple))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // �������� ���������� ��������� ������������.
    if (!CertCloseStore(hStoreHandle, 0))
        return log.Error("Error closing store handle.");
    //--------------------------------------------------------------------
    // ����������� ����������� �����.
    if (hSessionKey)
        CryptDestroyKey(hSessionKey);
    // ����������� ����� ������������.
    if (hAgreeKey)
        CryptDestroyKey(hAgreeKey);
    // ����������� ����������� ��������� ����� ����������.
    if (hResponderKey)
        CryptDestroyKey(hResponderKey);
    // ����������� ����������� ��������� ����� �����������.
    if (hSenderKey)
        CryptDestroyKey(hSenderKey);
    // ������������ ����������� ����������.
    if (hProvSender)
        CryptReleaseContext(hProvSender, 0);
    // ������������ ��������� �����������.
    if (pCertSender)
        CertFreeCertificateContext(pCertSender);
    if (pCertResponder)
        CertFreeCertificateContext(pCertResponder);
    // ������������ ������, ������������ �������� BLOB��.
    free(pbKeyBlobResponder);
}

//--------------------------------------------------------------------
// �� ������� ����������: �������� ������������� ���������� ����
// pbKeyBlobSimple.
//--------------------------------------------------------------------
DWORD ImportingCertificate(char *BLog, int SizeLog, const char *SenderSubStr, const char *ResponderSubStr,
                           BYTE *pbKeyBlobSimple)
{
    LogDLL log(BLog, SizeLog);
//  ���������� � ������������� ����������.
HCERTSTORE hStoreHandle;         // ���������� ��������� ������������
PCCERT_CONTEXT pCertSender;	 // �������� ����������� �����������
PCCERT_CONTEXT pCertResponder;	 // �������� ����������� ����������
HCRYPTPROV hProvResponder;       // ���������� CSP ����������
HCRYPTPROV hProvSender;          // ���������� CSP �����������
HCRYPTKEY hSenderKey;          // ���������� ��������� ����� �����������
HCRYPTKEY hResponderKey;       // ���������� ��������� ����� ����������
HCRYPTKEY hSessionKey;         // ���������� ����������� �����
HCRYPTKEY hAgreeKey;           // ���������� ����� ������������
//BYTE *pbKeyBlobSimple;         // ��������� �� ���������� �������� BLOB
DWORD dwBlobLenSimple;         // ����� ����������� ��������� BLOB�
BYTE *pbKeyBlobSender;         // ��������� �� �������� BLOB �����������
DWORD dwBlobLenSender;         // ����� ��������� BLOB� �����������
BYTE *pbKeyBlobResponder;      // ��������� �� �������� BLOB ����������
DWORD dwBlobLenResponder;      // ����� ��������� BLOB� ����������
DWORD dwKeySpecSender;
DWORD dwKeySpecResponder;

wchar_t cert_sub_str[100];
    //--------------------------------------------------------------------
    // �������� ���������� ��������� ������������.
    hStoreHandle = CertOpenSystemStore(0, "MY");
    if (!hStoreHandle)
        return log.Error("Error getting store handle.");
    //--------------------------------------------------------------------
    // ��������� ��������� ���������, � �������� �������� ���������� "Responder",
    // ������������ � ��������� ������������ "MY".
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
    // ��������� ����������� CSP, ������� ������ � ���������� � ��� ���������
    // ���������� ��� ��������� ����������� pCertResponder.
    if (!CryptAcquireCertificatePrivateKey(pCertResponder,
                                           0,
                                           NULL,
                                           &hProvResponder,
                                           &dwKeySpecResponder,
                                           NULL))
        return log.Error("Error during CryptAcquireCertificatePrivateKey.");
    //--------------------------------------------------------------------
    // ����� ���������, � �������� �������� ���������� "Sender",
    // ������������ � ��������� ������������ "MY".
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
    // ��������� ����������� ��������� ����� �����������.
/////////////////////
// ��������� ����������� CSP, ������� ������ � ���������� � ��� ���������
// ���������� ��� ��������� ����������� pCertSender.
    if (!CryptAcquireCertificatePrivateKey(pCertSender,
                                          0,
                                          NULL,
                                          &hProvSender,
                                          &dwKeySpecSender,
                                          NULL))
        log.Add("�� ������� �������� CSP.");
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
    // ����������� ������� BLOB� ��������� ����� � ������������� ������.
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
    // ��������������� ��������� ����� ����������� � BLOB ��������� �����.
    if (!CryptExportKey(hSenderKey,
                        0,
                        PUBLICKEYBLOB,
                        0,
                        pbKeyBlobSender,
                        &dwBlobLenSender))
        return log.Error("Error during CryptExportKey.");
    //--------------------------------------------------------------------
    // ��������� ����������� ��������� ����� ����������.
    if (!CryptGetUserKey(hProvResponder,
                         dwKeySpecResponder,
                         &hResponderKey))
        log.Add("Error during CryptGetUserKey private key.");
    //--------------------------------------------------------------------
    // ��������� ����� ������������ �������� ��������� ����� ����������� �� BLOB�
    // �� �������� ����� ����������.
    if (!CryptImportKey(hProvResponder,
                        pbKeyBlobSender,
                        dwBlobLenSender,
                        hResponderKey,
                        0,
                        &hAgreeKey))
        log.Add("Error during CryptImportKey public key.");
    // ��������� ����������� ����� �������� �������������� ����������� �����
    // �� ����� Agree.
    if (!CryptImportKey(hProvResponder,
                        pbKeyBlobSimple,
                        dwBlobLenSimple,
                        hAgreeKey,
                        0,
                        &hSessionKey))
        log.Add("Error during CryptImportKey session key.");
    //--------------------------------------------------------------------
    // �������� ���������� ��������� ������������.
    if (!CertCloseStore(hStoreHandle, 0))
        return log.Error("Error closing store handle.");
    //--------------------------------------------------------------------
    //  ������������ ������, ������������ ��������� BLOB���.
    free(pbKeyBlobSimple);
    free(pbKeyBlobSender);
    // ����������� ����������� ��������� ����� ����������.
    if (hResponderKey)
        CryptDestroyKey(hResponderKey);
    // ����������� ����������� ��������� ����� �����������.
    if( hSenderKey)
        CryptDestroyKey(hSenderKey);
    // ����������� ����������� �����.
    if (hSessionKey)
        CryptDestroyKey(hSessionKey);
    // ����������� ����� ������������.
    if (hAgreeKey)
        CryptDestroyKey(hAgreeKey);
    // ������������ ����������� ����������.
    if (hProvResponder)
        CryptReleaseContext(hProvResponder, 0);
    // ������������ ��������� �����������.
    if (pCertSender)
        CertFreeCertificateContext(pCertSender);
    if( pCertResponder)
        CertFreeCertificateContext(pCertResponder);
    log.Add("The program ran to completion without error.");
    return 0;
}







//CertGetCertificateChain
//CertCreateCertificateChainEngine

//��� ��������� ������� �����������?
//CryptVerifyCertificateSignatureEx


