object Frm_cad_prod: TFrm_cad_prod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de produtos'
  ClientHeight = 293
  ClientWidth = 399
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
    Width = 108
    Height = 13
    Caption = 'Categoria de Produtos'
  end
  object Label2: TLabel
    Left = 221
    Top = 72
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
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 83
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome do produto'
    TabOrder = 1
  end
  object Btn_salvar: TButton
    Left = 8
    Top = 227
    Width = 75
    Height = 33
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = Btn_salvarClick
  end
  object Btn_cancelar: TButton
    Left = 230
    Top = 228
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = Btn_cancelarClick
  end
  object Btn_add_categoria: TButton
    Left = 308
    Top = 136
    Width = 35
    Height = 33
    Hint = 'Inserir categoria'
    ImageAlignment = iaCenter
    ImageIndex = 0
    Images = ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Btn_add_categoriaClick
  end
  object JvDBLookupCombo_categoria: TJvDBLookupCombo
    Left = 16
    Top = 141
    Width = 289
    Height = 21
    LookupField = 'cod_cat_prod'
    LookupDisplay = 'nome_cat'
    LookupSource = DataSource_categoria
    TabOrder = 3
  end
  object JvDBLookupCombo_unidade: TJvDBLookupCombo
    Left = 221
    Top = 88
    Width = 84
    Height = 21
    LookupField = 'cod_und'
    LookupDisplay = 'descricao'
    LookupSource = DataSource_unidade
    TabOrder = 2
  end
  object ADOQuery_unidade: TADOQuery
    Connection = Frm_principal.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT cod_und, descricao FROM unidades ORDER BY DESCRICAO')
    Left = 248
    Top = 176
  end
  object DataSource_unidade: TDataSource
    DataSet = ADOQuery_unidade
    Left = 288
    Top = 176
  end
  object ADOQuery_aux: TADOQuery
    Connection = Frm_principal.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 176
  end
  object ADOQuery_categoria: TADOQuery
    Active = True
    Connection = Frm_principal.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CAT_PRODUTO ORDER BY NOME_CAT')
    Left = 112
    Top = 216
  end
  object DataSource_categoria: TDataSource
    DataSet = ADOQuery_categoria
    Left = 168
    Top = 216
  end
  object ImageList1: TImageList
    BlendColor = clAqua
    BkColor = clRed
    AllocBy = 30
    DrawingStyle = dsFocus
    GrayscaleFactor = 30
    Height = 23
    Masked = False
    Width = 23
    Left = 128
    Top = 176
    Bitmap = {
      494C0101010008001E0017001700FF000000FF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C0000001700000001002000000000001021
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FE030101FF207B25FF2EA22BFF2E9D
      23FF30991AFF329615FF266B0AFF010004FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003A3A3A9B041508FF25B1
      46FF26AA3FFF28A636FF2BA130FF2B9D28FF309A22FF30951BFF329315FF338C
      0DFF358C06FF060F02FF3C3C3C89000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000030303FE1FC35EFF20B652FF22B24BFF2CAA29FF39A60AFF38A509FF38A5
      09FF38A509FF38A509FF38A509FF339A0FFF328E0DFF348A08FF388A01FF0303
      03FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000040202FF1BC265FF1BBF60FF1FBA59FF34A9
      16FF33A815FF33A815FF36AA15FF338209FF338209FF33A815FF31A915FF36A9
      16FF33A815FF328D0EFF358905FF388401FF030303FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020D617CE
      76FF19C76FFF19C36AFF30AD22FF30AD22FF30AD22FF30AD22FF347B14FF0000
      000000000000347B14FF2EAD22FF30AD22FF30AD22FF30AD22FF328B0CFF3689
      09FF398801FF252525CF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F0F0F11075635FF14CE7AFF16CC78FF2BB430FF2AB230FF2BB3
      33FF2CB230FF2CB230FF000000000000000000000000000000002AB230FF2BB5
      32FF2AB230FF2AB230FF2CB230FF338B0FFF348A08FF143600FF0C0C0C0D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF10D88BFF14D3
      82FF28B437FF28B73CFF28B73CFF28B73CFF28B73CFF28B73CFF000000000000
      0000000000000000000028B73CFF28B73CFF28B73CFF28B73CFF28B73CFF28BA
      3EFF328F0FFF368908FF020000FE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000005150EFF0FDC91FF11D98BFF24BB47FF26BA48FF26BA48FF26BA
      48FF26BA48FF26BB47FF0000000000000000000000000000000024BB47FF26BA
      48FF26BA48FF26BB47FF26BB47FF25BA46FF309113FF328D10FF060E03FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003434344E0AE19CFF0CE09AFF1CC7
      64FF1FC054FF20BE54FF44915FC63C4C42563C4C425639473E51000000000000
      0000000000000000000036443C4E3B4B41553C4C4256459362CA21BF54FF21BF
      54FF25B545FF319214FF318C0DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000232323DD0AF0ABFF0DE49FFF1DC35EFF1EC25DFF1DBC5CFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001DBC5CFF1FC45BFF1FC05CFF30951BFF319514FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101FF08F2B0FF0BE8A8FF1CC7
      65FF1CC666FF4CA573C300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004AA372C11CC7
      65FF1DC565FF2D9921FF2F971AFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101FF06F7BAFF09EEAFFF12D585FF18CB70FF1ACA71FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001ACA71FF1ACA70FF20BB5AFF2C9E29FF2E9E22FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000202020FF0EDE96FF06F1B5FF08ED
      AEFF16CC77FF16CC77FF16CC77FF16CC78FF16CC78FF16CC78FF000000000000
      0000000000000000000016CB76FF16CC78FF16CC77FF16CC77FF16CC77FF17CD
      78FF28A636FF27A12FFF2C9A24FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000363636542F6C04FF05F5BAFF05F0B2FF15CC7CFF13CE7EFF13CE7EFF13CE
      7EFF13CE7EFF13CE7EFF0000000000000000000000000000000013CE7EFF13CE
      7EFF13CE7EFF13CE7EFF13CE7EFF12D081FF27AB40FF27A535FF2E6D07FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060C01FF00FFC7FF05F5
      BAFF05F0B4FF12D285FF11D085FF10CF84FF11D085FF11D085FF000000000000
      0000000000000000000011D085FF11D085FF11D085FF11D085FF13D085FF22B2
      4BFF24AF47FF22AB3FFF060B02FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF326B02FF02F9C1FF03F5BAFF07F3B7FF10D38AFF10D3
      8BFF10D38BFF10D38BFF080808080000000000000000050505050FD289FF10D3
      8BFF10D38AFF10D38AFF1EB958FF20B652FF22B24CFF2E720DFF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050506132E06FF00FF
      D0FF02F9C1FF03F5BAFF08ECAFFF0FD58EFF0FD490FF0FD58EFF12D58FFF2529
      272A1D21202212D58FFF0FD58EFF0FD490FF0FD58EFF18C46CFF1CBE5FFF21B9
      59FF20B956FF132F04FF0C0C0C0D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000222222D12B7E18FF03F5BEFF02F8C2FF03F5BAFF07EF
      B4FF08EDAEFF0DD692FF0ED492FF0DD790FF0DD692FF0CD792FF0FD692FF15CF
      7BFF17CC77FF19C96FFF1AC367FF1CBE5FFF2A821EFF212121D9000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      02FF288627FF14C177FF02F9C1FF06F6BBFF05F0B4FF05EDABFF0BE9A7FF0BE5
      9FFF0DE097FF10DC91FF13D98BFF14D382FF15CF7BFF16CB76FF1EAE55FF2588
      2CFF050303FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404FF25993AFF1EA049FF01FC
      C5FF04F3BAFF07F0B2FF08ECABFF0BE9A7FF0FE59CFF0BE097FF10DC91FF14D6
      89FF12D684FF1EA451FF249C3DFF030402FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B3B3B8F021207FF19B463FF15BE75FF0ED08AFF0AE5A5FF05EF
      B5FF06EFB1FF0AE4A4FF0CD290FF12C07AFF17B666FF031308FF3A3A3A930000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FE050001FF0C9F6BFF09E9A8FF04F9BFFF00FCC1FF07EBAAFF0BA471FF0200
      00FF020000FE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0A0A0B454545C00103
      03FF010303FF3D3D3DAA12121215000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000005C0000001700000001000100
      00000000140100000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000}
  end
end
