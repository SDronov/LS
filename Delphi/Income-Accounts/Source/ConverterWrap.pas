
{///////////////////////////////////////////////////////////////////////////////
Класс: CConverterWrap
------------------
///////////////////////////////////////////////////////////////////////////////}

unit ConverterWrap;

interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

    function Convert(CfgFile: PChar; InDir: PChar; InName: PChar): Boolean; stdcall; external 'Converter2.dll';
//--Упаковщик-------------------------------------------------------------------
    function PackData(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall; external 'Packer.dll';
    function CreateTxt(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean; stdcall; external 'Packer.dll';


type
    //Класс - обертка для вызова систем шифрования и упаковщика
    CConverterWrap = class
    private
{
СПИСОК ИСПОЛЬЗУЕМЫХ ПАРАМЕТРОВ (задаем через SetParam)
CustomsName     - наименование таможенного органа
CustomsCode     - код таможенного органа
Performer       - исполнитель
TypeInfo        - тип передаваемой информации (текст)
Currency        - код валюты
ReceiverName    - наименование получателя (таможни назначения)
}
        Params: TStringList;

    public
        procedure   Init();
        procedure   SetParam(Name: String; Value: String);

        // Конвертируем + упаковываем + создаем файл сопровождения
        function    Execute(CfgFile: String; InDir: String; InFile: String; OutDir: String; PrefixName: String; var ArchName: String): Boolean;

    end;


implementation
////////////////////////////////////////////////////////////////////////////////
//--Загружаем библиотеку
////////////////////////////////////////////////////////////////////////////////
    procedure CConverterWrap.SetParam(Name: String; Value: String);
    begin
        Params.Values[Name] := Value;
    end;
////////////////////////////////////////////////////////////////////////////////
//--Задаем каталоги шифрования и дешифрования
    procedure CConverterWrap.Init();
    begin
        Params          := TStringList.Create;
    end;
////////////////////////////////////////////////////////////////////////////////
//--Готовим и зашифровываем конверт
    function CConverterWrap.Execute(CfgFile: String; InDir: String; InFile: String; OutDir: String; PrefixName: String; var ArchName: String): Boolean;
    var
        file_len: Integer;
    begin
        Convert(PChar(CfgFile), PChar(InDir), PChar(InFile));
//--Готовим и зашифровываем конверт
        file_len := PackData(PChar(OutDir),
                             PChar(PrefixName),
                             PChar(InDir),
                             '*.DBF');

        if (file_len > 0) then
            CreateTxt(PChar(OutDir),
                      PChar(PrefixName),
                      PChar(Params.Values['CustomsName']),
                      PChar(Params.Values['TypeInfo']),
                      PChar(Params.Values['CustomsCode']),
                      PChar(Params.Values['ReceiverName']),
                      PChar(Params.Values['Performer']),
                      PChar(Params.Values['Currency']));

        Result := True;
        if (file_len = 0) then
            Result := False
    end;
////////////////////////////////////////////////////////////////////////////////
end.
