unit dxPsStrs_RUS;

interface

implementation

uses
  cxClasses, dxPSRes;

procedure SetStrings;
begin
  cxSetResourceString(@sdxBtnOK , 'OK');
  cxSetResourceString(@sdxBtnOKAccelerated , '&OK');
  cxSetResourceString(@sdxBtnCancel , 'Отмена');
  cxSetResourceString(@sdxBtnClose , 'Закрыть');
  cxSetResourceString(@sdxBtnApply , '&Применить');
  cxSetResourceString(@sdxBtnYes , '&Да');
  cxSetResourceString(@sdxBtnNo , '&Нет');
  cxSetResourceString(@sdxPrintDialogNoPrinters, 'Принтер не установлен.');
//      'No printers are installed. To install a printer, ' +
//    'point to Settings on the Windows Start menu, click Printers, and then double-click Add Printer. ' +
//    'Follow the instructions in the wizard.');

//  cxSetResourceString(@sdxBtnEdit , '&Editar...');
  cxSetResourceString(@sdxBtnReset , '&Сбросить');
  cxSetResourceString(@sdxBtnAdd , '&Добавить');
//  cxSetResourceString(@sdxBtnAddComposition , 'Adicionar &Composicao');
//  cxSetResourceString(@sdxBtnDefault , '&Padrao...');
  cxSetResourceString(@sdxBtnDelete , 'У&далить...');
//  cxSetResourceString(@sdxBtnDescription , '&Descricao...');
  cxSetResourceString(@sdxBtnCopy , '&Кол-во копий...');
  cxSetResourceString(@sdxBtnYesToAll , 'Да для &всех');
//  cxSetResourceString(@sdxBtnRestoreDefaults , '&Restaurar Padroes');
//  cxSetResourceString(@sdxBtnRestoreOriginal , 'Restaurar &Original');
  cxSetResourceString(@sdxBtnTitleProperties , 'Заголовок...');
 cxSetResourceString(@sdxBtnProperties , '&Свойства...');
 cxSetResourceString(@sdxBtnNetwork , 'По&дключиться...');
 cxSetResourceString(@sdxBtnBrowse , '&Обзор...');
 cxSetResourceString(@sdxBtnPageSetup , 'Настройка...');
 cxSetResourceString(@sdxBtnPrintPreview , '&Параметры страницы...');
 cxSetResourceString(@sdxBtnPreview , '&Просмотр...');
 cxSetResourceString(@sdxBtnPrint , 'Печать');
 cxSetResourceString(@sdxBtnOptions , '&Свойства...');
 cxSetResourceString(@sdxBtnStyleOptions , 'Настройка стиля...');
 cxSetResourceString(@sdxBtnDefinePrintStyles , '&Выбрать стиль...');
 cxSetResourceString(@sdxBtnPrintStyles , 'Режим печати');
 cxSetResourceString(@sdxBtnBackground , 'Ф&он');
// cxSetResourceString(@sdxBtnShowToolBar , 'Exibir Barra de Ferramen&tas');
// cxSetResourceString(@sdxBtnDesign , 'D&esign...');
// cxSetResourceString(@sdxBtnMoveUp , 'Move para &cima');
// cxSetResourceString(@sdxBtnMoveDown , 'Mover para &baixo');
// cxSetResourceString(@sdxBtnMoreColors , '&Mais cores...');
 cxSetResourceString(@sdxBtnFillEffects , '&Установить фон...');
 cxSetResourceString(@sdxBtnNoFill , '&Без заполнения');
 cxSetResourceString(@sdxBtnAutomatic , '&Авто');
 cxSetResourceString(@sdxBtnNone , '&Нет');
// cxSetResourceString(@sdxBtnOtherTexture , 'Outras Te&xturas...');
// cxSetResourceString(@sdxBtnInvertColors , 'I&nverter Cores');
 cxSetResourceString(@sdxBtnSelectPicture , 'В&ыбрать изображение...');

 cxSetResourceString(@sdxPrintDialogCaption , 'Печать');
 cxSetResourceString(@sdxPrintDialogPrinter , ' Принтер ');
 cxSetResourceString(@sdxPrintDialogName , '&Имя:');
 cxSetResourceString(@sdxPrintDialogStatus , 'Статус:');
 cxSetResourceString(@sdxPrintDialogType , 'Тип:');
 cxSetResourceString(@sdxPrintDialogWhere , 'Порт:');
 cxSetResourceString(@sdxPrintDialogComment , 'Примечания:');
 cxSetResourceString(@sdxPrintDialogPrintToFile , 'П&ечать в файл');
 cxSetResourceString(@sdxPrintDialogPageRange , ' Страницы ');
 cxSetResourceString(@sdxPrintDialogAll , '&Все');
 cxSetResourceString(@sdxPrintDialogCurrentPage , '&Текущая');
 cxSetResourceString(@sdxPrintDialogPages , '&Номера:');
 cxSetResourceString(@sdxPrintDialogRangeLegend , 'Введите номера или диапазоны страниц'
                      + ' разделенные запятыми. Например: 1,3,5-12.');
 cxSetResourceString(@sdxPrintDialogCopies , ' Копии ');
 cxSetResourceString(@sdxPrintDialogNumberOfPages , 'Вклю&чить:');
 cxSetResourceString(@sdxPrintDialogNumberOfCopies , 'Число &копий:');
 cxSetResourceString(@sdxPrintDialogCollateCopies , 'Разобрат&ь по копиям');
 cxSetResourceString(@sdxPrintDialogAllPages , 'Все страницы');
 cxSetResourceString(@sdxPrintDialogEvenPages , 'Четные');
 cxSetResourceString(@sdxPrintDialogOddPages , 'Нечетные');
end;

initialization
   SetStrings;

end.
