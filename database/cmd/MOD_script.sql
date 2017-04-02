declare
  nParentType number(15);
  nDOC_CHARGE number(15);
  nID         number(15);
  l_exists    number;
  nproc_id    number(15);
begin
  select t.id
    into nID
    from fdc_task_group_lst t
   where t.code2 is not null
     and t.CODE = 'DOC';

  begin
    select 1
      into l_exists
      from fdc_dict_lst t
     where t.typesysname = 'TaskGroup'
       and t.code = 'ASBCElRulings';
  exception
    when no_data_found then
      nID := fdc_dict_add(pobject_type_sysname => 'TaskGroup',
                          powner_object_id     => nID,
                          pname                => 'Прочие документы начислений',
                          pshortname           => 'Прочие документы начислений',
                          pcode                => 'ASBCElRulings',
                          pcode2               => '28');
  end;

  select t.id
    into nDOC_CHARGE
    from fdc_object_type t
   where t.sysname = 'DocCharge';
  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'ASBCElRulings';
  exception
    when no_data_found then
    
      nParentType := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                         pName                  => 'Прочие документы начислений',
                                         pSysName               => 'ASBCElRulings',
                                         pShortName             => 'Прочие документы начислений',
                                         pTableName             => 'ASBC_ELRULINGS',
                                         pIcon                  => null,
                                         pState_Scheme_ID       => null,
                                         pParent_Object_Type_ID => nDOC_CHARGE);
      nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',pName => 'Удалить Прочий документ начисления',
      pBase_Type_ID => 1, pSysName => 'P_ASBC_ELRULINGS_Del');

      update FDC_OBJECT_TYPE t 
      set t.del_procedure_id = nproc_id
      where t.sysname = 'ASBCElRulings';
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => 'Постановления об АП',
                                 pSysName               => 'ASBCElRulingsResolution',
                                 pShortName             => 'Постановления об АП',
                                 pTableName             => 'ASBC_ELRULINGS_RESOLUTION',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => 'Уголовные дела',
                                 pSysName               => 'ASBCElRulingsCriminalCase',
                                 pShortName             => 'Уголовные',
                                 pTableName             => 'ASBC_ELRULINGS_CRIMINAL_CASE',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
    
      nID := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                                 pName                  => 'Имущество',
                                 pSysName               => 'ASBCElRulingsProperty',
                                 pShortName             => 'Имущество',
                                 pTableName             => 'ASBC_ELRULINGS_PROPERTY',
                                 pIcon                  => null,
                                 pState_Scheme_ID       => null,
                                 pParent_Object_Type_ID => nParentType);
  end;

end;
/
begin
begin
insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00141','Ошибка при добавлении прочего документа начисления','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00142','Документ начисления уже ссылается на другой аннулированный документ начисления!','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00143','Ошибка при обновлении прочего документа начисления (ID=:1)','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE(TYPE_CODE,ERR_NUM,MESSAGE,LOCATION) 
values ('GCD','00144','Ошибка ввода прочего документа начисления: документ с номером :1 от :2 уже существует','p_asbc_elrulings');
exception when dup_val_on_index then null;
end;
update FDC_EH_ERROR_CODE t set t.location='p_cdecl_loader_ex, p_tr, p_tpo, p_asbc_elrulings'
where t.type_code = 'GCD' and t.err_num = '00121';
end;
/
declare
nproc_id number(15);
nID number(15);
  l_exists    number;
begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'DeclarantChecks';
  exception
    when no_data_found then
  nID := fdc_object_type_add(pObject_Type_SysName => 'ObjectType',
                             pName => 'Проверки Участников ВЭД',
                             pSysName => 'DeclarantChecks',
                             pShortName => 'Проверки Участников ВЭД',
                             pTableName => 'ASBC_CHECKS',
                             pIcon => null,
                             pState_Scheme_ID => null,
                             pParent_Object_Type_ID => 1);

