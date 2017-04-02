//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------
int Format64 = 1;
//==============================================================================
DWORD _stdcall EncryptMessage(char *BLog
                             ,int SizeLog
                             ,unsigned long CryptProv
                             ,BYTE *Msg
                             ,DWORD MsgLen
                             ,BYTE *pbEncryptedBlob
                             ,DWORD *cbEncryptedBlob
                             ,const char *CertStoreName
                             ,const int CountSubject
                             ,char *Subject
                             ,const char *Signer
                             ,bool WithSign
                             ,const char *Password)
{
    DWORD lresult = 0;
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------

    AnsiString log_msg;
    log_msg = AnsiString("���������� �����������: ") + IntToStr(CountSubject);
    //--------------------------------------------------------------------
    if (CountSubject > 255)
    {
     return log.Error("������: ���������� ����������� ������ 255.");
    }
    //--------------------------------------------------------------------
    if (CryptProv > 0 && Password)
    {
        if (!CryptSetProvParam(CryptProv,
                               PP_KEYEXCHANGE_PIN,
                               (BYTE*)Password,
                               0))
        {
          return log.Error("������ ��� ����� ������.");
        }
    }
    //--------------------------------------------------------------------
    HCERTSTORE StoreHandle = 0;
    PCCERT_CONTEXT pSenderCert;
    PCCERT_CONTEXT pRecipientCert;
    DWORD EncryptAlgSize;
    CRYPT_ALGORITHM_IDENTIFIER EncryptAlgorithm;
    CRYPT_ENCRYPT_MESSAGE_PARA EncryptParams;
    DWORD EncryptParamsSize;
    //--------------------------------------------------------------------
    DWORD l_res_check;
    // ��������� ����������� �����������
    pSenderCert = GetCertificate(&log, CryptProv, StoreHandle, CertStoreName, Signer, true);
    if (!pSenderCert)
    {
      lresult = log.Error("������ ��� ������ ����������� �����������.");
    }
    else
    {
      log_msg = AnsiString("���������� ����������� ������� (��������� - ") + CertStoreName + ", ����� �� - " + Signer;
      log.Add(log_msg.c_str());
      //--�������� ����������� (������ ��� ����������� ������� ������������� ������ )
      if (!pbEncryptedBlob)
      {
         lresult = 1;
         char *l_tmp_log = log.Buf + AnsiString(log.Buf).Length();
         l_res_check = CheckCertChain(&log, pSenderCert);
         if (l_res_check == MY_C_EXEC_IS_WARNING)
         {
           AnsiString l_tmp_msg = AnsiString("---")+AnsiString(l_tmp_log)+AnsiString("\n---\n������������ ���������� ��� ����������?");
           if ( Application->MessageBox(l_tmp_msg.c_str(), "���������� ����������� �� ������ ��������", MB_YESNO) == IDYES)
           {
             l_res_check = MY_C_EXEC_IS_SUCCESS;
             log.Add("������������ ���������� ������������� ����������� �� ���������� ��������.");
           }
         };
         if (l_res_check == MY_C_EXEC_IS_SUCCESS)
         {
           lresult = 0;
         }
      }
    };
    //--
    if (lresult != 0)
    {
      if (!pSenderCert) CertFreeCertificateContext(pSenderCert);
      return lresult;
    };
    //--------------------------------------------------------------------
    PCCERT_CONTEXT RecipientCertArray[255];
    int CountRecipientCert = 0;
    int i;
    char *l_tmp_str = Subject;
    for (i = 0;i<CountSubject;i++)
    {
      if (strlen(l_tmp_str))
      {
        pRecipientCert = GetCertificate(&log, CryptProv, StoreHandle, CertStoreName, l_tmp_str, false);
        if (!pRecipientCert)
        {
         log_msg = AnsiString("������ ��� ������ ����������� ����������. (��������� - ") + CertStoreName + ", ����� �� - " + l_tmp_str + ")";
         log.Error(log_msg.c_str());
        }
        else
        {
         log_msg = AnsiString("���������� ���������� ������� (��������� - ") + CertStoreName + ", ����� �� - " + l_tmp_str + ")";
         log.Error(log_msg.c_str());
         //-- �������� �����������
         if (!pbEncryptedBlob)
         {
           RecipientCertArray[CountRecipientCert] = pRecipientCert;
           CountRecipientCert++;
         }
         else
         {
           char *l_tmp_log = log.Buf + AnsiString(log.Buf).Length();
           l_res_check = CheckCertChain(&log, pRecipientCert);
           if (l_res_check == MY_C_EXEC_IS_WARNING)
           {
             AnsiString l_tmp_msg = AnsiString("---")+AnsiString(l_tmp_log)+AnsiString("\n---\n������������ ���������� ��� ����������?");
             if ( Application->MessageBox(l_tmp_msg.c_str(), "���������� ���������� �� ������ ��������", MB_YESNO) == IDYES)
             {
               l_res_check = MY_C_EXEC_IS_SUCCESS;
               log.Add("������������ ���������� ������������� ����������� �� ���������� ��������.");
             }
           };
           if (l_res_check == MY_C_EXEC_IS_SUCCESS)
           {
             RecipientCertArray[CountRecipientCert] = pRecipientCert;
             CountRecipientCert++;
           }
         };
         if (!pRecipientCert) CertFreeCertificateContext(pRecipientCert);
        }
      }
      if (i < CountSubject -1) l_tmp_str = l_tmp_str + strlen(l_tmp_str)+1;
    }
    if (CountRecipientCert == 0)
    {
      log.Add("������ ��� ������ ������������ �����������. �� ������ ����������� ����������� �� �������!");
      return 1;
    }
    //--------------------------------------------------------------------
    EncryptAlgSize = sizeof(EncryptAlgorithm);
    memset(&EncryptAlgorithm, 0, EncryptAlgSize);
    EncryptAlgorithm.pszObjId = szOID_RSA_RC4;//OID_CipherVar_Default;
    EncryptAlgorithm.Parameters.cbData = 0;
    //--------------------------------------------------------------------
    // ������������� ��������� CRYPT_ENCRYPT_MESSAGE_PARA.
    EncryptParamsSize = sizeof(EncryptParams);
    memset(&EncryptParams, 0, EncryptParamsSize);
    EncryptParams.cbSize =  EncryptParamsSize;
    EncryptParams.dwMsgEncodingType = MY_ENCODING_TYPE;
    EncryptParams.hCryptProv = CryptProv;
    EncryptParams.ContentEncryptionAlgorithm = EncryptAlgorithm;
    EncryptParams.pvEncryptionAuxInfo = NULL;
    EncryptParams.dwFlags = 0;
    EncryptParams.dwInnerContentType = 0;
    //--------------------------------------------------------------------
    if (!WithSign)
    {//  ��� �������
      if (!pbEncryptedBlob)
      {// ���������� ������ ����������� ������
        if (!CryptEncryptMessage(&EncryptParams,
                                 CountRecipientCert,
                                 RecipientCertArray,
                                 Msg,
                                 MsgLen,
                                 NULL,
                                 cbEncryptedBlob))
        {
           lresult = log.Error("�� ������� �������� ������ �������������� �����.");
        }
        else
        {
          // ������
          log.Add(IntToStr(*cbEncryptedBlob).c_str());
        }
      }
      else
      {// �������
          //--------------------------------------------------------------------
          if (!CryptEncryptMessage(&EncryptParams,
                                   CountRecipientCert,
                                   RecipientCertArray,
                                   Msg,
                                   MsgLen,
                                   (BYTE*)pbEncryptedBlob,
                                   cbEncryptedBlob))
          {
            lresult = log.Error("������ ����������.");
          }
          else
          {
            // ������
            log.Add(IntToStr(*cbEncryptedBlob).c_str());
          }
      }
    }
    //--------------------------------------------------------------------
    else
    {//  � ��������
      PCCERT_CONTEXT SenderCertArray[] = {pSenderCert};
      // ������������� ���������, ����������� ��� �������� �������
      CRYPT_SIGN_MESSAGE_PARA SignPara;
      ZeroMemory(&SignPara, sizeof(SignPara));

      SignPara.cbSize = sizeof(SignPara);
      SignPara.dwMsgEncodingType = MY_ENCODING_TYPE;//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING;
      SignPara.HashAlgorithm.pszObjId = (LPSTR)CertAlgIdToOID(CALG_MD5);
      SignPara.pSigningCert = pSenderCert;
      SignPara.cMsgCert = 1;
      SignPara.rgpMsgCert = SenderCertArray;

      SignPara.HashAlgorithm.pszObjId = szOID_RSA_MD2;
      SignPara.HashAlgorithm.Parameters.cbData = 0;
      SignPara.pvHashAuxInfo = NULL;
      SignPara.cMsgCrl = 0;
      SignPara.rgpMsgCrl = NULL;
      SignPara.cAuthAttr = 0;
      SignPara.rgAuthAttr = NULL;
      SignPara.cUnauthAttr = 0;
      SignPara.rgUnauthAttr = NULL;
      SignPara.dwFlags = 0;
      SignPara.dwInnerContentType = 0;
      //--------------------------------------------------------------------
      if (!pbEncryptedBlob)
      {
         // ���������� ������ ����������� ������
         if (!CryptSignAndEncryptMessage(&SignPara,
                                         &EncryptParams,
                                         CountRecipientCert,
                                         RecipientCertArray,
                                         Msg,
                                         MsgLen,
                                         NULL,
                                         cbEncryptedBlob))
         {
           lresult = log.Error("�� ������� �������� ������ �������������� �����.");
         }
         else
         {
           // ������
           log.Add(IntToStr(*cbEncryptedBlob).c_str());
         }
      }
      else
      {
        // �������
        //--------------------------------------------------------------------
        if (!CryptSignAndEncryptMessage(&SignPara,
                                        &EncryptParams,
                                        CountRecipientCert,
                                        RecipientCertArray,
                                        Msg,
                                        MsgLen,
                                        (BYTE*)pbEncryptedBlob,
                                        cbEncryptedBlob))
        {
           lresult = log.Error("������ ����������.");
        }
        else
        {
          // ������
          log.Add(IntToStr(*cbEncryptedBlob).c_str());
        }
      }
    }
    // ������������ ������.
    if (!pSenderCert) CertFreeCertificateContext(pSenderCert);
    for (i = 0;i<CountRecipientCert;i++)
    {
     if (!RecipientCertArray[i]) CertFreeCertificateContext(RecipientCertArray[i]);
    }
    //CertFreeCertificateContext(pRecipientCert);
    if (!CertCloseStore(StoreHandle, CERT_CLOSE_STORE_CHECK_FLAG))
       printf("��������� ������� �� �� ��� ����������� �����������.");
    //--------------------------------------------------------------------
    if (lresult == 0 && pbEncryptedBlob) log.Add("���� ����������");
    return lresult;
}

