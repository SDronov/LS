-- регистрация всех системных компонент
begin
   dbms_output.disable;
   RegisterComponentAll ;
   
   -- Регистрация таблиц, которые не являются классами VERO
   RegisterComponent ( 'FDC_ACC' );
   RegisterComponent ( 'FDC_INITIAL_REST' );
   RegisterComponent ( 'FDC_ACC_BALANCE' );
   RegisterComponent ( 'FDC_ACC_BALANCE_KBK' );
   RegisterComponent ( 'FDC_ACC_BALANCE_SUBJECT' );
   RegisterComponent ( 'FDC_ACC_REG' );
   RegisterComponent ( 'FDC_ACC_REG_KBK' );
   RegisterComponent ( 'FDC_ACC_REG_SUBJECT' );
   RegisterComponent ( 'fdc_acc_transaction' );
   RegisterComponent ( 'fdc_payment_order' );
   RegisterComponent ( 'fdc_initial_rest' );
   RegisterComponent ( 'fdc_object' );
   RegisterComponent ( 'fdc_debts_curr_state' );
   RegisterComponent ( 'fdc_debts_action' );
   dbms_output.enable;
end;
/

begin

------------------------------
-- InsertUserGroup
------------------------------
-- Администратор данных
InsertUserGroup( 'Администратор данных',                                                  'AdminData');
-- Администратор прав пользователей
InsertUserGroup( 'Администратор прав пользователей',                                      'AdminTask');
-- Настройка 
InsertUserGroup( 'Настройка - Банки, кассы банков - просмотр',                            'GRP_CONFIG_BANKCASHDESK_LST');
InsertUserGroup( 'Настройка - Банки, кассы банков - ведение',                             'GRP_CONFIG_BANKCASHDESK_UPD');
InsertUserGroup( 'Настройка - просмотр',                                                  'GRP_CONFIG_LST');
InsertUserGroup( 'Настройка - Параметры - просмотр',                                      'GRP_CONFIG_PARAM_LST');
InsertUserGroup( 'Настройка - ведение',                                                   'GRP_CONFIG_UPD');
-- Подключение к БД
InsertUserGroup( 'Подключение к БД',                                                      'GRP_CONNECT_DB');
-- Контроль 
InsertUserGroup( 'Контроль - Задолженность - просмотр',                                   'GRP_CONTROL_DEBT_LST');
InsertUserGroup( 'Контроль - Задолженность - ведение',                                    'GRP_CONTROL_DEBT_UPD');
InsertUserGroup( 'Контроль - Временный ввоз - просмотр',                                  'GRP_CONTROL_DECLTEMP_LST');
InsertUserGroup( 'Контроль - Временный ввоз - ведение',                                   'GRP_CONTROL_DECLTEMP_UPD');
InsertUserGroup( 'Контроль - просмотр',                                                   'GRP_CONTROL_LST');
InsertUserGroup( 'Контроль - Рассрочка - просмотр',                                       'GRP_CONTROL_REPAY_LST');
InsertUserGroup( 'Контроль - Рассрочка - ведение',                                        'GRP_CONTROL_REPAY_UPD');
InsertUserGroup( 'Контроль - ведение',                                                    'GRP_CONTROL_UPD');
-- Задолженность
InsertUserGroup( 'Задолженность',                                                         'GRP_DEBT');
-- Реестры 
InsertUserGroup( 'Реестры - Платежи в бюджет - просмотр',                                 'GRP_DOCPACK_BUDGETPAYMENT_LST');
InsertUserGroup( 'Реестры - Платежи в бюджет - ведение',                                  'GRP_DOCPACK_BUDGETPAYMENT_UPD');
InsertUserGroup( 'Реестры - просмотр',                                                    'GRP_DOCPACK_LST');
InsertUserGroup( 'Реестры - Выписки из казначейства - просмотр',                          'GRP_DOCPACK_PAYMENTS_LST');
InsertUserGroup( 'Реестры - Выписка - просмотр',                                          'GRP_DOCPACK_REGPAYMENTS_LST');
InsertUserGroup( 'Реестры - Возвраты - просмотр',                                         'GRP_DOCPACK_RETURNS_LST');
InsertUserGroup( 'Реестры - Возвраты - ведение',                                          'GRP_DOCPACK_RETURNS_UPD');
InsertUserGroup( 'Реестры - Подтвержденные возвраты - просмотр',                          'GRP_DOCPACK_RETURNSY_LST');
InsertUserGroup( 'Реестры - Подтвержденные возвраты - ведение',                           'GRP_DOCPACK_RETURNSY_UPD');
InsertUserGroup( 'Реестры - Перезачеты - просмотр',                                       'GRP_DOCPACK_REUSE_LST');
InsertUserGroup( 'Реестры - Перезачеты - ведение',                                        'GRP_DOCPACK_REUSE_UPD');
InsertUserGroup( 'Реестры - Подтвержденные перезачеты - просмотр',                        'GRP_DOCPACK_REUSEY_LST');
InsertUserGroup( 'Реестры - Подтвержденные перезачеты - ведение',                         'GRP_DOCPACK_REUSEY_UPD');
InsertUserGroup( 'Реестры - ведение',                                                     'GRP_DOCPACK_UPD');
-- Документы 
InsertUserGroup( 'Документы - Уведомления - просмотр',                                    'GRP_DOCUMENT_ADVICE_LST');
InsertUserGroup( 'Документы - Уведомления - ведение',                                     'GRP_DOCUMENT_ADVICE_UPD');
InsertUserGroup( 'Документы - перезачет на таможню - просмотр',                           'GRP_DOCUMENT_CUSTOM_REUSE_LST');
InsertUserGroup( 'Документы - перезачет на таможню - ведение',                            'GRP_DOCUMENT_CUSTOM_REUSE_UPD');
InsertUserGroup( 'Документы - Решения о зачете в счет погашения задолженности - просмотр','GRP_DOCUMENT_DEC_DEBTS_LST');
InsertUserGroup( 'Документы - Решения о зачете в счет погашения задолженности - ведение', 'GRP_DOCUMENT_DEC_DEBTS_UPD');
InsertUserGroup( 'Документы - Решения о возврате - просмотр',                             'GRP_DOCUMENT_DEC_PAYBACK_LST');
InsertUserGroup( 'Документы - Решения о возврате - ведение',                              'GRP_DOCUMENT_DEC_PAYBACK_UPD');
InsertUserGroup( 'Документы - Решения о зачете в счет таможенных платежей - просмотр',    'GRP_DOCUMENT_DEC_PAYMENT_LST');
InsertUserGroup( 'Документы - Решения о зачете в счет таможенных платежей - ведение',     'GRP_DOCUMENT_DEC_PAYMENT_UPD');
InsertUserGroup( 'Документы - Прочие списания - просмотр',                                'GRP_DOCUMENT_FEE_LST');
InsertUserGroup( 'Документы - Прочие списания - ведение',                                 'GRP_DOCUMENT_FEE_UPD');
InsertUserGroup( 'Документы - ГТД - просмотр',                                            'GRP_DOCUMENT_GTD_LST');
InsertUserGroup( 'Документы - ГТД - ведение',                                             'GRP_DOCUMENT_GTD_UPD');
InsertUserGroup( 'Документы - просмотр',                                                  'GRP_DOCUMENT_LST');
InsertUserGroup( 'Документы - Требования об уплате - просмотр',                           'GRP_DOCUMENT_NOTICEPAY_LST');
InsertUserGroup( 'Документы - Требования об уплате - ведение',                            'GRP_DOCUMENT_NOTICEPAY_UPD');
InsertUserGroup( 'Документы - Возвраты - просмотр',                                       'GRP_DOCUMENT_PAYBACK_LST');
InsertUserGroup( 'Документы - Возвраты - ведение',                                        'GRP_DOCUMENT_PAYBACK_UPD');
InsertUserGroup( 'Документы - Платежи учВЭД - просмотр',                                  'GRP_DOCUMENT_PAYMENT_ORDER_LST');
InsertUserGroup( 'Документы - Платежи учВЭД - ведение',                                   'GRP_DOCUMENT_PAYMENT_ORDER_UPD');
InsertUserGroup( 'Документы - Реестры КНП - просмотр',                                    'GRP_DOCUMENT_REGISTER_BP_LST');
InsertUserGroup( 'Документы - Реестры КНП - ведение',                                     'GRP_DOCUMENT_REGISTER_BP_UPD');
InsertUserGroup( 'Документы - Перезачет - просмотр',                                      'GRP_DOCUMENT_REUSEPAYORDER_LST');
InsertUserGroup( 'Документы - Перезачет - ведение',                                       'GRP_DOCUMENT_REUSEPAYORDER_UPD');
InsertUserGroup( 'Документы - ТПО - просмотр',                                            'GRP_DOCUMENT_TPO_LST');
InsertUserGroup( 'Документы - ТПО - ведение',                                             'GRP_DOCUMENT_TPO_UPD');
InsertUserGroup( 'Документы - ТР - просмотр',                                             'GRP_DOCUMENT_TR_LST');
InsertUserGroup( 'Документы - ТР - ведение',                                              'GRP_DOCUMENT_TR_UPD');
InsertUserGroup( 'Документы - ведение',                                                   'GRP_DOCUMENT_UPD');
-- Импорт документов
InsertUserGroup( 'Импорт документов',                                                     'GRP_IMPORT_DOC');
-- Импорт таможенных документов
InsertUserGroup( 'Импорт таможенных документов',                                          'GRP_IMPORTCUSTOMDOC');
-- Импорт НСИ
InsertUserGroup( 'Импорт НСИ',                                                            'GRP_IMPORTNSI');
-- Импорт платежных документов
InsertUserGroup( 'Импорт платежных документов',                                           'GRP_IMPORTPAY');
-- Главная книга 
InsertUserGroup( 'Главная книга - Просмотр',                                              'GRP_MAINBOOK_LST');
InsertUserGroup( 'Главная книга - Ведение',                                               'GRP_MAINBOOK_UPD');
InsertUserGroup( 'Главная книга - Оперативный баланс таможни - просмотр',                 'GRP_MAINBOOK_ACCTURNOVER_LST');
InsertUserGroup( 'Главная книга - Оперативный баланс таможни - ведение',                  'GRP_MAINBOOK_ACCTURNOVER_UPD');
InsertUserGroup( 'Главная книга - Закрыть период',                                        'GRP_MAINBOOK_CLOSEDAY');
InsertUserGroup( 'Главная книга - Балансы подчиненных ТО - просмотр',                     'GRP_MAINBOOK_DOCCHILDSBALANCE_LST');
InsertUserGroup( 'Главная книга - Балансы подчиненных ТО - ведение',                      'GRP_MAINBOOK_DOCCHILDSBALANCE_UPD');
InsertUserGroup( 'Главная книга - Оборотные ведомости - просмотр',                        'GRP_MAINBOOK_TURNOVERSHEETS_LST');

-- НСИ 
InsertUserGroup( 'НСИ - просмотр',                                                        'GRP_NSI_LST');
InsertUserGroup( 'НСИ - ведение',                                                         'GRP_NSI_UPD');
-- Пакеты
InsertUserGroup( 'Пакеты - Пакеты передачи - просмотр',                                   'GRP_PACKET_TRANSFER_LST');
InsertUserGroup( 'Пакеты - Пакеты передачи - ведение',                                    'GRP_PACKET_TRANSFER_UPD');
-- Возвраты
InsertUserGroup( 'Возвраты - Решения о возврате - просмотр',                              'GRP_PAYBACK_DECISION_LST');
InsertUserGroup( 'Возвраты - Решения о возврате - ведение',                               'GRP_PAYBACK_DECISION_UPD');
InsertUserGroup( 'Возвраты - просмотр',                                                   'GRP_PAYBACK_LST');
InsertUserGroup( 'Возвраты - Платежи по возвратам учВЭД - просмотр',                      'GRP_PAYBACK_PAYMENT_LST');
InsertUserGroup( 'Возвраты - Платежи по возвратам учВЭД - ведение',                       'GRP_PAYBACK_PAYMENT_UPD');
InsertUserGroup( 'Возвраты - ведение',                                                    'GRP_PAYBACK_UPD');
-- Отчеты
InsertUserGroup( 'Отчеты',                                                                'GRP_REPORT');
-- Сервис
InsertUserGroup( 'Сервис',                                                                'GRP_SERVICE');


