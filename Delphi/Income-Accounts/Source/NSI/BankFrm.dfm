inherited BankForm: TBankForm
  Left = 288
  Top = 169
  Width = 744
  Height = 481
  Caption = 'BankForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 736
    Height = 447
    ClientRectBottom = 423
    ClientRectRight = 736
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 303
        end
        inherited edtDescript: TcxDBMemo
          Top = 40
          Height = 7
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 736
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 392
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 420
        Width = 736
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 733
        Height = 392
      end
      inherited lcMain: TdxLayoutControl
        Width = 730
        Height = 392
        TabOrder = 4
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 84
          Width = 449
        end
        inherited edtOKPO: TcxDBMaskEdit
          Width = 142
        end
        inherited edtINN: TcxDBMaskEdit
          Top = 34
          Width = 141
        end
        inherited edtOGRN: TcxDBMaskEdit
          Width = 63
        end
        inherited edtAddress: TcxDBTextEdit
          Top = 109
          Width = 340
        end
        inherited edtPhone: TcxDBTextEdit
          Top = 134
        end
        inherited edtFax: TcxDBTextEdit
          Top = 134
          Width = 203
        end
        inherited edtTelex: TcxDBTextEdit
          Top = 159
        end
        inherited edtSOATO: TcxDBMaskEdit
          Top = 34
          Width = 104
        end
        inherited edtTeletype: TcxDBTextEdit
          Top = 159
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 59
        end
        inherited edtTeleGraph: TcxDBTextEdit
          Top = 159
        end
        object edtBIC: TcxDBMaskEdit [12]
          Left = 43
          Top = 215
          DataBinding.DataField = 'BIC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 200
        end
        object edtRurLicDate: TcxDBDateEdit [13]
          Left = 222
          Top = 253
          DataBinding.DataField = 'RUR_LIC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 16
          Width = 101
        end
        object edtValLicDate: TcxDBDateEdit [14]
          Left = 222
          Top = 278
          DataBinding.DataField = 'VAL_LIC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 17
          Width = 101
        end
        object edtChiefName: TcxDBTextEdit [15]
          Left = 222
          Top = 303
          DataBinding.DataField = 'CHIEF_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 18
          Width = 490
        end
        object edtChiefAccName: TcxDBTextEdit [16]
          Left = 222
          Top = 328
          DataBinding.DataField = 'CHIEF_ACC_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 727
        end
        object edtCorrAcount: TcxDBTextEdit [17]
          Left = 306
          Top = 215
          DataBinding.DataField = 'CORR_ACCOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 20
          Width = 193
        end
        inherited dxLayoutGroup3s: TdxLayoutGroup
          inherited dxLayoutGroup2s: TdxLayoutGroup
            inherited lcMainGroup1s: TdxLayoutGroup
              object lcMainGroup1: TdxLayoutGroup
                Caption = #1041#1072#1085#1082
                object lcMainGroup4: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lcMainItem1: TdxLayoutItem
                    Caption = #1041#1048#1050
                    Control = edtBIC
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem7: TdxLayoutItem
                    Caption = #1050#1086#1088#1088'. '#1089#1095#1105#1090
                    Control = edtCorrAcount
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainGroup2: TdxLayoutGroup
                  Caption = 'New Group'
                  ShowCaption = False
                  object lcMainItem3: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1091#1073#1083#1077#1074#1086#1081' '#1083#1080#1094#1077#1085#1079#1080#1080
                    Control = edtRurLicDate
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem4: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1074#1072#1083#1102#1090#1085#1086#1081' '#1083#1080#1094#1077#1085#1079#1080#1080
                    Control = edtValLicDate
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem5: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100' '#1087#1088#1072#1074#1083#1077#1085#1080#1103
                    Control = edtChiefName
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainItem6: TdxLayoutItem
                    Caption = #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
                    Control = edtChiefAccName
                    ControlOptions.ShowBorder = False
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabDocList: TcxTabSheet
      inherited pcDocList: TcxPageControl
        Width = 671
        Height = 437
        ClientRectBottom = 433
        ClientRectRight = 667
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 736
        Height = 423
        ClientRectBottom = 399
        ClientRectRight = 736
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
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
        FloatLeft = 295
        FloatTop = 163
        FloatClientWidth = 127
        FloatClientHeight = 55
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
      'select *'
      '  from fdc_Bank_Lst'
      ' where ID = :ID')
    object dsDataBIC: TStringField
      DisplayLabel = #1041#1048#1050
      FieldName = 'BIC'
      Required = True
      Size = 10
    end
    object dsDataRUR_LIC_DATE: TDateTimeField
      FieldName = 'RUR_LIC_DATE'
    end
    object dsDataVAL_LIC_DATE: TDateTimeField
      FieldName = 'VAL_LIC_DATE'
    end
    object dsDataCHIEF_NAME: TStringField
      FieldName = 'CHIEF_NAME'
      Size = 100
    end
    object dsDataCHIEF_ACC_NAME: TStringField
      FieldName = 'CHIEF_ACC_NAME'
      Size = 100
    end
    object dsDataCORR_ACCOUNT: TStringField
      DisplayLabel = #1050#1086#1088#1088'. '#1089#1095#1105#1090
      FieldName = 'CORR_ACCOUNT'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_bank_add(pname => :name,'
      '                            paddress => :address,'
      '                            pfullname => :full_name,'
      '                            pokpo => :okpo,'
      '                            pinn => :inn,'
      '                            pogrn => :ogrn,'
      '                            psoato => :soato,'
      '                            pkpp => :kpp,'
      '                            pphone => :phone,'
      '                            pfax => :fax,'
      '                            ptelex => :telex,'
      '                            pteletype => :teletype,'
      '                            pbic => :bic,'
      '                            prurlicdate => :rur_lic_date,'
      '                            pvallicdate => :val_lic_date,'
      '                            pchiefname => :chief_name,'
      '                            pchiefaccname => :chief_acc_name);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'FULL_NAME'
        ParamType = ptUnknown
        Size = 4001
      end
      item
        DataType = ftFloat
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'INN'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftFloat
        Name = 'SOATO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'PHONE'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELETYPE'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftFloat
        Name = 'BIC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'RUR_LIC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'VAL_LIC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CHIEF_NAME'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CHIEF_ACC_NAME'
        ParamType = ptUnknown
        Size = 101
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      ' fdc_bank_upd(pid => :id, '
      '                   pname => :name,'
      '                            paddress => :address,'
      '                            pfullname => :full_name,'
      '                            pokpo => :okpo,'
      '                            pinn => :inn,'
      '                            pogrn => :ogrn,'
      '                            psoato => :soato,'
      '                            pkpp => :kpp,'
      '                            pphone => :phone,'
      '                            pfax => :fax,'
      '                            ptelex => :telex,'
      '                            pteletype => :teletype,'
      '                            pbic => :bic,'
      '                            prurlicdate => :rur_lic_date,'
      '                            pvallicdate => :val_lic_date,'
      '                            pchiefname => :chief_name,'
      '                            pchiefaccname => :chief_acc_name,'
      '                            pCorrAccount => :corr_account);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'FULL_NAME'
        ParamType = ptUnknown
        Size = 4001
      end
      item
        DataType = ftFloat
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'INN'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftFloat
        Name = 'SOATO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'PHONE'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELEX'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'TELETYPE'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftFloat
        Name = 'BIC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'RUR_LIC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'VAL_LIC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CHIEF_NAME'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CHIEF_ACC_NAME'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'corr_account'
        ParamType = ptInput
        Size = 20
      end>
  end
end
