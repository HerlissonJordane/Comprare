object Frm_cad_comercio: TFrm_cad_comercio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de lojas'
  ClientHeight = 296
  ClientWidth = 431
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
    Top = 193
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  object LblEdit_cod_loja: TLabeledEdit
    Left = 16
    Top = 24
    Width = 105
    Height = 21
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo da Loja'
    ReadOnly = True
    TabOrder = 0
  end
  object LblEdit_nome: TLabeledEdit
    Left = 16
    Top = 72
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 87
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome do com'#233'rcio'
    TabOrder = 1
  end
  object LblEdit_rua: TLabeledEdit
    Left = 16
    Top = 120
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Rua'
    TabOrder = 2
  end
  object LblEdit_cidade: TLabeledEdit
    Left = 16
    Top = 166
    Width = 320
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 5
  end
  object LblEdit_uf: TLabeledEdit
    Left = 351
    Top = 166
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 13
    EditLabel.Height = 13
    EditLabel.Caption = 'UF'
    TabOrder = 6
  end
  object DBLookupComboBox_categoria: TDBLookupComboBox
    Left = 16
    Top = 212
    Width = 320
    Height = 21
    DataField = 'categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqAntialiased
    KeyField = 'cod_cat'
    ListField = 'cod_cat; categoria'
    ListFieldIndex = 1
    ListSource = DataSource_categoria
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Touch.InteractiveGestures = [igZoom, igPan, igRotate, igTwoFingerTap, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
  end
  object LblEdit_numero: TLabeledEdit
    Left = 351
    Top = 120
    Width = 67
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero'
    NumbersOnly = True
    TabOrder = 4
  end
  object LblEdit_bairro: TLabeledEdit
    Left = 201
    Top = 120
    Width = 135
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro'
    TabOrder = 3
  end
  object Btn_salvar: TButton
    Left = 16
    Top = 255
    Width = 75
    Height = 33
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = Btn_salvarClick
  end
  object Btn_cancelar: TButton
    Left = 343
    Top = 255
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = Btn_cancelarClick
  end
  object ADOQuery_categoria: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 144
    Top = 24
  end
  object DataSource_categoria: TDataSource
    DataSet = ADOQuery_categoria
    Left = 192
    Top = 24
  end
  object ADOQuery_cad_loja: TADOQuery
    Connection = Frm_principal.ADOConnection1
    DataSource = DataSource_categoria
    Parameters = <>
    Left = 264
    Top = 24
  end
end
