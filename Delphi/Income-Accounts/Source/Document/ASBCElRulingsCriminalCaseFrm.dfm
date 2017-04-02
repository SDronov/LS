inherited ASBCElRulingsCriminalCaseForm: TASBCElRulingsCriminalCaseForm
  Left = 402
  Top = 206
  Width = 835
  Height = 698
  Caption = 'ASBCElRulingsCriminalCaseForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 819
    Height = 660
    ActivePage = tabGeneral
    ClientRectBottom = 636
    ClientRectRight = 819
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 813
        Height = 605
        inherited edtName: TcxDBTextEdit
          Left = 137
          Top = 480
          TabOrder = 23
        end
        inherited edtDescript: TcxDBMemo
          Left = 137
          Top = 505
          TabOrder = 24
          Width = 739
        end
        object cxDBTextEdit3: TcxDBTextEdit [2]
          Left = 137
          Top = 194
          DataBinding.DataField = 'INVESTIGATORNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Width = 121
        end
        object cxDBTextEdit4: TcxDBTextEdit [3]
          Left = 137
          Top = 221
          DataBinding.DataField = 'INVESTIGATORPOST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 200
        end
        inherited edtPayer: TfdcObjectLinkEdit
          Left = 137
          Width = 739
        end
        inherited cxDBMaskEdit1: TcxDBMaskEdit
          Left = 137
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Left = 403
        end
        inherited cxDBMaskEdit2: TcxDBMaskEdit
          Left = 137
        end
        inherited cxLabel1: TcxLabel
          Left = 699
        end
        inherited cxDBComboBox2: TcxDBComboBox
          Left = 302
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 387
          TabOrder = 21
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 387
          TabOrder = 22
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Left = 137
        end
        inherited edtOverridedTPO: TfdcObjectLinkEdit
          Left = 137
          Width = 316
        end
        inherited cxDBCheckBox1: TcxDBCheckBox
          Top = 248
          TabOrder = 15
          Width = 1285
        end
        inherited cxDBMaskEdit3: TcxDBMaskEdit
          Left = 137
          Top = 275
          TabOrder = 16
        end
        inherited cxDBMaskEdit4: TcxDBMaskEdit
          Left = 372
          Top = 275
          TabOrder = 18
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Left = 543
          Top = 275
          TabOrder = 19
        end
        inherited cxDBDateEdit3: TcxDBDateEdit
          Left = 137
        end
        inherited edtEXP: TcxDBDateEdit
          Left = 372
        end
        inherited edtvaldocnumb: TcxDBTextEdit
          Left = 137
        end
        inherited edtvaldocdate: TcxDBDateEdit
          Left = 372
        end
        inherited edtstatusforall: TcxDBTextEdit
          Left = 403
        end
        inherited edtUIN: TcxDBTextEdit
          Left = 137
          Top = 302
          TabOrder = 17
        end
        inherited edtNUIN: TcxDBTextEdit
          Left = 137
          Top = 329
          TabOrder = 20
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup1: TdxLayoutGroup
            inherited lcGeneralGroup2: TdxLayoutGroup
              inherited lcGeneralGroup3: TdxLayoutGroup
                inherited lcGeneralItem5: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088' '#1091#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1076#1077#1083#1072
                end
                inherited lcGeneralItem3: TdxLayoutItem
                  Caption = #1044#1072#1090#1072' '#1091#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1076#1077#1083#1072
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
          object lcgeneralGroupInvestigator: TdxLayoutGroup [2]
            ShowCaption = False
            ShowBorder = False
            object lcGeneralItem17: TdxLayoutItem
              Caption = #1060#1048#1054' '#1076#1086#1079#1085#1072#1074#1072#1090#1077#1083#1103
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Enabled = False
              Control = cxDBTextEdit3
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem18: TdxLayoutItem
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1079#1085#1072#1074#1072#1090#1077#1083#1103
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Enabled = False
              Control = cxDBTextEdit4
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNUIN: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 819
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 605
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 633
        Width = 819
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 816
        Height = 605
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 819
        Height = 636
        ClientRectBottom = 612
        ClientRectRight = 819
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
      AllowCustomizing = True
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
      '          '#39#39' METH_MOVE,'
      '       decode (t.status,0,'#39#1044#1077#1081#1089#1090#1074#1091#1077#1090#39',1,'#39#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086#39') sstatus,'
      
        '----------------------------------------------------------------' +
        '--------------------'
      '       r.REL_OBJECT_ID AS OverridedDocId,'
      '       (SELECT cd.decl_no '
      '          FROM fdc_doc_charge_lst cd '
      '          WHERE cd.id = r.REL_OBJECT_ID ) AS Annul_DeclNo'
      '  from asbc_elrulings_lst t, fdc_rel_override_doc_lst r'
      ' where t.ID = :ID AND'
      '       t.id = r.OBJECT_ID(+)     ')
  end
end
