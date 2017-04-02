dcc32.exe IAccFTP.dpr -B -H- -W- -N".\out" -LE"..\Bin" -LN".\out" -L -U%LIB7%;%RES7% -R%RES7%

copy /Y .\files\iaccftp.ini_sample  ..\bin\*.*
copy /Y .\files\iaccftp_2Serv.ini_sample  ..\bin\*.*
copy /Y .\out\IAccFTP.exe  ..\bin\*.*

del .\out\*.dcu