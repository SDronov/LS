inherited ProcedureForm: TProcedureForm
  Caption = #1061#1088#1072#1085#1080#1084#1072#1103' '#1087#1088#1086#1094#1077#1076#1091#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 291
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtDescript: TcxDBMemo
          Height = 161
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 268
        ClientRectRight = 492
        ClientRectTop = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Procedure_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_PROCEDURE_LST'
  end
end
