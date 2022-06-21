object fTarefa2: TfTarefa2
  Left = 585
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tarefa 2'
  ClientHeight = 187
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblTempo1: TLabel
    Left = 106
    Top = 39
    Width = 116
    Height = 13
    Caption = 'Tempo 1 (milissegundos)'
  end
  object lblTempo2: TLabel
    Left = 306
    Top = 39
    Width = 116
    Height = 13
    Caption = 'Tempo 2 (milissegundos)'
  end
  object pbThread1: TProgressBar
    Left = 0
    Top = 170
    Width = 533
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object pbThread2: TProgressBar
    Left = 0
    Top = 153
    Width = 533
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object edtTempo1: TEdit
    Left = 106
    Top = 54
    Width = 126
    Height = 21
    TabOrder = 2
    Text = '1000'
    OnExit = edtTempoExit
    OnKeyPress = edtTempoKeyPress
  end
  object edtTempo2: TEdit
    Left = 306
    Top = 54
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '1000'
    OnExit = edtTempoExit
    OnKeyPress = edtTempoKeyPress
  end
  object btnExecutar: TButton
    Left = 229
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 4
    OnClick = btnExecutarClick
  end
end
