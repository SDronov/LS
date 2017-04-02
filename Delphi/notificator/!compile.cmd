SET RES7="C:\Program Files\Borland\Delphi7\Lib";

dcc32.exe notificator.dpr -B -H- -W- -N".\out" -R%RES7% -L -U%LIB7%;%RES7%;"..\Library\DX"

copy /Y .\notificator.exe  ..\bin\*.*
del .\out\*.dcu