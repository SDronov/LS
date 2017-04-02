unit uZip;

interface

uses
 SysUtils, Classes,
 ztvConsts,
 ztvHeaders,
 ztvStreams,
 ztvUUDecode,
 ztvRegister,
 ztvBase,
 ztvGbls,
 ztvMakeCab,
 ztvFileIo,
 ztvZipTV,
 ztvZip,
 ztvUnZIP, ztvUnArc, ztvUnArj, ztvUnBh, ztvUnCab, ztvUnGZip, ztvUnLha,
 ztvUnRar, ztvUnTar, ztvUnZoo;

type
  TdmZIP = class(TDataModule)
    Zip: TZip;
    UnZip: TUnZip;
    ZipTV: TZipTV;
  private
    { Private declarations }
  public
    procedure ZIP2files( const aArchFile, aExtractDir: TFileName; var aFiles:TStrings; const aMask: string = '*.*' );
    procedure file2ZIP( aSrcFile, aArchFile: TFileName );

  end;

var
  dmZIP: TdmZIP;

implementation

{$R *.dfm}

{ TdmZIP }
procedure TdmZIP.ZIP2files( const aArchFile, aExtractDir: TFileName; var aFiles:TStrings; const aMask: string = '*.*' );
begin
 zipTV.ArchiveFile:= aArchFile;
 if not(zipTV.ArcType in [atZip, atZipExe]) then
   raise Exception.Create(aArchFile + ' не является архивом формата ZIP');

 zipTV.ExcludeSpec.Clear;
 zipTV.FileSpec.Clear;
 zipTV.FileSpec.Add(aMask);

 if (not Assigned(aFiles)) then
   aFiles:= TStringList.Create
 else aFiles.Clear;
 zipTV.FilesInArchive(aFiles);

 unZip.FileSpec.Clear();
 unZip.FileSpec.Add(aMask); 	// *.* = extract all

 unZip.ExtractDir := aExtractDir;
 unZip.ArchiveFile := zipTV.ArchiveFile;

 unZip.OverwriteMode := omOverwrite;
 unZip.ConfirmOverwrites := false; 	// default = False
 unZip.Extract;

end;

procedure TdmZIP.file2ZIP( aSrcFile, aArchFile: TFileName );
begin
 Zip.CompressMethod := cmStore; //cmDeflate;    // default value
 Zip.FileSpec.Clear();
 Zip.FileSpec.Add( aSrcFile );  // test with c:\windows\*.txt

 Zip.ArchiveFile := aArchFile;      // archive filename

 Zip.Compress;
end;

end.
