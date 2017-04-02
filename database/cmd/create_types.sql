prompt
prompt Creating type FDC_BALANS_REC_T
prompt ==============================
prompt
CREATE OR REPLACE TYPE "FDC_BALANS_REC_T"                                                                          is object(
    item_no varchar2(255),
    parent_item varchar2(255),
    item varchar2(255),
    sort_item varchar2(255),
    caption varchar2(255),
    code varchar2(255),
    window_type varchar2(255),
    bsumma number,
    isumma number,
    osumma number,
    esumma number)
/

prompt
prompt Creating type FDC_BALANS_REC_LIST_T
prompt ===================================
prompt
CREATE OR REPLACE TYPE "FDC_BALANS_REC_LIST_T"                                                                          is table of fdc_balans_rec_t
/

prompt
prompt Creating type FDC_CUSTOMSCODE_DECLNO
prompt ====================================
prompt
CREATE OR REPLACE TYPE "FDC_CUSTOMSCODE_DECLNO"                                                                          is object (
  customs_code varchar2(8),
  decl_no varchar2(10)
)
/

prompt
prompt Creating type FDC_CUSTOMSCODE_DECLNO_T
prompt ======================================
prompt
CREATE OR REPLACE TYPE "FDC_CUSTOMSCODE_DECLNO_T"                                                                          AS TABLE OF FDC_CUSTOMSCODE_DECLNO
/

prompt
prompt Creating type FDC_DOC_PARAMS
prompt ============================
prompt
CREATE OR REPLACE TYPE "FDC_DOC_PARAMS"                                                                          is object (
    subject_id      NUMBER(15),
    custom_id       NUMBER(15),
    payment_type_id NUMBER(15),
    kbk_source_id   NUMBER(15),
    kbk_id          NUMBER(15),
    currency_id     NUMBER(15),
    doc_sum         NUMBER(36,4),
    exch_rate       NUMBER(36,4),
    sum_rur         NUMBER(36,4),
    is_ts           VARCHAR2(1)
  )
/

prompt
prompt Creating type FDC_DOC_PARAMS_T
prompt ==============================
prompt
CREATE OR REPLACE TYPE "FDC_DOC_PARAMS_T"                                                                          AS TABLE OF fdc_doc_params
/

prompt
prompt Creating type FDC_STRING_TABLE
prompt ==============================
prompt
CREATE OR REPLACE TYPE "FDC_STRING_TABLE"                                                                          as table of varchar2(4000)
/

