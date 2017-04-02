set DCC32="C:\Program Files\Borland\Delphi7\Bin\dcc32.exe"
set BPLDIR=%SystemRoot%\system32
set FLAGS=-B -Q

%DCC32% "..\..\XP Theme Manager\Packages\dxThemeD7.dpk" %FLAGS% -U"..\..\XP Theme Manager\Sources;." -R"..\..\XP Theme Manager\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressCommon Library\Packages\dxComnD7.dpk" %FLAGS% -U"..\..\ExpressCommon Library\Sources;." -R"..\..\ExpressCommon Library\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressLibrary\Packages\cxLibraryVCLD7.dpk" %FLAGS% -U"..\..\ExpressLibrary\Sources;." -R"..\..\ExpressLibrary\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressLibrary\Packages\dclcxLibraryVCLD7.dpk" %FLAGS% -U"..\..\ExpressLibrary\Sources;." -R"..\..\ExpressLibrary\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDataController\Packages\cxDataD7.dpk" %FLAGS% -U"..\..\ExpressDataController\Sources;." -R"..\..\ExpressDataController\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDataController\Packages\cxBDEAdaptersD7.dpk" %FLAGS% -U"..\..\ExpressDataController\Sources;." -R"..\..\ExpressDataController\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDataController\Packages\cxADOAdaptersD7.dpk" %FLAGS% -U"..\..\ExpressDataController\Sources;." -R"..\..\ExpressDataController\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDataController\Packages\cxIBXAdaptersD7.dpk" %FLAGS% -U"..\..\ExpressDataController\Sources;." -R"..\..\ExpressDataController\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxBarD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxBarDBNavD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxBarExtDBItemsD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxBarD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxDockingD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxsbD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dxBarExtItemsD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxBarDBNavD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxBarExtDBItemsD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxBarExtItemsD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxDockingD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressBars 5\Packages\dcldxsbD7.dpk" %FLAGS% -U"..\..\ExpressBars 5\Sources;." -R"..\..\ExpressBars 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressEditors Library 5\Packages\cxEditorsVCLD7.dpk" %FLAGS% -U"..\..\ExpressEditors Library 5\Sources;." -R"..\..\ExpressEditors Library 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressEditors Library 5\Packages\cxExtEditorsVCLD7.dpk" %FLAGS% -U"..\..\ExpressEditors Library 5\Sources;." -R"..\..\ExpressEditors Library 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressEditors Library 5\Packages\dclcxEditorsVCLD7.dpk" %FLAGS% -U"..\..\ExpressEditors Library 5\Sources;." -R"..\..\ExpressEditors Library 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressEditors Library 5\Packages\dclcxExtEditorsVCLD7.dpk" %FLAGS% -U"..\..\ExpressEditors Library 5\Sources;." -R"..\..\ExpressEditors Library 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressPageControl 2\Packages\cxPageControlVCLD7.dpk" %FLAGS% -U"..\..\ExpressPageControl 2\Sources;." -R"..\..\ExpressPageControl 2\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressPageControl 2\Packages\dclcxPageControlVCLD7.dpk" %FLAGS% -U"..\..\ExpressPageControl 2\Sources;." -R"..\..\ExpressPageControl 2\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressExport Library\Packages\cxExportVCLD7.dpk" %FLAGS% -U"..\..\ExpressExport Library\Sources;." -R"..\..\ExpressExport Library\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressQuantumGrid 5\Packages\cxGridVCLD7.dpk" %FLAGS% -U"..\..\ExpressQuantumGrid 5\Sources;." -R"..\..\ExpressQuantumGrid 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressQuantumGrid 5\Packages\dclcxGridVCLD7.dpk" %FLAGS% -U"..\..\ExpressQuantumGrid 5\Sources;." -R"..\..\ExpressQuantumGrid 5\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressScheduler 2\Packages\cxSchedulerVCLD7.dpk" %FLAGS% -U"..\..\ExpressScheduler 2\Sources;." -R"..\..\ExpressScheduler 2\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressScheduler 2\Packages\dclcxSchedulerVCLD7.dpk" %FLAGS% -U"..\..\ExpressScheduler 2\Sources;." -R"..\..\ExpressScheduler 2\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressQuantumTreeList 4\Packages\cxTreeListVCLD7.dpk" %FLAGS% -U"..\..\ExpressQuantumTreeList 4\Sources;." -R"..\..\ExpressQuantumTreeList 4\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressQuantumTreeList 4\Packages\dclcxTreeListVCLD7.dpk" %FLAGS% -U"..\..\ExpressQuantumTreeList 4\Sources;." -R"..\..\ExpressQuantumTreeList 4\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressVerticalGrid\Packages\cxVerticalGridVCLD7.dpk" %FLAGS% -U"..\..\ExpressVerticalGrid\Sources;." -R"..\..\ExpressVerticalGrid\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressVerticalGrid\Packages\dclcxVerticalGridVCLD7.dpk" %FLAGS% -U"..\..\ExpressVerticalGrid\Sources;." -R"..\..\ExpressVerticalGrid\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressPivotGrid\Packages\cxPivotGridD7.dpk" %FLAGS% -U"..\..\ExpressPivotGrid\Sources;." -R"..\..\ExpressPivotGrid\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressPivotGrid\Packages\dclcxPivotGridD7.dpk" %FLAGS% -U"..\..\ExpressPivotGrid\Sources;." -R"..\..\ExpressPivotGrid\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressSpreadSheet\Packages\cxSpreadSheetVCLD7.dpk" %FLAGS% -U"..\..\ExpressSpreadSheet\Sources;." -R"..\..\ExpressSpreadSheet\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressSpreadSheet\Packages\dclcxSpreadSheetVCLD7.dpk" %FLAGS% -U"..\..\ExpressSpreadSheet\Sources;." -R"..\..\ExpressSpreadSheet\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressGDI+ Library\Packages\dxGDIPlusD7.dpk" %FLAGS% -U"..\..\ExpressGDI+ Library\Sources;." -R"..\..\ExpressGDI+ Library\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressNavBar\Packages\dxNavBarD7.dpk" %FLAGS% -U"..\..\ExpressNavBar\Sources;." -R"..\..\ExpressNavBar\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressNavBar\Packages\dcldxNavBarD7.dpk" %FLAGS% -U"..\..\ExpressNavBar\Sources;." -R"..\..\ExpressNavBar\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressMasterView\Packages\dxMasterViewD7.dpk" %FLAGS% -U"..\..\ExpressMasterView\Sources;." -R"..\..\ExpressMasterView\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressMasterView\Packages\dcldxMasterViewD7.dpk" %FLAGS% -U"..\..\ExpressMasterView\Sources;." -R"..\..\ExpressMasterView\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressMemData\Packages\dxmdsD7.dpk" %FLAGS% -U"..\..\ExpressMemData\Sources;." -R"..\..\ExpressMemData\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressMemData\Packages\dcldxmdsD7.dpk" %FLAGS% -U"..\..\ExpressMemData\Sources;." -R"..\..\ExpressMemData\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDBTree Suite\Packages\dxdbtrD7.dpk" %FLAGS% -U"..\..\ExpressDBTree Suite\Sources;." -R"..\..\ExpressDBTree Suite\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDBTree Suite\Packages\dxtrmdD7.dpk" %FLAGS% -U"..\..\ExpressDBTree Suite\Sources;." -R"..\..\ExpressDBTree Suite\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDBTree Suite\Packages\dcldxdbtrD7.dpk" %FLAGS% -U"..\..\ExpressDBTree Suite\Sources;." -R"..\..\ExpressDBTree Suite\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressDBTree Suite\Packages\dcldxtrmdD7.dpk" %FLAGS% -U"..\..\ExpressDBTree Suite\Sources;." -R"..\..\ExpressDBTree Suite\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressOrgChart\Packages\dxOrgCD7.dpk" %FLAGS% -U"..\..\ExpressOrgChart\Sources;." -R"..\..\ExpressOrgChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressOrgChart\Packages\dxDBOrd7.dpk" %FLAGS% -U"..\..\ExpressOrgChart\Sources;." -R"..\..\ExpressOrgChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressOrgChart\Packages\dcldxOrgCD7.dpk" %FLAGS% -U"..\..\ExpressOrgChart\Sources;." -R"..\..\ExpressOrgChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressOrgChart\Packages\dcldxDBOrD7.dpk" %FLAGS% -U"..\..\ExpressOrgChart\Sources;." -R"..\..\ExpressOrgChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressFlowChart\Packages\dxFlowChartD7.dpk" %FLAGS% -U"..\..\ExpressFlowChart\Sources;." -R"..\..\ExpressFlowChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressFlowChart\Packages\dcldxFlowChartD7.dpk" %FLAGS% -U"..\..\ExpressFlowChart\Sources;." -R"..\..\ExpressFlowChart\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressLayout Control\Packages\dxLayoutControlD7.dpk" %FLAGS% -U"..\..\ExpressLayout Control\Sources;." -R"..\..\ExpressLayout Control\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressLayout Control\Packages\dxLayoutControlcxEditAdaptersD7.dpk" %FLAGS% -U"..\..\ExpressLayout Control\Sources;." -R"..\..\ExpressLayout Control\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressLayout Control\Packages\dcldxLayoutControlD7.dpk" %FLAGS% -U"..\..\ExpressLayout Control\Sources;." -R"..\..\ExpressLayout Control\Sources" -N"." -LE"." -LN"."
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSCoreD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dcldxPSCoreD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSLnksD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxCommonD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxGridLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxPCProdD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxPivotGridLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxScheduler2LnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxSSLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPscxTLLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxVGridLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSTeeChartD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxOCLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxDBTVLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxFCLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxLCLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxMVLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSdxDBOCLnkD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPScxExtCommonD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPsPrVwAdvD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
%DCC32% "..\..\ExpressPrinting System\Packages\dxPSDBTeeChartD7.dpk" %FLAGS% -U"..\..\ExpressPrinting System\Sources;.;" -R"..\..\ExpressPrinting System\Sources" -N"." -LE"." -LN"." -D;
del *d7.dcu
move dx*.bpl %BPLDIR%
move cx*.bpl %BPLDIR%