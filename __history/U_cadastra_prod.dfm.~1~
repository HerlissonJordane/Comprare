object Frm_cad_prod: TFrm_cad_prod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de produtos'
  ClientHeight = 268
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 127
    Width = 92
    Height = 13
    Caption = 'Unidade de compra'
  end
  object LblEdit_cod_prod: TLabeledEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo do produto'
    TabOrder = 0
  end
  object LblEdit_nome: TLabeledEdit
    Left = 16
    Top = 88
    Width = 289
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 1
  end
  object DBLookupComboBox_unidade: TDBLookupComboBox
    Left = 16
    Top = 143
    Width = 289
    Height = 21
    KeyField = 'cod_und'
    ListField = 'descricao'
    ListSource = DataSource_unidade
    TabOrder = 2
  end
  object Btn_salvar: TButton
    Left = 16
    Top = 228
    Width = 75
    Height = 33
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = Btn_salvarClick
  end
  object Btn_cancelar: TButton
    Left = 230
    Top = 228
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = Btn_cancelarClick
  end
  object ADOQuery_unidade: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 128
    Top = 176
  end
  object DataSource_unidade: TDataSource
    DataSet = ADOQuery_unidade
    Left = 232
    Top = 176
  end
  object ADOQuery_aux: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 176
  end
end
