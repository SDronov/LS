inherited TPOErrorGridForm: TTPOErrorGridForm
  Caption = 'TPOErrorGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
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
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      28
      0)
  end
  inherited QueryList1: TQueryList
    inherited sqlStartPay: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  if fdc_object_get_typesysname(:decl_id) not in ('#39'TR'#39','#39'TrDuplic' +
          'ate'#39') then'
        '  :result := fdc_decl_prepare_payment(pdeclid => :decl_id,'
        '                                      pcurrid => :currency_id,'
        '                                      pKbkId  => :kbkcode_Id);'
        '  else'
        '  :result := fdc_decl_prepare_payment_tr(pdeclid => :decl_id,'
        
          '                                         pcurrid => :currency_id' +
          ','
        '                                         pKbkId  => :kbkcode_Id,'
        
          '                                         pKbkIdIn  => :kbkcode_I' +
          'd_in);'
        '  end if;'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        'end;')
    end
    inherited sqlGetSubject: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_RegDate date;'
        '  r_Tr       fdc_tr_lst%rowtype;'
        'begin'
        
          '  If fdc_object_get_typesysname(:DECL_ID) not in ('#39'TR'#39','#39'TrDuplic' +
          'ate'#39') THEN'
        '   select subject_id into :result'
        '    from fdc_obligation_doc_lst'
        '   where id=:DECL_ID;'
        '  else'
        '   select * into r_Tr from fdc_tr_lst where id = :DECL_ID; '
        '   if r_tr.reg_date >=to_date('#39'01012011'#39','#39'ddmmyyyy'#39') then'
        '      :result := r_TR.carrier_id;'
        '   else'
        '      :result := r_TR.subject_id;'
        '   end if; '
        '  end if; '
        'end;')
    end
    object sqlActivateTR: TsqlOp
      SQL.Strings = (
        'begin'
        '  for rec_cur in ('
        '                  select tr.id'
        '                  from fdc_tr_lst tr'
        '                  where tr.id = :tr_id'
        '                    and is_active = '#39'N'#39
        '                    and not exists('
        '                                   select 1'
        '                                   from fdc_Object_Lst t'
        '                                   where t.object_type_id in ('
        
          '                                                              se' +
          'lect id'
        
          '                                                              fr' +
          'om fdc_object_type_lst o'
        
          '                                                              st' +
          'art with o.sysname = '#39'CustomDeclError'#39
        
          '                                                              co' +
          'nnect by o.parent_object_type_id = prior o.id'
        '                                                             )'
        
          '                                     and t.owner_object_id = tr.' +
          'id'
        '                                  )'
        '                 )'
        '  loop'
        '    p_document.doactivate(rec_cur.id);'
        '    -- '#1086#1090#1087#1088#1072#1074#1082#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1086' '#1058#1056' '#1074' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
        '    fdc_send_trmess_asg(rec_cur.id);'
        '  end loop;'
        'end;')
    end
    object sqlGetTypesysname: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_object_get_typesysname(:decl_id);'
        'end;')
    end
  end
  inherited dsRestList: TfdcQuery
    SQL.Strings = (
      
        'select t.decl_id, t.currency_id,t.kbkcode_id,to_number(null) as ' +
        'kbkcode_id_in, sum(t.CHARGE_REST) summ'
      '      ,fdc_decl_get_rate_date(t.decl_id) rate_date'
      'from fdc_decl_charge_lst t'
      'where t.decl_id = :ID'
      
        '  and fdc_object_get_typesysname(t.decl_id) not in ('#39'TR'#39','#39'TrDupl' +
        'icate'#39')'
      'group by t.decl_id, t.currency_id,t.kbkcode_id'
      'having sum(t.CHARGE_REST) > 0'
      'union all'
      
        'select tt.decl_id, tt.currency_id, tt.kbkcode_id, tt.kbkcode_id_' +
        'in, sum(tt.CHARGE_REST) summ,'
      '       fdc_decl_get_rate_date(tt.decl_id) rate_date'
      'from ('
      
        '      select t.decl_id, t.currency_id,t.kbkcode_id,(select kbkco' +
        'de_id from fdc_charge_tr where id = t.id) kbkcode_id_in,t.CHARGE' +
        '_REST'
      '             ,fdc_decl_get_rate_date(t.decl_id) rate_date'
      '      from fdc_charge_tr_lst t'
      '      where t.decl_id = :ID'
      
        '        and fdc_object_get_typesysname(t.decl_id) in ('#39'TR'#39','#39'TrDu' +
        'plicate'#39')) tt'
      
        'group by tt.decl_id, tt.currency_id,tt.kbkcode_id,tt.kbkcode_id_' +
        'in'
      'having sum(tt.CHARGE_REST) > 0')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
