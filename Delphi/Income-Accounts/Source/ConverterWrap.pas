
{///////////////////////////////////////////////////////////////////////////////
�����: CConverterWrap
------------------
///////////////////////////////////////////////////////////////////////////////}

unit ConverterWrap;

interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

    function Convert(CfgFile: PChar; InDir: PChar; InName: PChar): Boolean; stdcall; external 'Converter2.dll';
//--���������-------------------------------------------------------------------
    function PackData(ArchDir: PChar; ArchName: PChar; FileDir: PChar; FileName: PChar): Integer; stdcall; external 'Packer.dll';
    function CreateTxt(Dir: PChar; FileName: PChar; CustomsName: PChar; TypeInfo: PChar; CustomsCode: PChar; ReceiverName: PChar; Performer: PChar; Currency: PChar): Boolean; stdcall; external 'Packer.dll';


type
    //����� - ������� ��� ������ ������ ���������� � ����������
    CConverterWrap = class
    private
{
������ ������������ ���������� (������ ����� SetParam)
CustomsName     - ������������ ����������� ������
CustomsCode     - ��� ����������� ������
Performer       - �����������
TypeInfo        - ��� ������������ ���������� (�����)
Currency        - ��� ������
ReceiverName    - ������������ ���������� (������� ����������)
}
        Params: TStringList;

    public
        procedure   Init();
        procedure   SetParam(Name: String; Value: String);

        // ������������ + ����������� + ������� ���� �������������
        function    Execute(CfgFile: String; InDir: String; InFile: String; OutDir: String; PrefixName: String; var ArchName: String): Boolean;

    end;


implementation
////////////////////////////////////////////////////////////////////////////////
//--��������� ����������
////////////////////////////////////////////////////////////////////////////////
    procedure CConverterWrap.SetParam(Name: String; Value: String);
    begin
        Params.Values[Name] := Value;
    end;
////////////////////////////////////////////////////////////////////////////////
//--������ �������� ���������� � ������������
    procedure CConverterWrap.Init();
    begin
        Params          := TStringList.Create;
    end;
////////////////////////////////////////////////////////////////////////////////
//--������� � ������������� �������
    function CConverterWrap.Execute(CfgFile: String; InDir: String; InFile: String; OutDir: String; PrefixName: String; var ArchName: String): Boolean;
    var
        file_len: Integer;
    begin
        Convert(PChar(CfgFile), PChar(InDir), PChar(InFile));
//--������� � ������������� �������
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
