prompt Настройки уровня ТО... 
prompt 

prompt Сборка 00105 ... 
prompt 
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
  lv_Version VARCHAR2(20);
  lv_Val     NUMBER;
BEGIN
  -- Выполнять, если версия ниже
--  SELECT substr( t.stringvalue, 1, 20 )
--    INTO lv_Version
--    FROM fdc_value_lst_sys t
--    WHERE t.sysname = 'Version';
    
--  lv_Val := to_number( substr( lv_Version, instr( lv_Version, '.', -1 ) + 1 ) );
--  IF lv_Val > 104 THEN
--    RETURN;
--  END IF;

  -- Обновление

  dbms_output.put_line( '--  SBakum.01.01.old_acc_close.pdc  ------------------------' );
  
  BEGIN

    declare
      vl_DocDateBegin   DATE         := to_date( '01102009', 'DDMMYYYY' );
      vl_DateEnd        DATE         := to_date( '30092009', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1399';
      vl_DocNumberEnd VARCHAR2(50)   := '1348';
    begin
      UPDATE fdc_nsi_dict d
      SET d.edate     = vl_DateEnd
         ,d.datenddoc = vl_DocDateBegin
         ,d.numenddoc = vl_DocNumberBegin
      WHERE d.id IN ( SELECT ID FROM fdc_acc )
        AND d.edate IS NULL
        AND d.datbegdoc = to_date( '31102008', 'DDMMYYYY' )
        AND d.numbegdoc = vl_DocNumberEnd;
    end;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.01.old_acc_close.pdc  ------------------------ END' );

  dbms_output.put_line( '--  SBakum.01.02.add_acc_t.pdc  ------------------------' );
  
  BEGIN

    DECLARE
      vl_l1_ID fdc_object.id%TYPE;
      vl_l2_ID fdc_object.id%TYPE;
      vl_l3_ID fdc_object.id%TYPE;
      vl_DateBegin      DATE         := to_date( '01102009', 'DDMMYYYY' );
      vl_DocDateBegin   DATE         := to_date( '30092009', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1399';
    BEGIN
      -- Балансовые счета
      -- 01.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на субсчете'
         ,pCode      => '01.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Поступление по безналичному расчету'
           ,pCode      => '01.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Поступление денег в пути'
           ,pCode      => '01.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении КБК аванса'
           ,pCode      => '01.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Подтверждение'
           ,pCode      => '01.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возвраты'
           ,pCode      => '01.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты с другой таможни'
           ,pCode      => '01.01.06'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты на другую таможню'
           ,pCode      => '01.01.07'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении целевого КБК'
           ,pCode      => '01.01.08'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении излишней уплаты'
           ,pCode      => '01.01.09'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
      -- 01.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Касса таможни'
         ,pCode      => '01.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- 01.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Деньги в пути'
         ,pCode      => '01.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'МК'
           ,pCode      => '01.03.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Инкассация из кассы таможни'
           ,pCode      => '01.03.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Приписная касса'
           ,pCode      => '01.03.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
      -- 02.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по платежам'
         ,pCode      => '02.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Расчеты при декларировании товаров. ГТД'
           ,pCode      => '02.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Расчеты при декларировании товаров. ТПО'
           ,pCode      => '02.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Иные расчеты'
           ,pCode      => '02.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
      -- 02.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по платежам. КП'
         ,pCode      => '02.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => 'T'
        );
      -- 03.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по задолженности по платежам и пеням'
         ,pCode      => '03.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность, подлежащая взысканию'
           ,pCode      => '03.01.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Установление'
             ,pCode      => '03.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие на учет из-за баланса'
             ,pCode      => '03.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Погашение'
             ,pCode      => '03.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключение из учета'
             ,pCode      => '03.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Перевод в безнадежную к взысканию'
             ,pCode      => '03.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Перевод  за баланс'
             ,pCode      => '03.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Оплата  на другие счета'
             ,pCode      => '03.01.07'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность, безнадежная к взысканию'
           ,pCode      => '03.02.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие на учет безнадежной к взысканию'
             ,pCode      => '03.02.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключение из учета  задолженности по приказу Минфина №117н'
             ,pCode      => '03.02.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
      -- 04.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по штрафам'
         ,pCode      => '04.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Принятие на учет'
             ,pCode      => '04.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Уплата'
             ,pCode      => '04.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Снятие с учета  без оплаты'
             ,pCode      => '04.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Оплата  на другие счета'
             ,pCode      => '04.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
      -- 05.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Возмещение из бюджета'
         ,pCode      => '05.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возмещение из бюджета излишней уплаты'
           ,pCode      => '05.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возмещение из бюджета процентов за нарушение сроков возврата'
           ,pCode      => '05.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
      -- 05.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Возмещение из бюджета. КП'
         ,pCode      => '05.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Т',pkbk_sign => 'T'
        );
      -- 06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с участниками ВЭД'
         ,pCode      => '06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Поступление'
             ,pCode      => '06.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Зачет излишней уплаты/взыскания'
             ,pCode      => '06.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Списание по документам'
             ,pCode      => '06.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возврат'
             ,pCode      => '06.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Расчеты по денежным залогам'
             ,pCode      => '06.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Зачеты на другую таможню'
             ,pCode      => '06.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
      -- 07.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по денежным залогам'
         ,pCode      => '07.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Оформление залогов'
             ,pCode      => '07.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Уплата задолженности'
             ,pCode      => '07.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Зачет по залогам'
             ,pCode      => '07.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возврат залогов'
             ,pCode      => '07.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Снятие с учета невостребованного залога'
             ,pCode      => '07.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
            );
      -- 08.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по излишне уплаченным/взысканным платежам'
         ,pCode      => '08.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Выявление излишней уплаты/взыскания'
           ,pCode      => '08.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачет излишней уплаты/взыскания'
           ,pCode      => '08.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возврат излишней уплаты/взыскания'
           ,pCode      => '08.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Снятие с учета невостребованной излишней уплаты/взыскания'
           ,pCode      => '08.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уплата задолженности'
           ,pCode      => '08.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
      -- 08.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с КП  по излишне уплаченным платежам'
         ,pCode      => '08.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => 'T'
        );
      -- 09.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по возвратам'
         ,pCode      => '09.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возвраты авансовых платежей'
           ,pCode      => '09.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возвраты денежного залога'
           ,pCode      => '09.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Возвраты излишней уплаты/взыскания'
           ,pCode      => '09.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Выплаты процентов за нарушение сроков возврата'
           ,pCode      => '09.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
      -- 09.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Зачеты в другие таможни'
         ,pCode      => '09.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- 09.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр возвратов'
         ,pCode      => '09.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- 10.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с бюджетом по начислению платежей'
         ,pCode      => '10.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Начислено'
           ,pCode      => '10.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Включено в уведомление об уточнении КБК аванса'
           ,pCode      => '10.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Включено в подтверждение'
           ,pCode      => '10.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Переведено в задолженность'
           ,pCode      => '10.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Включено в уведомление об уточнении целевого КБК'
           ,pCode      => '10.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
      -- 10.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по начислению и зачету платежей. КП'
         ,pCode      => '10.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => 'T'
        );
      -- 11.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с бюджетом по задолженности и штрафам'
         ,pCode      => '11.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность по платежам и штрафам, подлежащая взысканию'
           ,pCode      => '11.01.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Начислено штрафов'
             ,pCode      => '11.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Установлено задолженности'
             ,pCode      => '11.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие из-за баланса'
             ,pCode      => '11.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Включено в уведомление об уточнении КБК аванса'
             ,pCode      => '11.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Включено в подтверждение'
             ,pCode      => '11.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключено из учета'
             ,pCode      => '11.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Перевод в безнадежную к взысканию'
             ,pCode      => '11.01.07'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Перевод  за баланс'
             ,pCode      => '11.01.08'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Оплата на другие счета'
             ,pCode      => '11.01.09'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Включено в уведомление об уточнении целевого КБК'
             ,pCode      => '11.01.10'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность, безнадежная к взысканию'
           ,pCode      => '11.02.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие на учет задолженности, безнадежной к взысканию'
             ,pCode      => '11.02.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключение из учета задолженности по приказу Минфина №117н'
             ,pCode      => '11.02.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
      -- 12.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с бюджетом по зачету платежей'
         ,pCode      => '12.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении КБК аванса'
           ,pCode      => '12.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении целевого КБК'
           ,pCode      => '12.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Уведомление об уточнении излишней уплаты'
           ,pCode      => '12.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Подтверждение'
           ,pCode      => '12.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
      -- 12.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача уведомлений об уточнении'
         ,pCode      => '12.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении КБК аванса'
           ,pCode      => '12.02.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении целевого КБК'
           ,pCode      => '12.02.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении излишней уплаты'
           ,pCode      => '12.02.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'S'
          );
      -- 12.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача подтверждения'
         ,pCode      => '12.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- забалансовые счета
      -- 01.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на субсчете таможни'
         ,pCode      => '01.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- 03.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по задолженности по платежам и пеням, которая не взыскивается принудительно'
         ,pCode      => '03.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность, которая не взыскивается принудительно'
           ,pCode      => '03.05.00.заб'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Z'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие на забалансовый учет'
             ,pCode      => '03.05.01.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Восстановление  на балансе'
             ,pCode      => '03.05.02.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключение на забалансовом учете'
             ,pCode      => '03.05.03.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Доначисление пеней'
             ,pCode      => '03.05.04.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
      -- 09.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по возвратам'
         ,pCode      => '09.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Т',pkbk_sign => 'S'
        );
      -- 11.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты с бюджетом по задолженности по платежам и пеням, которая не взыскивается принудительно'
         ,pCode      => '11.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Т',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Задолженность по КБК, которая не взыскивается принудительно'
           ,pCode      => '11.05.00.заб'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Z'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Т',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Принятие на забалансовый учет'
             ,pCode      => '11.05.01.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Восстановление на балансе'
             ,pCode      => '11.05.02.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Исключение на забалансовом учете'
             ,pCode      => '11.05.03.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Доначисление пеней'
             ,pCode      => '11.05.04.заб'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Т',pkbk_sign => 'T'
            );
    exception
      when others then
        rollback;
      raise;
    END;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.02.add_acc_t.pdc  ------------------------ END' );

  dbms_output.put_line( '--  SBakum.01.03.add_acc_r.pdc  ------------------------' );
  
  BEGIN

    DECLARE
      vl_l1_ID fdc_object.id%TYPE;
      vl_l2_ID fdc_object.id%TYPE;
      vl_l3_ID fdc_object.id%TYPE;
      vl_DateBegin      DATE         := to_date( '01102009', 'DDMMYYYY' );
      vl_DocDateBegin   DATE         := to_date( '30092009', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1399';
      lcustom_level number;
    BEGIN
      -- определение уровня ТО (2 - таможенный уровень)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 1) then
      -- Балансовые счета
      -- Р01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Р01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Поступление'
             ,pCode      => 'Р01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возвраты'
             ,pCode      => 'Р01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Списано со счета'
             ,pCode      => 'Р01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
      -- Р06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Р06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределение денежных средств'
           ,pCode      => 'Р06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределенные денежные средства'
           ,pCode      => 'Р06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Неидентифицированные по таможням'
             ,pCode      => 'Р06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => ''
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства на субсчетах таможен'
             ,pCode      => 'Р06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства участников ВЭД'
             ,pCode      => 'Р06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства КП'
             ,pCode      => 'Р06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => ''
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты между РТУ и таможнями'
           ,pCode      => 'Р06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
      -- Р09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр на возврат'
         ,pCode      => 'Р09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
      -- Р12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача уведомлений об уточнении'
         ,pCode      => 'Р12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении КБК аванса'
           ,pCode      => 'Р12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении целевого КБК'
           ,pCode      => 'Р12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Р12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
      -- Р12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача подтверждения'
         ,pCode      => 'Р12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
    end if;
    exception
      when others then
        rollback;
      raise;
    END;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.03.add_acc_r.pdc  ------------------------ END' );

  dbms_output.put_line( '--  SBakum.01.04.add_acc_f.pdc  ------------------------' );
  
  BEGIN

    DECLARE
      vl_l1_ID fdc_object.id%TYPE;
      vl_l2_ID fdc_object.id%TYPE;
      vl_l3_ID fdc_object.id%TYPE;
      vl_DateBegin      DATE         := to_date( '01102009', 'DDMMYYYY' );
      vl_DocDateBegin   DATE         := to_date( '30092009', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1399';
      lcustom_level number;
    BEGIN
      -- определение уровня ТО (2 - таможенный уровень)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 0) then
      -- Балансовые счета
      -- Ф01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Ф01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Поступление'
             ,pCode      => 'Ф01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возвраты'
             ,pCode      => 'Ф01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Списано со счета'
             ,pCode      => 'Ф01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
      -- Ф06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Ф06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределение денежных средств'
           ,pCode      => 'Ф06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределенные денежные средства'
           ,pCode      => 'Ф06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Неидентифицированные по РТУ и таможням'
             ,pCode      => 'Ф06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства на субсчетах РТУ и таможен'
             ,pCode      => 'Ф06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства участников ВЭД'
             ,pCode      => 'Ф06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства КП'
             ,pCode      => 'Ф06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты между РТУ и таможнями'
           ,pCode      => 'Ф06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
          );
      -- Ф09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр на возврат'
         ,pCode      => 'Ф09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => 'S'
        );
      -- Ф12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача уведомлений об уточнении'
         ,pCode      => 'Ф12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении КБК аванса'
           ,pCode      => 'Ф12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении целевого КБК'
           ,pCode      => 'Ф12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Ф12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
      -- Ф12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача подтверждения'
         ,pCode      => 'Ф12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => 'S'
        );
    end if;
    exception
      when others then
        rollback;
      raise;
    END;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.04.add_acc_f.pdc  ------------------------ END' );
