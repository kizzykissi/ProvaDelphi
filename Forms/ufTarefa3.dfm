object fTarefa3: TfTarefa3
  Left = 826
  Top = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tarefa 3'
  ClientHeight = 352
  ClientWidth = 714
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotal: TLabel
    Left = 585
    Top = 224
    Width = 61
    Height = 13
    Caption = 'Total em R$:'
  end
  object lblTotalDivisoes: TLabel
    Left = 584
    Top = 279
    Width = 85
    Height = 13
    Caption = 'Total divisoes R$:'
  end
  object dbgrdProjetos: TDBGrid
    Left = 24
    Top = 8
    Width = 665
    Height = 209
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtTotalProjetos: TEdit
    Left = 584
    Top = 239
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object btnObterTotal: TButton
    Left = 477
    Top = 239
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 2
    OnClick = btnObterTotalClick
  end
  object btnObterTotalDivisao: TButton
    Left = 439
    Top = 292
    Width = 113
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 3
    OnClick = btnObterTotalDivisaoClick
  end
  object edtTotalDivisao: TEdit
    Left = 584
    Top = 295
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object statProcessamento: TStatusBar
    Left = 0
    Top = 333
    Width = 714
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
