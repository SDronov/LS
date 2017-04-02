unit Structure_DBF_PU_Ans;

interface

uses
  ExportModulePUANS;

const

  LSxxxxxxpuANS : TCetTableDescPUANS = (
    TableName  : 'LS.ANS';
    FieldCount : 17;
    Fields     : (('CUSTOMCODE', 'C', '8',   ''),
                  ('INN_D',      'C', '12',  ''),
                  ('KPP_D',      'C', '9',   ''),
                  ('BEGIN_DATE', 'D', '8',   ''),
                  ('END_DATE',   'D', '8',   ''),
                  ('TYPEDOC',    'C', '3',   ''),
                  ('REPORT_DAT', 'D', '8',   ''),
                  ('NUMDOC',     'C', '12',  ''),
                  ('DATE_DOC',   'D', '8',   ''),
                  ('SUMMA',      'N', '19',  '2'),
                  ('KBK',        'C', '20',  ''),
                  ('PAYMENTNUM', 'C', '30',  ''),
                  ('PAYMENTDAT', 'C', '10',  ''),
                  ('NAME_AGENT', 'C', '70',  ''),
                  ('NUMPOST',    'C', '19',  ''),
                  ('CODEERR',    'N', '5',   '0'),
                  ('TEXTERR',    'C', '255',  '')
                 ));

implementation

end.
