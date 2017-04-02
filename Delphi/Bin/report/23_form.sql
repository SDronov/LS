[dsHeader]
 select 
    to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO,   'DD.MM.YYYY' ) date_to
    ,fdc_valuestring_sys_get( 'CustomsName' )||'. ' AS CustomsName
    ,fdc_valuestring_sys_get( 'CustomsCode' ) as CustomsCode
 from dual
 
[dsData]
select distinct -- �������� (���, ���, ���, ���) 
       dpb.customs_code,
       dpb.CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dpb.doc_number,
       dpb.doc_date,
       pby.DOC_DATE as date_confirmed,
       CASE dpb.TypeSysName 
         when 'DecPaybackDeposit'  then '���'    -- ������� ��������� ������
         when 'DecPaybackPay'      then '������' -- ������� ������� ���������� �������
         when 'DecPaybackLevy'     then '�����'  -- ������� ������� ���������� �������
         when 'DecPaybackTimeOut'  then '���'    -- ������� ��������� �� �� ��������� ������ �������� 
         when 'DecPaybackAdvance'  then '���'    -- ������� ��������� ��������
         when 'DecPaybackPeriodic' then '������' -- ������� �������� ������ ��� ������. ��������� ��������������      
       ELSE '' END as doc_code,
       '�������' as doc_type,
       db.code_name as doc_base,
       dpb.decision_court as doc_base_code,
       dpb.reason_name,
       dic.code as reason_code,
       dsr.name as sud_reason_name,
       dsr.code as sud_reason_code,
       (select sum(t.DOC_SUMMA) from fdc_po_payback_lst t where t.DEC_PAY_ID=dpb.id group by dpb.id) as summa 
from fdc_po_payback_y_lst pby -- ������������� �������� �� ����
    ,fdc_po_payback_lst pb -- ������ �� ������� � ����
    ,fdc_subject_lst s -- �����������
    ,fdc_dict_lst dic
    ,fdc_decision_payback_lst dpb --������� � ��������
    ,oi_doc_base_lst db -- ���������� ���������-���������
    ,fdc_dict_sud_reason_lst dsr --���������� ������  
where  
  pby.doc_date between :DATE_FROM and :DATE_TO  -- �������� ����� ������ (���������� ���������)
  --pby.DOC_DATE between to_date('01.01.2014') and to_date('31.12.2014')
  and pby.confirmed_doc_id = pb.id -- ������������� ������� � �������
  and dpb.reason_id = dic.id(+)
  and pb.STATE_ID = (select id from fdc_state_lst where sysname = 'State.PayBack.Confirm')-- ������������
  and pby.IS_CONFIRM = 'Y'-- ������������ �� ����
--  and (pb.ext_source = p_params.softcustomscode) -- �� ���� ������� (���������� ��������)
--  and pb.EXT_SOURCE='10117000' -- �����������
  and pb.recipient_id = s.id(+) -- ����� � ������� �����������
  and pb.dec_pay_id = dpb.id -- ����� ������� � �������
  and dpb.sud_reason_id=dsr.id(+) -- ����� ������� �� ������������ ������
  and dpb.decision_court=db.doc_code -- ����� � ����� ���������-���������

union all -- ���������� � �������� (���, ���, ������)
select dpl.customs_code,
       NVL( c.FULL_NAME, c.NAME) as CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dpl.doc_number,
       dpl.doc_date,
       dpl.sign_date as date_confirmed,
       CASE dpl.typesysname 
         when 'DecisionPayment'        then '���'      -- ����� � ���� ������� ���������� ��������
         when 'DecisionPaymentDeposit' then '���'      -- ����� ��������� ������ � ���� ���. �������� 
         when 'DecisionPaymentPeriodic'then '������'   -- ����� �������� ������ ��� ������. ��������      
       ELSE '' END as doc_code,
       '�����' as doc_type,
       db.code_name as doc_base,
       dpl.decision_court as doc_base_code,
       dic.name as reason_name,
       dic.code as reason_code,
       dsr.name as sud_reason_name,
       dsr.code as sud_reason_code,
       dpl.summa 
from fdc_decision_payment_lst dpl -- ������� �� ������
    ,fdc_customs_lst c
    ,fdc_subject_lst s
    ,fdc_dict_lst dic
    ,oi_doc_base_lst db -- ���������� ���������-���������
    ,fdc_dict_sud_reason_lst dsr --���������� ������  
    ,(select rel_object_id, objtypesysname
      from fdc_rel_advice_dec_lst
      group by rel_object_id, objtypesysname
      ) rel -- �����������
where  
  dpl.sign_date between :DATE_FROM and :DATE_TO 
  --dpl.sign_date between to_date('01.01.2014') and to_date('31.12.2014')
  and dpl.subject_id = s.id(+)
  and dpl.reason_id = dic.id(+)
  and dpl.STATE_ID = (select id from fdc_state_lst where sysname = 'State.DecisionPayment.Signed')-- ���������
  and dpl.decision_court=db.doc_code -- ����� � ����� ���������-���������
  and dpl.sud_reason_id=dsr.id(+) -- ����� ������� �� ������������ ������
  and dpl.id = rel.rel_object_id(+)--����� ������� - �����������
  and c.customs_code_8=dpl.ext_source
  

union all -- ���������� � �������� � ������ �� (���)
select dr.customs_code,
       NVL( c.FULL_NAME, c.NAME) as CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dr.doc_number,
       dr.doc_date,
       dr.activation_date as date_confirmed,
       dr.doc_code,
       '�����' as doc_type,
       '' as doc_base,
       'N' as doc_base_code,
       dr.REASON as reason_name,
       rc.code as reason_code,
       '' as sud_reason_name,
       '' as sud_reason_code,
       dr.AMOUNT as summa 

from fdc_doc_reuse_customs_lst dr
    ,fdc_customs_lst c
    ,oi_reuse_customs_rc_lst rc
    ,fdc_subject_lst s
where dr.state_id in (select id from fdc_state_lst where sysname in ('State.Reuse.Confirm'))
  and exists
        (select 1 from fdc_doc_reuse_customs_Y_lst t 
           where dr.ID=t.CONFIRMED_DOC_ID
                 and t.doc_date between :DATE_FROM and :DATE_TO )
                 --and t.DOC_DATE between to_date('01.01.2014') and to_date('31.12.2014'))
  and dr.REASON=rc.reason-- ����� � ����� ���������-���������
  and dr.subject_id = s.id(+)
  and c.customs_code_8=dr.customs_code

union all -- ������ �� ������
select '"' customs_code,
       '"' CustomsFullName,
       '"' INN,
       '"' KPP,
       '"' Name,
       '"' TypeName,
       '"' doc_number,
       to_date(null) doc_date,
       to_date(null) date_confirmed,
       '"' as doc_code,
       '�����������' as doc_type,
       '"' as doc_base,
       'N' as doc_base_code,
       '"' as reason_name,
       '"' as reason_code,
       '"' as sud_reason_name,
       '"' as sud_reason_code,
       sum(po.summa) summa
 
from FDC_PO_LST po
    ,fdc_customs_lst c
    ,fdc_subject_lst s
    
where  
  po.activation_date between :DATE_FROM and :DATE_TO 
 -- po.activation_date between to_date('01.01.2014') and to_date('31.12.2014')
  and po.state_id in(select sl.ID from FDC_STATE_LST sl where sl.sysname ='PaymentOrderConfirm')
  and po.typesysname not in ('CustomCheque' )-- �� ������� ���������������� ����
  and po.payer_id = s.id(+)
  and c.customs_code_8=po.destcustomscode
