object Frm_cad_cat_prod: TFrm_cad_cat_prod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Categoria de produtos'
  ClientHeight = 393
  ClientWidth = 457
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
    Left = 16
    Top = 24
    Width = 401
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 82
    EditLabel.Height = 13
    EditLabel.Caption = 'Buscar Categoria'
    TabOrder = 0
    OnChange = LblEdit_categoriaChange
  end
  object Btn_cancelar: TButton
    Left = 342
    Top = 344
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Btn_cancelarClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 80
    Width = 401
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
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_cat_prod'
        Title.Caption = 'C'#243'digo'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_cat'
        Title.Caption = 'Categoria'
        Width = 302
        Visible = True
      end>
  end
  object Btn_inserir: TButton
    Left = 16
    Top = 344
    Width = 75
    Height = 33
    Caption = 'Inserir'
    TabOrder = 3
    OnClick = Btn_inserirClick
  end
  object Btn_alterar: TButton
    Left = 118
    Top = 344
    Width = 75
    Height = 33
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Btn_alterarClick
  end
  object Button1: TButton
    Left = 231
    Top = 344
    Width = 75
    Height = 33
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button1Click
  end
  object ADOQuery1: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 432
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 432
    Top = 192
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = Frm_principal.ADOConnection1
    CursorType = ctStatic
    CommandText = 'SELECT * FROM CAT_PRODUTO'
    Parameters = <>
    Left = 432
    Top = 280
  end
end
