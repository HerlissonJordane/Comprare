object Frm_ins_alt_cat_prod: TFrm_ins_alt_cat_prod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Insira a categoria de Produto'
  ClientHeight = 174
  ClientWidth = 268
  Color = clBtnFace
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
  object SB_salvar: TSpeedButton
    Left = 8
    Top = 117
    Width = 73
    Height = 33
    Caption = 'Salvar'
    OnClick = SB_salvarClick
  end
  object SB_cancelar: TSpeedButton
    Left = 160
    Top = 117
    Width = 81
    Height = 33
    Caption = 'Cancelar'
    OnClick = SB_cancelarClick
  end
  object LblEdit_cod: TLabeledEdit
    Left = 8
    Top = 16
    Width = 97
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo da categoria'
    TabOrder = 0
  end
  object LblEdit_categoria: TLabeledEdit
    Left = 8
    Top = 64
    Width = 233
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome da categoria'
    TabOrder = 1
    OnKeyPress = LblEdit_categoriaKeyPress
  end
  object ADOQuery_cat_prod: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 209
    Top = 8
  end
end
