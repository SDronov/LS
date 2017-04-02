create database link B4
  connect to EFZ_MAIN2015 identified by EFZ_MAIN2015
  using '(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 10.22.96.201)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SID = DBNSI)
    )
  )';
prompt
prompt Creating view V_ASBC_B4_DECLOPERS
prompt =================================
prompt
create or replace force view v_asbc_b4_declopers as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.nd
        ,d.g072 operdate
 from decl@B4 d
union all
select /*DRIVING_SITE(g) NO_MERGE*/
         g.nd
        ,g.g542 operdate
 from ktdhead@b4 g;
comment on table V_ASBC_B4_DECLOPERS is 'Таблица V_ASBC_B4_DECLOPERS';
comment on column V_ASBC_B4_DECLOPERS.ND is 'ND';
comment on column V_ASBC_B4_DECLOPERS.OPERDATE is 'OPERDATE';

prompt
prompt Creating view V_ASBC_B4_DETAILS_PLTGS
prompt =====================================
prompt
create or replace force view v_asbc_b4_details_pltgs as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.tpo_number
        ,d.dat_tpo
        , d.code
        ,g.inn
        ,g.kpp
        ,g.name
        ,i.vidnac
        ,i.num_doc
        ,i.date_doc
        ,i.summa
        ,i.sum_tpo
 from tpos@B4 d
     ,clients@B4 g
     ,details_pltgs@B4 i
 where d.client = g.idpayer
   and d.tpo_number = i.tpo_number;
comment on table V_ASBC_B4_DETAILS_PLTGS is 'Таблица V_ASBC_B4_DETAILS_PLTGS';
comment on column V_ASBC_B4_DETAILS_PLTGS.TPO_NUMBER is 'TPO_NUMBER';
comment on column V_ASBC_B4_DETAILS_PLTGS.DAT_TPO is 'DAT_TPO';
comment on column V_ASBC_B4_DETAILS_PLTGS.CODE is 'CODE';
comment on column V_ASBC_B4_DETAILS_PLTGS.INN is 'INN';
comment on column V_ASBC_B4_DETAILS_PLTGS.KPP is 'KPP';
comment on column V_ASBC_B4_DETAILS_PLTGS.NAME is 'NAME';
comment on column V_ASBC_B4_DETAILS_PLTGS.VIDNAC is 'VIDNAC';
comment on column V_ASBC_B4_DETAILS_PLTGS.NUM_DOC is 'NUM_DOC';
comment on column V_ASBC_B4_DETAILS_PLTGS.DATE_DOC is 'DATE_DOC';
comment on column V_ASBC_B4_DETAILS_PLTGS.SUMMA is 'SUMMA';
comment on column V_ASBC_B4_DETAILS_PLTGS.SUM_TPO is 'SUM_TPO';

prompt
prompt Creating view V_ASBC_B4_G47
prompt ===========================
prompt
create or replace force view v_asbc_b4_g47 as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.nd
        ,d.g071
        ,d.g072
        ,d.g141
        ,d.g147
        ,d.g142
        ,g.g471
        ,g.g474rub
 from decl@B4 d
     ,g47@b4 g
 where d.nd = g.nd;
comment on table V_ASBC_B4_G47 is 'Таблица V_ASBC_B4_G47';
comment on column V_ASBC_B4_G47.ND is 'ND';
comment on column V_ASBC_B4_G47.G071 is 'G071';
comment on column V_ASBC_B4_G47.G072 is 'G072';
comment on column V_ASBC_B4_G47.G141 is 'G141';
comment on column V_ASBC_B4_G47.G147 is 'G147';
comment on column V_ASBC_B4_G47.G142 is 'G142';
comment on column V_ASBC_B4_G47.G471 is 'G471';
comment on column V_ASBC_B4_G47.G474RUB is 'G474RUB';

prompt
prompt Creating view V_ASBC_B4_SUMPP
prompt =============================
prompt
create or replace force view v_asbc_b4_sumpp as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.nd
        ,d.g071
        ,d.g072
        ,d.g141
        ,d.g147
        ,d.g142
        ,g.gb1
        ,g.numpdok
        ,g.datpdok
        ,g.sum_all
        ,g.sumpdok
 from decl@B4 d
     ,dclsumpp@B4 g
 where d.nd = g.nd;
comment on table V_ASBC_B4_SUMPP is 'Таблица V_ASBC_B4_SUMPP';
comment on column V_ASBC_B4_SUMPP.ND is 'ND';
comment on column V_ASBC_B4_SUMPP.G071 is 'G071';
comment on column V_ASBC_B4_SUMPP.G072 is 'G072';
comment on column V_ASBC_B4_SUMPP.G141 is 'G141';
comment on column V_ASBC_B4_SUMPP.G147 is 'G147';
comment on column V_ASBC_B4_SUMPP.G142 is 'G142';
comment on column V_ASBC_B4_SUMPP.GB1 is 'GB1';
comment on column V_ASBC_B4_SUMPP.NUMPDOK is 'NUMPDOK';
comment on column V_ASBC_B4_SUMPP.DATPDOK is 'DATPDOK';
comment on column V_ASBC_B4_SUMPP.SUM_ALL is 'SUM_ALL';
comment on column V_ASBC_B4_SUMPP.SUMPDOK is 'SUMPDOK';

prompt
prompt Creating view V_ASBC_B4_TPOOPERS
prompt ================================
prompt
create or replace force view v_asbc_b4_tpoopers as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.tpo_number
        ,d.dat_tpo operdate
 from tpos@B4 d
union all
select /*DRIVING_SITE(g) NO_MERGE*/
         g.tpo_number
        ,g.dat_corr_tpo operdate
 from corr_tpos@b4 g;
comment on table V_ASBC_B4_TPOOPERS is 'Таблица V_ASBC_B4_TPOOPERS';
comment on column V_ASBC_B4_TPOOPERS.TPO_NUMBER is 'TPO_NUMBER';
comment on column V_ASBC_B4_TPOOPERS.OPERDATE is 'OPERDATE';

prompt
prompt Creating view V_ASBC_B4_TPO_ITPS
prompt ================================
prompt
create or replace force view v_asbc_b4_tpo_itps as
select /*DRIVING_SITE(d) NO_MERGE*/
         d.tpo_number
        ,d.dat_tpo
        ,d.code
        ,g.inn
        ,g.kpp
        ,g.name
        ,i.codclsf
        ,i.sum_rub
 from tpos@B4 d
     ,clients@B4 g
     ,tpo_itps@B4 i
 where d.client = g.idpayer
   and d.tpo_number = i.tpo_number;
comment on table V_ASBC_B4_TPO_ITPS is 'Таблица V_ASBC_B4_TPO_ITPS';
comment on column V_ASBC_B4_TPO_ITPS.TPO_NUMBER is 'TPO_NUMBER';
comment on column V_ASBC_B4_TPO_ITPS.DAT_TPO is 'DAT_TPO';
comment on column V_ASBC_B4_TPO_ITPS.CODE is 'CODE';
comment on column V_ASBC_B4_TPO_ITPS.INN is 'INN';
comment on column V_ASBC_B4_TPO_ITPS.KPP is 'KPP';
comment on column V_ASBC_B4_TPO_ITPS.NAME is 'NAME';
comment on column V_ASBC_B4_TPO_ITPS.CODCLSF is 'CODCLSF';
comment on column V_ASBC_B4_TPO_ITPS.SUM_RUB is 'SUM_RUB';
