unit Structure_DBF_AO_Ans;

interface

uses
  ExportModuleAOANS;

const

  LSxxxxxxaoANS : TCetTableDescAOANS = (
    TableName  : 'LS.ANS';
    FieldCount : 17;
    Fields     : (('CUSTOMCODE', 'C',   '8',   ''),
                  ('INN_D',      'C',   '12',  ''),
                  ('KPP_D',      'C',   '9',   ''),
                  ('BEGIN_DATE', 'D',   '8',   ''),
                  ('END_DATE',   'D',   '8',   ''),
                  ('TYPEDOC',    'C',   '3',   ''),
                  ('REPORT_DAT', 'D',   '8',   ''),
                  ('NUMDOC',     'C',   '12',  ''),
                  ('DATE_DOC',   'D',   '8',   ''),
                  ('SUMMA_AR',   'N',   '19',  '2'),
                  ('SUMMA_RE',   'N',   '19',  '2'),
                  ('PAYMENTNUM', 'C',   '30',  ''),
                  ('PAYMENTID',  'C',   '4',   ''),
                  ('PAYMENTSUM', 'Num', '19',  '2'),
                  ('NUMPOST',    'C',   '19',  ''),
                  ('CODEERR',    'N',   '5',   '0'),
                  ('TEXTERR',    'C',   '255', '')
                 ));

implementation

end.

