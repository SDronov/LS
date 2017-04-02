unit dxPsStrs_RUS;

interface

implementation

uses
  cxClasses, dxPSRes;

procedure SetStrings;
begin
  cxSetResourceString(@sdxBtnOK , 'OK');
  cxSetResourceString(@sdxBtnOKAccelerated , '&OK');
  cxSetResourceString(@sdxBtnCancel , '������');
  cxSetResourceString(@sdxBtnClose , '�������');
  cxSetResourceString(@sdxBtnApply , '&���������');
  cxSetResourceString(@sdxBtnYes , '&��');
  cxSetResourceString(@sdxBtnNo , '&���');
  cxSetResourceString(@sdxPrintDialogNoPrinters, '������� �� ����������.');
//      'No printers are installed. To install a printer, ' +
//    'point to Settings on the Windows Start menu, click Printers, and then double-click Add Printer. ' +
//    'Follow the instructions in the wizard.');

//  cxSetResourceString(@sdxBtnEdit , '&Editar...');
  cxSetResourceString(@sdxBtnReset , '&��������');
  cxSetResourceString(@sdxBtnAdd , '&��������');
//  cxSetResourceString(@sdxBtnAddComposition , 'Adicionar &Composicao');
//  cxSetResourceString(@sdxBtnDefault , '&Padrao...');
  cxSetResourceString(@sdxBtnDelete , '�&������...');
//  cxSetResourceString(@sdxBtnDescription , '&Descricao...');
  cxSetResourceString(@sdxBtnCopy , '&���-�� �����...');
  cxSetResourceString(@sdxBtnYesToAll , '�� ��� &����');
//  cxSetResourceString(@sdxBtnRestoreDefaults , '&Restaurar Padroes');
//  cxSetResourceString(@sdxBtnRestoreOriginal , 'Restaurar &Original');
  cxSetResourceString(@sdxBtnTitleProperties , '���������...');
 cxSetResourceString(@sdxBtnProperties , '&��������...');
 cxSetResourceString(@sdxBtnNetwork , '��&����������...');
 cxSetResourceString(@sdxBtnBrowse , '&�����...');
 cxSetResourceString(@sdxBtnPageSetup , '���������...');
 cxSetResourceString(@sdxBtnPrintPreview , '&��������� ��������...');
 cxSetResourceString(@sdxBtnPreview , '&��������...');
 cxSetResourceString(@sdxBtnPrint , '������');
 cxSetResourceString(@sdxBtnOptions , '&��������...');
 cxSetResourceString(@sdxBtnStyleOptions , '��������� �����...');
 cxSetResourceString(@sdxBtnDefinePrintStyles , '&������� �����...');
 cxSetResourceString(@sdxBtnPrintStyles , '����� ������');
 cxSetResourceString(@sdxBtnBackground , '�&��');
// cxSetResourceString(@sdxBtnShowToolBar , 'Exibir Barra de Ferramen&tas');
// cxSetResourceString(@sdxBtnDesign , 'D&esign...');
// cxSetResourceString(@sdxBtnMoveUp , 'Move para &cima');
// cxSetResourceString(@sdxBtnMoveDown , 'Mover para &baixo');
// cxSetResourceString(@sdxBtnMoreColors , '&Mais cores...');
 cxSetResourceString(@sdxBtnFillEffects , '&���������� ���...');
 cxSetResourceString(@sdxBtnNoFill , '&��� ����������');
 cxSetResourceString(@sdxBtnAutomatic , '&����');
 cxSetResourceString(@sdxBtnNone , '&���');
// cxSetResourceString(@sdxBtnOtherTexture , 'Outras Te&xturas...');
// cxSetResourceString(@sdxBtnInvertColors , 'I&nverter Cores');
 cxSetResourceString(@sdxBtnSelectPicture , '�&������ �����������...');

 cxSetResourceString(@sdxPrintDialogCaption , '������');
 cxSetResourceString(@sdxPrintDialogPrinter , ' ������� ');
 cxSetResourceString(@sdxPrintDialogName , '&���:');
 cxSetResourceString(@sdxPrintDialogStatus , '������:');
 cxSetResourceString(@sdxPrintDialogType , '���:');
 cxSetResourceString(@sdxPrintDialogWhere , '����:');
 cxSetResourceString(@sdxPrintDialogComment , '����������:');
 cxSetResourceString(@sdxPrintDialogPrintToFile , '�&����� � ����');
 cxSetResourceString(@sdxPrintDialogPageRange , ' �������� ');
 cxSetResourceString(@sdxPrintDialogAll , '&���');
 cxSetResourceString(@sdxPrintDialogCurrentPage , '&�������');
 cxSetResourceString(@sdxPrintDialogPages , '&������:');
 cxSetResourceString(@sdxPrintDialogRangeLegend , '������� ������ ��� ��������� �������'
                      + ' ����������� ��������. ��������: 1,3,5-12.');
 cxSetResourceString(@sdxPrintDialogCopies , ' ����� ');
 cxSetResourceString(@sdxPrintDialogNumberOfPages , '����&����:');
 cxSetResourceString(@sdxPrintDialogNumberOfCopies , '����� &�����:');
 cxSetResourceString(@sdxPrintDialogCollateCopies , '��������&� �� ������');
 cxSetResourceString(@sdxPrintDialogAllPages , '��� ��������');
 cxSetResourceString(@sdxPrintDialogEvenPages , '������');
 cxSetResourceString(@sdxPrintDialogOddPages , '��������');
end;

initialization
   SetStrings;

end.
