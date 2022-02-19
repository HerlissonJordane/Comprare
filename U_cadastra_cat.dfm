object Frm_categoria: TFrm_categoria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de categorias'
  ClientHeight = 188
  ClientWidth = 335
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 117
    Width = 73
    Height = 33
    Caption = 'Salvar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 152
    Top = 117
    Width = 81
    Height = 33
    Caption = 'Cancelar'
    OnClick = SpeedButton2Click
  end
  object LblEdit_cod: TLabeledEdit
    Left = 0
    Top = 16
    Width = 97
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo da categoria'
    TabOrder = 0
  end
  object LblEdit_categoria: TLabeledEdit
    Left = 0
    Top = 64
    Width = 233
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome da categoria'
    TabOrder = 1
  end
  object ADOQuery_categoria: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 201
    Top = 8
  end
end
