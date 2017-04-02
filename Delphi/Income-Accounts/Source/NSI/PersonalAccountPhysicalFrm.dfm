inherited PersonalAccountPhysicalForm: TPersonalAccountPhysicalForm
  Caption = 'PersonalAccountPhysicalForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Width = 417
        end
        inherited edtSubject: TfdcObjectLinkEdit
          Width = 368
        end
        inherited edtSDate: TcxDBDateEdit
          Width = 121
        end
        inherited edtEDate: TcxDBDateEdit
          Width = 121
        end
      end
    end
    inherited tabPart1: TcxTabSheet
      inherited pPart1: TcxPageControl
        inherited tabOperationPart1: TcxTabSheet
          inherited cxGrid10: TcxGrid
            inherited cxGridDBBandedTableView10: TcxGridDBBandedTableView
              Bands = <
                item
                end
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end
                item
                  Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
                  Width = 171
                end
                item
                  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1077#1090#1077
                  Width = 119
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1079#1072#1095#1077#1090#1072
                end
                item
                  Caption = #1058#1056
                  Width = 157
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
                  Width = 145
                end
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                end
                item
                  Caption = #1054#1087#1083#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                  Width = 134
                end
                item
                  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1085#1072' '#1089#1095#1077#1090
                  Width = 177
                end
                item
                  Caption = #1044#1072#1085#1085#1099#1077' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
                end>
              object cxGridDBBandedTableView10INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Position.BandIndex = 11
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Width = 100
                Position.BandIndex = 11
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10LAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Width = 100
                Position.BandIndex = 11
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10FIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Width = 100
                Position.BandIndex = 11
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10MIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Width = 100
                Position.BandIndex = 11
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
          end
        end
        inherited tabTurnoverPart1: TcxTabSheet
          inherited cxGrid4: TcxGrid
            inherited cxGridDBBandedTableView4: TcxGridDBBandedTableView
              OptionsView.BandHeaders = True
            end
          end
        end
        inherited tabSvodOstPart1: TcxTabSheet
          inherited grdData: TcxGrid
            inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end
                item
                  Caption = #1044#1072#1085#1085#1099#1077' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
                end>
              object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewLAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewFIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewMIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
          end
        end
        inherited tabZalogPart1: TcxTabSheet
          inherited cxGrid1: TcxGrid
            inherited cxGridDBBandedTableView1: TcxGridDBBandedTableView
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end
                item
                  Caption = #1044#1072#1085#1085#1099#1077' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
                end>
              object cxGridDBBandedTableView1INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1DOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Width = 97
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1LAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Width = 101
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1FIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Width = 96
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1MIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Width = 127
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
          end
        end
      end
    end
    inherited tabPart2: TcxTabSheet
      inherited pPart2: TcxPageControl
        Top = 3
        Height = 435
        ClientRectBottom = 435
        inherited tabOperationPart2: TcxTabSheet
          inherited cxGrid11: TcxGrid
            Height = 411
            inherited cxGridDBBandedTableView11: TcxGridDBBandedTableView
              Bands = <
                item
                  Width = 62
                end
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                  Width = 377
                end
                item
                  Width = 130
                end
                item
                  Width = 126
                end
                item
                  Caption = #1054#1087#1083#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
                  Width = 161
                end
                item
                  Width = 127
                end
                item
                  Width = 102
                end
                item
                  Caption = #1057#1085#1103#1090#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1077
                  Width = 264
                end
                item
                  Caption = #1044#1072#1085#1085#1099#1077' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
                end>
              object cxGridDBBandedTableView11INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Position.BandIndex = 8
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11DOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Position.BandIndex = 8
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11LAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Position.BandIndex = 8
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11FIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Position.BandIndex = 8
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11MIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Position.BandIndex = 8
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
          end
        end
        inherited tabSvodDataPart2: TcxTabSheet
          inherited Splitter6: TSplitter
            Height = 178
          end
          inherited Panel9: TPanel
            Height = 178
            inherited cxGrid16: TcxGrid
              Height = 176
            end
          end
          inherited Panel10: TPanel
            Height = 178
            inherited cxGrid17: TcxGrid
              Height = 176
            end
          end
        end
        inherited tabTurnoverPart2: TcxTabSheet
          inherited cxGrid14: TcxGrid
            Height = 411
            inherited cxGridDBBandedTableView14: TcxGridDBBandedTableView
              inherited cxGridDBBandedTableView14SUM_IU: TcxGridDBBandedColumn
                Properties.UseThousandSeparator = False
                Position.ColIndex = 6
              end
              inherited cxGridDBBandedTableView14SUM_DE: TcxGridDBBandedColumn
                Position.ColIndex = 3
              end
              inherited cxGridDBBandedTableView14SUM_OT: TcxGridDBBandedColumn
                Position.ColIndex = 4
              end
              inherited cxGridDBBandedTableView14SUM_OUT: TcxGridDBBandedColumn
                Position.ColIndex = 5
              end
            end
          end
        end
        inherited tabNotStopOperationPart2: TcxTabSheet
          inherited cxGrid12: TcxGrid
            Height = 411
            inherited cxGridDBBandedTableView12: TcxGridDBBandedTableView
              Bands = <
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                end
                item
                  Caption = #1044#1072#1085#1085#1099#1077' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
                end>
              object cxGridDBBandedTableView12INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12DOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12LAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12FIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12MIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
          end
        end
        inherited tabNotIncludePart2: TcxTabSheet
          inherited cxGrid13: TcxGrid
            Height = 411
          end
        end
      end
      inherited dxBarDockControlPart2Top: TdxBarDockControl
        Height = 3
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
        FloatLeft = 460
        FloatTop = 278
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
      end
      item
        Caption = 'Part1'
        DockControl = dxBarDockControlPart1Top
        DockedDockControl = dxBarDockControlPart1Top
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 242
        FloatTop = 277
        FloatClientWidth = 161
        FloatClientHeight = 64
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dcBeginDate
            Visible = True
          end
          item
            Item = dcEndDate
            Visible = True
          end>
        Name = 'Part1'
        NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
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
  inherited odsSvodOstPart1: TfdcQuery
    SQL.Strings = (
      'with'
      'ls as  (select id'
      '        from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '        start with id = :Id'
      '        connect by prior id = parent_id)'
      'select DOC_NUMBER,DOC_DATE,DOC_SUMMA,kbk,po_kbk,'
      '       ost_sum - nvl(block_summa,0) as ost_sum,'
      '       block_summa,'
      '       INN,'
      '       doc_no,'
      '       last_name,'
      '       first_name,'
      '       middle_name'
      'from '
      
        '(select po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,r.kbk,di.code po_' +
        'kbk,'
      '       sum(r.reg_sum) ost_sum,'
      '       (select sum(re.summa) from fdc_reserved_payment_lst re '
      '        where re.payment_id = r.payment_id '
      '          and re.kbkcode = r.kbk '
      '          and re.edate is null) as block_summa,'
      '       Nvl(p.INN,'#39'0'#39')  as INN,'
      '       p.doc_no,'
      '       p.last_name,'
      '       p.first_name,'
      '       p.middle_name'
      'from ls s,'
      '     fdc_po_credit_lst po,'
      '     fdc_dict_lst      di,'
      '     fdc_rest_reg      r,'
      '     fdc_person_lst    p'
      'where'
      '    s.id = po.personal_account_id'
      'and di.id = po.KBKCODE_ID'
      'and po.id  = r.payment_id'
      'and po.TypeSYSNAME <> '#39'PaymentOrderConfirm'#39
      'and p.id = po.PAYER_ID'
      
        'group by po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,r.kbk,di.code,r.' +
        'payment_id,'
      '         p.INN,'
      '         p.doc_no,'
      '         p.last_name,'
      '         p.first_name,'
      '         p.middle_name'
      'having sum(r.reg_sum)>0)')
    object odsSvodOstPart1INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsSvodOstPart1DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsSvodOstPart1LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsSvodOstPart1FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsSvodOstPart1MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  inherited odsZalogPart1: TfdcQuery
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      
        'select po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,po.kbk,sum( d.summ' +
        'a ) summa,'
      '       Nvl(p.INN,'#39'0'#39')  as INN,'
      '       p.doc_no,'
      '       p.last_name,'
      '       p.first_name,'
      '       p.middle_name'
      'from ls s,'
      '     fdc_payment_deduction_lst d,'
      '     fdc_tr_lst tr,'
      '     fdc_po_lst po,'
      '     fdc_person_lst p'
      'where'
      '    s.id           = d.personal_account_id'
      'and d.decl_id      = tr.id'
      'and po.ID          = d.payment_id'
      'and p.id           = po.PAYER_ID'
      'group by po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,po.kbk,'
      '         p.INN,'
      '         p.doc_no,'
      '         p.last_name,'
      '         p.first_name,'
      '         p.middle_name'
      'having   sum( d.summa ) > 0'
      '')
    object odsZalogPart1INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsZalogPart1DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsZalogPart1LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsZalogPart1FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsZalogPart1MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  inherited odsOperationPart1: TfdcQuery
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       doc.activation_date,'
      '       po.DOC_NUMBER,'
      '       po.DOC_DATE,'
      '       po.DOC_SUMMA,'
      '       po.kbk,'
      '       po.payer_inn,'
      '       po.payer_kpp,'
      '       -- '#1087#1088#1080#1093#1086#1076
      '       case when doc.TypeSYSNAME = '#39'CashlessPaymentOrder'#39' then'
      '            '#39#1041#1053#39
      '       else case when doc.TypeSYSNAME = '#39'CashOrderCustoms'#39' then'
      '                 '#39#1050#1058#39
      
        '            else case when doc.TypeSYSNAME = '#39'CashOrderBank'#39' the' +
        'n'
      '                      '#39#1055#1050#39
      
        '                 else case when doc.TypeSYSNAME = '#39'CustomCheque'#39 +
        ' then'
      '                           '#39#1052#1050#39
      '                      else'
      '                           null'
      '                      end '
      '                 end'
      '            end'
      '       end as sp_in,          '
      '       pr.sum_in,'
      '       pr.ou_in,'
      '       -- '#1079#1072#1095#1077#1090
      '       dp.doc_date     as doc_date_dp,'
      '       dp.doc_number   as doc_number_dp,'
      '       dp.sum_dr_in,'
      '       dp.sum_dp,'
      '       --'#1047#1072#1083#1086#1075
      '       tr.customs_code as customs_code_tr,'
      '       tr.doc_number   as doc_number_tr,'
      '       tr.doc_date     as doc_date_tr,'
      '       tr.sum_rub      as sum_tr,'
      '       tr.sum_rub_pg   as sum_tr_pg,'
      '       --'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      '       dc.customs_code as customs_code_dc,'
      '       dc.doc_date     as doc_date_dc,'
      '       dc.decl_no      as doc_number_dc,'
      '       dc.kbkcode_code as kbkcode_dc,'
      '       dc.sum_ded      as sum_ded_dc,'
      '       dc.ou           as ou_ded_dc,'
      '       --'#1042#1086#1079#1074#1088#1072#1090#1099
      '       de.doc_date     as doc_date_pb,'
      '       de.doc_number   as doc_number_pb,'
      '       de.sum_de       as sum_pb,'
      '       de.sum_dr_out,'
      '       Nvl(p.INN,'#39'0'#39')  as INN,'
      '       p.doc_no,'
      '       p.last_name,'
      '       p.first_name,'
      '       p.middle_name'
      'from   ls s,'
      '       fdc_person_lst p,'
      '       fdc_po_lst po,'
      '       fdc_document_lst doc'
      '-- '#1087#1088#1080#1093#1086#1076
      'left outer join (select  po.id,'
      '                         po.payer_id as subject_id,'
      '                         po.summa  as sum_in,'
      
        '                         ( SELECT replace( fdc_str_agg( DISTINCT' +
        ' a.code ), '#39', '#39', chr(13) || chr(10) )'
      '                             FROM fdc_acc_transaction t'
      '                                 ,fdc_acc_light_lst   a'
      '                             WHERE t.doc_id = po.id'
      
        '                               AND t.account_id = a.id ) as ou_i' +
        'n'
      '                  from   fdc_po_credit_lst po,'
      '                         ls s'
      '                  where'
      '                        s.id = po.personal_account_id '
      
        '                  and   not po.TypeSYSNAME in ('#39'PaymentOrderReus' +
        'e'#39', '#39'PaymentOrderConfirm'#39')'
      '                  ) pr on pr.id = doc.id'
      '--'#1047#1072#1095#1077#1090
      'left outer join (-- '#1047#1072#1095#1077#1090#1099' c '#1076#1088#1091#1075#1086#1081' '#1090#1072#1084#1086#1078#1085#1080
      
        '                 select dr.id,dr.subject_id,dr.doc_date,dr.doc_n' +
        'umber,d.payment_id,sum(d.summa) sum_dr_in,0 as sum_dp'
      '                  from ls s,'
      '                       fdc_doc_reuse_customs_lst    dr,'
      '                       fdc_deduction_reuse_lst      d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = dr.id'
      '                  and dr.CUSTOMS_CODE_NEW = p_params.CustomCode'
      
        '                 group by dr.id,dr.subject_id,dr.doc_date,dr.doc' +
        '_number,d.payment_id'
      '                 union all '
      '                 -- '#1047#1072#1095#1077#1090#1099' '#1074' '#1089#1095#1077#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      
        '                  select dp.id,dp.subject_id,dp.doc_date,dp.doc_' +
        'number,re.payment_id,0 as sum_dr_in,sum(re.summa) as sum_dp'
      '                  from ls s,'
      '                       fdc_decision_payment_lst  dp,'
      '                       fdc_state_lst             st,'
      '                       fdc_value_lst             v,'
      '                       fdc_reserved_payment_lst  re'
      '                  where'
      '                        s.id           = dp.personal_account_id'
      '                    and st.id          = dp.state_id'
      '                    and st.NAME        = '#39#1055#1086#1076#1087#1080#1089#1072#1085#1086#39
      '                    and v.OWNER_OBJECT_ID = dp.id'
      '                    and v.Ref_Object_ID   = re.id'
      
        '                 group by dp.id,dp.subject_id,dp.doc_date,dp.doc' +
        '_number,re.payment_id'
      '                 ) dp on dp.id = doc.id '
      '--'#1047#1072#1083#1086#1075
      
        'left outer join (select tr.id,tr.subject_id,sum(case when d.summ' +
        'a>0 then d.summa else 0 end) as sum_rub,'
      
        '                        tr.doc_date,tr.doc_number,d.payment_id,t' +
        'r.customs_code,'
      '                        (select sum(r.summa) '
      '                         from fdc_decl_charge         dc,'
      '                              fdc_value_lst            v,'
      '                              fdc_decision_payment_lst de,'
      '                              fdc_value_lst            vr,'
      '                              fdc_reserved_payment_lst r'
      '                         where  dc.decl_id         = tr.id'
      '                            and v.Ref_Object_ID    = dc.id'
      '                            and v.OWNER_OBJECT_ID  = de.id'
      '                            and vr.OWNER_OBJECT_ID = de.id'
      
        '                            and vr.Ref_Object_ID   = r.id       ' +
        '        '
      
        '                            and d.payment_id       = r.payment_i' +
        'd'
      '                            and r.edate            is not null'
      '                         ) sum_rub_pg'
      '                  from ls s,'
      '                       fdc_payment_deduction_lst d,'
      '                       fdc_tr_lst tr'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = tr.id'
      
        '                 group by tr.id,tr.subject_id,tr.sum_rub,tr.doc_' +
        'date,tr.doc_number,d.payment_id,tr.customs_code) tr on tr.id = d' +
        'oc.id '
      '--'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      'left outer join (select c.id'
      '                       ,dc.subject_id'
      '                       ,dc.customs_code'
      '                       ,dc.doc_date'
      '                       ,nvl(dc.decl_no,dc.doc_number) decl_no'
      '                       ,c.kbkcode_code'
      '                       ,d.payment_id'
      '                       ,sum(d.summa) sum_ded'
      '                       ,fdc_rep_get_doc_account( d.id ) as ou'
      '                  from ls s,'
      '                       fdc_decl_charge_lst       c,'
      '                       fdc_doc_charge_lst        dc,'
      '                       fdc_payment_deduction_lst d'
      '                  where'
      '                      s.id           = c.personal_account_id'
      '                  and c.decl_id      = dc.id'
      '                  and d.decl_id      = dc.id'
      '                  and c.kbkcode_code = d.KBKCode'
      '                  and dc.typesysname <> '#39'TR'#39
      '                 group by c.id'
      '                         ,dc.subject_id'
      '                         ,dc.customs_code'
      '                         ,dc.doc_date'
      '                         ,dc.decl_no'
      '                         ,dc.doc_number'
      '                         ,c.kbkcode_code'
      '                         ,d.payment_id'
      '                         ,fdc_rep_get_doc_account( d.id )'
      '                 ) dc on dc.id = doc.id'
      ''
      'left outer join (--'#1042#1086#1079#1074#1088#1072#1090
      
        '                 select de.id,de.subject_id,de.doc_date,de.doc_n' +
        'umber,d.payment_id,sum(d.summa) sum_de,0 as sum_dr_out'
      '                  from ls s,'
      '                       fdc_decision_lst          de,'
      '                       fdc_payment_deduction_lst d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = de.id'
      
        '                 group by de.id,de.subject_id,de.doc_date,de.doc' +
        '_number,d.payment_id'
      '                 union all '
      '                 -- '#1047#1072#1095#1077#1090#1099' '#1085#1072' '#1076#1088#1091#1075#1091#1102' '#1090#1072#1084#1086#1078#1085#1102
      
        '                 select dr.id,dr.subject_id,dr.doc_date,dr.doc_n' +
        'umber,d.payment_id,0 as sum_de,sum(d.summa) sum_dr_out'
      '                  from ls s,'
      '                       fdc_doc_reuse_customs_lst    dr,'
      '                       fdc_deduction_reuse_lst      d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = dr.id'
      '                  and dr.CUSTOMS_CODE_NEW <> p_params.CustomCode'
      
        '                 group by dr.id,dr.subject_id,dr.doc_date,dr.doc' +
        '_number,d.payment_id'
      '                 ) de on de.id = doc.id '
      'where s.id  = doc.personal_account_id'
      
        '  and (pr.id is not null or tr.id is not null or dc.id is not nu' +
        'll or de.id is not null or dp.id is not null)'
      '  and (po.id = case when pr.id is not null then pr.id '
      
        '               else case when tr.id is not null then tr.payment_' +
        'id '
      
        '               else case when dc.id is not null then dc.payment_' +
        'id '
      
        '               else case when de.id is not null then de.payment_' +
        'id '
      
        '               else case when dp.id is not null then dp.payment_' +
        'id '
      '               else null end'
      '               end'
      '               end'
      '               end'
      '               end)'
      '  and (p.id =  case when pr.id is not null then pr.subject_id '
      
        '               else case when tr.id is not null then tr.subject_' +
        'id '
      
        '               else case when dc.id is not null then dc.subject_' +
        'id '
      
        '               else case when de.id is not null then de.subject_' +
        'id '
      
        '               else case when dp.id is not null then dp.subject_' +
        'id '
      '               else null end'
      '               end'
      '               end'
      '               end'
      '               end)'
      
        '  and  trunc(doc.activation_date) between :pDateBegin and :pDate' +
        'End'
      'order by doc.activation_date,pr.id,tr.id,dc.id,de.id,dp.id')
    object odsOperationPart1INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsOperationPart1DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsOperationPart1LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsOperationPart1FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsOperationPart1MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  inherited odsOperationPart2: TfdcQuery
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       doc.activation_date,'
      
        '       (case when (fdc_object_get_typesysname(ch.decl_id) in ('#39'C' +
        'ustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39 +
        ') and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and ch.is' +
        '_treb = 1) then '#39#1058#1088#1077#1073' '#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39') and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') the' +
        'n '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TPO'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and ' +
        'ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TPO'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') the' +
        'n '#39#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge.Tr'#39' an' +
        'd ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge.Tr'#39') t' +
        'hen '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and c' +
        'h.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') then' +
        ' '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeDebt'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeDebt'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39') then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeFine'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeFine'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39') then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) =' +
        ' '#39'CustomDeclTempAdm'#39' and fdc_object_get_typesysname(ch.id) = '#39'Pa' +
        'yPeriodic'#39') then '#39#1042#1042#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason =  '#39'49'#39 +
        ' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1050#1058#1057#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason =  '#39'49'#39 +
        ') then '#39#1050#1058#1057#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason <> '#39'49'#39 +
        ' and ch.is_treb = 1) then '#39#1050#1055#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason <> '#39'49'#39 +
        ') then '#39#1050#1055#39
      
        '        else case when (fdc_object_get_typesysname(iu.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39') ) t' +
        'hen '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39') ) t' +
        'hen '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'TPO'#39') ) then '#39#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'TR'#39') ) then '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'SubjectFeeDebt'#39') ) then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'SubjectFeeFine'#39') ) then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      '        else'
      '        null'
      '        end'
      '        end'
      '        end '
      '        end'
      '        end '
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '         ) type_ch,'
      
        '       (select g37 from fdc_decl_goods_lst where decl_id = dc.id' +
        ' and rownum = 1) proc,'
      '       dc.customs_code,'
      '       nvl(dc.DECL_NO,dc.doc_number) as decl_no,'
      '       dc.doc_date,'
      '       case when ch.id is not null then ch.kbkcode'
      '        else case when iu.id is not null then iu.kbkcode'
      '        else case when de.id is not null then de.kbkcode'
      '        else case when z.id  is not null then z.kbkcode'
      '        else case when pb.id is not null then pb.kbkcode'
      '        else case when ot.id is not null then ot.kbkcode'
      '        else null'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '       end kbkcode,'
      '       -- '#1053#1072#1095#1080#1089#1083#1077#1085#1080#1077
      '       ch.sum_ch,'
      '       -- '#1048#1079#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '       iu.sum_iu,'
      '       -- '#1054#1087#1083#1072#1090#1072
      '       de.sum_de,'
      '       de.ou_de,'
      '       -- '#1047#1072#1095#1077#1090
      '       z.sum_z,'
      '       -- '#1042#1086#1079#1074#1088#1072#1090
      '       pb.sum_pb,'
      '       -- '#1054#1090#1084#1077#1085#1072
      '       ot.osn_ot,'
      '       ot.sum_ot,'
      '       ot.ou_ot,'
      '       p.INN,'
      '       p.doc_no,'
      '       p.last_name,'
      '       p.first_name,'
      '       p.middle_name'
      ''
      'from   ls s,'
      '       fdc_person_lst     p,'
      '       fdc_doc_charge_lst dc,'
      '       fdc_document_lst   doc'
      '--'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      
        'left outer join (select c.id,di.code kbkcode,c.decl_id,c.code_re' +
        'ason,'
      
        '                        (select 1 from fdc_noticepay_charge_lst ' +
        'n'
      '                         where n.id = c.id) as  is_treb,'
      '                        sum(c.summa) sum_ch'
      '                  from ls s,'
      '                       fdc_decl_charge_hist_lst   c,'
      '                       fdc_document_lst           d,'
      '                       fdc_dict_lst               di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.id           = c.ID'
      '                  and c.kbkcode_id   = di.id'
      
        '                  group by c.id,di.code,c.decl_id,c.code_reason)' +
        ' ch on ch.id = doc.id '
      '--'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      
        'left outer join (select c.advice_id id,di.code kbkcode,c.decl_id' +
        ','
      '                        sum(c.summa) sum_iu'
      '                  from ls s,'
      '                       fdc_advice_charge_lst c,'
      '                       fdc_dict di'
      '                  where'
      '                        s.id           = c.personal_account_id'
      '                   and  di.id          = c.kbkcode_id'
      
        '                 group by c.advice_id,di.code,c.decl_id) iu on i' +
        'u.id = doc.id '
      '--'#1054#1087#1083#1072#1090#1072
      'left outer join (select d.id,d.kbkcode,d.decl_id,'
      '                        sum(d.summa) sum_de,'
      '                        '#39'-'#39' as ou_de'
      '                  from ls s,'
      '                       fdc_payment_deduction_lst d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.typesysname  <> '#39'PaymentBack'#39
      
        '                group by d.id,d.kbkcode,d.decl_id) de on de.id =' +
        ' doc.id '
      '--'#1047#1072#1095#1077#1090
      
        'left outer join (select de.id,di.code as kbkcode,d.doc_id decl_i' +
        'd,'
      '                        sum(d.summa) sum_z'
      '                  from ls s,'
      '                       fdc_decision_payment_lst de,'
      '                       fdc_value_lst r,'
      '                       fdc_advice_reserve_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id              = de.personal_account_id'
      '                  and r.OWNER_OBJECT_ID = de.id'
      '                  and d.id              = r.REF_OBJECT_ID'
      '                  and di.id             = d.kbkcode_id'
      
        '                group by de.id,di.code,d.doc_id) z on z.id = doc' +
        '.id '
      '--'#1042#1086#1079#1074#1088#1072#1090
      'left outer join (select de.id,p.kbkcode,d.doc_id decl_id,'
      '                        sum(p.summa) sum_pb'
      '                  from ls                            s,'
      '                       fdc_decision_payback_lst      de,'
      '                       fdc_value_lst                 r,'
      '                       fdc_advice_reserve_lst        d,'
      '                       fdc_payment_order_payback_lst p'
      '                  where'
      '                      s.id              = de.personal_account_id'
      '                  and r.OWNER_OBJECT_ID = de.id '
      '                  and d.id              = r.REF_OBJECT_ID'
      '                  and p.DEC_PAY_ID      = de.id'
      
        '                group by de.id,p.kbkcode,d.doc_id) pb on pb.id =' +
        ' doc.id '
      '--'#1054#1090#1084#1077#1085#1072
      
        'left outer join (select d.noticepay_id id,di.code kbkcode,d.decl' +
        '_id,'
      '                        sum(d.summa) sum_ot,'
      '                        '#39'-'#39' ou_ot,'
      '                        to_char(null) as osn_ot'
      '                  from ls s,'
      '                       fdc_noticepay_charge_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.summa        < 0'
      '                  and di.id          = d.kbkcode_id    '
      
        '                group by d.noticepay_id,di.code,d.decl_id) ot on' +
        ' ot.id = doc.id '
      'where s.id  = doc.personal_account_id'
      
        '  and (ch.id is not null or iu.id is not null or de.id is not nu' +
        'll or z.id is not null or pb.id is not null or ot.id is not null' +
        ')'
      '  and dc.id = (case when ch.id is not null then ch.decl_id'
      '               else case when iu.id is not null then iu.decl_id'
      '               else case when de.id is not null then de.decl_id'
      '               else case when z.id  is not null then z.decl_id'
      '               else case when pb.id is not null then pb.decl_id'
      '               else case when ot.id is not null then ot.decl_id'
      '               else'
      '               null '
      '               end'
      '               end'
      '               end'
      '               end'
      '               end'
      '               end)'
      '  and  p.id = dc.subject_id              '
      
        '  and  trunc(doc.activation_date)  between :pDateBegin and :pDat' +
        'eEnd '
      'order by doc.activation_date,ch.id,iu.id,de.id,z.id,ot.id')
    object odsOperationPart2INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsOperationPart2DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsOperationPart2LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsOperationPart2FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsOperationPart2MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  inherited odsNonPaysPart2: TfdcQuery
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       dc.customs_code,'
      '       nvl(dc.DECL_NO,dc.doc_number) decl_no,'
      '       dc.doc_date,'
      '       case when iu.id is not null then iu.kbkcode'
      '        else case when ot.id is not null then ot.kbkcode'
      '        else null'
      '        end'
      '       end kbkcode,'
      '       -- '#1048#1079#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '       iu.sum_iu,'
      '       -- '#1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      '       ot.sum_ot,'
      '       -- '#1044#1072#1085#1085#1099#1077' '#1092#1080#1079' '#1083#1080#1094#1072
      '       Nvl(p.INN,'#39'0'#39')  as INN,'
      '       p.doc_no,'
      '       p.last_name,'
      '       p.first_name,'
      '       p.middle_name'
      'from   ls s,'
      '       fdc_person_lst     p,'
      '       fdc_doc_charge_lst dc,'
      '       fdc_document_lst   doc'
      '--'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      'left outer join (select a.id,di.code kbkcode,c.doc_id decl_id,'
      '                        sum(c.summa) sum_iu'
      '                  from ls s,'
      '                       fdc_advice_lst a,'
      '                       fdc_advice_reserve_lst c,'
      '                       fdc_dict di'
      '                  where'
      '                       s.id           = a.personal_account_id'
      '                   and c.advice_id    = a.id     '
      '                   and di.id          = c.kbkcode_id'
      '                   and c.edate        is null'
      
        '                 group by a.id,di.code,c.doc_id) iu on iu.id = d' +
        'oc.id '
      '--'#1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      'left outer join (select d.id,di.code kbkcode,d.decl_id,'
      '                        sum(d.summa-d.payed) sum_ot'
      '                  from ls s,'
      '                       fdc_noticepay_charge_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and di.id          = d.kbkcode_id    '
      
        '                group by d.id,di.code,d.decl_id) ot on ot.id = d' +
        'oc.id '
      'where s.id  = doc.personal_account_id'
      '  and p.id  = dc.subject_id'
      '  and (iu.id is not null or ot.id is not null)'
      '  and dc.id = (case when iu.id is not null then iu.decl_id'
      '               else case when ot.id is not null then ot.decl_id'
      '               else'
      '               null '
      '               end'
      '               end)'
      'order by dc.doc_date,iu.id,ot.id'
      ''
      '')
    object odsNonPaysPart2INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsNonPaysPart2DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsNonPaysPart2LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsNonPaysPart2FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsNonPaysPart2MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  inherited odsNonPaysPart2_SV: TfdcQuery
    Left = 226
    Top = 206
  end
end
