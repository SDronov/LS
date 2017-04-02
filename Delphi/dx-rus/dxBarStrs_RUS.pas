unit dxBarStrs_RUS;

interface

implementation

uses dxBarStrs, cxClasses;

resourcestring

  dxSRBAR_LOOKUPDIALOGCAPTION = '�������� ��������';//'Select value';
  dxSRBAR_LOOKUPDIALOGOK = '��';//'OK';
  dxSRBAR_LOOKUPDIALOGCANCEL = '������';//'Cancel';

  dxSRBAR_DIALOGOK = '��';//'OK';
  dxSRBAR_DIALOGCANCEL = '������';//'Cancel';
  dxSRBAR_COLOR_STR_0 = '������';//'Black';
  dxSRBAR_COLOR_STR_1 = '�����-�������';//'Maroon';
  dxSRBAR_COLOR_STR_2 = '�������';//'Green';
  dxSRBAR_COLOR_STR_3 = '���������';//'Olive';
  dxSRBAR_COLOR_STR_4 = '�����-�����';//'Navy';
  dxSRBAR_COLOR_STR_5 = '���������';//'Purple';
  dxSRBAR_COLOR_STR_6 = '����-���������';//'Teal';
  dxSRBAR_COLOR_STR_7 = '�����';//'Gray';
  dxSRBAR_COLOR_STR_8 = '�����������';//'Silver';
  dxSRBAR_COLOR_STR_9 = '�������';//'Red';
  dxSRBAR_COLOR_STR_10 = '���������';//'Lime';
  dxSRBAR_COLOR_STR_11 = '������';//'Yellow';
  dxSRBAR_COLOR_STR_12 = '�����';//'Blue';
  dxSRBAR_COLOR_STR_13 = '�������';//'Fuchsia';
  dxSRBAR_COLOR_STR_14 = '�������';//'Aqua';
  dxSRBAR_COLOR_STR_15 = '�����';//'White';
  dxSRBAR_COLORAUTOTEXT = '(�������������)';//'(automatic)';
  dxSRBAR_COLORCUSTOMTEXT = '(�����������)';//'(custom)';
  dxSRBAR_DATETODAY = '�������';//'Today';
  dxSRBAR_DATECLEAR = '��������';//'Clear';
  dxSRBAR_DATEDIALOGCAPTION = '�������� ����';//'Select the date';
  dxSRBAR_TREEVIEWDIALOGCAPTION = '�������� �������';//'Select item';
  dxSRBAR_IMAGEDIALOGCAPTION = '�������� �������';//'Select item';
  dxSRBAR_IMAGEINDEX = '������ ��������';//'Image Index';
  dxSRBAR_IMAGETEXT = '�����';//'Text';
  dxSRBAR_PLACEFORCONTROL = '����� ��� ';//'The place for the ';
  dxSRBAR_CANTASSIGNCONTROL = '�� �� ������ ������� ���� � ��� �� ������� ���������� ����� ��� � ����� TdxBarControlContainerItem';//'You cannot assign the same control to more than one TdxBarControlContainerItem.';

  dxSRBAR_WANTTORESETTOOLBAR = '�� ������� ��� ������ �������� ��� ��������� ��������� ��� ������ ������������ ''%s''';//'Are you sure you want to reset the changes made to the ''%s'' toolbar?';
  dxSRBAR_WANTTORESETUSAGEDATA = '����� ������� �������� � ��������, �������������� � ������ ����������, � ������������ ����� ������ �� ���������, ������������ � ���� � �� ������ ������������. ��������� ��������?';//'This will delete the record of the commands you''ve used in this application and restore the default set of visible commands to the menus and toolbars. It will not undo any explicit customizations.   Are you sure you want to proceed?';
  dxSRBAR_BARMANAGERMORETHENONE  = '����� ����� ��������� ������ ���� ��������� TdxBarManager';//'A Form should contain only a single TdxBarManager';
  dxSRBAR_BARMANAGERBADOWNER = 'TdxBarManager ����� ����� � �������� Owner ������ ���������� TCustomForm';//'TdxBarManager should have as its Owner - TForm (TCustomForm)';
  dxSRBAR_NOBARMANAGERS = '��� ��������� TdxBarManager-��';//'There are no TdxBarManagers available';
  dxSRBAR_WANTTODELETETOOLBAR = '�� ������� ��� ������ ������� ������ ������������ ''%s''?';//'Are you sure you want to delete the ''%s'' toolbar?';
  dxSRBAR_WANTTODELETECATEGORY = '�� ������� ��� ������ ������� ��������� ''%s''?';//'Are you sure you want to delete the ''%s'' category?';
  dxSRBAR_WANTTOCLEARCOMMANDS = '�� ������� ��� ������ ������� ��� ������� � ��������� ''%s''?';//'Are you sure you want to delete all commands in the ''%s'' category?';
  dxSRBAR_RECURSIVESUBITEMS = '�� �� ������ ��������� ����������� �������';//'You cannot create recursive subitems';
  dxSRBAR_COMMANDNAMECANNOTBEBLANK = '�������� ������� �� ����� ���� ������. ������� ��������.';//'A command name cannot be blank. Please enter a name.';
  dxSRBAR_TOOLBAREXISTS = '������ ������������ ''%s'' ��� ����������. ������� ������ ��������.';//'A toolbar named ''%s'' already exists. Type another name.';
  dxSRBAR_RECURSIVEGROUPS = '�� �� ������ ��������� ����������� ������';//You cannot create recursive groups';

  dxSRBAR_DEFAULTCATEGORYNAME = '�� ���������';//'Default';

  dxSRBAR_CP_ADDSUBITEM = '�������� &�������';//'Add &SubItem';
  dxSRBAR_CP_ADDBUTTON = '�������� &������';//'Add &Button';
  dxSRBAR_CP_ADDITEM = '�������� &�������';//'Add &Item';
  dxSRBAR_CP_DELETEBAR = '�������';//'Delete Bar';

  dxSRBAR_CP_RESET = '&��������';//'&Reset';
  dxSRBAR_CP_DELETE = '&�������';//'&Delete';
  dxSRBAR_CP_NAME = '&��������:';//'&Name:';
  dxSRBAR_CP_CAPTION = '&���������:';//'&Caption:'; // is the same as dxSRBAR_CP_NAME (at design-time)
  dxSRBAR_CP_DEFAULTSTYLE = '����� �� ����&�����';//'Defa&ult style';
  dxSRBAR_CP_TEXTONLYALWAYS = '������ &����� (������)';//'&Text Only (Always)';
  dxSRBAR_CP_TEXTONLYINMENUS = '&������ ����� (� ����)';//'Text &Only (in Menus)';
  dxSRBAR_CP_IMAGEANDTEXT = '�������� &� �����';//'Image &and Text';
  dxSRBAR_CP_BEGINAGROUP = '������ &������';//'Begin a &Group';
  dxSRBAR_CP_VISIBLE = '&���������';//'&Visible';
  dxSRBAR_CP_MOSTRECENTLYUSED = '&�������� ����� ������������';//'&Most recently used';

  dxSRBAR_ADDEX = '��������...';//'Add...';
  dxSRBAR_RENAMEEX = '�������������...';//'Rename...';
  dxSRBAR_DELETE = '�������';//'Delete';
  dxSRBAR_CLEAR = '��������';//'Clear';
  dxSRBAR_VISIBLE = '���������';//'Visible';
  dxSRBAR_OK = '��';//'OK';
  dxSRBAR_CANCEL = '������';//'Cancel';
  dxSRBAR_SUBMENUEDITOR = '�������� �������...';//'SubMenu Editor...';
  dxSRBAR_SUBMENUEDITORCAPTION = '�������� �������';//'ExpressBars SubMenu Editor';
  dxSRBAR_INSERTEX = '��������...';//'Insert...';

  dxSRBAR_MOVEUP = '������';//'Move Up';
  dxSRBAR_MOVEDOWN = '����';//'Move Down';
  dxSRBAR_POPUPMENUEDITOR = '�������� ������������ ����...';//'PopupMenu Editor...';
  dxSRBAR_TABSHEET1 = ' ������ ������������ ';//' Toolbars ';
  dxSRBAR_TABSHEET2 = ' ������� ';//' Commands ';
  dxSRBAR_TABSHEET3 = ' ��������� ';//' Options ';
  dxSRBAR_TOOLBARS = '�&����� ������������:';//'Toolb&ars:';
  dxSRBAR_TNEW = '&�������';//'&New...';
  dxSRBAR_TRENAME = '�&������������...';//'R&ename...';
  dxSRBAR_TDELETE = '&�������';//'&Delete';
  dxSRBAR_TRESET = '�&�������...';//'&Reset...';
  dxSRBAR_CLOSE = '�������';//'Close';
  dxSRBAR_CAPTION = '���������';//'Customize';
  dxSRBAR_CATEGORIES = '����&�����:';//'Cate&gories:';
  dxSRBAR_COMMANDS = '�����&��:';//'Comman&ds:';
  dxSRBAR_DESCRIPTION = '��������  ';//'Description  ';

  dxSRBAR_CUSTOMIZE = '&���������...';//'&Customize...';
  dxSRBAR_ADDREMOVEBUTTONS = '&�������� ��� ������� ������';//'&Add or Remove Buttons';
  dxSRBAR_MOREBUTTONS = '������ ������';//'More Buttons';
  dxSRBAR_RESETTOOLBAR = '&�������� ��������� ������ ������������';//'&Reset Toolbar';
  dxSRBAR_EXPAND = '�������� (Ctrl+Down)';//'Expand (Ctrl-Down)';
  dxSRBAR_DRAGTOMAKEMENUFLOAT = '���������� ����� ������� ��� ���� ���������';//'Drag to make this menu float';

  dxSRBAR_TOOLBARNEWNAME  = '������ ������������';//'Custom ';
  dxSRBAR_CATEGORYADD  = '�������� ���������';//'Add Category';
  dxSRBAR_CATEGORYINSERT  = '�������� ���������';//'Insert Category';
  dxSRBAR_CATEGORYRENAME  = '������������� ���������';//'Rename Category';
  dxSRBAR_TOOLBARADD  = '�������� ������ ������������';//'Add Toolbar';
  dxSRBAR_TOOLBARRENAME  = '������������� ������ ������������';//'Rename Toolbar';
  dxSRBAR_CATEGORYNAME  = '�������� &���������:';//'&Category name:';
  dxSRBAR_TOOLBARNAME  = '�������� ������ &������������:';//'&Toolbar name:';
  dxSRBAR_CUSTOMIZINGFORM = '����� ���������...';//'Customization Form...';

  dxSRBAR_MODIFY = '...��������';//'... modify';
  dxSRBAR_PERSMENUSANDTOOLBARS = '������������� ���� � ������ ������������  ';//'Personalized Menus and Toolbars  ';
  dxSRBAR_MENUSSHOWRECENTITEMS = '���������� ������� �������� ������������ �������';//'Me&nus show recently used commands first';
  dxSRBAR_SHOWFULLMENUSAFTERDELAY = '���������� ������ ���� ����� �������� ��������';//'Show f&ull menus after a short delay';
  dxSRBAR_RESETUSAGEDATA = '������� �������� �� ������������ ��������';//'&Reset my usage data';

  dxSRBAR_OTHEROPTIONS = '������';//'Other  ';
  dxSRBAR_LARGEICONS = '&������� ������';//'&Large icons';
  dxSRBAR_HINTOPT1 = '���������� &��������� ��� ������';//'Show Tool&Tips on toolbars';
  dxSRBAR_HINTOPT2 = '�������� � ��������� &��������� ������';//'Show s&hortcut keys in ToolTips';
  dxSRBAR_MENUANIMATIONS = '������ ��� ������ &����';//'&Menu animations:';
  dxSRBAR_MENUANIM1 = '(�� ���������)';//'(None)';
  dxSRBAR_MENUANIM2 = '��������� �����';//'Random';
  dxSRBAR_MENUANIM3 = '�������������';//'Unfold';
  dxSRBAR_MENUANIM4 = '��������������';//'Slide';
  dxSRBAR_MENUANIM5 = '��������';//'Fade';

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
