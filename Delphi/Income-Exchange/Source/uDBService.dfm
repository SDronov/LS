object dmDBService: TdmDBService
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 168
  Height = 405
  Width = 548
  object OracleSession: TOracleSession
    Left = 56
    Top = 32
  end
  object qryCommon: TOracleQuery
    Session = OracleSession
    Left = 144
    Top = 32
  end
  object dsetEnvelops: TOracleDataSet
    SQL.Strings = (
      'SELECT m.message_id, p_Params.CustomCode AS SrcCustomsCode,'
      
        '      (SELECT NAME FROM fdc_customs_lst fc WHERE fc.ID = p_param' +
        's.CustomsId) AS SrcCustomsName,'
      
        '       c.NAME AS DstCustomsName, c.customs_code_8 AS DstCustomCo' +
        'de,'
      
        '       c.ttt, dp.receiver_soft_code, md.data, dp.id AS envelope_' +
        'id'
      '  FROM exch_messages    m'
      '      ,exch_messagedata md'
      '      ,exch_messageprop mp'
      '      ,fdc_customs_lst  c'
      '      ,fdc_doc_pack_interaction_lst dp'
      '  WHERE m.isincoming     = 0'
      '    AND m.status         = 0'
      '    AND m.messagedata_id = md.messagedata_id'
      '    AND m.messagedata_id = mp.messagedata_id'
      '    AND mp.receiverinformation = c.customs_code_8'
      '    AND dp.id            = mp.envelopeid'
      '    AND dp.receiver_soft_code IN ( :subsystem_codes )')
    Variables.Data = {
      0300000001000000100000003A53554253595354454D5F434F44455301000000
      0000000000000000}
    Session = OracleSession
    BeforeOpen = dsetEnvelopsBeforeOpen
    Left = 216
    Top = 32
  end
  object qrySaveMsg: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :result := pck_exch_transport.putmessage(tag_ => :vTag,'
      '                                           messageid_ => NULL,'
      '                                           data_ => :vData);'
      'END;'
      '')
    Session = OracleSession
    Variables.Data = {
      0300000003000000070000003A524553554C5403000000000000000000000006
      0000003A5644415441700000000000000000000000050000003A565441470500
      00000000000000000000}
    Cursor = crSQLWait
    Left = 309
    Top = 34
  end
end
