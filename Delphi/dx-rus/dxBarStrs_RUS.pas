unit dxBarStrs_RUS;

interface

implementation

uses dxBarStrs, cxClasses;

resourcestring

  dxSRBAR_LOOKUPDIALOGCAPTION = 'Выберите значение';//'Select value';
  dxSRBAR_LOOKUPDIALOGOK = 'ОК';//'OK';
  dxSRBAR_LOOKUPDIALOGCANCEL = 'Отмена';//'Cancel';

  dxSRBAR_DIALOGOK = 'ОК';//'OK';
  dxSRBAR_DIALOGCANCEL = 'Отмена';//'Cancel';
  dxSRBAR_COLOR_STR_0 = 'Черный';//'Black';
  dxSRBAR_COLOR_STR_1 = 'Темно-красный';//'Maroon';
  dxSRBAR_COLOR_STR_2 = 'Зеленый';//'Green';
  dxSRBAR_COLOR_STR_3 = 'Оливковый';//'Olive';
  dxSRBAR_COLOR_STR_4 = 'Темно-синий';//'Navy';
  dxSRBAR_COLOR_STR_5 = 'Пурпурный';//'Purple';
  dxSRBAR_COLOR_STR_6 = 'Серо-бирюзовый';//'Teal';
  dxSRBAR_COLOR_STR_7 = 'Серый';//'Gray';
  dxSRBAR_COLOR_STR_8 = 'Серебристый';//'Silver';
  dxSRBAR_COLOR_STR_9 = 'Красный';//'Red';
  dxSRBAR_COLOR_STR_10 = 'Салатовый';//'Lime';
  dxSRBAR_COLOR_STR_11 = 'Желтый';//'Yellow';
  dxSRBAR_COLOR_STR_12 = 'Синий';//'Blue';
  dxSRBAR_COLOR_STR_13 = 'Лиловый';//'Fuchsia';
  dxSRBAR_COLOR_STR_14 = 'Голубой';//'Aqua';
  dxSRBAR_COLOR_STR_15 = 'Белый';//'White';
  dxSRBAR_COLORAUTOTEXT = '(автоматически)';//'(automatic)';
  dxSRBAR_COLORCUSTOMTEXT = '(произвольно)';//'(custom)';
  dxSRBAR_DATETODAY = 'Сегодня';//'Today';
  dxSRBAR_DATECLEAR = 'Очистить';//'Clear';
  dxSRBAR_DATEDIALOGCAPTION = 'Выберите дату';//'Select the date';
  dxSRBAR_TREEVIEWDIALOGCAPTION = 'Выберите элемент';//'Select item';
  dxSRBAR_IMAGEDIALOGCAPTION = 'Выберите элемент';//'Select item';
  dxSRBAR_IMAGEINDEX = 'Индекс картинки';//'Image Index';
  dxSRBAR_IMAGETEXT = 'Текст';//'Text';
  dxSRBAR_PLACEFORCONTROL = 'Место для ';//'The place for the ';
  dxSRBAR_CANTASSIGNCONTROL = 'Вы не можете связать один и тот же элемент управления более чем с одним TdxBarControlContainerItem';//'You cannot assign the same control to more than one TdxBarControlContainerItem.';

  dxSRBAR_WANTTORESETTOOLBAR = 'Вы уверены что хотите сбросить все изменения сделанные для панели инструментов ''%s''';//'Are you sure you want to reset the changes made to the ''%s'' toolbar?';
  dxSRBAR_WANTTORESETUSAGEDATA = 'Будут удалены сведения о командах, использованных в данном приложении, и восстановлен набор команд по умолчанию, отображаемых в меню и на панели инструментов. Выполнить операцию?';//'This will delete the record of the commands you''ve used in this application and restore the default set of visible commands to the menus and toolbars. It will not undo any explicit customizations.   Are you sure you want to proceed?';
  dxSRBAR_BARMANAGERMORETHENONE  = 'Форма может содержать только один компонент TdxBarManager';//'A Form should contain only a single TdxBarManager';
  dxSRBAR_BARMANAGERBADOWNER = 'TdxBarManager может иметь в качестве Owner только наследника TCustomForm';//'TdxBarManager should have as its Owner - TForm (TCustomForm)';
  dxSRBAR_NOBARMANAGERS = 'Нет доступных TdxBarManager-ов';//'There are no TdxBarManagers available';
  dxSRBAR_WANTTODELETETOOLBAR = 'Вы уверены что хотите удалить панель инструментов ''%s''?';//'Are you sure you want to delete the ''%s'' toolbar?';
  dxSRBAR_WANTTODELETECATEGORY = 'Вы уверены что хотите удалить категорию ''%s''?';//'Are you sure you want to delete the ''%s'' category?';
  dxSRBAR_WANTTOCLEARCOMMANDS = 'Вы уверены что хотите удалить все команды в категории ''%s''?';//'Are you sure you want to delete all commands in the ''%s'' category?';
  dxSRBAR_RECURSIVESUBITEMS = 'Вы не можете создавать рекурсивные подменю';//'You cannot create recursive subitems';
  dxSRBAR_COMMANDNAMECANNOTBEBLANK = 'Название команды не может быть пустым. Введите название.';//'A command name cannot be blank. Please enter a name.';
  dxSRBAR_TOOLBAREXISTS = 'Панель инструментов ''%s'' уже существует. Укажите другое название.';//'A toolbar named ''%s'' already exists. Type another name.';
  dxSRBAR_RECURSIVEGROUPS = 'Вы не можете создавать рекурсивные группы';//You cannot create recursive groups';

  dxSRBAR_DEFAULTCATEGORYNAME = 'По умолчанию';//'Default';

  dxSRBAR_CP_ADDSUBITEM = 'Добавить &подменю';//'Add &SubItem';
  dxSRBAR_CP_ADDBUTTON = 'Добавить &кнопку';//'Add &Button';
  dxSRBAR_CP_ADDITEM = 'Добавить &элемент';//'Add &Item';
  dxSRBAR_CP_DELETEBAR = 'Удалить';//'Delete Bar';

  dxSRBAR_CP_RESET = '&Сбросить';//'&Reset';
  dxSRBAR_CP_DELETE = '&Удалить';//'&Delete';
  dxSRBAR_CP_NAME = '&Название:';//'&Name:';
  dxSRBAR_CP_CAPTION = '&Заголовок:';//'&Caption:'; // is the same as dxSRBAR_CP_NAME (at design-time)
  dxSRBAR_CP_DEFAULTSTYLE = 'Стиль по умол&чанию';//'Defa&ult style';
  dxSRBAR_CP_TEXTONLYALWAYS = 'Только &текст (всегда)';//'&Text Only (Always)';
  dxSRBAR_CP_TEXTONLYINMENUS = '&Только текст (в меню)';//'Text &Only (in Menus)';
  dxSRBAR_CP_IMAGEANDTEXT = 'Картинка &и текст';//'Image &and Text';
  dxSRBAR_CP_BEGINAGROUP = 'Начало &группы';//'Begin a &Group';
  dxSRBAR_CP_VISIBLE = '&Видимость';//'&Visible';
  dxSRBAR_CP_MOSTRECENTLYUSED = '&Наиболее часто используемые';//'&Most recently used';

  dxSRBAR_ADDEX = 'Добавить...';//'Add...';
  dxSRBAR_RENAMEEX = 'Переименовать...';//'Rename...';
  dxSRBAR_DELETE = 'Удалить';//'Delete';
  dxSRBAR_CLEAR = 'Очистить';//'Clear';
  dxSRBAR_VISIBLE = 'Видимость';//'Visible';
  dxSRBAR_OK = 'ОК';//'OK';
  dxSRBAR_CANCEL = 'Отмена';//'Cancel';
  dxSRBAR_SUBMENUEDITOR = 'Редактор подменю...';//'SubMenu Editor...';
  dxSRBAR_SUBMENUEDITORCAPTION = 'Редактор подменю';//'ExpressBars SubMenu Editor';
  dxSRBAR_INSERTEX = 'Вставить...';//'Insert...';

  dxSRBAR_MOVEUP = 'Наверх';//'Move Up';
  dxSRBAR_MOVEDOWN = 'Вниз';//'Move Down';
  dxSRBAR_POPUPMENUEDITOR = 'Редактор всплывающего меню...';//'PopupMenu Editor...';
  dxSRBAR_TABSHEET1 = ' Панели инструментов ';//' Toolbars ';
  dxSRBAR_TABSHEET2 = ' Команды ';//' Commands ';
  dxSRBAR_TABSHEET3 = ' Параметры ';//' Options ';
  dxSRBAR_TOOLBARS = 'П&анели инструментов:';//'Toolb&ars:';
  dxSRBAR_TNEW = '&Создать';//'&New...';
  dxSRBAR_TRENAME = 'П&ереименовать...';//'R&ename...';
  dxSRBAR_TDELETE = '&Удалить';//'&Delete';
  dxSRBAR_TRESET = 'С&бросить...';//'&Reset...';
  dxSRBAR_CLOSE = 'Закрыть';//'Close';
  dxSRBAR_CAPTION = 'Настройка';//'Customize';
  dxSRBAR_CATEGORIES = 'Кате&гории:';//'Cate&gories:';
  dxSRBAR_COMMANDS = 'Коман&ды:';//'Comman&ds:';
  dxSRBAR_DESCRIPTION = 'Описание  ';//'Description  ';

  dxSRBAR_CUSTOMIZE = '&Настройка...';//'&Customize...';
  dxSRBAR_ADDREMOVEBUTTONS = '&Добавить или удалить кнопки';//'&Add or Remove Buttons';
  dxSRBAR_MOREBUTTONS = 'Больше кнопок';//'More Buttons';
  dxSRBAR_RESETTOOLBAR = '&Сбросить изменения панели инструментов';//'&Reset Toolbar';
  dxSRBAR_EXPAND = 'Раскрыть (Ctrl+Down)';//'Expand (Ctrl-Down)';
  dxSRBAR_DRAGTOMAKEMENUFLOAT = 'Перетащите чтобы сделать это меню плавающим';//'Drag to make this menu float';

  dxSRBAR_TOOLBARNEWNAME  = 'Панель инструментов';//'Custom ';
  dxSRBAR_CATEGORYADD  = 'Добавить категорию';//'Add Category';
  dxSRBAR_CATEGORYINSERT  = 'Вставить категорию';//'Insert Category';
  dxSRBAR_CATEGORYRENAME  = 'Переименовать категорию';//'Rename Category';
  dxSRBAR_TOOLBARADD  = 'Добавить панель инструментов';//'Add Toolbar';
  dxSRBAR_TOOLBARRENAME  = 'Переименовать панель инструментов';//'Rename Toolbar';
  dxSRBAR_CATEGORYNAME  = 'Название &категории:';//'&Category name:';
  dxSRBAR_TOOLBARNAME  = 'Название панели &инструментов:';//'&Toolbar name:';
  dxSRBAR_CUSTOMIZINGFORM = 'Форма настройки...';//'Customization Form...';

  dxSRBAR_MODIFY = '...изменить';//'... modify';
  dxSRBAR_PERSMENUSANDTOOLBARS = 'Настраиваемые меню и панели инструментов  ';//'Personalized Menus and Toolbars  ';
  dxSRBAR_MENUSSHOWRECENTITEMS = 'Показывать первыми наиболее используемые команды';//'Me&nus show recently used commands first';
  dxSRBAR_SHOWFULLMENUSAFTERDELAY = 'Показывать полные меню после короткой задержки';//'Show f&ull menus after a short delay';
  dxSRBAR_RESETUSAGEDATA = 'Стереть сведения об используемых командах';//'&Reset my usage data';

  dxSRBAR_OTHEROPTIONS = 'Другие';//'Other  ';
  dxSRBAR_LARGEICONS = '&Крупные значки';//'&Large icons';
  dxSRBAR_HINTOPT1 = 'Отображать &подсказки для кнопок';//'Show Tool&Tips on toolbars';
  dxSRBAR_HINTOPT2 = 'Включать в подсказки &сочетания клавиш';//'Show s&hortcut keys in ToolTips';
  dxSRBAR_MENUANIMATIONS = 'Эффект при выводе &меню';//'&Menu animations:';
  dxSRBAR_MENUANIM1 = '(По умолчанию)';//'(None)';
  dxSRBAR_MENUANIM2 = 'Случайный выбор';//'Random';
  dxSRBAR_MENUANIM3 = 'Развертывание';//'Unfold';
  dxSRBAR_MENUANIM4 = 'Соскальзывание';//'Slide';
  dxSRBAR_MENUANIM5 = 'Угасание';//'Fade';

