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
  cxSetResourceString(@scxCantCreateRegistryKey,    '���������� ������� ���� � �������: \%s');
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
    '�� �� ������ ��������� ����������� ������');
  cxSetResourceString(@scxGridDeletingConfirmationCaption, '�����������');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText,
    '������� ������?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText,
    '������� ��� ��������� ������?');
  cxSetResourceString(@scxGridNoDataInfoText, '<��� ������ ��� �����������>');
  cxSetResourceString(@scxGridNewItemRowInfoText, '������� ��� ������� ������');
  cxSetResourceString(@scxGridFilterIsEmpty, '<������ ����>');
  cxSetResourceString(@scxGridCustomizationFormCaption, '���������');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, '�������');
  cxSetResourceString(@scxGridGroupByBoxCaption,
    '���������� ������� ���� ��� �����������');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, '���������...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint,
    '������� ��� ������ ������� ��������');
  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, '������');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint,
    '������� ��� ������ ������� �����');
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, '������');
  cxSetResourceString(@scxGridConverterIntermediaryMissing,
    '�������� ������������� ���������! ���������� ������� ��������� %s �� �����.');
  cxSetResourceString(@scxGridConverterNotExistGrid, '�� ���������� cxGrid');
  cxSetResourceString(@scxGridConverterNotExistComponent,
    '��������� �� ����������');
  cxSetResourceString(@scxImportErrorCaption, '������ �������');
  cxSetResourceString(@scxNotExistGridView, '��� ������� �� ����������');
  cxSetResourceString(@scxNotExistGridLevel, '�������� ������� �� ����������');
  cxSetResourceString(@scxCantCreateExportOutputFile,
    '���������� ������� ���� ��� ��������');
  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem,
    'ExtLookupComboBox|Represents an ultra-advanced lookup using the' +
    'uantumGrid as its drop down control');
  // Editors5
  cxSetResourceString(@cxsEditInvalidRepositoryItem,
    '������� �� ����������� ����������');
  cxSetResourceString(@cxsEditDateConvertError,
    '���������� ������������� � ����');
  cxSetResourceString(@cxsEditNumericValueConvertError,
    '���������� ������������� � �������� ��������');
  cxSetResourceString(@cxsEditPopupCircularReferencingError,
    '����������� ������ ����������');
  cxSetResourceString(@cxsEditPostError,
    '��������� ������ ��� ���������� ��������');
  cxSetResourceString(@cxsEditTimeConvertError,
    '���������� ������������� � ������ �������');
  cxSetResourceString(@cxsEditValidateErrorText,
    '�������� ��������. ����������� ������� Esc ��� ������ ���������');
  cxSetResourceString(@cxsEditValueOutOfBounds,
    '�������� �� ��������� ���������');
  cxSetResourceString(@cxsEditCheckBoxChecked, 'True');
  cxSetResourceString(@cxsEditCheckBoxGrayed, '');
  cxSetResourceString(@cxsEditCheckBoxUnchecked, 'False');
  cxSetResourceString(@cxsRadioGroupDefaultCaption, '');
  cxSetResourceString(@cxsTextTrue, 'True');
  cxSetResourceString(@cxsTextFalse, 'False');
  cxSetResourceString(@cxsBlobButtonOK, '&OK');
  cxSetResourceString(@cxsBlobButtonCancel, '&������');
  cxSetResourceString(@cxsBlobButtonClose, '&�������');
  cxSetResourceString(@cxsBlobMemo, '(MEMO)');
  cxSetResourceString(@cxsBlobMemoEmpty, '(memo)');
  cxSetResourceString(@cxsBlobPicture, '(�����������)');
  cxSetResourceString(@cxsBlobPictureEmpty, '(�����������)');
  cxSetResourceString(@cxsMenuItemCaptionCut, '��&������');
  cxSetResourceString(@cxsMenuItemCaptionCopy, '&����������');
  cxSetResourceString(@cxsMenuItemCaptionPaste, '&��������');
  cxSetResourceString(@cxsMenuItemCaptionDelete, '&�������');
  cxSetResourceString(@cxsMenuItemCaptionLoad, '&���������...');
  cxSetResourceString(@cxsMenuItemCaptionSave, '��������� &���...');
  cxSetResourceString(@cxsDatePopupClear, '��������');
  cxSetResourceString(@cxsDatePopupNow, '������');
  cxSetResourceString(@cxsDatePopupOK, 'OK');
  cxSetResourceString(@cxsDatePopupToday, '�������');
  cxSetResourceString(@cxsDateError, '�������� ����');
  cxSetResourceString(@cxsDateToday, '�������');
  cxSetResourceString(@cxsDateYesterday, '�����');
  cxSetResourceString(@cxsDateTomorrow, '������');
  cxSetResourceString(@cxsDateSunday, '�����������');
  cxSetResourceString(@cxsDateMonday, '�����������');
  cxSetResourceString(@cxsDateTuesday, '�������');
  cxSetResourceString(@cxsDateWednesday, '�����');
  cxSetResourceString(@cxsDateThursday, '�������');
  cxSetResourceString(@cxsDateFriday, '�������');
  cxSetResourceString(@cxsDateSaturday, '�������');
  cxSetResourceString(@cxsDateFirst, '������');
  cxSetResourceString(@cxsDateSecond, '������');
  cxSetResourceString(@cxsDateThird, '������');
  cxSetResourceString(@cxsDateFourth, '���������');
  cxSetResourceString(@cxsDateFifth, '�����');
  cxSetResourceString(@cxsDateSixth, '������');
  cxSetResourceString(@cxsDateSeventh, '�������');
  cxSetResourceString(@cxsDateBOM, '������');
  cxSetResourceString(@cxsDateEOM, '������');
  cxSetResourceString(@cxsDateNow, '������');
  cxSetResourceString(@scxsCalcError, '������');
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
  cxSetResourceString(@scxRegExprLine, '������');
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
    '�����-������ ������� ������');
  cxSetResourceString(@scxRegExprCantCreateEmptyEnum,
    'Can''t create empty enumeration');
  cxSetResourceString(@scxRegExprSubrangeOrder,
    'The starting character of the subrange must be less than the finishing one');
  cxSetResourceString(@scxRegExprHexNumberExpected0,
    'Hexadecimal number expected');
  cxSetResourceString(@scxRegExprHexNumberExpected,
    'Hexadecimal number expected but ''%s'' found');
  cxSetResourceString(@scxRegExprMissing, '��������� ''%s''');
  cxSetResourceString(@scxRegExprUnnecessary, '�������� ''%s''');
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
  cxSetResourceString(@scxMaskEditIllegalFileFormat, '�������� ������ �����');
  cxSetResourceString(@scxMaskEditEmptyMaskCollectionFile,
    'The mask collection file is empty');
  cxSetResourceString(@scxMaskEditMaskCollectionFiles, 'Mask collection files');
  cxSetResourceString(@cxsSpinEditInvalidNumericValue,
    '�������� �������� ��������');
  // Datacontroller
  cxSetResourceString(@cxsDataReadError, '������ ������ �� ������');
  cxSetResourceString(@cxsDataWriteError, '������ ������ � �����');
  cxSetResourceString(@cxsDataItemExistError, '������� ��� ����������');
  cxSetResourceString(@cxsDataRecordIndexError,
    '������ ������ �� ��������� ���������');
  cxSetResourceString(@cxsDataItemIndexError,
    '������ �������� �� ��������� ���������');
  cxSetResourceString(@cxsDataProviderModeError,
    '��� �������� �� �������������� � ������ ''provider''');
  cxSetResourceString(@cxsDataInvalidStreamFormat, '�������� ������ ������');
  cxSetResourceString(@cxsDataRowIndexError,
    '������ ������ �� ��������� ���������');
  cxSetResourceString(@cxsDataCustomDataSourceInvalidCompare,
    'GetInfoForCompare �� ������������');
  cxSetResourceString(@cxsDBDetailFilterControllerNotFound,
    'DetailFilterController �� ������');
  cxSetResourceString(@cxsDBNotInGridMode,
    'DataController �� � ������ GridMode');
  cxSetResourceString(@cxsDBKeyFieldNotFound, '�������� ���� �� �������');
  // Filter
  cxSetResourceString(@cxsFilterOperatorEqual, '�����');
  cxSetResourceString(@cxsFilterOperatorNotEqual, '�� �����');
  cxSetResourceString(@cxsFilterOperatorLess, '������ ���');
  cxSetResourceString(@cxsFilterOperatorLessEqual, '������ ��� ����� ���');
  cxSetResourceString(@cxsFilterOperatorGreater, '������ ���');
  cxSetResourceString(@cxsFilterOperatorGreaterEqual, '������ ��� ����� ���');
  cxSetResourceString(@cxsFilterOperatorLike, '����� ��');
  cxSetResourceString(@cxsFilterOperatorNotLike, '�� ����� ��');
  cxSetResourceString(@cxsFilterOperatorBetween, '�����');
  cxSetResourceString(@cxsFilterOperatorNotBetween, '�� ������ �');
  cxSetResourceString(@cxsFilterOperatorInList, '�');
  cxSetResourceString(@cxsFilterOperatorNotInList, '�� ������ �');
  cxSetResourceString(@cxsFilterOperatorYesterday, '�����');
  cxSetResourceString(@cxsFilterOperatorToday, '�������');
  cxSetResourceString(@cxsFilterOperatorTomorrow, '������');
  cxSetResourceString(@cxsFilterOperatorLastWeek, '��������� ������');
  cxSetResourceString(@cxsFilterOperatorLastMonth, '��������� �����');
  cxSetResourceString(@cxsFilterOperatorLastYear, '��������� ���');
  cxSetResourceString(@cxsFilterOperatorThisWeek, '� ���� ������');
  cxSetResourceString(@cxsFilterOperatorThisMonth, '� ���� ������');
  cxSetResourceString(@cxsFilterOperatorThisYear, '� ���� ����');
  cxSetResourceString(@cxsFilterOperatorNextWeek, '��������� ������');
  cxSetResourceString(@cxsFilterOperatorNextMonth, '��������� �����');
  cxSetResourceString(@cxsFilterOperatorNextYear, '��������� ���');
  cxSetResourceString(@cxsFilterAndCaption, '�');
  cxSetResourceString(@cxsFilterOrCaption, '���');
  cxSetResourceString(@cxsFilterNotCaption, '��');
  cxSetResourceString(@cxsFilterBlankCaption, '�����');
  cxSetResourceString(@cxsFilterOperatorIsNull, '������');
  cxSetResourceString(@cxsFilterOperatorIsNotNull, '�� ������');
  cxSetResourceString(@cxsFilterOperatorBeginsWith, '���������� �');
  cxSetResourceString(@cxsFilterOperatorDoesNotBeginWith, '�� ���������� �');
  cxSetResourceString(@cxsFilterOperatorEndsWith, '������������� ��');
  cxSetResourceString(@cxsFilterOperatorDoesNotEndWith, '�� ������������� ��');
  cxSetResourceString(@cxsFilterOperatorContains, '��������');
  cxSetResourceString(@cxsFilterOperatorDoesNotContain, '�� ��������');
  cxSetResourceString(@cxsFilterBoxAllCaption, '(���)');
  cxSetResourceString(@cxsFilterBoxCustomCaption, '(�������...)');
  cxSetResourceString(@cxsFilterBoxBlanksCaption, '(������)');
  cxSetResourceString(@cxsFilterBoxNonBlanksCaption, '(�� ������)');
  cxSetResourceString(@cxsFilterBoolOperatorAnd, '�');
  cxSetResourceString(@cxsFilterBoolOperatorOr, '���');
  cxSetResourceString(@cxsFilterBoolOperatorNotAnd, '�� �');
  cxSetResourceString(@cxsFilterBoolOperatorNotOr, '�� ���');
  cxSetResourceString(@cxsFilterRootButtonCaption, '������');
  cxSetResourceString(@cxsFilterAddCondition, '�������� &�������');
  cxSetResourceString(@cxsFilterAddGroup, '�������� &������');
  cxSetResourceString(@cxsFilterRemoveRow, '&������� ������');
  cxSetResourceString(@cxsFilterClearAll, '�������� &���');
  cxSetResourceString(@cxsFilterFooterAddCondition,
    '�������, ����� �������� ����� �������');
  cxSetResourceString(@cxsFilterGroupCaption, '��������� ��������� �������');
  cxSetResourceString(@cxsFilterRootGroupCaption, '<������>');
  cxSetResourceString(@cxsFilterControlNullString, '(�����)');
  cxSetResourceString(@cxsFilterErrorBuilding,
    '���������� ������� ������ �� ���������');
  cxSetResourceString(@cxsFilterDialogCaption, '��������� �������');
  cxSetResourceString(@cxsFilterDialogInvalidValue, '�������� ��������');
  cxSetResourceString(@cxsFilterDialogUse, '������������');
  cxSetResourceString(@cxsFilterDialogSingleCharacter,
    '��� �������� ������ �����');
  cxSetResourceString(@cxsFilterDialogCharactersSeries,
    '��� �������� ������ ������');
  cxSetResourceString(@cxsFilterDialogOperationAnd, '�');
  cxSetResourceString(@cxsFilterDialogOperationOr, '���');
  cxSetResourceString(@cxsFilterDialogRows, '�������� ������ ��� �������:');
  cxSetResourceString(@cxsFilterControlDialogCaption, '����������� �������');
  cxSetResourceString(@cxsFilterControlDialogNewFile, 'untitled.flt');
  cxSetResourceString(@cxsFilterControlDialogOpenDialogCaption,
    '������� ������������ ������');
  cxSetResourceString(@cxsFilterControlDialogSaveDialogCaption,
    '��������� �������� ������ � ����');
  cxSetResourceString(@cxsFilterControlDialogActionSaveCaption,
    '��&������� ���...');
  cxSetResourceString(@cxsFilterControlDialogActionOpenCaption,
    '&���������...');
  cxSetResourceString(@cxsFilterControlDialogActionApplyCaption, '&���������');
  cxSetResourceString(@cxsFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxsFilterControlDialogActionCancelCaption, '������');
  cxSetResourceString(@cxsFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxsFilterControlDialogFileFilter,
    '������� (*.flt)|*.flt');
  // GridPopupMenu
  cxSetResourceString(@cxsGridNone, '�����������');
  cxSetResourceString(@cxsGridSortColumnAsc, '����������� �� �����������');
  cxSetResourceString(@cxsGridSortColumnDesc, '����������� �� ��������');
  cxSetResourceString(@cxsGridClearSorting, '�������� ����������');
  cxSetResourceString(@cxsGridGroupByThisField, '������������ �� ����');
  cxSetResourceString(@cxsGridRemoveThisGroupItem,
    '�������� ����������� �� ����');
  cxSetResourceString(@cxsGridGroupByBox, '������� �����������');
  cxSetResourceString(@cxsGridAlignmentSubMenu, '������������');
  cxSetResourceString(@cxsGridAlignLeft, '�� ������ ����');
  cxSetResourceString(@cxsGridAlignRight, '�� ������� ����');
  cxSetResourceString(@cxsGridAlignCenter, '�� ������');
  cxSetResourceString(@cxsGridRemoveColumn, '������ �������');
  cxSetResourceString(@cxsGridFieldChooser, '������� �������');
  cxSetResourceString(@cxsGridBestFit, '��������� ������ �������');
  cxSetResourceString(@cxsGridBestFitAllColumns,
    '��������� ������ ���� �������');
  cxSetResourceString(@cxsGridShowFooter, '������� ������');
  cxSetResourceString(@cxsGridShowGroupFooter, '������� ������ ��� �����');
  cxSetResourceString(@cxsGridSumMenuItem, '�����');
  cxSetResourceString(@cxsGridMinMenuItem, '�������');
  cxSetResourceString(@cxsGridMaxMenuItem, '��������');
  cxSetResourceString(@cxsGridCountMenuItem, '����������');
  cxSetResourceString(@cxsGridAvgMenuItem, '�������');
  cxSetResourceString(@cxsGridNoneMenuItem, '�����������');
  // GridExport
  cxSetResourceString(@scxUnsupportedExport,
    '���������������� ��� ��������: %1');
  cxSetResourceString(@scxStyleManagerKill,
    'Style Manager � ������ ������ ������������ � �� ����� ���� ����������');
  cxSetResourceString(@scxStyleManagerCreate,
    '���������� ������� style manager');
  cxSetResourceString(@scxExportToHtml, '������� � Web �������� (*.html)');
  cxSetResourceString(@scxExportToXml, '������� � XML �������� (*.xml)');
  cxSetResourceString(@scxExportToText, '������� � ������ ������ (*.txt)');
  cxSetResourceString(@scxEmptyExportCache, '��� �������� ����');
  cxSetResourceString(@scxIncorrectUnion, '�������� ����������� �����');
  cxSetResourceString(@scxIllegalWidth, '�������� ������ �������');
  cxSetResourceString(@scxInvalidColumnRowCount,
    '�������� ���������� ����� ��� ��������');
  cxSetResourceString(@scxIllegalHeight, '�������� ������ ������');
  cxSetResourceString(@scxInvalidColumnIndex,
    '������ ������� %d �� ��������� ���������');
  cxSetResourceString(@scxInvalidRowIndex,
    '������ ������ %d �� ��������� ���������');
  cxSetResourceString(@scxInvalidStyleIndex, '�������� ������ ����� %d');
  cxSetResourceString(@scxExportToExcel, '������� � MS Excel (*.xls)');
  cxSetResourceString(@scxWorkbookWrite, '������ ������ XLS �����');
  cxSetResourceString(@scxInvalidCellDimension, '�������� ������� �������');
  cxSetResourceString(@scxBoolTrue, 'True');
  cxSetResourceString(@scxBoolFalse, 'False');
  // Navigator
  cxSetResourceString(@cxNavigatorHint_First, '������ ������');
  cxSetResourceString(@cxNavigatorHint_Prior, '���������� ������');
  cxSetResourceString(@cxNavigatorHint_PriorPage, '���������� ��������');
  cxSetResourceString(@cxNavigatorHint_Next, '��������� ������');
  cxSetResourceString(@cxNavigatorHint_NextPage, '��������� ��������');
  cxSetResourceString(@cxNavigatorHint_Last, '��������� ������');
  cxSetResourceString(@cxNavigatorHint_Insert, '�������� ������');
  cxSetResourceString(@cxNavigatorHint_Delete, '������� ������');
  cxSetResourceString(@cxNavigatorHint_Edit, '������������� ������');
  cxSetResourceString(@cxNavigatorHint_Post, '��������� ���������');
  cxSetResourceString(@cxNavigatorHint_Cancel, '�������� ��������������');
  cxSetResourceString(@cxNavigatorHint_Refresh, '�������� ������');
  cxSetResourceString(@cxNavigatorHint_SaveBookmark, '��������� ��������');
  cxSetResourceString(@cxNavigatorHint_GotoBookmark, '���� � ��������');
  cxSetResourceString(@cxNavigatorHint_Filter, '����������� ������');
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion, '������� ������?');
end;
initialization
  SetStrings;

end.

