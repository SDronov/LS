prompt ��������� ������ ��... 
prompt 

prompt ������ 00105 ... 
prompt 
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
  lv_Version VARCHAR2(20);
  lv_Val     NUMBER;
BEGIN
  -- ���������, ���� ������ ����
--  SELECT substr( t.stringvalue, 1, 20 )
--    INTO lv_Version
--    FROM fdc_value_lst_sys t
--    WHERE t.sysname = 'Version';
    
--  lv_Val := to_number( substr( lv_Version, instr( lv_Version, '.', -1 ) + 1 ) );
--  IF lv_Val > 104 THEN
--    RETURN;
--  END IF;

  -- ����������

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
      -- ���������� �����
      -- 01.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� ��������'
         ,pCode      => '01.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ������������ �������'
           ,pCode      => '01.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� ����� � ����'
           ,pCode      => '01.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� ��� ������'
           ,pCode      => '01.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������'
           ,pCode      => '01.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '��������'
           ,pCode      => '01.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ � ������ �������'
           ,pCode      => '01.01.06'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ �� ������ �������'
           ,pCode      => '01.01.07'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� �������� ���'
           ,pCode      => '01.01.08'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� �������� ������'
           ,pCode      => '01.01.09'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- 01.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '����� �������'
         ,pCode      => '01.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- 01.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ � ����'
         ,pCode      => '01.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '��'
           ,pCode      => '01.03.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '���������� �� ����� �������'
           ,pCode      => '01.03.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '��������� �����'
           ,pCode      => '01.03.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- 02.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ��������'
         ,pCode      => '02.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������� ��� �������������� �������. ���'
           ,pCode      => '02.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������� ��� �������������� �������. ���'
           ,pCode      => '02.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '���� �������'
           ,pCode      => '02.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- 02.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ��������. ��'
         ,pCode      => '02.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => 'T'
        );
      -- 03.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ������������� �� �������� � �����'
         ,pCode      => '03.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������, ���������� ���������'
           ,pCode      => '03.01.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '������������'
             ,pCode      => '03.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �� ���� ��-�� �������'
             ,pCode      => '03.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������'
             ,pCode      => '03.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������� �� �����'
             ,pCode      => '03.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� � ����������� � ���������'
             ,pCode      => '03.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������  �� ������'
             ,pCode      => '03.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������  �� ������ �����'
             ,pCode      => '03.01.07'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������, ����������� � ���������'
           ,pCode      => '03.02.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �� ���� ����������� � ���������'
             ,pCode      => '03.02.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������� �� �����  ������������� �� ������� ������� �117�'
             ,pCode      => '03.02.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
      -- 04.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� �������'
         ,pCode      => '04.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '�������� �� ����'
             ,pCode      => '04.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������'
             ,pCode      => '04.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������ � �����  ��� ������'
             ,pCode      => '04.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������  �� ������ �����'
             ,pCode      => '04.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
      -- 05.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '���������� �� �������'
         ,pCode      => '05.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '���������� �� ������� �������� ������'
           ,pCode      => '05.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '���������� �� ������� ��������� �� ��������� ������ ��������'
           ,pCode      => '05.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Y'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- 05.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '���������� �� �������. ��'
         ,pCode      => '05.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => 'T'
        );
      -- 06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � ����������� ���'
         ,pCode      => '06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '�����������'
             ,pCode      => '06.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '����� �������� ������/���������'
             ,pCode      => '06.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '�������� �� ����������'
             ,pCode      => '06.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '�������'
             ,pCode      => '06.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������� �� �������� �������'
             ,pCode      => '06.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������ �� ������ �������'
             ,pCode      => '06.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- 07.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� �������� �������'
         ,pCode      => '07.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '���������� �������'
             ,pCode      => '07.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������ �������������'
             ,pCode      => '07.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '����� �� �������'
             ,pCode      => '07.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������� �������'
             ,pCode      => '07.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������ � ����� ����������������� ������'
             ,pCode      => '07.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- 08.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ������� ����������/���������� ��������'
         ,pCode      => '08.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '��������� �������� ������/���������'
           ,pCode      => '08.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� �������� ������/���������'
           ,pCode      => '08.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������� �������� ������/���������'
           ,pCode      => '08.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ � ����� ���������������� �������� ������/���������'
           ,pCode      => '08.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ �������������'
           ,pCode      => '08.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- 08.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � ��  �� ������� ���������� ��������'
         ,pCode      => '08.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'T'
        );
      -- 09.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ���������'
         ,pCode      => '09.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ��������� ��������'
           ,pCode      => '09.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ��������� ������'
           ,pCode      => '09.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ������/���������'
           ,pCode      => '09.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������� ��������� �� ��������� ������ ��������'
           ,pCode      => '09.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- 09.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ � ������ �������'
         ,pCode      => '09.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- 09.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ ���������'
         ,pCode      => '09.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- 10.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � �������� �� ���������� ��������'
         ,pCode      => '10.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '���������'
           ,pCode      => '10.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� � ����������� �� ��������� ��� ������'
           ,pCode      => '10.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� � �������������'
           ,pCode      => '10.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '���������� � �������������'
           ,pCode      => '10.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� � ����������� �� ��������� �������� ���'
           ,pCode      => '10.01.05'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- 10.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ���������� � ������ ��������. ��'
         ,pCode      => '10.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'T'
        );
      -- 11.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � �������� �� ������������� � �������'
         ,pCode      => '11.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �� �������� � �������, ���������� ���������'
           ,pCode      => '11.01.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '��������� �������'
             ,pCode      => '11.01.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '����������� �������������'
             ,pCode      => '11.01.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� ��-�� �������'
             ,pCode      => '11.01.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� � ����������� �� ��������� ��� ������'
             ,pCode      => '11.01.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� � �������������'
             ,pCode      => '11.01.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '��������� �� �����'
             ,pCode      => '11.01.06'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� � ����������� � ���������'
             ,pCode      => '11.01.07'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������  �� ������'
             ,pCode      => '11.01.08'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������ �� ������ �����'
             ,pCode      => '11.01.09'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� � ����������� �� ��������� �������� ���'
             ,pCode      => '11.01.10'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������, ����������� � ���������'
           ,pCode      => '11.02.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �� ���� �������������, ����������� � ���������'
             ,pCode      => '11.02.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������� �� ����� ������������� �� ������� ������� �117�'
             ,pCode      => '11.02.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
      -- 12.01.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � �������� �� ������ ��������'
         ,pCode      => '12.01.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� ��� ������'
           ,pCode      => '12.01.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� �������� ���'
           ,pCode      => '12.01.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����������� �� ��������� �������� ������'
           ,pCode      => '12.01.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������'
           ,pCode      => '12.01.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- 12.02.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� ����������� �� ���������'
         ,pCode      => '12.02.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� ��� ������'
           ,pCode      => '12.02.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ���'
           ,pCode      => '12.02.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ������'
           ,pCode      => '12.02.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- 12.03.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������������'
         ,pCode      => '12.03.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- ������������ �����
      -- 01.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �������� �������'
         ,pCode      => '01.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- 03.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ������������� �� �������� � �����, ������� �� ������������ �������������'
         ,pCode      => '03.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������, ������� �� ������������ �������������'
           ,pCode      => '03.05.00.���'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Z'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �� ������������ ����'
             ,pCode      => '03.05.01.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '��������������  �� �������'
             ,pCode      => '03.05.02.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������� �� ������������ �����'
             ,pCode      => '03.05.03.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������������ �����'
             ,pCode      => '03.05.04.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
      -- 09.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ���������'
         ,pCode      => '09.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- 11.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '������� � �������� �� ������������� �� �������� � �����, ������� �� ������������ �������������'
         ,pCode      => '11.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �� ���, ������� �� ������������ �������������'
           ,pCode      => '11.05.00.���'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'Z'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �� ������������ ����'
             ,pCode      => '11.05.01.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������� �� �������'
             ,pCode      => '11.05.02.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '���������� �� ������������ �����'
             ,pCode      => '11.05.03.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������������ �����'
             ,pCode      => '11.05.04.���'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Z'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
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
      -- ����������� ������ �� (2 - ���������� �������)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 1) then
      -- ���������� �����
      -- �01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '�����������'
             ,pCode      => '�01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '��������'
             ,pCode      => '�01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������� �� �����'
             ,pCode      => '�01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- �06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �������� �������'
           ,pCode      => '�06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������� �������� ��������'
           ,pCode      => '�06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������������� �� ��������'
             ,pCode      => '�06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => ''
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� �� ��������� �������'
             ,pCode      => '�06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� ���������� ���'
             ,pCode      => '�06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� ��'
             ,pCode      => '�06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => ''
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ ����� ��� � ���������'
           ,pCode      => '�06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ �� �������'
         ,pCode      => '�09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� ����������� �� ���������'
         ,pCode      => '�12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� ��� ������'
           ,pCode      => '�12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- �12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������������'
         ,pCode      => '�12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
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
      -- ����������� ������ �� (2 - ���������� �������)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 0) then
      -- ���������� �����
      -- �01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '�����������'
             ,pCode      => '�01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '��������'
             ,pCode      => '�01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '������� �� �����'
             ,pCode      => '�01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- �06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �������� �������'
           ,pCode      => '�06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������� �������� ��������'
           ,pCode      => '�06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������������� �� ��� � ��������'
             ,pCode      => '�06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� �� ��������� ��� � �������'
             ,pCode      => '�06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� ���������� ���'
             ,pCode      => '�06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� ��'
             ,pCode      => '�06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ ����� ��� � ���������'
           ,pCode      => '�06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ �� �������'
         ,pCode      => '�09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� ����������� �� ���������'
         ,pCode      => '�12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� ��� ������'
           ,pCode      => '�12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- �12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������������'
         ,pCode      => '�12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
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
prompt ������ 00105 ... ��������� 
prompt 
prompt

