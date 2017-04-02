//---------------------------------------------------------------------------
#include "CryptoProCommon.h"
#pragma hdrstop
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#pragma argsused
//int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void* lpReserved)
//{
//    return 1;
//}

//---------------------------------------------------------------------------
DWORD LastError(LogDLL *Log)
{
    DWORD err = GetLastError();
    SetLastError(0);
    if (err)
    {
        LPVOID lpMsgBuf;
        FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
                      FORMAT_MESSAGE_FROM_SYSTEM     |
                      FORMAT_MESSAGE_IGNORE_INSERTS,
                      NULL,
                      err,
                      MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                      (LPTSTR) &lpMsgBuf,
                      0,
                      NULL);
        if(lpMsgBuf)
        {
            Log->Add(Trim((char*)lpMsgBuf).c_str());
            LocalFree(lpMsgBuf);
        }
    }
    return err;
}
//---------------------------------------------------------------------------