prompt
prompt Creating type FDC_GOODS_AGG_TYPE
prompt ================================
prompt
CREATE OR REPLACE TYPE "FDC_GOODS_AGG_TYPE"                                                                          AS OBJECT
(
  goods     fdc_string_table,
  delimeter VARCHAR2(10),
  STATIC FUNCTION ODCIAggregateInitialize (
      pCtx IN OUT fdc_goods_agg_type
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateIterate (
      SELF       IN OUT fdc_goods_agg_type
     ,pValue     IN     VARCHAR2
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateMerge (
      SELF   IN OUT fdc_goods_agg_type
     ,pCtx   IN     fdc_goods_agg_type
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateTerminate (
      SELF   IN  fdc_goods_agg_type
     ,pValue OUT VARCHAR2
     ,pFlags IN  NUMBER
    ) RETURN NUMBER
)
/

prompt
prompt Creating type FDC_PERIODIC_MONTH_PAYMENT
prompt ========================================
prompt
CREATE OR REPLACE TYPE "FDC_PERIODIC_MONTH_PAYMENT"                                                                          IS OBJECT (
     month       date,
     summa       NUMBER(22,2),
     is_payed    number(1),
     currency_id number(15),
     pay_type_id number(15),
     kbkcode_id  number(15)
)
/

prompt
prompt Creating type FDC_PERIODIC_MONTH_PAYMENT_T
prompt ==========================================
prompt
CREATE OR REPLACE TYPE "FDC_PERIODIC_MONTH_PAYMENT_T"                                                                          AS TABLE OF FDC_PERIODIC_MONTH_PAYMENT
/

prompt
prompt Creating type FDC_STR_AGG_TYPE
prompt ==============================
prompt
CREATE OR REPLACE TYPE "FDC_STR_AGG_TYPE"                                                                          AS OBJECT
(
  total_str VARCHAR2(32767),
  delimeter VARCHAR2(10),

  STATIC FUNCTION ODCIAggregateInitialize (
      pCtx IN OUT fdc_str_agg_type
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateIterate (
      SELF       IN OUT fdc_str_agg_type
     ,pValue     IN     VARCHAR2
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateMerge (
      SELF   IN OUT fdc_str_agg_type
     ,pCtx   IN     fdc_str_agg_type
    ) RETURN NUMBER,

  MEMBER FUNCTION ODCIAggregateTerminate (
      SELF   IN  fdc_str_agg_type
     ,pValue OUT VARCHAR2
     ,pFlags IN  NUMBER
    ) RETURN NUMBER
)
/

prompt
prompt Creating type FDC_TPO_OTVET_ERROR
prompt =================================
prompt
CREATE OR REPLACE TYPE "FDC_TPO_OTVET_ERROR"                                                                          IS OBJECT (
  Tpo_Number VARCHAR2(10)
 ,IsLoaded   NUMBER(1)
 ,ErrorCode  NUMBER(5)
 ,ErrorText  VARCHAR2(1000)
)
/

prompt
prompt Creating type FDC_TPO_OTVET_ERROR_TABLE
prompt =======================================
prompt
CREATE OR REPLACE TYPE "FDC_TPO_OTVET_ERROR_TABLE"                                                                          AS TABLE OF FDC_TPO_OTVET_ERROR
/

prompt
prompt Creating type FDC_TR_DED_REC_T
prompt ==============================
prompt
CREATE OR REPLACE TYPE "FDC_TR_DED_REC_T"                                                                          IS OBJECT (
        id               NUMBER(15)
      , payment_id       NUMBER(15)
      , decl_id          NUMBER(15)
      , typesysname      VARCHAR2(1500)
      , pay_type_id      NUMBER(15)
      , charge_curr_id   NUMBER(15)
      , charge_summa     NUMBER(24,4)
      , summa            NUMBER(24,4)
      , kbkcode_id       NUMBER(15)
      , KBKCode          VARCHAR2(1500)
      , kbkcode_is_ts    VARCHAR2(1)
      , kbkcode1_id      NUMBER(15)
      , KBKCode1         VARCHAR2(1500)
      , kbkcode1_is_ts   VARCHAR2(1)
      , kbkcode1_is_prep VARCHAR2(1)
      , pay_type_id_in   NUMBER(15)
      , kbkcode_id_in    NUMBER(15)
      , kbkcode_in       VARCHAR2(1500)
      , kbkcode_in_is_ts VARCHAR2(1)
    )
/

prompt
prompt Creating type FDC_TR_DED_TABLE_T
prompt ================================
prompt
CREATE OR REPLACE TYPE "FDC_TR_DED_TABLE_T"                                                                          IS TABLE OF FDC_TR_DED_REC_T
/

prompt
prompt Creating type OI_REPORT_SUMMARY_TYPE
prompt ====================================
prompt
CREATE OR REPLACE TYPE "OI_REPORT_SUMMARY_TYPE"                                                                          AS OBJECT
(
    customs_code VARCHAR2(100),
    KBKCode_id   VARCHAR2(100),
    pays         NUMBER(22, 2),
    notice       NUMBER(22, 2),
    podt_po      NUMBER(22, 2),
    vozvrat      NUMBER(22, 2),
    reuse        NUMBER(22, 2)
)
/

prompt
prompt Creating type OI_REPORT_SUMMARY_TABLE
prompt =====================================
prompt
CREATE OR REPLACE TYPE "OI_REPORT_SUMMARY_TABLE"                                                                          AS TABLE OF oi_report_summary_type
/

prompt
prompt Creating type OI_REPORT_VED_REFUNDS_TYPE
prompt ========================================
prompt
CREATE OR REPLACE TYPE oi_report_VED_Refunds_type
 AS OBJECT
(
  ID                number,
  OPER_DATE         date,
  CUSTOMS_CODE      varchar2(8),
  CUSTOMS_FULL_NAME varchar2(4000),
  DEC_TYPE          varchar2(1500),
  DEC_DATE          date,
  DEC_NUMBER        varchar2(100),
  DOC_NUMBER        varchar2(100),
  DOC_DATE          date,
  SUMMA             number(22,2),
  INN               varchar2(12),
  KPP               varchar2(10),
  NAME              varchar2(160),
  ACCOUNT_K         varchar2(20),
  BIK_K             varchar2(9),
  BANK_NAME         varchar2(4000),
  IS_PRESENT        char(1),
  LIST_ACCOUNTS     varchar2(1000)
)
/

prompt
prompt Creating type OI_REPORT_VED_REFUNDS_TABLE
prompt =========================================
prompt
CREATE OR REPLACE TYPE oi_report_VED_Refunds_table IS TABLE OF oi_report_VED_Refunds_type
/

prompt
prompt Creating type RUSRCUSTDET
prompt =========================
prompt
create or replace type rUsrCustDet as object (
  customs_code_8           VARCHAR2(8),
  name                     VARCHAR2(15500),
  id                       VARCHAR2(50),
  code                     VARCHAR2(50));
/

prompt
prompt Creating type TARGET_KBK_REPORT_TYPE
prompt ====================================
prompt
CREATE OR REPLACE TYPE target_kbk_report_type
 AS OBJECT
(
    customs_code VARCHAR2(100),
    KBKCode_id   VARCHAR2(100),
    summa_from         NUMBER(22, 2),
    summa_to       NUMBER(22, 2)
)
/

prompt
prompt Creating type TARGET_KBK_REPORT_TABLE
prompt =====================================
prompt
CREATE OR REPLACE TYPE target_kbk_report_table AS TABLE OF target_kbk_report_type
/

prompt
prompt Creating type TA_INTEGER
prompt ========================
prompt
CREATE OR REPLACE TYPE TA_INTEGER AS
    TABLE OF INTEGER;
/

prompt
prompt Creating type TA_VC_32
prompt ======================
prompt
CREATE OR REPLACE TYPE TA_VC_32 AS
    TABLE OF VARCHAR2(32);
/

prompt
prompt Creating type TCD_KBKIDS
prompt ========================
prompt
create or replace type tCD_KBKIds is table of NUMBER(15)
/

prompt
prompt Creating type TUSRCUSTDET
prompt =========================
prompt
create or replace type tUsrCustDet
is table of rUsrCustDet;
/

prompt
prompt Creating type T_ID_T
prompt ====================
prompt
CREATE OR REPLACE TYPE "T_ID_T"                                                                          as TABLE OF number
/

prompt
prompt Creating type T_TF_ROW
prompt ======================
prompt
CREATE OR REPLACE TYPE t_tf_row AS OBJECT (
  id           NUMBER,
  NAME         VARCHAR2(1500)
);
/

prompt
prompt Creating type T_TF_TAB
prompt ======================
prompt
CREATE OR REPLACE TYPE t_tf_tab IS TABLE OF t_tf_row;
/

prompt
prompt Creating type body FDC_GOODS_AGG_TYPE
prompt =====================================
prompt
CREATE OR REPLACE TYPE BODY fdc_goods_agg_type IS

  STATIC FUNCTION ODCIAggregateInitialize (
      pCtx IN OUT fdc_goods_agg_type
    ) RETURN NUMBER IS
  BEGIN
    pCtx := fdc_goods_agg_type( fdc_string_table(), CHR(10) );
    RETURN ODCIConst.Success;
  END ODCIAggregateInitialize;

  MEMBER FUNCTION ODCIAggregateIterate (
      SELF       IN OUT fdc_goods_agg_type
     ,pValue     IN     VARCHAR2
    ) RETURN NUMBER IS
    lv_Value VARCHAR2(4000) := pValue;
  BEGIN
    IF self.goods.COUNT > 0 THEN
      FOR i IN self.goods.FIRST .. self.goods.LAST LOOP
        IF self.goods(i) = pValue THEN
          lv_Value := NULL;
          EXIT;
        END IF;
      END LOOP;
    END IF;

    IF lv_Value IS NOT NULL THEN
      self.goods.EXTEND;
      self.goods(self.goods.LAST) := lv_Value;
    END IF;

    RETURN ODCIConst.Success;
  END ODCIAggregateIterate;

  MEMBER FUNCTION ODCIAggregateMerge (
      SELF   IN OUT fdc_goods_agg_type
     ,pCtx   IN     fdc_goods_agg_type
    ) RETURN NUMBER IS
    lv_Value VARCHAR2(4000);
  BEGIN
    FOR i IN pCtx.goods.FIRST .. pCtx.goods.LAST LOOP
      lv_Value := pCtx.goods(i);
      FOR j IN SELF.goods.FIRST .. SELF.goods.LAST LOOP
        IF SELF.goods(j) = pCtx.goods(i) THEN
          lv_Value := NULL;
          EXIT;
        END IF;
      END LOOP;

      IF lv_Value IS NOT NULL THEN
        SELF.goods.EXTEND;
        SELF.goods(SELF.goods.LAST) := lv_Value;
      END IF;
    END LOOP;

    RETURN ODCIConst.Success;
  END ODCIAggregateMerge;


  MEMBER FUNCTION ODCIAggregateTerminate (
      SELF   IN  fdc_goods_agg_type
     ,pValue OUT VARCHAR2
     ,pFlags IN  NUMBER
    ) RETURN NUMBER IS
  BEGIN
    pValue := NULL;

    IF SELF.goods.COUNT > 0 THEN
      FOR i IN SELF.goods.FIRST .. SELF.goods.LAST LOOP
        pValue := pValue || SELF.delimeter || SELF.goods(i);
      END LOOP;
    END IF;

    IF pValue IS NOT NULL THEN
      pValue := SUBSTR( pValue, length( SELF.delimeter ) + 1 );
    END IF;

    RETURN ODCIConst.Success;
  END ODCIAggregateTerminate;

END;
/

prompt
prompt Creating type body FDC_STR_AGG_TYPE
prompt ===================================
prompt
CREATE OR REPLACE TYPE BODY fdc_str_agg_type IS

  STATIC FUNCTION ODCIAggregateInitialize (
      pCtx IN OUT fdc_str_agg_type
    ) RETURN NUMBER IS
  BEGIN
    pCtx := fdc_str_agg_type( NULL, ', ' );
    RETURN ODCIConst.Success;
  END ODCIAggregateInitialize;

  MEMBER FUNCTION ODCIAggregateIterate (
      SELF       IN OUT fdc_str_agg_type
     ,pValue     IN     VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    SELF.total_str := /*SUBSTR(*/ SELF.total_str || SELF.delimeter || pValue/*, 1, 32767 )*/;
    RETURN ODCIConst.Success;
  END ODCIAggregateIterate;

  MEMBER FUNCTION ODCIAggregateMerge (
      SELF   IN OUT fdc_str_agg_type
     ,pCtx   IN     fdc_str_agg_type
    ) RETURN NUMBER IS
  BEGIN
    SELF.total_str := /*SUBSTR(*/ SELF.total_str || pCtx.total_str/*, 1, 32767 )*/;
    RETURN ODCIConst.Success;
  END ODCIAggregateMerge;

  MEMBER FUNCTION ODCIAggregateTerminate (
      SELF   IN  fdc_str_agg_type
     ,pValue OUT VARCHAR2
     ,pFlags IN  NUMBER
    ) RETURN NUMBER IS
  BEGIN
    pValue := LTrim( SELF.total_str, SELF.delimeter );
    RETURN ODCIConst.Success;
  END ODCIAggregateTerminate;

END;
/

create or replace type rUsrDocDet as object
(
  customs_code varchar2(100),
  KBKCode_id   varchar2(100),
  pays         number(22, 2),
  notice       number(22, 2),
  podt_po      number(22, 2),
  vozvrat      number(22, 2),
  reuse        number(22, 2)
)
/
create or replace type tUsrDocDet
as table of rUsrDocDet;
/
prompt
prompt Creating sequence DBF_OBJECT_KEY_SQ
prompt ===================================
prompt
create sequence DBF_OBJECT_KEY_SQ
start with 354597
increment by 1
cache 20;

prompt
prompt Creating sequence FDC_BUFFER_KEY_SQ
prompt ===================================
prompt
create sequence FDC_BUFFER_KEY_SQ
maxvalue 1000000000
start with 41
increment by 1
cache 200
cycle;

prompt
prompt Creating sequence FDC_DECL_PERIOD_PROLONG_KEY_SQ
prompt ================================================
prompt
create sequence FDC_DECL_PERIOD_PROLONG_KEY_SQ
start with 1
increment by 1
nocache;

prompt
prompt Creating sequence FDC_LOG_KEY_SQ
prompt ================================
prompt
create sequence FDC_LOG_KEY_SQ
start with 5
increment by 1
cache 200;

prompt
prompt Creating sequence FDC_OBJECT_KEY_SQ
prompt ===================================
prompt
create sequence FDC_OBJECT_KEY_SQ
start with 3100000
increment by 1
cache 100;

prompt
prompt Creating sequence SQ_EXCH_MESSAGE
prompt =================================
prompt
create sequence SQ_EXCH_MESSAGE
start with 1
increment by 1
cache 100;

prompt
prompt Creating sequence SQ_EXCH_MESSAGEDATA
prompt =====================================
prompt
create sequence SQ_EXCH_MESSAGEDATA
start with 1
increment by 1
cache 100;

prompt
prompt Creating sequence S_EH_CALL
prompt ===========================
prompt
create sequence S_EH_CALL
minvalue 0
start with 59901
increment by 1
cache 20;

prompt
prompt Creating sequence S_EH_CALL_STACK
prompt =================================
prompt
create sequence S_EH_CALL_STACK
minvalue 0
start with 6161
increment by 1
cache 20;

prompt
prompt Creating sequence S_EH_ERROR
prompt ============================
prompt
create sequence S_EH_ERROR
minvalue 0
start with 1581
increment by 1
cache 20;

prompt
prompt Creating sequence S_EH_ERROR_CODE
prompt =================================
prompt
create sequence S_EH_ERROR_CODE
minvalue 0
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence S_EH_ERROR_TYPE
prompt =================================
prompt
create sequence S_EH_ERROR_TYPE
minvalue 0
start with 1
increment by 1
cache 20;
