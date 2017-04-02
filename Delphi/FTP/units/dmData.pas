unit dmData;

interface

uses
  SysUtils, Classes, Controls, Oracle, DB, OracleData, uOptions,
  fdcOracleSession,uLoger;

type
  TDM = class(TDataModule)
    qDBF: TOracleQuery;
    qPO: TOracleQuery;
    Q: TOracleQuery;
    ds: TOracleDataSet;
    Session: TfdcOracleSession;
    qSes: TOracleQuery;
   private
    fErrMSG: string;
    fErrCode: integer;

    procedure LoadReq(aFileName: TFileName);
    function getPO_Report(): string;
    procedure setVars(const aCustomsCode, aINN, aKPP: string; const aDate1, aDate2:TDate);
    function getConnected: boolean;
    procedure clearErrCodeMsg;

   public
    function REQ_Ans(aREQ_File: TFileName):string;
    function Answer_AO(const aCustomCode, aINN, aKPP: string; const aDate1, aDate2: TDate ):TDataSet;
    function Answer_PU(const aCustomCode, aINN, aKPP: string; const aDate1, aDate2: TDate ):TDataSet;

    function openSession(aOptions: TOptions): boolean;
    procedure closeSession;

    property Connected: boolean read getConnected;
    property ErrMSG: string read fErrMSG;
    property ErrCode: integer read fErrCode;
  end;

var DM: TDM;

implementation

uses uCommon;
{$R *.dfm}

function getSQL_PU: string; forward;
function getSQL_AO: string; forward;

{ TDMOracle }

procedure TDM.closeSession;
const
 cLogNfo = 'Штатное отсоединение от базы данных:';
 cLogFatal='Аварийный разрыв соединения с базой данных.';
begin
 clearErrCodeMsg;
 try
  Session.LogOff;
 except
  fErrMsg:= cLogFatal;
 end;
end;

function TDM.openSession(aOptions: TOptions): boolean;
const
 cServerUser = ' Сервер: %S Имя пользователя: %S.';
 cLogNfo = 'Штатное соединение с базой данных:';
 cLogFatal='Нет соединения с базой данных.';
begin
 result:= false;
 clearErrCodeMsg;
 try
  if Session.Connected then
    Session.LogOff;
  Session.LogonDatabase:= aOptions.DB_Server;
  Session.LogonUsername:= aOptions.DB_User;
  Session.LogonPassword:= aOptions.DB_Password;
  Session.DefSchemeName:= aOptions.DB_Schema;

  Session.LogOn;

  result:= Connected;
  qSes.SQL.Clear;
  qSes.SQL.Text := 'alter session set current_schema = ' + aOptions.DB_Schema;
  qSes.Execute;

//  fErrMsg:= cLogNfo + Format(cServerUser, [Options.DB_Server, Options.DB_User]);
 except
  fErrMsg:= cLogFatal + Format(cServerUser, [Options.DB_Server, Options.DB_User]);
 end;
end;

function TDM.getPO_Report(): string;
begin
 qPO.Execute;
 result:= qPO.GetVariable('REPORT');
end;

procedure TDM.LoadReq(aFileName: TFileName);
var
 fs: TFileStream;
 lob: TLobLocator;
begin
  fs := TFileStream.Create(aFileName, fmOpenRead);
  lob := TLOBLocator.CreateTemporary( DM.Session, otBLOB, True );
  lob.CopyFrom(fs, fs.Size - fs.Position);
  lob.Trim;
  try
    qDBF.SetComplexVariable('BLOB_DATA', LOB);
    qDBF.SetVariable('Table_Name', Options.TableName);
    qDBF.SetVariable('Column_Map', Options.ColumnMap);
    qDBF.Execute;
  finally
    lob.Free;
    fs.Free;
  end;
end;

function TDM.REQ_Ans(aREQ_File: TFileName):string;
var l: integer;
begin
 try
  loadReq(aREQ_File);
  result:= getPO_Report;
  session.Commit;
 except
  on e: Exception do begin
   session.Rollback;
   result:= '';