end;
/
begin
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '00.00000.00', 'Сообщение успешно обработано.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00010.01', 'Тело сообщения передано в сжатом виде и при его распаковке возникла ошибка.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.01', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.02', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.03', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.04', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.05', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00020.06', 'При работе сервиса авторизации возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00021.01', 'В заголовке конверта сообщения не заполнен идентификатор участника ВЭД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00022.01', 'Незарегистрированный участник ВЭД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00023.01', 'В заголовке конверта указан несуществующий почтовый адрес участника ВЭД, либо указанный транспортный адрес участника отличается от зарегистрированного в базе для указанного идентификатора декларанта./Информация об участнике ВЭД в заголовке конверта была заполнена некорректно /Информация об участнике ВЭД не была занесена в БД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00025.01', 'Указанный номер лицензии для владельца ВХ не найден./Информация о владельце ВХ не была занесена в БД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00024.01', 'Для данного участника ВЭД заблокированы права на предоставление сведений.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00031.01', 'Не заполнен код ТО – отправителя сообщения', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00032.01', 'Код таможенного органа – отправителя сообщения не зарегистрирован как осуществляющий прием электронных деклараций .', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00033.01', 'Транспортный адрес таможенного органа не зарегистрирован в базе подключенных таможенных  органов', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00034.01', 'Не заполнено обязательное поле SoftVersion.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00035.01', 'В заголовке конверта не заполнен тип информационного обмена для таможенного органа -  отправителя сообщения', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00036.01', 'Указанный в сообщении код информационного обмена не найден среди допустимых значений.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00037.01', 'В сообщении не заполнен код  таможенного органа – получателя сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.01', 'Код таможенного органа – получателя сообщения не зарегистрирован как осуществляющий прием электронных деклараций .', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.02', 'Код внутреннего  таможенного органа  отсутствует в  списке ТО, участвующих  в  применении технологии удаленного  выпуска.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.03', 'Код внешнего  таможенного органа  отсутствует в  списке ТО, участвующих  в  применении технологии удаленного  выпуска.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.04', 'Указанная комбинация внутренний ТО - внешний ТО отсутствует списке ТО, участвующих  в  применении технологии удаленного  выпуска.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00038.05', 'ДТ с данным набором заявленных сведений должна быть подана с использованием технологии удаленного выпуска', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00039.01', 'В заголовке сообщения не указан код информационного обмена  для таможенного органа – получателя сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00040.01', 'Указанный в сообщении код информационного обмена не найден среди допустимых значений.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00041.01', 'Процедура декларирования  не  найдена по следующей комбинации параметров: /Идентификатор точки подключения, код таможенного органа, версия информационного обмена, идентификатор процедуры', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.01', 'Информация, передаваемая ДТ не соответствует коду сообщения', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.02', 'При контроле  ДТ произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00046.03', 'Документы, заявленные в 44 (54) графе, имеют некорректный признак предоставления. Протокол ошибок будет выслан в отдельном сообщении.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00047.01', 'Для данной точки подключения установлена дата окончания срока действия.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00048.01', 'Для данного таможенного органа установлена дата окончания срока действия в системе  электронного представления сведений', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00049.01', 'В заголовке сообщения не указан идентификатор процедуры  декларирования.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.01', 'При работе сервиса проверки ЭЦП возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.02', 'При работе сервиса проверки ЭЦП возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.03', 'При работе сервиса проверки ЭЦП возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.04', 'При работе сервиса проверки ЭЦП возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00050.05', 'При работе сервиса проверки ЭЦП возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00051.01', 'Отправленное сообщение содержит некорректную ЭЦП.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.01', 'При проверке сертификата произошли  ошибки.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.01', 'При проверке сертификата произошли  ошибки.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.02', 'При проверке сертификата произошли  ошибки.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.02', 'Ошибка проверки сертификата. Срок действия доверительного сертификата истек.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.04', 'Ошибка проверки сертификата. Доверительный сертификат аннулирован.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.05', 'Ошибка проверки сертификата. Доверительный сертификат имеет неверную подпись.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.06', 'Ошибка проверки сертификата. Доверительный сертификат не пригоден для использования.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.10', 'Ошибка проверки сертификата. Доверительный сертификат имеет неверное расширение.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.11', 'Ошибка проверки сертификата. Доверительный сертификат имеет неверное ограничение политики безопасности.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00052.25', 'Ошибка проверки сертификата. Невозможно получить цепочку сертификатов.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.03', 'Ошибка проверки сертификата.  Указанный тип аутентификации запрещен групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.04', 'Ошибка проверки сертификата.  Указанный тип аутентификации на прокси-сервере запрещен групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.05', 'Ошибка проверки сертификата.  Указанный адрес СПС запрещен групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.06', 'Ошибка проверки сертификата.  Обнаруженное расширение(AcceptableTypes или Nonce) запрещено групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.07', 'Ошибка проверки сертификата.  Подписанные запросы на СПС запрещены групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.08', 'Ошибка проверки сертификата.  Неподписанные запросы на СПС запрещены групповой политикой.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.09', 'Ошибка проверки сертификата.  Значения расширений текущего времени у запроса на СПС и ответа не равны.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.10', 'Ошибка проверки сертификата.  Не указан адрес СПС.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.11', 'Ошибка проверки сертификата.  Ответ СПС не является актуальным.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.12', 'Ошибка проверки сертификата.  Значение поля ThisUpdate не является актуальным.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.13', 'Ошибка проверки сертификата. Значение поля NextUpdate меньше, чем поля ThisUpdate.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00053.14', 'Во время запроса статуса сертификата возникла неизвестная ошибка.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.01', 'Сертификат отозван. Причина отзыва не определена.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.02', 'Сертификат скомпрометирован.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.03', 'Центр сертификации скомпрометирован.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.04', 'В сертификате изменилась информация.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.05', 'Сертификат замещен.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.06', 'Сертификат больше не нужен для тех целей, для которых выпускался.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.07', 'Действие сертификата приостановлено.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.08', 'Убрать сертификат из CRL (используется только в разностных CRL).', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.09', 'Привилегия, подтверждаемая данным сертификатом, была отозвана.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.10', 'Скомпрометирован центр, выпускающий атрибутные сертификаты.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.11', 'Статус сертификата неизвестен.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00054.12', 'Неизвестное значение статуса.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.01', 'При работе сервиса проверки структуры документа возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.02', 'При работе сервиса проверки структуры документа возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.03', 'При работе сервиса проверки структуры документа возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.04', 'При работе сервиса проверки структуры документа возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00070.05', 'При работе сервиса проверки структуры документа возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.01', 'Документ не соответствует схеме.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.02', 'В документе  отсутствует пространство имен для корневого элемента', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.03', 'Не определена версия альбома форматов для данного документа или проверка документов данной версии не осуществляется', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.04', 'Документ отсутствует в альбоме форматов', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.05', 'При проверке документов по схеме возникли ошибки', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00071.06', 'При проверке документов по схеме возникли ошибки', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00072.01', 'Несоответствие типа сообщения и типа документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00072.02', 'В данном типе сообщения запрещено заполнение элемента ReasonPaper.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.06', 'Ошибка извлечения содержимого документа из ЭЦП', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.07', 'Ошибка извлечения  документа  из контейнера', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00073.05', 'Ошибка извлечения тела  сообщения из конверта', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '01.00090.01', 'Код таможенного органа, указанный в заголовке конверта, не соответствует сведениям из процедуры декларирования.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.01', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.02', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.03', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.04', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.06', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.07', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.08', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00002.01', 'При работе с базой данных  произошла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.05', 'Повтор идентификатора документа, передаваемого в  сообщении. Документ с данным идентификатором уже содержится в  базе данных.  Нарушен принцип уникальности идентификаторов', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00000.99', 'Повтор идентификатора сообщения. Сообщение с данным идентификатором уже содержится в  базе данных.  Нарушен принцип уникальности идентификаторов', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00001.01', 'Документ, указанный в ссылочном идентификаторе не найден в базе данных', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00081.01', 'Переданное сообщение невозможно обработать в данном статусном состоянии процедуры', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '02.00082.01', 'Идентификатор процедуры, по которой делался запрос, отсутствует в базе данных', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00010.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00018.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00019.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00022.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00023.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00026.01', 'При обработке документов или их  замене возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00011.01', 'Документ-контейнер не содержит обязательного набора документов', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00012.01', 'Документ-контейнер не содержит обязательного набора документов, либо не установлен флаг FullSetIndicator', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00013.01', 'Подача неполного набора документов запрещена.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00014.01', 'Контейнер не содержит необходимого числа документов.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00014.02', 'Документ GuaranteeCustomsReceipt должен присутствует в сообщение CMN.11126 в случае, когда в документе GuaranteeKind способом обеспечения являются сведения, необходимые для формирования таможенной расписки.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00015.01', 'Не удалось найти документ-контейнер в БД по переданным параметрам.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00015.02', 'В БД не найден документ из запроса', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00016.01', 'При замене документа ссылочный идентификатор указывает на документ другого типа', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00017.01', 'При замене документа ссылочный идентификатор указывает на документ, не подлежащий замене', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00021.01', 'В таможенном органе уже есть запрос на внесение изменений в документы и решение по этому запросу не принято', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00021.03', 'По данной  процедуре  существует запрос  на  внесение  изменений или отзыв ДТ,  по которому  не  было принято решение в ТО', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00024.01', 'При работе сервиса электронного архива декларанта возникла ошибка', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.01', 'Не заполнено обязательное для выполнения операции поле RefDocumentID в документе сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.02', 'Не заполнено обязательное для выполнения операции поле RefDocumentID в документе сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00027.03', 'Не смогли разобрать ЭП на документе. Возможно её нет совсем', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.01', 'Не заполнено обязательное для выполнения операции поле InitialEnvelopeID в документе сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.02', 'Ссылочный идентификатор InitialEnvelopeID заполнен некорректно', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00028.03', 'Сообщение, указанное в InitialEnvelopeID, отсутствует в БД', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00029.01', 'Обнаружены повторяющиеся идентификаторы документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00030.01', 'Выпуск неактуального документа запрещен', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00030.02', 'Выпуск неактуального комплекта документов запрещен', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.00', 'Ошибка при работе сервиса проверки документов.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.01', 'Ошибка при работе сервиса проверки документов.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00100.03', 'Для товара с номером :1 для документа с кодом вида :2 некорректно заполнен номер', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00101.01', 'Версия альбома форматов, указанная в заголовке сообщения не вступила в действие', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00102.01', 'Истек срок действия  версии альбома форматов, указанной в заголовке сообщения', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00103.01', 'Заполнен ссылочный идентификатор документа. Ссылочный идентификатор документа должен отсутствовать.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00104.01', 'Для  используемого декларантом программного средства установлены ограничения на передачу  данного типа информации', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00105.01', 'Предварительная ДТ,  запрошенная внешним таможенным органом, не найдена в базе данных РТУ внутреннего  таможенного органа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00105.02', 'Код ТО сообщения не совпадает с  кодом внешнего ТО для данного процесса в базе', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.01', 'Документы, имеющие ссылки на электронный архив декларанта, не найдены в электронном архиве.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.02', 'В запросе на предоставление документов не  заполнен архивный  идентификатор документа', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00106.04', 'Идентификатор участника ВЭД не соответствует идентификатору владельца архива', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00107.01', 'Сведения о регистрируемых документах не  найдены в БД', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00108.01', 'Срок  принятия решения  по средствам идентификации еще не истек', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.01', 'Код таможенного органа, указанный  в процедуре  декларирования отсутствует в справочнике таможенных  органов,  в которых  могут проводиться таможенные операции для данного УЭО', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.02', 'заявленный  код  упрощения  не  применим для  данного уполномоченного экономического  оператора', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.04', 'Не заполнен код применяемого упрощения', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.05', 'Отправитель/Декларант не найден в списке транспортных-экспедиторских компаний и служб курьерской доставки', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.06', 'Код таможенного органа, указанный в процедуре декларирования отсутствует в справочнике таможенных органов, в которых могут проводиться таможенные операции с товарами для личного пользования, перемещаемыми перевозчиками', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.31', 'Некорректно заполненный документ. Не заполнен код документа(DocCode).', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.32', 'Несоответствие кода запрашиваемого документа(DocCode) и его DocumentModeID.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.33', 'DocCode документа, полученного от декларанта, не найден в БД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.58', 'Не заполнено обязательное поле при запросе документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00000.59', 'Ошибка создания  документа', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00001.01', 'Системная  ошибка. Процесс обработки или формирования сообщения завершился аварийно.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00002.01', 'Ошибка обработки сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00003.01', 'Ошибка во время выполнения отправки сообщения о приеме.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00004.01', 'Ошибка во время выполнения отправки результата обработки.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00005.01', 'Передан необрабатываемый тип сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00005.05', 'Системная  ошибка. Процесс обработки или формирования сообщения завершился аварийно.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00051.99', 'Ошибка взаимодействия  с электронным архивом декларанта', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00052.99', 'Неопознан ответ от электронного архива декларанта', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '09.00053.99', 'Документ электронного архива декларанта некорректен.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.01', 'Некорректный формат сообщения. Отсутствует архивный идентификатор документа/документ.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.02', 'Некорректный формат сообщения. Указана неправильная кодировка.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.03', 'Некорректный формат сообщения. Отсутствует тело сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.04', 'Некорректный формат сообщения. Ошибка при выполнении структурного контроля.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.05', 'Некорректный формат сообщения. Неизвестный тип сообщения.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00001.06', 'Некорректный формат сообщения. Документ не соответствует схеме.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00002.01', 'Архив не найден. Не найден архив с указанным идентификатором.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00002.02', 'Архив не найден. Не найдена точка подключения с указанным идентификатором.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00003.01', 'Невозможно удалить архив. Архив содержит документы', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00004.01', 'Документ не найден. Неизвестный тип документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00004.02', 'Документ не найден. Документ не найден в архиве.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.01', 'Невозможно удалить документ. Документ используется в процессе оформления.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.02', 'Невозможно заменить документ. Документ используется в процессе оформления.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.03', 'Невозможно заменить документ. Версия документа не является последней.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.04', 'Невозможно удалить документ. Версия документа не является последней.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.05', '''Невозможно заменить документ. Тип заменяющего документа не соответствует коду вида заменяемого документа', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00005.06', 'Невозможно заменить документ. Тип заменяющего документа не соответствует типу заменяемого документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00006.01', 'Некорректный формат документа. Ошибка форматного контроля.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.01', 'Ошибка при обращении к БД. Ошибка записи данных в БД.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.02', 'Ошибка при обращении к БД. Нарушена целостность данных.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.03', 'Ошибка при обращении к БД. Ошибка доступа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00007.05', 'Ошибка при извлечении документа.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00008.01', 'Невозможно разместить документ. Тип размещаемого документа не соответствует коду вида документа, указанному в запросе', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00010.01', 'Ошибка при попытке создания ответного конверта.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '10.00010.02', 'Ошибка при попытке отправки ответного конверта.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '12.00001.00', 'Процедура декларирования  не найдена в ТО', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '99.99999.99', 'Общая ошибка при работе системы.', '');

exception when dup_val_on_index then null;
end;
begin
 insert into FDC_EH_ERROR_CODE (TYPE_CODE, ERR_NUM, MESSAGE, LOCATION)
values ('INTERACT', '03.00109.03', 'ИНН отправителя / ИНН декларанта не  найдены  в реестре уполномоченных экономических операторов', '');

exception when dup_val_on_index then null;
end;
end;
/
begin
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (1, 'Расчетный счет', 'Проверка у участника ВЭД существования активного или когда-либо существовавшего расчетного счета', 'PKG_ASBC_CHECKS.execRequestAcc');

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (2, 'Действует на дату', 'Проверка действительности юридического лица на дату запроса', 'PKG_ASBC_CHECKS.execRequestStatCRV');

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPES (ID, CODE, NAME, ACTION)
values (3, 'Доверенные лица', 'Запрос должностных лиц, имеющих право действовать от имени участника ВЭД без доверенности (генеральный директор и т.д.)', 'PKG_ASBC_CHECKS.execRequestAuthCRV');

exception when dup_val_on_index then null;
end;
end;
/
begin
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'INN', 0, 1, 'ИНН', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'KPP', 0, 2, 'КПП', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'OGRN', 0, 3, 'ОГРН', 9);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'AccountNum', 0, 21, 'Номер счета', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'BIK', 0, 22, 'БИК банка', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'INN', 0, 1, 'ИНН', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'KPP', 0, 2, 'КПП', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (2, 'OGRN', 0, 3, 'ОГРН', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'INN', 0, 1, 'ИНН', null);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'KPP', 0, 2, 'КПП', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (3, 'OGRN', 0, 3, 'ОГРН', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Name', 0, 7, 'Имя', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Surname', 0, 6, 'Фамилия', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'BirthDate', 0, 9, 'Дата рождения', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportSeria', 0, 10, 'Серия паспорта', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportNumber', 0, 11, 'Номер паспорта', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportDate', 0, 12, 'Дата выдачи паспорта', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportOrganizationName', 0, 13, 'Наименование организации, выдавшей паспорт', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'PassportOrganizationCode', 0, 14, 'Код подразделения, выдавшего паспорт ', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Middlename', 0, 8, 'Отчество', 0);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'OGRN', 0, 17, 'ОГРНИП', 8);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Surname', 0, 18, 'Фамилия', 2);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Name', 0, 19, 'Имя', 2);

exception when dup_val_on_index then null;
end;
begin
 insert into ASBC_CHECKTYPEPARAMS (PRN, NAME, TYPE, NORDER, DISPLAY_NAME, SUBJECT_TYPE)
values (1, 'Middlename', 0, 20, 'Отчество', 2);
exception when dup_val_on_index then null;
end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'ReestrSpecifyKindPay';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'ReestrNoticeSpecifyKindPayGuaranteeing';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Реестр уведомлений об уточнении вида платежа обеспечения',
                              pSysName               => 'ReestrNoticeSpecifyKindPayGuaranteeing',
                              pShortName             => 'Реестр уведомлений об уточнении вида платежа обеспечения',
                              pTableName             => 'FDC_REESTR_GNOTICE_KINDPAY',
                              pIcon                  => null,
                              pState_Scheme_ID       => l_state_scheme_id,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  update FDC_OBJECT_TYPE t
     set t.serialization_function = 'FDC_XML.Srlz_RNoticeSKPayGuar',
         t.deserialization_function = 'FDC_XML.Dsrlz_RNoticeSKPayGuar'
   where t.id = l_id;

  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => 'Удалить Реестр уведомлений об уточнении вида платежа обеспечения',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_REESTR_GNOTICESPECIFYKINDPAY.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_oper_id number;
  l_acc_id  number;
  l_id      number;
begin
  select t.id
    into l_oper_id
    from fdc_custom_operation_lst t
   where t.code = 'OP.0053'
     and t.SDATE <= sysdate
     and t.EDATE is null;
     
  select t.id
    into l_acc_id
    from fdc_acc_light_lst t
   where t.code = '02.01.03'
     and t.SDATE <= sysdate
     and t.EDATE is null;

  l_id := fdc_rel_oper_acc_add(pName        => null,
                               pOperationID => l_oper_id, --проведение Корректировка начислений по ДТ, ДТ КНП в большую сторону
                               pAccountID   => l_acc_id, --02.01.03
                               pShortName   => null,
                               pDescript    => null,
                               pActionSign  => 1,
                               pIsDebit     => 'Y',
                               pEnableFunc  => 'IS_EN_DOC_OPER_CHARGE');
exception when dup_val_on_index then 
  null;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettings';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Описание взаимодействий',
                              pSysName               => 'InteractSettings',
                              pShortName             => 'Описание взаимодействий',
                              pTableName             => 'ASBC_INTERACT',
                              pIcon                  => null,
                              pState_Scheme_ID       => l_state_scheme_id,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => 'Удалить Описание взаимодействий',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACT.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettingsMsgTypes';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Коды взаимодействия',
                              pSysName               => 'InteractSettingsMsgTypes',
                              pShortName             => 'Коды взаимодействия',
                              pTableName             => 'ASBC_INTERACTMSGTYPES',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => 'Коды взаимодействия',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACTMSGTYPES.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractSettingsQueues';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Очереди взаимодействия',
                              pSysName               => 'InteractSettingsQueues',
                              pShortName             => 'Очереди взаимодействия',
                              pTableName             => 'ASBC_INTERACTQUEUES',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);


  declare
    nproc_id number(15);
  begin
    nproc_id := fdc_procedure_add(pObject_Type_SysName => 'Procedure',
                                  pName                => 'Коды взаимодействия',
                                  pBase_Type_ID        => 1,
                                  pSysName             => 'P_ASBC_INTERACTQUEUES.REMOVE');
  
    update FDC_OBJECT_TYPE t
       set t.del_procedure_id = nproc_id
     where t.id = l_id;
  
  end;
  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';

  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractLog';
  exception
    when no_data_found then
  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Журнал взаимодействия',
                              pSysName               => 'InteractLog',
                              pShortName             => 'Журнал взаимодействия',
                              pTableName             => 'ASBC_INTERACT_LOG',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  end;
end;
/
declare
  l_parent_objtype_id number;
  l_state_scheme_id   number;
  l_id                integer;
  l_exists    number;
begin
  select t.id,
         t.STATE_SCHEME_ID
    into l_parent_objtype_id,
         l_state_scheme_id
    from fdc_object_type_lst t
   where t.SYSNAME = 'Object';
  begin
    select 1
      into l_exists
      from fdc_object_type t
     where t.sysname = 'InteractLogDocuments';
  exception
    when no_data_found then

  l_id := fdc_object_type_add(pObject_Type_SysName   => 'ObjectType',
                              pName                  => 'Журнал взаимодействия (Документы)',
                              pSysName               => 'InteractLogDocuments',
                              pShortName             => 'Журнал взаимодействия (Документы)',
                              pTableName             => 'ASBC_INTERACT_LOG_DOCS',
                              pIcon                  => null,
                              pState_Scheme_ID       => null,
                              pParent_Object_Type_ID => l_parent_objtype_id);

  end;
end;
/
begin
null;
--insert into FDC_UPDATE_TYPE(ID, TYPE_NAME) values (1938248,'Исправление ошибок в ПО');
exception when dup_val_on_index then null;
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'LSRTU';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'ИРС "Доход" «Лицевые счета – РТУ»',
                         pShortName           => 'ЛС-РТУ',
                         pCode                => 'LSRTU');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'ASFINES';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'АПС «Штрафы»',
                         pShortName           => '',
                         pCode                => 'ASFINES',
                         pCode2               => 'ASFINES');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'ASG';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'АС «Обеспечение»',
                         pShortName           => '',
                         pCode                => 'ASG',pCode2 => 'ASG');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'CIA';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'Автоматизированная система таможенного оформления и таможенного контроля',
                         pShortName           => '',
                         pCode                => 'CIA',
                         pCode2               => 'CIA');
  
end;
/
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'PROP';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'АПС Имущество',
                         pShortName           => '',
                         pCode                => 'PROP');
  
end;
/
declare
 l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'CRV';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'АИС «ЦРСВЭД»',
                         pShortName           => '',
                         pCode                => 'CRV',
                         pDocum               => 'АИС «ЦРСВЭД»');
  
end;
/
declare
 l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'Dict.SoftCode'
     and t.code = 'LAW';
exception
  when no_data_found then
    l_id := fdc_dict_add(pObject_Type_SysName => 'Dict.SoftCode',
                         pOwner_Object_ID     => null,
                         pName                => 'АИС "Правохрана"',
                         pShortName           => '',
                         pCode                => 'LAW',
                         pDocum               => 'АИС "Правохрана"');
  
end;
/
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='INTERNAL';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Межуровневое взаимодействие', 
                        pCode           =>'INTERNAL' , 
                        pType           => 0, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','LSRTU'), 
                        pDescript       => 'Перекидывает конверты между уровнями'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='INTERNAL' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'INTIN', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'INTERNAL', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'p_asbc_interact_log_insert', 
                                              pDescript        => 'Входящие'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='INTERNAL' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'INTOUT', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'INTERNAL', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'p_asbc_interact_log_insert', 
                                              pDescript        => 'Исходящее'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='FINES';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Взаимодействие с АПС "Штрафы"', 
                        pCode           =>'FINES' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','ASFINES'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10001' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10001', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => 'Постановление по делу об АП'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => 'Электронный документ о прекращении исполнения постановления по делу об АП / акт о списании задолженности'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.carry', 
                                              pDescript        => 'Информация о квитировании платежных документов и постановлений по делам об АП'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.form_10004', 
                                              pDescript        => 'Информация о неидентифицированных платежах поступивших по делам об административных правонарушениях и о неоплаченных электронных постановлениях по делу об АП'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.10005' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.10005', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.10005', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_FINE.form_10005', 
                                              pDescript        => 'Информация о квитировании платежных документов и постановлений по делам об АП'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='ASG';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Взаимодействие с АС "Обеспечение"', 
                        pCode           =>'ASG' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','ASG'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Уведомление об изменении остатка денежного залога по ТР'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Результат обработки сообщения АС «Обеспечение»'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.005' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.005', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.005', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Сведения о состоянии денежного залога по ТР'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Результат обработки сообщения АПС «Лицевые счета»'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос информации о текущем остатке денежного залога по ТР.'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.006' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.006', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.006', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Уведомление о резервировании денежных средств по ТР'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.007' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.007', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.007', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Уведомление об окончании использования обеспечения'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.008' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.008', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.008', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Уведомление об ошибке в результате обработки сообщения АС «Обеспечение»'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.009' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.009', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.009', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Уведомление об успешной обработке сообщения АС «Обеспечение»'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.ASG.010' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.ASG.010', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.ASG.010', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'pkg_asbc_provision.carry', 
                                              pDescript        => 'Запрос информации о поручителях/гарантах'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ASG.ACC.011' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ASG.ACC.011', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ASG.ACC.011', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Сведения о поручителях/ гарантах'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='АИС ЭД';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'АИС "Электронное декларирование"', 
                        pCode           =>'АИС ЭД' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','CIA'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11213' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11213', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11213', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.carry', 
                                              pDescript        => 'Договор предоставлен'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11214' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11214', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11214', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.CARRY', 
                                              pDescript        => 'Договор принят'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CMN.11215' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CMN.11215', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CMN.11215', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_SMEV_BROKER.CARRY', 
                                              pDescript        => 'Договор не принят'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='LAW';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Взаимодействие с АИС "Правоохрана"', 
                        pCode           =>'LAW' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','LAW'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACL.10000' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACL.10000', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACL.10000', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_LAW.carry', 
                                              pDescript        => 'Возмещение ущерба'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACL.10001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACL.10001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACL.10001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Уведомление о списании (ошибке списания)'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='PROPERTY';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Взаимодействие с АПС "Имущество"', 
                        pCode           =>'PROPERTY' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','PROP'), 
                        pDescript       => ''); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20001', 
                                              pDescript        => 'Сведения о поступлениях на лицевой счет администратора доходов в части обращенных в федеральную собственность денежных средств'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20002' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20002', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20002', 
                                              pDescript        => 'Сведения о возвратах с лицевого счета администратора доходов в части обращенных в федеральную собственность денежных средств'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.form_20002', 
                                              pDescript        => 'Электронный документ начисления по обращенным в федеральную собственность денежным средствам'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='ACC.20003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'ACC.20003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'ACC.20003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_PROPERTY.carry', 
                                              pDescript        => 'Электронный документ начисления по обращенным в федеральную собственность денежным средствам'); 
  end; 
end; 
/ 
declare 
  l_int_id number; 
  l_tmp_id number; 
begin 
  begin 
  select id into l_int_id from asbc_interact_lst t where t.code='CRVED';
  exception when no_data_found then 
 l_int_id := p_asbc_interact.add(pName           => 'Взаимодействие с АИС «ЦРСВЭД»', 
                        pCode           =>'CRVED' , 
                        pType           => 1, 
                        pSOFT_ID        => fdc_dict_get_bycode('Dict.SoftCode','CRV'), 
                        pDescript       => 'Взаимодействие с АИС «ЦРСВЭД»'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.21002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.21002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.21002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сведения о принадлежности банковского счета юридическому лицу'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.10003' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.10003', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.10003', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сообщение об ошибке (Данные не найдены)'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.00001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.00001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.00001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сообщение об ошибке'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.25002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.25002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.25002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сведения о наличии либо отсутствии банковского счета у индивидуального предпринимателя'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.22002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.22002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.22002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сведения о наличии либо отсутствии банковского счета у физического лица'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.00004' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.00004', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.00004', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Технологическое сообшение'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.23002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.23002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.23002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сведения о статусе юридического лица'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.24002' and t.ndirection = 0;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.24002', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.24002', 
                                              pDIRECTION       => 0, 
                                              pEXECPROC        => 'PKG_ASBC_CHECKS.carry', 
                                              pDescript        => 'Сведения о должностных лицах участника ВЭД, имеющих право действовать от имени участника ВЭД без доверенности'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.23001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.23001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.23001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос о статусе юридического лица на дату запроса'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.24001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.24001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.24001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос информации о должностных лицах участника ВЭД, имеющих право действовать от имени участника ВЭД без доверенности'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.22001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.22001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.22001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос информации о наличии либо отсутствии банковского счета физического лица'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.21001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.21001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.21001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос информации о наличии либо отсутствии банковского счета юридического лица'); 
  end; 
  begin 
  select id into l_tmp_id from asbc_interactmsgtypes_lst t where t.code='CRV.25001' and t.ndirection = 1;
  exception when no_data_found then 
      l_tmp_id := p_asbc_interactmsgtypes.add(pName            => 'CRV.25001', 
                                              pOwner_Object_ID => l_int_id, 
                                              pCode            => 'CRV.25001', 
                                              pDIRECTION       => 1, 
                                              pEXECPROC        => '', 
                                              pDescript        => 'Запрос информации о наличии либо отсутствии банковского счета ИП'); 
  end; 
end; 
/ 
declare
  l_id number;
begin
  select id
    into l_id
    from fdc_dict_lst t
   where t.typesysname = 'DecisionQualifier'
     and t.code = '20';
exception
  when no_data_found then
    l_id := fdc_decision_qualifier_add(pObject_Type_SysName => 'DecisionQualifier',
                                       pOwner_Object_ID     => null,
                                       pName                => 'Условный выпуск',
                                       pShortName           => '',
                                       pCode                => '20');
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2015';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => 'Счётчик номеров бюджетных отчётов за 2015 год (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pShortName           => 'Счётчик номеров бюджетных отчётов за 2015 год (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pDescript            => 'Счётчик номеров бюджетных отчётов за 2015 год (''ReportBudget_NSIREPORT.ACC#B0543011_2015'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2015',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pShortName           => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pDescript            => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543011_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543011_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543013_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pShortName           => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pDescript            => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543013_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543013_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ID NUMBER(15);

begin
  select t.id
    into nOPTION_ID
    from fdc_value_lst_sys t
   where t.SYSNAME = 'REPORTBUDGET_NSIREPORT.ACC#B0543009_2016';
exception
  when no_data_found then
    nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                pName                => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pShortName           => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pDescript            => 'Счётчик номеров бюджетных отчётов за 2016 год (''ReportBudget_NSIREPORT.ACC#B0543009_2016'')',
                                pSysName             => 'REPORTBUDGET_NSIREPORT.ACC#B0543009_2016',
                                pIsSystem            => 1,
                                pOwner_Object_ID     => null,
                                pStringValue         => '',
                                pNumValue            => 1);
end;
/
declare
  nOPTION_ROOT_ID NUMBER(15);
  nOPTION_ID      NUMBER(15);
begin
  begin
    select t.id
      into nOPTION_ROOT_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'NotifyRoot';
  exception
    when no_data_found then
      nOPTION_ROOT_ID := fdc_value_add(pObject_Type_SysName => 'ValueNumber',
                                       pName                => 'Notify',
                                       pShortName           => 'Notify',
                                       pDescript            => 'Группа значений параметров пользователя/таможни',
                                       pSysName             => 'NotifyRoot',
                                       pIsSystem            => 1,
                                       pOwner_Object_ID     => '',
                                       pStringValue         => 'Notify');
  end;
  begin
    select t.id
      into nOPTION_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'Notify.LoadFKtoOK';
  exception
    when no_data_found then
      nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueBool',
                                  pName                => 'Уведомлять о загрузке документов ФК в "Обмен-казначейство"',
                                  pShortName           => 'LoadFKtoOK',
                                  pDescript            => '',
                                  pSysName             => 'Notify.LoadFKtoOK',
                                  pIsSystem            => 1,
                                  pOwner_Object_ID     => nOPTION_ROOT_ID,
                                  pStringValue         => 'Нет',
                                  pNumValue            => 0);
  end;
  begin
    select t.id
      into nOPTION_ID
      from fdc_value_lst_sys t
     where t.SYSNAME = 'Notify.LoadOKtoLS';
  exception
    when no_data_found then
      nOPTION_ID := fdc_value_add(pObject_Type_SysName => 'ValueBool',
                                  pName                => 'Уведомлять о загрузке документов из "Обмен-казначейство" в "Лицевые счета - ФТС"',
                                  pShortName           => 'LoadOKtoLS',
                                  pDescript            => '',
                                  pSysName             => 'Notify.LoadOKtoLS',
                                  pIsSystem            => 1,
                                  pOwner_Object_ID     => nOPTION_ROOT_ID,
                                  pStringValue         => 'Нет',
                                  pNumValue            => 0);
  end;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActChangeOstKBK','Акт о переносе остатков с закрытых КБК');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionDeposit','Акт на списание залога');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionOverPay','Акт на списание излишней уплаты');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ActDeductionPays','Акт на списание ПП');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdviceLevy','Уведомление об излишнем взыскании');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePay','Уведомление об излишней уплате');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePayPeriodic','Уведомление об излишней уплате при периодическом декларировании');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AdvicePayTPO','Уведомление об излишней уплате по ТПО');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AnnulTPO','Документ Аннулирование ТПО');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('AnnulTR','Документ Аннулирование ТР');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CancelDecisionPayback','Отмена решения на возврат');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CashlessPaymentOrder','Платежное поручение');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CashOrderBank','Ордер кассы банка');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('ConfirmSpecifyKindPay','Подтверждение использования платежа');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionGTDCCharge','Отмена списаний (ДТ)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionGTDSubject','Повторная идентификация декларанта (ДТ)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPOBack','Корректировка платежного поручения (возврат)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPoSubject','Корректировка п/п (Участник ВЭД)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionPOSum','Корректировка сумм в платежном поручении');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionTPOCCharge','Отмена списаний (ТПО)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CorrectionTPOSubject','Повторная идентификация декларанта (ТПО)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CrossPay','Списание средств не ТС по КБК ТС');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('CustomCheque','Чек по таможенной карте');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPaybackOutback','Решение о возврате денежных средств вернувшихся на счет');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPayment','Решение о зачете в счет таможенных платежей');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecisionPaymentDeposit','Решение о зачёте залога');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge','Начисления по ДТ');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge.Cancel','Отмена начислений (ДТ)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclCharge.Correct','Корректируещее начисление');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DeclPayment','Платеж по ДТ');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecOffsetObligation','Решение о зачете ТР ст.145');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackAdvance','Решение о возврате авансовых платежей');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackDeposit','Решение о возврате денежного залога');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackLevy','Решение о возврате излишне взысканных платежей');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackPay','Решение о возврате излишне уплаченных платежей');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackPeriodic','Решение о возврате излишней уплаты при периодическом временном декларировании');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DecPaybackTimeOut','Решение о возврате процентов за нарушение сроков возврата');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Detail.CancelPay','Детализация отмены оплаты (аннулирования документа начисления)');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocReuse','Зачёт между таможенными органами');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Document','Документ');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.DPReturns','Подтверждение получения реестра заявок на возврат');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.Reuse','"Подтверждение-квитанция" получения зачёта между ТО в вышестоящем ТО');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('DocumentConfirmation.SpecifyKindPay','"Подтверждение-квитанция" получения уведомления/подтверждения об уточнении вида платежа в вышестоящем ТО');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('GroundsRemoveDebts','Документ-основание для исключения задолженности');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NonIDCashOrder','Неидентифицированный кассовый ордер');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NonIDCustomCheque','Неидентифицированный чек по ТК');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticePay','Технологический документ учета задолженности');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticeSpecifyKindPay','Уведомление об уточнении вида платежа');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('NoticeSpecifyKindPayCorr','Уведомление об уточнении вида платежа при излишней уплате');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PayDebt','Погашение долга');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.ActChangeOstKBK','Списания по Акту о переносе остатков с закрытых КБК');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.Correct','Корректируещее списание');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentDeduction.NotDemanded','Списание невостребованных д/с');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentFor','Перевод на другой ЛС');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderConfirm','Подтверждающий платёжный документ');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderNonID','Неидентифицированный платёжный документ');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderRestCustoms','Платёжный документ переноса остатков таможни');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PaymentOrderRestUFK','Платёжный документ переноса остатков УФК');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Payment_Order_PayBack','Заявка на возврат средств');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('Payment_Order_PayBackY','Подверждение возврата');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('PayPeriodic','Оплата месячных платежей');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('TR','ТР');
exception when dup_val_on_index then null;
end;
/
begin
insert into ASBC_DOCTYPES_NOTACTIVE(SYSNAME, NAME)
values ('TrDuplicate','Дубликат таможенной расписки');
exception when dup_val_on_index then null;
end;
/