------------------------------
-- InsertTask
------------------------------
-- Подключение к БД
InsertTask ( 'Подключение к БД',                                                           'TSK_CONNECT_DB');
-- Доступ к объектной форме
InsertTask ( 'Доступ к объектной форме',                                                   'TSK_OBJECTFORM_LST');
-- Администратор данных
InsertTask ( 'Администратор данных',                                                       'TSK_ADMIN_DATA');
InsertTask ( 'Администратор пользователей',                                                'TSK_ADMIN_TASK');
-- Настройка 
InsertTask ( 'Настройка - Банки принимающие оплату наличными - просмотр',                  'TSK_CONFIG_BANKFORCASH_LST');
InsertTask ( 'Настройка - Банки принимающие оплату наличными - корректировка',             'TSK_CONFIG_BANKFORCASH_UPD');
InsertTask ( 'Настройка - Кассы банков - просмотр',                                        'TSK_CONFIG_CASHDESK_LST');
InsertTask ( 'Настройка - Кассы банков - корректировка',                                   'TSK_CONFIG_CASHDESK_UPD');
InsertTask ( 'Настройка - Параметры системы - просмотр',                                   'TSK_CONFIG_PARAM_LST');
-- Контроль 
InsertTask ( 'Контроль - Задолженность - просмотр',                                        'TSK_CONTROL_DEBT_LST');
InsertTask ( 'Контроль - Задолженность - оплата',                                          'TSK_CONTROL_DEBT_PAY');
InsertTask ( 'Контроль - Задолженность - начисление пени',                                 'TSK_CONTROL_DEBT_PENI');
InsertTask ( 'Контроль - Временный ввоз - просмотр',                                       'TSK_CONTROL_DECLTEMP_LST');
InsertTask ( 'Контроль - Временный ввоз - смена режима',                                   'TSK_CONTROL_DECLTEMP_MODE');
InsertTask ( 'Контроль - Временный ввоз - оплата импорта',                                 'TSK_CONTROL_DECLTEMP_PAY');
InsertTask ( 'Контроль - Временный ввоз - корректировка',                                  'TSK_CONTROL_DECLTEMP_UPD');
InsertTask ( 'Контроль - Рассрочка - просмотр',                                            'TSK_CONTROL_REPAY_LST');
InsertTask ( 'Контроль - Рассрочка - оплата',                                              'TSK_CONTROL_REPAY_PAY');
-- Задолженность
InsertTask ( 'Задолженность',                                                              'TSK_DEBT_SUBJECT');
-- Реестры 
InsertTask ( 'Реестры - Платежи в бюджет - просмотр',                                      'TSK_DOCPACK_BUDGETPAYMENT_LST');
InsertTask ( 'Реестры - Платежи в бюджет - отправка/отмена',                               'TSK_DOCPACK_BUDGETPAYMENT_SEND');
InsertTask ( 'Реестры - Платежи в бюджет - корректировка',                                 'TSK_DOCPACK_BUDGETPAYMENT_UPD');
InsertTask ( 'Реестры - Выписки из казначейства - просмотр',                               'TSK_DOCPACK_PAYMENTS_LST');
InsertTask ( 'Реестры - Выписка - просмотр',                                               'TSK_DOCPACK_REGPAYMENTS_LST');
InsertTask ( 'Реестры - Возвраты - просмотр',                                              'TSK_DOCPACK_RETURNS_LST');
InsertTask ( 'Реестры - Возвраты - корректировка',                                         'TSK_DOCPACK_RETURNS_UPD');
InsertTask ( 'Реестры - Подтвержденные возвраты - просмотр',                               'TSK_DOCPACK_RETURNSY_LST');
InsertTask ( 'Реестры - Подтвержденные возвраты - корректировка',                          'TSK_DOCPACK_RETURNSY_UPD');
InsertTask ( 'Реестры - Перезачеты - просмотр',                                            'TSK_DOCPACK_REUSE_LST');
InsertTask ( 'Реестры - Перезачеты - корректировка',                                       'TSK_DOCPACK_REUSE_UPD');
InsertTask ( 'Реестры - Подтвержденные перезачеты - просмотр',                             'TSK_DOCPACK_REUSEY_LST');
InsertTask ( 'Реестры - Подтвержденные перезачеты - корректировка',                        'TSK_DOCPACK_REUSEY_UPD');
-- Документы 
InsertTask ( 'Документы - Уведомления - просмотр',                                         'TSK_DOCUMENT_ADVICE_LST');
InsertTask ( 'Документы - Уведомления - корректировка',                                    'TSK_DOCUMENT_ADVICE_UPD');
InsertTask ( 'Документы - Перезачет на таможню - просмотр',                                'TSK_DOCUMENT_CUSTOM_REUSE_LST');
InsertTask ( 'Документы - Перезачет на таможню - ведение',                                 'TSK_DOCUMENT_CUSTOM_REUSE_UPD');
InsertTask ( 'Документы - Решения о зачете в счет погашения задолженности - просмотр',     'TSK_DOCUMENT_DEC_DEBTS_LST');
InsertTask ( 'Документы - Решения о зачете в счет погашения задолженности - корректировка','TSK_DOCUMENT_DEC_DEBTS_UPD');
InsertTask ( 'Документы - Решения о возврате - просмотр',                                  'TSK_DOCUMENT_DEC_PAYBACK_LST');
InsertTask ( 'Документы - Решения о возврате - корректировка',                             'TSK_DOCUMENT_DEC_PAYBACK_UPD');
InsertTask ( 'Документы - Решения о зачете в счет таможенных платежей - просмотр',         'TSK_DOCUMENT_DEC_PAYMENT_LST');
InsertTask ( 'Документы - Решения о зачете в счет таможенных платежей - корректировка',    'TSK_DOCUMENT_DEC_PAYMENT_UPD');
InsertTask ( 'Документы - Прочие списания - просмотр',                                     'TSK_DOCUMENT_FEE_LST');
InsertTask ( 'Документы - Прочие списания - корректировка',                                'TSK_DOCUMENT_FEE_UPD');
InsertTask ( 'Документы - ГТД - закрытие временной ГТД',                                   'TSK_DOCUMENT_GTD_CLOSE');
InsertTask ( 'Документы - ГТД - исправление ошибок',                                       'TSK_DOCUMENT_GTD_ERROR');
InsertTask ( 'Документы - ГТД - просмотр',                                                 'TSK_DOCUMENT_GTD_LST');
InsertTask ( 'Документы - ГТД - корректировка',                                            'TSK_DOCUMENT_GTD_UPD');
InsertTask ( 'Документы - Требования об уплате - просмотр',                                'TSK_DOCUMENT_NOTICEPAY_LST');
InsertTask ( 'Документы - Требования об уплате - корректировка',                           'TSK_DOCUMENT_NOTICEPAY_UPD');
InsertTask ( 'Документы - Возвраты - просмотр',                                            'TSK_DOCUMENT_PAYBACK_LST');
InsertTask ( 'Документы - Возвраты - отправка/отмена',                                     'TSK_DOCUMENT_PAYBACK_SEND');
InsertTask ( 'Документы - Возвраты - ведение',                                             'TSK_DOCUMENT_PAYBACK_UPD');
InsertTask ( 'Документы - Платежи учВЭД - заверение',                                      'TSK_DOCUMENT_PAYMENTORDER_COMMIT');
InsertTask ( 'Документы - Платежи учВЭД - просмотр',                                       'TSK_DOCUMENT_PAYMENTORDER_LST');
InsertTask ( 'Документы - Платежи учВЭД - корректировка',                                  'TSK_DOCUMENT_PAYMENTORDER_UPD');
InsertTask ( 'Документы - Реестры КНП - просмотр',                                         'TSK_DOCUMENT_REGISTER_BP_LST');
InsertTask ( 'Документы - Реестры КНП - корректировка',                                    'TSK_DOCUMENT_REGISTER_BP_UPD');
InsertTask ( 'Документы - Перезачет - просмотр',                                           'TSK_DOCUMENT_REUSEPAYORDER_LST');
InsertTask ( 'Документы - Перезачет - смена статуса',                                      'TSK_DOCUMENT_REUSEPAYORDER_STATE');
InsertTask ( 'Документы - Перезачет - корректировка',                                      'TSK_DOCUMENT_REUSEPAYORDER_UPD');
InsertTask ( 'Документы - ТПО - исправление ошибок',                                       'TSK_DOCUMENT_TPO_ERROR');
InsertTask ( 'Документы - ТПО - просмотр',                                                 'TSK_DOCUMENT_TPO_LST');
InsertTask ( 'Документы - ТПО - корректировка',                                            'TSK_DOCUMENT_TPO_UPD');
InsertTask ( 'Документы - ТР,ТПО - анулирование',                                          'TSK_DOCUMENT_TR_ABORT');
InsertTask ( 'Документы - ТР - исправление ошибок',                                        'TSK_DOCUMENT_TR_ERROR');
InsertTask ( 'Документы - ТР - просмотр',                                                  'TSK_DOCUMENT_TR_LST');
InsertTask ( 'Документы - ТР,ТПО - погашение',                                             'TSK_DOCUMENT_TR_PAYOFF');
InsertTask ( 'Документы - ТР - корректировка',                                             'TSK_DOCUMENT_TR_UPD');
-- Импорт 
InsertTask ( 'Импорт - ввод задолженностей',                                               'TSK_IMPORT_DEBTS');
InsertTask ( 'Импорт - ввод подтвержденных возвратов',                                     'TSK_IMPORT_RETY');
-- Импорт таможенных документов 
InsertTask ( 'Импорт таможенных документов - ввод ГТД и ДК',                               'TSK_IMPORTDOC_GTD');
InsertTask ( 'Импорт таможенных документов - ввод ТПО',                                    'TSK_IMPORTDOC_TPO');
InsertTask ( 'Импорт таможенных документов - ввод ТР',                                     'TSK_IMPORTDOC_TR');
-- Импорт НСИ 
InsertTask ( 'Импорт НСИ - ввод видов таможенных деклараций',                              'TSK_IMPORTNSI_ADVDECLFEATURE');
InsertTask ( 'Импорт НСИ - ввод решений ТО по ДС',                                         'TSK_IMPORTNSI_ASSETS_DECISION');
InsertTask ( 'Импорт НСИ - ввод справочника возвратов\зачетов ДС',                         'TSK_IMPORTNSI_ASSETS_DICT');
InsertTask ( 'Импорт НСИ - ввод оснований для возвратов\зачетов ДС',                       'TSK_IMPORTNSI_ASSETS_REASON');
InsertTask ( 'Импорт НСИ - ввод банков',                                                   'TSK_IMPORTNSI_BANK');
InsertTask ( 'Импорт НСИ - ввод брокеров',                                                 'TSK_IMPORTNSI_BROKER');
InsertTask ( 'Импорт НСИ - ввод категорий субъектов',                                      'TSK_IMPORTNSI_CATEGORY');
InsertTask ( 'Импорт НСИ - ввод ставок ЦБ',                                                'TSK_IMPORTNSI_CBRATE');
InsertTask ( 'Импорт НСИ - ввод кодов стран',                                              'TSK_IMPORTNSI_COUNTRYCODE');
InsertTask ( 'Импорт НСИ - ввод курсов валют',                                             'TSK_IMPORTNSI_CURRRATE');
InsertTask ( 'Импорт НСИ - ввод видов таможенных режимов',                                 'TSK_IMPORTNSI_CUSTOMMODE');
InsertTask ( 'Импорт НСИ - ввод таможен',                                                  'TSK_IMPORTNSI_CUSTOMS');
InsertTask ( 'Импорт НСИ - ввод причин возникновения задолженности',                       'TSK_IMPORTNSI_DEBT_REASON');
InsertTask ( 'Импорт НСИ - ввод типов задолженности',                                      'TSK_IMPORTNSI_DEBT_TYPES');
InsertTask ( 'Импорт НСИ - ввод решений, принимаемых таможенными органами',                'TSK_IMPORTNSI_DECISION_QUALIFIER');
InsertTask ( 'Импорт НСИ - ввод участников ВЭД',                                           'TSK_IMPORTNSI_DECLARANT');
InsertTask ( 'Импорт НСИ - ввод видов документов удостоверяющих личность',                 'TSK_IMPORTNSI_PASSPORTTYPE');
InsertTask ( 'Импорт НСИ - ввод видов платежей',                                           'TSK_IMPORTNSI_PAYMENTTYPE');
InsertTask ( 'Импорт НСИ - ввод валюты',                                                   'TSK_IMPORTNSI_VALUTA');
InsertTask ( 'Импорт НСИ - КБК',                                                           'TSK_IMPORTNSI_KBK');
-- Импорт платежных документов 
InsertTask ( 'Импорт платежных документов - ввод КО',                                      'TSK_IMPORTPAY_KO');
InsertTask ( 'Импорт платежных документов - ввод пп',                                      'TSK_IMPORTPAY_PAYMENTORDER');
InsertTask ( 'Импорт платежных документов - ввод ТК',                                      'TSK_IMPORTPAY_TK');
-- Главная книга 
InsertTask ( 'Главная книга - Оперативный баланс таможни - просмотр',                      'TSK_MAINBOOK_ACCTURNOVER_LST');
InsertTask ( 'Главная книга - Оперативный баланс таможни - корректировка',                 'TSK_MAINBOOK_ACCTURNOVER_UPD');
InsertTask ( 'Главная книга - Закрыть период',                                             'TSK_MAINBOOK_CLOSEDAY');
InsertTask ( 'Главная книга - Балансы подчиненных ТО - просмотр',                          'TSK_MAINBOOK_DOCCHILDSBALANCE_LST');
InsertTask ( 'Главная книга - Балансы подчиненных ТО - корректировка',                     'TSK_MAINBOOK_DOCCHILDSBALANCE_UPD');
InsertTask ( 'Главная книга - Оборотные ведомости - просмотр',                             'TSK_MAINBOOK_TURNOVERSHEETS_LST');
-- НСИ 
InsertTask ( 'НСИ - Решения ТО по ДС - просмотр',                                          'TSK_NSI_ASSETS_DECISION_LST');
InsertTask ( 'НСИ - Решения ТО по ДС - корректировка',                                     'TSK_NSI_ASSETS_DECISION_UPD');
InsertTask ( 'НСИ - Справочник возвратов\зачетов - просмотр',                              'TSK_NSI_ASSETS_DICT_LST');
InsertTask ( 'НСИ - Справочник возвратов\зачетов - корректировка',                         'TSK_NSI_ASSETS_DICT_UPD');
InsertTask ( 'НСИ - Основания для возвратов\зачетов - просмотр',                           'TSK_NSI_ASSETS_REASON_LST');
InsertTask ( 'НСИ - Основания для возвратов\зачетов - корректировка',                      'TSK_NSI_ASSETS_REASON_UPD');
InsertTask ( 'НСИ - Банки - просмотр',                                                     'TSK_NSI_BANK_LST');
InsertTask ( 'НСИ - Банки - корректировка',                                                'TSK_NSI_BANK_UPD');
InsertTask ( 'НСИ - Крупные плательщики - просмотр',                                       'TSK_NSI_BIGPAYER_LST');
InsertTask ( 'НСИ - Крупные плательщики - корректировка',                                  'TSK_NSI_BIGPAYER_UPD');
InsertTask ( 'НСИ - Соглашения КНП - просмотр',                                            'TSK_NSI_BP_AGREEMENT_LST');
InsertTask ( 'НСИ - Соглашения КНП - ведение',                                             'TSK_NSI_BP_AGREEMENT_UPD');
InsertTask ( 'НСИ - Распоряжения КНП - просмотр',                                          'TSK_NSI_BP_LICENCE_LST');
InsertTask ( 'НСИ - Распоряжения КНП - ведение',                                           'TSK_NSI_BP_LICENCE_UPD');
InsertTask ( 'НСИ - Брокеры - просмотр',                                                   'TSK_NSI_BROKER_LST');
InsertTask ( 'НСИ - Брокеры - корректировка',                                              'TSK_NSI_BROKER_UPD');
InsertTask ( 'НСИ - Категории субъектов - просмотр',                                       'TSK_NSI_CATEGORY_LST');
InsertTask ( 'НСИ - Категории субъектов - корректировка',                                  'TSK_NSI_CATEGORY_UPD');
InsertTask ( 'НСИ - Ставка ЦБ - просмотр',                                                 'TSK_NSI_CBRATE_LST');
InsertTask ( 'НСИ - Ставка ЦБ - корректировка',                                            'TSK_NSI_CBRATE_UPD');
InsertTask ( 'НСИ - Коды стран - просмотр',                                                'TSK_NSI_COUNTRY_CODE_LST');
InsertTask ( 'НСИ - Коды стран - корректировка',                                           'TSK_NSI_COUNTRY_CODE_UPD');
InsertTask ( 'НСИ - Валюта курс - просмотр',                                               'TSK_NSI_CURRRATE_LST');
InsertTask ( 'НСИ - Валюта курс - корректировка',                                          'TSK_NSI_CURRRATE_UPD');
InsertTask ( 'НСИ - Таможенные режимы - просмотр',                                         'TSK_NSI_CUSTOM_MODE_LST');
InsertTask ( 'НСИ - Таможенные режимы - ведение',                                          'TSK_NSI_CUSTOM_MODE_UPD');
InsertTask ( 'НСИ - Виды таможенных деклараций - просмотр',                                'TSK_NSI_CUSTOMS_DECL_TYPE_LST');
InsertTask ( 'НСИ - Виды таможенных деклараций - корректировка',                           'TSK_NSI_CUSTOMS_DECL_TYPE_UPD');
InsertTask ( 'НСИ - Таможни - просмотр',                                                   'TSK_NSI_CUSTOMS_LST');
InsertTask ( 'НСИ - Таможни - корректировка',                                              'TSK_NSI_CUSTOMS_UPD');
InsertTask ( 'НСИ - Задолженность - просмотр',                                             'TSK_NSI_DEBT_LST');
InsertTask ( 'НСИ - Причины возникновения задолженности - просмотр',                       'TSK_NSI_DEBT_REASON_LST');
InsertTask ( 'НСИ - Причины возникновения задолженности - корректировка',                  'TSK_NSI_DEBT_REASON_UPD');
InsertTask ( 'НСИ - Типы задолженности - просмотр',                                        'TSK_NSI_DEBT_TYPES_LST');
InsertTask ( 'НСИ - Типы задолженности - корректировка',                                   'TSK_NSI_DEBT_TYPES_UPD');
InsertTask ( 'НСИ - Задолженность - корректировка',                                        'TSK_NSI_DEBT_UPD');
InsertTask ( 'НСИ - Решения, принимаемые таможенными органами - просмотр',                 'TSK_NSI_DECISION_QUALIFIER_LST');
InsertTask ( 'НСИ - Решения, принимаемые таможенными органами - корректировка',            'TSK_NSI_DECISION_QUALIFIER_UPD');
InsertTask ( 'НСИ - Участники ВЭД банковские счета - просмотр',                            'TSK_NSI_DECLARANT_ACCOUNT_LST');
InsertTask ( 'НСИ - Участники ВЭД банковские счета - корректировка',                       'TSK_NSI_DECLARANT_ACCOUNT_UPD');
InsertTask ( 'НСИ - Участники ВЭД - просмотр',                                             'TSK_NSI_DECLARANT_LST');
InsertTask ( 'НСИ - Участники ВЭД - корректировка',                                        'TSK_NSI_DECLARANT_UPD');
InsertTask ( 'НСИ - КБК - просмотр',                                                       'TSK_NSI_KBK_LST');
InsertTask ( 'НСИ - КБК - корректировка',                                                  'TSK_NSI_KBK_UPD');
InsertTask ( 'НСИ - Виды документов, удостоверяющих личность - просмотр',                  'TSK_NSI_PASSPORT_TYPE_LST');
InsertTask ( 'НСИ - Виды документов, удостоверяющих личность - корректировка',             'TSK_NSI_PASSPORT_TYPE_UPD');
InsertTask ( 'НСИ - Виды платежей - просмотр',                                             'TSK_NSI_PAYMENTTYPE_LST');
InsertTask ( 'НСИ - Виды платежей - корректировка',                                        'TSK_NSI_PAYMENTTYPE_UPD');
InsertTask ( 'НСИ - Физ.Лица - просмотр',                                                  'TSK_NSI_PERSON_LST');
InsertTask ( 'НСИ - Физ.Лица - корректировка',                                             'TSK_NSI_PERSON_UPD');
InsertTask ( 'НСИ - Валюта - просмотр',                                                    'TSK_NSI_VALUTA_LST');
InsertTask ( 'НСИ - Валюта - корректировка',                                               'TSK_NSI_VALUTA_UPD');
-- Пакеты
InsertTask ( 'Пакеты - Пакеты передачи - просмотр',                                        'TSK_PACKET_TRANSFER_LST');
InsertTask ( 'Пакеты - Пакеты передачи - корректировка',                                   'TSK_PACKET_TRANSFER_UPD');
-- Возвраты
InsertTask ( 'Возвраты - Решения о возврате - просмотр',                                   'TSK_PAYBACK_DECISION_LST');
InsertTask ( 'Возвраты - Решения о возврате - ведение',                                    'TSK_PAYBACK_DECISION_UPD');
InsertTask ( 'Возвраты - Платежи по возвратам учВЭД - просмотр',                           'TSK_PAYBACK_PAYMENT_LST');
InsertTask ( 'Возвраты - Платежи по возвратам учВЭД - ведение',                            'TSK_PAYBACK_PAYMENT_UPD');
-- Отчет 
InsertTask ( 'Отчет - Остатки авансовых средств',                                          'TSK_REPORT_ADVANCEREST');
InsertTask ( 'Отчет - Акт выверки авансовых платежей',                                     'TSK_REPORT_AVANS_CMP');
InsertTask ( 'Отчет - Авансовый отчет',                                                    'TSK_REPORT_AVANSRASHOD');
InsertTask ( 'Отчет - Крупные плательщики',                                                'TSK_REPORT_BIG_PAYER');
InsertTask ( 'Отчет - Начисления и их оплата',                                             'TSK_REPORT_CHARGE_PAY');
InsertTask ( 'Отчет - Таможенные карты',                                                   'TSK_REPORT_CUSTOMSCARD');
InsertTask ( 'Отчет - Платежи и их расход',                                                'TSK_REPORT_DEBETCREDIT');
InsertTask ( 'Отчет - Контроль номеров ГТД',                                               'TSK_REPORT_GTD_NUMBERS_CONTROL');
InsertTask ( 'Отчет - Бюджетный учет - Извещение',                                         'TSK_REPORT_NOTICE');
InsertTask ( 'Отчет - Извещение по зачтенным платежам (0541008)',                          'TSK_REPORT_NSINOTICE0541008');
InsertTask ( 'Отчет - Извещение о поступлении и перераспределении платежей (0541102)',     'TSK_REPORT_NSINOTICE0541102');
InsertTask ( 'Отчет - Извещение о возврате платежей (0541202)',                            'TSK_REPORT_NSINOTICE0541202');
InsertTask ( 'Отчет - Бюджетный учет - Инвентаризационная опись',                          'TSK_REPORT_OPIS');
InsertTask ( 'Отчет - Подтверждение уплаты',                                               'TSK_REPORT_PAYCONFIRM');
InsertTask ( 'Отчет - Отчет о расходовании всех видов поступлений',                        'TSK_REPORT_PAYMENT_CMP');
InsertTask ( 'Отчет - Поступившие П\П',                                                    'TSK_REPORT_PAYMENT_ORDER');
InsertTask ( 'Отчет - Карточка ВЭД',                                                       'TSK_REPORT_REGTI');
InsertTask ( 'Отчет - Бюджетный учет - Ведомость',                                         'TSK_REPORT_VEDOMOST');
InsertTask ( 'Отчет - 4ПЛ',                                                                'TSK_REPORT_4PL');
-- Сервис
InsertTask ( 'Сервис - Возможные дубли уч. ВЭД',                                           'TSK_SERVICE_EQUALINN');
-- Отчеты 
InsertTask ( 'Отчеты - Авансовые средства участников ВЭД',                                 'TSK_SREPORT_AVANS');
InsertTask ( 'Отчеты - Отправки в бюджет',                                                 'TSK_SREPORT_BUDGET');
InsertTask ( 'Отчеты - Итоги дня',                                                         'TSK_SREPORT_DAY');
InsertTask ( 'Отчеты - Периодические платежи',                                             'TSK_SREPORT_PAYPER');
InsertTask ( 'Отчеты - Возврат таможенных платежей',                                       'TSK_SREPORT_PAYRET');
InsertTask ( 'Отчеты - Подтвержденные платежи',                                            'TSK_SREPORT_PAY1');
InsertTask ( 'Отчеты - Оплата по таможенным картам',                                       'TSK_SREPORT_PAY2');
InsertTask ( 'Отчеты - Неподтвержденные платежи',                                          'TSK_SREPORT_PAY3');


