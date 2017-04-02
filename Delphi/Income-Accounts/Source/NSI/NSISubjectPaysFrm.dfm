inherited NSISubjectPaysForm: TNSISubjectPaysForm
  Left = 314
  Top = 102
  Width = 867
  Height = 561
  Caption = 'NSISubjectPaysForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 851
    Height = 523
    ClientRectBottom = 499
    ClientRectRight = 851
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 845
        Height = 468
        inherited edtDescript: TcxDBMemo
          Top = 473
          TabOrder = 14
        end
        object fdcDeclarant: TfdcObjectLinkEdit [2]
          Left = 96
          Top = 396
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Bank;Declarant;Person;Broker'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 12
          OnBeforeAcceptObject = fdcDeclarantBeforeAcceptObject
          Width = 605
        end
        object edtDeclINN: TcxDBMaskEdit [3]
          Left = 96
          Top = 364
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 459
        end
        object edtDeclKPP: TcxDBMaskEdit [4]
          Left = 568
          Top = 364
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 239
        end
        object fdcDestSubAdr: TfdcObjectLinkEdit [5]
          Left = 96
          Top = 428
          DataBinding.DataField = 'ADDRESS'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          Enabled = False
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.Shadow = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 13
          Width = 727
        end
        inherited edtCode: TcxDBTextEdit
          Width = 423
        end
        inherited edtFullCode: TcxDBTextEdit
          Width = 423
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Width = 423
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciCode: TdxLayoutItem
            Visible = False
          end
          inherited lcGeneralItem5: TdxLayoutItem
            Visible = False
          end
          inherited lcGeneralItem2: TdxLayoutItem
            Visible = False
          end
          inherited lcGeneralItem3: TdxLayoutItem
            Visible = False
          end
          inherited lcGeneralItem1: TdxLayoutItem
            Visible = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [10]
            Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1077
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem7: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem9: TdxLayoutItem
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem8: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcDeclarant
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem10: TdxLayoutItem
              Caption = #1040#1076#1088#1077#1089
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcDestSubAdr
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 851
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 468
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 496
        Width = 851
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 848
        Height = 468
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 851
        Height = 499
        ClientRectBottom = 475
        ClientRectRight = 851
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
        FloatLeft = 307
        FloatTop = 102
        FloatClientWidth = 104
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
      '  from fdc_nsi_subject_pays_lst'
      ' where ID = :ID')
    inherited dsDataNAME: TStringField
      Required = False
    end
    inherited dsDataCODE: TStringField
      Required = False
    end
    inherited dsDataDATBEGDOC: TDateTimeField
      Required = False
    end
    inherited dsDataNUMBEGDOC: TStringField
      Required = False
    end
    object dsDataSUBJECT_ID: TIntegerField
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 300
      FieldName = 'ADDRESS'
      Size = 300
    end
    object dsDataFULL_NAME: TStringField
      DisplayWidth = 300
      FieldName = 'FULL_NAME'
      Size = 300
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 300
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      ''
      '  :ID ::= p_nsi_subject_pays.add(   pname      => :name,'
      '                                    pcode      => :code,'
      '                                    psdate     => :sdate,'
      '                                    pedate     => :edate,'
      '                                    pdatbegdoc => :datbegdoc,'
      '                                    pnumbegdoc => :numbegdoc,'
      '                                    pdatenddoc => :datenddoc,'
      '                                    pnumenddoc => :numenddoc,'
      '                                    psubjectid => :subject_id);'
      ''
      'end;')
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      ''
      '  p_nsi_subject_pays.modify(pid        => :id,'
      '                            pname      => :name,'
      '                            pcode      => :code,'
      '                            psdate     => :sdate,'
      '                            pedate     => :edate,'
      '                            pdatbegdoc => :datbegdoc,'
      '                            pnumbegdoc => :numbegdoc,'
      '                            pdatenddoc => :datenddoc,'
      '                            pnumenddoc => :numenddoc,'
      '                            psubjectid => :subject_id);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
end
