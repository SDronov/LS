object MainData: TMainData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 373
  Top = 357
  Height = 408
  Width = 687
  object QueryList1: TQueryList
    Session = Session
    Left = 96
    Top = 24
    object sqlMergePP: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_legacy_import.import_payment(pnnn => :nnn,'
        '                                            pINNName => :i_name,'
        '                                            pinn => :inn_plat,'
        
          '                                            pnumdoc => ltrim(:nu' +
          'm_doc),'
        
          '                                            pdatedoc => :date_do' +
          'c,'
        '                                            pdoctype => :ST1,'
        '                                            pdocsumma => :summa,'
        '                                            psumma => :psumma,'
        
          '                                            pcurrcode => :kodval' +
          ','
        '                                            pInfo => :nazn_plat,'
        '                                            pDDate => :ddat,'
        
          '                                            pIsUnknown => case :' +
          'st2 when '#39'1'#39' then 1 else 0 end,'
        
          '                                            pOTPDate => :date_ot' +
          'p,'
        
          '                                            poErrType => :errtyp' +
          'e,'
        
          '                                            poErrText => :errtex' +
          't,'
        '                                            pKpp => :kpp);'
        'end;')
    end
    object sqlAddGTD: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_legacy_import.import_gtd(pNNN => :nnn,'
        '                                        pdeclno => :nd,'
        '                                        pinn => :inn,'
        '                                        pg011 => :g011,'
        '                                        pg012 => :g012,'
        '                                        pg12 => :g12,'
        '                                        pg221 => :g221,'
        '                                        pg444a => :g444a,'
        '                                        pg444b => :g444b,'
        '                                        pg447a => :g447a,'
        '                                        pg447b => :g447b,'
        '                                        pk115 => :k115,'
        '                                        pg40 => :g40,'
        '                                        pgd1 => :pgd1,'
        '                                        poerrtype => :poerrtype,'
        '                                        poerrtext => :poerrtext,'
        '                                        pnclose => :nclose,'
        '                                        psrok => :srok,'
        '                                        pdoza_p => :doza_p,'
        '                                        pdoza_a => :doza_a,'
        '                                        pdoza_n => :doza_n,'
        '                                        pkodval => :kodval,'
        '                                        pforplat => :forplat,'
        '                                        ptosv => :tosv);'
        'end;')
    end
    object sqlAddCharge1: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_legacy_import.addgtd_charge(pdeclid => :declid,'
        '                                           pno => :ntov,'
        '                                           pvid => :vidnac,'
        '                                           psp => :sp,'
        '                                           psumma => :summa,'
        '                                           pg37 => :g37,'
        '                                           ppref => :pref,'
        '                                           pkodtov => :kodtov);'
        'end;')
    end
    object sqlAddDeclPayment1: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_legacy_import.addgtdpayment(pdeclid => :declid,'
        '                                ppaymentid => :payid,'
        '                                pvidnac => :vidnac_,'
        '                                psumma => :summa,'
        '                                pvaluta => :kodval);'
        'end;')
    end
    object sqlGtd2Plat: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_legacy_import.addgtd2plat(pgtdnnn => :nnngtd,'
        '                              pplatnnn => :nnnplt,'
        '                              pvidnac => :vidnac,'
        '                              psumma => :summa,'
        '                              pvaluta => :kodval);'
        'end;')
    end
    object sqlIsEmpty: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_legacy_import.isbufferempty;'
        'end;')
    end
    object sqlClear: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_legacy_import.clearbuffer;'
        'end;')
    end
    object sqlConvert: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_legacy_import.doconvert(:pdate);'
        'end;')
    end
    object sqlGetErrors: TsqlOp
      SQL.Strings = (
        
          'select '#39#1055'/'#1087' '#8470#39'||doc_no||'#39' '#1086#1090' '#39'||to_char(t.doc_date, '#39'dd.mm.yyyy'#39 +
          ') name , e.error_text from leg_payment t, leg_error e '
        'where e.obj_type = '#39'PO'#39' and e.nnn = t.nnn'
        'union all'
        
          'select '#39#1043#1058#1044' '#8470#39'||t.decl_no, e.error_text from leg_custom_decl t, ' +
          'leg_error e '
        'where e.obj_type = '#39'CD'#39' and e.nnn = t.nnn')
    end
    object sqlMergePP2_: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the function'
        '  :result := p_legacy_import.import_payment(pnnn => :id_ndok,'
        
          '                                            pINNName => NVL(:NAM' +
          'E_P, :name),'
        
          '                                            pinn => NVL(:INN_P, ' +
          ':INN),'
        
          '                                            pnumdoc => ltrim(:ND' +
          'OK),'
        '                                            pdatedoc => :DDOK,'
        
          '                                            pdoctype => '#39'Cashles' +
          'sPaymentOrder'#39','
        '                                            pdocsumma => :summa,'
        
          '                                            psumma => :sum_rest1' +
          ','
        
          '                                            pcurrcode => case :k' +
          'odval when  '#39'810'#39' then '#39'643'#39' else :kodval end,'
        '                                            pInfo => :memo,'
        
          '                                            poErrType => :errtyp' +
          'e,'
        
          '                                            poErrText => :errtex' +
          't);'
        'exception'
        '  when DUP_VAL_ON_INDEX then'
        '     null;'
        'end;')
    end
    object sqlInLegPay: TsqlOp
      SQL.Strings = (
        'begin'
        '  insert into leg_payment'
        '    (nnn,'
        '     inn,'
        '     inn_name,'
        '     doc_no,'
        '     doc_date,'
        '     doc_type,'
        '     doc_summa,'
        '     summa,'
        '     info,'
        '     kpp,'
        '     curr_code,'
        '     last_date,'
        '     acc_date,'
        '     bank_date,'
        '     load_date,'
        '     load_mode)'
        '  values'
        '    (:nnn,'
        '     :inn,'
        '     :inn_name,'
        '     :doc_no,'
        '     :doc_date,'
        '     :doc_type,'
        '     :doc_summa,'
        '     :summa,'
        '     :info,'
        '     :kpp,'
        '     :curr_code,'
        '     :last_date,'
        '     :acc_date,'
        '     :bank_date,'
        '     :load_date,'
        '     :load_mode);'
        'end;')
    end
    object sqlGTDIn: TsqlOp
      SQL.Strings = (
        'begin'
        ' insert into leg_custom_decl'
        
          '  (nnn, decl_no, inn, kpp, decl_name, g011, g012, g444a, g444b, ' +
          'g447a, g447b, k115, gd1, srok, nclose, tosv, cur_code31, doza_p,' +
          ' doza_a, doza_n)'
        ' values'
        
          '  (:nnn, :decl_no, :inn, :kpp, :decl_name, :g011, :g012, :g444a,' +
          ' :g444b, :g447a, :g447b, :k115, :gd1, :srok, :nclose, :tosv, :cu' +
          'r_code31, :doza_p, :doza_a, :doza_n);'
        'end;')
    end
    object sqlAddLegPay: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_legacy_import.addlegacypayment(pnnn => :nnn,'
        '                                   pdate => :pdate);'
        'end;')
    end
    object sqlGetProcInfo: TsqlOp
      SQL.Strings = (
        'begin'
        '  :total := p_loader.GetTotal;'
        '  :progr := p_loader.GetProgress;'
        'end;')
    end
    object sqlRollback: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_legacy_import.RollbackConvert;'
        'end;')
    end
    object sqlPlDOK: TsqlOp
      SQL.Strings = (
        'declare'
        'begin'
        '  insert into dbf_pldok_lst'
        '    (id_ndok'
        '    ,id_firma'
        '    ,cargo'
        '    ,inn'
        '    ,okpo'
        '    ,soato'
        '    ,name'
        '    ,ndok'
        '    ,ddok'
        '    ,d_bank'
        '    ,kodval'
        '    ,summa'
        '    ,schet'
        '    ,pech'
        '    ,schet3'
        '    ,avans'
        '    ,confirmed'
        '    ,checker'
        '    ,used'
        '    ,for_modem'
        '    ,korschet'
        '    ,mfo'
        '    ,bank'
        '    ,id_base'
        '    ,sum_rest1'
        '    ,dat_postup'
        '    ,whereto'
        '--    ,isadvance'
        '    ,howgot'
        '    ,dest'
        '    ,subdest'
        '    ,marked'
        '    ,okpo_p'
        '    ,soato_p'
        '    ,inn_p'
        '    ,name_p'
        '    ,id_firma_p'
        '    ,type'
        '    ,destmemo'
        '    ,bank_id'
        '--    ,is_operate'
        '    ,date_inp'
        '--    ,ismanualy'
        '    ,incasso'
        '    ,increason'
        '    ,pech_confm'
        '    ,date_confm'
        '    ,nsumma'
        '    ,typesource'
        '    ,vp'
        '    ,pkownerid'
        '    ,gtdlist'
        '    ,d_out'
        '    ,lastmodify'
        '--    ,gtk_recv'
        '    ,n_post'
        '    ,name_conf'
        '    ,kpp'
        '    ,kpp_p)'
        '  values'
        '    (:id_ndok'
        '    ,:id_firma'
        '    ,:cargo'
        '    ,:inn'
        '    ,:okpo'
        '    ,:soato'
        '    ,:name'
        '    ,:ndok'
        '    ,:ddok'
        '    ,:d_bank'
        '    ,:kodval'
        '    ,:summa'
        '    ,:schet'
        '    ,:pech'
        '    ,:schet3'
        '    ,:avans'
        '    ,:confirmed'
        '    ,:checker'
        '    ,:used'
        '    ,:for_modem'
        '    ,:korschet'
        '    ,:mfo'
        '    ,:bank'
        '    ,:id_base'
        '    ,:sum_rest1'
        '    ,:dat_postup'
        '    ,:whereto'
        '--    ,:isadvance'
        '    ,:howgot'
        '    ,:dest'
        '    ,:subdest'
        '    ,:marked'
        '    ,:okpo_p'
        '    ,:soato_p'
        '    ,:inn_p'
        '    ,:name_p'
        '    ,:id_firma_p'
        '    ,:type'
        '    ,:destmemo'
        '    ,:bank_id'
        '--    ,:is_operate'
        '    ,:date_inp'
        '--    ,:ismanualy'
        '    ,:incasso'
        '    ,:increason'
        '    ,:pech_confm'
        '    ,:date_confm'
        '    ,:nsumma'
        '    ,:typesource'
        '    ,:vp'
        '    ,:pkownerid'
        '    ,:gtdlist'
        '    ,:d_out'
        '    ,:lastmodify'
        '--    ,:gtk_recv'
        '    ,:n_post'
        '    ,:name_conf'
        '    ,:kpp'
        '    ,:kpp_p);'
        'end;')
    end
    object sqlGetMoveDate: TsqlOp
      SQL.Strings = (
        'select  DateTimeValue AS Val '
        'from  fdc_Value_Lst '
        'where  upper(SysName) = '#39'MOVING_DATE'#39
        '       and  IsSystem <> 0')
    end
    object sqlSetLoadMode: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_legacy_import.vLoadMode:=:Load_mode;'
        'end;')
    end
  end
  object VKDBFNTX: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    Filter = 
      '(OST > 0) and ( (ST2 <> 4) and (ST2 <> 0)) and (ST1 = '#39'K'#39' or ST1' +
      ' = '#39'P'#39' or ST1 = '#39'T'#39' or ST1 = '#39'G'#39')'
    Filtered = True
    TrimInLocate = False
    TrimCType = True
    StorageType = pstFile
    AccessMode.AccessMode = 64
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = False
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = True
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 1
    FoxTableFlag.HasGotIndex = True
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 280
    Top = 32
    DBFFieldDefs = <
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'NNN'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'INN'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 12
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'INN_PLAT'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 12
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'I_NAME'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 80
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'NAZN_PLAT'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 180
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'NUM_DOC'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'DATE_DOC'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'SUMMA'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 15
        dec = 2
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KODVAL'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 3
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'OST'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 15
        dec = 2
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'DATE_PROW'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'DDAT'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ST1'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 1
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'ST2'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 1
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'AVANS'
        field_type = 'L'
        extend_type = dbftUndefined
        len = 1
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'DATE_ACC'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'N_POR'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 12
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'KODOP'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 2
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'DATE_OTP'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'BNK'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 2
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'REOST'
        field_type = 'N'
        extend_type = dbftUndefined
        len = 15
        dec = 2
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'LASTDAT'
        field_type = 'D'
        extend_type = dbftUndefined
        len = 8
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'D98'
        field_type = 'L'
        extend_type = dbftUndefined
        len = 1
        dec = 0
        Tag = 0
      end
      item
        FieldFlag.FieldFlag = 0
        FieldFlag.System = False
        FieldFlag.CanStoreNull = False
        FieldFlag.BinaryColumn = False
        FieldFlag.AutoIncrement = False
        Name = 'NREF'
        field_type = 'C'
        extend_type = dbftUndefined
        len = 25
        dec = 0
        Tag = 0
      end>
  end
  object Session: TfdcOracleSession
    AfterLogOn = SessionAfterLogOn
    DesignConnection = True
    ThreadSafe = True
    TraceException = False
    Left = 176
    Top = 40
  end
  object qryGTD: TOracleQuery
    SQL.Strings = (
      'begin'
      ' insert into leg_custom_decl'
      
        '  (nnn, decl_no, inn, kpp, decl_name, g011, g012, g444a, g444b, ' +
        'g447a, g447b, k115, gd1, srok, nclose, tosv, cur_code31, doza_p,' +
        ' doza_a, doza_n, load_mode)'
      ' values'
      
        '  (:nnn, :decl_no, :inn, :kpp, :decl_name, :g011, :g012, :g444a,' +
        ' :g444b, :g447a, :g447b, :k115, :gd1, :srok, :nclose, :tosv, :cu' +
        'r_code31, :doza_p, :doza_a, :doza_n, :load_mode);'
      'end;')
    Session = Session
    Variables.Data = {
      0300000015000000040000003A4E4E4E05000000000000000000000008000000
      3A4445434C5F4E4F050000000000000000000000040000003A494E4E05000000
      0000000000000000040000003A4B50500500000000000000000000000A000000
      3A4445434C5F4E414D45050000000000000000000000050000003A4730313105
      0000000000000000000000050000003A47303132050000000000000000000000
      060000003A4734343441050000000000000000000000060000003A4734343442
      0C0000000000000000000000060000003A473434374105000000000000000000
      0000060000003A47343437420C0000000000000000000000050000003A4B3131
      35050000000000000000000000040000003A4744310C00000000000000000000
      00050000003A53524F4B0C0000000000000000000000070000003A4E434C4F53
      45030000000000000000000000050000003A544F535603000000000000000000
      00000B0000003A4355525F434F44453331050000000000000000000000070000
      003A444F5A415F50040000000000000000000000070000003A444F5A415F4105
      0000000000000000000000070000003A444F5A415F4E04000000000000000000
      00000A0000003A4C4F41445F4D4F4445030000000000000000000000}
    Left = 88
    Top = 112
  end
  object qryGoods: TOracleQuery
    SQL.Strings = (
      'insert into leg_cdecl_goods'
      
        '  (gtd_nnn, no, goods_code, pay_type_code, pay_mode_code, summa,' +
        ' curr_code)'
      'values'
      
        '  (:gtd_nnn, :no, :goods_code, :pay_type_code, :pay_mode_code, :' +
        'summa, :curr_code)')
    Session = Session
    Variables.Data = {
      0300000007000000080000003A4754445F4E4E4E050000000000000000000000
      030000003A4E4F0300000000000000000000000B0000003A474F4F44535F434F
      44450500000000000000000000000E0000003A5041595F545950455F434F4445
      0500000000000000000000000E0000003A5041595F4D4F44455F434F44450500
      00000000000000000000060000003A53554D4D41040000000000000000000000
      0A0000003A435552525F434F4445050000000000000000000000}
    Left = 168
    Top = 112
  end
  object qryGtd2Plt: TOracleQuery
    SQL.Strings = (
      'insert into leg_gtd2plat'
      '  (gtd_nnn, pay_type_code, summa, curr_code, plat_nnn)'
      'values'
      '  (:gtd_nnn, :pay_type_code, :summa, :curr_code, :plat_nnn)')
    Session = Session
    Variables.Data = {
      0300000005000000080000003A4754445F4E4E4E050000000000000000000000
      0E0000003A5041595F545950455F434F44450500000000000000000000000A00
      00003A435552525F434F4445050000000000000000000000060000003A53554D
      4D41040000000000000000000000090000003A504C41545F4E4E4E0500000000
      00000000000000}
    Left = 240
    Top = 112
  end
  object qryConvert: TOracleQuery
    SQL.Strings = (
      'begin'
      '  p_legacy_import.doconvert(:pdate, :load_mode);'
      'end;')
    Session = Session
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000A00
      00003A4C4F41445F4D4F4445030000000000000000000000}
    Threaded = True
    Left = 336
    Top = 120
  end
  object qryAddLegPay: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_legacy_import.addlegacypayment(pnnn => :nnn);'
      'end;')
    Session = Session
    Variables.Data = {0300000001000000040000003A4E4E4E050000000000000000000000}
    Threaded = True
    Left = 416
    Top = 48
  end
  object qryError: TOracleQuery
    SQL.Strings = (
      
        'select '#39#1055'/'#1087' '#8470#39'||doc_no||'#39' '#1086#1090' '#39'||to_char(t.doc_date, '#39'dd.mm.yyyy'#39 +
        ') name , e.error_text from leg_payment t, leg_error e '
      'where e.obj_type = '#39'PO'#39' and e.nnn = t.nnn and t.nnn = :nnn')
    Session = Session
    Variables.Data = {0300000001000000040000003A4E4E4E050000000000000000000000}
    Left = 424
    Top = 120
  end
  object qryCanLoad: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :CanLoad := fdc_Leg_CanLoad(:pDate, :pText);'
      'end;')
    Session = Session
    Variables.Data = {
      0300000003000000060000003A50444154450C00000000000000000000000600
      00003A5054455854050000000000000000000000080000003A43414E4C4F4144
      030000000000000000000000}
    Left = 176
    Top = 232
  end
  object dsCheckTask: TfdcQuery
    Session = Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      '   begin'
      '  -- Call the procedure'
      '  fdc_check_user_in_task(taskname => :taskname);'
      'end;'
      '')
    SourceServerObject = 'FDC_EVENT_LST'
    Left = 430
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'taskname'
        ParamType = ptUnknown
      end>
  end
  object qryLoadFile: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :result := fdc_load_dbf(pfile => :file,'
      '               ptablename => :tablename,'
      '               pcolmap  => :colmap);'
      '  :v1 := p_loader.GetTotal;'
      '  :v2 := p_loader.GetProgress;'
      '  :v3 := p_loader.GetErrorCount;'
      '  :v4 := p_loader.GetNewCount;'
      '  :v5 := p_loader.GetModifyCount;'
      '  :v6 := p_loader.GetSkipCount;'
      'end;')
    Session = Session
    Variables.Data = {
      030000000A000000050000003A46494C457100000000000000000000000A0000
      003A5441424C454E414D45050000000000000000000000070000003A52455355
      4C54040000000000000000000000070000003A434F4C4D415005000000000000
      0000000000030000003A5631030000000000000000000000030000003A563203
      0000000000000000000000030000003A56330300000000000000000000000300
      00003A5634030000000000000000000000030000003A56350300000000000000
      00000000030000003A5636030000000000000000000000}
    Left = 504
    Top = 170
  end
  object dsRegEvent: TfdcQuery
    Session = Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_evt.EventRegister('
      '    pTypeCode => :TypeCode'
      '   ,pCode     => :EvtNum'
      '   ,pParam1   => :P1'
      '   ,pParam2   => :P2'
      '   ,pParam3   => :P3'
      '   ,pParam4   => :P4'
      '   ,pParam5   => :P5'
      '  );'
      'end;')
    Left = 294
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'TypeCode'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EvtNum'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P5'
        ParamType = ptInput
      end>
  end
  object QueryList: TQueryList
    Session = Session
    Left = 568
    Top = 32
    object sqlSetKind: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_object_add_kind_bysysname(pObjectId => :id,'
        '                           pKindSysName => :sysname);'
        'end;')
    end
    object sqlvaluebool: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_valuebool_sys_get(pSysName => :name);'
        'end;')
    end
    object sqlvaluestring: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_valuestring_sys_get(pSysName => :name);'
        'end;')
    end
    object sqlvaluenumber: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_valuenumber_sys_get(pSysName => :name);'
        'end;')
    end
    object sqlvaluedatetime: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_valuedatetime_sys_get(pSysName => :name);'
        'end;')
    end
    object sqlGetProps: TsqlOp
      SQL.Strings = (
        'select /*+ FIRST_ROWS */'
        ' t.SECTION_NAME, t.PROP_NAME, t.SPROP_VALUE'
        '  from fdc_registry_lst t'
        ' where Upper(t.Section_Name) like Upper(NVL(:s, '#39'%'#39'))'
        '   and Upper(t.Prop_Name) like Upper(NVL(:n, '#39'%'#39'))')
    end
    object sqlSetSchema: TsqlOp
      SQL.Strings = (
        'begin'
        '  execute immediate '#39'alter session set CURRENT_SCHEMA = '#39'||:p;'
        'end;')
    end
    object sqlOrgProps: TsqlOp
      SQL.Strings = (
        'select /*+ FIRST_ROWS */'
        ' t.SECTION_NAME, t.PROP_NAME, t.PROP_VALUE'
        '  from fdc_registry_lst t'
        ' where Upper(t.Section_Name) like Upper(NVL(:s, '#39'%'#39'))'
        '   and Upper(t.Prop_Name) like Upper(NVL(:n, '#39'%'#39'))')
    end
    object sqlGetServerDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  select sysdate '
        '   into :Result'
        '  from dual;'
        'end;')
    end
    object sqlSetAccDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_accounting_engine.setdate(pdate => :pdate);'
        'end;')
    end
    object sqlGetUserLogin: TsqlOp
      SQL.Strings = (
        'begin'
        '  select login'
        '   into :Result'
        '  from fdc_user_current_lst;'
        'end;')
    end
    object sqlUserChangePassword: TsqlOp
    end
    object sqlSetExpDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  OI_User_Exp_Date(pLogin => :pLogin);'
        'end;')
    end
    object sqlGetUserExpDate: TsqlOp
      SQL.Strings = (
        'begin'
        '  select to_char(exp_date, '#39'DD.MM.YYYY'#39')'
        '   into :Result'
        '  from fdc_user_current_lst;'
        'end;')
    end
  end
  object pkgCommon: TOraclePackage
    Session = Session
    Cursor = crSQLWait
    Left = 72
    Top = 214
  end
end