------------------------------
-- GroupInsertTask
------------------------------
-- Администратор данных
GroupInsertTask ( 'AdminData',                     'TSK_ADMIN_DATA' );
-- Администратор прав пользователей
GroupInsertTask ( 'AdminTask',                     'TSK_ADMIN_TASK' );
-- Настройка - Банки, кассы банков - просмотр
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_LST',   'TSK_CONFIG_BANKFORCASH_LST' );
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_LST',   'TSK_CONFIG_CASHDESK_LST' );
-- Настройка - Банки, кассы банков - ведение
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_UPD',   'TSK_CONFIG_BANKFORCASH_LST' );
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_UPD',   'TSK_CONFIG_BANKFORCASH_UPD' );
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_UPD',   'TSK_CONFIG_CASHDESK_LST' );
GroupInsertTask ( 'GRP_CONFIG_BANKCASHDESK_UPD',   'TSK_CONFIG_CASHDESK_UPD' );
-- Настройка - просмотр
GroupInsertTask ( 'GRP_CONFIG_LST',                'TSK_CONFIG_BANKFORCASH_LST' );
GroupInsertTask ( 'GRP_CONFIG_LST',                'TSK_CONFIG_CASHDESK_LST' );
GroupInsertTask ( 'GRP_CONFIG_LST',                'TSK_CONFIG_PARAM_LST' );
-- Настройка - Параметры - просмотр
GroupInsertTask ( 'GRP_CONFIG_PARAM_LST',          'TSK_CONFIG_PARAM_LST' );
-- Настройка - ведение
GroupInsertTask ( 'GRP_CONFIG_UPD',                'TSK_CONFIG_BANKFORCASH_LST' );
GroupInsertTask ( 'GRP_CONFIG_UPD',                'TSK_CONFIG_BANKFORCASH_UPD' );
GroupInsertTask ( 'GRP_CONFIG_UPD',                'TSK_CONFIG_CASHDESK_LST' );
GroupInsertTask ( 'GRP_CONFIG_UPD',                'TSK_CONFIG_CASHDESK_UPD' );
GroupInsertTask ( 'GRP_CONFIG_UPD',                'TSK_CONFIG_PARAM_LST' );
-- Подключение к БД
GroupInsertTask ( 'GRP_CONNECT_DB',                'TSK_CONNECT_DB' );
GroupInsertTask ( 'GRP_CONNECT_DB',                'TSK_OBJECTFORM_LST' );
-- Контроль - Задолженность - просмотр
GroupInsertTask ( 'GRP_CONTROL_DEBT_LST',          'TSK_CONTROL_DEBT_LST' );
-- Контроль - Задолженность - ведение
GroupInsertTask ( 'GRP_CONTROL_DEBT_UPD',          'TSK_CONTROL_DEBT_LST' );
GroupInsertTask ( 'GRP_CONTROL_DEBT_UPD',          'TSK_CONTROL_DEBT_PAY' );
GroupInsertTask ( 'GRP_CONTROL_DEBT_UPD',          'TSK_CONTROL_DEBT_PENI' );
-- Контроль - Временный ввоз - просмотр
GroupInsertTask ( 'GRP_CONTROL_DECLTEMP_LST',      'TSK_CONTROL_DECLTEMP_LST' );
-- Контроль - Временный ввоз - ведение
GroupInsertTask ( 'GRP_CONTROL_DECLTEMP_UPD',      'TSK_CONTROL_DECLTEMP_LST' );
GroupInsertTask ( 'GRP_CONTROL_DECLTEMP_UPD',      'TSK_CONTROL_DECLTEMP_MODE' );
GroupInsertTask ( 'GRP_CONTROL_DECLTEMP_UPD',      'TSK_CONTROL_DECLTEMP_PAY' );
GroupInsertTask ( 'GRP_CONTROL_DECLTEMP_UPD',      'TSK_CONTROL_DECLTEMP_UPD' );
-- Контроль - просмотр
GroupInsertTask ( 'GRP_CONTROL_LST',               'TSK_CONTROL_DEBT_LST' );
GroupInsertTask ( 'GRP_CONTROL_LST',               'TSK_CONTROL_DECLTEMP_LST' );
GroupInsertTask ( 'GRP_CONTROL_LST',               'TSK_CONTROL_REPAY_LST' );
-- Контроль - Рассрочка - просмотр
GroupInsertTask ( 'GRP_CONTROL_REPAY_LST',         'TSK_CONTROL_REPAY_LST' );
-- Контроль - Рассрочка - ведение
GroupInsertTask ( 'GRP_CONTROL_REPAY_UPD',         'TSK_CONTROL_REPAY_LST' );
GroupInsertTask ( 'GRP_CONTROL_REPAY_UPD',         'TSK_CONTROL_REPAY_PAY' );
-- Контроль - ведение
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DEBT_LST' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DEBT_PAY' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DEBT_PENI' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DECLTEMP_LST' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DECLTEMP_MODE' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DECLTEMP_PAY' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_DECLTEMP_UPD' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_REPAY_LST' );
GroupInsertTask ( 'GRP_CONTROL_UPD',               'TSK_CONTROL_REPAY_PAY' );
-- Задолженность
GroupInsertTask ( 'GRP_DEBT',                      'TSK_DEBT_SUBJECT' );
-- Реестры - Платежи в бюджет - просмотр
GroupInsertTask ( 'GRP_DOCPACK_BUDGETPAYMENT_LST', 'TSK_DOCPACK_BUDGETPAYMENT_LST' );
-- Реестры - Платежи в бюджет - ведение
GroupInsertTask ( 'GRP_DOCPACK_BUDGETPAYMENT_UPD', 'TSK_DOCPACK_BUDGETPAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCPACK_BUDGETPAYMENT_UPD', 'TSK_DOCPACK_BUDGETPAYMENT_SEND' );
GroupInsertTask ( 'GRP_DOCPACK_BUDGETPAYMENT_UPD', 'TSK_DOCPACK_BUDGETPAYMENT_UPD' );
-- Реестры - просмотр
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_BUDGETPAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_PAYMENTS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_REGPAYMENTS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_RETURNS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_RETURNSY_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCPACK_LST',               'TSK_DOCPACK_REUSEY_LST' );
-- Реестры - Выписки из казначейства - просмотр
GroupInsertTask ( 'GRP_DOCPACK_PAYMENTS_LST',      'TSK_DOCPACK_PAYMENTS_LST' );
-- Реестры - Выписка - просмотр
GroupInsertTask ( 'GRP_DOCPACK_REGPAYMENTS_LST',   'TSK_DOCPACK_REGPAYMENTS_LST' );
-- Реестры - Возвраты - просмотр
GroupInsertTask ( 'GRP_DOCPACK_RETURNS_LST',       'TSK_DOCPACK_RETURNS_LST' );
-- Реестры - Возвраты - ведение
GroupInsertTask ( 'GRP_DOCPACK_RETURNS_UPD',       'TSK_DOCPACK_RETURNS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_RETURNS_UPD',       'TSK_DOCPACK_RETURNS_UPD' );
-- Реестры - Подтвержденные возвраты - просмотр
GroupInsertTask ( 'GRP_DOCPACK_RETURNSY_LST',      'TSK_DOCPACK_RETURNSY_LST' );
-- Реестры - Подтвержденные возвраты - ведение
GroupInsertTask ( 'GRP_DOCPACK_RETURNSY_UPD',      'TSK_DOCPACK_RETURNSY_LST' );
GroupInsertTask ( 'GRP_DOCPACK_RETURNSY_UPD',      'TSK_DOCPACK_RETURNSY_UPD' );
-- Реестры - Перезачеты - просмотр
GroupInsertTask ( 'GRP_DOCPACK_REUSE_LST',         'TSK_DOCPACK_REUSE_LST' );
-- Реестры - Перезачеты - ведение
GroupInsertTask ( 'GRP_DOCPACK_REUSE_UPD',         'TSK_DOCPACK_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCPACK_REUSE_UPD',         'TSK_DOCPACK_REUSE_UPD' );
-- Реестры - Подтвержденные перезачеты - просмотр
GroupInsertTask ( 'GRP_DOCPACK_REUSEY_LST',        'TSK_DOCPACK_REUSEY_LST' );
-- Реестры - Подтвержденные перезачеты - ведение
GroupInsertTask ( 'GRP_DOCPACK_REUSEY_UPD',        'TSK_DOCPACK_REUSEY_LST' );
GroupInsertTask ( 'GRP_DOCPACK_REUSEY_UPD',        'TSK_DOCPACK_REUSEY_UPD' );
-- Реестры - ведение
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_BUDGETPAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_BUDGETPAYMENT_SEND' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_BUDGETPAYMENT_UPD' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_PAYMENTS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_REGPAYMENTS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_RETURNS_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_RETURNS_UPD' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_RETURNSY_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_RETURNSY_UPD' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_REUSE_UPD' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_REUSEY_LST' );
GroupInsertTask ( 'GRP_DOCPACK_UPD',               'TSK_DOCPACK_REUSEY_UPD' );
-- Документы - Уведомления - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_ADVICE_LST',       'TSK_DOCUMENT_ADVICE_LST' );
-- Документы - Уведомления - ведение
GroupInsertTask ( 'GRP_DOCUMENT_ADVICE_UPD',       'TSK_DOCUMENT_ADVICE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_ADVICE_UPD',       'TSK_DOCUMENT_ADVICE_UPD' );
-- Документы - перезачет на таможню - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_CUSTOM_REUSE_LST', 'TSK_DOCUMENT_CUSTOM_REUSE_LST' );
-- Документы - перезачет на таможню - ведение
GroupInsertTask ( 'GRP_DOCUMENT_CUSTOM_REUSE_UPD', 'TSK_DOCUMENT_CUSTOM_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_CUSTOM_REUSE_UPD', 'TSK_DOCUMENT_CUSTOM_REUSE_UPD' );
-- Документы - Решения о зачете в счет погашения задолженности - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_DEC_DEBTS_LST',    'TSK_DOCUMENT_DEC_DEBTS_LST' );
-- Документы - Решения о зачете в счет погашения задолженности - ведение
GroupInsertTask ( 'GRP_DOCUMENT_DEC_DEBTS_UPD',    'TSK_DOCUMENT_DEC_DEBTS_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_DEC_DEBTS_UPD',    'TSK_DOCUMENT_DEC_DEBTS_UPD' );
-- Документы - Решения о возврате - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYBACK_LST',  'TSK_DOCUMENT_DEC_PAYBACK_LST' );
-- Документы - Решения о возврате - ведение
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYBACK_UPD',  'TSK_DOCUMENT_DEC_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYBACK_UPD',  'TSK_DOCUMENT_DEC_PAYBACK_UPD' );
-- Документы - Решения о зачете в счет таможенных платежей - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYMENT_LST',  'TSK_DOCUMENT_DEC_PAYMENT_LST' );
-- Документы - Решения о зачете в счет таможенных платежей - ведение
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYMENT_UPD',  'TSK_DOCUMENT_DEC_PAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_DEC_PAYMENT_UPD',  'TSK_DOCUMENT_DEC_PAYMENT_UPD' );
-- Документы - Прочие списания - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_FEE_LST',          'TSK_DOCUMENT_FEE_LST' );
-- Документы - Прочие списания - ведение
GroupInsertTask ( 'GRP_DOCUMENT_FEE_UPD',          'TSK_DOCUMENT_FEE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_FEE_UPD',          'TSK_DOCUMENT_FEE_UPD' );
-- Документы - ГТД - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_GTD_LST',          'TSK_DOCUMENT_GTD_LST' );
-- Документы - ГТД - ведение
GroupInsertTask ( 'GRP_DOCUMENT_GTD_UPD',          'TSK_DOCUMENT_GTD_CLOSE' );
GroupInsertTask ( 'GRP_DOCUMENT_GTD_UPD',          'TSK_DOCUMENT_GTD_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_GTD_UPD',          'TSK_DOCUMENT_GTD_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_GTD_UPD',          'TSK_DOCUMENT_GTD_UPD' );
-- Документы - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_ADVICE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_CUSTOM_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_DEC_DEBTS_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_DEC_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_DEC_PAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_FEE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_GTD_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_NOTICEPAY_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_PAYMENTORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_REGISTER_BP_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_REUSEPAYORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_TPO_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_LST',              'TSK_DOCUMENT_TR_LST' );
-- Документы - Требования об уплате - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_NOTICEPAY_LST',    'TSK_DOCUMENT_NOTICEPAY_LST' );
-- Документы - Требования об уплате - ведение
GroupInsertTask ( 'GRP_DOCUMENT_NOTICEPAY_UPD',    'TSK_DOCUMENT_NOTICEPAY_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_NOTICEPAY_UPD',    'TSK_DOCUMENT_NOTICEPAY_UPD' );
-- Документы - Возвраты - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_PAYBACK_LST',      'TSK_DOCUMENT_PAYBACK_LST' );
-- Документы - Возвраты - ведение
GroupInsertTask ( 'GRP_DOCUMENT_PAYBACK_UPD',      'TSK_DOCUMENT_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_PAYBACK_UPD',      'TSK_DOCUMENT_PAYBACK_SEND' );
GroupInsertTask ( 'GRP_DOCUMENT_PAYBACK_UPD',      'TSK_DOCUMENT_PAYBACK_UPD' );
-- Документы - Платежи учВЭД - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_PAYMENT_ORDER_LST','TSK_DOCUMENT_PAYMENTORDER_LST' );
-- Документы - Платежи учВЭД - ведение
GroupInsertTask ( 'GRP_DOCUMENT_PAYMENT_ORDER_UPD','TSK_DOCUMENT_PAYMENTORDER_COMMIT' );
GroupInsertTask ( 'GRP_DOCUMENT_PAYMENT_ORDER_UPD','TSK_DOCUMENT_PAYMENTORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_PAYMENT_ORDER_UPD','TSK_DOCUMENT_PAYMENTORDER_UPD' );
-- Документы - Реестры КНП - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_REGISTER_BP_LST',  'TSK_DOCUMENT_REGISTER_BP_LST' );
-- Документы - Реестры КНП - ведение
GroupInsertTask ( 'GRP_DOCUMENT_REGISTER_BP_UPD',  'TSK_DOCUMENT_REGISTER_BP_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_REGISTER_BP_UPD',  'TSK_DOCUMENT_REGISTER_BP_UPD' );
-- Документы - Перезачет - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_REUSEPAYORDER_LST','TSK_DOCUMENT_REUSEPAYORDER_LST' );
-- Документы - Перезачет - ведение
GroupInsertTask ( 'GRP_DOCUMENT_REUSEPAYORDER_UPD','TSK_DOCUMENT_REUSEPAYORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_REUSEPAYORDER_UPD','TSK_DOCUMENT_REUSEPAYORDER_STATE' );
GroupInsertTask ( 'GRP_DOCUMENT_REUSEPAYORDER_UPD','TSK_DOCUMENT_REUSEPAYORDER_UPD' );
-- Документы - ТПО - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_TPO_LST',          'TSK_DOCUMENT_TPO_LST' );
-- Документы - ТПО - ведение
GroupInsertTask ( 'GRP_DOCUMENT_TPO_UPD',          'TSK_DOCUMENT_TPO_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_TPO_UPD',          'TSK_DOCUMENT_TPO_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_TPO_UPD',          'TSK_DOCUMENT_TPO_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_TPO_UPD',          'TSK_DOCUMENT_TR_ABORT' );
GroupInsertTask ( 'GRP_DOCUMENT_TPO_UPD',          'TSK_DOCUMENT_TR_PAYOFF' );
-- Документы - ТР - просмотр
GroupInsertTask ( 'GRP_DOCUMENT_TR_LST',           'TSK_DOCUMENT_TR_LST' );
-- Документы - ТР - ведение
GroupInsertTask ( 'GRP_DOCUMENT_TR_UPD',           'TSK_DOCUMENT_TR_ABORT' );
GroupInsertTask ( 'GRP_DOCUMENT_TR_UPD',           'TSK_DOCUMENT_TR_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_TR_UPD',           'TSK_DOCUMENT_TR_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_TR_UPD',           'TSK_DOCUMENT_TR_PAYOFF' );
GroupInsertTask ( 'GRP_DOCUMENT_TR_UPD',           'TSK_DOCUMENT_TR_UPD' );
-- Документы - ведение
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_ADVICE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_ADVICE_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_CUSTOM_REUSE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_CUSTOM_REUSE_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_DEBTS_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_DEBTS_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_PAYBACK_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_PAYMENT_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_DEC_PAYMENT_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_FEE_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_FEE_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_GTD_CLOSE' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_GTD_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_GTD_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_GTD_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_NOTICEPAY_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_NOTICEPAY_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYBACK_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYBACK_SEND' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYBACK_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYMENTORDER_COMMIT' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYMENTORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_PAYMENTORDER_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_REGISTER_BP_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_REGISTER_BP_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_REUSEPAYORDER_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_REUSEPAYORDER_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TPO_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TPO_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TPO_UPD' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TR_ABORT' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TR_ERROR' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TR_LST' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TR_PAYOFF' );
GroupInsertTask ( 'GRP_DOCUMENT_UPD',              'TSK_DOCUMENT_TR_UPD' );
-- Импорт документов
GroupInsertTask ( 'GRP_IMPORT_DOC',                'TSK_IMPORT_DEBTS' );
GroupInsertTask ( 'GRP_IMPORT_DOC',                'TSK_IMPORT_RETY' );
-- Импорт таможенных документов
GroupInsertTask ( 'GRP_IMPORTCUSTOMDOC',           'TSK_IMPORTDOC_GTD' );
GroupInsertTask ( 'GRP_IMPORTCUSTOMDOC',           'TSK_IMPORTDOC_TPO' );
GroupInsertTask ( 'GRP_IMPORTCUSTOMDOC',           'TSK_IMPORTDOC_TR' );
-- Импорт НСИ
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_ADVDECLFEATURE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_ASSETS_DECISION' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_ASSETS_DICT' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_ASSETS_REASON' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_BANK' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_BROKER' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_CATEGORY' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_CBRATE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_COUNTRYCODE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_CURRRATE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_CUSTOMMODE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_CUSTOMS' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_DEBT_REASON' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_DEBT_TYPES' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_DECISION_QUALIFIER' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_DECLARANT' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_PASSPORTTYPE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_PAYMENTTYPE' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_VALUTA' );
GroupInsertTask ( 'GRP_IMPORTNSI',                 'TSK_IMPORTNSI_KBK' );
-- Импорт платежных документов
GroupInsertTask ( 'GRP_IMPORTPAY',                 'TSK_IMPORTPAY_KO' );
GroupInsertTask ( 'GRP_IMPORTPAY',                 'TSK_IMPORTPAY_PAYMENTORDER' );
GroupInsertTask ( 'GRP_IMPORTPAY',                 'TSK_IMPORTPAY_TK' );
-- Главная книга - Просмотр
GroupInsertTask ( 'GRP_MAINBOOK_LST',              'TSK_MAINBOOK_ACCTURNOVER_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_LST',              'TSK_MAINBOOK_DOCCHILDSBALANCE_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_LST',              'TSK_MAINBOOK_TURNOVERSHEETS_LST' );
-- Главная книга - Ведение
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_ACCTURNOVER_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_ACCTURNOVER_UPD' );
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_CLOSEDAY' );
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_DOCCHILDSBALANCE_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_DOCCHILDSBALANCE_UPD' );
GroupInsertTask ( 'GRP_MAINBOOK_UPD',              'TSK_MAINBOOK_TURNOVERSHEETS_LST' );
-- Главная книга - Оперативный баланс таможни - просмотр
GroupInsertTask ( 'GRP_MAINBOOK_ACCTURNOVER_LST',  'TSK_MAINBOOK_ACCTURNOVER_LST' );
-- Главная книга - Оперативный баланс таможни - ведение
GroupInsertTask ( 'GRP_MAINBOOK_ACCTURNOVER_UPD',  'TSK_MAINBOOK_ACCTURNOVER_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_ACCTURNOVER_UPD',  'TSK_MAINBOOK_ACCTURNOVER_UPD' );
-- Главная книга - Закрыть период
GroupInsertTask ( 'GRP_MAINBOOK_CLOSEDAY',         'TSK_MAINBOOK_CLOSEDAY' );
-- Главная книга - Балансы подчиненных ТО - просмотр
GroupInsertTask ( 'GRP_MAINBOOK_DOCCHILDSBALANCE_LST', 'TSK_MAINBOOK_DOCCHILDSBALANCE_LST' );
-- Главная книга - Балансы подчиненных ТО - ведение
GroupInsertTask ( 'GRP_MAINBOOK_DOCCHILDSBALANCE_UPD', 'TSK_MAINBOOK_DOCCHILDSBALANCE_LST' );
GroupInsertTask ( 'GRP_MAINBOOK_DOCCHILDSBALANCE_UPD', 'TSK_MAINBOOK_DOCCHILDSBALANCE_UPD' );
-- Главная книга - Оборотные ведомости - просмотр
GroupInsertTask ( 'GRP_MAINBOOK_TURNOVERSHEETS_LST', 'TSK_MAINBOOK_TURNOVERSHEETS_LST' );
-- НСИ - просмотр
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_ASSETS_DECISION_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_ASSETS_DICT_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_ASSETS_REASON_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_BANK_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_BIGPAYER_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_BP_AGREEMENT_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_BP_LICENCE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_BROKER_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CATEGORY_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CBRATE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_COUNTRY_CODE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CURRRATE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CUSTOM_MODE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CUSTOMS_DECL_TYPE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_CUSTOMS_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DEBT_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DEBT_REASON_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DEBT_TYPES_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DECISION_QUALIFIER_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DECLARANT_ACCOUNT_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_DECLARANT_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_KBK_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_PASSPORT_TYPE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_PAYMENTTYPE_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_PERSON_LST' );
GroupInsertTask ( 'GRP_NSI_LST',                   'TSK_NSI_VALUTA_LST' );
-- НСИ - ведение
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_DECISION_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_DECISION_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_DICT_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_DICT_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_REASON_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_ASSETS_REASON_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BANK_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BANK_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BIGPAYER_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BIGPAYER_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BP_AGREEMENT_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BP_AGREEMENT_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BP_LICENCE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BP_LICENCE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BROKER_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_BROKER_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CATEGORY_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CATEGORY_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CBRATE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CBRATE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_COUNTRY_CODE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_COUNTRY_CODE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CURRRATE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CURRRATE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOM_MODE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOM_MODE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOMS_DECL_TYPE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOMS_DECL_TYPE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOMS_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_CUSTOMS_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_REASON_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_REASON_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_TYPES_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_TYPES_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DEBT_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECISION_QUALIFIER_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECISION_QUALIFIER_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECLARANT_ACCOUNT_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECLARANT_ACCOUNT_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECLARANT_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_DECLARANT_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_KBK_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_KBK_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PASSPORT_TYPE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PASSPORT_TYPE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PAYMENTTYPE_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PAYMENTTYPE_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PERSON_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_PERSON_UPD' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_VALUTA_LST' );
GroupInsertTask ( 'GRP_NSI_UPD',                   'TSK_NSI_VALUTA_UPD' );
-- Пакеты - Пакеты передачи - просмотр
GroupInsertTask ( 'GRP_PACKET_TRANSFER_LST',       'TSK_PACKET_TRANSFER_LST' );
-- Пакеты - Пакеты передачи - ведение
GroupInsertTask ( 'GRP_PACKET_TRANSFER_UPD',       'TSK_PACKET_TRANSFER_LST' );
GroupInsertTask ( 'GRP_PACKET_TRANSFER_UPD',       'TSK_PACKET_TRANSFER_UPD' );
-- Возвраты - Решения о возврате - просмотр
GroupInsertTask ( 'GRP_PAYBACK_DECISION_LST',      'TSK_PAYBACK_DECISION_LST' );
-- Возвраты - Решения о возврате - ведение
GroupInsertTask ( 'GRP_PAYBACK_DECISION_UPD',      'TSK_PAYBACK_DECISION_LST' );
GroupInsertTask ( 'GRP_PAYBACK_DECISION_UPD',      'TSK_PAYBACK_DECISION_UPD' );
-- Возвраты - просмотр
GroupInsertTask ( 'GRP_PAYBACK_LST',               'TSK_PAYBACK_DECISION_LST' );
GroupInsertTask ( 'GRP_PAYBACK_LST',               'TSK_PAYBACK_PAYMENT_LST' );
-- Возвраты - Платежи по возвратам учВЭД - просмотр
GroupInsertTask ( 'GRP_PAYBACK_PAYMENT_LST',       'TSK_PAYBACK_PAYMENT_LST' );
-- Возвраты - Платежи по возвратам учВЭД - ведение
GroupInsertTask ( 'GRP_PAYBACK_PAYMENT_UPD',       'TSK_PAYBACK_PAYMENT_LST' );
GroupInsertTask ( 'GRP_PAYBACK_PAYMENT_UPD',       'TSK_PAYBACK_PAYMENT_UPD' );
-- Возвраты - ведение
GroupInsertTask ( 'GRP_PAYBACK_UPD',               'TSK_PAYBACK_DECISION_LST' );
GroupInsertTask ( 'GRP_PAYBACK_UPD',               'TSK_PAYBACK_DECISION_UPD' );
GroupInsertTask ( 'GRP_PAYBACK_UPD',               'TSK_PAYBACK_PAYMENT_LST' );
GroupInsertTask ( 'GRP_PAYBACK_UPD',               'TSK_PAYBACK_PAYMENT_UPD' );
-- Отчеты
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_ADVANCEREST' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_AVANS_CMP' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_AVANSRASHOD' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_BIG_PAYER' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_CHARGE_PAY' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_CUSTOMSCARD' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_DEBETCREDIT' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_GTD_NUMBERS_CONTROL' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_NOTICE' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_NSINOTICE0541008' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_NSINOTICE0541102' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_NSINOTICE0541202' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_OPIS' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_PAYCONFIRM' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_PAYMENT_CMP' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_PAYMENT_ORDER' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_REGTI' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_VEDOMOST' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_REPORT_4PL' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_AVANS' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_BUDGET' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_DAY' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_PAYPER' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_PAYRET' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_PAY1' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_PAY2' );
GroupInsertTask ( 'GRP_REPORT',                    'TSK_SREPORT_PAY3' );
-- Сервис
GroupInsertTask ( 'GRP_SERVICE',                   'TSK_SERVICE_EQUALINN' );

