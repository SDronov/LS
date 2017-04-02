object ImportData: TImportData
  OldCreateOrder = False
  Left = 396
  Top = 135
  Height = 809
  Width = 508
  object dsInsertNsiDict: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_dict.Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :CODE,'
      '    :SDate,'
      '    :EDate,'
      '    :DatBegDoc,'
      '    :NumBegDoc,'
      '    :DatEndDoc,'
      '    :NumEndDoc);'
      'end;')
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
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
      end>
  end
  object dsUpdateNsiDict: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_nsi_dict.modify('
      '    :ID,'
      '    :NAME,'
      '    :CODE,'
      '    :SDate,'
      '    :EDate,'
      '    :DatBegDoc,'
      '    :NumBegDoc,'
      '    :DatEndDoc,'
      '    :NumEndDoc);'
      'end;')
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
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
      end>
  end
  object dsSearchPaymentType: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'select id from fdc_payment_type_lst where code = :code and sdate' +
        ' = :datbeg')
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datbeg'
        ParamType = ptUnknown
      end>
  end
  object dsInsertCustoms: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_customs.Add('
      '  :Name,'
      '  :Address,'
      '  :FullName,'
      '  :OKPO,'
      '  :INN,'
      '  :OGRN,'
      '  :SOATO,'
      '  :KPP,'
      '  :Phone,'
      '  :Fax,'
      '  :Telex,'
      '  :Teletype,'
      '  :Customs_Code,'
      '  :Customs_Code_8,'
      '  :DT_START);'
      ''
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      ''
      'end;')
    Left = 24
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FullName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customs_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customs_Code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_START'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateCustoms: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_nsi_customs.Modify(:ID,'
      '  :Name,'
      '  :Address,'
      '  :FullName,'
      '  :OKPO,'
      '  :INN,'
      '  :OGRN,'
      '  :SOATO,'
      '  :KPP,'
      '  :Phone,'
      '  :Fax,'
      '  :Telex,'
      '  :Teletype,'
      '  :Customs_Code,'
      '  :Customs_Code_8,'
      '  :DT_START);'
      ''
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      ''
      'end;')
    Left = 116
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FullName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customs_Code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_START'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end>
  end
  object dsSearchCustoms: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'select c.id, inn, okpo, ogrn, v.id attr_id, datetimevalue from f' +
        'dc_customs_lst c left outer join FDC_VALUE_LST v'
      'on v.OWNER_OBJECT_ID = c.ID'
      'where'
      '(inn = :inn'
      
        '  or (inn is null and :inn is null and customs_code = :customs_c' +
        'ode'
      
        '      and (customs_code_8 = :customs_code_8 or customs_code_8 is' +
        ' null and :customs_code_8 is null)'
      '  )'
      ')'
      'and (kpp = :kpp or kpp is null and :kpp is null)'
      'and (upper(v.SYSNAME) = '#39'NSIRECORDDATE'#39' or v.SYSNAME is null)')
    Left = 208
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code_8'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end>
  end
  object dlgOpen: TOpenDialog
    Left = 64
    Top = 72
  end
  object dsInsertBroker: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= P_NSI_BROKER.Add('
      ':Name,'
      ':LicenseNo,'
      ':BegDate,'
      ':EndDate,'
      ':Address,'
      ':OKPO,'
      ':INN,'
      ':OGRN,'
      'NULL, -- SOATO'
      ':KPP,'
      ':Phone,'
      ':Fax,'
      ':Telex,'
      ':Teletype,'
      ':BskoltoI,'
      ':BskoltoII);'
      ''
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 175
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LicenseNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'BegDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'EndDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoII'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateBroker: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  P_NSI_BROKER.Modify('
      ':ID,'
      ':Name,'
      ':LicenseNo,'
      ':BegDate,'
      ':EndDate,'
      ':Address,'
      ':OKPO,'
      ':INN,'
      ':OGRN,'
      'NULL, -- SOATO'
      ':KPP,'
      ':Phone,'
      ':Fax,'
      ':Telex,'
      ':Teletype,'
      ':BskoltoI,'
      ':BskoltoII);'
      ''
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      ''
      'end;')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 108
    Top = 175
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LicenseNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'BegDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'EndDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Teletype'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BskoltoII'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end>
  end
  object dsSearchBroker: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'select /*+ FIRST_ROWS*/ b.id, beg_date, inn, okpo, ogrn, v.id at' +
        'tr_id, DATETIMEVALUE'
      'from fdc_broker_lst b left outer join FDC_VALUE_LST v'
      'on v.OWNER_OBJECT_ID = b.ID'
      'where (inn = :inn or inn is null and :inn is null)'
      'and (kpp = :kpp or kpp is null and :kpp is null)'
      'and (upper(v.SYSNAME) = '#39'NSIRECORDDATE'#39' or v.SYSNAME is null)')
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end>
  end
  object dsSearchSubjectCategory: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'select id from fdc_subject_category_lst where code = :code and s' +
        'date = :datbeg')
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datbeg'
        ParamType = ptUnknown
      end>
  end
  object dsInsertNsiCurrency: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_Currency.Add('
      '    :NAME,'
      '   :DESCRIPT,'
      '   :CODE,'
      '   :ACODE,'
      '   :OLD_CODE'
      ' );'
      'end;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 239
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODE'
        ParamType = ptUnknown
      end>
  end
  object dsSearchNsiCurrency: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select /*+ FIRST_ROWS*/ id from fdc_nsi_currency_lst'
      'where code = :code -- and (sdate = _sdate or _sdate is null)')
    Left = 256
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end>
  end
  object dsSearchNsiCurrRate: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select id from fdc_nsi_curr_rate_lst'
      
        'where curr_id = (select id from fdc_nsi_currency where code = :c' +
        'ode)'
      'and rate_date = :rate_date')
    Left = 248
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'rate_date'
        ParamType = ptUnknown
      end>
  end
  object dsSearchBank: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select /*+ FIRST_ROWS*/ id, inn, okpo, ogrn from fdc_bank_lst'
      'where inn = :inn and kpp = :kpp and bic = :bic')
    Left = 224
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bic'
        ParamType = ptUnknown
      end>
  end
  object dsSearchDeclarant: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select /*+ FIRST_ROWS */'
      
        ' d.id, d.name, inn, okpo, kpp, v.id attr_id, decode(DATETIMEVALU' +
        'E, to_date('#39'1'#39', '#39'J'#39'), null, DATETIMEVALUE) DATETIMEVALUE'
      '  from fdc_declarant_lst d, fdc_object_lst o, fdc_value_lst v'
      ' where ((:kpp is not null and d.kpp = :kpp) or'
      '       (:kpp is null and d.kpp is null))'
      '   and ((:okpo is not null and d.okpo = :okpo) or'
      '       (:okpo is null and d.okpo is null))'
      '   and (:inn = d.inn)'
      '   and (:name = d.name||'#39#39')'
      '   and o.OWNER_OBJECT_ID(+) = d.ID'
      '   and v.id(+) = o.id'
      '   and o.sysname(+) = '#39'NsiRecordDate'#39)
    Left = 168
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateNsiCurrency: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '   p_nsi_Currency.Modify('
      '   :ID,'
      '    :NAME,'
      '   :DESCRIPT,'
      '   :CODE,'
      '   :ACODE,'
      '   :OLD_CODE'
      ' );'
      'end;'
      '')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 144
    Top = 239
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODE'
        ParamType = ptUnknown
      end>
  end
  object dsInsertNsiCurrRate: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_Currency.AddRate('
      '  :OWNER_OBJECT_ID,'
      '  :MULT,'
      '  :CHANGE_RATE,'
      '  :BACK_RATE,'
      '  :RATE_DATE,'
      '  :BUK'
      ');'
      'end;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 295
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CHANGE_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BACK_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BUK'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateNsiCurrRate: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_nsi_Currency.ModifyRate(:ID,'
      '  :MULT,'
      '  :CHANGE_RATE,'
      '  :BACK_RATE,'
      ' :RATE_DATE,'
      ' :BUK'
      ');'
      'end;')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 140
    Top = 295
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CHANGE_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BACK_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BUK'
        ParamType = ptUnknown
      end>
  end
  object dsInsertBank: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_bank.add(pname => :name,'
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
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 367
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
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
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
        DataType = ftUnknown
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
        DataType = ftUnknown
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
  object dsUpdateBank: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      ' p_nsi_bank.modify(pid => :id, '
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
      '                            pchiefaccname => :chief_acc_name);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 132
    Top = 367
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
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
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
        DataType = ftUnknown
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
        DataType = ftUnknown
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
  object dsInsertDeclarant: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'BEGIN'
      '  :ID ::= p_nsi_declarant.add(pname => :name,'
      '                                 paddress => :address,'
      '                                 pokpo => :okpo,'
      '                                 pinn => :inn,'
      '                                 pogrn => :ogrn,'
      '                                 psoato => :soato,'
      '                                 pkpp => :kpp,'
      '                                 pphone => :phone,'
      '                                 pfax => :fax,'
      '                                 ptelex => :telex,'
      '                                 ptelegraph => :telegraph,'
      '                                 pcategory => :category,'
      '                                 pcustomcode => :custom_code,'
      '                                 pregdate => :reg_date,'
      '                         pPost9 => :Post9,'
      '                         pAlfa2 => :Alfa2);'
      ''
      '  -- import only call'
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      ''
      '  -- same calls for add and update declarant    '
      '  p_nsi_declarant.AddDeclarantAccount(pDeclarantID => :ID,'
      '      pBANKOKPO => :rur_BANK_OKPO,'
      '      pACCOUNTCURRTYPE => 1,'
      '      pPAYACCOUNT => :rur_PAY_ACC,'
      '      pCORRACCOUNT => :rur_CORR_ACC,'
      '      pIgnoreDuplicate  =>  1);'
      ''
      '  p_nsi_declarant.AddDeclarantAccount(pDeclarantID => :ID,'
      '      pBANKOKPO => :val_BANK_OKPO,'
      '      pACCOUNTCURRTYPE => 2,'
      '      pPAYACCOUNT => :val_PAY_ACC,'
      '      pCORRACCOUNT => :val_CORR_ACC,'
      '      pIgnoreDuplicate  =>  1);'
      'END;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 423
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
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
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
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
        Name = 'TELEGRAPH'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CATEGORY'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CUSTOM_CODE'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'REG_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'Post9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alfa2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'RUR_BANK_OKPO'
        ParamType = ptInputOutput
        Size = 10
      end
      item
        DataType = ftString
        Name = 'RUR_PAY_ACC'
        ParamType = ptInputOutput
        Size = 20
      end
      item
        DataType = ftString
        Name = 'RUR_CORR_ACC'
        ParamType = ptInputOutput
        Size = 20
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'val_BANK_OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'val_PAY_ACC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'val_CORR_ACC'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateDeclarant: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_nsi_declarant.modify(pid => :id,'
      '                         pname => :name,'
      '                         paddress => :address,'
      '                         pokpo => :okpo,'
      '                         pinn => :inn,'
      '                         pogrn => :ogrn,'
      '                         psoato => :soato,'
      '                         pkpp => :kpp,'
      '                         pphone => :phone,'
      '                         pfax => :fax,'
      '                         ptelex => :telex,'
      '                         ptelegraph => :telegraph,'
      '                         pcategory => :category,'
      '                         pcustomcode => :custom_code,'
      '                         pregdate => :reg_date,'
      '                   pPost9 => :Post9,'
      '                   pAlfa2 => :Alfa2);'
      '  p_nsi_subject.Set_Nsi_Record_Date_Attr(pOwnerObjectID => :ID,'
      '    pNsiRecordDate => :NsiRecordDate, pAttrID => :AttrID);'
      ''
      '  -- same calls for add and update declarant    '
      '  p_nsi_declarant.AddDeclarantAccount(pDeclarantID => :ID,'
      '      pBANKOKPO=>:rur_BANK_OKPO,'
      '      pACCOUNTCURRTYPE=> 1,'
      '      pPAYACCOUNT=>:rur_PAY_ACC,'
      '      pCORRACCOUNT=>:rur_CORR_ACC,'
      '      pIgnoreDuplicate => 1);'
      ''
      '  p_nsi_declarant.AddDeclarantAccount(pDeclarantID => :ID,'
      '      pBANKOKPO=>:val_BANK_OKPO,'
      '      pACCOUNTCURRTYPE=> 2,'
      '      pPAYACCOUNT=>:val_PAY_ACC,'
      '      pCORRACCOUNT=>:val_CORR_ACC,'
      '      pIgnoreDuplicate => 1);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 96
    Top = 439
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
        Name = 'OKPO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
        Name = 'OGRN'
        ParamType = ptUnknown
        Size = 31
      end
      item
        DataType = ftString
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
        Name = 'TELEGRAPH'
        ParamType = ptUnknown
        Size = 101
      end
      item
        DataType = ftString
        Name = 'CATEGORY'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CUSTOM_CODE'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'REG_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'Post9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alfa2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NsiRecordDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AttrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RUR_BANK_OKPO'
        ParamType = ptInputOutput
        Size = 10
      end
      item
        DataType = ftString
        Name = 'RUR_PAY_ACC'
        ParamType = ptInputOutput
        Size = 20
      end
      item
        DataType = ftString
        Name = 'RUR_CORR_ACC'
        ParamType = ptInputOutput
        Size = 20
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VAL_BANK_OKPO'
        ParamType = ptInputOutput
        Size = 10
      end
      item
        DataType = ftString
        Name = 'VAL_PAY_ACC'
        ParamType = ptInputOutput
        Size = 20
      end
      item
        DataType = ftString
        Name = 'VAL_CORR_ACC'
        ParamType = ptInputOutput
        Size = 20
      end>
  end
  object dsInsertPaymentOrder: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::=  p_payment_order.add(pdocno => :doc_no,'
      '                      pdescript => :descript,'
      '                      pdocdate => :doc_date,'
      '                      pexecdate => :exec_date,'
      '                      ppayerid => :payer_id,'
      '                      psumma => :summa,'
      '                      pcurrencyid => :currency_id,'
      '                      pdocsumma => :doc_summa,'
      '                pdocno2 => :doc_no,'
      '                      pdocdate2 => :doc_date);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 43
    Top = 481
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'EXEC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'doc_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end>
  end
  object dsUpdatePaymentOrder: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_payment_order.modify(pid => :id,'
      '                      pdocno => :doc_no,'
      '                      pdescript => :descript,'
      '                      pdocdate => :doc_date,'
      '                      pexecdate => :exec_date,'
      '                      ppayerid => :payer_id,'
      '                      psumma => :summa,'
      '                      pcurrencyid => :currency_id,'
      '                      pdocsumma => :doc_summa,'
      '                      pdocno2 => :doc_no,'
      '                      pdocdate2 => :doc_date);'
      'end;')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 132
    Top = 495
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'EXEC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'doc_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end>
  end
  object dsSearchPaymentOrder: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select * from fdc_payment_order_lst'
      'where doc_no = :doc_no '
      
        'and (doc_date = :doc_date or doc_date is null and :doc_date is n' +
        'ull)')
    Left = 234
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'doc_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'doc_date'
        ParamType = ptUnknown
      end>
  end
  object dsSearchSubject: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS*/ id FROM fdc_subject_lst WHERE inn = :inn')
    Left = 242
    Top = 548
    ParamData = <
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end>
  end
  object fdcInsertDeclAccount: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'BEGIN'
      
        '  p_nsi_declarant.AddDeclarantAccount(PDECLARANTID => :DECLARANT' +
        '_ID,'
      '                       pBankOkpo => :BANK_OKPO,'
      '                       pAccountCurrType => :account_curr_type,'
      '                       pPayAccount => :pay_account,'
      '                       pCorrAccount => :corr_account,'
      '                       pIgnoreDuplicate => 1);'
      'END;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 248
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DECLARANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'bank_okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'account_curr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pay_account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'corr_account'
        ParamType = ptUnknown
      end>
  end
  object fdcSearchDeclAccount: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'select da.id from fdc_declarant_lst d, fdc_declarant_account_lst' +
        ' da'
      'where d.id = da.declarant_id'
      '  -- search 4 declarant'
      '  and (d.inn = :inn or :inn is null and d.inn is null)'
      '  and (d.okpo = :okpo or d.okpo is null and :okpo is null)'
      '  -- search 4 account'
      
        '  and (da.pay_account = :pay_account or da.pay_account is null a' +
        'nd :pay_account is null)'
      
        '  and (da.corr_account = :corr_account or da.corr_account is nul' +
        'l and :corr_account is null)'
      
        '  and da.account_curr_type = :account_curr_type and da.bank_okpo' +
        ' = :bank_okpo')
    Left = 336
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pay_account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pay_account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'corr_account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'corr_account'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'account_curr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'bank_okpo'
        ParamType = ptUnknown
      end>
  end
  object dsUniInsert: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    Left = 24
    Top = 600
  end
  object dsUniUpdate: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    Left = 96
    Top = 600
  end
  object dsCurrList: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT c.id as Id, c.code as Code, max(r.rate_date) last_rate_da' +
        'te FROM fdc_nsi_currency_lst c, fdc_nsi_curr_rate_lst r '
      'WHERE r.curr_id(+) = c.id GROUP BY c.id, c.code ORDER BY Code')
    Left = 376
    Top = 8
  end
  object dsInsertNsiRefinancingRate: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_refinancing_rate.AddRate('
      '                        pRefinancingRate  =>  :REFINANCING_RATE,'
      '                        pRateDate         =>  :RATE_DATE'
      '          );'
      'end;')
    SourceServerObject = 'FDC_OBJECT_ADD'
    Left = 32
    Top = 663
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFINANCING_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end>
  end
  object dsUpdateNsiRefinancingRate: TfdcQuery
    Session = MainData.Session
    FilterOptions = [foCaseInsensitive]
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  p_nsi_Refinancing_Rate.ModifyRate('
      '                pId               =>  :ID,'
      '                pRefinancingRate  =>  :REFINANCING_RATE,'
      '                pRateDate         =>  :RATE_DATE'
      '  );'
      'end;'
      '')
    SourceServerObject = 'FDC_OBJECT_UPD'
    Left = 192
    Top = 663
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFINANCING_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end>
  end
  object dsSearchNsiRefinancingRate: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select id from fdc_nsi_refinancing_rate_lst'
      'where rate_date = :rate_date')
    Left = 360
    Top = 664
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rate_date'
        ParamType = ptUnknown
      end>
  end
  object qryInsRate: TOracleQuery
    SQL.Strings = (
      'insert into dbf_rate_lst'
      '    (curr_id, mult, change_rate, back_rate, rate_date, buk)'
      '  values'
      
        '    (:curr_id, :mult, :change_rate, :back_rate, :rate_date, :buk' +
        ')')
    Session = MainData.Session
    Variables.Data = {
      0300000005000000080000003A435552525F4944040000000000000000000000
      050000003A4D554C540400000000000000000000000C0000003A4348414E4745
      5F524154450400000000000000000000000A0000003A4241434B5F5241544504
      00000000000000000000000A0000003A524154455F444154450C000000000000
      0000000000}
    OnArrayError = qryInsRateArrayError
    Left = 368
    Top = 88
  end
end
