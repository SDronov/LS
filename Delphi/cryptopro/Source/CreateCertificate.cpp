//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//==============================================================================
DWORD CreateCertificate(char *BLog, int SizeLog, const char *CerName, DWORD *dwSize)
{
    LogDLL log(BLog, SizeLog);

    CERT_RDN_ATTR rgNameAttr[1] = {szOID_COMMON_NAME, // pszObjId
                                   CERT_RDN_PRINTABLE_STRING, // dwValueType
                                   strlen(CerName), // value.cbData
                                   (BYTE*)CerName}; // value.pbData
    CERT_RDN rgRDN[]            = {1, // rgRDN[0].cRDNAttr
                                   &rgNameAttr[0]}; // rgRDN[0].rgRDNAttr
    CERT_NAME_INFO Name         = {1, // Name.cRDN
                                   rgRDN}; // Name.rgRDN

    //-------------------------------------------------------------------
    CERT_REQUEST_INFO CertReqInfo;
    CERT_NAME_BLOB SubjNameBlob;
    DWORD cbNameEncoded;
    BYTE* pbNameEncoded;
    HCRYPTPROV hCryptProv;
    DWORD cbPublicKeyInfo;
    CERT_PUBLIC_KEY_INFO* pbPublicKeyInfo;
    CRYPT_OBJID_BLOB Parameters;
    CRYPT_ALGORITHM_IDENTIFIER SigAlg;
    BYTE* pbSignedEncodedCertReq;
    char* pSignedEncodedCertReqBlob;
    BOOL bResult = FALSE;
    char szContainer[] = {"crt_containner"};
    CHAR* szProvider = NULL;//CP_DEF_PROV;
    //CHAR* szProvider = MS_ENHANCED_PROV;
    DWORD dwProviderType = 75;
    RPC_STATUS Status;

    if (!CryptEncodeObject(MY_ENCODING_TYPE, // Encoding type
                           X509_NAME, // Structure type
                           &Name, // Address of CERT_NAME_INFO structure
                           NULL, // pbEncoded
                           &cbNameEncoded)) // pbEncoded size
{
//("First call to CryptEncodeObject failed. A public/private key pair may not exit in the container.");
}
    //-------------------------------------------------------------------
    // Allocate memory for the encoded name.
    if (!(pbNameEncoded = (BYTE*)malloc(cbNameEncoded)))
        printf("pbNamencoded malloc operation failed.");
    //-------------------------------------------------------------------
    // Call CryptEncodeObject to do the actual encoding of the name.
    if (!CryptEncodeObject(MY_ENCODING_TYPE, // Encoding type
                           X509_NAME, // Structure type
                           &Name, // Address of CERT_NAME_INFO structure
                           pbNameEncoded, // pbEncoded
                           &cbNameEncoded)) // pbEncoded size
    {
        free(pbNameEncoded);
//("Second call to CryptEncodeObject failed.");
    }
    //--------------------------------------------------------------------
    // Set the subject member of CertReqInfo to point to
    // a CERT_NAME_INFO structure that
    // has been initialized with the data from cbNameEncoded
    // and pbNameEncoded.
    SubjNameBlob.cbData = cbNameEncoded;
    SubjNameBlob.pbData = pbNameEncoded;
    CertReqInfo.Subject = SubjNameBlob;
    //--------------------------------------------------------------------
    // Generate custom information. This step is not
    // implemented in this code.
    CertReqInfo.cAttribute = 0;
    CertReqInfo.rgAttribute = NULL;
    CertReqInfo.dwVersion = CERT_V1;
    // Create a random uuid
//    UUID Uuid;
//    Status = UuidCreate(&Uuid);
//    if (Status != RPC_S_OK)
//("Unable to create random container.");
    // convert random uuid to a string, we will use it as a container
//    Status = UuidToString(&Uuid, (unsigned char **)&szContainer);
//    if (Status != RPC_S_OK)
//("Unable to convert uuid to string\.);
    // Create new crypto context
    bResult = CryptAcquireContext(&hCryptProv,
                                  szContainer,
                                  szProvider,
                                  dwProviderType,
                                  CRYPT_NEWKEYSET);
    if (!bResult)
    {
//return ("CryptAcquireContext failed.");
    }
    bResult = CryptSetProvParam(hCryptProv, PP_KEYEXCHANGE_PIN, (BYTE*)"pass", 0);
    if (!bResult)
    {
//return ("CryptSetProvParam failed,");
    }
DWORD dwKeyType = AT_KEYEXCHANGE;
HCRYPTKEY hPubKey = 0;
// Generate Private/Public key pair
bResult = CryptGenKey(hCryptProv, dwKeyType, CRYPT_EXPORTABLE, &hPubKey);
if (!bResult)
{
printf("CryptGenKey failed with %x\n", GetLastError());
}

if(CryptExportPublicKeyInfo(
hCryptProv, // Provider handle
dwKeyType, // Key spec
MY_ENCODING_TYPE, // Encoding type
NULL, // pbPublicKeyInfo
&cbPublicKeyInfo)) // Size of PublicKeyInfo
{
printf("The keyinfo structure is %d bytes.\n",cbPublicKeyInfo);
}
else
{
free(pbNameEncoded);
printf("First call to CryptExportPublickKeyInfo failed.\
\nProbable cause: No key pair in the key container. Error = %d\n", GetLastError());
}

if(pbPublicKeyInfo =
(CERT_PUBLIC_KEY_INFO*)malloc(cbPublicKeyInfo))
{
printf("Memory is allocated for the public key structure. \n");
}
else
{
free(pbNameEncoded);
printf("Memory allocation failed.");
}

if(CryptExportPublicKeyInfo(
hCryptProv, // Provider handle
dwKeyType, // Key spec
MY_ENCODING_TYPE, // Encoding type
pbPublicKeyInfo, // pbPublicKeyInfo
&cbPublicKeyInfo)) // Size of PublicKeyInfo
{
printf("The key has been exported. \n");
}
else
{
free(pbNameEncoded);
free(pbPublicKeyInfo);
printf("Second call to CryptExportPublicKeyInfo failed.");
}
//--------------------------------------------------------------------
// Set the SubjectPublicKeyInfo member of the
// CERT_REQUEST_INFO structure to point to the CERT_PUBLIC_KEY_INFO
// structure created.

CertReqInfo.SubjectPublicKeyInfo = *pbPublicKeyInfo;

memset(&Parameters, 0, sizeof(Parameters));
SigAlg.pszObjId = szOID_OIWSEC_sha1RSASign;
SigAlg.Parameters = Parameters;

//--------------------------------------------------------------------
// Call CryptSignAndEncodeCertificate to get the size of the
// returned BLOB.

if(CryptSignAndEncodeCertificate(
hCryptProv, // Crypto provider
AT_KEYEXCHANGE, // Key spec
MY_ENCODING_TYPE, // Encoding type
X509_CERT_REQUEST_TO_BE_SIGNED, // Structure type
&CertReqInfo, // Structure information
&SigAlg, // Signature algorithm
NULL, // Not used
NULL, // pbSignedEncodedCertReq
dwSize)) // Size of certificate
// required
{
printf("The size of the encoded certificate is set. \n");
}
else
{
free(pbNameEncoded);
free(pbPublicKeyInfo);
printf("First call to CryptSignandEncode failed.");
}
//--------------------------------------------------------------------
// Allocate memory for the encoded certificate request.

if(pbSignedEncodedCertReq = (BYTE*)malloc(*dwSize))
{
printf("Memory has been allocated.\n");
}
else
{
free(pbNameEncoded);
free(pbPublicKeyInfo);
printf("Malloc operation failed.");
}
//--------------------------------------------------------------------
// Call CryptSignAndEncodeCertificate to get the 
// returned BLOB.

if(CryptSignAndEncodeCertificate(
hCryptProv, // Crypto provider
AT_KEYEXCHANGE, // Key spec
MY_ENCODING_TYPE, // Encoding type
X509_CERT_REQUEST_TO_BE_SIGNED, // Struct type
&CertReqInfo, // Struct info 
&SigAlg, // Signature algorithm
NULL, // Not used
pbSignedEncodedCertReq, // Pointer
dwSize)) // Length of the message
{
printf("The message is encoded and signed. \n");
}
else
{
free(pbNameEncoded);
free(pbPublicKeyInfo);
printf("Second call to CryptSignAndEncode failed.");
}

DWORD dwSize64 = *dwSize*2;
LPBYTE pBase64Req = (LPBYTE)malloc(dwSize64);

    HINSTANCE hDll;
    DWORD (WINAPI *CryptBinaryToString) (BYTE*, DWORD, DWORD, BYTE*, DWORD*);
    hDll = LoadLibrary ("crypt32.dll");
    (FARPROC) CryptBinaryToString = GetProcAddress(hDll, "CryptBinaryToStringA");
/*
  // Flags:
  CRYPT_STRING_BASE64HEADER = 0;
  // Base64, with certificate beginning and ending headers
  CRYPT_STRING_BASE64 = 1;
  // Base64, without headers
  CRYPT_STRING_BINARY = 2;
  // Pure binary copy
  CRYPT_STRING_BASE64REQUESTHEADER = 3;
  // Base64, with request beginning and ending headers
  CRYPT_STRING_HEX = 4;
  // Hexadecimal only
  CRYPT_STRING_HEXASCII= 5;
  // Hexadecimal, with ASCII character display
  CRYPT_STRING_BASE64X509CRLHEADER = 9;
  // Base64, with X.509 CRL beginning and ending headers
  CRYPT_STRING_HEXADDR = 10;
  // Hexadecimal, with address display
  CRYPT_STRING_HEXASCIIADDR = 11;
  // Hexadecimal, with ASCII character and address display
  CRYPT_STRING_HEXRAW = 12;
  // A raw hex string.
*/
      int t = CryptBinaryToString(pbSignedEncodedCertReq, *dwSize, 4, pBase64Req, &dwSize64);
    FreeLibrary(hDll);
    log.Add(pBase64Req);


*dwSize = dwSize64;
free(pbSignedEncodedCertReq);
free(pbNameEncoded);
free(pbPublicKeyInfo);
CryptReleaseContext(hCryptProv,0);

}


 