------------------------------
-- TaskInsertComponent
------------------------------

-- Настройка - Банки принимающие оплату наличными - просмотр
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_LST' , 'FDC_BANKFORCASH_LST'); 

-- Настройка - Банки принимающие оплату наличными - корректировка
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_UPD' , 'FDC_BANKFORCASH_ADD'); 
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_UPD' , 'FDC_BANKFORCASH_DEL'); 
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_UPD' , 'FDC_BANKFORCASH_LST'); 
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_UPD' , 'FDC_BANKFORCASH_UPD'); 
TaskInsertComponent ( 'TSK_CONFIG_BANKFORCASH_UPD' , 'FDC_BANK_LST'); 

-- Настройка - Кассы банков - просмотр
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_LST' , 'FDC_BANKCASHDESK_LST'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_LST' , 'FDC_CASHDESK_LST'); 

-- Настройка - Кассы банков - корректировка
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_BANKCASHDESK_DEL'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_BANKCASHDESK_LST'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_BANK_LST'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_CASHDESK_ADD'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_CASHDESK_DEL'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_CASHDESK_LST'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_CASHDESK_UPD'); 
TaskInsertComponent ( 'TSK_CONFIG_CASHDESK_UPD' , 'FDC_OBJECT_DEL'); 

-- Настройка - Параметры системы - просмотр
TaskInsertComponent ( 'TSK_CONFIG_PARAM_LST' , 'FDC_VALUE_LST_SYS'); 

-- Подключение к БД
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_CHECK_USER_IN_TASK'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_CHECK_VERSION'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_FILE_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_CHECK_ACCESS_LEVEL'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_IS'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_GET_BYSYSNAME'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_GET_CHILDCOUNT'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_IS'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_IS_SUBTYPE'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_LST_ALL'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_REGISTRY_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_TASK_GROUP_LST'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_USER_GET'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_USER_IS_ADMINDATA'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_USER_IS_ADMINTASK'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_USER_IS_SCHEMA_OWNER'); 
TaskInsertComponent ( 'TSK_CONNECT_DB' , 'FDC_OBJECT_TYPE_IS_SUBTYPE ');

