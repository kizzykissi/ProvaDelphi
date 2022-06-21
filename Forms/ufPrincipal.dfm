object fPrincipal: TfPrincipal
  Left = 294
  Top = 107
  Width = 1313
  Height = 775
  BorderIcons = [biSystemMenu]
  Caption = 'Tarefas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 8
    Top = 8
    object mniTarefa1: TMenuItem
      Caption = 'Tarefa 1'
      OnClick = mniTarefa1Click
    end
    object mniTarefa2: TMenuItem
      Caption = 'Tarefa 2'
      OnClick = mniTarefa2Click
    end
    object mniTarefa3: TMenuItem
      Caption = 'Tarefa 3'
      OnClick = mniTarefa3Click
    end
  end
end
