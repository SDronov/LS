inherited ASBCElRulingsResolutionForm: TASBCElRulingsResolutionForm
  Left = 499
  Top = 366
  Width = 1025
  Caption = 'ASBCElRulingsResolutionForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1009
    ClientRectRight = 1009
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1003
        inherited edtName: TcxDBTextEdit
          Top = 444
          TabOrder = 23
        end
        inherited edtDescript: TcxDBMemo
          Top = 469
          TabOrder = 24
          Width = 1234
        end
        object cxDBMaskEdit5: TcxDBMaskEdit [2]
          Left = 54
          Top = 333
          DataBinding.DataField = 'VALDOC_NUMB'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 121
        end
        object cxDBDateEdit2: TcxDBDateEdit [3]
          Left = 209
          Top = 333
          DataBinding.DataField = 'VALDOC_DATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 121
        end
        inherited edtPayer: TfdcObjectLinkEdit
          Width = 724
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Left = 391
        end
        inherited cxLabel1: TcxLabel
          Left = 732
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 404
          TabOrder = 21
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 404
          TabOrder = 22
        end
        inherited edtOverridedTPO: TfdcObjectLinkEdit
          Width = 122
        end
        inherited cxDBCheckBox1: TcxDBCheckBox
          Width = 837
        end
        inherited cxDBMaskEdit4: TcxDBMaskEdit
          Left = 405
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Left = 576
        end
        inherited edtEXP: TcxDBDateEdit
          Left = 405
          DataBinding.DataField = 'EXPIRYDATE'
          DataBinding.DataSource = srcData
          Enabled = False
        end
        inherited edtvaldocdate: TcxDBDateEdit
          Left = 405
        end
        inherited edtstatusforall: TcxDBTextEdit
          Left = 391
          Enabled = False
        end
        inherited edtNUIN: TcxDBTextEdit
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup1: TdxLayoutGroup
            inherited lcGeneralGroup2: TdxLayoutGroup
              inherited lcGeneralGroup3: TdxLayoutGroup
                inherited lcGeneralItem5: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
                end
                inherited lcGeneralItem3: TdxLayoutItem
                  Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
                end
              end
              inherited lcGeneralGroup7: TdxLayoutGroup
                inherited lciEXP: TdxLayoutItem
                  Caption = #1057#1088#1086#1082' '#1076#1086#1073#1088#1086#1074#1086#1083#1100#1085#1086#1081' '#1091#1087#1083#1072#1090#1099
                end
              end
              inherited lcgvaldoc: TdxLayoutGroup
                inherited lcivaldocnumb: TdxLayoutItem
                  Visible = False
                end
                inherited lcivaldocdate: TdxLayoutItem
                  Visible = False
                end
              end
            end
          end
          object lcGeneralGroup8: TdxLayoutGroup [5]
            Caption = #1040#1082#1090' '#1086' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1080' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
            LayoutDirection = ldHorizontal
            object lcGeneralItem17: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088
              Control = cxDBMaskEdit5
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem18: TdxLayoutItem
              Caption = #1044#1072#1090#1072
              Enabled = False
              Control = cxDBDateEdit2
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1009
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Width = 1009
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1006
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1009
        ClientRectRight = 1009
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
        FloatLeft = 237
        FloatTop = 492
        FloatClientWidth = 113
        FloatClientHeight = 204
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
            Item = bbPrint
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
          end
          item
            BeginGroup = True
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = dxBarButton3
            Visible = True
          end
          item
            Item = dxBarButton4
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
    inherited btnStateTransit: TdxBarSubItem
      ItemLinks = <
        item
          UserCaption = #1072' '#1055#1099#1097#1100
          UserDefine = [udCaption]
          Visible = True
        end>
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'DECL_NO'
        ParamType = ptUnknown
        SourceField = ASBCElRulingsForm.dsDataNAME
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = ASBCElRulingsForm.dsDataSUBJECT_ID
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'pDocID'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'AnnulOnly'
        ParamType = ptUnknown
        Value = True
        AcceptedSources = [asParam]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*,'
      '---------------- '#1044#1083#1103' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1072#1085#1094#1077#1089#1090#1086#1088#1072'-------------------'
      '          0 NUM_MPO,'
      '          0 SUM_RUB,'
      '          '#39#39' REGIM,'
      '          '#39#39' METH_MOVE,       '
      
        '          decode (t.status,0,'#39#1044#1077#1081#1089#1090#1074#1091#1077#1090#39',1,'#39#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086#39') sstatus' +
        ','
      
        '----------------------------------------------------------------' +
        '--------------------'
      '       r.REL_OBJECT_ID AS OverridedDocId,'
      '       (SELECT cd.decl_no '
      '          FROM fdc_doc_charge_lst cd '
      '          WHERE cd.id = r.REL_OBJECT_ID ) AS Annul_DeclNo'
      '  from asbc_elrulings_lst t, fdc_rel_override_doc_lst r'
      ' where t.ID = :ID AND'
      '       t.id = r.OBJECT_ID(+)     ')
    inherited dsDataINVESTIGATORPOST: TStringField
      Size = 50
    end
    inherited dsDataINVESTIGATORNAME: TStringField
      Size = 50
    end
  end
end