-- Контроль - Задолженность - просмотр
TaskInsertComponent ( 'TSK_CONTROL_DEBT_LST' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_LST' , 'FDC_DECL_DEBT_ONE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_LST' , 'FDC_SUBJECT_LST'); 

-- Контроль - Задолженность - оплата
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PAY' , 'P_PAYMENT_HELPER'); 

-- Контроль - Задолженность - начисление пени
TaskInsertComponent ( 'TSK_CONTROL_DEBT_PENI' , 'P_DEBT'); 

-- Контроль - Временный ввоз - просмотр
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLPLATR'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLPLATV'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLPREDD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLSLOTM'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLTECHD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLTOVAR'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLTRANS'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DCLUSL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DKISCH'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DKKUPL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DKOPRP'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DK_PP'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'DBF_DK1'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_ADV_DECL_FEATURE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_CUSTOM_DECL_TEMP_ADM_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_GET_PERIODIC_BY_MONTH'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_GOODS_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_OBJECT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_PERIODIC_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_REPAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_LST' , 'FDC_SUBJECT_LST'); 

-- Контроль - Временный ввоз - смена режима
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_MODE' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_MODE' , 'P_MODE_CHANGE'); 

-- Контроль - Временный ввоз - оплата импорта
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_PAY' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_PAY' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_PAY' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_PAY' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_PAY' , 'P_PAYMENT_HELPER'); 

-- Контроль - Временный ввоз - корректировка
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_ADV_DECL_FEATURE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_ADVICE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_ADVICE_PAY_PERIODIC_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_CLOSE_W_ADVICE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_DEL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_TEMPADM_ADD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_TEMP_ADM_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_TEMPADM_UPD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_DECL_UNDO_CLOSE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_CHECK_PAYMENTS'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_PAY_KNP'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_PREPARE_PAYMENT'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_REMOVE_KNP'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_DECL_SET_KNP'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_GET_PERIODIC_BY_MONTH'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_KIND_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_MODIFY_GOODS_CHARGE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_NOTICEPAY_ADD'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_NOTICEPAY_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_NOTICEPAY_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_OBJECT_ADD_KIND_BYSYSNAME'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_OBJECT_DEL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_OBJECT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_PERIODIC_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_REPAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_CONTROL_DECLTEMP_UPD' , 'P_REPAYMENT_HELPER'); 

-- Контроль - Рассрочка - просмотр
TaskInsertComponent ( 'TSK_CONTROL_REPAY_LST' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_LST' , 'FDC_REPAYMENT_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_LST' , 'FDC_SUBJECT_LST'); 

-- Контроль - Рассрочка - оплата
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_CONTROL_REPAY_PAY' , 'P_REPAYMENT_HELPER'); 

-- Задолженность
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_D_Z'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_LOADS'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_LOADS_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_R_Z'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_S_Z'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'DBF_DEBTS_V_Z'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DEBTS_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_BASISOFREMOV_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_BUSICDOCS_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_COMMONSTATE_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_CURRSTOFCOLL_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_MEASONCOLL_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_DIC_REPAYMENTFRM_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_KBK_STATE_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_LOAD_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_OFFSET_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_REL_DEBTS_LOAD_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_DEBTS_STATE_LST'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_VALUENUMBER_SYS_GET'); 
TaskInsertComponent ( 'TSK_DEBT_SUBJECT' , 'FDC_VALUESTRING_SYS_GET'); 

-- Реестры - Выписка - просмотр
TaskInsertComponent ( 'TSK_DOCPACK_REGPAYMENTS_LST' , 'FDC_DOC_PACK_PAYMENTS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REGPAYMENTS_LST' , 'FDC_NVLTOOWNCODE'); 
TaskInsertComponent ( 'TSK_DOCPACK_REGPAYMENTS_LST' , 'FDC_RESERVED_PAYMENT_LST'); 

-- Реестры - Возвраты - просмотр
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_LST' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_LST' , 'FDC_DOC_PACK_RETURNS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_LST' , 'FDC_PAYMENT_ORDER_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_LST' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_LST' , 'FDC_STATE_LST'); 

-- Реестры - Возвраты - корректировка
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_DOCPACKRETURNS_ADD'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_DOCPACKRETURNS_DEL'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_DOC_PACK_RETURNS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_DOCPACKRETURNS_UPD'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_OBJECT_UPD_STATE'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_PAYMENT_ORDER_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNS_UPD' , 'P_DOCPACKRETURNS'); 

-- Реестры - Подтвержденные возвраты - просмотр
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_LST' , 'DBF_D08_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_LST' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_LST' , 'FDC_DOC_PACK_RETURNS_Y_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_LST' , 'FDC_PAYMENT_ORDER_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_LST' , 'FDC_REL_PACK_DOCS_LST'); 

-- Реестры - Подтвержденные возвраты - корректировка
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'DBF_D08_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_DOCPACKRETURNS_UPD'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_DOC_PACK_RETURNS_Y_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_OBJECT_UPD_STATE'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_PAYMENT_ORDER_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_RETURNSY_UPD' , 'P_DOCPACKRETURNS'); 

-- Реестры - Перезачеты - просмотр
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_LST' , 'FDC_DOC_PACK_REUSE_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_LST' , 'FDC_DOC_REUSE_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_LST' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_LST' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_LST' , 'FDC_SUBJECT_LST'); 

-- Реестры - Перезачеты - корректировка
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_DOCPACK_REUSE_ADD'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_DOCPACK_REUSE_DEL'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_DOC_PACK_REUSE_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_DOCPACK_REUSE_UPD'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_DOC_REUSE_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_OBJECT_UPD_STATE'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSE_UPD' , 'P_DOCPACK_REUSE'); 

-- Реестры - Подтвержденные перезачеты - просмотр
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_LST' , 'FDC_DOC_PACK_REUSE_Y_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_LST' , 'FDC_DOC_REUSE_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_LST' , 'FDC_REL_PACK_DOCS_LST'); 

-- Реестры - Подтвержденные перезачеты - корректировка
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'FDC_DOCPACKRETURNS_UPD'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'FDC_DOC_PACK_REUSE_Y_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'FDC_DOC_REUSE_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'FDC_OBJECT_UPD_STATE'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'P_DOCPACK_REUSE'); 
TaskInsertComponent ( 'TSK_DOCPACK_REUSEY_UPD' , 'P_DOCPACK_REUSEY'); 

-- Реестры - Платежи в бюджет - просмотр
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_BUDGET_PAYMENT_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_DECL_PAYMENT_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'P_NSI_CURRENCY');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_GET_DECL_GOOD_CODES');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_PAYMENT_ORDER_BUDGET_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'P_BUDGET');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_LST', 'FDC_DECL_PAYMENT_ALL_LST');

-- Реестры - Платежи в бюджет - корректировка
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_OBJECT_UPD_STATE');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_PAYMENT_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_DECL_PAYMENT_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'P_NSI_CURRENCY');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_PAYMENT_DEL');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_ACC_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_GETNEWBUDGETLIST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_PAYMENT_ADD');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_PAYMENT_CREATE');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_BUDGET_PAYMENT_REMOVE');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_GET_DECL_GOOD_CODES');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_PAYMENT_ORDER_ALL_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_PAYMENT_ORDER_BUDGET_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'P_BUDGET');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'P_PAYMENT_UTILITY');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_ACC_TRANSACTION');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_DECL_PAYMENT_ALL_LST');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_UPD', 'FDC_PAYMENT_DEDUCTION_ALL_LST');

-- Реестры - Платежи в бюджет - отправка/отмена
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_SEND', 'FDC_BUDGET_PAYMENT_SEND');
TaskInsertComponent('TSK_DOCPACK_BUDGETPAYMENT_SEND', 'FDC_BUDGET_PAYMENT_CANCEL');

-- Реестры - Выписки из казначейства - просмотр
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_CUSTOMS_LST');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_DOC_GET_DATE');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_DOC_PACK_PAYMENTS_LST');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_PAYMENT_ORDER_ALL_LST');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_RESERVED_PAYMENT_LST');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'P_PAYMENT_ORDER');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_NVLTOOWNCODE');
TaskInsertComponent('TSK_DOCPACK_PAYMENTS_LST', 'FDC_PAYMENT_DEDUCTION_ALL_LST');

-- Документы - Уведомления - просмотр
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_OBJECT_GET_BYSYSNAME');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_ADVICE_CHARGE_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_ADVICE_DEDUCTION_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_ADVICE_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_ADVICE_PAY_PERIODIC_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_DECL_HAS_DEBT');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_DECL_HAS_ERROR');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_NOTICEPAY_CHARGE_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_ADVICE_RESERVE_LST' );
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_DEC_DEBTS_OVERPAY_LST' );
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_DECISION_PAYMENT_LST' );
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_DEC_PAYVACK_PERIODIC_LST' );
TaskInsertComponent('TSK_DOCUMENT_ADVICE_LST', 'FDC_REL_ADVICE_DEC_LST' );

-- Документы - Уведомления - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_ADVICE_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_ADVICE_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_ADVICE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_ADVICE_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_RMANREF_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_RMANREF_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_UPD' , 'FDC_ADVICE_RESERVE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_LST' , 'FDC_DEC_DEBTS_OVERPAY_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_LST' , 'FDC_DECISION_PAYMENT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_LST' , 'FDC_DEC_PAYVACK_PERIODIC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_ADVICE_LST' , 'FDC_REL_ADVICE_DEC_LST' );

-- Документы - Перезачет на таможню - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_DOC_REUSE_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_VALUESTRING_SYS_GET'); 
TaskInsertComponent ( 'TSK_DOCUMENT_CUSTOM_REUSE_LST' , 'FDC_DEDUCTION_REUSE_LST'); 

-- Документы - Перезачет на таможню - ведение

-- Документы - Решения о зачете в счет погашения задолженности - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_DECISION_DEBTS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_LST' , 'FDC_VALUE_LST'); 

-- Документы - Решения о зачете в счет погашения задолженности - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECISION_DEBTS_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECISION_DEBTS_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECISION_DEBTS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECISION_DEBTS_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_RMANREF_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_RMANREF_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_DEBTS_UPD' , 'FDC_VALUE_LST'); 

-- Документы - Решения о возврате - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_ASSETS_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_VALUE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_LST' , 'FDC_PAYBACK_RESERVE_LST'); 

-- Документы - Решения о возврате - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECISION_PAYBACK_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECISION_PAYBACK_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECISION_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECISION_PAYBACK_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_ADVANCE_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_ADVANCE_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_DEPOSIT_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_DEPOSIT_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_LEVY_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_LEVY_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_PAY_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_PAY_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_PAYMENTS_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_PERIODIC_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_PERIODIC_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_356_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_DEC_PAYBACK_356_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_OBJECT_UPD_STATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_RMANREF_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_RMANREF_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'FDC_VALUE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYBACK_UPD' , 'P_PAYMENT_HELPER'); 

-- Документы - Решения о зачете в счет таможенных платежей - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DEBT_TYPES_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DECISION_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_VALUE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DEC_PAYMENT_DEPOSIT_LST');
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_LST' , 'FDC_DEC_PAYMENT_PERIODIC_LST');

-- Документы - Решения о зачете в счет таможенных платежей - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DEBT_TYPES_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECISION_PAYMENT_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECISION_PAYMENT_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECISION_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECISION_PAYMENT_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_RMANREF_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_RMANREF_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_DEC_PAYMENT_UPD' , 'FDC_VALUE_LST'); 

-- Документы - Прочие списания - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_LST' , 'FDC_SUBJECT_FEE_LST'); 

-- Документы - Прочие списания - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_ADVICE_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_ADVICE_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_ADVICE_PAY_PERIODIC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_CUSTOM_DECL_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_KIND_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_NOTICEPAY_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_SUBJECT_FEE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_FEE_UPD' , 'P_SUBJECT_FEE'); 

-- Документы - ГТД - закрытие временной ГТД
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_CLOSE' , 'FDC_CUSTOM_DECL_UNDO_CLOSE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_CLOSE' , 'FDC_REUSE_GET_LIST'); 

-- Документы - ГТД - исправление ошибок
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_DECL_CHECK_PAYMENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_DECL_PREPARE_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_REGISTRY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'P_CDECL_LOADER_EX'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_ERROR' , 'P_PAYMENT_HELPER'); 

-- Документы - ГТД - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLPLATR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLPLATV'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLPREDD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLSLOTM'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLTECHD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLTOVAR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLTRANS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLUSL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKISCH'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKKUPL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKOPRP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DK_PP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DK1'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_ADV_DECL_FEATURE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CUSTOM_DECL_TEMP_ADM_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_GET_PERIODIC_BY_MONTH'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_PERIODIC_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_REPAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CORRECTION_CD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CORRECTION_GTD_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CORRECTION_GTD_CCHARGE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_CORRECTION_GTD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_VALUEDATETIME_SYS_GET' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DCLPREDD' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_GET_PERIODIC_BY_MONTH' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_HAS_ERROR' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_DECL_HAS_DEBT' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_GET_DECL_GOOD_PROC' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'P_CUSTOM_DECL' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'FDC_PERIODIC_CHARGE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DK_PP' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKISCH' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKKUPL' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_LST' , 'DBF_DKOPRP' );

-- Документы - ГТД - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_ADV_DECL_FEATURE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_ADVICE_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_ADVICE_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_ADVICE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_ADVICE_PAY_PERIODIC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_TEMP_ADM_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_CLOSE_W_ADVICE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_UNDO_CLOSE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_DECL_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_CHECK_PAYMENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_PAY_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_PREPARE_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_REMOVE_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_SET_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_KIND_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NOTICEPAY_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NOTICEPAY_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NOTICEPAY_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NOTICEPAY_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NOTICEPAY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_OBJECT_ADD_KIND_BYSYSNAME'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_REPAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'P_REPAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CORRECTION_CD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CORRECTION_GTD_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CORRECTION_GTD_CCHARGE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_CORRECTION_GTD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_VALUEDATETIME_SYS_GET' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_DCLPREDD' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'P_CORRECTION_GTD' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_GET_PERIODIC_BY_MONTH' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_HAS_ERROR' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_DECL_HAS_DEBT' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_GET_DECL_GOOD_PROC' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'P_CUSTOM_DECL' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'FDC_PERIODIC_CHARGE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_DK_PP' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_DKISCH' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_DKKUPL' );
TaskInsertComponent ( 'TSK_DOCUMENT_GTD_UPD' , 'DBF_DKOPRP' );

-- Документы - Требования об уплате - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_ADVICE_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_DECL_HAS_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_DECL_HAS_ERROR'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_NOTICEPAY_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_NOTICEPAY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_LST' , 'FDC_SUBJECT_LST'); 

-- Документы - Требования об уплате - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_NOTICEPAY_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_NOTICEPAY_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_NOTICEPAY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_NOTICEPAY_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_RMANREF_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_NOTICEPAY_UPD' , 'FDC_RMANREF_DEL'); 

-- Документы - Возвраты - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_LST' , 'FDC_DECLARANT_ACCOUNT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_LST' , 'FDC_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_LST' , 'FDC_SUBJECT_LST'); 

-- Документы - Возвраты - отправка/отмена
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_SEND' , 'FDC_PAYBACK_CANCEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_SEND' , 'FDC_PAYBACK_SEND'); 

-- Документы - Возвраты - ведение
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_BANK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_DECLARANT_ACCOUNT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_DECLARANT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_PAYBACK_PAYMENT_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYBACK_UPD' , 'P_PAYBACK'); 

-- Документы - Платежи учВЭД - заверение
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_COMMIT' , 'FDC_PAYMENT_ORDER_ASSURE'); 

-- Документы - Платежи учВЭД - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CURRENCY_USABLE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_FOR_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_FOR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER_AGG_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER_CNFRM_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAY_ORDER_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_RESERVED_FOR_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_REL_PACK_DOCS_LST');
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER_NON_ID_LST');
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'P_PAYMENT_ORDER' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_DECISION_FOR_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_RESERVED_PAYMENT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_PAYMENT_ORDER_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CORRECTION_PO_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CORRECTION_PO_BACK_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CORRECTION_PO_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CORRECTION_PO_SUM_LIGHT' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_LST' , 'FDC_CORRECTION_PO_SUM_LST' );