prompt ������ 00142 ... 
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
prompt ������ 00142 ... ��������� 
prompt 
prompt


prompt ������ 00226 ... 
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
      -- ����������� ������ �� (2 - ���������� �������)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 1) then
      -- �������� ������ ������
      for rec_cur in (
                      select id
                      from fdc_acc_lst
                      where numbegdoc = vl_DocNumberBegin_old
                        and to_level_sign = '�'
                        and edate is NULL
                     )
      loop
        update fdc_nsi_dict set edate     = (vl_DateBegin - 1)
                               ,datenddoc = vl_DocDateBegin
                               ,numenddoc = vl_DocNumberBegin
        where id = rec_cur.id;
      end loop;
      -- ���������� �����
      -- �01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� ��������'
         ,pCode      => '�01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '�����������'
             ,pCode      => '�01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '��������'
             ,pCode      => '�01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '��������'
             ,pCode      => '�01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '����� �� ���/���'
             ,pCode      => '�01.10.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- �06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� ��������'
         ,pCode      => '�06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �������� �������'
           ,pCode      => '�06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������� �������� ��������'
           ,pCode      => '�06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������������� �� ��������'
             ,pCode      => '�06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� �� ��������� �������'
             ,pCode      => '�06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� "�������� �������� ���������� ��� ���"'
             ,pCode      => '�06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� "�������� �������� �� ���"'
             ,pCode      => '�06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ ����� ���������'
           ,pCode      => '�06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �09.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ �� �������'
         ,pCode      => '�09.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �09.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ �� ����� �� ���/���'
         ,pCode      => '�09.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �12.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => '����� �������� ����������/������������� �� ��'
         ,pCode      => '�12.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� ��� �����'
           ,pCode      => '�12.10.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.10.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.10.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� �������������'
           ,pCode      => '�12.10.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������������ �������� �����������/ ������������� '
         ,pCode      => '�12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� ��� ������'
           ,pCode      => '�12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� �������������'
           ,pCode      => '�12.20.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �����������/�������������'
         ,pCode      => '�12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� ��� �����'
           ,pCode      => '�12.30.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.30.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.30.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� �������������'
           ,pCode      => '�12.30.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �01.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� ��������'
         ,pCode      => '�01.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �09.00.00.���
      vl_l1_ID := fdc_acc_add (
          pName      => '������� �� ���������'
         ,pCode      => '�09.00.00.���'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Z'
       ,pto_level_sign => '�',pkbk_sign => 'S'
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
      -- ����������� ������ �� (2 - ���������� �������)
      lcustom_level := fdc_valuenumber_sys_get(psysname => 'Common.CustomsLevel');
    if (lcustom_level = 0) then
      -- �������� ������ ������
      for rec_cur in (
                      select id
                      from fdc_acc_lst
                      where numbegdoc = vl_DocNumberBegin_old
                        and to_level_sign = '�'
                        and edate is NULL
                     )
      loop
        update fdc_nsi_dict set edate     = (vl_DateBegin - 1)
                               ,datenddoc = vl_DocDateBegin
                               ,numenddoc = vl_DocNumberBegin
        where id = rec_cur.id;
      end loop;
      -- ���������� �����
      -- �01.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�01.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'Y'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
          vl_l2_ID := fdc_acc_add (
              pName      => '����������� �� ���'
             ,pCode      => '�01.10.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '����� � ��� 100'
             ,pCode      => '�01.10.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '��������'
             ,pCode      => '�01.10.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l2_ID := fdc_acc_add (
              pName      => '����� � �����'
             ,pCode      => '�01.10.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'Y'
             ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
      -- �06.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �� �����'
         ,pCode      => '�06.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������� �������� �������'
           ,pCode      => '�06.10.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������������� �������� ��������'
           ,pCode      => '�06.20.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => ''
          );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������������� �� ��� � ���'
             ,pCode      => '�06.20.01'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������� �������� �� ��������� ��� � ���'
             ,pCode      => '�06.20.02'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� "�������� �������� ���������� ��� ��� ������"'
             ,pCode      => '�06.20.03'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '������� "�������� �������� ��"'
             ,pCode      => '�06.20.04'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
          vl_l3_ID := fdc_acc_add (
              pName      => '�������������������� �� ��� (���...4000)'
             ,pCode      => '�06.20.05'
             ,pSDate     => vl_DateBegin
             ,pDatBegDoc => vl_DocDateBegin
             ,pNumBegDoc => vl_DocNumberBegin
             ,pIsActive  => 'N'
             ,pParentAccID => vl_l2_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
            );
        vl_l2_ID := fdc_acc_add (
            pName      => '������ ����� ���/���'
           ,pCode      => '�06.30.00'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'S'
          );
      -- �09.00.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������ �� �������'
         ,pCode      => '�09.00.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
        );
      -- �12.10.00
      vl_l1_ID := fdc_acc_add (
          pName      => '����� �������� ����������/ ������������� �� ��'
         ,pCode      => '�12.10.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� ��� �����'
           ,pCode      => '�12.10.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.10.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.10.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '����� �������������'
           ,pCode      => '�12.10.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- �12.20.00
      vl_l1_ID := fdc_acc_add (
          pName      => '������������ �������� �����������/ �������������'
         ,pCode      => '�12.20.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� ��� ������'
           ,pCode      => '�12.20.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� �������� ���'
           ,pCode      => '�12.20.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.20.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '������������ ������� �������������'
           ,pCode      => '�12.20.04'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- �12.30.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �����������'
         ,pCode      => '�12.30.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => ''
        );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� ��� �����'
           ,pCode      => '�12.30.01'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� �������� ��� '
           ,pCode      => '�12.30.02'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
        vl_l2_ID := fdc_acc_add (
            pName      => '�������� �������� ����������� �� ��������� �������� ������'
           ,pCode      => '�12.30.03'
           ,pSDate     => vl_DateBegin
           ,pDatBegDoc => vl_DocDateBegin
           ,pNumBegDoc => vl_DocNumberBegin
           ,pIsActive  => 'N'
           ,pParentAccID => vl_l1_ID
         ,pto_level_sign => '�',pkbk_sign => 'T'
          );
      -- �12.40.00
      vl_l1_ID := fdc_acc_add (
          pName      => '�������� �������� �������������'
         ,pCode      => '�12.40.00'
         ,pSDate     => vl_DateBegin
         ,pDatBegDoc => vl_DocDateBegin
         ,pNumBegDoc => vl_DocNumberBegin
         ,pIsActive  => 'N'
       ,pto_level_sign => '�',pkbk_sign => 'S'
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
prompt ������ 00226 ... ��������� 
prompt 
prompt


prompt ��������� ������ ��... ���������.
prompt 