END;
/
SET SERVEROUTPUT OFF
prompt Сборка 00105 ... выполнено 
prompt 
prompt

prompt Сборка 00142 ... 
prompt 
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
  lv_Version VARCHAR2(20);
  lv_Val     NUMBER;
BEGIN
  dbms_output.put_line( '--  SBakum.01.01.upd_acc.pdc  ------------------------' );
  BEGIN

    update fdc_acc set KBK_SIGN = 'S'
    where id in (select id from fdc_acc_lst where code in ('01.01.09'))
    ;
    update fdc_acc set KBK_SIGN = 'T'
    where id in (select id from fdc_acc_lst where code in ('12.01.03','12.02.03'))
    ;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.01.upd_acc.pdc  ------------------------ END' );
END;
/
SET SERVEROUTPUT OFF
prompt Сборка 00142 ... выполнено 
prompt 
prompt


prompt Сборка 00226 ... 
prompt 
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
  lv_Version VARCHAR2(20);
  lv_Val     NUMBER;
BEGIN
  dbms_output.put_line( '--  SBakum.01.03.add_acc_r.pdc  ------------------------' );
  BEGIN

    DECLARE
      vl_l1_ID fdc_object.id%TYPE;
      vl_l2_ID fdc_object.id%TYPE;
      vl_l3_ID fdc_object.id%TYPE;
      vl_DateBegin      DATE         := to_date( '01012011', 'DDMMYYYY' );
      vl_DocDateBegin   DATE         := to_date( '01102010', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1808';
      vl_DocNumberBegin_old VARCHAR2(50) := '1399';
      lcustom_level number;
      --
      function acc_add
      (
        pName           IN fdc_object.name%TYPE,
        pCode           IN fdc_dict.code%TYPE,
        pSDate          IN fdc_nsi_dict.sdate%TYPE,
        pDatBegDoc      IN fdc_nsi_dict.datbegdoc%TYPE,
        pNumBegDoc      IN fdc_nsi_dict.numbegdoc%TYPE,
        pIsActive       IN fdc_acc.Is_Active%TYPE       := 'Y',
        pto_level_sign  IN fdc_acc.to_level_sign%TYPE   := NULL,
        pkbk_sign        IN fdc_acc.kbk_sign%TYPE       := NULL
      ) return fdc_object.id%type
      is
        --
        l_result fdc_object.id%type;
        --
      begin
        --
        select id into l_result
        from fdc_acc_lst
        where code = pCode
          and numbegdoc = pNumBegDoc;
        --
        if (l_result is null) then
          l_result := fdc_acc_add
           (
             pName          => pName
            ,pCode          => pCode
            ,pSDate         => pSDate
            ,pDatBegDoc     => pDatBegDoc
            ,pNumBegDoc     => pNumBegDoc
            ,pIsActive      => pIsActive
          ,pto_level_sign => pto_level_sign
            ,pkbk_sign      => pkbk_sign
           );
        end if;
        return l_result;
      end;
      --
    BEGIN
      -- определение уровня ТО (2 - таможенный уровень)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 1) then
      -- закрытие старых счетов
      for rec_cur in (
                      select id
                      from fdc_acc_lst
                      where numbegdoc = vl_DocNumberBegin_old
                        and to_level_sign = 'Р'
                        and edate is NULL
                     )
      loop
        update fdc_nsi_dict set edate     = (vl_DateBegin - 1)
                               ,datenddoc = vl_DocDateBegin
                               ,numenddoc = vl_DocNumberBegin
        where id = rec_cur.id;
      end loop;
      -- Балансовые счета
      -- Р01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на субсчете'
         ,pCode      => 'Р01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Поступление'
             ,pCode      => 'Р01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возвраты'
             ,pCode      => 'Р01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Списание'
             ,pCode      => 'Р01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Зачет на РТУ/ТНП'
             ,pCode      => 'Р01.10.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
      -- Р06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на субсчете'
         ,pCode      => 'Р06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределение денежных средств'
           ,pCode      => 'Р06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределенные денежные средства'
           ,pCode      => 'Р06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Неидентифицированные по таможням'
             ,pCode      => 'Р06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства на субсчетах таможен'
             ,pCode      => 'Р06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Субсчет "Денежные средства участников ВЭД РТУ"'
             ,pCode      => 'Р06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Субсчет "Денежные средства КП РТУ"'
             ,pCode      => 'Р06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты между таможнями'
           ,pCode      => 'Р06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
      -- Р09.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр на возврат'
         ,pCode      => 'Р09.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
      -- Р09.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр на зачет на РТУ/ТНП'
         ,pCode      => 'Р09.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
      -- Р12.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Прием реестров уведомленй/подтверждений из ТО'
         ,pCode      => 'Р12.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении КБК аванс'
           ,pCode      => 'Р12.10.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении целевого КБК'
           ,pCode      => 'Р12.10.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Р12.10.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием подтверждений'
           ,pCode      => 'Р12.10.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
      -- Р12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Формирование реестров уведомлений/ подтверждений '
         ,pCode      => 'Р12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении КБК аванса'
           ,pCode      => 'Р12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении целевого КБК'
           ,pCode      => 'Р12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Р12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра подтверждений'
           ,pCode      => 'Р12.20.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
      -- Р12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача реестров уведомлений/подтверждений'
         ,pCode      => 'Р12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Р',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении КБК аванс'
           ,pCode      => 'Р12.30.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении целевого КБК'
           ,pCode      => 'Р12.30.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Р12.30.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров подтверждений'
           ,pCode      => 'Р12.30.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Р',pkbk_sign => 'S'
          );
      -- Р01.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на субсчете'
         ,pCode      => 'Р01.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
      -- Р09.00.00.заб
      vl_l1_ID := fdc_acc_add (
          pName      => 'Расчеты по возвратам'
         ,pCode      => 'Р09.00.00.заб'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => 'Р',pkbk_sign => 'S'
        );
      commit;
    end if;
    exception
      when others then
        rollback;
      raise;
    END;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.03.add_acc_r.pdc  ------------------------ END' );

  dbms_output.put_line( '--  SBakum.01.04.add_acc_f.pdc  ------------------------' );
  BEGIN

    DECLARE
      vl_l1_ID fdc_object.id%TYPE;
      vl_l2_ID fdc_object.id%TYPE;
      vl_l3_ID fdc_object.id%TYPE;
      vl_DateBegin      DATE         := to_date( '01012011', 'DDMMYYYY' );
      vl_DocDateBegin   DATE         := to_date( '01102010', 'DDMMYYYY' );
      vl_DocNumberBegin VARCHAR2(50) := '1808';
      vl_DocNumberBegin_old VARCHAR2(50) := '1399';
      lcustom_level number;
      --
      function acc_add
      (
        pName           IN fdc_object.name%TYPE,
        pCode           IN fdc_dict.code%TYPE,
        pSDate          IN fdc_nsi_dict.sdate%TYPE,
        pDatBegDoc      IN fdc_nsi_dict.datbegdoc%TYPE,
        pNumBegDoc      IN fdc_nsi_dict.numbegdoc%TYPE,
        pIsActive       IN fdc_acc.Is_Active%TYPE       := 'Y',
        pto_level_sign  IN fdc_acc.to_level_sign%TYPE   := NULL,
        pkbk_sign        IN fdc_acc.kbk_sign%TYPE       := NULL
      ) return fdc_object.id%type
      is
        --
        l_result fdc_object.id%type;
        --
      begin
        --
        select id into l_result
        from fdc_acc_lst
        where code = pCode
          and numbegdoc = pNumBegDoc;
        --
        if (l_result is null) then
          l_result := fdc_acc_add
           (
             pName          => pName
            ,pCode          => pCode
            ,pSDate         => pSDate
            ,pDatBegDoc     => pDatBegDoc
            ,pNumBegDoc     => pNumBegDoc
            ,pIsActive      => pIsActive
          ,pto_level_sign => pto_level_sign
            ,pkbk_sign      => pkbk_sign
           );
        end if;
        return l_result;
      end;
      --
    BEGIN
      -- определение уровня ТО (2 - таможенный уровень)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 0) then
      -- закрытие старых счетов
      for rec_cur in (
                      select id
                      from fdc_acc_lst
                      where numbegdoc = vl_DocNumberBegin_old
                        and to_level_sign = 'Ф'
                        and edate is NULL
                     )
      loop
        update fdc_nsi_dict set edate     = (vl_DateBegin - 1)
                               ,datenddoc = vl_DocDateBegin
                               ,numenddoc = vl_DocNumberBegin
        where id = rec_cur.id;
      end loop;
      -- Балансовые счета
      -- Ф01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Ф01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Поступление по КБК'
             ,pCode      => 'Ф01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Зачет с КБК 100'
             ,pCode      => 'Ф01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Возвраты'
             ,pCode      => 'Ф01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => 'Снято с учета'
             ,pCode      => 'Ф01.10.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
      -- Ф06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Денежные средства на счете'
         ,pCode      => 'Ф06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределение денежных средств'
           ,pCode      => 'Ф06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Распределенные денежные средства'
           ,pCode      => 'Ф06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Неидентифицированные по РТУ и ТНП'
             ,pCode      => 'Ф06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Денежные средства на субсчетах РТУ и ТНП'
             ,pCode      => 'Ф06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Субсчет "Денежные средства участников ВЭД ФТС России"'
             ,pCode      => 'Ф06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Субсчет "Денежные средства КП"'
             ,pCode      => 'Ф06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => 'Неидентифицированные по КБК (КБК...4000)'
             ,pCode      => 'Ф06.20.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Зачеты между РТУ/ТНП'
           ,pCode      => 'Ф06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'S'
          );
      -- Ф09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Реестр на возврат'
         ,pCode      => 'Ф09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => 'S'
        );
      -- Ф12.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Прием реестров уведомленй/ подтверждений из ТО'
         ,pCode      => 'Ф12.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении КБК аванс'
           ,pCode      => 'Ф12.10.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении целевого КБК'
           ,pCode      => 'Ф12.10.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Ф12.10.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Прием подтверждений'
           ,pCode      => 'Ф12.10.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
      -- Ф12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Формирование реестров уведомлений/ подтверждений'
         ,pCode      => 'Ф12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении КБК аванса'
           ,pCode      => 'Ф12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении целевого КБК'
           ,pCode      => 'Ф12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Ф12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Формирование реестра подтверждений'
           ,pCode      => 'Ф12.20.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
      -- Ф12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача реестров уведомлений'
         ,pCode      => 'Ф12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении КБК аванс'
           ,pCode      => 'Ф12.30.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении целевого КБК '
           ,pCode      => 'Ф12.30.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => 'Передача реестров уведомлений об уточнении излишней уплаты'
           ,pCode      => 'Ф12.30.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => 'Ф',pkbk_sign => 'T'
          );
      -- Ф12.40.00
      vl_l1_ID := fdc_acc_add (
          pName      => 'Передача реестров подтверждений'
         ,pCode      => 'Ф12.40.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => 'Ф',pkbk_sign => 'S'
        );
      commit;
    end if;
    exception
      when others then
        rollback;
      raise;
    END;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( SUBSTR( sqlerrm, 1, 254 ) );
  END;

  dbms_output.put_line( '--  SBakum.01.04.add_acc_f.pdc  ------------------------ END' );
END;
/
SET SERVEROUTPUT OFF
prompt Сборка 00226 ... выполнено 
prompt 
prompt


prompt Настройки уровня ТО... завершено.
prompt 