-- Документы - Платежи учВЭД - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CASHDESK_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CURRENCY_USABLE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_AGG_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_CNFRM_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAY_ORDER_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'P_PAYMENT_ORDER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_DECISION_FOR_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_RESERVED_PAYMENT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_PAYMENT_ORDER_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CORRECTION_PO_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CORRECTION_PO_BACK_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CORRECTION_PO_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CORRECTION_PO_SUM_LIGHT' );
TaskInsertComponent ( 'TSK_DOCUMENT_PAYMENTORDER_UPD' , 'FDC_CORRECTION_PO_SUM_LST' );

-- Документы - Реестры КНП - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'DBF_R_SGL2'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'DBF_R_SGL3'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'FDC_AGREEMENT_REGISTRY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_LST' , 'FDC_DECL_PAYMENT_LST'); 

-- Документы - Реестры КНП - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_AGREEMENT_REGISTRY_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'P_ARGMT_LOADER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'P_LOADER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REGISTER_BP_UPD' , 'P_PAYMENT_HELPER'); 

-- Документы - Перезачет - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_LST' , 'FDC_REUSE_PAYORDER_LST'); 

-- Документы - Перезачет - смена статуса
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_STATE' , 'FDC_OBJECT_UPD_STATE'); 

-- Документы - Перезачет - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_ADD_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_DEL_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_REUSE_PAYORDER_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_REUSEPAYORDER_UPD' , 'FDC_SUBJECT_LST'); 

-- Документы - ТПО - исправление ошибок
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_DECL_CHECK_PAYMENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_DECL_PREPARE_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_REGISTRY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'P_CDECL_LOADER_EX'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_ERROR' , 'P_PAYMENT_HELPER'); 

-- Документы - ТПО - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_AUD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_CLIENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_DOC'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_DOP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_FIZLIC'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_GOODS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_ITP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_PLT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_PLTPERIO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'DBF_TPO_TDOP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_TPO_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'P_DATEUTILS');
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_REL_OVERRIDE_DOC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CUSTOM_DECL_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CORRECTION_CD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CORRECTION_TPO_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CORRECTION_TPO_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_LST' , 'FDC_CORRECTION_TPO_CCHARGE_LST' );

-- Документы - ТПО - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_ADVICE_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_ADVICE_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_ADVICE_PAY_PERIODIC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_BP_LICENCE_BROKER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_BP_LICENCE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_PAY_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_REMOVE_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_DECL_SET_KNP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_KIND_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_NOTICEPAY_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_NOTICEPAY_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_TPO_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_TPO_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_TPO_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_TPO_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_REL_OVERRIDE_DOC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CUSTOM_DECL_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CORRECTION_CD_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CORRECTION_TPO_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CORRECTION_TPO_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TPO_UPD' , 'FDC_CORRECTION_TPO_CCHARGE_LST' );

-- Документы - ТР,ТПО - анулирование
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ABORT' , 'FDC_SET_OBJECT_ANNUL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ABORT' , 'FDC_SET_TR_STATE_ANNUL'); 

-- Документы - ТР - исправление ошибок
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_DECL_CHECK_PAYMENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_DECL_PREPARE_PAYMENT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_REGISTRY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'P_CDECL_LOADER_EX'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'P_CUSTOM_DECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_ERROR' , 'P_PAYMENT_HELPER'); 

-- Документы - ТР - просмотр
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_AUD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_CLIENTS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_DOC'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_DOP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_FIZLIC'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_GOODS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_ITP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_PLT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_PLTPERIO'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'DBF_TPO_TDOP'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECL_DEBT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_TR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'P_DATEUTILS'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_CUSTOM_DECL_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_PAYMENT_DEDUCTION_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_RESERVED_FOR_REUSE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DEDUCTION_FOR_REUSE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_PAYBACK_RESERVE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_VALUE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_REL_OVERRIDE_DOC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_REL_TR_DEC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DEC_DEBTS_DEPOSIT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DEC_PAYMENT_DEPOSIT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_LST' , 'FDC_DEC_PAYBACK_DEPOSIT_LST' );

-- Документы - ТР,ТПО - погашение
TaskInsertComponent ( 'TSK_DOCUMENT_TR_PAYOFF' , 'FDC_SET_TR_STATE_PAYOFF'); 

-- Документы - ТР - корректировка
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'DBF_PP_PLT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_ADVICE_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_ADVICE_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_ADVICE_PAY_PERIODIC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_CC_REASON_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECISION_QUALIFIER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECL_GET_RATE_DATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECL_GOODS_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_GOODS_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_KIND_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_MODIFY_CHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_NOTICEPAY_ADDCHARGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_NOTICEPAY_ADDCHARGEFORDECL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_RESERVED_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_TR_ADD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_TR_DEL'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_TR_LST'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_TR_UPD'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'P_DECL_CHANGE'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'P_PAYMENT_HELPER'); 
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_CUSTOM_DECL_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYMENT_DEDUCTION_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_RESERVED_FOR_REUSE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DEDUCTION_FOR_REUSE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_PAYBACK_RESERVE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_VALUE_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_REL_OVERRIDE_DOC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_REL_TR_DEC_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DEC_DEBTS_DEPOSIT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DEC_PAYMENT_DEPOSIT_LST' );
TaskInsertComponent ( 'TSK_DOCUMENT_TR_UPD' , 'FDC_DEC_PAYBACK_DEPOSIT_LST' );

-- Импорт - ввод задолженностей
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'DBF_DEBTS_D_Z'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'DBF_DEBTS_LOADS_LST'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'DBF_DEBTS_R_Z'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'DBF_DEBTS_S_Z'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'DBF_DEBTS_V_Z'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'P_DEBT'); 
TaskInsertComponent ( 'TSK_IMPORT_DEBTS' , 'P_LOADER'); 

-- Импорт таможенных документов - ввод ГТД и ДК
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLHEAD'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLHEAD_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLPLATR'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLPLATV'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLPREDD'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLSLOTM'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLSUMPP'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLTECHD'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLTOVAR'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLTRANS'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'DBF_DCLUSL'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'P_CDECL_LOADER_EX'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_GTD' , 'P_LOADER'); 

-- Импорт таможенных документов - ввод ТПО
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_AUD'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_CLIENTS'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_DOC'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_DOP'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_FIZLIC'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_GOODS'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_ITP'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_OKPO'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_PLT'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_PLTPERIO'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'DBF_TPO_TDOP'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'FDC_TPO_OTVET_ERROR'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'FDC_TPO_OTVET_ERROR_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'FDC_TPO_OTVET_ERROR_TABLE'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'P_LOADER'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TPO' , 'P_TPO_LOADER'); 

-- Импорт таможенных документов - ввод ТР
TaskInsertComponent ( 'TSK_IMPORTDOC_TR' , 'DBF_TPO_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TR' , 'FDC_CUSTOM_DECL_ERROR_LST'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TR' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TR' , 'P_LOADER'); 
TaskInsertComponent ( 'TSK_IMPORTDOC_TR' , 'P_TPO_LOADER'); 

-- Импорт НСИ - ввод видов таможенных деклараций
TaskInsertComponent ( 'TSK_IMPORTNSI_ADVDECLFEATURE' , 'DBF_NSI_INF1TD_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ADVDECLFEATURE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ADVDECLFEATURE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ADVDECLFEATURE' , 'P_LOADER'); 

-- Импорт НСИ - ввод решений ТО по ДС
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DECISION' , 'DBF_ASSETS_DECISION_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DECISION' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DECISION' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DECISION' , 'P_LOADER'); 

-- Импорт НСИ - ввод справочника возвратов\зачетов ДС
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DICT' , 'DBF_ASSETS_DICT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DICT' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DICT' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_DICT' , 'P_LOADER'); 

-- Импорт НСИ - ввод оснований для возвратов\зачетов ДС
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_REASON' , 'DBF_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_REASON' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_REASON' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_ASSETS_REASON' , 'P_LOADER'); 

-- Импорт НСИ - ввод банков
TaskInsertComponent ( 'TSK_IMPORTNSI_BANK' , 'DBF_NSI_BANKLIST_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BANK' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BANK' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BANK' , 'P_LOADER'); 

-- Импорт НСИ - ввод брокеров
TaskInsertComponent ( 'TSK_IMPORTNSI_BROKER' , 'DBF_NSI_TBROK_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BROKER' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BROKER' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_BROKER' , 'P_LOADER'); 

-- Импорт НСИ - ввод категорий субъектов

-- Импорт НСИ - ввод ставок ЦБ
TaskInsertComponent ( 'TSK_IMPORTNSI_CBRATE' , 'DBF_NSI_PRCB_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CBRATE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CBRATE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CBRATE' , 'P_LOADER'); 

-- Импорт НСИ - ввод кодов стран
TaskInsertComponent ( 'TSK_IMPORTNSI_COUNTRYCODE' , 'DBF_NSI_OKSMT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_COUNTRYCODE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_COUNTRYCODE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_COUNTRYCODE' , 'P_LOADER'); 

-- Импорт НСИ - ввод курсов валют
TaskInsertComponent ( 'TSK_IMPORTNSI_CURRRATE' , 'DBF_NSI_VALUTA_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CURRRATE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CURRRATE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CURRRATE' , 'P_LOADER'); 

-- Импорт НСИ - ввод видов таможенных режимов
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMMODE' , 'DBF_NSI_OTAMREG_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMMODE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMMODE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMMODE' , 'P_LOADER'); 

-- Импорт НСИ - ввод таможен
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMS' , 'DBF_NSI_KTAM_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMS' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMS' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_CUSTOMS' , 'P_LOADER'); 

-- Импорт НСИ - ввод причин возникновения задолженности
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_REASON' , 'DBF_DEBT_REASON_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_REASON' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_REASON' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_REASON' , 'P_LOADER'); 

-- Импорт НСИ - ввод типов задолженности
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_TYPES' , 'DBF_DEBT_TYPES_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_TYPES' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_TYPES' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DEBT_TYPES' , 'P_LOADER'); 

-- Импорт НСИ - ввод решений, принимаемых таможенными органами
TaskInsertComponent ( 'TSK_IMPORTNSI_DECISION_QUALIFIER' , 'DBF_NSI_RESHEN_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECISION_QUALIFIER' , 'DBF_REZULTTO_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECISION_QUALIFIER' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECISION_QUALIFIER' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECISION_QUALIFIER' , 'P_LOADER'); 

-- Импорт НСИ - ввод участников ВЭД
TaskInsertComponent ( 'TSK_IMPORTNSI_DECLARANT' , 'DBF_NSI_REG_TI_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECLARANT' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECLARANT' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_DECLARANT' , 'P_LOADER'); 

-- Импорт НСИ - ввод видов документов удостоверяющих личность
TaskInsertComponent ( 'TSK_IMPORTNSI_PASSPORTTYPE' , 'DBF_NSI_NS_DUL_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PASSPORTTYPE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PASSPORTTYPE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PASSPORTTYPE' , 'P_LOADER'); 

-- Импорт НСИ - ввод видов платежей
TaskInsertComponent ( 'TSK_IMPORTNSI_PAYMENTTYPE' , 'DBF_NSI_TAMPLAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PAYMENTTYPE' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PAYMENTTYPE' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_PAYMENTTYPE' , 'P_LOADER'); 

-- Импорт НСИ - ввод валюты
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'DBF_NSI_VALNAME_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'P_LOADER'); 

-- Импорт НСИ - КБК
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'DBF_NSI_KBK_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'FDC_LOAD_STAT_LST'); 
TaskInsertComponent ( 'TSK_IMPORTNSI_VALUTA' , 'P_LOADER'); 

-- Импорт платежных документов - ввод КО
TaskInsertComponent ( 'TSK_IMPORTPAY_KO' , 'FDC_CASHDESK_LST'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_KO' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_KO' , 'P_DOCUMENT_LOADER'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_KO' , 'P_LOADER'); 

-- Импорт платежных документов - ввод пп
TaskInsertComponent ( 'TSK_IMPORTPAY_PAYMENTORDER' , 'DBF_INFS'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_PAYMENTORDER' , 'DBF_PAYS'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_PAYMENTORDER' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_PAYMENTORDER' , 'P_LOADER'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_PAYMENTORDER' , 'P_PAYS_LOADER'); 

-- Импорт платежных документов - ввод ТК
TaskInsertComponent ( 'TSK_IMPORTPAY_TK' , 'DBF_CUSTOM_PAYS'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_TK' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_TK' , 'P_DOCUMENT_LOADER'); 
TaskInsertComponent ( 'TSK_IMPORTPAY_TK' , 'P_LOADER'); 

-- Импорт - ввод подтвержденных возвратов
TaskInsertComponent ( 'TSK_IMPORT_RETY' , 'FDC_LOAD_DBF'); 
TaskInsertComponent ( 'TSK_IMPORT_RETY' , 'P_DOCPACK_RETURNSY'); 
TaskInsertComponent ( 'TSK_IMPORT_RETY' , 'P_LOADER'); 

-- Главная книга - Оперативный баланс таможни (новый ) - просмотр
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DICT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_SUBJECT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_BUDGET_PAYMENT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_KBK_DICT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_LIGHT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_CURRENCY_USABLE_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DOCUMENT_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DOC_ACTIVATE_ERROR_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DOC_PACK_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DOC_PACK_REUSE_Y_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_INITIAL_REST_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_ORDER_ALL_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_ORDER_NON_ID_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_ORDER_PAYBACK_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_REL_OPER_ACC_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_REL_PACK_DOCS_LST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_INITIAL_REST');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_BALANCE');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_REG');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_REG_KBK');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_ACC_REG_SUBJECT');
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_OBJECT_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_PAYMENT_ORDER_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_CANCEL_DEC_PAYBACK_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_LST' , 'FDC_DOC_PACK_RETURNS_LST' );

-- Главная книга - Оперативный баланс таможни (новый) - корректировка
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_BALANCE'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_LIGHT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_REG'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_REG_KBK'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_REG_SUBJECT'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_ACC_TRANSACTION_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_BUDGET_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_CURRENCY_USABLE_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOC_ACTIVATE_ERROR_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOC_PACK_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOCUMENT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOCUMENTS_DO_ACTIVATE'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOCUMENTS_DO_DEACTIVATE'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_INITIAL_REST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_INITIAL_REST_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_REL_OPER_ACC_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_REL_PACK_DOCS_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_VALUE_LST_SYS'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'P_DOCUMENT'); 
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_OBJECT_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_PAYMENT_ORDER_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_CANCEL_DEC_PAYBACK_LST' );
TaskInsertComponent ( 'TSK_MAINBOOK_ACCTURNOVER_UPD' , 'FDC_DOC_PACK_RETURNS_LST' );

-- Главная книга - Закрыть период
TaskInsertComponent ( 'TSK_MAINBOOK_CLOSEDAY' , 'FDC_SET_LAST_CLOSED_DAY'); 

-- Главная книга - Балансы подчиненных ТО - просмотр
TaskInsertComponent('TSK_MAINBOOK_DOCCHILDSBALANCE_LST', 'FDC_CUSTOMS_LST');
TaskInsertComponent('TSK_MAINBOOK_DOCCHILDSBALANCE_LST', 'FDC_DOC_CHILDS_BALANCE_LST');

-- Главная книга - Балансы подчиненных ТО - корректировка
TaskInsertComponent('TSK_MAINBOOK_DOCCHILDSBALANCE_UPD', 'FDC_CUSTOMS_LST');
TaskInsertComponent('TSK_MAINBOOK_DOCCHILDSBALANCE_UPD', 'FDC_DOC_CHILDS_BALANCE_LST');
TaskInsertComponent('TSK_MAINBOOK_DOCCHILDSBALANCE_UPD', 'P_DOC_CHILDS_BALANCE');

-- Главная книга - Оборотные ведомости - просмотр
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_KBK_DICT_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_CURRENCY_USABLE_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_REG');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_REG_KBK');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_REG_SUBJECT');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_NSI_REPORT_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_PAYMENT_DEDUCTION_ALL_LST');
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_DOCUMENT_LST' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_ACC_TRANSACTION' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_CHECK_TURNOVER_DATES' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_PAYMENT_ORDER_ALL_LST' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_PERSON_LST' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_CANCEL_DECISION_PAYBACK' );
TaskInsertComponent('TSK_MAINBOOK_TURNOVERSHEETS_LST', 'FDC_DICT' );

-- НСИ - Решения ТО по ДС - просмотр
TaskInsertComponent ( 'TSK_NSI_ASSETS_DECISION_LST' , 'FDC_ASSETS_DECISION_LST'); 

