inherited NonIDCustomChequeForm: TNonIDCustomChequeForm
  Left = 456
  Top = 61
  Width = 1300
  Height = 858
  Caption = 'NonIDCustomChequeForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1284
    Height = 820
    ClientRectBottom = 796
    ClientRectRight = 1284
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1278
        Height = 765
        inherited edtName: TcxDBTextEdit
          Width = 1048
        end
        inherited edtDescript: TcxDBMemo
          Top = 733
          TabOrder = 34
          Height = 91
          Width = 1098
        end
        object edtPaySysName: TcxDBMaskEdit [2]
          Left = 203
          Top = 67
          DataBinding.DataField = 'PAYSYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Width = 121
        end
        object edtCardNum: TcxDBMaskEdit [3]
          Left = 203
          Top = 91
          DataBinding.DataField = 'CARDNUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 540
        end
        inherited edtPayerINN: TcxDBTextEdit
          Left = 203
          Top = 213
          TabOrder = 8
          Width = 201
        end
        inherited edtPayerKPP: TcxDBTextEdit
          Left = 1101
          Top = 213
          TabOrder = 9
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Left = 203
          Top = 237
          TabOrder = 10
          Width = 121
        end
        inherited edtCurrency: TfdcObjectLookupEdit
          Left = 203
          Top = 469
          TabOrder = 20
        end
        inherited edtPayType: TfdcObjectLookupEdit
          Left = 683
          Top = 469
          TabOrder = 22
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Left = 203
          Top = 493
          TabOrder = 23
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 554
          Top = 493
          TabOrder = 24
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 554
          Top = 517
          TabOrder = 26
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 203
          Top = 517
          TabOrder = 25
        end
        inherited edtPayTypeName: TcxDBTextEdit
          Left = 203
          Top = 541
          TabOrder = 27
          Width = 121
        end
        inherited edtKBK: TcxDBTextEdit
          Left = 409
          Top = 469
          TabOrder = 21
        end
        inherited edtPayerBIK: TcxDBTextEdit
          Left = 203
          Top = 261
          TabOrder = 11
        end
        inherited edtPayerAccount: TcxDBTextEdit
          Left = 405
          Top = 261
          TabOrder = 12
          Width = 121
        end
        inherited edtRecepientINN: TcxDBTextEdit
          Left = 203
          Top = 353
          TabOrder = 15
          Width = 121
        end
        inherited edtRecepientKPP: TcxDBTextEdit
          Left = 1101
          Top = 353
          TabOrder = 16
        end
        inherited edtRecepientName: TcxDBTextEdit
          Left = 203
          Top = 377
          TabOrder = 17
          Width = 121
        end
        inherited edtRecepientBIK: TcxDBTextEdit
          Left = 203
          Top = 401
          TabOrder = 18
        end
        inherited edtRecepientAccount: TcxDBTextEdit
          Left = 405
          Top = 401
          TabOrder = 19
          Width = 121
        end
        inherited edtValPaymentReason: TcxDBTextEdit
          Left = 203
          Top = 633
          TabOrder = 29
        end
        inherited edtValPaymentType: TcxDBTextEdit
          Left = 344
          Top = 633
          TabOrder = 30
        end
        inherited edtValDocNumber: TcxDBTextEdit
          Left = 203
          Top = 657
          TabOrder = 31
        end
        inherited edtValDocDate: TcxDBDateEdit
          Left = 510
          Top = 657
          TabOrder = 32
        end
        inherited edtDestCustomsCode: TfdcObjectLinkEdit
          Left = 203
          Top = 329
          TabOrder = 13
          Width = 121
        end
        inherited edtDestCustomsName: TcxTextEdit
          Left = 330
          Top = 329
          TabOrder = 14
          Width = 121
        end
        inherited EdtUIN: TcxDBTextEdit
          Left = 203
          Top = 681
          TabOrder = 33
          Width = 214
        end
        object cxDBTextEdit1: TcxDBTextEdit [29]
          Left = 203
          Top = 609
          DataBinding.DataField = 'DT_NUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = False
          TabOrder = 28
          Width = 121
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 203
          Top = 115
          TabOrder = 3
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1119
          Top = 115
          Style.IsFontAssigned = True
          TabOrder = 4
        end
        inherited edtUIN2: TcxDBTextEdit
          Top = 759
          TabOrder = 35
          Width = 682
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 142
          Style.IsFontAssigned = True
          TabOrder = 5
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 142
          Style.IsFontAssigned = True
          TabOrder = 6
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = 142
          Style.IsFontAssigned = True
          TabOrder = 7
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            object lciPaySysName: TdxLayoutItem [0]
              Tag = 33
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099' '
              Control = edtPaySysName
              ControlOptions.ShowBorder = False
            end
            object lcCardNum: TdxLayoutItem [1]
              Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
              Control = edtCardNum
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgGeneralRecepient: TdxLayoutGroup
            inherited lcGeneralGroup10: TdxLayoutGroup
              inherited lcgDestCustomsCode: TdxLayoutGroup
                inherited lciDestCustoms: TdxLayoutItem
                  CaptionOptions.AlignHorz = taLeftJustify
                end
              end
            end
          end
          inherited lcgGeneralVals: TdxLayoutGroup
            object lcGeneralItem2: TdxLayoutItem [0]
              Caption = #1053#1086#1084#1077#1088' '#1044#1058
              Control = cxDBTextEdit1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1284
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 765
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 793
        Width = 1284
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1281
        Height = 765
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1284
        Height = 796
        ClientRectBottom = 772
        ClientRectRight = 1284
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 356
        FloatTop = 342
        FloatClientWidth = 103
        FloatClientHeight = 78
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = barBtnCreateSubj
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
      'select'
      ' t.*, ot.NAME AS PO_TYPE_NAME'
      
        ' ,(SELECT max(id) FROM fdc_customs_lst c WHERE c.customs_code_8 ' +
        '= t.DestCustomsCode)AS Customs_ID'
      
        ' ,t.destcustomscode ||'#39'/'#39'|| to_char(t.val_doc_date, '#39'ddmmyy'#39') ||' +
        #39'/'#39'|| t.val_doc_number DT_NUM'
      'from'
      ' Fdc_Po_Nonid_Cheque_Lst_All t,  fdc_object_type  ot'
      'where'
      ' ot.id (+) = t.PAYMENT_ORDER_TYPE_ID'
      ' AND t.ID = :ID')
    object dsDataPAYSYSNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099
      FieldName = 'PAYSYSNAME'
      Size = 70
    end
    object dsDataCARDNUM: TStringField
      FieldName = 'CARDNUM'
      Size = 19
    end
    object dsDataDT_NUM: TStringField
      FieldName = 'DT_NUM'
      ReadOnly = True
      Size = 25
    end
  end
end
