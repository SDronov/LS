object CheckCopyService: TCheckCopyService
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = #1040#1055#1057' "'#1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072'" - "'#1057#1077#1088#1074#1080#1089' '#1058#1050'-'#1086#1085#1083#1072#1081#1085' '#1091#1088#1086#1074#1085#1103' '#1060#1058#1057'"'
  StartType = stManual
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 345
  Top = 331
  Height = 309
  Width = 371
  object evtAppMain: TApplicationEvents
    OnException = evtAppMainException
    Left = 106
    Top = 24
  end
end