-- НСИ - Решения ТО по ДС - корректировка
TaskInsertComponent ( 'TSK_NSI_ASSETS_DECISION_UPD' , 'FDC_ASSETS_DECISION_ADD'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DECISION_UPD' , 'FDC_ASSETS_DECISION_DEL'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DECISION_UPD' , 'FDC_ASSETS_DECISION_LST'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DECISION_UPD' , 'FDC_ASSETS_DECISION_UPD'); 

-- НСИ - Справочник возвратов\зачетов - просмотр
TaskInsertComponent ( 'TSK_NSI_ASSETS_DICT_LST' , 'FDC_ASSETS_DICT_LST'); 

-- НСИ - Справочник возвратов\зачетов - корректировка
TaskInsertComponent ( 'TSK_NSI_ASSETS_DICT_UPD' , 'FDC_ASSETS_DICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DICT_UPD' , 'FDC_ASSETS_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DICT_UPD' , 'FDC_ASSETS_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_DICT_UPD' , 'FDC_ASSETS_DICT_UPD'); 

-- НСИ - Основания для возвратов\зачетов - просмотр
TaskInsertComponent ( 'TSK_NSI_ASSETS_REASON_LST' , 'FDC_ASSETS_REASON_LST'); 

-- НСИ - Основания для возвратов\зачетов - корректировка
TaskInsertComponent ( 'TSK_NSI_ASSETS_REASON_UPD' , 'FDC_ASSETS_REASON_ADD'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_REASON_UPD' , 'FDC_ASSETS_REASON_DEL'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_REASON_UPD' , 'FDC_ASSETS_REASON_LST'); 
TaskInsertComponent ( 'TSK_NSI_ASSETS_REASON_UPD' , 'FDC_ASSETS_REASON_UPD'); 

-- НСИ - Банки - просмотр
TaskInsertComponent ( 'TSK_NSI_BANK_LST' , 'FDC_BANK_LST'); 

-- НСИ - Банки - корректировка
TaskInsertComponent ( 'TSK_NSI_BANK_UPD' , 'FDC_BANK_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BANK_UPD' , 'FDC_BANK_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BANK_UPD' , 'FDC_BANK_LST'); 
TaskInsertComponent ( 'TSK_NSI_BANK_UPD' , 'FDC_BANK_UPD'); 

-- НСИ - Крупные плательщики - просмотр
TaskInsertComponent ( 'TSK_NSI_BIGPAYER_LST' , 'FDC_BIG_PAYER_LST'); 

-- НСИ - Крупные плательщики - корректировка
TaskInsertComponent ( 'TSK_NSI_BIGPAYER_UPD' , 'FDC_BIG_PAYER_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BIGPAYER_UPD' , 'FDC_BIG_PAYER_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BIGPAYER_UPD' , 'FDC_BIG_PAYER_LST'); 
TaskInsertComponent ( 'TSK_NSI_BIGPAYER_UPD' , 'FDC_BIG_PAYER_UPD'); 

-- НСИ - Соглашения КНП - просмотр
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_LST' , 'FDC_BP_AGREEMENT_LST'); 

-- НСИ - Соглашения КНП - ведение
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_UPD' , 'FDC_BP_AGREEMENT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_UPD' , 'FDC_BP_AGREEMENT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_UPD' , 'FDC_BP_AGREEMENT_LST'); 
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_UPD' , 'FDC_BP_AGREEMENT_UPD'); 
TaskInsertComponent ( 'TSK_NSI_BP_AGREEMENT_UPD' , 'FDC_SUBJECT_LST'); 

-- НСИ - Распоряжения КНП - просмотр
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_LST' , 'FDC_BP_LICENCE_BROKER_LST'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_LST' , 'FDC_BP_LICENCE_LST'); 

-- НСИ - Распоряжения КНП - ведение
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_BROKER_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_BROKER_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_BROKER_LST'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_LST'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_BP_LICENCE_UPD'); 
TaskInsertComponent ( 'TSK_NSI_BP_LICENCE_UPD' , 'FDC_SUBJECT_LST'); 

-- НСИ - Брокеры - просмотр
TaskInsertComponent ( 'TSK_NSI_BROKER_LST' , 'FDC_BROKER_LST'); 

-- НСИ - Брокеры - корректировка
TaskInsertComponent ( 'TSK_NSI_BROKER_UPD' , 'FDC_BROKER_ADD'); 
TaskInsertComponent ( 'TSK_NSI_BROKER_UPD' , 'FDC_BROKER_DEL'); 
TaskInsertComponent ( 'TSK_NSI_BROKER_UPD' , 'FDC_BROKER_LST'); 
TaskInsertComponent ( 'TSK_NSI_BROKER_UPD' , 'FDC_BROKER_UPD'); 
TaskInsertComponent ( 'TSK_NSI_BROKER_UPD' , 'FDC_SUBJECT_DEL'); 

-- НСИ - Категории субъектов - просмотр
TaskInsertComponent ( 'TSK_NSI_CATEGORY_LST' , 'FDC_SUBJECT_CATEGORY_LST'); 

-- НСИ - Категории субъектов - корректировка
TaskInsertComponent ( 'TSK_NSI_CATEGORY_UPD' , 'FDC_NSIDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_CATEGORY_UPD' , 'FDC_NSIDICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_CATEGORY_UPD' , 'FDC_NSIDICT_UPD'); 
TaskInsertComponent ( 'TSK_NSI_CATEGORY_UPD' , 'FDC_SUBJECT_CATEGORY_LST'); 

-- НСИ - Ставка ЦБ - просмотр
TaskInsertComponent ( 'TSK_NSI_CBRATE_LST' , 'FDC_NSI_REFINANCING_RATE_LST'); 

-- НСИ - Ставка ЦБ - корректировка
TaskInsertComponent ( 'TSK_NSI_CBRATE_UPD' , 'FDC_NSI_REFINANCING_RATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_CBRATE_UPD' , 'P_NSI_REFINANCING_RATE'); 

-- НСИ - Коды стран - просмотр
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_LST' , 'FDC_COUNTRY_CODE_LST'); 

-- НСИ - Коды стран - корректировка
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_UPD' , 'FDC_COUNTRY_CODE_ADD'); 
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_UPD' , 'FDC_COUNTRY_CODE_DEL'); 
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_UPD' , 'FDC_COUNTRY_CODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_UPD' , 'FDC_COUNTRY_CODE_UPD'); 
TaskInsertComponent ( 'TSK_NSI_COUNTRY_CODE_UPD' , 'FDC_NSIDICT_DEL'); 

-- НСИ - Валюта курс - просмотр
TaskInsertComponent ( 'TSK_NSI_CURRRATE_LST' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_NSI_CURRRATE_LST' , 'FDC_NSI_CURR_RATE_LST'); 

-- НСИ - Валюта курс - корректировка
TaskInsertComponent ( 'TSK_NSI_CURRRATE_UPD' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_NSI_CURRRATE_UPD' , 'FDC_NSICURRENCY_RATE_ADD'); 
TaskInsertComponent ( 'TSK_NSI_CURRRATE_UPD' , 'FDC_NSICURRENCY_RATE_DEL'); 
TaskInsertComponent ( 'TSK_NSI_CURRRATE_UPD' , 'FDC_NSICURRENCY_RATE_UPD'); 
TaskInsertComponent ( 'TSK_NSI_CURRRATE_UPD' , 'FDC_NSI_CURR_RATE_LST'); 

-- НСИ - Таможенные режимы - просмотр
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_LST' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_LST' , 'FDC_NSI_DICT_LST'); 

-- НСИ - Таможенные режимы - ведение
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_UPD' , 'FDC_CUSTOM_MODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_UPD' , 'FDC_NSIDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_UPD' , 'FDC_NSIDICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOM_MODE_UPD' , 'FDC_NSIDICT_UPD'); 

-- НСИ - Виды таможенных деклараций - просмотр
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_DECL_TYPE_LST' , 'FDC_ADV_DECL_FEATURE_LST'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_DECL_TYPE_LST' , 'FDC_NSI_DICT_LST'); 

-- НСИ - Виды таможенных деклараций - корректировка
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_DECL_TYPE_UPD' , 'FDC_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_DECL_TYPE_UPD' , 'FDC_NSIDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_DECL_TYPE_UPD' , 'FDC_NSIDICT_UPD'); 

-- НСИ - Таможни - просмотр
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_LST' , 'FDC_CUSTOMS_LST'); 

-- НСИ - Таможни - корректировка
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_UPD' , 'FDC_CUSTOMS_ADD'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_UPD' , 'FDC_CUSTOMS_DEL'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_UPD' , 'FDC_CUSTOMS_LST'); 
TaskInsertComponent ( 'TSK_NSI_CUSTOMS_UPD' , 'FDC_CUSTOMS_UPD'); 

-- НСИ - Задолженность - просмотр
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_BASISOFREMOV_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_BUSICDOCS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_COMMONSTATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_CURRSTOFCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_MEASONCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_LST' , 'FDC_DEBTS_DIC_REPAYMENTFRM_LST'); 

-- НСИ - Причины возникновения задолженности - просмотр
TaskInsertComponent ( 'TSK_NSI_DEBT_REASON_LST' , 'FDC_DEBT_REASON_LST'); 

-- НСИ - Причины возникновения задолженности - корректировка
TaskInsertComponent ( 'TSK_NSI_DEBT_REASON_UPD' , 'FDC_DEBT_REASON_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_REASON_UPD' , 'FDC_DEBT_REASON_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_REASON_UPD' , 'FDC_DEBT_REASON_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_REASON_UPD' , 'FDC_DEBT_REASON_UPD'); 

-- НСИ - Типы задолженности - просмотр
TaskInsertComponent ( 'TSK_NSI_DEBT_TYPES_LST' , 'FDC_DEBT_TYPES_LST'); 

-- НСИ - Типы задолженности - корректировка
TaskInsertComponent ( 'TSK_NSI_DEBT_TYPES_UPD' , 'FDC_DEBT_TYPES_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_TYPES_UPD' , 'FDC_DEBT_TYPES_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_TYPES_UPD' , 'FDC_DEBT_TYPES_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_TYPES_UPD' , 'FDC_DEBT_TYPES_UPD'); 

-- НСИ - Задолженность - корректировка
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_BASISOFREMOV_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_BUSICDOCS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_COMMONSTATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_CURRSTOFCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_MEASONCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DEBTS_DIC_REPAYMENTFRM_LST'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DEBT_UPD' , 'FDC_DICT_UPD'); 

-- НСИ - Решения, принимаемые таможенными органами - просмотр
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_LST' , 'FDC_DECISION_QUALIFIER_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_LST' , 'FDC_REZULTTO_LST'); 

-- НСИ - Решения, принимаемые таможенными органами - корректировка
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_DECISION_QUALIFIER_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_DECISION_QUALIFIER_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_DECISION_QUALIFIER_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_DECISION_QUALIFIER_UPD'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_REZULTTO_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_REZULTTO_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_REZULTTO_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECISION_QUALIFIER_UPD' , 'FDC_REZULTTO_UPD'); 

-- НСИ - Участники ВЭД банковские счета - просмотр
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_LST' , 'FDC_DECLARANT_ACCOUNT_LST'); 

-- НСИ - Участники ВЭД банковские счета - корректировка
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_UPD' , 'FDC_DECLARANT_ACCOUNT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_UPD' , 'FDC_DECLARANT_ACCOUNT_ADDEX'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_UPD' , 'FDC_DECLARANT_ACCOUNT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_UPD' , 'FDC_DECLARANT_ACCOUNT_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_ACCOUNT_UPD' , 'FDC_DECLARANT_ACCOUNT_UPD'); 

-- НСИ - Участники ВЭД - просмотр
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_D_Z'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_LOADS'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_LOADS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_R_Z'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_S_Z'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'DBF_DEBTS_V_Z'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_COUNTRY_CODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DEBTS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_BASISOFREMOV_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_BUSICDOCS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_COMMONSTATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_CURRSTOFCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_MEASONCOLL_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_OCCURREASONS_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_DIC_REPAYMENTFRM_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_KBK_STATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_LOAD_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_OFFSET_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_REL_DEBTS_LOAD_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DEBTS_STATE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_DECLARANT_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_VALUENUMBER_SYS_GET'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_LST' , 'FDC_VALUESTRING_SYS_GET'); 

-- НСИ - Участники ВЭД - корректировка
TaskInsertComponent ( 'TSK_NSI_DECLARANT_UPD' , 'FDC_COUNTRY_CODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_UPD' , 'FDC_DECLARANT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_UPD' , 'FDC_DECLARANT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_UPD' , 'FDC_DECLARANT_LST'); 
TaskInsertComponent ( 'TSK_NSI_DECLARANT_UPD' , 'FDC_DECLARANT_UPD'); 

-- НСИ - КБК - просмотр
TaskInsertComponent ( 'TSK_NSI_KBK_LST' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_KBK_LST' , 'FDC_NSI_DICT_LST'); 

-- НСИ - КБК - корректировка
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_KBKDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_KBKDICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_KBKDICT_UPD'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_NSIDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_NSI_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_KBK_UPD' , 'FDC_NSIDICT_UPD'); 

-- НСИ - Виды документов, удостоверяющих личность - просмотр
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_LST' , 'FDC_PASSPORT_TYPE_LST'); 

-- НСИ - Виды документов, удостоверяющих личность - корректировка
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_UPD' , 'FDC_DICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_UPD' , 'FDC_PASSPORT_TYPE_ADD'); 
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_UPD' , 'FDC_PASSPORT_TYPE_DEL'); 
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_UPD' , 'FDC_PASSPORT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_NSI_PASSPORT_TYPE_UPD' , 'FDC_PASSPORT_TYPE_UPD'); 

-- НСИ - Виды платежей - просмотр
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_LST' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_LST' , 'FDC_PAYMENT_TYPE_LST'); 

-- НСИ - Виды платежей - корректировка
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_UPD' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_UPD' , 'FDC_NSIDICT_ADD'); 
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_UPD' , 'FDC_NSIDICT_DEL'); 
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_UPD' , 'FDC_NSIDICT_UPD'); 
TaskInsertComponent ( 'TSK_NSI_PAYMENTTYPE_UPD' , 'FDC_PAYMENT_TYPE_LST'); 

-- НСИ - Физ.Лица - просмотр
TaskInsertComponent ( 'TSK_NSI_PERSON_LST' , 'FDC_COUNTRY_CODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_LST' , 'FDC_PASSPORT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_LST' , 'FDC_PERSON_LST'); 

-- НСИ - Физ.Лица - корректировка
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_COUNTRY_CODE_LST'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_PASSPORT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_PERSON_ADD'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_PERSON_DEL'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_PERSON_LST'); 
TaskInsertComponent ( 'TSK_NSI_PERSON_UPD' , 'FDC_PERSON_UPD'); 

-- НСИ - Валюта - просмотр
TaskInsertComponent ( 'TSK_NSI_VALUTA_LST' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_NSI_VALUTA_LST' , 'FDC_NSI_CURRENCY_LST'); 

-- НСИ - Валюта - корректировка
TaskInsertComponent ( 'TSK_NSI_VALUTA_UPD' , 'FDC_NSICURRENCY_ADD'); 
TaskInsertComponent ( 'TSK_NSI_VALUTA_UPD' , 'FDC_NSICURRENCY_DEL'); 
TaskInsertComponent ( 'TSK_NSI_VALUTA_UPD' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_NSI_VALUTA_UPD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_NSI_VALUTA_UPD' , 'FDC_NSICURRENCY_UPD'); 

-- Пакеты - Пакеты передачи - просмотр
TaskInsertComponent('TSK_PACKET_TRANSFER_LST', 'FDC_CUSTOMS_LST');
TaskInsertComponent('TSK_PACKET_TRANSFER_LST', 'FDC_DOC_PACK_TRANSFER_LST');
TaskInsertComponent('TSK_PACKET_TRANSFER_LST', 'FDC_REL_PACK_DOCS_LST');

-- Пакеты - Пакеты передачи - корректировка
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_OBJECT_UPD_STATE');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_CUSTOMS_LST');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_DP_TRANSFER_DEL');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_DOC_PACK_TRANSFER_LST');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_DP_TRANSFER_OUT_ADD');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_DP_TRANSFER_UPD');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_READ_PACK_TRANSFER');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'FDC_REL_PACK_DOCS_LST');
TaskInsertComponent('TSK_PACKET_TRANSFER_UPD', 'P_DOC_PACK_TRANSFER');