procedure Init;
begin
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCAPTION, dxSRBAR_LOOKUPDIALOGCAPTION);
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGOK, dxSRBAR_LOOKUPDIALOGOK);
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCANCEL, dxSRBAR_LOOKUPDIALOGCANCEL);
  cxSetResourceString(@dxSBAR_DIALOGOK, dxSRBAR_DIALOGOK);
  cxSetResourceString(@dxSBAR_DIALOGCANCEL, dxSRBAR_DIALOGCANCEL);
  cxSetResourceString(@dxSBAR_COLOR_STR_0, dxSRBAR_COLOR_STR_0);
  cxSetResourceString(@dxSBAR_COLOR_STR_1, dxSRBAR_COLOR_STR_1);
  cxSetResourceString(@dxSBAR_COLOR_STR_2, dxSRBAR_COLOR_STR_2);
  cxSetResourceString(@dxSBAR_COLOR_STR_3, dxSRBAR_COLOR_STR_3);
  cxSetResourceString(@dxSBAR_COLOR_STR_4, dxSRBAR_COLOR_STR_4);
  cxSetResourceString(@dxSBAR_COLOR_STR_5, dxSRBAR_COLOR_STR_5);
  cxSetResourceString(@dxSBAR_COLOR_STR_6, dxSRBAR_COLOR_STR_6);
  cxSetResourceString(@dxSBAR_COLOR_STR_7, dxSRBAR_COLOR_STR_7);
  cxSetResourceString(@dxSBAR_COLOR_STR_8, dxSRBAR_COLOR_STR_8);
  cxSetResourceString(@dxSBAR_COLOR_STR_9, dxSRBAR_COLOR_STR_9);
  cxSetResourceString(@dxSBAR_COLOR_STR_10, dxSRBAR_COLOR_STR_10);
  cxSetResourceString(@dxSBAR_COLOR_STR_11, dxSRBAR_COLOR_STR_11);
  cxSetResourceString(@dxSBAR_COLOR_STR_12, dxSRBAR_COLOR_STR_12);
  cxSetResourceString(@dxSBAR_COLOR_STR_13, dxSRBAR_COLOR_STR_13);
  cxSetResourceString(@dxSBAR_COLOR_STR_14, dxSRBAR_COLOR_STR_14);
  cxSetResourceString(@dxSBAR_COLOR_STR_15, dxSRBAR_COLOR_STR_15);
  cxSetResourceString(@dxSBAR_COLORAUTOTEXT, dxSRBAR_COLORAUTOTEXT);
  cxSetResourceString(@dxSBAR_COLORCUSTOMTEXT, dxSRBAR_COLORCUSTOMTEXT);
  cxSetResourceString(@dxSBAR_DATETODAY, dxSRBAR_DATETODAY);
  cxSetResourceString(@dxSBAR_DATECLEAR, dxSRBAR_DATECLEAR);
  cxSetResourceString(@dxSBAR_DATEDIALOGCAPTION, dxSRBAR_DATEDIALOGCAPTION);
  cxSetResourceString(@dxSBAR_TREEVIEWDIALOGCAPTION, dxSRBAR_TREEVIEWDIALOGCAPTION);
  cxSetResourceString(@dxSBAR_IMAGEDIALOGCAPTION, dxSRBAR_IMAGEDIALOGCAPTION);
  cxSetResourceString(@dxSBAR_IMAGEINDEX, dxSRBAR_IMAGEINDEX);
  cxSetResourceString(@dxSBAR_IMAGETEXT, dxSRBAR_IMAGETEXT);
  cxSetResourceString(@dxSBAR_PLACEFORCONTROL, dxSRBAR_PLACEFORCONTROL);
  cxSetResourceString(@dxSBAR_CANTASSIGNCONTROL, dxSRBAR_CANTASSIGNCONTROL);
  cxSetResourceString(@dxSBAR_WANTTORESETTOOLBAR, dxSRBAR_WANTTORESETTOOLBAR);
  cxSetResourceString(@dxSBAR_WANTTORESETUSAGEDATA, dxSRBAR_WANTTORESETUSAGEDATA);
  cxSetResourceString(@dxSBAR_BARMANAGERMORETHENONE, dxSRBAR_BARMANAGERMORETHENONE);
  cxSetResourceString(@dxSBAR_BARMANAGERBADOWNER, dxSRBAR_BARMANAGERBADOWNER);
  cxSetResourceString(@dxSBAR_NOBARMANAGERS, dxSRBAR_NOBARMANAGERS);
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBAR, dxSRBAR_WANTTODELETETOOLBAR);
  cxSetResourceString(@dxSBAR_WANTTODELETECATEGORY, dxSRBAR_WANTTODELETECATEGORY);
  cxSetResourceString(@dxSBAR_WANTTOCLEARCOMMANDS, dxSRBAR_WANTTOCLEARCOMMANDS);
  cxSetResourceString(@dxSBAR_RECURSIVESUBITEMS, dxSRBAR_RECURSIVESUBITEMS);
  cxSetResourceString(@dxSBAR_COMMANDNAMECANNOTBEBLANK, dxSRBAR_COMMANDNAMECANNOTBEBLANK);
  cxSetResourceString(@dxSBAR_TOOLBAREXISTS, dxSRBAR_TOOLBAREXISTS);
  cxSetResourceString(@dxSBAR_RECURSIVEGROUPS, dxSRBAR_RECURSIVEGROUPS);
  cxSetResourceString(@dxSBAR_DEFAULTCATEGORYNAME, dxSRBAR_DEFAULTCATEGORYNAME);
  cxSetResourceString(@dxSBAR_CP_ADDSUBITEM, dxSRBAR_CP_ADDSUBITEM);
  cxSetResourceString(@dxSBAR_CP_ADDBUTTON, dxSRBAR_CP_ADDBUTTON);
  cxSetResourceString(@dxSBAR_CP_ADDITEM, dxSRBAR_CP_ADDITEM);
  cxSetResourceString(@dxSBAR_CP_DELETEBAR, dxSRBAR_CP_DELETEBAR);
  cxSetResourceString(@dxSBAR_CP_RESET, dxSRBAR_CP_RESET);
  cxSetResourceString(@dxSBAR_CP_DELETE, dxSRBAR_CP_DELETE);
  cxSetResourceString(@dxSBAR_CP_NAME, dxSRBAR_CP_NAME);
  cxSetResourceString(@dxSBAR_CP_CAPTION, dxSRBAR_CP_CAPTION);
  cxSetResourceString(@dxSBAR_CP_DEFAULTSTYLE, dxSRBAR_CP_DEFAULTSTYLE);
  cxSetResourceString(@dxSBAR_CP_TEXTONLYALWAYS, dxSRBAR_CP_TEXTONLYALWAYS);
  cxSetResourceString(@dxSBAR_CP_TEXTONLYINMENUS, dxSRBAR_CP_TEXTONLYINMENUS);
  cxSetResourceString(@dxSBAR_CP_IMAGEANDTEXT, dxSRBAR_CP_IMAGEANDTEXT);
  cxSetResourceString(@dxSBAR_CP_BEGINAGROUP, dxSRBAR_CP_BEGINAGROUP);
  cxSetResourceString(@dxSBAR_CP_VISIBLE, dxSRBAR_CP_VISIBLE);
  cxSetResourceString(@dxSBAR_CP_MOSTRECENTLYUSED, dxSRBAR_CP_MOSTRECENTLYUSED);
  cxSetResourceString(@dxSBAR_ADDEX, dxSRBAR_ADDEX);
  cxSetResourceString(@dxSBAR_RENAMEEX, dxSRBAR_RENAMEEX);
  cxSetResourceString(@dxSBAR_DELETE, dxSRBAR_DELETE);
  cxSetResourceString(@dxSBAR_CLEAR, dxSRBAR_CLEAR);
  cxSetResourceString(@dxSBAR_VISIBLE, dxSRBAR_VISIBLE);
  cxSetResourceString(@dxSBAR_OK, dxSRBAR_OK);
  cxSetResourceString(@dxSBAR_CANCEL, dxSRBAR_CANCEL);
  cxSetResourceString(@dxSBAR_SUBMENUEDITOR, dxSRBAR_SUBMENUEDITOR);
  cxSetResourceString(@dxSBAR_SUBMENUEDITORCAPTION, dxSRBAR_SUBMENUEDITORCAPTION);
  cxSetResourceString(@dxSBAR_INSERTEX, dxSRBAR_INSERTEX);
  cxSetResourceString(@dxSBAR_MOVEUP, dxSRBAR_MOVEUP);
  cxSetResourceString(@dxSBAR_MOVEDOWN, dxSRBAR_MOVEDOWN);
  cxSetResourceString(@dxSBAR_POPUPMENUEDITOR, dxSRBAR_POPUPMENUEDITOR);
  cxSetResourceString(@dxSBAR_TABSHEET1, dxSRBAR_TABSHEET1);
  cxSetResourceString(@dxSBAR_TABSHEET2, dxSRBAR_TABSHEET2);
  cxSetResourceString(@dxSBAR_TABSHEET3, dxSRBAR_TABSHEET3);
  cxSetResourceString(@dxSBAR_TOOLBARS, dxSRBAR_TOOLBARS);
  cxSetResourceString(@dxSBAR_TNEW, dxSRBAR_TNEW);
  cxSetResourceString(@dxSBAR_TRENAME, dxSRBAR_TRENAME);
  cxSetResourceString(@dxSBAR_TDELETE, dxSRBAR_TDELETE);
  cxSetResourceString(@dxSBAR_TRESET, dxSRBAR_TRESET);
  cxSetResourceString(@dxSBAR_CLOSE, dxSRBAR_CLOSE);
  cxSetResourceString(@dxSBAR_CAPTION, dxSRBAR_CAPTION);
  cxSetResourceString(@dxSBAR_CATEGORIES, dxSRBAR_CATEGORIES);
  cxSetResourceString(@dxSBAR_COMMANDS, dxSRBAR_COMMANDS);
  cxSetResourceString(@dxSBAR_DESCRIPTION, dxSRBAR_DESCRIPTION);
  cxSetResourceString(@dxSBAR_CUSTOMIZE, dxSRBAR_CUSTOMIZE);
  cxSetResourceString(@dxSBAR_ADDREMOVEBUTTONS, dxSRBAR_ADDREMOVEBUTTONS);
  cxSetResourceString(@dxSBAR_MOREBUTTONS, dxSRBAR_MOREBUTTONS);
  cxSetResourceString(@dxSBAR_RESETTOOLBAR, dxSRBAR_RESETTOOLBAR);
  cxSetResourceString(@dxSBAR_EXPAND, dxSRBAR_EXPAND);
  cxSetResourceString(@dxSBAR_DRAGTOMAKEMENUFLOAT, dxSRBAR_DRAGTOMAKEMENUFLOAT);
  cxSetResourceString(@dxSBAR_TOOLBARNEWNAME, dxSRBAR_TOOLBARNEWNAME);
  cxSetResourceString(@dxSBAR_CATEGORYADD, dxSRBAR_CATEGORYADD);
  cxSetResourceString(@dxSBAR_CATEGORYINSERT, dxSRBAR_CATEGORYINSERT);
  cxSetResourceString(@dxSBAR_CATEGORYRENAME, dxSRBAR_CATEGORYRENAME);
  cxSetResourceString(@dxSBAR_TOOLBARADD, dxSRBAR_TOOLBARADD);
  cxSetResourceString(@dxSBAR_TOOLBARRENAME, dxSRBAR_TOOLBARRENAME);
  cxSetResourceString(@dxSBAR_CATEGORYNAME, dxSRBAR_CATEGORYNAME);
  cxSetResourceString(@dxSBAR_TOOLBARNAME, dxSRBAR_TOOLBARNAME);
  cxSetResourceString(@dxSBAR_CUSTOMIZINGFORM, dxSRBAR_CUSTOMIZINGFORM);
  cxSetResourceString(@dxSBAR_MODIFY, dxSRBAR_MODIFY);
  cxSetResourceString(@dxSBAR_PERSMENUSANDTOOLBARS, dxSRBAR_PERSMENUSANDTOOLBARS);
  cxSetResourceString(@dxSBAR_MENUSSHOWRECENTITEMS, dxSRBAR_MENUSSHOWRECENTITEMS);
  cxSetResourceString(@dxSBAR_SHOWFULLMENUSAFTERDELAY, dxSRBAR_SHOWFULLMENUSAFTERDELAY);
  cxSetResourceString(@dxSBAR_RESETUSAGEDATA, dxSRBAR_RESETUSAGEDATA);
  cxSetResourceString(@dxSBAR_OTHEROPTIONS, dxSRBAR_OTHEROPTIONS);
  cxSetResourceString(@dxSBAR_LARGEICONS, dxSRBAR_LARGEICONS);
  cxSetResourceString(@dxSBAR_HINTOPT1, dxSRBAR_HINTOPT1);
  cxSetResourceString(@dxSBAR_HINTOPT2, dxSRBAR_HINTOPT2);
  cxSetResourceString(@dxSBAR_MENUANIMATIONS, dxSRBAR_MENUANIMATIONS);
  cxSetResourceString(@dxSBAR_MENUANIM1, dxSRBAR_MENUANIM1);
  cxSetResourceString(@dxSBAR_MENUANIM2, dxSRBAR_MENUANIM2);
  cxSetResourceString(@dxSBAR_MENUANIM3, dxSRBAR_MENUANIM3);
  cxSetResourceString(@dxSBAR_MENUANIM4, dxSRBAR_MENUANIM4);
  cxSetResourceString(@dxSBAR_MENUANIM5, dxSRBAR_MENUANIM5);
end;

initialization
    Init;
    
finalization   

end.
