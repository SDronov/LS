object FileCopyService: TFileCopyService
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'FileCopyService'
  Left = 345
  Top = 331
  Height = 309
  Width = 371
  object tmrMain: TTimer
    Enabled = False
    OnTimer = tmrMainTimer
    Left = 40
    Top = 20
  end
  object evtAppMain: TApplicationEvents
    OnException = evtAppMainException
    Left = 130
    Top = 80
  end
end
