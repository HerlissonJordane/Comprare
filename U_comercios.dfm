object Frm_comercios: TFrm_comercios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Com'#233'rcios cadastrados'
  ClientHeight = 376
  ClientWidth = 652
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
  object LblEdit_categoria: TLabeledEdit
    Left = 8
    Top = 24
    Width = 617
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'Buscar com'#233'rcio'
    TabOrder = 0
  end
  object Btn_cancelar: TButton
    Left = 326
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Btn_cancelarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 617
    Height = 226
    BorderStyle = bsNone
    DataSource = DataSource1
    FixedColor = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_sup'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Com'#233'rcio'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Caption = 'Bairro'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'categoria'
        Title.Caption = 'Categoria'
        Width = 127
        Visible = True
      end>
  end
  object Btn_inserir: TButton
    Left = 8
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Inserir'
    TabOrder = 3
    OnClick = Btn_inserirClick
  end
  object Btn_alterar: TButton
    Left = 114
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Btn_alterarClick
  end
  object Button1: TButton
    Left = 218
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Excluir'
    TabOrder = 5
  end
  object ADOQuery1: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 506
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 458
    Top = 328
  end
  object ADODataSet1: TADODataSet
    Connection = Frm_principal.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT cod_sup, nome, rua, '#13#10'             numero, bairro, cidade' +
      ','#13#10'             estado, categoria, cat.cod_cat'#13#10'FROM COMERCIO as' +
      ' com INNER JOIN cat_comercio as cat'#13#10'ON com.cod_cat = cat.cod_ca' +
      't'
    Parameters = <>
    Left = 418
    Top = 328
  end
end
