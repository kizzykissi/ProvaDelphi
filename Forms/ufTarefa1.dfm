object fTarefa1: TfTarefa1
  Left = 466
  Top = 226
  Width = 737
  Height = 533
  BorderIcons = [biSystemMenu]
  Caption = 'Tarefa 1'
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 273
    Align = alTop
    TabOrder = 0
    DesignSize = (
      729
      273)
    object lblColunas: TLabel
      Left = 29
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Colunas'
    end
    object lblTabelas: TLabel
      Left = 210
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Tabelas'
    end
    object lblCondicoes: TLabel
      Left = 392
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Condi'#231#245'es'
    end
    object mmoColunas: TMemo
      Left = 29
      Top = 39
      Width = 170
      Height = 187
      TabOrder = 0
    end
    object mmoTabelas: TMemo
      Left = 210
      Top = 39
      Width = 170
      Height = 187
      Anchors = [akTop]
      TabOrder = 1
    end
    object mmoCondicoes: TMemo
      Left = 392
      Top = 39
      Width = 170
      Height = 187
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object btnGeraSQL: TButton
      Left = 600
      Top = 120
      Width = 93
      Height = 33
      Anchors = [akRight]
      Caption = 'Gera SQL'
      TabOrder = 3
      OnClick = btnGeraSQLClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 273
    Width = 729
    Height = 229
    Align = alClient
    TabOrder = 1
    object lblSQL: TLabel
      Left = 29
      Top = 19
      Width = 21
      Height = 13
      Caption = 'SQL'
    end
    object mmoSQL: TMemo
      Left = 29
      Top = 34
      Width = 671
      Height = 165
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
end