//==============================================================================
// ������� ��������� ������ ��� ���������
// CRYPT_VERIFY_MESSAGE_PARA VerifyParams;
PCCERT_CONTEXT WINAPI MyGetSignerCertificateCallback(
  void *pvGetArg,                  // in
  DWORD dwCertEncodingType,        // in
  PCERT_INFO pSignerId,            // in
  HCERTSTORE hMsgCertStore         // in
)
{
  return PCCERT_CONTEXT(pvGetArg);
};
//==============================================================================
DWORD _stdcall DecryptMessage(char *BLog, int SizeLog, unsigned long CryptProv,
                              BYTE *pbDecryptedMessage, DWORD *cbDecryptedMessage,
                              BYTE *pbEncryptedBlob, DWORD cbEncryptedBlob,
                              const char *CertStoreName,
                              bool WithSign, const char *Password,
                              const int CountSigner, char *Signer)
{
    DWORD lresult = 0;
    LogDLL log(BLog, SizeLog);
    //--------------------------------------------------------------------
    if (CryptProv > 0 && Password)
    {
        if (!CryptSetProvParam(CryptProv,
                               PP_KEYEXCHANGE_PIN,
                               (BYTE*)Password,
                               0))
           return log.Error("������ ��� ����� ������.");
    }
    //--------------------------------------------------------------------
    PCCERT_CONTEXT pRecipientCert;
    HCERTSTORE StoreHandle;
    CRYPT_DECRYPT_MESSAGE_PARA  DecryptParams;
    DWORD  DecryptParamsSize = sizeof(DecryptParams);
    //--------------------------------------------------------------------
    StoreHandle = CertOpenSystemStore(CryptProv, CertStoreName);
    HCERTSTORE CertStoreArray[] = {StoreHandle};
    //--------------------------------------------------------------------
    memset(&DecryptParams, 0, DecryptParamsSize);
    DecryptParams.cbSize = DecryptParamsSize;
    DecryptParams.dwMsgAndCertEncodingType = MY_ENCODING_TYPE;
    DecryptParams.cCertStore = 1;
    DecryptParams.rghCertStore = CertStoreArray;
    //--------------------------------------------------------------------
    DWORD l_res_check;
    //--------------------------------------------------------------------
    if (!WithSign)
    {
      if (!pbDecryptedMessage)
      { //���������� ������ ������
        if (!CryptDecryptMessage(&DecryptParams,
                                 pbEncryptedBlob,
                                 cbEncryptedBlob,
                                 NULL,
                                 cbDecryptedMessage,
                                 &pRecipientCert))
        {
            lresult = log.Error("�� ������� �������� ������ ��������������� �����.");
        }
        else
        {
          //--- �������� ����������� ����������
          lresult = 1;
          char *l_tmp_log = log.Buf + AnsiString(log.Buf).Length();
          l_res_check = CheckCertChain(&log, pRecipientCert);
          if (l_res_check == MY_C_EXEC_IS_WARNING)
          {
            AnsiString l_tmp_msg = AnsiString("---")+AnsiString(l_tmp_log)+AnsiString("\n---\n������������ ���������?");
            if ( Application->MessageBox(l_tmp_msg.c_str(), "���������� ���������� �� ������ ��������", MB_YESNO) == IDYES)
            {
              l_res_check = MY_C_EXEC_IS_SUCCESS;
              log.Add("������������ ���������� ������������� ����������� �� ���������� ��������.");
            }
          };
           if (l_res_check == MY_C_EXEC_IS_SUCCESS)
           {
             lresult = 0;
           };
        };
      }
      else
      {
        // ��������������
        //--------------------------------------------------------------------
        if (!CryptDecryptMessage(&DecryptParams,
                                 pbEncryptedBlob,
                                 cbEncryptedBlob,
                                 pbDecryptedMessage,
                                 cbDecryptedMessage,
                                 NULL))
        {
          lresult = log.Error("������ ��� ����������");
        }
        else
        {
          log.Add(IntToStr(*cbDecryptedMessage).c_str());
        }
        //--------------------------------------------------------------------
      }
    }
    else
    {
       //---
       PCCERT_CONTEXT pSenderCert;
       // ������������� ���������, ����������� ��� �������� �������� �������
       CRYPT_VERIFY_MESSAGE_PARA VerifyPara;
       ZeroMemory(&VerifyPara, sizeof(VerifyPara));

       VerifyPara.cbSize = sizeof(VerifyPara);
       VerifyPara.dwMsgAndCertEncodingType = MY_ENCODING_TYPE;//X509_ASN_ENCODING | PKCS_7_ASN_ENCODING;
       VerifyPara.hCryptProv = CryptProv;
       VerifyPara.pfnGetSignerCertificate = NULL;//;MyGetSignerCertificateCallback;
       VerifyPara.pvGetArg = NULL; //(void*)pSignerCert;
       //--------------------------------------------------------------------
        if (!pbDecryptedMessage)
        { // ���������� ������ ������
          if (!CryptDecryptAndVerifyMessageSignature(&DecryptParams,
                                                     &VerifyPara,
                                                     0,
                                                     pbEncryptedBlob,
                                                     cbEncryptedBlob,
                                                     NULL,
                                                     cbDecryptedMessage,
                                                     &pRecipientCert,
                                                     &pSenderCert))
          {
           log.Add(IntToStr(CRYPT_E_NO_SIGNER).c_str());
           log.Add(IntToStr(GetLastError()).c_str());
           lresult = log.Error("�� ������� �������� ������ ��������������� �����.");
          }
          else
          {
            //-- �������� ����������� ����������
            lresult = 1;
            char *l_tmp_log = log.Buf + AnsiString(log.Buf).Length();
            l_res_check = CheckCertChain(&log, pRecipientCert);
            if (l_res_check == MY_C_EXEC_IS_WARNING)
            {
              AnsiString l_tmp_msg = AnsiString("---")+AnsiString(l_tmp_log)+AnsiString("\n---\n������������ ���������?");
              if ( Application->MessageBox(l_tmp_msg.c_str(), "���������� ���������� �� ������ ��������", MB_YESNO) == IDYES)
              {
                l_res_check = MY_C_EXEC_IS_SUCCESS;
                log.Add("������������ ���������� ������������� ����������� �� ���������� ��������.");
              }
            };
            if (l_res_check == MY_C_EXEC_IS_SUCCESS)
            {
              lresult = 0;
            };
            //-- �������� ����������� �����������
            if (lresult == 0)
            {
              lresult = 1;
              char *l_tmp_log = log.Buf + AnsiString(log.Buf).Length();
              l_res_check = CheckCertChain(&log, pSenderCert);
              if (l_res_check == MY_C_EXEC_IS_WARNING)
              {
                AnsiString l_tmp_msg = AnsiString("---")+AnsiString(l_tmp_log)+AnsiString("\n---\n������������ ���������?");
                if ( Application->MessageBox(l_tmp_msg.c_str(), "���������� ����������� �� ������ ��������", MB_YESNO) == IDYES)
                {
                  l_res_check = MY_C_EXEC_IS_SUCCESS;
                  log.Add("������������ ���������� ������������� ����������� �� ���������� ��������.");
                }
              };
              if (l_res_check == MY_C_EXEC_IS_SUCCESS)
              {
                lresult = 0;
              };
            };
          };
        }
        else
        {
          if (!CryptDecryptAndVerifyMessageSignature(&DecryptParams,
                                                     &VerifyPara,
                                                     0,
                                                     pbEncryptedBlob,
                                                     cbEncryptedBlob,
                                                     pbDecryptedMessage,
                                                     cbDecryptedMessage,
                                                     NULL,
                                                     NULL))
          {
           log.Add(IntToStr(CRYPT_E_NO_SIGNER).c_str());
           log.Add(IntToStr(GetLastError()).c_str());
           lresult = log.Error("������ ��� ����������");
          }
          else
          {
           // ������
           log.Add(IntToStr(*cbDecryptedMessage).c_str());
          }
        }
    }
    //--------------------------------------------------------------------
    CertCloseStore(StoreHandle, CERT_CLOSE_STORE_CHECK_FLAG);
    if (lresult == 0 && pbDecryptedMessage) log.Add("���� �����������");
    return lresult;
}
//==============================================================================

