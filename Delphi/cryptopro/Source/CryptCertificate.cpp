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
    // �������� ���������� ��������� ������������.
    StoreHandle = CertOpenSystemStore(CryptProv, CertStoreName);
    if (!StoreHandle)
    {
        Log->Error("�� ������� ������� ��������� ������������.");
        return 0;
    }
    //--------------------------------------------------------------------
    // ��������� ��������� �� ����������
    recipient_cert = GetRecipientCert(Log, StoreHandle, Subject, is_cert_from_sender);
    if (!recipient_cert)
    {
// �������� �������� � GetRecipientCert
//        Log->Error("�� ������ ���������� � ������ ������.");
        return 0;
    }
    DWORD dwKeySpec;
//    if (CryptAcquireCertificatePrivateKey(recipient_cert, 0, NULL, &CryptProv, &dwKeySpec, NULL))
//    {
//        Log->Error("�� ������ ���������� � ������ ������.");
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
    // ����� ����������� � ���������
    pCertContext = CertFindCertificateInStore(CertStore,                                 // ���������� ���������
                                             MY_ENCODING_TYPE,//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,   // ��� ������������ (� ���� ������ �� ������������).
                                             0,                                         // dwFindFlags. ����������� �������� ������.
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
      Log->Error((AnsiString("�� ������� ����� ���������� ��� ") + RecName).c_str());
    }
/*
    // ����� ������������ � ��������� � ������ AT_KEYEXCHANGE.
    while(fMore &&
          (pCertContext = CertFindCertificateInStore(CertStore,                                 // ���������� ���������
                                             MY_ENCODING_TYPE,//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,   // ��� ������������ (� ���� ������ �� ������������).
                                             0,                                         // dwFindFlags. ����������� �������� ������.
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
            Log->Error("�� ������� �������� ������ �����������.");
            return 0;
        }
        //--------------------------------------------------------------
        if (pKeyInfo)
            free(pKeyInfo);
        pKeyInfo = (CRYPT_KEY_PROV_INFO*)malloc(dwSize);
        if (!pKeyInfo)
        {
            Log->Error("�� ������� �������� ������ ��� �����������.");
            return 0;
        }
        //--------------------------------------------------------------
        if (!(CertGetCertificateContextProperty(pCertContext,
                                                CERT_KEY_PROV_INFO_PROP_ID,
                                                pKeyInfo, &dwSize)))
        {
            Log->Error("�� ������� �������� ����������.");
            return 0;
        }
        //-------------------------------------------
        if (pKeyInfo->dwKeySpec == AT_KEYEXCHANGE || is_cert_from_sender)
        {
          fMore = FALSE;
        }
    }; // ����� �����
    delete subject_sub_str;
    if (pKeyInfo)
    {
        free(pKeyInfo);
        return (pCertContext);
    }
    else
    {
        if (!pCertContext)
            Log->Error((AnsiString("�� ������� ����� ���������� ��� ") + RecName).c_str());
        if ((pKeyInfo && pKeyInfo->dwKeySpec != AT_KEYEXCHANGE)||(!pKeyInfo))
            Log->Error("� ��������� ����������� ����������� ���� ������.");
    }
*/
    return 0;
}

//==============================================================================