-- Доступ к объектной форме
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_ACCESS_LEVEL_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_CHECK_OBJECT_FREE'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_CURRENCY_USABLE_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_LOADER_GET_VISIBLE'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_CLEAR_VALUES'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_DEL'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_FREE'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_GRANT_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_LST_ID'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_RELATION_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_OBJECT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_STATE_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_STATE_LST_BY_OBJECT'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_STATE_TRANSIT_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEBOOL_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEBOOL_SYS_GET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEBOOL_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEBOOL_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEDATETIME_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEDATETIME_SYS_GET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEDATETIME_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEDATETIME_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_DEL'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_LST'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_LST_SYS'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUENUMBER_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUENUMBER_SYS_GET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUENUMBER_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUENUMBER_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREF_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREFFILE_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREFFILE_ADD_BYNAME'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREFFILE_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREF_SYS_GET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREF_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUEREF_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUESTRING_ADD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUESTRING_SYS_GET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUESTRING_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUESTRING_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_SYS_CHECK'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_SYS_SET'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_VALUE_UPD'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'P_PARAMS'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'P_VALUE_SYS'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_STR_AGG_TYPE'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_DOC_GET_DATE'); 
TaskInsertComponent ( 'TSK_OBJECTFORM_LST' , 'FDC_DOC_GET_NUMBER'); 

-- Возвраты - Решения о возврате - просмотр
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_VALUE_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_NSI_CURRENCY_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_NSI_DICT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_KBK_DICT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_ASSETS_DICT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_ASSETS_REASON_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_CURRENCY_USABLE_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_DECISION_PAYBACK_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_DECL_HAS_DEBT');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_DECL_HAS_ERROR');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_PAYBACK_RESERVE_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_LST', 'FDC_PAYMENT_ORDER_PAYBACK_LST');

-- Возвраты - Решения о возврате - ведение
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_BANK_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_NSI_DICT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_ASSETS_REASON_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_CURRENCY_USABLE_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DECISION_PAYBACK_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DECISION_PAYBACK_UPD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DECL_HAS_DEBT');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DECL_HAS_ERROR');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_356_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_356_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_ADVANCE_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_ADVANCE_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_DEPOSIT_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_DEPOSIT_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_LEVY_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_LEVY_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_PAY_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_PAY_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_PERIODIC_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_PERIODIC_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_TIMEOUT_ADD');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_RESERVED_PAYMENT_LST');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'P_RESERVE');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_DEC_PAYBACK_TIMEOUT_DEL');
TaskInsertComponent('TSK_PAYBACK_DECISION_UPD', 'FDC_CANCEL_DEC_PAYBACK_ADD');

-- Возвраты - Платежи по возвратам учВЭД - просмотр
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_CURRENCY_USABLE_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_FOR_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_ORDER_AGG_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_ORDER_CNFRM_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_ORDER_PAYBACK_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_PAY_ORDER_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_PAYBACK_PAYMENT_LST' , 'FDC_RESERVED_FOR_DECL_LST'); 

-- Возвраты - Платежи по возвратам учВЭД - ведение
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER_UPD');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAY_ORDER_DEDUCTION_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_CURRENCY_USABLE_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_FOR_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER3_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER_AGG_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER_CNFRM_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_PAYMENT_ORDER_PAYBACK_LST');
TaskInsertComponent('TSK_PAYBACK_PAYMENT_UPD', 'FDC_RESERVED_FOR_DECL_LST');

-- Отчет - Остатки авансовых средств
TaskInsertComponent('TSK_REPORT_ADVANCEREST', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_REPORT_ADVANCEREST', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_REPORT_ADVANCEREST', 'FDC_PAYMENT_ORDER2_LST');
TaskInsertComponent('TSK_REPORT_ADVANCEREST', 'FDC_ACC_BALANCE_SUBJECT');
TaskInsertComponent('TSK_REPORT_ADVANCEREST', 'FDC_ACC_REG_SUBJECT');

-- Отчет - Акт выверки авансовых платежей
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_DICT_GET_BYCODE');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_OBJECT_GET_NAME');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_VALUE_LST_SYS');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_NSI_CURRENCY_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYBACK_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_IS_CHILD_OF');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_DOCUMENT_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_FOR_HIST_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_ORDER2_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_PAYMENT_ORDER3_LST');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_REP_ADVANCE_PAY_DED');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_REG_SUBJECT');
TaskInsertComponent('TSK_REPORT_AVANS_CMP', 'FDC_ACC_TRANSACTION');

-- Отчет - Авансовый отчет
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_KBK_DICT_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_ACC_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_DOCUMENT_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_PAYMENT_FOR_HIST_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_PAYMENT_ORDER3_LST');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_REP_ADVANCE_PAY_DED');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'P_PAYMENT_ORDER');
TaskInsertComponent('TSK_REPORT_AVANSRASHOD', 'FDC_ACC');

-- Отчет - Крупные плательщики
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_BIG_PAYER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_BP_LICENCE_BROKER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_BP_LICENCE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_REPORTBP_ADD'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_REPORTBP_AS_DBF'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_REPORT_BP_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_REPORT_DEL'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_BIG_PAYER' , 'P_QBIGPAYER'); 

-- Отчет - Начисления и их оплата
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_DECL_CHARGE_HIST_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_NSI_CURRENCY_GET_RATE'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_OBLIGATION_DOC_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CHARGE_PAY' , 'FDC_SUBJECT_LST'); 

-- Отчет - Таможенные карты
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_ACC_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_ACC_LIGHT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_ACC_TRANSACTION_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_DOCUMENT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_CUSTOMSCARD' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - Платежи и их расход
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_OBJECT_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_SUBJECT_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_DICT_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_NSI_CURRENCY_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_ACC_TRANSACTION' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_ACC_LIGHT_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_PAYMENT_ORDER_GETRESTSUMMA' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_PAYMENT_ORDER_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_PAYMENT_FOR_HIST_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_PAYMENT_FOR_GET_REST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_REP_PAY_DEDUCTION_ALL' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_VALUE_LST' ); 
TaskInsertComponent ( 'TSK_REPORT_DEBETCREDIT' , 'FDC_BUDGET_PAYMENT_LST' ); 

-- Отчет - Контроль номеров ГТД
TaskInsertComponent ( 'TSK_REPORT_GTD_NUMBERS_CONTROL' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_REPORT_GTD_NUMBERS_CONTROL' , 'FDC_CUSTOM_DECL2_LST'); 
TaskInsertComponent ( 'TSK_REPORT_GTD_NUMBERS_CONTROL' , 'FDC_DECL_GET_SKIP_NO'); 
TaskInsertComponent ( 'TSK_REPORT_GTD_NUMBERS_CONTROL' , 'FDC_DECL_NO_GEN'); 

-- Отчет - Бюджетный учет - Извещение
TaskInsertComponent ( 'TSK_REPORT_NOTICE' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_REPORT_NOTICE' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_REPORT_NOTICE' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_NOTICE' , 'FDC_T_ACCOUNT_SALDO_TABLE'); 
TaskInsertComponent ( 'TSK_REPORT_NOTICE' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - Бюджетный учет - Инвентаризационная опись
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_NSICURRENCY_GETRATE'); 
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_T_ACCOUNT_SALDO_TABLE'); 
TaskInsertComponent ( 'TSK_REPORT_OPIS' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - Подтверждение уплаты
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_ACC_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_ACC_LIGHT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_ACC_TRANSACTION_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_CUSTOM_DECL_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_DECL_CHARGE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_DECL_PAYMENT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_DICT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_KBK_DICT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_SUBJECT_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_TPO_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYCONFIRM' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - Отчет о расходовании всех видов поступлений
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_OBJECT_GET_NAME');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_VALUE_LST_SYS');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_DECL_PAYMENT_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_PAYBACK_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_DOCUMENT_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_PAYMENT_FOR_HIST_LST');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_REP_PAY_DEDUCTION_ALL');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC_BALANCE_SUBJECT');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC_REG_SUBJECT');
TaskInsertComponent('TSK_REPORT_PAYMENT_CMP', 'FDC_ACC_TRANSACTION');

-- Отчет - Поступившие П\П
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_PAYMENT_TYPE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_PAYMENT_ORDER' , 'FDC_SUBJECT_LST'); 

-- Отчет - Карточка ВЭД
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_VALUE_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_SUBJECT_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_DECL_CHARGE_HIST_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_DOCUMENT_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_RESERVED_PAYMENT_LST');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_ACC_BALANCE_SUBJECT');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_ACC_REG_SUBJECT');
TaskInsertComponent('TSK_REPORT_REGTI', 'FDC_ACC_TRANSACTION');

-- Отчет - Бюджетный учет - Ведомость
TaskInsertComponent ( 'TSK_REPORT_VEDOMOST' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_VEDOMOST' , 'FDC_UNLOAD_VURP_LST'); 
TaskInsertComponent ( 'TSK_REPORT_VEDOMOST' , 'FDC_VALUE_LST'); 
TaskInsertComponent ( 'TSK_REPORT_VEDOMOST' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - 4ПЛ
TaskInsertComponent ( 'TSK_REPORT_4PL' , 'FDC_GET_CROSS_RATE'); 
TaskInsertComponent ( 'TSK_REPORT_4PL' , 'FDC_NSI_CURRENCY_LST'); 
TaskInsertComponent ( 'TSK_REPORT_4PL' , 'FDC_VALUE_LST_SYS'); 

-- Отчет - Извещение о поступлении и перераспределении платежей (0541102)
TaskInsertComponent('TSK_REPORT_NSINOTICE0541102', 'FDC_NSICURRENCY_GETRATE');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541102', 'FDC_ACC_BALANCE_LST');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541102', 'FDC_NSI_REPORT_BUDGET_LST_XML');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541102', 'FDC_NSI_REPORT_CHECK');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541102', 'FDC_NSI_REPORT_LST');

-- Отчет - Извещение о возврате платежей (0541202)
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_NSICURRENCY_GETRATE');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_ACC_LST');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_ACC_BALANCE_LST');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_NSI_REPORT_BUDGET_LST_XML');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_NSI_REPORT_CHECK');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541202', 'FDC_NSI_REPORT_LST');

-- Отчет - Извещение по зачтенным платежам (0541008)
TaskInsertComponent('TSK_REPORT_NSINOTICE0541008', 'FDC_NSICURRENCY_GETRATE');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541008', 'FDC_ACC_BALANCE_KBK_LST');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541008', 'FDC_NSI_REPORT_BUDGET_LST_XML');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541008', 'FDC_NSI_REPORT_CHECK');
TaskInsertComponent('TSK_REPORT_NSINOTICE0541008', 'FDC_NSI_REPORT_LST');

-- Сервис - Возможные дубли уч. ВЭД
TaskInsertComponent ( 'TSK_SERVICE_EQUALINN' , 'FDC_SUBJECT_LST'); 

-- Отчеты - Авансовые средства участников ВЭД
TaskInsertComponent ( 'TSK_SREPORT_AVANS' , 'FDC_NSI_CURRENCY_LST' );
TaskInsertComponent ( 'TSK_SREPORT_AVANS' , 'FDC_SUBJECT_LST' );
TaskInsertComponent ( 'TSK_SREPORT_AVANS' , 'FDC_ACC_LST' );
TaskInsertComponent ( 'TSK_SREPORT_AVANS' , 'FDC_ACC_TRANSACTION' );
TaskInsertComponent ( 'TSK_SREPORT_AVANS' , 'FDC_NSI_REPORT_CHECK_RANGE' );

-- Отчеты - Отправки в бюджет
TaskInsertComponent ( 'TSK_SREPORT_BUDGET' , 'FDC_BUDGET_PAYMENT_DETAILS_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_BUDGET' , 'FDC_BUDGET_PAYMENT_LST'); 

-- Отчеты - Итоги дня
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_DECL_DEBT_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_DECL_CHARGE_HIST_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_OBLIGATION_DOC_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_DEDUCTION_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_DEDUCT_CNFRM_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_ORDER_ALL_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_ACC_TRANSACTION');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_PAYMENT_DEDUCTION_ALL_LST');
TaskInsertComponent('TSK_SREPORT_DAY', 'FDC_NSI_REPORT_CHECK_RANGE');

-- Отчеты - Периодические платежи
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_CUSTOM_DECL_TEMP_ADM_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_GET_PERIODIC_BY_MONTH'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_PAYMENT_DEDUCTION_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_PAYMENT_TYPE_LST');
TaskInsertComponent ( 'TSK_SREPORT_PAYPER' , 'FDC_NSI_REPORT_CHECK_RANGE');

-- Отчеты - Возврат таможенных платежей
TaskInsertComponent ( 'TSK_SREPORT_PAYRET' , 'FDC_DECL_CHARGE_HIST_LST'); 

-- Отчеты - Подтвержденные платежи
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_ACC_LIGHT_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_ACC_TRANSACTION'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_PAYMENT_ORDER3_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_NSI_REPORT_CHECK_RANGE' );
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_NSI_CURRENCY_GET_RATE' );
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_PAYMENT_ORDER_CNFRM_LST' );
TaskInsertComponent ( 'TSK_SREPORT_PAY1' , 'FDC_ACC_TRANSACTION' );

-- Отчеты - Оплата по таможенным картам
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_ACC_LIGHT_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_ACC_TRANSACTION'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_PAYMENT_ORDER_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_PAYMENT_ORDER2_LST'); 
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_PAYMENT_ORDER3_LST');
TaskInsertComponent ( 'TSK_SREPORT_PAY2' , 'FDC_NSI_REPORT_CHECK_RANGE' );

-- Отчеты - Неподтвержденные платежи
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_PAYMENT_ORDER_LST');
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_ACC_LIGHT_LST');
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_ACC_TRANSACTION_LST');
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_NSI_CURRENCY_GET_RATE');
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_ACC_TRANSACTION');
TaskInsertComponent('TSK_SREPORT_PAY3', 'FDC_NSI_REPORT_CHECK_RANGE');

BEGIN
  FOR Rec IN
  (SELECT * FROM fdc_syscomponent_lst) LOOP
    IF (Rec.SysName NOT LIKE ('FDC_TASK%') AND
        Rec.SysName NOT LIKE ('FDC_USER%') AND
        Rec.SysName NOT LIKE ('FDC_GRANT') AND
        Rec.SysName NOT LIKE ('FDC_EVENT%')
  
  ) THEN
    TaskInsertComponent('TSK_ADMIN_DATA', Rec.SysName);
    END IF;
  END LOOP;
  -- добавление компонент для администратора пользователей
  FOR Rec IN
  (SELECT * FROM fdc_syscomponent_lst) LOOP
    TaskInsertComponent('TSK_ADMIN_TASK', Rec
.SysName);
  END LOOP;
END;
--- дополнительные компоненты для администратора данных
TaskInsertComponent ( 'TSK_ADMIN_DATA' , 'FDC_TASK_GROUP_LST' );
TaskInsertComponent ( 'TSK_ADMIN_DATA' , 'FDC_USER_GET' );

-- Разрешить группе "Документы - ГТД - ведение" читать объект "Kind.decl.close" 
BEGIN
  fdc_User_Group_Grant_Add(
      pUser_Group_ID => fdc_User_Group_Get( 'GRP_DOCUMENT_GTD_UPD' )
     ,pObject_ID     => fdc_object_get_bysysname(
          pTypeSysName => 'Kind'
         ,pSysName     => 'decl.close'
         ,pNoCase      => 1)
     ,pAccessLevel   => 1
    );
END;

end;
/

commit;

--перераздача прав на компоненты
begin
  for c in (select t.cmd
              from fdc_User_Grant_Lst_For_Exec t
             where t.Login <> user) LOOP
    BEGIN
      execute immediate c.cmd;
    EXCEPTION
      WHEN OTHERS THEN
        IF    SQLCODE = -01917
           OR SQLCODE = -01927 THEN
          NULL;
        ELSE
          RAISE;
        END IF;
    END;
  end loop;
end;
/

begin
  for r in (select t.login
              from fdc_user_lst t
              where upper(t.login) <> upper(user)) loop
    begin
      execute immediate 'grant insert,update,delete on dbf_debts_d_z to '||r.login;
      execute immediate 'grant insert,update,delete on dbf_debts_loads to '||r.login;
      execute immediate 'grant insert,update,delete on dbf_debts_r_z to '||r.login;
      execute immediate 'grant insert,update,delete on dbf_debts_s_z to '||r.login;
      execute immediate 'grant insert,update,delete on dbf_debts_v_z to '||r.login;
    exception
      when no_data_found then null;
      
      WHEN OTHERS THEN
        IF SQLCODE = -01917 THEN
          NULL;
        ELSE
          RAISE;
        END IF;
    end;
  end loop;
end;
/