// при дублировании получаем такое сообщение об ошибке:
(* 'ORA-20001: LDR-00016: <<Ошибка загрузки чеков по ТК>>:'#$A
 'ORA-20001: PAY-00067: <<Ошибка при создании чека по ТК>>:'#$A
 '<<Чек с таким идентификатором транзакции уже существует!'#$A
 'TK_ID = 000000000000000955917125>>'#$A
 'ORA-06512: на  "LSTYAR5.FDC_ERROR_HANDLER_PCK", line 774'#$A
 'ORA-06512: на  "LSTYAR5.P_DOCUMENT_LOADER", line 379'#$A
 'ORA-06512: на  line 2'#$A *)

(*'ORA-20001: LDR-00016: <<Ошибка загрузки чеков по ТК>>:'#$A
  'ORA-20306: <<Ошибка обработки платежных документов>>'#$A
  '<<В документе № 7386 ИНН плательщика 004511634245 не прошел проверку контрольного числа!>>'#$A
  'ORA-06512: на  "LSTYAR01.FDC_ERROR_HANDLER_PCK", line 774'#$A
  'ORA-06512: на  "LSTYAR01.P_DOCUMENT_LOADER", line 440 '#$A
  'ORA-06512: на  line 2'#$A *)

   fErrCode := cTKInvalid;
   fErrMSG:= stringReplace( e.Message, #$A, ' ', [rfReplaceAll, rfIgnoreCase]  );

   l:= pos( 'ORA-06512', fErrMSG ) - 1;
   if (l <= 0) then l:= length(fErrMSG);
   setLength( fErrMSG, l );

  end;{on e: Excepption..}
 end;{except..}
end;{function..}

procedure TDM.setVars(const aCustomsCode, aINN, aKPP: string; const aDate1, aDate2: TDate );
begin
 ds.ClearVariables;

   ds.SetVariable('CUSTOMSCODE', aCustomsCode);
// if (aINN <> '') then
   ds.SetVariable('INN', aINN);
// if (aKPP <> '' ) then
   ds.SetVariable('KPP', aKPP);
// if (aDate1 > 0) then
   ds.SetVariable('DATE1', aDate1 );
// if (aDate2 > 0) then
   ds.SetVariable('DATE2', aDate2 );
// end;
end;


function TDM.Answer_AO(const aCustomCode, aINN, aKPP: string; const aDate1, aDate2: TDate ):TDataSet;
var i:integer;
begin
 ds.SQL.Text:= getSQL_AO;
 try
  setVars(aCustomCode, aINN, aKPP, aDate1, aDate2 );

  ds.Open;
  if ds.IsEmpty then begin
   ds.Close;
   abort;
  end;
//  uLoger.Log('done ok');
  result:= ds;
 except  on e: Exception do begin
   uLoger.Log(e.Message,leError);
  result:= nil;
 end;
 end;

end;

function TDM.Answer_PU(const aCustomCode, aINN, aKPP: string; const aDate1, aDate2: TDate ):TDataSet;
begin
 ds.SQL.Text:= getSQL_PU;
 try
  setVars( aCustomCode, aINN, aKPP, aDate1, aDate2 );
  ds.Open;
  if ds.IsEmpty then begin
   ds.Close;
   abort;
  end;
  result:= ds;
  except  on e: Exception do begin
   uLoger.Log(e.Message,leError);
  result:= nil;
 end;
 end;
end;

function TDM.getConnected: boolean;
begin
 try
   clearErrCodeMsg;
   result := session.Connected;
 except
   result := false;
   fErrMsg:= 'Ошибка связи с базой данных';
 end;
end;

procedure TDM.clearErrCodeMsg;
begin
 fErrCode:= 0;
 fErrMSG:= '';
end;

function getSQL_PU: string;
begin
 result:=
 ' SELECT PP_NUMBER AS NUMDOC, '+
'        PP_DATE   AS DATE_DOC, '+
'        SUMMA,  '+
'        KBK, '+
'        DOCNUMBER AS PAYMENTNUM, '+
'        DC_DOC_DATE AS PAYMENTDAT, '+
'        BROKER AS NAME_AGENT '+
'   FROM ( '+
'         SELECT  DC.DOC_DATE AS DC_DOC_DATE, '+
'                 DC.DOC_NUMBER AS DC_DOC_NUMBER, '+
'                 DC.NAME AS DOCNUMBER, '+
'                 PD.KBKCODE AS KBK, '+
'                 SUM(PD.SUMMA) AS SUMMA, '+
'                 PO.DOC_NUMBER AS PP_NUMBER, '+
'                 PO.DOC_DATE AS PP_DATE, '+
'                 PO.ID,  '+
'                 CASE '+
'                   WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                        p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                   THEN '+
'                    PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || PO.PAYER_NAME '+
'                   ELSE '+
'                    NULL '+
'                 END AS BROKER '+
'           FROM FDC_PAYMENT_DEDUCTION_LST PD, '+
'                 FDC_OBLIGATION_DOC_LST    DC, '+
'                 FDC_PO_CREDIT_LST         PO '+
'          WHERE PD.DECL_ID = DC.ID '+
'            AND PD.PAYMENT_ID = PO.ID '+
'            AND po.destcustomscode = :CUSTOMSCODE '+
'            AND (DC.SUBJECT_ID = (SELECT S1.id '+
'                                    FROM fdc_subject S1 '+
'                                    WHERE S1.inn = :INN '+
'                                      AND S1.kpp = :KPP) '+
'                OR PO.PAYER_ID = (SELECT /*+ INDEX_JOIN(S2) */ S2.id '+
'                                    FROM fdc_subject S2 '+
'                                    WHERE S2.inn = :INN '+
'                                      AND S2.kpp = NVL(:KPP, UID))) '+
'            AND PD.ACTIVATION_DATE BETWEEN :DATE1 AND :DATE2 '+
'            AND (DC.TYPESYSNAME LIKE ''CustomDecl%'' OR DC.TYPESYSNAME = ''TPO'') '+
'            AND PD.SUMMA > 0 '+
'           GROUP BY DC.DOC_DATE, '+
'                   DC.DOC_NUMBER, '+
'                    DC.NAME, '+
'                    PD.KBKCODE, '+
'                    PO.DOC_NUMBER,  '+
'                    PO.DOC_DATE, '+
'                    PO.ID,  '+
'                    CASE '+
'                      WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                           p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                      THEN '+
'                       PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || '+
'                       PO.PAYER_NAME '+
'                      ELSE '+
'                       NULL '+
'                    END '+
'         UNION ALL '+
'         SELECT DC.DOC_DATE AS DC_DOC_DATE, '+
'                DC.DOC_NUMBER AS DC_DOC_NUMBER, '+
'                DC.NAME || '' (излишняя уплата)'' AS DOCNUMBER, '+
'                K.CODE AS KBK, '+
'                SUM(PD.SUMMA) AS SUMMA, '+
'                PO.DOC_NUMBER AS PP_NUMBER, '+
'                PO.DOC_DATE AS PP_DATE, '+
'                PO.ID,  '+
'                CASE '+
'                  WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                       p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                  THEN '+
'                   PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || PO.PAYER_NAME '+
'                  ELSE '+
'                   NULL '+
'                END AS BROKER '+
'           FROM FDC_ADVICE_DEDUCTION_LST PD, '+
'                FDC_OBLIGATION_DOC_LST   DC, '+
'                FDC_PO_CREDIT_LST        PO,  '+
'                FDC_DICT_LST             K '+
'          WHERE PD.DECL_ID = DC.ID '+
'            AND PD.PAYMENT_ID = PO.ID '+
'            AND PD.KBKCODE_ID = K.ID(+) '+
'            AND po.destcustomscode = :CUSTOMSCODE '+
'            AND (DC.SUBJECT_ID = (SELECT S1.id '+
'                                   FROM fdc_subject S1 '+
'                                   WHERE S1.inn = :INN     '+
'                                     AND S1.kpp = :KPP) '+
'                 OR PO.PAYER_ID = (SELECT /*+ INDEX_JOIN(S2) */ S2.id '+
'                                     FROM fdc_subject S2 '+
'                                     WHERE S2.inn = :INN      '+
'                                       AND S2.kpp = :KPP)) '+
'            AND PD.ADVICE_ACTIVATION_DATE BETWEEN :DATE1 AND :DATE2 '+
'            AND (DC.TYPESYSNAME LIKE ''CustomDecl%'' OR DC.TYPESYSNAME = ''TPO'') '+
'          GROUP BY DC.DOC_DATE, '+
'                   DC.DOC_NUMBER, '+
'                   DC.NAME || '' (излишняя уплата)'', '+
'                   K.CODE, '+
'                   PO.DOC_NUMBER,  '+
'                   PO.DOC_DATE, '+
'                   PO.ID,  '+
'                   CASE '+
'                     WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                          p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                     THEN '+
'                      PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || '+
'                      PO.PAYER_NAME '+
'                     ELSE '+
'                      NULL '+
'                   END '+
'         UNION ALL '+
'         SELECT DC.DOC_DATE AS DC_DOC_DATE, '+
'                DC.DOC_NUMBER AS DC_DOC_NUMBER, '+
'                DC.NAME || '' (излишняя уплата)'' AS DOCNUMBER, '+
'                K.CODE AS KBK, '+
'                SUM(PD.SUMMA) AS SUMMA, '+
'                PO.DOC_NUMBER AS PP_NUMBER, '+
'                PO.DOC_DATE AS PP_DATE, '+
'                PO.ID, '+
'                CASE '+
'                  WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                       p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                  THEN '+
'                   PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || PO.PAYER_NAME '+
'                  ELSE '+
'                   NULL '+
'                END AS BROKER '+
'           FROM FDC_PAYMENT_DEDUCTION_ALL_LST PD, '+
'                FDC_VALUE_LST V, '+
'                (SELECT OD.ID, '+
'                        OD.SUBJECT_ID, '+
'                        OD.DOC_DATE, '+
'                        OD.DOC_NUMBER, '+
'                        OD.NAME, '+
'                        A.ID AS REF_ID '+
'                   FROM FDC_OBLIGATION_DOC_LST OD, FDC_ANNULMENT_LST A '+
'                  WHERE OD.ID = A.DOCUMENT_ID '+
'                    AND OD.SUBJECT_ID = (SELECT s.id '+
'                                           FROM fdc_subject s '+
'                                           WHERE s.inn = :INN '+
'                                             AND s.kpp = :KPP) '+
'                    AND A.ACTIVATION_DATE BETWEEN :DATE1 AND :DATE2 '+
'                    AND (OD.TYPESYSNAME LIKE ''CustomDecl%'' OR OD.TYPESYSNAME = ''TPO'') '+
'                 UNION ALL '+
'                 SELECT OD.ID, '+
'                        OD.SUBJECT_ID, '+
'                        OD.DOC_DATE, '+
'                        OD.DOC_NUMBER, '+
'                        OD.NAME, '+
'                        A.ID AS REF_ID '+
'                   FROM FDC_OBLIGATION_DOC_LST         OD, '+
'                        FDC_CORRECTION_GTD_CCHARGE_LST A '+
'                  WHERE OD.ID = A.DOC_ID '+
'                    AND OD.SUBJECT_ID = (SELECT s.id '+
'                                           FROM fdc_subject s '+
'                                           WHERE s.inn = :INN '+
'                                             AND s.kpp = :KPP) '+
'                    AND A.ACTIVATION_DATE BETWEEN :DATE1 AND :DATE2 '+
'                    AND (OD.TYPESYSNAME LIKE ''CustomDecl%'' OR OD.TYPESYSNAME = ''TPO'') '+
'                 UNION ALL '+
'                 SELECT OD.ID, '+
'                        OD.SUBJECT_ID, '+
'                        OD.DOC_DATE, '+
'                        OD.DOC_NUMBER, '+
'                        OD.NAME, '+
'                        A.ID AS REF_ID '+
'                   FROM FDC_OBLIGATION_DOC_LST         OD,  '+
'                        FDC_CORRECTION_TPO_CCHARGE_LST A '+
'                  WHERE OD.ID = A.DOC_ID '+
'                    AND OD.SUBJECT_ID = (SELECT s.id '+
'                                           FROM fdc_subject s '+
'                                           WHERE s.inn = :INN '+
'                                            AND s.kpp = :KPP) '+
'                    AND A.ACTIVATION_DATE BETWEEN :DATE1 AND :DATE2 '+
'                    AND (OD.TYPESYSNAME LIKE ''CustomDecl%'' OR OD.TYPESYSNAME = ''TPO'')) DC, '+
'                FDC_PO_CREDIT_LST PO, '+
'                FDC_DICT_LST K '+
'          WHERE V.OWNER_OBJECT_ID = DC.REF_ID '+
'            AND V.REF_OBJECT_ID = PD.ID '+
'            AND PD.DECL_ID = DC.ID '+
'            AND PD.PAYMENT_ID = PO.ID '+
'            AND PD.KBKCODE_ID = K.ID(+) '+
'            AND po.destcustomscode = :CUSTOMSCODE '+
'          GROUP BY DC.DOC_DATE, '+
'                   DC.DOC_NUMBER, '+
'                   DC.NAME || '' (излишняя уплата)'', '+
'                   K.CODE, '+
'                   PO.DOC_NUMBER,  '+
'                   PO.DOC_DATE, '+
'                   PO.ID, '+
'                   CASE '+
'                     WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> '+
'                          p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) '+
'                     THEN '+
'                      PO.PAYER_INN || ''/'' || PO.PAYER_KPP || ''  '' || '+
'                     PO.PAYER_NAME '+
'                    ELSE '+
'                     NULL '+
'                  END) '+
'  ORDER BY PP_DATE, PP_NUMBER, DC_DOC_DATE, DC_DOC_NUMBER, KBK ';
end;


function getSQL_AO: string;
begin
 result:=

'with ss as ( '+
'select s1.id from '+
'        fdc_subject_lst s1 '+
'       where s1.INN = :INN  '+
'       and (s1.KPP = :KPP or :KPP = ''000000000'') ' +
'       ), '+
' cc as '+
'(select :CUSTOMSCODE scode from dual), '+
'po AS ( '+
' SELECT p.id  '+
'        ,p.doc_number AS po_doc_no '+
'        ,p.doc_date   AS po_doc_date  '+
'        ,CASE '+
'           WHEN p.income_date BETWEEN :DATE1 AND :DATE2 THEN p.summa '+
'           ELSE                                              0 '+
'         END '+
'         + p_po_reuse.GetIncomeSumma( p.id, :DATE1, :DATE2 ) '+
'                      AS po_summa '+
'        ,p_payment_order.getreusesumma( p.id, :DATE1, :DATE2 ) '+
'                      AS po_reuse '+
'    FROM fdc_po_credit_lst p '+
'   WHERE p.payer_id IN ( SELECT ss.id FROM ss ) '+
'      AND (   p.income_date BETWEEN :DATE1 AND :DATE2 '+
'           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd WHERE pd.payment_id = p.id AND pd.is_active = ''Y'' AND pd.activation_date BETWEEN :DATE1 AND :DATE2 ) '+
'           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_doc_reuse_customs_lst r WHERE pd.payment_id = p.id AND pd.decl_id = r.id AND r.is_active = ''Y'' AND r.activation_date BETWEEN :DATE1 AND :DATE2 ) '+
'           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_po_payback_lst pb WHERE pd.payment_id = p.id AND pd.decl_id = pb.dec_pay_id AND pb.exec_date BETWEEN :DATE1 AND :DATE2 '+
'               AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = ''State.PayBack.Confirm'' ) ) '+
'           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_tr_lst tr WHERE pd.payment_id = p.id AND pd.decl_id = tr.id AND tr.activation_date BETWEEN :DATE1 AND :DATE2 ) '+
'           OR EXISTS ( SELECT 0 '+
'                        FROM fdc_annulment_lst a '+
'                            ,fdc_tr_lst tr '+
'                            ,fdc_payment_deduction_lst pd '+
'                        WHERE pd.payment_id = p.id '+
'                              AND tr.id = a.document_id '+
'                              AND pd.decl_id = tr.id '+
'                              AND trunc ( pd.payment_date ) = a.doc_date '+
'                              AND pd.summa < 0 '+
'                              AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = ''PaymentDeduction.Correct'' ) '+
'                              AND a.doc_date between NVL ( :DATE1, a.doc_date ) and NVL ( :DATE2, a.doc_date ) '+
'                          ) '+
'         OR EXISTS ( SELECT 0 '+
'                       FROM fdc_annulment_lst a '+
'                           ,fdc_tpo_lst tpo '+
'                           ,fdc_payment_deduction_lst pd '+
'                      WHERE pd.payment_id = p.id '+
'                            AND tpo.id = a.document_id '+
'                            AND pd.decl_id = tpo.id '+
'                            AND trunc ( pd.payment_date ) = a.doc_date '+
'                            AND pd.summa < 0 '+
'                            AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = ''PaymentDeduction.Correct'' ) '+
'                            AND a.doc_date between NVL ( :DATE1, a.doc_date ) and NVL ( :DATE2 , a.doc_date ) '+
'                        ) '+
'          ) '+
'), '+
'pd AS ( '+
'SELECT  ipd.id '+
'         ,ipd.payment_id '+
'         ,ipd.decl_id '+
'         ,ipd.pay_type_id '+
'         ,ipd.summa '+
'         ,ipd.TypeSysName '+
'         ,CASE '+
'         WHEN d.TypeSysName = ''TPO''                     THEN ''ТПО '' '+
'         WHEN d.TypeSysName = ''TR''                      THEN ''ТР ''  '+
'         WHEN d.TypeSysName = ''SubjectFeeFine''          THEN ''Штраф '' '+
'         WHEN d.TypeSysName = ''SubjectFeeDebt''          THEN ''Долг '' '+
'         WHEN d.TypeSysName IN (''DecPaybackAdvance'',''DecPaybackDeposit'',''DecPaybackLevy'',''DecPaybackPay'',''DecPaybackPeriodic'',''DecPaybackTimeOut'',''DecPayback356'' ) '+
' THEN ( SELECT ''Возврат по заявлению '' || dpi.app_number || '' от '' || to_date( dpi.app_date, ''dd.mm.yyyy'' ) || '' '' FROM fdc_decision_payback_lst dpi WHERE dpi.id = d.id ) '+
'         WHEN d.TypeSysName IN (''CustomDecl'',''CustomDeclFull'',''CustomDeclTempAdm'',''CustomDeclTime'' ) THEN ''ДТ '' '+
'         ELSE NULL '+
'         END '+
'           ||d.name||( SELECT ''(требование '' || m.doc_number || '' от '' || TO_CHAR( m.doc_date, ''dd.mm.yyyy'' ) ||'')'' '+
'                         FROM fdc_debts_measures_lst m  '+
'                        WHERE m.ID = ( SELECT MIN( m1.id ) '+
'                                        FROM fdc_debts_measures_lst m1 '+
'                                            ,fdc_ded_paydept_lst dpd  '+
'                                        WHERE dpd.id = ipd.id  '+
'                                              AND m.owner_object_id = dpd.notice_id  '+
'                                              AND m.measures_type IN (''B20'',''B27'') ) ) '+
'           AS decl_name '+
'          FROM fdc_payment_deduction_lst ipd '+
'              ,fdc_object_lst d '+
'          WHERE ipd.payment_id IN ( SELECT po.id FROM po ) '+
'            AND ipd.is_active IN (''N'',''Y'')  '+
'            AND ipd.summa > 0  '+
'            AND (   ipd.activation_date BETWEEN :DATE1 AND :DATE2 '+
'                 OR EXISTS ( SELECT 0 FROM fdc_doc_reuse_customs_lst r WHERE ipd.decl_id = r.id AND r.is_active = ''Y'' AND r.activation_date BETWEEN :DATE1 AND :DATE2 ) '+
'                 OR EXISTS ( SELECT 0 FROM fdc_po_payback_lst pb WHERE ipd.decl_id = pb.dec_pay_id AND pb.exec_date BETWEEN :DATE1 AND :DATE2 '+
'                    AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = ''State.PayBack.Confirm'' ) ) '+
'                 OR EXISTS ( SELECT 0 FROM fdc_tr_lst tr WHERE ipd.decl_id = tr.id AND tr.activation_date BETWEEN :DATE1 AND :DATE2 )  '+
'                ) '+
'            AND d.id(+) = ipd.decl_id '+
') '+
'SELECT /*+FIRST_ROWS(50)*/ '+
'       /*pp,*/ '+
'       CASE group_pp '+
'         WHEN 1 THEN po_doc_no '+
'         ELSE        to_char( NULL ) '+
'       END AS NUMDOC  '+
'      ,CASE group_pp '+
'         WHEN 1 THEN po_doc_date '+
'         ELSE        to_date( NULL ) '+
'       END AS DATE_DOC '+
'      ,CASE group_pp '+
'         WHEN 1 THEN po_summa '+
'         ELSE        to_number( NULL ) '+
'       END AS SUMMA_AR '+
'      ,CASE group_pp '+
'         WHEN 1 THEN po_reuse '+
'         ELSE        to_number( NULL ) '+
'       END AS SUMMA_RE '+
'      ,NAME as PAYMENTNUM '+
'      ,payment_type as PAYMENTID '+
'      ,summa as PAYMENTSUM '+
'  FROM (  '+
'SELECT row_number() over ( ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name ) AS pp '+
'      ,row_number() over ( PARTITION BY po.id,po.po_doc_no, po.po_doc_date ORDER BY ( pd.decl_name ) ) AS group_pp '+
'      ,po.id '+
'      ,po.po_doc_no '+
'      ,po.po_doc_date '+
'      ,po.po_summa '+
'      ,po.po_reuse '+
'      ,pd.decl_name AS NAME '+
'      ,pt.code AS payment_type '+
'      ,SUM( pd.summa ) AS summa '+
'  FROM po '+
'      ,pd '+
'      ,fdc_dict                  pt  '+
'  WHERE po.id        = pd.payment_id(+) '+
'    AND pt.id(+)     = pd.pay_type_id '+
'    and (select scode from cc) <> ''1'' ' +
'  GROUP BY po.id '+
'          ,po.po_doc_no '+
'          ,po.po_doc_date '+
'          ,po.po_summa '+
'          ,po.po_reuse '+
'          ,pd.decl_name '+
'          ,pt.code '+
'  ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name  '+
' )  ';

end;

(* *** Старая версия до релиза 29.07.2016 *******************
function getSQL_AO: string;
begin
 result:=
'  with ss as (select s.id ' +
'                FROM fdc_subject s ' +
'                WHERE s.inn = :INN ' +
'                  AND s.kpp = :KPP), ' +
'  po AS ( ' +
'  SELECT p.id ' +
'         ,p.doc_number AS po_doc_no ' +
'         ,p.doc_date   AS po_doc_date   ' +
'         ,CASE WHEN p.income_date BETWEEN :DATE1 AND :DATE2 THEN p.summa ELSE 0 END ' +
'           + p_po_reuse.GetIncomeSumma( p.id, :DATE1, :DATE2 ) AS po_summa ' +
'         ,p_payment_order.getreusesumma( p.id, :DATE1, :DATE2 ) AS po_reuse ' +
'     FROM fdc_po_credit_lst p ' +
'    WHERE p.payer_id IN ( SELECT ss.id FROM ss ) ' +
//'       AND p.destcustomscode = :CUSTOMSCODE ' +
'       AND (   p.income_date BETWEEN :DATE1 AND :DATE2 ' +
'            OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd WHERE pd.payment_id = p.id AND pd.is_active = ''Y'' ' +
'                 AND pd.activation_date BETWEEN :DATE1 AND :DATE2 ) ' +
'            OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_doc_reuse_customs_lst r WHERE pd.payment_id = p.id ' +
'                 AND pd.decl_id = r.id AND r.is_active = ''Y'' AND r.activation_date BETWEEN :DATE1 AND :DATE2 ) ' +
'            OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_po_payback_lst pb WHERE pd.payment_id = p.id AND pd.decl_id = pb.dec_pay_id ' +
'                 AND pb.exec_date BETWEEN :DATE1 AND :DATE2 ' +
'                 AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = ''State.PayBack.Confirm'' ) ) ' +
'            OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_tr_lst tr WHERE pd.payment_id = p.id ' +
'                 AND pd.decl_id = tr.id AND tr.activation_date BETWEEN :DATE1 AND :DATE2 ) ' +
'            OR EXISTS ( SELECT 0 ' +
'                         FROM fdc_annulment_lst a ' +
'                             ,fdc_tr_lst tr ' +
'                             ,fdc_payment_deduction_lst pd ' +
'                         WHERE pd.payment_id = p.id ' +
'                               AND tr.id = a.document_id ' +
'                               AND pd.decl_id = tr.id ' +
'                               AND trunc ( pd.payment_date ) = a.doc_date ' +
'                               AND pd.summa < 0 ' +
'                               AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = ''PaymentDeduction.Correct'' ) ' +
'                               AND a.doc_date between NVL ( :DATE1, a.doc_date ) and NVL ( :DATE2, a.doc_date ) ) ' +
'           OR EXISTS ( SELECT 0 ' +
'                        FROM fdc_annulment_lst a ' +
'                            ,fdc_tpo_lst tpo ' +
'                            ,fdc_payment_deduction_lst pd ' +
'                       WHERE pd.payment_id = p.id ' +
'                             AND tpo.id = a.document_id ' +
'                             AND pd.decl_id = tpo.id ' +
'                             AND trunc ( pd.payment_date ) = a.doc_date ' +
'                             AND pd.summa < 0 ' +
'                             AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = ''PaymentDeduction.Correct'' ) ' +
'                             AND a.doc_date between NVL ( :DATE1, a.doc_date ) and NVL ( :DATE2 , a.doc_date ) ' +
'                         ) ' +
'           ) ' +
'  ), ' +
'  pd AS ( ' +
'  SELECT  ipd.id ' +
'          ,ipd.payment_id ' +
'          ,ipd.decl_id ' +
'          ,ipd.pay_type_id ' +
'          ,ipd.summa ' +
'          ,ipd.TypeSysName ' +
'          ,CASE ' +
'          WHEN d.TypeSysName = ''TPO''            THEN ''ТПО '' ' +
'          WHEN d.TypeSysName = ''TR''             THEN ''ТР'' ' +
'          WHEN d.TypeSysName = ''SubjectFeeFine'' THEN ''Штраф''  ' +
'          WHEN d.TypeSysName = ''SubjectFeeDebt'' THEN ''Долг'' ' +
'          WHEN d.TypeSysName IN (''DecPaybackAdvance'',''DecPaybackDeposit'',''DecPaybackLevy'',''DecPaybackPay'',''DecPaybackPeriodic'',''DecPaybackTimeOut'',''DecPayback356'' ) ' +
'              THEN ( SELECT ''Возврат по заявлению '' || dpi.app_number || '' от '' || to_date( dpi.app_date, ''dd.mm.yyyy'' ) || '' '' FROM fdc_decision_payback_lst dpi WHERE dpi.id = d.id ) ' +
'          WHEN d.TypeSysName IN (''CustomDecl'',''CustomDeclFull'',''CustomDeclTempAdm'',''CustomDeclTime'' ) THEN ''ДТ '' ' +
'          ELSE NULL ' +
'          END ' +
'            ||d.name||( SELECT ''(трeбование '' || m.doc_number || '' от '' || TO_CHAR( m.doc_date, ''dd.mm.yyyy'' ) ||'')'' ' +
'                          FROM fdc_debts_measures_lst m ' +
'                         WHERE m.ID = ( SELECT MIN( m1.id ) ' +
'                                          FROM fdc_debts_measures_lst m1 ' +
'                                              ,fdc_ded_paydept_lst dpd ' +
'                                         WHERE dpd.id = ipd.id ' +
'                                               AND m.owner_object_id = dpd.notice_id ' +
'                                               AND m.measures_type IN (''B20'',''B27'') ) ) ' +
'            AS decl_name ' +
'           FROM fdc_payment_deduction_lst ipd ' +
'               ,fdc_object_lst d ' +
'           WHERE ipd.payment_id IN (SELECT pc.id ' +
'                                      FROM fdc_po_credit_lst pc ' +
'                                      WHERE pc.id IN ( SELECT po.id FROM po ) ' +
'                                    ) ' +
'             AND ipd.is_active IN (''N'',''Y'') ' +
'             AND ipd.summa > 0 ' +
'             AND (   ipd.activation_date BETWEEN :DATE1 AND :DATE2 ' +
'                  OR EXISTS ( SELECT 0 FROM fdc_doc_reuse_customs_lst r WHERE ipd.decl_id = r.id AND r.is_active = ''Y'' ' +
'                     AND r.activation_date BETWEEN :DATE1 AND :DATE2 ) ' +
'                  OR EXISTS ( SELECT 0 FROM fdc_po_payback_lst pb WHERE ipd.decl_id = pb.dec_pay_id ' +
'                     AND pb.exec_date BETWEEN :DATE1 AND :DATE2 ' +
'                     AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = ''State.PayBack.Confirm'' ) ) ' +
'                  OR EXISTS ( SELECT 0 FROM fdc_tr_lst tr WHERE ipd.decl_id = tr.id ' +
'                     AND tr.activation_date BETWEEN :DATE1 AND :DATE2 ) ' +
'                 ) ' +
'             AND d.id(+) = ipd.decl_id ' +
'  ) ' +
'  SELECT /*+FIRST_ROWS(50)*/ ' +
'        CASE group_pp ' +
'          WHEN 1 THEN po_doc_no ' +
'          ELSE        to_char( NULL ) ' +
'        END AS NUMDOC ' +
'       ,CASE group_pp ' +
'          WHEN 1 THEN po_doc_date ' +
'          ELSE        to_date( NULL ) ' +
'        END AS DATE_DOC ' +
'       ,CASE group_pp ' +
'          WHEN 1 THEN po_summa ' +
'          ELSE        to_number( NULL ) ' +
'        END AS SUMMA_AR ' +
'       ,CASE group_pp ' +
'          WHEN 1 THEN po_reuse ' +
'          ELSE        to_number( NULL ) ' +
'        END AS SUMMA_RE ' +
'       ,NAME AS PAYMENTNUM  ' +
'       ,payment_type AS PAYMENTID ' +
'       ,summa AS PAYMENTSUM ' +
'   FROM ( ' +
'  SELECT row_number() over ( ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name ) AS pp ' +
'       ,row_number() over ( PARTITION BY po.id,po.po_doc_no, po.po_doc_date ORDER BY ( pd.decl_name ) ) AS group_pp ' +
'       ,po.id ' +
'       ,po.po_doc_no ' +
'       ,po.po_doc_date ' +
'       ,po.po_summa ' +
'       ,po.po_reuse ' +
'       ,pd.decl_name AS NAME ' +
'       ,pt.code AS payment_type  ' +
'       ,SUM( pd.summa ) AS summa ' +
'   FROM po ' +
'       ,pd ' +
'       ,fdc_dict                  pt ' +
'   WHERE po.id        = pd.payment_id(+) ' +
'     AND pt.id(+)     = pd.pay_type_id ' +
'   GROUP BY po.id ' +
'           ,po.po_doc_no ' +
'           ,po.po_doc_date ' +
'           ,po.po_summa ' +
'           ,po.po_reuse ' +
'           ,pd.decl_name ' +
'           ,pt.code ' +
'   ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name  ) ';
end;
**********************************************************************)

(* ********* OLD *********************
function getSQL_PU: string;
begin
 result:=
 ' SELECT DISTINCT '+
    ' pc.DestCustomsCode AS CUSTOMCODE, po.val_doc_date AS DATE_PERIOD, ' +
    ' pc.DOC_NUMBER AS NUMDOC, pc.DOC_SUMMA AS SUMMA, pc.KBK, ' +
    ' po.val_doc_number AS PAYMENTNUM, po.val_doc_date AS PAYMENTDAT, s.Full_Name AS NAME_AGENT ' +
 ' FROM ' +
    ' fdc_po_cheque_lst pc join  fdc_payment_order_Lst po on po.ID = pc.id ' +
    ' join fdc_subject_lst s  on pc.PAYER_ID = s.id ' +
 ' WHERE  '+
 '   (:CUSTOMCODE is null or :CUSTOMCODE = pc.DestCustomsCode) ' +
 '   and (:INN is null or  :INN = pc.INN_p)  ' +
 '   and (:KPP is null or  :KPP = pc.KPP_p)  ' +
 '   and (:Date1 is null or  :Date1 <= po.val_doc_date)  ' +
 '   and (:Date2 is null or  :Date2 >= po.val_doc_date)  ';
end;

function getSQL_AO: string;
// !!! формат  aDate1, aDate2 Д.Б.  DD.MM.YYYY !!!
begin
 result:=
 ' SELECT DISTINCT ' +
 '   pc.DestCustomsCode AS CUSTOMCODE, po.val_doc_date AS DATE_PERIOD, pc.DOC_NUMBER AS NUMDOC, pc.DOC_DATE AS DATE_DOC, '+
 '   pc.DOC_SUMMA AS SUMMA_AR, nvl(pc.SUMMA, 0 )  AS SUMMA_RE, ' +
 '   po.val_doc_number AS PAYMENTNUM, po.val_payment_type AS PAYMENTID, pc.KPP_P ' +
 ' FROM '+
 '   fdc_po_cheque_lst pc join fdc_payment_order_Lst po  on po.id = pc.id ' +
 ' WHERE '+
 '   (:CUSTOMCODE is null or :CUSTOMCODE = pc.DestCustomsCode) ' +
 '   and (:INN is null or  :INN = pc.INN_p)  ' +
 '   and (:KPP is null or  :KPP = pc.KPP_p)  ' +
 '   and (:Date1 is null or  :Date1 <= po.val_doc_date)  ' +
 '   and (:Date2 is null or  :Date2 >= po.val_doc_date)  ';
end;

*****************************************************)

end.


