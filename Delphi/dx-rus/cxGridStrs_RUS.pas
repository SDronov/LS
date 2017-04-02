unit cxGridStrs_RUS;

interface

implementation

uses
  cxClasses, cxEditConsts, cxGridStrs, cxExportStrs,
  cxFilterConsts, cxDataConsts, cxFormats, cxGridPopUpMenuConsts,
  cxLibraryStrs, cxFilterControlStrs, cxGrid, cxFilterControl,
    cxDBFilterControl,
  cxNavigator, cxPCConsts;

procedure SetStrings;
begin
  // cxLibrary
  cxSetResourceString(@scxCantCreateRegistryKey,    'Невозможно создать ключ в реестре: \%s');
  // PageControl2
  cxSetResourceString(@scxPCImageListIndexError,    'Index (%d) must be between 0 and %d');
  cxSetResourceString(@scxPCNoBaseImages, 'BaseImages is not assigned');
  cxSetResourceString(@scxPCNoRegisteredStyles,     'There are no styles registered');
  cxSetResourceString(@scxPCPageIndexError,     '%d is an invalid PageIndex value.  PageIndex must be between 0 and %d');
  cxSetResourceString(@scxPCPainterClassError, 'PCPainterClass is nil');
  cxSetResourceString(@scxPCStandardStyleError,
    '%s is an unsupported standard style');
  cxSetResourceString(@scxPCStyleNameError, '%s is an unregistered style name');
  cxSetResourceString(@scxPCTabCountEqualsZero, 'Tabs.Count = 0');
  cxSetResourceString(@scxPCTabIndexError, 'Tab''s index (%d) out of bounds');
  cxSetResourceString(@scxPCTabVisibleIndexOutsOfBounds,
    'TabVisibleIndex (%d) must be between 0 and %d');
  cxSetResourceString(@scxPCVisibleTabListEmpty, 'There are no visible tabs');
  // QuantumGrid5
  cxSetResourceString(@scxGridRecursiveLevels,
    'Вы не можете создавать рекурсивные уровни');
  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Подтвердить');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText,
    'Удалить запись?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText,
    'Удалить все выбранные записи?');
  cxSetResourceString(@scxGridNoDataInfoText, '<нет данных для отображения>');
  cxSetResourceString(@scxGridNewItemRowInfoText, 'Нажмите для вставки строки');
  cxSetResourceString(@scxGridFilterIsEmpty, '<фильтр пуст>');
  cxSetResourceString(@scxGridCustomizationFormCaption, 'Настройка');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Столбцы');
  cxSetResourceString(@scxGridGroupByBoxCaption,
    'Перетащите столбец сюда для группировки');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Настройка...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint,
    'Нажмите для выбора видимых столбцов');
  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Секции');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint,
    'Нажмите для выбора видимых групп');
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Строки');
  cxSetResourceString(@scxGridConverterIntermediaryMissing,
    'Пропущен промежуточный компонент! Пожалуйста добавте компонент %s на форму.');
  cxSetResourceString(@scxGridConverterNotExistGrid, 'Не существует cxGrid');
  cxSetResourceString(@scxGridConverterNotExistComponent,
    'Компонент не существует');
  cxSetResourceString(@scxImportErrorCaption, 'Ошибка импорта');
  cxSetResourceString(@scxNotExistGridView, 'Вид таблицы не существует');
  cxSetResourceString(@scxNotExistGridLevel, 'Активный уровень не существует');
  cxSetResourceString(@scxCantCreateExportOutputFile,
    'Невозможно создать файл для экспорта');
  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem,
    'ExtLookupComboBox|Represents an ultra-advanced lookup using the' +
    'uantumGrid as its drop down control');
  // Editors5
  cxSetResourceString(@cxsEditInvalidRepositoryItem,
    'Элемент из репозитария неприемлем');
  cxSetResourceString(@cxsEditDateConvertError,
    'Невозможно преобразовать в дату');
  cxSetResourceString(@cxsEditNumericValueConvertError,
    'Невозможно преобразовать в числовое значение');
  cxSetResourceString(@cxsEditPopupCircularReferencingError,
    'Циклическая ссылка невозможна');
  cxSetResourceString(@cxsEditPostError,
    'Произошла ошибка при применении значения');
  cxSetResourceString(@cxsEditTimeConvertError,
    'Невозможно преобразовать в формат времени');
  cxSetResourceString(@cxsEditValidateErrorText,
    'Неверное значение. Используйте клавишу Esc для отмены изменений');
  cxSetResourceString(@cxsEditValueOutOfBounds,
    'Значение за пределами диапазона');
  cxSetResourceString(@cxsEditCheckBoxChecked, 'True');
  cxSetResourceString(@cxsEditCheckBoxGrayed, '');
  cxSetResourceString(@cxsEditCheckBoxUnchecked, 'False');
  cxSetResourceString(@cxsRadioGroupDefaultCaption, '');
  cxSetResourceString(@cxsTextTrue, 'True');
  cxSetResourceString(@cxsTextFalse, 'False');
  cxSetResourceString(@cxsBlobButtonOK, '&OK');
  cxSetResourceString(@cxsBlobButtonCancel, '&Отмена');
  cxSetResourceString(@cxsBlobButtonClose, '&Закрыть');
  cxSetResourceString(@cxsBlobMemo, '(MEMO)');
  cxSetResourceString(@cxsBlobMemoEmpty, '(memo)');
  cxSetResourceString(@cxsBlobPicture, '(ИЗОБРАЖЕНИЕ)');
  cxSetResourceString(@cxsBlobPictureEmpty, '(изображение)');
  cxSetResourceString(@cxsMenuItemCaptionCut, 'Вы&резать');
  cxSetResourceString(@cxsMenuItemCaptionCopy, '&Копировать');
  cxSetResourceString(@cxsMenuItemCaptionPaste, '&Вставить');
  cxSetResourceString(@cxsMenuItemCaptionDelete, '&Удалить');
  cxSetResourceString(@cxsMenuItemCaptionLoad, '&Загрузить...');
  cxSetResourceString(@cxsMenuItemCaptionSave, 'Сохранить &Как...');
  cxSetResourceString(@cxsDatePopupClear, 'Очистить');
  cxSetResourceString(@cxsDatePopupNow, 'Сейчас');
  cxSetResourceString(@cxsDatePopupOK, 'OK');
  cxSetResourceString(@cxsDatePopupToday, 'Сегодня');
  cxSetResourceString(@cxsDateError, 'Неверная Дата');
  cxSetResourceString(@cxsDateToday, 'сегодня');
  cxSetResourceString(@cxsDateYesterday, 'вчера');
  cxSetResourceString(@cxsDateTomorrow, 'завтра');
  cxSetResourceString(@cxsDateSunday, 'Воскресенье');
  cxSetResourceString(@cxsDateMonday, 'Понедельник');
  cxSetResourceString(@cxsDateTuesday, 'Вторник');
  cxSetResourceString(@cxsDateWednesday, 'Среда');
  cxSetResourceString(@cxsDateThursday, 'Четверг');
  cxSetResourceString(@cxsDateFriday, 'Пятница');
  cxSetResourceString(@cxsDateSaturday, 'Суббота');
  cxSetResourceString(@cxsDateFirst, 'первый');
  cxSetResourceString(@cxsDateSecond, 'второй');
  cxSetResourceString(@cxsDateThird, 'третий');
  cxSetResourceString(@cxsDateFourth, 'четвертый');
  cxSetResourceString(@cxsDateFifth, 'пятый');
  cxSetResourceString(@cxsDateSixth, 'шестой');
  cxSetResourceString(@cxsDateSeventh, 'седьмой');
  cxSetResourceString(@cxsDateBOM, 'МесНач');
  cxSetResourceString(@cxsDateEOM, 'МесКон');
  cxSetResourceString(@cxsDateNow, 'сейчас');
  cxSetResourceString(@scxsCalcError, 'Ошибка');
  cxSetResourceString(@scxsHyperLinkPrefix, 'http://');
  cxSetResourceString(@scxsHyperLinkDoubleSlash, '//');
  cxSetResourceString(@scxsEditRepositoryBlobItem,
    'BlobEdit|Represents the BLOB editor');
  cxSetResourceString(@scxsEditRepositoryButtonItem,
    'ButtonEdit|Represents an edit control with embedded buttons');
  cxSetResourceString(@scxsEditRepositoryCalcItem,
    'CalcEdit|Represents an edit control with a dropdown calculator window');
  cxSetResourceString(@scxsEditRepositoryCheckBoxItem,
    'CheckBox|Represents a check box control that allows selecting an option');
  cxSetResourceString(@scxsEditRepositoryComboBoxItem,
    'ComboBox|Represents the combo box editor');
  cxSetResourceString(@scxsEditRepositoryCurrencyItem,
    'CurrencyEdit|Represents an editor enabling editing currency data');
  cxSetResourceString(@scxsEditRepositoryDateItem,
    'DateEdit|Represents an edit control with a dropdown calendar');
  cxSetResourceString(@scxsEditRepositoryHyperLinkItem,
    'HyperLink|Represents a text editor with hyperlink functionality');
  cxSetResourceString(@scxsEditRepositoryImageComboBoxItem,
    'ImageComboBox|Represents an editor displaying the list of images and text' +
    'trings within the dropdown window');
  cxSetResourceString(@scxsEditRepositoryImageItem,
    'Image|Represents an image editor');
  cxSetResourceString(@scxsEditRepositoryLookupComboBoxItem,
    'LookupComboBox|Represents a lookup combo box control');
  cxSetResourceString(@scxsEditRepositoryMaskItem,
    'MaskEdit|Represents a generic masked edit control.');
  cxSetResourceString(@scxsEditRepositoryMemoItem,
    'Memo|Represents an edit control that allows editing memo data');
  cxSetResourceString(@scxsEditRepositoryMRUItem,
    'MRUEdit|Represents a text editor displaying the list of most recently used items (MRU)' +
    'ithin a dropdown window');
  cxSetResourceString(@scxsEditRepositoryPopupItem,
    'PopupEdit|Represents an edit control with a dropdown list');
  cxSetResourceString(@scxsEditRepositorySpinItem,
    'SpinEdit|Represents a spin editor');
  cxSetResourceString(@scxsEditRepositoryTextItem,
    'TextEdit|Represents a single line text editor');
  cxSetResourceString(@scxsEditRepositoryTimeItem,
    'TimeEdit|Represents an editor displaying time values');
  cxSetResourceString(@scxRegExprLine, 'Строка');
  cxSetResourceString(@scxRegExprChar, 'Char');
  cxSetResourceString(@scxRegExprNotAssignedSourceStream,
    'The source stream is not assigned');
  cxSetResourceString(@scxRegExprEmptySourceStream,
    'The source stream is empty');
  cxSetResourceString(@scxRegExprCantUsePlusQuantifier,
    'The ''+'' quantifier cannot be applied here');
  cxSetResourceString(@scxRegExprCantUseStarQuantifier,
    'The ''*'' quantifier cannot be applied here');
  cxSetResourceString(@scxRegExprCantCreateEmptyAlt,
    'The alternative should not be empty');
  cxSetResourceString(@scxRegExprCantCreateEmptyBlock,
    'The block should not be empty');
  cxSetResourceString(@scxRegExprIllegalSymbol, 'Illegal ''%s''');
  cxSetResourceString(@scxRegExprIllegalQuantifier,
    'Illegal quantifier ''%s''');
  cxSetResourceString(@scxRegExprNotSupportQuantifier,
    'The parameter quantifiers are not supported');
  cxSetResourceString(@scxRegExprIllegalIntegerValue, 'Illegal integer value');
  cxSetResourceString(@scxRegExprTooBigReferenceNumber,
    'Число-Ссылка слишком велико');
  cxSetResourceString(@scxRegExprCantCreateEmptyEnum,
    'Can''t create empty enumeration');
  cxSetResourceString(@scxRegExprSubrangeOrder,
    'The starting character of the subrange must be less than the finishing one');
  cxSetResourceString(@scxRegExprHexNumberExpected0,
    'Hexadecimal number expected');
  cxSetResourceString(@scxRegExprHexNumberExpected,
    'Hexadecimal number expected but ''%s'' found');
  cxSetResourceString(@scxRegExprMissing, 'Пропущено ''%s''');
  cxSetResourceString(@scxRegExprUnnecessary, 'Излишняя ''%s''');
  cxSetResourceString(@scxRegExprIncorrectSpace,
    'The space character is not allowed after ''\''');
  cxSetResourceString(@scxRegExprNotCompiled,
    'Regular expression is not compiled');
  cxSetResourceString(@scxRegExprIncorrectParameterQuantifier,
    'Incorrect parameter quantifier');
  cxSetResourceString(@scxMaskEditRegExprError, 'Regular expression errors:');
  cxSetResourceString(@scxMaskEditInvalidEditValue,
    'The edit value is invalid');
  cxSetResourceString(@scxMaskEditNoMask, 'None');
  cxSetResourceString(@scxMaskEditIllegalFileFormat, 'Неверный формат файла');
  cxSetResourceString(@scxMaskEditEmptyMaskCollectionFile,
    'The mask collection file is empty');
  cxSetResourceString(@scxMaskEditMaskCollectionFiles, 'Mask collection files');
  cxSetResourceString(@cxsSpinEditInvalidNumericValue,
    'Неверное числовое значение');
  // Datacontroller
  cxSetResourceString(@cxsDataReadError, 'Ошибка чтения из потока');
  cxSetResourceString(@cxsDataWriteError, 'Ошибка записи в поток');
  cxSetResourceString(@cxsDataItemExistError, 'Элемент уже существует');
  cxSetResourceString(@cxsDataRecordIndexError,
    'Индекс записи за пределами диапазона');
  cxSetResourceString(@cxsDataItemIndexError,
    'Индекс элемента за пределами диапазона');
  cxSetResourceString(@cxsDataProviderModeError,
    'Эта операция не поддерживается в режиме ''provider''');
  cxSetResourceString(@cxsDataInvalidStreamFormat, 'Неверный формат потока');
  cxSetResourceString(@cxsDataRowIndexError,
    'Индекс строки за пределами диапазона');
  cxSetResourceString(@cxsDataCustomDataSourceInvalidCompare,
    'GetInfoForCompare не реализованно');
  cxSetResourceString(@cxsDBDetailFilterControllerNotFound,
    'DetailFilterController не найден');
  cxSetResourceString(@cxsDBNotInGridMode,
    'DataController не в режиме GridMode');
  cxSetResourceString(@cxsDBKeyFieldNotFound, 'Ключевое поле не найдено');
  // Filter
  cxSetResourceString(@cxsFilterOperatorEqual, 'равен');
  cxSetResourceString(@cxsFilterOperatorNotEqual, 'не равен');
  cxSetResourceString(@cxsFilterOperatorLess, 'меньше чем');
  cxSetResourceString(@cxsFilterOperatorLessEqual, 'меньше или равно чем');
  cxSetResourceString(@cxsFilterOperatorGreater, 'больше чем');
  cxSetResourceString(@cxsFilterOperatorGreaterEqual, 'больше или равно чем');
  cxSetResourceString(@cxsFilterOperatorLike, 'похож на');
  cxSetResourceString(@cxsFilterOperatorNotLike, 'не похож на');
  cxSetResourceString(@cxsFilterOperatorBetween, 'между');
  cxSetResourceString(@cxsFilterOperatorNotBetween, 'не входит в');
  cxSetResourceString(@cxsFilterOperatorInList, 'в');
  cxSetResourceString(@cxsFilterOperatorNotInList, 'не входит в');
  cxSetResourceString(@cxsFilterOperatorYesterday, 'вчера');
  cxSetResourceString(@cxsFilterOperatorToday, 'сегодня');
  cxSetResourceString(@cxsFilterOperatorTomorrow, 'завтра');
  cxSetResourceString(@cxsFilterOperatorLastWeek, 'последняя неделя');
  cxSetResourceString(@cxsFilterOperatorLastMonth, 'последний месяц');
  cxSetResourceString(@cxsFilterOperatorLastYear, 'последний год');
  cxSetResourceString(@cxsFilterOperatorThisWeek, 'в этой неделе');
  cxSetResourceString(@cxsFilterOperatorThisMonth, 'в этом месяце');
  cxSetResourceString(@cxsFilterOperatorThisYear, 'в этом году');
  cxSetResourceString(@cxsFilterOperatorNextWeek, 'следующая неделя');
  cxSetResourceString(@cxsFilterOperatorNextMonth, 'следующий месяц');
  cxSetResourceString(@cxsFilterOperatorNextYear, 'следующий год');
  cxSetResourceString(@cxsFilterAndCaption, 'и');
  cxSetResourceString(@cxsFilterOrCaption, 'или');
  cxSetResourceString(@cxsFilterNotCaption, 'не');
  cxSetResourceString(@cxsFilterBlankCaption, 'пусто');
  cxSetResourceString(@cxsFilterOperatorIsNull, 'пустой');
  cxSetResourceString(@cxsFilterOperatorIsNotNull, 'не пустой');
  cxSetResourceString(@cxsFilterOperatorBeginsWith, 'начинается с');
  cxSetResourceString(@cxsFilterOperatorDoesNotBeginWith, 'не начинается с');
  cxSetResourceString(@cxsFilterOperatorEndsWith, 'заканчивается на');
  cxSetResourceString(@cxsFilterOperatorDoesNotEndWith, 'не заканчивается на');
  cxSetResourceString(@cxsFilterOperatorContains, 'содержит');
  cxSetResourceString(@cxsFilterOperatorDoesNotContain, 'не содержит');
  cxSetResourceString(@cxsFilterBoxAllCaption, '(Все)');
  cxSetResourceString(@cxsFilterBoxCustomCaption, '(Условие...)');
  cxSetResourceString(@cxsFilterBoxBlanksCaption, '(Пустые)');
  cxSetResourceString(@cxsFilterBoxNonBlanksCaption, '(Не пустые)');
  cxSetResourceString(@cxsFilterBoolOperatorAnd, 'И');
  cxSetResourceString(@cxsFilterBoolOperatorOr, 'ИЛИ');
  cxSetResourceString(@cxsFilterBoolOperatorNotAnd, 'НЕ И');
  cxSetResourceString(@cxsFilterBoolOperatorNotOr, 'НЕ ИЛИ');
  cxSetResourceString(@cxsFilterRootButtonCaption, 'Фильтр');
  cxSetResourceString(@cxsFilterAddCondition, 'Добавить &Условие');
  cxSetResourceString(@cxsFilterAddGroup, 'Добавить &Группу');
  cxSetResourceString(@cxsFilterRemoveRow, '&Удалить Строку');
  cxSetResourceString(@cxsFilterClearAll, 'Очистить &Все');
  cxSetResourceString(@cxsFilterFooterAddCondition,
    'нажмите, чтобы добавить новое условие');
  cxSetResourceString(@cxsFilterGroupCaption, 'Применяет следующие условия');
  cxSetResourceString(@cxsFilterRootGroupCaption, '<корень>');
  cxSetResourceString(@cxsFilterControlNullString, '(пусто)');
  cxSetResourceString(@cxsFilterErrorBuilding,
    'Невозможно создать фильтр из источника');
  cxSetResourceString(@cxsFilterDialogCaption, 'Настройка фильтра');
  cxSetResourceString(@cxsFilterDialogInvalidValue, 'Неверное значение');
  cxSetResourceString(@cxsFilterDialogUse, 'Использовать');
  cxSetResourceString(@cxsFilterDialogSingleCharacter,
    'для указания одного знака');
  cxSetResourceString(@cxsFilterDialogCharactersSeries,
    'для указания группы знаков');
  cxSetResourceString(@cxsFilterDialogOperationAnd, 'И');
  cxSetResourceString(@cxsFilterDialogOperationOr, 'ИЛИ');
  cxSetResourceString(@cxsFilterDialogRows, 'Показать строки для которых:');
  cxSetResourceString(@cxsFilterControlDialogCaption, 'Построитель Фильтра');
  cxSetResourceString(@cxsFilterControlDialogNewFile, 'untitled.flt');
  cxSetResourceString(@cxsFilterControlDialogOpenDialogCaption,
    'Открыть существующий фильтр');
  cxSetResourceString(@cxsFilterControlDialogSaveDialogCaption,
    'Сохранить активный фильтр в файл');
  cxSetResourceString(@cxsFilterControlDialogActionSaveCaption,
    'Со&хранить Как...');
  cxSetResourceString(@cxsFilterControlDialogActionOpenCaption,
    '&Загрузить...');
  cxSetResourceString(@cxsFilterControlDialogActionApplyCaption, '&Применить');
  cxSetResourceString(@cxsFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxsFilterControlDialogActionCancelCaption, 'Отмена');
  cxSetResourceString(@cxsFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxsFilterControlDialogFileFilter,
    'Фильтры (*.flt)|*.flt');
  // GridPopupMenu
  cxSetResourceString(@cxsGridNone, 'Отсутствует');
  cxSetResourceString(@cxsGridSortColumnAsc, 'Сортировать по возрастанию');
  cxSetResourceString(@cxsGridSortColumnDesc, 'Сортировать по убыванию');
  cxSetResourceString(@cxsGridClearSorting, 'Отменить сортировку');
  cxSetResourceString(@cxsGridGroupByThisField, 'Группировать по полю');
  cxSetResourceString(@cxsGridRemoveThisGroupItem,
    'Отменить группировку по полю');
  cxSetResourceString(@cxsGridGroupByBox, 'Область группировки');
  cxSetResourceString(@cxsGridAlignmentSubMenu, 'Выравнивание');
  cxSetResourceString(@cxsGridAlignLeft, 'По левому краю');
  cxSetResourceString(@cxsGridAlignRight, 'По правому краю');
  cxSetResourceString(@cxsGridAlignCenter, 'По центру');
  cxSetResourceString(@cxsGridRemoveColumn, 'Скрыть колонку');
  cxSetResourceString(@cxsGridFieldChooser, 'Выбрать колонки');
  cxSetResourceString(@cxsGridBestFit, 'Подобрать ширину колонки');
  cxSetResourceString(@cxsGridBestFitAllColumns,
    'Подобрать ширину всех колонок');
  cxSetResourceString(@cxsGridShowFooter, 'Область итогов');
  cxSetResourceString(@cxsGridShowGroupFooter, 'Область итогов для групп');
  cxSetResourceString(@cxsGridSumMenuItem, 'Сумма');
  cxSetResourceString(@cxsGridMinMenuItem, 'Минимум');
  cxSetResourceString(@cxsGridMaxMenuItem, 'Максимум');
  cxSetResourceString(@cxsGridCountMenuItem, 'Количество');
  cxSetResourceString(@cxsGridAvgMenuItem, 'Среднее');
  cxSetResourceString(@cxsGridNoneMenuItem, 'Отсутствует');
  // GridExport
  cxSetResourceString(@scxUnsupportedExport,
    'Неподдерживаемый тип экспорта: %1');
  cxSetResourceString(@scxStyleManagerKill,
    'Style Manager в данный момент используется и не может быть освобожден');
  cxSetResourceString(@scxStyleManagerCreate,
    'Невозможно создать style manager');
  cxSetResourceString(@scxExportToHtml, 'Экспорт в Web страницу (*.html)');
  cxSetResourceString(@scxExportToXml, 'Экспорт в XML документ (*.xml)');
  cxSetResourceString(@scxExportToText, 'Экспорт в формат текста (*.txt)');
  cxSetResourceString(@scxEmptyExportCache, 'Кэш экспорта пуст');
  cxSetResourceString(@scxIncorrectUnion, 'Неверное объединение ячеек');
  cxSetResourceString(@scxIllegalWidth, 'Неверная ширина столбца');
  cxSetResourceString(@scxInvalidColumnRowCount,
    'Неверное количество строк или столбцов');
  cxSetResourceString(@scxIllegalHeight, 'Неверная высота строки');
  cxSetResourceString(@scxInvalidColumnIndex,
    'Индекс столбца %d за пределами диапазона');
  cxSetResourceString(@scxInvalidRowIndex,
    'Индекс строки %d за пределами диапазона');
  cxSetResourceString(@scxInvalidStyleIndex, 'Неверный индекс стиля %d');
  cxSetResourceString(@scxExportToExcel, 'Экспорт в MS Excel (*.xls)');
  cxSetResourceString(@scxWorkbookWrite, 'Ошибка записи XLS файла');
  cxSetResourceString(@scxInvalidCellDimension, 'Неверные размеры столбца');
  cxSetResourceString(@scxBoolTrue, 'True');
  cxSetResourceString(@scxBoolFalse, 'False');
  // Navigator
  cxSetResourceString(@cxNavigatorHint_First, 'Первая запись');
  cxSetResourceString(@cxNavigatorHint_Prior, 'Предыдущая запись');
  cxSetResourceString(@cxNavigatorHint_PriorPage, 'Предыдущая страница');
  cxSetResourceString(@cxNavigatorHint_Next, 'Следующая запись');
  cxSetResourceString(@cxNavigatorHint_NextPage, 'Следующая страница');
  cxSetResourceString(@cxNavigatorHint_Last, 'Последняя запись');
  cxSetResourceString(@cxNavigatorHint_Insert, 'Вставить запись');
  cxSetResourceString(@cxNavigatorHint_Delete, 'Удалить запись');
  cxSetResourceString(@cxNavigatorHint_Edit, 'Редактировать запись');
  cxSetResourceString(@cxNavigatorHint_Post, 'Сохранить изменения');
  cxSetResourceString(@cxNavigatorHint_Cancel, 'Отменить редактирование');
  cxSetResourceString(@cxNavigatorHint_Refresh, 'Обновить данные');
  cxSetResourceString(@cxNavigatorHint_SaveBookmark, 'Запомнить закладку');
  cxSetResourceString(@cxNavigatorHint_GotoBookmark, 'Идти к закладке');
  cxSetResourceString(@cxNavigatorHint_Filter, 'Фильтровать данные');
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion, 'Удалить запись?');
end;
initialization
  SetStrings;

end.

