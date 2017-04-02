inherited ASBCElRulingsPropertyForm: TASBCElRulingsPropertyForm
  Left = 665
  Top = 405
  Width = 915
  Height = 666
  Caption = 'ASBCElRulingsPropertyForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 899
    Height = 628
    ClientRectBottom = 604
    ClientRectRight = 899
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 893
        Height = 573
        inherited edtName: TcxDBTextEdit
          Top = 431
          TabOrder = 22
        end
        inherited edtDescript: TcxDBMemo
          Top = 456
          TabOrder = 23
          Width = 1234
        end
        object cxDBComboBox3: TcxDBComboBox [2]
          Left = 134
          Top = 221
          DataBinding.DataField = 'SSTATUS'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.Items.Strings = (
            #1044#1077#1081#1089#1090#1074#1091#1077#1090
            #1055#1088#1077#1082#1088#1072#1097#1077#1085#1086)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 14
          Width = 121
        end
        inherited edtPayer: TfdcObjectLinkEdit
          Width = 1234
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Left = 369
        end
        inherited cxLabel1: TcxLabel
          Left = 1361
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 360
          TabOrder = 20
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 360
          TabOrder = 21
        end
        inherited edtOverridedTPO: TfdcObjectLinkEdit
          Width = 1221
        end
        inherited cxDBCheckBox1: TcxDBCheckBox
          Width = 1347
        end
        inherited cxDBMaskEdit3: TcxDBMaskEdit
          Top = 248
          TabOrder = 15
        end
        inherited cxDBMaskEdit4: TcxDBMaskEdit
          Top = 248
          TabOrder = 17
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 248
          TabOrder = 18
          Width = 1234
        end
        inherited edtstatusforall: TcxDBTextEdit
          Left = 369
        end
        inherited edtUIN: TcxDBTextEdit
          Top = 275
          TabOrder = 16
        end
        inherited edtNUIN: TcxDBTextEdit
          Top = 302
          TabOrder = 19
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup1: TdxLayoutGroup
            inherited lcGeneralGroup2: TdxLayoutGroup
              inherited lcGeneralGroup3: TdxLayoutGroup
                inherited lcGeneralItem5: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                end
                inherited lcGeneralItem3: TdxLayoutItem
                  Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                end
              end
            end
          end
          object lcGeneralItem17: TdxLayoutItem [3]
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Enabled = False
            Visible = False
            Control = cxDBComboBox3
            ControlOptions.ShowBorder = False
          end
          inherited lciNUIN: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 899
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 573
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 601
        Width = 899
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 896
        Height = 573
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 899
        Height = 604
        ClientRectBottom = 580
        ClientRectRight = 899
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
      
        '----------------------------------------------------------------' +
        '--------------------'
      '       decode (t.status,0,'#39#1044#1077#1081#1089#1090#1074#1091#1077#1090#39',1,'#39#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086#39') sstatus,'
      '       r.REL_OBJECT_ID AS OverridedDocId,'
      '       (SELECT cd.decl_no '
      '          FROM fdc_doc_charge_lst cd '
      '          WHERE cd.id = r.REL_OBJECT_ID ) AS Annul_DeclNo'
      '  from asbc_elrulings_lst t, fdc_rel_override_doc_lst r'
      ' where t.ID = :ID AND'
      '       t.id = r.OBJECT_ID(+)     ')
  end
end
